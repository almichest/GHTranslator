//
//  GeneralLabelNode.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/04/01.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit
import SpriteKit

class GeneralLabelNode: SKLabelNode {
    
    private static let fontNameCourier = "Courier"
    
    override init() {
        super.init()
        self.fontName = GeneralLabelNode.fontNameCourier
        self.fontColor = SKColor.whiteColor()
    }
    
    convenience override init(fontNamed fontName: String!) {
        self.init()
    }
    
    convenience init(text: String) {
        self.init()
        self.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
