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
    
    private var startNode:SKLabelNode?
    private var selectLevelNode:SKLabelNode?
    private var resultNode:SKLabelNode?
    
    weak var homeSceneDelegate:HomeSceneDelegate?
    
    override func didMoveToView(view: SKView) {
        self.prepareStartNode()
        self.prepareSelectLevelNode()
        self.prepareResultNode()
    }
    
    private func prepareStartNode() {
        self.startNode = SKLabelNode(text: "Start")
        self.startNode!.fontSize = 25.0
        self.startNode!.fontColor = SKColor(red: 157.0 / 255.0, green: 204.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0)
        self.startNode!.position = CGPointMake(self.size.width / 2.0, self.size.height / 2.0 + 100)
        self.startNode!.userInteractionEnabled = false
        self.addChild(self.startNode!)
    }
    
    private func prepareSelectLevelNode() {
        self.selectLevelNode = SKLabelNode(text: "Select Level")
        self.selectLevelNode!.fontSize = 25.0
        self.selectLevelNode!.fontColor = SKColor(red: 157.0 / 255.0, green: 204.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0)
        self.selectLevelNode!.position = CGPointMake(self.size.width / 2.0, self.size.height / 2.0)
        self.selectLevelNode!.userInteractionEnabled = false
        self.addChild(self.selectLevelNode!)
    }
    
    
    private func prepareResultNode() {
        self.resultNode = SKLabelNode(text: "Show Result")
        self.resultNode!.fontSize = 25.0
        self.resultNode!.fontColor = SKColor(red: 157.0 / 255.0, green: 204.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0)
        self.resultNode!.position = CGPointMake(self.size.width / 2.0, self.size.height / 2.0 - 100)
        self.resultNode!.userInteractionEnabled = false
        self.addChild(self.resultNode!)
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch: UITouch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if node == self.startNode {
            self.homeSceneDelegate?.didTapStartNodeInScene(self)
        } else if node == self.selectLevelNode {
            self.homeSceneDelegate?.didTapSelectLevelNodeInScene(self)
        } else if node == self.resultNode {
            self.homeSceneDelegate?.didTapResultNodeInScene(self)
        }
    }
}

protocol HomeSceneDelegate:class {
    func didTapStartNodeInScene(scene:HomeScene)
    func didTapSelectLevelNodeInScene(scene:HomeScene)
    func didTapResultNodeInScene(scene:HomeScene)
}
