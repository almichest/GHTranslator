//
//  LevelSelectView.swift
//  GlyphHackPractice
//
//  Created by Hiraku Ohno on 2015/06/07.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit

class LevelSelectView: UIView {
    
    
    @IBOutlet weak var currentLevelLabel: UILabel!
    
    static func view() -> LevelSelectView {
        return NSBundle.mainBundle().loadNibNamed("LevelSelectView", owner: nil, options: nil)[0] as! LevelSelectView
    }
}
