//
//  Glyph.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/02/22.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit

public class Glyph: NSObject, NSCopying {
    
    static let maxGlyphIndex = 10
    
    var paths: Set<GlyphPath>?
    let type: GlyphType
    
    init(type: GlyphType) {
        self.type = type
        self.paths = []
        super.init()
        
        self.prepare()
    }
    
    private convenience init(type: GlyphType, paths: Set<GlyphPath>?) {
        self.init(type: type)
        self.paths = paths
    }
    
    private func prepare() {
        
    }
    
    public override func isEqual(object: AnyObject?) -> Bool {
        let another = (object as! Glyph).copy() as! Glyph
        another.extractAllGlyphPaths()
        let selfCopy = self.copy() as! Glyph
        selfCopy.extractAllGlyphPaths()
        Log.d("self - \(selfCopy)")
        Log.d("another - \(another)")
        return (selfCopy.paths!.isSubsetOf(another.paths!) && (selfCopy.paths!.isSupersetOf(another.paths!)))
    }
    
    private func extractAllGlyphPaths() {
        var newGlyphPaths: Set<GlyphPath> = []
        for path in self.paths! {
            let extracted = path.extract()
            for extractedGlyphPath in extracted {
                newGlyphPaths.insert(extractedGlyphPath)
            }
        }
        self.paths = newGlyphPaths
    }
    
    public func copyWithZone(zone: NSZone) -> AnyObject {
        return Glyph(type: self.type, paths: self.paths)
    }
    
    override public var description: String {
        get {
            return "\(self.type.rawValue) - \(self.paths)"
        }
    }
    
    
    /* Internal class */
    public class GlyphPath: NSObject, NSCopying {
        
        /* Point2 must be larger than Point1. */
        let point1: Int
        let point2: Int
        
        init(point1: Int, point2: Int) {
            assert(point2 > point1, "Point2 must be greater than Point1")
            self.point1 = point1
            self.point2 = point2
        }
        
        public func copyWithZone(zone: NSZone) -> AnyObject {
            return GlyphPath(point1: self.point1, point2: self.point2)
        }
        
        override public func isEqual(object: AnyObject?) -> Bool {
            let another = object as! GlyphPath
            let hash = self.hash
            return ((self.point1 == another.point1) && (self.point2 == another.point2));
        }
        
        override public var hash: Int {
            return self.description.hash
        }
        
        override public var description: String {
            get {
                return "\(self.point1) - \(self.point2)"
            }
        }
        
        private static let extractingDictionary: Dictionary<GlyphPath, Set<GlyphPath>> =
            [
                GlyphPath(point1: 0, point2: 8)    : [GlyphPath(point1: 0, point2: 3), GlyphPath(point1: 3, point2: 8)],
                GlyphPath(point1: 0, point2: 9)    : [GlyphPath(point1: 0, point2: 4), GlyphPath(point1: 4, point2: 9)],
                GlyphPath(point1: 0, point2: 10)   : [GlyphPath(point1: 0, point2: 5), GlyphPath(point1: 5, point2: 10)],
                GlyphPath(point1: 1, point2: 5)    : [GlyphPath(point1: 1, point2: 3), GlyphPath(point1: 3, point2: 5)],
                GlyphPath(point1: 1, point2: 7)    : [GlyphPath(point1: 1, point2: 3), GlyphPath(point1: 3, point2: 5), GlyphPath(point1: 5, point2: 7)],
                GlyphPath(point1: 1, point2: 9)    : [GlyphPath(point1: 1, point2: 3), GlyphPath(point1: 3, point2: 5), GlyphPath(point1: 5, point2: 7), GlyphPath(point1: 7, point2: 9)],
                GlyphPath(point1: 1, point2: 10)   : [GlyphPath(point1: 1, point2: 6), GlyphPath(point1: 6, point2: 10)],
                GlyphPath(point1: 2, point2: 5)    : [GlyphPath(point1: 2, point2: 4), GlyphPath(point1: 4, point2: 5)],
                GlyphPath(point1: 2, point2: 6)    : [GlyphPath(point1: 2, point2: 4), GlyphPath(point1: 4, point2: 5), GlyphPath(point1: 5, point2: 6)],
                GlyphPath(point1: 2, point2: 8)    : [GlyphPath(point1: 2, point2: 4), GlyphPath(point1: 4, point2: 5), GlyphPath(point1: 5, point2: 6), GlyphPath(point1: 6, point2: 8)],
                GlyphPath(point1: 2, point2: 10)   : [GlyphPath(point1: 2, point2: 7), GlyphPath(point1: 7, point2: 10)],
                GlyphPath(point1: 3, point2: 7)    : [GlyphPath(point1: 3, point2: 5), GlyphPath(point1: 5, point2: 7)],
                GlyphPath(point1: 3, point2: 9)    : [GlyphPath(point1: 3, point2: 5), GlyphPath(point1: 5, point2: 7), GlyphPath(point1: 7, point2: 9)],
                GlyphPath(point1: 4, point2: 6)    : [GlyphPath(point1: 4, point2: 5), GlyphPath(point1: 5, point2: 6)],
                GlyphPath(point1: 4, point2: 8)    : [GlyphPath(point1: 4, point2: 5), GlyphPath(point1: 5, point2: 6), GlyphPath(point1: 6, point2: 8)],
                GlyphPath(point1: 5, point2: 9)    : [GlyphPath(point1: 5, point2: 7), GlyphPath(point1: 7, point2: 9)],
                GlyphPath(point1: 5, point2: 8)    : [GlyphPath(point1: 5, point2: 6), GlyphPath(point1: 6, point2: 8)],
            ]
        
        private func extract() -> Set<GlyphPath> {
            let result = GlyphPath.extractingDictionary[self]
            return (result != nil) ? result! : [self]
        }
    }
}
