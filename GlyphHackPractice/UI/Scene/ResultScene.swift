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
    
    let level:GlyphSequenceCount
    let correctGlyphs:[Glyph]
    let inputGlyphs:[Glyph]
    
    init(size:CGSize, level:GlyphSequenceCount, correctGlyphs:[Glyph], inputGlyphs:[Glyph]) {
        self.level = level
        self.correctGlyphs = correctGlyphs
        self.inputGlyphs = inputGlyphs
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
