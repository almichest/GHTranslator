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
    
    private var bottomLabelsOffset:CGFloat = 0
    
    private var okCount:Int = 0
    
    private var backButton:SelectableLabelNode?
    
    init(size:CGSize, answerGlyphs:[Glyph], inputGlyphs:[Glyph]) {
        self.answerGlyphs = answerGlyphs
        self.inputGlyphs = inputGlyphs
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = SKColor.blackColor()
        self.prepareResultNodes()
        self.prepareTextNodes()
        self.prepareCorrectAnswerCountNode()
        self.prepareBackButton()
    }
    
    private func prepareTextNodes() {
        let correctLabel = GeneralLabelNode(text: "Correct Answer")
        correctLabel.position = CGPointMake(self.size.width * 3.0 / 4.0, self.size.height - 50)
        correctLabel.fontColor = SKColor.whiteColor()
        correctLabel.fontSize = 18.0
        self.addChild(correctLabel)
        
        let yourLabel = GeneralLabelNode(text: "Your Answer")
        yourLabel.position = CGPointMake(self.size.width / 4.0, self.size.height - 50)
        yourLabel.fontColor = SKColor.whiteColor()
        yourLabel.fontSize = 18.0
        self.addChild(yourLabel)
    }
    
    private func prepareResultNodes() {
        
        for i in 0 ..< GlyphConfiguration.currentLevel.rawValue {
            let size = CGSizeMake(self.size.width, 0.8 * (self.size.height / 7.0))
            let answer = self.answerGlyphs[i]
            let input = self.inputGlyphs[i]
            let resultNode = ResultNode(texture: nil, color: UIColor.blackColor(), size:size, answerGlyph: answer, inputGlyph: input)
            let offsetY = (self.size.height / 7) * CGFloat(i) + 100
            resultNode.position = CGPointMake(0, self.size.height - offsetY)
            self.addChild(resultNode)
            
            if answer.isEqual(input) {
                self.okCount++
            }
            
            let line = SKShapeNode()
            let pathToDraw = CGPathCreateMutable()
            CGPathMoveToPoint(pathToDraw, nil, 30, self.size.height - offsetY - resultNode.size.height / 2 - 7)
            CGPathAddLineToPoint(pathToDraw, nil, self.size.width - 30, self.size.height - offsetY - resultNode.size.height / 2 - 7)
            line.path = pathToDraw
            line.strokeColor = UIColor.whiteColor()
            line.alpha = 0.5
            self.addChild(line)
            
            self.bottomLabelsOffset = offsetY + resultNode.size.height
        }
        
        if okCount == GlyphConfiguration.currentLevel.rawValue {
            let currentScore = GlyphScore.currentScore(GlyphConfiguration.currentLevel)
            GlyphScore.saveCurrentScore(currentScore + 1, level: GlyphConfiguration.currentLevel)
            
            let bestScore = GlyphScore.bestScore(GlyphConfiguration.currentLevel)
            if currentScore + 1 > bestScore {
                GlyphScore.saveBestScore(currentScore + 1, level: GlyphConfiguration.currentLevel)
            }
        } else {
            GlyphScore.saveCurrentScore(0, level: GlyphConfiguration.currentLevel)
        }
    }
    
    private func prepareBackButton() {
        let backLabel = SelectableLabelNode(text: "Try again")
        backLabel.position = CGPointMake(self.size.width / 2.0, self.size.height - self.bottomLabelsOffset - 30)
        backLabel.fontSize = 20
        self.addChild(backLabel)
        self.backButton = backLabel
    }
    
    private func prepareCorrectAnswerCountNode() {
        let okCountLabel = GeneralLabelNode(text: "Result : \(self.okCount) / \(GlyphConfiguration.currentLevel.rawValue)")
        okCountLabel.position = CGPointMake(self.size.width / 2.0, self.size.height - self.bottomLabelsOffset)
        okCountLabel.fontColor = SKColor.whiteColor()
        okCountLabel.fontSize = 18.0
        self.addChild(okCountLabel)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch: UITouch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if node == self.backButton {
            self.backButton?.isSelected = true
        }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch: UITouch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if node == self.backButton {
            self.backButton?.isSelected = true
        } else if node == self {
            self.backButton?.isSelected = false
        }
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch: UITouch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if node == self.backButton {
            self.resultSceneDelegate?.didTapOKButtonOfScene(self)
        } else if node == self {
            self.backButton?.isSelected = false
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol ResultSceneDelegate: class {
    func didTapOKButtonOfScene(scene:ResultScene)
}
