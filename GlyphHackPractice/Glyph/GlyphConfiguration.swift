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
    private static let GlyphConfigurationShowGlyphNameKey = "GlyphConfigurationShowGlyphName"
    private static let GlyphConfigurationLaunchedBeforeKey = "GlyphConfigurationLaunchedBefore"
    private static let userDefaults = NSUserDefaults.standardUserDefaults()
    
    static var currentLevel:GlyphSequenceCount {
        get {
            var integerValue = self.userDefaults.integerForKey(GlyphConfigurationCurrentLevelKey)
            return GlyphSequenceCount(rawValue: integerValue)!
        }
        set {
            self.userDefaults.setInteger(newValue.rawValue, forKey: GlyphConfigurationCurrentLevelKey)
            let notificationCenter = NSNotificationCenter.defaultCenter()
            notificationCenter.postNotificationName(GlyphConfigurationChangeCurrentLevelNotification, object: nil)
        }
    }
    
    static var showGlyphName:Bool {
        get {
            return self.userDefaults.boolForKey(GlyphConfigurationShowGlyphNameKey)
        }
        set {
            self.userDefaults.setBool(newValue, forKey: GlyphConfigurationShowGlyphNameKey)
        }
    }
}
