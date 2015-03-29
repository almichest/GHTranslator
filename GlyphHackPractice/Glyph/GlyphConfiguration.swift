//
//  GlyphConfiguration.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/03/29.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit

class GlyphConfiguration: NSObject {
    
    static let GlyphConfigurationChangeCurrentLevelNotification = "GlyphConfigurationChangeCurrentLevelNotification"
    
    static var currentLevel:GlyphSequenceCount = GlyphSequenceCount.One {
        didSet {
            let notificationCenter = NSNotificationCenter.defaultCenter()
            notificationCenter.postNotificationName(GlyphConfigurationChangeCurrentLevelNotification, object: nil)
        }
    }
}
