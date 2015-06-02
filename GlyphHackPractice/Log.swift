//
//  Log.swift
//  GlyphHackPractice
//
//  Created by Hiraku Ohno on 2015/02/21.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import Foundation

class Log: NSObject {
    
    static func d(message: String,
                 function: String = __FUNCTION__,
                 file: String = __FILE__,
                 line: Int = __LINE__) {
                    
        #if DEBUG
        println("File: \(file), Function: \(function), Line: \(line)\n \(message)")
        #else
        #endif
    }
    
}
