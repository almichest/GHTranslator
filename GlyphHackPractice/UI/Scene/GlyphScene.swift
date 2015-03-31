//
//  GameScene.swift
//  GlyphHackPractice
//
//  Created by Hiraku Ohno on 2015/01/31.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import SpriteKit

class GlyphScene: SKScene{
    
    weak var glyphSceneDelegate:GlyphSceneDelegate?
    
    private var rootNode: RootNode?
    private var currentGlyphPath:Set<Glyph.GlyphPath>
    private var lastTouchedIndex:Int
    private var tracingParticles:[SKEmitterNode]
    private var startButtonNode:SKLabelNode?
    private var glyphNameNode:SKLabelNode?
    private var levelNode:SKLabelNode?
    private var homeNode:SKLabelNode?
    private var countDownNode:CountDownLabelNode?
    private var messageNode:SKLabelNode?
    
    private var isInInputMode:Bool = false
    
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
        self.prepareStartButton()
        self.prepareGlyphNameNode()
        self.prepareLevelNode()
        self.prepareHomeNode()
        self.prepareMessageNode()
    }
    
    private func prepareStartButton() {
        self.startButtonNode = SKLabelNode(text: "Start")
        self.startButtonNode!.fontSize = 25.0
        self.startButtonNode?.fontColor = SKColor(red: 157.0 / 255.0, green: 204.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0)
        self.startButtonNode!.position = CGPointMake(self.size.width / 4.0, self.size.height - 80)
        self.startButtonNode!.userInteractionEnabled = false
        self.addChild(self.startButtonNode!)
    }
    
    private func prepareGlyphNameNode() {
        self.glyphNameNode = SKLabelNode(text: "")
        self.glyphNameNode!.position = CGPointMake(self.size.width / 2, 40)
        self.glyphNameNode!.fontSize = 20.0
        self.addChild(self.glyphNameNode!)
    }
    
    private func prepareLevelNode() {
        self.levelNode = SKLabelNode()
        self.levelNode!.text = "Level: \(GlyphConfiguration.currentLevel.rawValue)"
        self.levelNode!.fontSize = 20.0
        self.levelNode!.position = CGPointMake(self.size.width / 2.0, self.size.height - 40)
        self.levelNode!.userInteractionEnabled = false
        self.addChild(self.levelNode!)
    }
    
    private func prepareHomeNode() {
        self.homeNode = SKLabelNode(text: "Home")
        self.homeNode!.fontSize = 25.0
        self.homeNode?.fontColor = SKColor(red: 157.0 / 255.0, green: 204.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0)
        self.homeNode!.position = CGPointMake(self.size.width * 3.0 / 4.0, self.size.height - 80)
        self.homeNode!.userInteractionEnabled = false
        self.addChild(self.homeNode!)
    }
    
    private func prepareMessageNode() {
        self.messageNode = SKLabelNode()
        self.messageNode!.fontSize = 20.0
        self.messageNode!.fontColor = SKColor.whiteColor()
        self.messageNode!.position = CGPointMake(self.size.width / 2.0, self.rootNode!.position.y + self.rootNode!.size.height / 8 + 30)
        self.messageNode!.userInteractionEnabled = false
        self.addChild(self.messageNode!)
    }
    
    
    //MARK: - Touch
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
        
        if self.isInInputMode {
            self.createTracingParticle(location)
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
        self.prepareCountDownNode()
        self.messageNode!.text = "Glyph(s) will be shown ..."
        self.countDownNode!.startCountDown { () -> Void in
            self.messageNode!.text = ""
            self.countDownNode?.removeFromParent()
            let sequence = GlyphSequenceProvider.provideGlyphSequence(GlyphConfiguration.currentLevel)
            self.enqueueGlyphSequence(sequence)
        }
    }
    
    private func prepareCountDownNode() {
        self.countDownNode = CountDownLabelNode(initialValue: 3, targetValue: 1)
        self.countDownNode!.fontSize = 20.0
        self.countDownNode?.fontColor = SKColor.whiteColor()
        self.countDownNode!.position = CGPointMake(self.size.width / 2.0, self.rootNode!.position.y + self.rootNode!.size.height / 8)
        self.countDownNode!.userInteractionEnabled = false
        self.addChild(self.countDownNode!)
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
    
    private var showingGlyph:Glyph? = nil
    private func showNextGlyph() {
        Log.d("")
        if self.glyphQueue.count != 0  && self.showingGlyph == nil {
            let target = self.glyphQueue[0]
            self.showingGlyph = target
            Log.d("target = \(target)")
            self.setGlyphName(target.type)
            self.showGlyph(target)
            self.glyphQueue.removeAtIndex(0)
        }
        
        if self.glyphQueue.count == 0 && self.showingGlyph == nil {
            self.showDrawingGlyphMessage()
        }
    }
    
    private func showDrawingGlyphMessage() {
        let delay = 0.5 * Double(NSEC_PER_SEC)
        let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            self.messageNode!.text = "Draw Glyph(s) as shown ..."
            self.prepareCountDownNode()
            self.countDownNode!.startCountDown({ () -> Void in
                self.countDownNode!.removeFromParent()
                self.messageNode!.text = ""
                self.startDrawingGlyph()
            })
        })
    }
    
    private func startDrawingGlyph() {
        self.isInInputMode = true
    }
    
    private func setGlyphName(type:GlyphType) {
        self.glyphNameNode?.text = type.rawValue
    }
    
    private func showGlyph(glyph:Glyph) {
        for path in glyph.paths! {
            self.showPath(path.point1, to: path.point2)
        }
    }
    
    internal func showPath(from:Int, to:Int) {
        self.rootNode?.showPath(from, to:to, completion:{
            self.showingGlyph = nil
            self.glyphNameNode?.text = ""
            self.showNextGlyph()
        })
    }
    
    private func createTracingParticle(point: CGPoint) {
        let particleGlyphPath = NSBundle.mainBundle().pathForResource("DrawingParticle", ofType: "sks")
        let particle = NSKeyedUnarchiver.unarchiveObjectWithFile(particleGlyphPath!) as! SKEmitterNode
        particle.position = point
        self.tracingParticles.append(particle)
        self.addChild(particle)
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch: UITouch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if node == self.homeNode {
            self.glyphSceneDelegate?.didSelectHomeNodeInScene(self)
            return
        } else if node == self.startButtonNode {
            self.handleTappingStartButton()
            return
        }
        
        let delay = 0.2 * Double(NSEC_PER_SEC)
        let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            self.clearTracingParticles()
        })
        self.lastTouchedIndex = -1
    }
}

protocol GlyphSceneDelegate: class {
    func didSelectHomeNodeInScene(scene:GlyphScene)
}
