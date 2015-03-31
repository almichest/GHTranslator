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
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
