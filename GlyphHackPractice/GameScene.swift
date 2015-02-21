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
        println(self.size)
        let rootNode = RootNode(color: SKColor.redColor(), size: CGSizeMake(self.size.width, self.size.height))
        super.addChild(rootNode)
        rootNode.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        self.rootNode = rootNode
        rootNode.prepare()
    }
}
