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
    private var startButtonNode:SelectableLabelNode?
    private var glyphNameNode:GeneralLabelNode?
    private var levelNode:GeneralLabelNode?
    private var homeNode:SelectableLabelNode?
    private var countDownNode:CountDownLabelNode?
    private var messageNode:GeneralLabelNode?
    
    private var numeratorNode:GeneralLabelNode?
    private var denominatorNode:GeneralLabelNode?
    private var dividerNode:GeneralLabelNode?
    
    private var isInInputMode:Bool = false
    
    private var currentQuestions = Array<String>(count:GlyphConfiguration.currentLevel.rawValue, repeatedValue:"")
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
        rootNode.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 - 20)
        self.rootNode = rootNode
        rootNode.prepare()
        self.prepareStartButton()
        self.prepareGlyphNameNode()
        self.prepareLevelNode()
        self.prepareHomeNode()
        self.prepareMessageNode()
        self.notifyAdPreparationIfNeeded()
        self.prepareGlyphOrderNodes()
    }
    
    static var adCount = 0
    private func notifyAdPreparationIfNeeded() {
        GlyphScene.adCount++
        
        if GlyphScene.adCount % 3 == 0 {
            self.glyphSceneDelegate?.didDetectPreparingAd(self)
        }
    }
    
    private func prepareStartButton() {
        self.startButtonNode = SelectableLabelNode(text: "Start")
        self.startButtonNode!.fontSize = 25.0
        self.startButtonNode!.position = CGPointMake(self.size.width / 4.0, self.rootNode!.size.height - 80)
        self.startButtonNode!.userInteractionEnabled = false
        self.addChild(self.startButtonNode!)
    }
    
    private func prepareGlyphNameNode() {
        self.glyphNameNode = GeneralLabelNode(text: "")
        self.glyphNameNode!.position = CGPointMake(self.size.width / 2, self.rootNode!.size.height / 3.0)
        self.glyphNameNode!.fontSize = 16.0
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
        self.homeNode = SelectableLabelNode(text: "Home")
        self.homeNode!.fontSize = 25.0
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
    
    private func prepareGlyphOrderNodes() {
        
        let verticalPosition = self.size.height - 120
        
        self.numeratorNode = GeneralLabelNode()
        self.numeratorNode?.fontSize = 20.0
        self.numeratorNode?.fontColor = SKColor.whiteColor()
        self.numeratorNode?.position = CGPointMake(self.size.width / 2.0 - 30, verticalPosition)
        self.numeratorNode?.text = "1"
        self.numeratorNode?.hidden = true
        self.addChild(self.numeratorNode!)
        
        self.denominatorNode = GeneralLabelNode()
        self.denominatorNode?.fontSize = 20.0
        self.denominatorNode?.fontColor = SKColor.whiteColor()
        self.denominatorNode?.position = CGPointMake(self.size.width / 2.0 + 30, verticalPosition)
        self.denominatorNode?.text = "1"
        self.denominatorNode?.hidden = true
        self.addChild(self.denominatorNode!)
        
        self.dividerNode = GeneralLabelNode()
        self.dividerNode?.fontSize = 20.0
        self.dividerNode?.fontColor = SKColor.whiteColor()
        self.dividerNode?.position = CGPointMake(self.size.width / 2.0, verticalPosition)
        self.dividerNode?.text = "/"
        self.dividerNode?.hidden = true
        self.addChild(self.dividerNode!)
    }
    
    //MARK: - Touch
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.currentGlyphPath.removeAll(keepCapacity: true)
        self.handleTouches(touches, type:TouchType.Began)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
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
            self.rootNode?.removeCurrentGlyph()
            self.createTracingParticle(location)
            self.handleNodeTouch(node, type:type)
        }
        
        if node == self.startButtonNode {
            self.startButtonNode?.isSelected = true
        } else if node == self.homeNode {
            self.homeNode?.isSelected = true
        } else if node == self.rootNode {
            self.startButtonNode?.isSelected = false
            self.homeNode?.isSelected = false
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
            self.tracingParticles.removeAtIndex(self.tracingParticles.indexOf(particle)!)
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
        
        self.rootNode!.setTouchedIndicator(index)
        
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
        
        self.startButtonNode!.removeFromParent()
        self.homeNode!.removeFromParent()
        
        self.currentQuestions.removeAll(keepCapacity: true)
        self.userInputs.removeAll(keepCapacity: true)
        
        self.prepareCountDownNode()
        self.messageNode!.text = "Glyph(s) will be shown ..."
        self.countDownNode!.startCountDown { () -> Void in
            self.messageNode!.text = ""
            self.countDownNode?.removeFromParent()
            let sequence = GlyphSequenceProvider.sharedProvider().provideGlyphSequence(GlyphConfiguration.currentLevel)
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
    private func enqueueGlyphSequence(glyphTypes: [String]) {
        for type in glyphTypes {
            let glyph = GlyphGenerator.sharedGenerator().createGlyphWithType(type)
            self.glyphQueue += [glyph]
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
            self.showGlyph(target, type:.Question)
            self.glyphQueue.removeAtIndex(0)
        }
        
        if self.glyphQueue.count == 0 && self.showingGlyph == nil {
            self.showDrawingGlyphMessage()
        }
    }
    
    private func showDrawingGlyphMessage() {
        ActionUtility.doActionAfterSeconds({ () -> Void in
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
        self.showGlyphIndex()
    }
    
    private func showGlyphIndex() {
        
        if self.userInputs.count == self.currentQuestions.count {
            return
        }
        
        self.denominatorNode?.hidden = false
        self.numeratorNode?.hidden = false
        self.dividerNode?.hidden = false
        
        self.denominatorNode?.text = "\(self.currentQuestions.count)"
        self.numeratorNode?.text = "\(self.userInputs.count + 1)"
    }
    
    private func setGlyphName(type: String) {
        if GlyphConfiguration.showGlyphName {
            self.glyphNameNode?.text = type
        }
    }
    
    private enum GlyphShownType {
        case Question
        case UserInput
    }
    
    private func showGlyph(glyph:Glyph, type: GlyphShownType) {
        self.showingGlyph = glyph
        self.rootNode?.showGlyph(glyph, autoRemove: true, completion: { () -> Void in
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
        
        if self.userInputs.count >= self.currentQuestions.count && self.isInInputMode {
            self.isInInputMode = false
            ActionUtility.doActionAfterSeconds({ () -> Void in
                self.glyphSceneDelegate?.didCompleteUserInputs(self.currentQuestions, userInputs: self.userInputs)
            }, after: 0.1)
        }
    }
    
    private func createTracingParticle(point: CGPoint) {
        let particleGlyphPath = NSBundle.mainBundle().pathForResource("DrawingParticle", ofType: "sks")
        let particle = NSKeyedUnarchiver.unarchiveObjectWithFile(particleGlyphPath!) as! SKEmitterNode
        particle.position = point
        particle.alpha = 0.5
        self.tracingParticles += [particle]
        self.addChild(particle)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if node == self.homeNode {
            self.glyphSceneDelegate?.didSelectHomeNodeInScene(self)
            return
        } else if node == self.startButtonNode {
            self.handleTappingStartButton()
            return
        } else if node == self {
            self.homeNode?.isSelected = false
            self.startButtonNode?.isSelected = false
        }
        
        if !self.isInInputMode {
            return
        }
        
        ActionUtility.doActionAfterSeconds({ () -> Void in
            self.clearTracingParticles({
                let glyph = Glyph(type: "" , paths: self.currentGlyphPath)
                self.showGlyph(glyph, type: .UserInput)
            })
        }, after: 0.0)
        
        self.userInputs.append(self.currentGlyphPath)
        self.lastTouchedIndex = -1
        self.showGlyphIndex()
        
        self.rootNode!.clearTouchedIndicator()
    }
}

protocol GlyphSceneDelegate: class {
    func didSelectHomeNodeInScene(scene:GlyphScene)
    func didCompleteUserInputs(answer:[String], userInputs:[Set<GlyphPath>?])
    func didDetectPreparingAd(scene:GlyphScene)
}
