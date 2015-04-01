//
//  ResultScene.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/03/30.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit
import SpriteKit

class ResultScene: SKScene {
    
    weak var resultSceneDelegate:ResultSceneDelegate?
    
    let answerGlyphs:[Glyph]
    let inputGlyphs:[Glyph]
    
    private var correctAnswerNodePositions:[CGPoint] = [CGPoint]()
    private var okCount:Int = 0
    
    private var backButton:SKLabelNode?
    
    init(size:CGSize, answerGlyphs:[Glyph], inputGlyphs:[Glyph]) {
        self.answerGlyphs = answerGlyphs
        self.inputGlyphs = inputGlyphs
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = SKColor.blackColor()
        self.prepareResultNodes()
        self.prepareTextNodes()
//        self.prepareOKorNG()
//        self.prepareBackButton()
    }
    
    private func prepareTextNodes() {
        let correctLabel = SKLabelNode(text: "Correct Answer")
        correctLabel.position = CGPointMake(self.size.width / 4.0, self.size.height - 50)
        correctLabel.fontColor = SKColor.whiteColor()
        correctLabel.fontSize = 18.0
        self.addChild(correctLabel)
        
        let yourLabel = SKLabelNode(text: "Your Answer")
        yourLabel.position = CGPointMake(self.size.width * 3.0 / 4.0, self.size.height - 50)
        yourLabel.fontColor = SKColor.whiteColor()
        yourLabel.fontSize = 18.0
        self.addChild(yourLabel)
    }
    
    private func prepareResultNodes() {
        
        for i in 0 ..< GlyphConfiguration.currentLevel.rawValue {
            let size = CGSizeMake(self.size.width, 0.8 * (self.size.height / 7.0))
            let resultNode = ResultNode(texture: nil, color: UIColor.blackColor(), size:size, answerGlyph: self.answerGlyphs[i], inputGlyph: self.inputGlyphs[i])
            let offsetY = (self.size.height / 6.0 + 10) * CGFloat(i) + 100
            resultNode.position = CGPointMake(0, self.size.height - offsetY)
            self.addChild(resultNode)
        }
    }
    
    private func prepareOKorNG() {
        for i in 0 ..< self.correctAnswerNodePositions.count {
            let position = self.correctAnswerNodePositions[i]
            let correct = self.answerGlyphs[i]
            let input = self.inputGlyphs[i]
            
            let resultText = correct.isEqual(input) ? "○" : "×"
            let resultLabel = SKLabelNode(text: resultText)
            resultLabel.position = CGPointMake(self.size.width / 2.0, position.y - 20)
            self.addChild(resultLabel)
        }
    }
    
    private func prepareBackButton() {
        let backLabel = SKLabelNode(text: "OK")
        let position = self.correctAnswerNodePositions[self.correctAnswerNodePositions.count - 1]
        backLabel.position = CGPointMake(self.size.width / 2.0, position.y - 80)
        backLabel.fontColor = SKColor.whiteColor()
        backLabel.fontSize = 18.0
        self.addChild(backLabel)
        self.backButton = backLabel
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch: UITouch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if node == self.backButton {
            self.resultSceneDelegate?.didTapOKButtonOfScene(self)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol ResultSceneDelegate: class {
    func didTapOKButtonOfScene(scene:ResultScene)
}
