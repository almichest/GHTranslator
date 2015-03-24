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
    
}

