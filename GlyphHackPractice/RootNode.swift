//
//  RootNode.swift
//  GlyphHackPractice
//
//  Created by Hiraku Ohno on 2015/02/01.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import SpriteKit

class RootNode: SKSpriteNode {
    
    func prepare() {
        let radius = (self.size.height / 2.0 - 20)
        println(self.size)
        let vertexes = [CGPointMake(0, radius),
                        CGPointMake(0, -1.0 * radius)]
//                        CGPointMake((self.size.width - 30), self.size.height / 6),
//                        CGPointMake(-1.0 * (self.size.width - 60), self.size.height / 12),
//                        CGPointMake((self.size.width - 60), self.size.height / 12)]
//                        CGPointMake(0, self.size.height / 3),
//                        CGPointMake(0, self.size.height / 3),
//                        CGPointMake(0, self.size.height / 3),
//                        CGPointMake(0, self.size.height / 3),
//                        CGPointMake(0, self.size.height / 3),
//                        CGPointMake(0, self.size.height / 3),
//                        CGPointMake(0, self.size.height / 3),
//                        CGPointMake(0, self.size.height / 3)]
        
        for i in 0 ..< vertexes.count {
            let sprite = GlyphHackVertex(index: i)
            sprite.position = vertexes[i]
            sprite.setScale(0.5)
            self.addChild(sprite)
        }
    }
}
