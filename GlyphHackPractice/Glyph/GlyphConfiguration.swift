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
    
    private static let GlyphConfigurationCurrentLevelKey = "GlyphConfigurationCurrentLevel"
    
    static var currentLevel:GlyphSequenceCount {
        get {
            let userDefaults = NSUserDefaults.standardUserDefaults()
            var integerValue = userDefaults.integerForKey(GlyphConfigurationCurrentLevelKey)
            if integerValue == 0 {
                integerValue = 1
            }
            return GlyphSequenceCount(rawValue: integerValue)!
        }
        set {
            let userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setInteger(newValue.rawValue, forKey: GlyphConfigurationCurrentLevelKey)
            let notificationCenter = NSNotificationCenter.defaultCenter()
            notificationCenter.postNotificationName(GlyphConfigurationChangeCurrentLevelNotification, object: nil)
        }
    }
}
