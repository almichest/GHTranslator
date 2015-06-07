//
//  SettingViewController.swift
//  GlyphHackPractice
//
//  Created by Hiraku Ohno on 2015/06/06.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate {
    
    private static let cellReuseIdentifier = "setting-tableview-cell"
    
    private enum SettingsType: Int {
        case ShowGlyphName  = 0
        case Level          = 1
    }
    
    private var currentLevelLabel:UILabel?
    
    static func viewController() -> SettingViewController {
    
        let storyBoard = UIStoryboard(name: "SettingViewController", bundle: nil)
        return storyBoard.instantiateViewControllerWithIdentifier("setting-view-controller") as! SettingViewController
    }
    
    override func viewDidLoad() {
        self.tableView.registerNib(UINib(nibName: "SettingTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: SettingViewController.cellReuseIdentifier)
        self.saveInitialState()
    }
    
    private var initialStateForShowingGlyphName: Bool?
    private var initialStateForGlyphLevel : GlyphSequenceCount?
    private func saveInitialState() {
        initialStateForShowingGlyphName = GlyphConfiguration.showGlyphName
        initialStateForGlyphLevel = GlyphConfiguration.currentLevel
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func didPushCancelButton(sender: AnyObject) {
        self.loadInitialState()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func loadInitialState() {
        GlyphConfiguration.showGlyphName = initialStateForShowingGlyphName!
        GlyphConfiguration.currentLevel = initialStateForGlyphLevel!
    }
    
    @IBAction func didPushDoneButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK : UITableViewDataSource
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier(SettingViewController.cellReuseIdentifier) as! SettingTableViewCell
        
        self.prepareSettingCell(cell, indexPath: indexPath)
        return cell
    }
    
    private func prepareSettingCell(cell: SettingTableViewCell, indexPath: NSIndexPath) {
        for view in cell.customItemView.subviews {
            view.removeFromSuperview()
        }
        
        switch indexPath.row {
        case SettingsType.ShowGlyphName.rawValue :
            cell.messageLabel.text = "Show Glyph name while showing questions"
            let toggleSwitch = UISwitch(frame: CGRectMake(10, 10, 0, 0))
            toggleSwitch.transform = CGAffineTransformMakeScale(0.75, 0.75)
            toggleSwitch.addTarget(self, action: "didChangeSwitchState:", forControlEvents: .ValueChanged)
            toggleSwitch.on = GlyphConfiguration.showGlyphName
            cell.customItemView.addSubview(toggleSwitch)
        case SettingsType.Level.rawValue :
            cell.messageLabel.text = "Set Level"
            let innerView = LevelSelectView.view()
            innerView.sizeToFit()
            cell.customItemView.addSubview(innerView)
            let centerYConstraint = NSLayoutConstraint(item: innerView, attribute: .CenterY, relatedBy: .Equal, toItem: cell.customItemView, attribute: .CenterY, multiplier: 1.0, constant: 0)
            NSLayoutConstraint.activateConstraints([centerYConstraint])
            let tapRecognizer = UITapGestureRecognizer(target: self, action: "didTapGlyphLevelConfigurationView:")
            innerView.addGestureRecognizer(tapRecognizer)
            self.currentLevelLabel = innerView.currentLevelLabel
            innerView.currentLevelLabel.text = "\(GlyphConfiguration.currentLevel.rawValue)"
        default :
            assert(false, "Must not reach here")
        }
    }
    
    // MARK : Actions
    @objc private func didChangeSwitchState(sender: AnyObject) {
        let toggleSwitch = sender as! UISwitch
        GlyphConfiguration.showGlyphName = toggleSwitch.on
    }
    
    @objc private func didTapGlyphLevelConfigurationView(sender: AnyObject) {
        self.showLevelSelectActionSheet()
    }
    
    //MARK: - Select Level
    private func showLevelSelectActionSheet() {
        let actionSheet = UIActionSheet()
        actionSheet.delegate = self
        actionSheet.title = "Select Level"
        actionSheet.addButtonWithTitle("1")
        actionSheet.addButtonWithTitle("2")
        actionSheet.addButtonWithTitle("3")
        actionSheet.addButtonWithTitle("4")
        actionSheet.addButtonWithTitle("5")
        actionSheet.addButtonWithTitle("Cancel")
        actionSheet.cancelButtonIndex = 5
        actionSheet.showInView(self.view)
    }
    
    //MARK: - UIActionSheetDelegate
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex >= GlyphSequenceCount.Five.rawValue {
            return
        }
        
        GlyphConfiguration.currentLevel = GlyphSequenceCount(rawValue: buttonIndex + 1)!
        
        self.currentLevelLabel?.text = "\(buttonIndex + 1)"
    }
}
