//
//  CountDownLabelNode.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/03/30.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit
import SpriteKit

class CountDownLabelNode: GeneralLabelNode {
    
    private let initialValue:Int
    private let targetValue:Int
    private var currentValue:Int
    
    init(initialValue:Int, targetValue:Int) {
        self.initialValue = initialValue
        self.targetValue = targetValue
        self.currentValue = initialValue
        super.init()
    }
    
    func startCountDown(completion:(() -> Void)?) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            while self.currentValue >= self.targetValue {
                self.text = "\(self.currentValue)"
                self.currentValue--
                NSThread.sleepForTimeInterval(1)
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                if completion != nil {
                    completion!()
                }
            })
        })
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
