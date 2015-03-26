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
    
    func testExtractingPath() {
        let paths1: Set<Glyph.GlyphPath> = [Glyph.GlyphPath(point1: 0, point2: 10)]
        let glyph1 = GlyphGenerator.createGlyphWithType(GlyphType.UserInteractionResult, path: paths1)
        glyph1.extractAllGlyphPaths()
        
        XCTAssert(glyph1.paths.contains(Glyph.GlyphPath(point1: 0, point2: 5)), "")
        XCTAssert(glyph1.paths.contains(Glyph.GlyphPath(point1: 5, point2: 10)), "")
        XCTAssert(glyph1.paths.count == 2, "")
    }
}
