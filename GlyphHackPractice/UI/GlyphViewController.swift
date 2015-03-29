//
//  GameViewController.swift
//  GlyphHackPractice
//
//  Created by Hiraku Ohno on 2015/01/31.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit
import SpriteKit
import iAd

class GlyphViewController: UIViewController, UIActionSheetDelegate, GlyphViewDelegate {

    var glyphView:GlyphView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.glyphView = self.view as? GlyphView

        let scene = GlyphScene(size: self.view.frame.size)
        self.glyphView!.showsFPS = true
        self.glyphView!.showsNodeCount = true
        self.glyphView!.glyphDelegate = self
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        self.glyphView!.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        self.glyphView!.presentScene(scene)
        
//        self.canDisplayBannerAds = true
    }

    override func shouldAutorotate() -> Bool {
        return false
    }

    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    //MARK: - GlyphViewDelegate
    func didSelectLevelSelectButton(view: GlyphView) {
        self.showLevelSelectActionSheet()
    }
    
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
        if(buttonIndex >= GlyphSequenceCount.Five.rawValue) {
            return
        }
        
        GlyphConfiguration.currentLevel = GlyphSequenceCount(rawValue: buttonIndex + 1)!
        self.glyphView!.updateLevel(GlyphConfiguration.currentLevel)
    }
}
