//
//  SelectableLabelNode.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/04/02.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit
import SpriteKit

class SelectableLabelNode: GeneralLabelNode {
    
    static let normalFontColor = SKColor(red: 157.0 / 255.0, green: 204.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0)
    static let selectedFontColor = SKColor(red: 157.0 / 255.0, green: 204.0 / 255.0, blue: 224.0 / 255.0, alpha: 0.5)
    
    var isSelected:Bool {
        get {
           return self.fontColor.isEqual(SelectableLabelNode.selectedFontColor)
        }
        set {
            if newValue {
                self.fontColor = SelectableLabelNode.selectedFontColor
            } else {
                self.fontColor = SelectableLabelNode.normalFontColor
            }
        }
    }
    
    override init() {
        super.init()
        self.fontColor = SelectableLabelNode.normalFontColor
    }
    
    convenience init(text: String) {
        self.init()
        self.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
