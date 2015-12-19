//
//  GlyphFetcher.swift
//  GlyphHackPractice
//
//  Created by Hiraku Ohno on 2015/08/18.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit
import Bolts
import Alamofire

class GlyphFetcher: NSObject {
    
    static let itemsName = "items"
    
    private static let itemsURL = "https://raw.githubusercontent.com/almichest/GHTranslator/master/GlyphHackPractice/Resources/items.json"
    private static let sequenceUrl1 = "https://raw.githubusercontent.com/almichest/GHTranslator/master/GlyphHackPractice/Resources/sequence_01.json"
    private static let sequenceUrl2 = "https://raw.githubusercontent.com/almichest/GHTranslator/master/GlyphHackPractice/Resources/sequence_02.json"
    private static let sequenceUrl3 = "https://raw.githubusercontent.com/almichest/GHTranslator/master/GlyphHackPractice/Resources/sequence_03.json"
    private static let sequenceUrl4 = "https://raw.githubusercontent.com/almichest/GHTranslator/master/GlyphHackPractice/Resources/sequence_04.json"
    private static let sequenceUrl5 = "https://raw.githubusercontent.com/almichest/GHTranslator/master/GlyphHackPractice/Resources/sequence_05.json"
    
    private static let instance = GlyphFetcher()
    
    static func sharedFetcher() -> GlyphFetcher {
        return instance;
    }
    
    func fetchGlyphs() -> BFTask {
        
        let itemsTask = self.getJson(GlyphFetcher.itemsURL)
        let sequenceTask1 = self.getJson(GlyphFetcher.sequenceUrl1)
        let sequenceTask2 = self.getJson(GlyphFetcher.sequenceUrl2)
        let sequenceTask3 = self.getJson(GlyphFetcher.sequenceUrl3)
        let sequenceTask4 = self.getJson(GlyphFetcher.sequenceUrl4)
        let sequenceTask5 = self.getJson(GlyphFetcher.sequenceUrl5)
        
        let allTask = BFTaskCompletionSource()
        
        BFTask(forCompletionOfAllTasks: [itemsTask, sequenceTask1, sequenceTask2, sequenceTask3, sequenceTask4, sequenceTask4, sequenceTask5]).continueWithSuccessBlock({ (task) -> AnyObject? in
            guard let items = itemsTask.result,
                  let sequence1 = sequenceTask1.result,
                  let sequence2 = sequenceTask2.result,
                  let sequence3 = sequenceTask3.result,
                  let sequence4 = sequenceTask4.result,
                  let sequence5 = sequenceTask5.result else {
                    allTask.trySetError(NSError(domain: "fetching", code: 0, userInfo: nil))
                    return nil
                    
            }
            
            allTask.trySetResult([GlyphFetcher.itemsName : items,
                                  "1" : sequence1,
                                  "2" : sequence2,
                                  "3" : sequence3,
                                  "4" : sequence4,
                                  "5" : sequence5])
            return nil
            
        })
        
        return allTask.task
        
    }
    
    private func getJson(url: String) -> BFTask {
        let tcs = BFTaskCompletionSource()
        Alamofire.request(.GET, url)
                 .responseJSON {response -> Void in
                    if response.result.isSuccess {
                        Log.d("\(response.result.value)")
                        guard let result = response.result.value else {
                            tcs.trySetError(NSError(domain: "glyph", code: 0, userInfo: nil))
                            return
                        }
                        tcs.trySetResult(result);
                    } else {
                        tcs.trySetError(NSError(domain: "glyph", code: 0, userInfo: nil))
                    }
        }
        
        return tcs.task
    }
}
