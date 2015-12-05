//
//  GlyphSequence.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/03/26.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit

public enum GlyphSequenceCount:Int {
    case One    = 1
    case Two    = 2
    case Three  = 3
    case Four   = 4
    case Five   = 5
}

public class GlyphSequenceProvider: NSObject {
    
    private static let instance = GlyphSequenceProvider()
    
    static func sharedProvider() -> GlyphSequenceProvider {
        return instance
    }
    
    private let sequencesDictionary: Dictionary<GlyphSequenceCount, [[String]]>
    
    override init() {
        var mutableSequencesDictionary: Dictionary<GlyphSequenceCount, [[String]]> = Dictionary(minimumCapacity: 5)
        for i in 1 ... 5 {
            let path = NSBundle.mainBundle().pathForResource("sequence_0\(i)", ofType: "json")
            let fileHandle = NSFileHandle(forReadingAtPath: path!)
            let data = fileHandle!.readDataToEndOfFile()
            
            let sequences = (try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)) as! [[String]]
            
            mutableSequencesDictionary[GlyphSequenceCount(rawValue: i)!] = sequences
        }
        
        self.sequencesDictionary = mutableSequencesDictionary
    }
    
    public func provideGlyphSequence(count: GlyphSequenceCount) -> [String] {
        let target: [[String]] = self.sequencesDictionary[count]!
        let index = Int(arc4random_uniform(UInt32(target.count)))
        return target[index]
    }
    
#if DEBUG
    // For testing
    public func provideAllSequence() -> [[[String]]] {
        return [self.sequencesDictionary[GlyphSequenceCount.One]!,
                self.sequencesDictionary[GlyphSequenceCount.Two]!,
                self.sequencesDictionary[GlyphSequenceCount.Three]!,
                self.sequencesDictionary[GlyphSequenceCount.Four]!,
                self.sequencesDictionary[GlyphSequenceCount.Five]!,
        ]
    }
    
    public func provideAllSingleSequence() -> [[String]] {
        return self.sequencesDictionary[GlyphSequenceCount.One]!
    }
#endif
    
 }
