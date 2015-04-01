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
    private var currentGlyphPath:Set<GlyphPath>
    private var lastTouchedIndex:Int
    private var tracingParticles:[SKEmitterNode]
    private var startButtonNode:GeneralLabelNode?
    private var glyphNameNode:GeneralLabelNode?
    private var levelNode:GeneralLabelNode?
    private var homeNode:GeneralLabelNode?
    private var countDownNode:CountDownLabelNode?
    private var messageNode:GeneralLabelNode?
    
    private var isInInputMode:Bool = false
    
    private var currentQuestions = Array<GlyphType>(count:GlyphConfiguration.currentLevel.rawValue, repeatedValue:GlyphType.UserInteractionResult)
    private var userInputs = Array<Set<GlyphPath>?>(count:GlyphConfiguration.currentLevel.rawValue, repeatedValue:nil)
    
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
        self.startButtonNode = GeneralLabelNode(text: "Start")
        self.startButtonNode!.fontSize = 25.0
        self.startButtonNode?.fontColor = SKColor(red: 157.0 / 255.0, green: 204.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0)
        self.startButtonNode!.position = CGPointMake(self.size.width / 4.0, self.size.height - 80)
        self.startButtonNode!.userInteractionEnabled = false
        self.addChild(self.startButtonNode!)
    }
    
    private func prepareGlyphNameNode() {
        self.glyphNameNode = GeneralLabelNode(text: "")
        self.glyphNameNode!.position = CGPointMake(self.size.width / 2, 40)
        self.glyphNameNode!.fontSize = 20.0
        self.addChild(self.glyphNameNode!)
    }
    
    private func prepareLevelNode() {
        self.levelNode = GeneralLabelNode()
        self.levelNode!.text = "Level: \(GlyphConfiguration.currentLevel.rawValue)"
        self.levelNode!.fontSize = 20.0
        self.levelNode!.position = CGPointMake(self.size.width / 2.0, self.size.height - 40)
        self.levelNode!.userInteractionEnabled = false
        self.addChild(self.levelNode!)
    }
    
    private func prepareHomeNode() {
        self.homeNode = GeneralLabelNode(text: "Home")
        self.homeNode!.fontSize = 25.0
        self.homeNode?.fontColor = SKColor(red: 157.0 / 255.0, green: 204.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0)
        self.homeNode!.position = CGPointMake(self.size.width * 3.0 / 4.0, self.size.height - 80)
        self.homeNode!.userInteractionEnabled = false
        self.addChild(self.homeNode!)
    }
    
    private func prepareMessageNode() {
        self.messageNode = GeneralLabelNode()
        self.messageNode!.fontSize = 20.0
        self.messageNode!.fontColor = SKColor.whiteColor()
        self.messageNode!.position = CGPointMake(self.size.width / 2.0, self.startButtonNode!.position.y)
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
    
    private func clearTracingParticles(completion:(() -> Void)? = nil) {
        for particle in self.tracingParticles {
            self.removeParticle(particle, completion:completion)
        }
    }
    
    private func removeParticle(particle:SKEmitterNode, completion:(() -> Void)?) {
        particle.runAction(SKAction.fadeAlphaTo(0.0, duration: 0.05), completion:{
            particle.removeFromParent()
            self.tracingParticles.removeAtIndex(find(self.tracingParticles, particle)!)
            if self.tracingParticles.count == 0 {
                if completion != nil {
                    completion!()
                }
            }
        })
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
            
            self.currentGlyphPath.insert(GlyphPath(point1: point1, point2: point2))
            self.lastTouchedIndex = index
        }
        
        Log.d("touched : \(self.currentGlyphPath)")
    }
    
    private func handleTappingStartButton() {
        
        self.startButtonNode!.alpha = 0.0
        self.homeNode!.alpha = 0.0
        
        self.currentQuestions.removeAll(keepCapacity: true)
        self.userInputs.removeAll(keepCapacity: true)
        
        self.prepareCountDownNode()
        self.messageNode!.text = "Glyph(s) will be shown ..."
        self.countDownNode!.startCountDown { () -> Void in
            self.messageNode!.text = ""
            self.countDownNode?.removeFromParent()
            let sequence = GlyphSequenceProvider.provideGlyphSequence(GlyphConfiguration.currentLevel)
            self.currentQuestions = sequence
            self.enqueueGlyphSequence(sequence)
        }
    }
    
    private func prepareCountDownNode() {
        self.countDownNode = CountDownLabelNode(initialValue: 2, targetValue: 1)
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
        self.doActionAfterSeconds({ () -> Void in
            self.messageNode!.text = "Draw Glyph(s) as shown ..."
            self.prepareCountDownNode()
            self.countDownNode!.startCountDown({ () -> Void in
                self.countDownNode!.removeFromParent()
                self.messageNode!.text = ""
                self.startDrawingGlyph()
            })
        }, after: 0.5)
    }
    
    private func startDrawingGlyph() {
        self.isInInputMode = true
        self.messageNode!.text = "Let's draw !"
    }
    
    private func setGlyphName(type:GlyphType) {
        self.glyphNameNode?.text = type.rawValue
    }
    
    private func showGlyph(glyph:Glyph) {
        for path in glyph.paths! {
            self.showPath(path.point1, to: path.point2, type: GlyphShownType.Question)
        }
    }
    
    private enum GlyphShownType {
        case Question
        case UserInput
    }
    
    private func showPath(from:Int, to:Int, type:GlyphShownType) {
        self.rootNode?.showPath(from, to:to, completion:{
            self.showingGlyph = nil
            self.glyphNameNode?.text = ""
            
            switch type {
            case .Question :
                self.showNextGlyph()
            case .UserInput :
                self.notifyUserInterInputCompleteIfPossible()
            }
        })
    }
    
    private func notifyUserInterInputCompleteIfPossible() {
        
        if self.userInputs.count == self.currentQuestions.count && self.isInInputMode {
            self.isInInputMode = false
            doActionAfterSeconds({ () -> Void in
                self.glyphSceneDelegate?.didCompleteUserInputs(self.currentQuestions, userInputs: self.userInputs)
            }, after: 0.3)
        }
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
        
        self.doActionAfterSeconds({ () -> Void in
            self.clearTracingParticles(completion: {
                for path in self.currentGlyphPath {
                    self.showPath(path.point1, to: path.point2, type:GlyphShownType.UserInput)
                }
            })
        }, after: 0.0)
        
        self.userInputs.append(self.currentGlyphPath)
        self.lastTouchedIndex = -1
        
    }
    
    private func doActionAfterSeconds(action:() -> Void, after:NSTimeInterval) {
        let delay = after * Double(NSEC_PER_SEC)
        let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            action()
        })
    }
}

protocol GlyphSceneDelegate: class {
    func didSelectHomeNodeInScene(scene:GlyphScene)
    func didCompleteUserInputs(answer:[GlyphType], userInputs:[Set<GlyphPath>?])
}
