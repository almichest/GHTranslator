//
//  SceneUtility.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/04/04.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit

class ActionUtility: NSObject {
   
    static func doActionAfterSeconds(action:() -> Void, after:NSTimeInterval) {
        let delay = after * Double(NSEC_PER_SEC)
        let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            action()
        })
    }
}
