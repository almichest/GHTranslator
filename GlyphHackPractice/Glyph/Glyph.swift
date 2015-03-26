//
//  Glyph.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/02/22.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit

public class Glyph: NSObject {
    
    
    var paths: Set<Path>
    let type: GlyphType
    
    init(type: GlyphType) {
        self.type = type
        self.paths = []
        super.init()
        
        self.prepare()
    }
    
    private func prepare() {
        
    }
    
    public override func isEqual(object: AnyObject?) -> Bool {
        let another = object as! Glyph
        return (another.paths.isSubsetOf(self.paths) && (another.paths.isSupersetOf(self.paths)))
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
        
        public func extract() -> Set<Path> {
            let key = [self.path1, self.path2]
            let value = self.extractingDictionary[key]
        }
        
        private let extractingDictionary = [[0, 8]  : [[0, 3], [3, 8]],
                                                   [0, 9]  : [[0, 4], [4, 9]],
                                                   [0, 10] : [[0, 5], [5, 10]],
                                                   [1, 5]  : [[1, 3], [3, 5]],
                                                   [1, 7]  : [[1, 3], [3, 5], [5, 7]],
                                                   [1, 9]  : [[1, 3], [3, 5], [5, 7], [7, 9]],
                                                   [1, 10] : [[1, 6], [6, 10]],
                                                   [2, 5]  : [[2, 4], [4, 5]],
                                                   [2, 6]  : [[2, 4], [4, 5], [5, 6]],
                                                   [2, 8]  : [[2, 4], [4, 5], [5, 6], [6, 9]],
                                                   [2, 10] : [[2, 7], [7, 10]],
                                                   [3, 7]  : [[3, 5], [5, 7]],
                                                   [3, 9]  : [[3, 5], [5, 7], [7, 9]],
                                                   [4, 6]  : [[4, 5], [5, 6]],
                                                   [4, 8]  : [[4, 5], [5, 6], [6, 8]],
                                                   [5, 9]  : [[5, 7], [7, 9]],
                                                   [5, 8]  : [[5, 6], [6, 8]],
                                                  ]
    }
}
