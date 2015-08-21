//
//  GlyphFetcher.swift
//  GlyphHackPractice
//
//  Created by Hiraku Ohno on 2015/08/18.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit

class GlyphFetcher: NSObject {
    
    private let testURL = "https://raw.githubusercontent.com/almichest/GHTranslator/master/GlyphHackPractice/Resources/items.json"
    
    private static let instance = GlyphFetcher()
    private let httpManager:AFHTTPSessionManager
    
    static func sharedFetcher() -> GlyphFetcher {
        return instance;
    }
    
    override init() {
        self.httpManager = AFHTTPSessionManager()
        self.httpManager.responseSerializer.acceptableContentTypes = NSSet(array: ["text/plain"]) as Set<NSObject>
    }
    
    func fetchGlyphs() -> BFTask {
        let completionSource = BFTaskCompletionSource()
        
        self.httpManager.GET(testURL, parameters: nil,
            success: {(dataTask: NSURLSessionDataTask!, responseObject: AnyObject!) in
                Log.d("\(responseObject)")
            }, failure: {(dataTask: NSURLSessionDataTask!, error: NSError!) in
                Log.d("\(error)")
            }
        )
        
        return completionSource.task
    }
}
