//
//  Glyph.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/02/22.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit

public class Glyph: NSObject {
    
    
    var paths: [Path]?
    let type: GlyphType
    
    init(type: GlyphType) {
        self.type = type
        super.init()
        
        self.prepare()
    }
    
    private func prepare() {
        
    }
    
    /* Internal class */
    public class Path: NSObject, NSCopying {
        
        /* Point2 must be larger than Point1. */
        let point1: Int
        let point2: Int
        
        init(point1: Int, point2: Int) {
            assert(point2 > point1, "Point2 must be greater than Point1")
            self.point1 = point1
            self.point2 = point2
        }
        
        public func copyWithZone(zone: NSZone) -> AnyObject {
            return Path(point1: self.point1, point2: self.point2)
        }
        
        override public func isEqual(object: AnyObject?) -> Bool {
            let another = object as! Path
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
    }
}
