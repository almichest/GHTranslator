//
//  GameScene.swift
//  GlyphHackPractice
//
//  Created by Hiraku Ohno on 2015/01/31.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import SpriteKit

class GameScene: SKScene{
    
    private var rootNode: RootNode?
    private var currentGlyphPath: Set<Glyph.GlyphPath>
    private var lastTouchedIndex: Int
    private var tracingParticles: [SKEmitterNode]
    
    override init(size: CGSize) {
        self.currentGlyphPath = []
        self.lastTouchedIndex = -1
        self.tracingParticles = []
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        self.currentGlyphPath = []
        self.lastTouchedIndex = -1
        self.tracingParticles = []
        super.init(coder: aDecoder)
    }
    
    override func didMoveToView(view: SKView) {
        let rootNode = RootNode(color: SKColor.redColor(), size: CGSizeMake(self.size.width, self.size.height))
        self.addChild(rootNode)
        rootNode.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        self.rootNode = rootNode
        rootNode.prepare()
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.currentGlyphPath.removeAll(keepCapacity: true)
        self.handleTouches(touches)
        
        for i in 0 ..< Glyph.maxGlyphIndex {
            self.rootNode?.showPath(i, to: i + 1)
        }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.handleTouches(touches)
    }
    
    private func handleTouches(touches: Set<NSObject>) {
        let touch: UITouch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        self.handleNodeTouch(node)
    }
    
    private func clearTracingParticles() {
        for particle in self.tracingParticles {
            particle.removeFromParent()
        }
        self.tracingParticles.removeAll(keepCapacity: true)
    }
    
    private func handleNodeTouch(node: SKNode?) {
        if !(node is GlyphHackVertex) {
            return
        }
        
        let vertex = node as! GlyphHackVertex
        
        let index = vertex.index
        
        if(self.lastTouchedIndex < 0) {
            self.lastTouchedIndex = index
            return
        }
        
        if index != self.lastTouchedIndex {
            
            let point1 = index < self.lastTouchedIndex ? index : self.lastTouchedIndex
            let point2 = index > self.lastTouchedIndex ? index : self.lastTouchedIndex
            
            self.currentGlyphPath.insert(Glyph.GlyphPath(point1: point1, point2: point2))
            self.lastTouchedIndex = index
        }
        
        Log.d("touched : \(self.currentGlyphPath)")
    }
    
    private func createTracingParticle(point: CGPoint) {
        let particleGlyphPath = NSBundle.mainBundle().pathForResource("TracingParticle", ofType: "sks")
        let particle = NSKeyedUnarchiver.unarchiveObjectWithFile(particleGlyphPath!) as! SKEmitterNode
        particle.position = point
        self.tracingParticles.append(particle)
        self.addChild(particle)
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch: UITouch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        self.clearTracingParticles()
        self.lastTouchedIndex = -1
        
        let result = GlyphGenerator.createGlyphWithType(GlyphType.UserInteractionResult, path: self.currentGlyphPath)
        
        Log.d("Result       = \(result.paths)")
        Log.d("touched : \(self.currentGlyphPath)")
    }
    
    //MARK: - Showing supplied path
    internal func showPath(from:Int, to:Int) {
        
    }
}
