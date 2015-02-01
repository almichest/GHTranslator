//
//  GlyphHackVertex.swift
//  GlyphHackPractice
//
//  Created by Hiraku Ohno on 2015/01/31.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import SpriteKit
import QuartzCore

class GlyphHackVertex: SKSpriteNode {
    
    let index: Int
    let shape = CGRectMake(10, 10, 50, 50)
    
    init(index: Int) {
        self.index = index
        super.init(color: UIColor.redColor(), size: CGSizeMake(50, 50))
        
        self.size = CGSizeMake(50, 50)
        let tile = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(50, 50))
        
        let crop = SKCropNode()
        let mask = SKShapeNode()
        mask.path = CGPathCreateWithRoundedRect(shape, 4, 4, nil)
        mask.fillColor = SKColor.redColor()
        crop.maskNode = mask
        crop.addChild(tile)
        
        self.addChild(crop)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
