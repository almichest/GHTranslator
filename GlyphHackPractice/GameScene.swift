//
//  GameScene.swift
//  GlyphHackPractice
//
//  Created by Hiraku Ohno on 2015/01/31.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let vertexCount = 11
    private var rootNode:RootNode?
    
    override init(size: CGSize) {
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMoveToView(view: SKView) {
        let rootNode = RootNode(color: SKColor.redColor(), size: self.size)
        super.addChild(rootNode)
        rootNode.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        self.rootNode = rootNode
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let sprite = GlyphHackVertex(index: 0)
            println(location)
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = CGPoint(x: 0, y:0)
            self.addChild(sprite)
        }
    }
    
    override func addChild(node: SKNode) {
        self.rootNode?.addChild(node)
    }
    
    override func update(currentTime: CFTimeInterval) {
    }
}
