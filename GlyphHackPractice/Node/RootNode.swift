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
    private let syncQueue = dispatch_queue_create("hira.root.node", DISPATCH_QUEUE_SERIAL)
    
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
            self.addChild(sprite)
            self.vertexes[i] = sprite
        }
    }
    
    let spaceBetweenParticles:CGFloat = 15
    var waiting = false
    func showPath(from:Int, to:Int, autoRemove:Bool? = true, completion:(() -> Void)?) {
        
        Log.d("showPath \(from) - \(to)")
        
        let start = self.vertexes[from].position
        let goal = self.vertexes[to].position
        
        let distance = NodeUtility.calculateDistance(start, point2: goal)
        let difX:CGFloat = goal.x - start.x
        let difY:CGFloat = goal.y - start.y
        let arg = atan(difY / difX)
        
        var currentOffset:CGFloat = 0.0
        
        while currentOffset < distance {
            let target:CGPoint
            if difX < 0 {
                target = CGPointMake(start.x - currentOffset * cos(arg), start.y - currentOffset * sin(arg))
            } else {
                target = CGPointMake(start.x + currentOffset * cos(arg), start.y + currentOffset * sin(arg))
            }
            self.showParticle(target, autoRemove:autoRemove!, completion:completion)
            
            currentOffset += spaceBetweenParticles
        }
    }
    
    var mainParticle:SKEmitterNode? = nil
    private func showParticle(point: CGPoint, autoRemove:Bool, completion:(() -> Void)? = nil) {
        let particleGlyphPath = NSBundle.mainBundle().pathForResource("GlyphParticle", ofType: "sks")
        let particle = NSKeyedUnarchiver.unarchiveObjectWithFile(particleGlyphPath!) as! SKEmitterNode
        particle.position = point
        self.addChild(particle)
        if self.mainParticle == nil {
            self.mainParticle = particle
        }
        
        if(autoRemove) {
            particle.runAction(SKAction.fadeAlphaTo(0.0, duration: 1.0), completion:{() in
                particle.removeFromParent()
                if completion != nil && particle == self.mainParticle {
                    Log.d("Completion");
                    self.mainParticle = nil
                    completion!()
                }
            })
        }
    }
}

