//
//  GlyphScore.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/04/01.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit
import GameKit

class GlyphScore: NSObject {
    
    private static let GlyphScoreBestScoreKey = "GlyphScoreBestScore"
    private static let GlyphScoreCurrentScoreKey = "GlyphScoreCurrentScore"
    
    static func bestScore(level: GlyphSequenceCount) -> Int {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        return userDefaults.integerForKey(self.createBestScoreKey(level))
    }
    
    static func currentScore(level: GlyphSequenceCount) -> Int{
        let userDefaults = NSUserDefaults.standardUserDefaults()
        return userDefaults.integerForKey(self.createCurrentScoreKey(level))
    }
    
    static func saveBestScore(score:Int, level:GlyphSequenceCount, upload:Bool = true) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setInteger(score, forKey: self.createBestScoreKey(level))
        userDefaults.synchronize()
        
        if upload {
            self.uploadBestScores([level])
        }
    }
    
    static func saveCurrentScore(score:Int, level:GlyphSequenceCount) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setInteger(score, forKey: self.createCurrentScoreKey(level))
        userDefaults.synchronize()
    }
    
    private static func createBestScoreKey(level: GlyphSequenceCount) -> String {
        return "\(GlyphScoreBestScoreKey).\(level.rawValue)"
    }
    
    private static func createCurrentScoreKey(level: GlyphSequenceCount) -> String {
        return "\(GlyphScoreCurrentScoreKey).\(level.rawValue)"
    }
    
    private static func uploadBestScores(levels:[GlyphSequenceCount]) {
        var scores = [GKScore]()
        for level in levels {
            let scoreReporter = GKScore(leaderboardIdentifier: GlyphLevelIdentifier.identifierWithLevel(level).rawValue)
            scoreReporter.value = Int64(self.bestScore(level))
            scores.append(scoreReporter)
        }
        
        GKScore.reportScores(scores, withCompletionHandler: { (error) -> Void in
            Log.d("Reporting scores completed. error : \(error)")
            if error != nil {
            }
        })
    }
    
    static func overwriteLocalScore(identifier:String, value:Int) {
        let levelIdentifier = GlyphLevelIdentifier(rawValue: identifier)
        let level = levelIdentifier?.level()
        self.saveBestScore(value, level: level!, upload: false)
    }
    
    private enum GlyphLevelIdentifier:String {
        
        case One    = "best.level1"
        case Two    = "best.level2"
        case Three  = "best.level3"
        case Four   = "best.level4"
        case Five   = "best.level5"
        
        static func identifierWithLevel(level:GlyphSequenceCount) -> GlyphLevelIdentifier {
            switch level {
            case .One :
                return GlyphLevelIdentifier.One
            case .Two :
                return GlyphLevelIdentifier.Two
            case .Three :
                return GlyphLevelIdentifier.Three
            case .Four :
                return GlyphLevelIdentifier.Four
            case .Five :
                return GlyphLevelIdentifier.Five
            }
        }
        
        func level() -> GlyphSequenceCount {
            switch self.rawValue {
            case GlyphLevelIdentifier.One.rawValue :
                return GlyphSequenceCount.One
                
            case GlyphLevelIdentifier.Two.rawValue :
                return GlyphSequenceCount.Two
                
            case GlyphLevelIdentifier.Three.rawValue :
                return GlyphSequenceCount.Three
                
            case GlyphLevelIdentifier.Four.rawValue :
                return GlyphSequenceCount.Four
                
            case GlyphLevelIdentifier.Five.rawValue :
                return GlyphSequenceCount.Five
            default :
                assert(false, "Must not reach here")
                return GlyphSequenceCount.One
            }
        }
    }
}
