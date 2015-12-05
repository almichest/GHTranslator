//
//  GlyphGenerator.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/03/01.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit

class GlyphGenerator: NSObject {
    
    static let instance = GlyphGenerator()
    
    static func sharedGenerator() -> GlyphGenerator {
        return instance
    }
    
    private let glyphDictionary: Dictionary<String, [[Int]]>
    override init() {
        let path = NSBundle.mainBundle().pathForResource("items", ofType: "json")
        let fileHandle = NSFileHandle(forReadingAtPath: path!)
        let data = fileHandle!.readDataToEndOfFile()
        
        let glyphs = (try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)) as! Array<Dictionary<String, AnyObject>>
        
        var mutableGlyphDictionary = Dictionary<String, [[Int]]>()
        
        for glyph:Dictionary<String, AnyObject> in glyphs {
            let name = glyph["name"] as! String
            let paths:[[Int]] = glyph["paths"] as! [[Int]]
            mutableGlyphDictionary[name] = paths
        }
        
        self.glyphDictionary = mutableGlyphDictionary
    }
    
    func createGlyphWithType(type: String, path: Set<GlyphPath>? = nil) -> Glyph {
        if path != nil {
            return Glyph(type: type, paths: path)
        }
        
        Log.d("\(self.glyphDictionary)\n")
        let paths:[[Int]] = self.glyphDictionary[type]!
        var mutablePaths: Set<GlyphPath> = Set<GlyphPath>(minimumCapacity: paths.count)
        for path in paths {
            mutablePaths.insert(GlyphPath(point1: path[0], point2: path[1]))
        }
        return Glyph(type: type, paths: mutablePaths)
    }
}
