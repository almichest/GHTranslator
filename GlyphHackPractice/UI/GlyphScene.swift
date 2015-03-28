//
//  GameScene.swift
//  GlyphHackPractice
//
//  Created by Hiraku Ohno on 2015/01/31.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import SpriteKit

class GlyphScene: SKScene{
    
    private var rootNode: RootNode?
    private var currentGlyphPath:Set<Glyph.GlyphPath>
    private var lastTouchedIndex:Int
    private var tracingParticles:[SKEmitterNode]
    private var startButtonNode:SKLabelNode?
    
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
        let rootNode = RootNode(color: SKColor.blackColor(), size: CGSizeMake(self.size.width, self.size.height))
        self.addChild(rootNode)
        rootNode.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        self.rootNode = rootNode
        rootNode.prepare()
        self.prepareStartButtn()
    }
    
    private func prepareStartButtn() {
        self.startButtonNode = SKLabelNode(text: "Start")
        self.startButtonNode!.position = CGPointMake(self.size.width / 2, self.size.height - 50)
        self.startButtonNode!.userInteractionEnabled = false
        self.addChild(self.startButtonNode!)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.currentGlyphPath.removeAll(keepCapacity: true)
        self.handleTouches(touches, type:TouchType.Began)
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.handleTouches(touches, type:TouchType.Moved)
    }
    
    private enum TouchType:Int {
        case Began
        case Moved
        case Ended
    }
    
    private func handleTouches(touches: Set<NSObject>, type:TouchType) {
        let touch: UITouch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        if node == self.startButtonNode && type == TouchType.Began {
            self.handleTappingStartButton()
        } else {
            self.handleNodeTouch(node, type:type)
        }
    }
    
    private func clearTracingParticles() {
        for particle in self.tracingParticles {
            particle.removeFromParent()
        }
        self.tracingParticles.removeAll(keepCapacity: true)
    }
    
    private func handleNodeTouch(node: SKNode?, type:TouchType) {
        
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
    
    private func handleTappingStartButton() {
//        let sequence = GlyphSequenceProvider.provideGlyphSequence(GlyphSequenceCount.Five)
        let sequence = GlyphSequenceProvider.provideAllSingleSequence()
        for singleSequence in sequence {
            for single in singleSequence {
                self.enqueueGlyphSequence(single)
            }
        }
//        self.enqueueGlyphSequence(sequence)
    }
    
    //MARK: - Showing supplied path
    var glyphQueue:[Glyph] = Array<Glyph>()
    private func enqueueGlyphSequence(glyphTypes: [GlyphType]) {
        for type in glyphTypes {
            let glyph = GlyphGenerator.createGlyphWithType(type)
            self.glyphQueue.append(glyph)
        }
        
        self.showNextGlyph()
    }
    
    private func showNextGlyph() {
        Log.d("")
        if self.glyphQueue.count != 0 {
            let target = self.glyphQueue[0]
            Log.d("target = \(target)")
            self.showGlyph(target)
            self.glyphQueue.removeAtIndex(0)
        }
    }
    
    private func showGlyph(glyph:Glyph) {
        for path in glyph.paths! {
            self.showPath(path.point1, to: path.point2)
        }
    }
    
    internal func showPath(from:Int, to:Int) {
        self.rootNode?.showPath(from, to:to, completion:{
            self.showNextGlyph()
        })
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
        
    }
}
