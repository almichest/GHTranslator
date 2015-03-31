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
        let glyphView = self.view as? GlyphView

        let scene = GlyphScene(size: self.view.frame.size)
        glyphView!.glyphViewDelegate = self
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        glyphView!.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        glyphView!.presentGlyphScene(scene)
        
//        self.canDisplayBannerAds = true
    }
    
    func didSelectSelectLevelItemInView(view: GlyphView) {
        self.showLevelSelectActionSheet()
    }
    
    func didSelectResultItemInView(view: GlyphView) {
        
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
    
    private func showHomeScene() {
        let glyphView = self.view as? GlyphView

        let scene = HomeScene(size: self.view.frame.size)
        glyphView!.glyphViewDelegate = self
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        glyphView!.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        glyphView!.presentHomeScene(scene)
//        self.canDisplayBannerAds = true
    }
    
    func didConfirmResultInView(view: GlyphView) {
        self.showGlyphScene()
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
}
