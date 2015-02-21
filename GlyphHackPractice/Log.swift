//
//  Log.swift
//  GlyphHackPractice
//
//  Created by Hiraku Ohno on 2015/02/21.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import Foundation

class Log: NSObject {
    
    class func d(message: String) {
        #if DEBUG
            println("\(__FUNCTION__) \(__FILE__) \(__LINE__) " + message)
        #endif
    }

}
