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
    
    var delegate: GlyphHackVertexDelegate?
    private(set) var index: Int = -1
    let shape = CGRectMake(10, 10, 50, 50)
    
    private override init() {
        let image = UIImage(named: "Circle")
        let texture = SKTexture(image: image!)
        super.init(texture: texture, color: UIColor.redColor(), size:texture.size())
    }
    
    convenience init(index: Int) {
        self.init()
        self.index = index
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        Log.d("Touched : \(self.index)")
    }
}

protocol GlyphHackVertexDelegate {
    func didTouchVertexAtIndex(index: Int)
}
