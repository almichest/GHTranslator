//
//  GlyphHackVertex.swift
//  GlyphHackPractice
//
//  Created by Hiraku Ohno on 2015/01/31.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import SpriteKit
import QuartzCore

class GlyphHackVertex: SKSpriteNode {
    
    private(set) var index: Int = -1
    private var touched:Bool = false
    
    private init() {
        let image = UIImage(named: "Circle")
        let texture = SKTexture(image: image!)
        super.init(texture: texture, color: UIColor.redColor(), size:texture.size())
    }
    
    convenience init(index: Int) {
        self.init()
        self.index = index
        self.name = "Vertex \(index)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touch() {
        if !self.touched {
            self.addTouchedIndicator()
        }
    }
    
    private func addTouchedIndicator() {
        let circle = CGRectMake(-self.size.width / 2.0, -self.size.width / 2.0, self.size.width, self.size.height)
        let circleNode = SKShapeNode()
        circleNode.path = UIBezierPath(ovalInRect: circle).CGPath
        circleNode.fillColor = SKColor.yellowColor()
        circleNode.lineWidth = 0
        circleNode.antialiased = true
        circleNode.alpha = 0.5
        circleNode.setScale(0.3)
        self.addChild(circleNode)
    }
}

