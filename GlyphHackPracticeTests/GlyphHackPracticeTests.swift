//
//  GlyphHackPracticeTests.swift
//  GlyphHackPracticeTests
//
//  Created by Hiraku Ohno on 2015/01/31.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit
import XCTest

class GlyphHackPracticeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEqual() {
        let paths1: Set<Glyph.GlyphPath> = [Glyph.GlyphPath(point1: 0, point2: 10)]
        let glyph1 = GlyphGenerator.createGlyphWithType(GlyphType.UserInteractionResult, path: paths1)
        
        let paths2: Set<Glyph.GlyphPath> = [Glyph.GlyphPath(point1: 0, point2: 5),
                                            Glyph.GlyphPath(point1: 5, point2: 10)]
        let glyph2 = GlyphGenerator.createGlyphWithType(GlyphType.UserInteractionResult, path: paths2)
        
        XCTAssert(glyph1.isEqual(glyph2), "")
    }
    
    func testCreatingChaosGlyph() {
        let chaos = GlyphGenerator.createGlyphWithType(GlyphType.Chaos, path: nil)
        
        let inputPath: Set<Glyph.GlyphPath> = [
                                               Glyph.GlyphPath(point1: 0, point2: 1),
                                               Glyph.GlyphPath(point1: 1, point2: 8),
                                               Glyph.GlyphPath(point1: 0, point2: 2),
                                               Glyph.GlyphPath(point1: 2, point2: 6),
                                               Glyph.GlyphPath(point1: 6, point2: 10),
                                              ]
        let inputGlyph = GlyphGenerator.createGlyphWithType(GlyphType.UserInteractionResult, path: inputPath)
        XCTAssert(chaos.isEqual(inputGlyph), "")
    }
    
    func testIfNilGlyphExists() {
        let allGlyphSequences:[[[GlyphType]]] = GlyphSequenceProvider.provideAllSequence()
        for sequence1:[[GlyphType]] in allGlyphSequences {
            for sequence2:[GlyphType] in sequence1 {
                for type in sequence2 {
                    let glyph: Glyph? = GlyphGenerator.createGlyphWithType(type)
                    XCTAssert(glyph != nil, "")
                }
            }
        }
    }
}
