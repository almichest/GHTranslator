//
//  GameScene.swift
//  GlyphHackPractice
//
//  Created by Hiraku Ohno on 2015/01/31.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    private var rootNode:RootNode?
    
    override init(size: CGSize) {
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMoveToView(view: SKView) {
        let rootNode = RootNode(color: SKColor.redColor(), size: CGSizeMake(self.size.width, self.size.height))
        super.addChild(rootNode)
        rootNode.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        self.rootNode = rootNode
        rootNode.prepare()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        Log.d("Began - \(position)")
        
        let touch: UITouch = touches.anyObject() as UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        let particle = self.createTracingParticle(location)
        self.addChild(particle)
        
        Log.d("\(node)")
    }
    
    private func clearParticles() {
        for node in self.children {
            if (node as SKNode) != self.rootNode {
                node.removeFromParent()
            }
        }
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        Log.d("Moved - \(position)")
        let touch: UITouch = touches.anyObject() as UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        let particle = self.createTracingParticle(location)
        self.addChild(particle)
        Log.d("\(node)")
    }
    
    let particlePath = NSBundle.mainBundle().pathForResource("Tracing", ofType: "sks")
    private func createTracingParticle(point: CGPoint) -> SKEmitterNode {
        let particle = NSKeyedUnarchiver.unarchiveObjectWithFile(particlePath!) as SKEmitterNode
        particle.position = point
        return particle
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        Log.d("Ended - \(position)")
        let touch: UITouch = touches.anyObject() as UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            self.clearParticles()
        }
        
        Log.d("\(node)")
    }
}
