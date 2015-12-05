//
//  SelectableLabelNode.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/04/02.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit
import SpriteKit

class SelectableLabelNode: SKSpriteNode {
    
    private static let fontNameCourier = "Courier"
    private static let normalFontColor = SKColor(red: 157.0 / 255.0, green: 204.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0)
    private static let selectedFontColor = SKColor(red: 157.0 / 255.0, green: 204.0 / 255.0, blue: 224.0 / 255.0, alpha: 0.5)
    
    private var labelNode:SKLabelNode?
    
    deinit {
        self.labelNode?.removeFromParent()
    }
    
    var fontSize:CGFloat {
        get {
            return self.labelNode!.fontSize
        }
        
        set {
            self.labelNode!.fontSize = newValue
        }
    }
    
    var horizontalAlignmentMode:SKLabelHorizontalAlignmentMode {
        get {
            return self.labelNode!.horizontalAlignmentMode
        }
        set {
            self.labelNode!.horizontalAlignmentMode = newValue
        }
    }
    
    var text:String {
        get {
            return self.labelNode!.text
        }
        set {
            self.labelNode!.text = newValue
            self.size = CGSizeMake(self.labelNode!.frame.size.width, self.labelNode!.frame.size.height * 2)
        }
    }
    
    var isSelected:Bool {
        get {
           return self.labelNode!.fontColor.isEqual(SelectableLabelNode.selectedFontColor)
        }
        set {
            if newValue {
                self.labelNode!.fontColor = SelectableLabelNode.selectedFontColor
            } else {
                self.labelNode!.fontColor = SelectableLabelNode.normalFontColor
            }
        }
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(text: String) {
        let labelNode = SKLabelNode(text: text)
        self.init(texture: nil, color: UIColor.clearColor(), size: CGSizeMake(labelNode.frame.size.width, labelNode.frame.size.height * 2))
        self.labelNode = labelNode
        self.labelNode!.fontColor = SelectableLabelNode.normalFontColor
        self.labelNode!.fontName = SelectableLabelNode.fontNameCourier
        self.userInteractionEnabled = false
        self.addChild(self.labelNode!)
        self.zPosition = 1.0
        self.labelNode!.zPosition = -0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
