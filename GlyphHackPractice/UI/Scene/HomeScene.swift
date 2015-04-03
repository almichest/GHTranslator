//
//  HomeScene.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/03/29.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit
import SpriteKit

class HomeScene: SKScene {
    
    private var startNode:SelectableLabelNode?
    private var selectLevelNode:SelectableLabelNode?
    private var scoreNode:SelectableLabelNode?
    
    weak var homeSceneDelegate:HomeSceneDelegate?
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = SKColor.blackColor()
        self.prepareStartNode()
        self.prepareSelectLevelNode()
        self.prepareResultNode()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateLevel:", name: GlyphConfiguration.GlyphConfigurationChangeCurrentLevelNotification, object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    @objc
    private func updateLevel(notification:NSNotification?) {
        self.updateStartNode()
    }
    
    private func prepareStartNode() {
        self.startNode = SelectableLabelNode()
        self.startNode!.fontSize = 25.0
        self.startNode!.position = CGPointMake(25, self.size.height / 2.0 + 100)
        self.startNode!.userInteractionEnabled = false
        self.startNode!.horizontalAlignmentMode = .Left
        self.addChild(self.startNode!)
        
        self.updateStartNode()
    }
    
    private func updateStartNode() {
        self.startNode?.text = "Start (Level: \(GlyphConfiguration.currentLevel.rawValue))"
    }
    
    private func prepareSelectLevelNode() {
        self.selectLevelNode = SelectableLabelNode(text: "Select Level")
        self.selectLevelNode!.fontSize = 25.0
        self.selectLevelNode!.position = CGPointMake(25, self.size.height / 2.0)
        self.selectLevelNode!.userInteractionEnabled = false
        self.selectLevelNode!.horizontalAlignmentMode = .Left
        self.addChild(self.selectLevelNode!)
    }
    
    
    private func prepareResultNode() {
        self.scoreNode = SelectableLabelNode(text: "Show Score")
        self.scoreNode!.fontSize = 25.0
        self.scoreNode!.position = CGPointMake(25, self.size.height / 2.0 - 100)
        self.scoreNode!.userInteractionEnabled = false
        self.scoreNode!.horizontalAlignmentMode = .Left
        self.addChild(self.scoreNode!)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch: UITouch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if node == self {
            return
        }
        
        if node == self.startNode {
            self.startNode?.isSelected = true
        } else if node == self.selectLevelNode {
            self.selectLevelNode?.isSelected = true
        } else if node == self.scoreNode {
            self.scoreNode?.isSelected = true
        }
        
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch: UITouch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if node == self.startNode {
            self.homeSceneDelegate?.didTapStartNodeInScene(self)
            self.startNode?.isSelected = false
        } else if node == self.selectLevelNode {
            self.homeSceneDelegate?.didTapSelectLevelNodeInScene(self)
            self.selectLevelNode?.isSelected = false
        } else if node == self.scoreNode {
            self.homeSceneDelegate?.didTapScoreNodeInScene(self)
            self.scoreNode?.isSelected = false
        } else if node == self {
            self.startNode?.isSelected = false
            self.selectLevelNode?.isSelected = false
            self.scoreNode?.isSelected = false
        }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch: UITouch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if node == self.startNode {
            self.startNode?.isSelected = true
        } else if node == self.selectLevelNode {
            self.selectLevelNode?.isSelected = true
        } else if node == self.scoreNode {
            self.scoreNode?.isSelected = true
        } else if node == self {
            self.startNode?.isSelected = false
            self.selectLevelNode?.isSelected = false
            self.scoreNode?.isSelected = false
        }
        
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        self.startNode?.isSelected = false
        self.selectLevelNode?.isSelected = false
        self.scoreNode?.isSelected = false
    }
}

protocol HomeSceneDelegate:class {
    func didTapStartNodeInScene(scene:HomeScene)
    func didTapSelectLevelNodeInScene(scene:HomeScene)
    func didTapScoreNodeInScene(scene:HomeScene)
}
