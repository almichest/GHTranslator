//
//  RootNode.swift
//  GlyphHackPractice
//
//  Created by Hiraku Ohno on 2015/02/01.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import SpriteKit

class RootNode: SKSpriteNode{
    
    private var vertexes:[GlyphHackVertex]
    
    override init(texture: SKTexture!, color: UIColor!, size: CGSize) {
        self.vertexes = [GlyphHackVertex](count: 11, repeatedValue: GlyphHackVertex(index: 0))
        super.init(texture: texture, color: color, size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        var vertexCoordinates:[CGPoint] = [CGPoint](count: 11, repeatedValue: CGPointZero)
        
        for i in 0 ..< radiuses.count {
            vertexCoordinates[i] = (CGPointMake(radiuses[i] * cos(radians[i]), radiuses[i] * sin(radians[i])))
        }
        
        for i in 0 ..< vertexes.count {
            let sprite = GlyphHackVertex(index: i)
            sprite.position = vertexCoordinates[i]
            sprite.setScale(0.5)
            self.addChild(sprite)
            self.vertexes[i] = sprite
        }
    }
    
    let diffOfParticles:CGFloat = 4
    func showPath(from:Int, to:Int) {
        
        let start = self.vertexes[from].position
        let goal = self.vertexes[to].position
        
        let length = NodeUtility.calculateDistance(start, point2: goal)
        let arg = atan((goal.y - start.y) / (goal.x - start.x))
        
        var currentPosition:CGFloat = 0.0
        var currentIndex:Int = 0
        
        while currentPosition < length {
            let target = CGPointMake(start.x - currentPosition * cos(arg) * CGFloat(currentIndex), start.y - currentPosition * sin(arg) * CGFloat(currentIndex))
            self.showParticle(target)
            
            currentPosition += diffOfParticles
            currentIndex += 1
        }
    }
    
    private func showParticle(point: CGPoint) {
        let particleGlyphPath = NSBundle.mainBundle().pathForResource("TracingParticle", ofType: "sks")
        let particle = NSKeyedUnarchiver.unarchiveObjectWithFile(particleGlyphPath!) as! SKEmitterNode
        particle.position = point
        self.addChild(particle)
        particle.runAction(SKAction.fadeAlphaTo(0.0, duration: 1.0), completion:{() in
            particle.removeFromParent()
        })
    }
}

