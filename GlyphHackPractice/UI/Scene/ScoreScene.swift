//
//  ScoreScene.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/04/01.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit
import SpriteKit

class ScoreScene: SKScene {
    
    weak var scoreSceneDelegate:ScoreSceneDelegate?
    private var backButtonOffsetY:CGFloat = 0
    private var backButtonNode:SelectableLabelNode?
    private var gamecenterNode:SelectableLabelNode?
    
    override func didMoveToView(view: SKView) {
        self.prepareLabelNodes()
        self.prepareScoreNodes()
        self.prepareBackNode()
        self.prepareGameCenterNode()
        self.prepareHintNodes()
        self.backgroundColor = SKColor.blackColor()
    }
    
    private func prepareLabelNodes() {
        self.prepareCurrentScoreTitleNode()
        self.prepareBestScoreTitleNode()
    }
    
    private func prepareCurrentScoreTitleNode() {
        
        let currentTitleNode = GeneralLabelNode(text: "Current")
        currentTitleNode.fontColor = SKColor.whiteColor()
        currentTitleNode.position = CGPointMake(self.size.width / 2.0, self.size.height - 50)
        currentTitleNode.fontSize = 18
        self.addChild(currentTitleNode)
        
        let scoreTitleNode = GeneralLabelNode(text: "Score")
        scoreTitleNode.fontColor = SKColor.whiteColor()
        scoreTitleNode.position = CGPointMake(self.size.width / 2.0, self.size.height - 65)
        scoreTitleNode.fontSize = 18
        self.addChild(scoreTitleNode)
    }
    
    private func prepareBestScoreTitleNode() {
        let bestTitleNode = GeneralLabelNode(text: "Best")
        bestTitleNode.fontColor = SKColor.whiteColor()
        bestTitleNode.position = CGPointMake(self.size.width * 3.0 / 4.0, self.size.height - 50)
        bestTitleNode.fontSize = 18
        self.addChild(bestTitleNode)
        
        let scoreTitleNode = GeneralLabelNode(text: "Score")
        scoreTitleNode.fontColor = SKColor.whiteColor()
        scoreTitleNode.position = CGPointMake(self.size.width * 3.0 / 4.0, self.size.height - 65)
        scoreTitleNode.fontSize = 18
        self.addChild(scoreTitleNode)
    }
    
    private func prepareScoreNodes() {
        var offsetY:CGFloat = 110
        for i in 0 ..< GlyphSequenceCount.Five.rawValue {
            let bestScore = GlyphScore.bestScore(GlyphSequenceCount(rawValue: i + 1)!)
            let currentScore = GlyphScore.currentScore(GlyphSequenceCount(rawValue: i + 1)!)
            let levelNode = GeneralLabelNode(text: "Level \(i + 1)")
            levelNode.fontColor = SKColor.whiteColor()
            levelNode.position = CGPointMake(self.size.width / 6.0, self.size.height - offsetY)
            levelNode.fontSize = 18
            self.addChild(levelNode)
            
            let currentScoreNode = GeneralLabelNode(text: "\(currentScore)")
            currentScoreNode.fontColor = SKColor.whiteColor()
            currentScoreNode.position = CGPointMake(self.size.width / 2.0, self.size.height - offsetY)
            currentScoreNode.fontSize = 18
            self.addChild(currentScoreNode)
            
            let bestScoreNode = GeneralLabelNode(text: "\(bestScore)")
            bestScoreNode.fontColor = SKColor.whiteColor()
            bestScoreNode.position = CGPointMake(self.size.width * 3.0 / 4.0, self.size.height - offsetY)
            bestScoreNode.fontSize = 18
            self.addChild(bestScoreNode)
            
            offsetY += levelNode.frame.size.height * 2
        }
        
        self.backButtonOffsetY = offsetY
    }
    
    private func prepareGameCenterNode() {
        let gamecenterNode = SelectableLabelNode(text: "Open gamecenter")
        gamecenterNode.position = CGPointMake(self.size.width / 2.0, self.size.height - (self.backButtonOffsetY + 30))
        gamecenterNode.fontSize = 20
        self.gamecenterNode = gamecenterNode
        self.addChild(gamecenterNode)
    }
    
    private func prepareBackNode() {
        let backButtonNode = SelectableLabelNode(text: "Back")
        backButtonNode.position = CGPointMake(self.size.width / 2.0, self.size.height - (self.backButtonOffsetY + 80))
        backButtonNode.fontSize = 20
        self.backButtonNode = backButtonNode
        self.addChild(backButtonNode)
    }
    
    private func prepareHintNodes() {
        let hintNode1 = GeneralLabelNode(text: "Score is : ")
        hintNode1.fontColor = SKColor.lightGrayColor()
        hintNode1.position = CGPointMake(30, self.size.height - (self.backButtonOffsetY + 140))
        hintNode1.fontSize = 20
        hintNode1.horizontalAlignmentMode = .Left
        self.addChild(hintNode1)
        
        let hintNode2 = GeneralLabelNode(text: "Continous success count")
        hintNode2.fontColor = SKColor.lightGrayColor()
        hintNode2.position = CGPointMake(30, self.size.height - (self.backButtonOffsetY + 160))
        hintNode2.fontSize = 16
        hintNode2.horizontalAlignmentMode = .Left
        self.addChild(hintNode2)
        
        let hintNode3 = GeneralLabelNode(text: "without failure")
        hintNode3.fontColor = SKColor.lightGrayColor()
        hintNode3.position = CGPointMake(30, self.size.height - (self.backButtonOffsetY + 180))
        hintNode3.fontSize = 16
        hintNode3.horizontalAlignmentMode = .Left
        self.addChild(hintNode3)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch: UITouch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if node == self.backButtonNode {
            self.backButtonNode?.isSelected = true
        } else if node == self.gamecenterNode {
            self.gamecenterNode?.isSelected = true
        }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch: UITouch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if node == self.backButtonNode {
            self.backButtonNode?.isSelected = true
        } else if node == self.gamecenterNode {
            self.gamecenterNode?.isSelected = true
        } else if node == self {
            self.backButtonNode?.isSelected = false
            self.gamecenterNode?.isSelected = false
        }
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch: UITouch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if node == self.backButtonNode {
            self.scoreSceneDelegate?.didTapBackButton(self)
        } else if node == self.gamecenterNode {
            self.scoreSceneDelegate?.didTapGamecenterButton(self)
        } else if node == self {
            self.backButtonNode?.isSelected = false
            self.gamecenterNode?.isSelected = false
        }
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        self.backButtonNode?.isSelected = false
        self.gamecenterNode?.isSelected = false
    }
}

protocol ScoreSceneDelegate: class {
    func didTapBackButton(scece:ScoreScene)
    func didTapGamecenterButton(scene:ScoreScene)
}
