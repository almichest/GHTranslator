//
//  GameScene.swift
//  GlyphHackPractice
//
//  Created by Hiraku Ohno on 2015/01/31.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let vertexCount = 11
    
    override func didMoveToView(view: SKView) {
        let vertex0 = GlyphHackVertex(index: 0)
        vertex0.position = CGPointMake(50, 50)
        self.addChild(vertex0)
    }
    
    override func update(currentTime: CFTimeInterval) {
    }
}
