//
//  GlyphScore.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/04/01.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit

class GlyphScore: NSObject {
    
    private static let GlyphScoreBestScoreKey = "GlyphScoreBestScore"
    private static let GlyphScoreCurrentScoreKey = "GlyphScoreBestScore"
    
    static func bestScore(level: GlyphSequenceCount) -> Int {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        return userDefaults.integerForKey(self.createBestScoreKey(level))
    }
    
    static func currentScore(level: GlyphSequenceCount) -> Int{
        let userDefaults = NSUserDefaults.standardUserDefaults()
        return userDefaults.integerForKey(self.createCurrentScoreKey(level))
    }
    
    static func saveBestScore(score:Int, level:GlyphSequenceCount) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setInteger(score, forKey: self.createBestScoreKey(level))
    }
    
    static func saveCurrentScore(score:Int, level:GlyphSequenceCount) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setInteger(score, forKey: self.createCurrentScoreKey(level))
    }
    
    private static func createBestScoreKey(level: GlyphSequenceCount) -> String {
        return "\(GlyphScoreBestScoreKey).\(level.rawValue)"
    }
    
    private static func createCurrentScoreKey(level: GlyphSequenceCount) -> String {
        return "\(GlyphScoreCurrentScoreKey).\(level.rawValue)"
    }
}
