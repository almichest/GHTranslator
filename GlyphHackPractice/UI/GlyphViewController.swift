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

class GlyphViewController: UIViewController, UIActionSheetDelegate, ADBannerViewDelegate, GlyphViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.showHomeScene()
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
        return false
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    //MARK: - GlyphViewDelegate
    func didSelectStartItemInView(view: GlyphView) {
        self.showGlyphScene()
    }
    
    private func showGlyphScene() {
        
        self.adView = nil
        
        let glyphView = self.view as? GlyphView

        let scene = GlyphScene(size: self.view.frame.size)
        glyphView!.glyphViewDelegate = self
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        glyphView!.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        glyphView!.presentGlyphScene(scene)
    }
    
    func didSelectSelectLevelItemInView(view: GlyphView) {
        self.showLevelSelectActionSheet()
    }
    
    func didSelectScoreItemInView(view: GlyphView) {
        self.showScoreScene()
    }
    
    func didSelectHomeItemInView(view: GlyphView) {
        self.showHomeScene()
    }
    
    func didCompleteUserInput(answer: [GlyphType], userInputs: [Set<GlyphPath>?]) {
        self.showResultScene(answer, userInputs: userInputs)
    }
    
    private func showResultScene(answer: [GlyphType], userInputs: [Set<GlyphPath>?]) {
        var answerGlyphs = [Glyph]()
        for type in answer {
            answerGlyphs.append(GlyphGenerator.createGlyphWithType(type))
        }
        var userInputGlyphs = [Glyph]()
        for userInput in userInputs {
            userInputGlyphs.append(GlyphGenerator.createGlyphWithType(GlyphType.UserInteractionResult, path: userInput))
        }
        
        let glyphView = self.view as? GlyphView
        let scene = ResultScene(size: glyphView!.frame.size, answerGlyphs: answerGlyphs, inputGlyphs: userInputGlyphs)
        glyphView!.presentResultScene(scene)
    }
    
    func didDetectPreparingAd(view: GlyphView) {
        self.prepareAdView()
    }
    
    private var adView:ADBannerView? = nil
    private func prepareAdView() {
        self.adView = ADBannerView(adType: ADAdType.MediumRectangle)
        self.adView!.delegate = self
        let diffWidth = self.view.frame.size.width - self.adView!.frame.size.width
        let diffHeight = self.view.frame.size.height - self.adView!.frame.size.height
        self.adView!.frame = CGRectMake(-adView!.frame.size.width, diffHeight / 2.0, self.adView!.frame.size.width, self.adView!.frame.size.height)
    }
    
    private func showHomeScene() {
        let glyphView = self.view as? GlyphView

        let scene = HomeScene(size: self.view.frame.size)
        glyphView!.glyphViewDelegate = self
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        glyphView!.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        glyphView!.presentHomeScene(scene)
    }
    
    private func showScoreScene() {
        
        let glyphView = self.view as? GlyphView
        let scene = ScoreScene(size: self.view.frame.size)
        glyphView!.glyphViewDelegate = self
        glyphView!.ignoresSiblingOrder = true
        scene.scaleMode = .AspectFill
        glyphView?.presentScoreScene(scene)
    }
    
    func didConfirmResultInView(view: GlyphView) {
        if(self.adView != nil) {
            self.showAdView()
        } else {
            self.showGlyphScene()
        }
    }
    
    private var adBackgroundView:UIView?
    private func showAdView() {
        
        self.adBackgroundView = UIView(frame: CGRectMake(0, 0, self.view!.frame.size.width, self.view!.frame.size.height))
        self.adBackgroundView!.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.adBackgroundView!.addSubview(self.adView!)
        
        let dismissButton = self.createAdDismissButton()
        let positionY = self.view.frame.size.height / 2.0 - self.adView!.frame.size.height / 2.0 - 30
        dismissButton.frame = CGRectMake(self.view.frame.size.width - 50, positionY, 30, 30)
        self.adBackgroundView?.addSubview(dismissButton)
        
        self.view!.addSubview(self.adBackgroundView!)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            let diffWidth = self.view.frame.size.width - self.adView!.frame.size.width
            let diffHeight = self.view.frame.size.height - self.adView!.frame.size.height
            self.adView!.frame = CGRectMake(diffWidth / 2.0, diffHeight / 2.0, self.adView!.frame.size.width, self.adView!.frame.size.height)
        })
    }
    
    private func createAdDismissButton() -> UIImageView {
        let dismissButtonImage = UIImage(named: "DismissButton")
        let dismissButton = UIImageView(image: dismissButtonImage)
        let dismissRecognizer = UITapGestureRecognizer(target: self, action: "didTapDismissButton:")
        dismissButton.addGestureRecognizer(dismissRecognizer)
        dismissButton.userInteractionEnabled = true
        
        return dismissButton
    }
    
    @objc
    private func didTapDismissButton(sender:AnyObject?) {
        self.adBackgroundView?.removeFromSuperview()
        self.showGlyphScene()
    }
    
    func didSelectBackButton(view: GlyphView) {
        self.showHomeScene()
    }
    
    //MARK - Select Level
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
    }
    
    //MARK - ADBannerViewDelegate
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        return true
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        self.adView = nil
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
        self.adBackgroundView!.removeFromSuperview()
        self.showGlyphScene()
    }
}
