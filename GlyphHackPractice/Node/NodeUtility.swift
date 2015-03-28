//
//  NodeUtility.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/03/28.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit

class NodeUtility: NSObject {
    static func calculateDistance(point1:CGPoint, point2:CGPoint) -> CGFloat {
        let xDiff = point1.x - point2.x
        let yDiff = point2.y - point2.y
        let squared = xDiff * xDiff + yDiff * yDiff
        
        return sqrt(squared)
    }
}
