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
        
        self.name = "RootNode"
        
        let baseRadius = self.size.width / 2.0
        let radiuses = [baseRadius,
                        baseRadius,
                        baseRadius,
                        baseRadius / 2.0,
                        baseRadius / 2.0,
                        0,
                        baseRadius / 2.0,
                        baseRadius / 2.0,
                        baseRadius,
                        baseRadius,
                        baseRadius]
        
        let radians:[CGFloat] = [CGFloat(M_PI) * (1.0 / 2.0),
                                 CGFloat(M_PI) * (5.0 / 6.0),
                                 CGFloat(M_PI) * (1.0 / 6.0),
                                 CGFloat(M_PI) * (5.0 / 6.0),
                                 CGFloat(M_PI) * (1.0 / 6.0),
                                 0,
                                 CGFloat(M_PI) * (7.0 / 6.0),
                                 CGFloat(M_PI) * (11.0 / 6.0),
                                 CGFloat(M_PI) * (7.0 / 6.0),
                                 CGFloat(M_PI) * (11.0 / 6.0),
                                 CGFloat(M_PI) * (3.0 / 2.0)]
        
        var vertexes:[CGPoint] = []
        
        for i in 0 ..< radiuses.count {
            vertexes.append(CGPointMake(radiuses[i] * cos(radians[i]), radiuses[i] * sin(radians[i])))
        }
        
        for i in 0 ..< vertexes.count {
            let sprite = GlyphHackVertex(index: i)
            sprite.position = vertexes[i]
            sprite.setScale(0.5)
            self.addChild(sprite)
        }
    }
}
