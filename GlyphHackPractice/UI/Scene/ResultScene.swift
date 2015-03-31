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
    
    let answerGlyphs:[Glyph]
    let inputGlyphs:[Glyph]
    
    init(size:CGSize, answerGlyphs:[Glyph], inputGlyphs:[Glyph]) {
        self.answerGlyphs = answerGlyphs
        self.inputGlyphs = inputGlyphs
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = SKColor.blackColor()
        self.prepareResultNodes()
    }
    
    private func prepareResultNodes() {
        self.prepareAnswerNodes()
        self.prepareUserInputResultNodes()
    }
    
    private func prepareAnswerNodes() {
        
        for i in 0 ..< self.answerGlyphs.count {
            let glyph = self.answerGlyphs[i]
        }
    }
    
    private func prepareUserInputResultNodes() {
        let rootNode = RootNode(color: SKColor.blackColor(), size: CGSizeMake(self.size.width, self.size.height))
        rootNode.position = CGPointMake(self.size.width / 2.0, self.size.height / 2.0)
        rootNode.setScale(0.4)
        self.addChild(rootNode)
        rootNode.prepare()
        for path in self.answerGlyphs[0].paths! {
            rootNode.showPath(path.point1, to: path.point2, autoRemove: false, completion: nil)
        }
    }
    
    private func showGlyph(glyph:Glyph, position:CGPoint) {
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
