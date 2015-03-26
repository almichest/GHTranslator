//
//  GlyphGenerator.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/03/01.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit

class GlyphGenerator: NSObject {
    
    class func createGlyphWithType(type: GlyphType, path: Set<Glyph.GlyphPath>?) -> Glyph {
        let glyph = Glyph(type: type)
        switch type {
        case .Abandon:
            glyph.paths = [Glyph.GlyphPath(point1: 2, point2: 8),
                           Glyph.GlyphPath(point1: 8, point2: 10)]
            
        case .Adapt, .Adjust:
            glyph.paths = [Glyph.GlyphPath(point1: 1, point2: 6),
                           Glyph.GlyphPath(point1: 5, point2: 6),
                           Glyph.GlyphPath(point1: 5, point2: 7)]
            
        case .Advance:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 8)]
        
        case .After:
            glyph.paths = [Glyph.GlyphPath(point1: 2, point2: 4),
                           Glyph.GlyphPath(point1: 4, point2: 5),
                           Glyph.GlyphPath(point1: 5, point2: 7),
                           Glyph.GlyphPath(point1: 7, point2: 9),
                           Glyph.GlyphPath(point1: 2, point2: 9)]
            
        case .Again, .Repeat:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 6),
                           Glyph.GlyphPath(point1: 3, point2: 8),
                           Glyph.GlyphPath(point1: 4, point2: 6),
                           Glyph.GlyphPath(point1: 4, point2: 7)]
            
        case .All:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 1),
                           Glyph.GlyphPath(point1: 1, point2: 8),
                           Glyph.GlyphPath(point1: 8, point2: 10),
                           Glyph.GlyphPath(point1: 9, point2: 10),
                           Glyph.GlyphPath(point1: 2, point2: 9),
                           Glyph.GlyphPath(point1: 0, point2: 2)]
            
        case .Answer:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 4, point2: 7),
                           Glyph.GlyphPath(point1: 5, point2: 7)]
            
        case .Attack, .War:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 8),
                           Glyph.GlyphPath(point1: 0, point2: 9)]
            
        case .Avoid, .Struggle:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 1),
                           Glyph.GlyphPath(point1: 0, point2: 4),
                           Glyph.GlyphPath(point1: 2, point2: 4),
                           Glyph.GlyphPath(point1: 2, point2: 7)]
            
        case .Barrier, .Obstacle:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 5),
                           Glyph.GlyphPath(point1: 5, point2: 9)]

        case .Begin:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 6),
                           Glyph.GlyphPath(point1: 6, point2: 10),
                           Glyph.GlyphPath(point1: 7, point2: 10)]

        case .Being, .HumanA:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 6),
                           Glyph.GlyphPath(point1: 4, point2: 7),
                           Glyph.GlyphPath(point1: 6, point2: 10),
                           Glyph.GlyphPath(point1: 7, point2: 10)]

        case .Body, .Shell:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 5),
                           Glyph.GlyphPath(point1: 4, point2: 5)]

        case .Breathe:
            glyph.paths = nil

        case .Capture:
            glyph.paths = [Glyph.GlyphPath(point1: 2, point2: 7),
                           Glyph.GlyphPath(point1: 5, point2: 7),
                           Glyph.GlyphPath(point1: 5, point2: 8),
                           Glyph.GlyphPath(point1: 8, point2: 10)]

        case .Change, .Modify:
            glyph.paths = [Glyph.GlyphPath(point1: 5, point2: 6),
                           Glyph.GlyphPath(point1: 5, point2: 10),
                           Glyph.GlyphPath(point1: 7, point2: 10)]

        case .Chaos, .Disorder:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 1),
                           Glyph.GlyphPath(point1: 0, point2: 2),
                           Glyph.GlyphPath(point1: 1, point2: 8),
                           Glyph.GlyphPath(point1: 2, point2: 4),
                           Glyph.GlyphPath(point1: 4, point2: 5),
                           Glyph.GlyphPath(point1: 5, point2: 6),
                           Glyph.GlyphPath(point1: 6, point2: 10)]

        case .Clear:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 10)]

        case .ClearAll:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 1),
                           Glyph.GlyphPath(point1: 0, point2: 2),
                           Glyph.GlyphPath(point1: 0, point2: 10),
                           Glyph.GlyphPath(point1: 1, point2: 8),
                           Glyph.GlyphPath(point1: 2, point2: 9),
                           Glyph.GlyphPath(point1: 8, point2: 10),
                           Glyph.GlyphPath(point1: 9, point2: 10)]

        case .Complex:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 5),
                           Glyph.GlyphPath(point1: 5, point2: 6)]

        case .Conflict:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 8),
                           Glyph.GlyphPath(point1: 3, point2: 6),
                           Glyph.GlyphPath(point1: 6, point2: 7),
                           Glyph.GlyphPath(point1: 4, point2: 7),
                           Glyph.GlyphPath(point1: 4, point2: 9)]
            
        case .Consequence:
            glyph.paths = nil
            
        case .Contemplate:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 2),
                           Glyph.GlyphPath(point1: 2, point2: 9),
                           Glyph.GlyphPath(point1: 3, point2: 5),
                           Glyph.GlyphPath(point1: 3, point2: 6),
                           Glyph.GlyphPath(point1: 4, point2: 5),
                           Glyph.GlyphPath(point1: 6, point2: 10),
                           Glyph.GlyphPath(point1: 9, point2: 10)]
            
        case .Contract, .Reduce:
            glyph.paths = [Glyph.GlyphPath(point1: 4, point2: 7),
                           Glyph.GlyphPath(point1: 4, point2: 9)]
            
        case .Courage:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 8),
                           Glyph.GlyphPath(point1: 3, point2: 6),
                           Glyph.GlyphPath(point1: 6, point2: 7)]
            
        case .Create, .Creation:
            glyph.paths = [Glyph.GlyphPath(point1: 2, point2: 8)]
            
            
        case .CreativityA:
            glyph.paths = nil
            
        case .CreativityB, .MindA, .ThoughtA, .IdeaA:
            glyph.paths = [Glyph.GlyphPath(point1: 1, point2: 8),
                           Glyph.GlyphPath(point1: 1, point2: 9),
                           Glyph.GlyphPath(point1: 2, point2: 4),
                           Glyph.GlyphPath(point1: 2, point2: 9),
                           Glyph.GlyphPath(point1: 6, point2: 8)]
            
        case .Danger:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 3),
                           Glyph.GlyphPath(point1: 3, point2: 5),
                           Glyph.GlyphPath(point1: 5, point2: 10)]
            
        case .Data, .Signal, .MessageA:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 4),
                           Glyph.GlyphPath(point1: 4, point2: 6),
                           Glyph.GlyphPath(point1: 2, point2: 10)]
            
        case .Defend:

            glyph.paths = [Glyph.GlyphPath(point1: 1, point2: 10),
                           Glyph.GlyphPath(point1: 2, point2: 10)]
        case .Destination:
            glyph.paths = nil
            
        case .Destiny:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 5),
                           Glyph.GlyphPath(point1: 4, point2: 5),
                           Glyph.GlyphPath(point1: 4, point2: 7),
                           Glyph.GlyphPath(point1: 6, point2: 7),
                           Glyph.GlyphPath(point1: 6, point2: 10)]
            
        case .Destroy, .Destruction:
            glyph.paths = [Glyph.GlyphPath(point1: 1, point2: 9)]
            
        case .Deteriorate, .Erode:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 5),
                           Glyph.GlyphPath(point1: 5, point2: 8)]
        case .Die:

            glyph.paths = [Glyph.GlyphPath(point1: 5, point2: 8),
                           Glyph.GlyphPath(point1: 5, point2: 9)]
        case .Difficult:
            glyph.paths = [Glyph.GlyphPath(point1: 2, point2: 4),
                           Glyph.GlyphPath(point1: 4, point2: 7),
                           Glyph.GlyphPath(point1: 5, point2: 6),
                           Glyph.GlyphPath(point1: 5, point2: 7)]
            
        case .Discover:
            glyph.paths = [Glyph.GlyphPath(point1: 2, point2: 9),
                           Glyph.GlyphPath(point1: 8, point2: 10),
                           Glyph.GlyphPath(point1: 9, point2: 10)]
            
        case .Distance, .Outside:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 1),
                           Glyph.GlyphPath(point1: 1, point2: 8)]
            
        case .Easy:
            glyph.paths = [Glyph.GlyphPath(point1: 4, point2: 6),
                           Glyph.GlyphPath(point1: 6, point2: 10)]
            
        case .End, .Close, .Finality:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 2),
                           Glyph.GlyphPath(point1: 0, point2: 10),
                           Glyph.GlyphPath(point1: 2, point2: 10)]
            
        case .EnlightenedA, .EnlightenmentA:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 2),
                           Glyph.GlyphPath(point1: 0, point2: 3),
                           Glyph.GlyphPath(point1: 2, point2: 9),
                           Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 5),
                           Glyph.GlyphPath(point1: 4, point2: 5),
                           Glyph.GlyphPath(point1: 9, point2: 10)]
            
        case .EnlightenedB, .EnlightenmentB:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 2),
                           Glyph.GlyphPath(point1: 0, point2: 3),
                           Glyph.GlyphPath(point1: 2, point2: 9),
                           Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 5),
                           Glyph.GlyphPath(point1: 4, point2: 5),
                           Glyph.GlyphPath(point1: 8, point2: 10),
                           Glyph.GlyphPath(point1: 9, point2: 10)]
            
        case .Equal:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 6),
                           Glyph.GlyphPath(point1: 4, point2: 7)]
            
        case .Escape:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 2),
                           Glyph.GlyphPath(point1: 2, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 6)]

        case .Evolution, .Success, .Progress:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 5),
                           Glyph.GlyphPath(point1: 3, point2: 5),
                           Glyph.GlyphPath(point1: 3, point2: 6)]
            
        case .Failure:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 5),
                           Glyph.GlyphPath(point1: 4, point2: 5),
                           Glyph.GlyphPath(point1: 4, point2: 7)]
            
        case .Fear:
            glyph.paths = [Glyph.GlyphPath(point1: 2, point2: 7),
                           Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 4, point2: 7)]
            
        case .Follow:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 4),
                           Glyph.GlyphPath(point1: 2, point2: 4),
                           Glyph.GlyphPath(point1: 2, point2: 9)]
            
        case .Forget:
            glyph.paths = [Glyph.GlyphPath(point1: 6, point2: 8)]
            
        case .Future, .ForwardTime:
            glyph.paths = [Glyph.GlyphPath(point1: 2, point2: 4),
                           Glyph.GlyphPath(point1: 4, point2: 7),
                           Glyph.GlyphPath(point1: 7, point2: 9)]
            
        case .Gain:
            glyph.paths = [Glyph.GlyphPath(point1: 1, point2: 6)]
            
        case .Government, .City, .Civilization, .Structure:
            glyph.paths = [Glyph.GlyphPath(point1: 1, point2: 3),
                           Glyph.GlyphPath(point1: 2, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 6),
                           Glyph.GlyphPath(point1: 4, point2: 7),
                           Glyph.GlyphPath(point1: 6, point2: 7)]
            
        case .Grow:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 8),
                           Glyph.GlyphPath(point1: 3, point2: 6)]

        case .Harm:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 3),
                           Glyph.GlyphPath(point1: 0, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 9),
                           Glyph.GlyphPath(point1: 4, point2: 5)]
            
        case .Harmony, .Peace:
            glyph.paths = [Glyph.GlyphPath(point1: 1, point2: 3),
                           Glyph.GlyphPath(point1: 1, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 7),
                           Glyph.GlyphPath(point1: 4, point2: 6),
                           Glyph.GlyphPath(point1: 6, point2: 10),
                           Glyph.GlyphPath(point1: 7, point2: 10)]
        case .Have:
            glyph.paths = [Glyph.GlyphPath(point1: 5, point2: 6),
                           Glyph.GlyphPath(point1: 5, point2: 7),
                           Glyph.GlyphPath(point1: 6, point2: 10)]

        case .Help:
            glyph.paths = [Glyph.GlyphPath(point1: 1, point2: 5),
                           Glyph.GlyphPath(point1: 5, point2: 6),
                           Glyph.GlyphPath(point1: 6, point2: 7)]

        case .Hide:
            glyph.paths = [Glyph.GlyphPath(point1: 2, point2: 4),
                           Glyph.GlyphPath(point1: 2, point2: 9),
                           Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 6, point2: 7)]

        case .I, .Me, .SelfA:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 10),
                           Glyph.GlyphPath(point1: 4, point2: 10)]

        case .Ignore:
            glyph.paths = [Glyph.GlyphPath(point1: 7, point2: 9)]

        case .Imperfect:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 5),
                           Glyph.GlyphPath(point1: 3, point2: 6),
                           Glyph.GlyphPath(point1: 4, point2: 6)]

        case .Improve:
            glyph.paths = [Glyph.GlyphPath(point1: 2, point2: 5),
                           Glyph.GlyphPath(point1: 5, point2: 7)]

        case .Impure:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 5),
                           Glyph.GlyphPath(point1: 3, point2: 6),
                           Glyph.GlyphPath(point1: 5, point2: 6),
                           Glyph.GlyphPath(point1: 5, point2: 10)]

        case .Journey:
            glyph.paths = [Glyph.GlyphPath(point1: 1, point2: 5),
                           Glyph.GlyphPath(point1: 1, point2: 8),
                           Glyph.GlyphPath(point1: 2, point2: 5),
                           Glyph.GlyphPath(point1: 8, point2: 10)]
        case .Knowledge:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 5),
                           Glyph.GlyphPath(point1: 3, point2: 10),
                           Glyph.GlyphPath(point1: 4, point2: 5),
                           Glyph.GlyphPath(point1: 4, point2: 10)]

        case .Lead:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 1),
                           Glyph.GlyphPath(point1: 1, point2: 8),
                           Glyph.GlyphPath(point1: 6, point2: 8),
                           Glyph.GlyphPath(point1: 6, point2: 10)]

        case .Legacy:
            glyph.paths = nil

        case .Less:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 5),
                           Glyph.GlyphPath(point1: 4, point2: 5)]

        case .Liberate:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 2),
                           Glyph.GlyphPath(point1: 2, point2: 5),
                           Glyph.GlyphPath(point1: 3, point2: 5),
                           Glyph.GlyphPath(point1: 3, point2: 8)]

        case .Lie:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 6),
                           Glyph.GlyphPath(point1: 3, point2: 7),
                           Glyph.GlyphPath(point1: 4, point2: 5),
                           Glyph.GlyphPath(point1: 4, point2: 7)]
        
        case .Live:
            glyph.paths = [Glyph.GlyphPath(point1: 1, point2: 5),
                           Glyph.GlyphPath(point1: 2, point2: 5)]

        case .LiveAgain, .Reincarnate:
            glyph.paths = nil

        case .Lose, .Loss:
            glyph.paths = [Glyph.GlyphPath(point1: 2, point2: 7)]

        case .MessageB:
            glyph.paths = [Glyph.GlyphPath(point1: 2, point2: 7),
                           Glyph.GlyphPath(point1: 3, point2: 7),
                           Glyph.GlyphPath(point1: 3, point2: 8)]

        case .MindB, .IdeaB, .ThoughtB:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 5),
                           Glyph.GlyphPath(point1: 3, point2: 6),
                           Glyph.GlyphPath(point1: 5, point2: 10),
                           Glyph.GlyphPath(point1: 6, point2: 10)]
        case .More:
            glyph.paths = [Glyph.GlyphPath(point1: 5, point2: 6),
                           Glyph.GlyphPath(point1: 5, point2: 7)]

        case .Mystery:
            glyph.paths = nil

        case .Nature:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 6),
                           Glyph.GlyphPath(point1: 4, point2: 7),
                           Glyph.GlyphPath(point1: 6, point2: 8),
                           Glyph.GlyphPath(point1: 7, point2: 9)]

        case .New:
            glyph.paths = [Glyph.GlyphPath(point1: 4, point2: 6),
                           Glyph.GlyphPath(point1: 6, point2: 9)]

        case .No, .Not, .Absent, .Inside:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 4, point2: 7)]

        case .Nourish:
            glyph.paths = [Glyph.GlyphPath(point1: 5, point2: 8),
                           Glyph.GlyphPath(point1: 5, point2: 10),
                           Glyph.GlyphPath(point1: 8, point2: 10)]

        case .Old:
            glyph.paths = [Glyph.GlyphPath(point1: 1, point2: 3),
                           Glyph.GlyphPath(point1: 3, point2: 6)]

        case .Open, .Accept:
            glyph.paths = [Glyph.GlyphPath(point1: 6, point2: 7),
                           Glyph.GlyphPath(point1: 6, point2: 10),
                           Glyph.GlyphPath(point1: 7, point2: 10)]

        case .OpenAll:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 1),
                           Glyph.GlyphPath(point1: 0, point2: 2),
                           Glyph.GlyphPath(point1: 1, point2: 8),
                           Glyph.GlyphPath(point1: 2, point2: 9),
                           Glyph.GlyphPath(point1: 6, point2: 7),
                           Glyph.GlyphPath(point1: 6, point2: 10),
                           Glyph.GlyphPath(point1: 7, point2: 10),
                           Glyph.GlyphPath(point1: 8, point2: 10),
                           Glyph.GlyphPath(point1: 9, point2: 10)]

        case .Opening, .Doorway, .Portal:
            glyph.paths = [Glyph.GlyphPath(point1: 1, point2: 3),
                           Glyph.GlyphPath(point1: 1, point2: 8),
                           Glyph.GlyphPath(point1: 2, point2: 4),
                           Glyph.GlyphPath(point1: 2, point2: 9),
                           Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 6, point2: 7),
                           Glyph.GlyphPath(point1: 6, point2: 8),
                           Glyph.GlyphPath(point1: 7, point2: 9)]

        case .Past:
            glyph.paths = [Glyph.GlyphPath(point1: 1, point2: 3),
                           Glyph.GlyphPath(point1: 3, point2: 6),
                           Glyph.GlyphPath(point1: 6, point2: 9)]

        case .Path:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 5),
                           Glyph.GlyphPath(point1: 5, point2: 8)]

        case .Perfection, .Balance:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 5),
                           Glyph.GlyphPath(point1: 5, point2: 8),
                           Glyph.GlyphPath(point1: 5, point2: 9),
                           Glyph.GlyphPath(point1: 8, point2: 10),
                           Glyph.GlyphPath(point1: 9, point2: 10)]
            

        case .Perspective:
            glyph.paths = nil

        case .Potential:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 5),
                           Glyph.GlyphPath(point1: 2, point2: 9),
                           Glyph.GlyphPath(point1: 5, point2: 9)]

        case .Presence:
            glyph.paths = nil

        case .Present, .Now:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 6),
                           Glyph.GlyphPath(point1: 4, point2: 7),
                           Glyph.GlyphPath(point1: 6, point2: 7)]

        case .Pure, .Purity:
            glyph.paths = [Glyph.GlyphPath(point1: 1, point2: 5),
                           Glyph.GlyphPath(point1: 4, point2: 5),
                           Glyph.GlyphPath(point1: 4, point2: 7),
                           Glyph.GlyphPath(point1: 5, point2: 7)]

        case .PursueA, .Aspiration:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 3),
                           Glyph.GlyphPath(point1: 0, point2: 4),
                           Glyph.GlyphPath(point1: 1, point2: 3)]

        case .PursueB, .Chase:
            glyph.paths = nil

        case .Question:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 6)]

        case .React:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 9)]

        case .Rebel:
            glyph.paths = [Glyph.GlyphPath(point1: 1, point2: 6),
                           Glyph.GlyphPath(point1: 2, point2: 6),
                           Glyph.GlyphPath(point1: 2, point2: 9)]

        case .Recharge:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 1),
                           Glyph.GlyphPath(point1: 0, point2: 5),
                           Glyph.GlyphPath(point1: 1, point2: 5)]

        case .Resist, .Resistance, .StruggleB:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 3),
                           Glyph.GlyphPath(point1: 0, point2: 10),
                           Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 6, point2: 10)]

        case .Restraint:
            glyph.paths = [Glyph.GlyphPath(point1: 1, point2: 9),
                           Glyph.GlyphPath(point1: 9, point2: 10)]

        case .Retreat:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 9)]

        case .Safety:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 8),
                           Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 4, point2: 9)]

        case .Save, .Rescure:
            glyph.paths = [Glyph.GlyphPath(point1: 1, point2: 7),
                           Glyph.GlyphPath(point1: 5, point2: 6),
                           Glyph.GlyphPath(point1: 5, point2: 7)]

        case .See:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 3)]

        case .Seek, .Search:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 6),
                           Glyph.GlyphPath(point1: 4, point2: 5),
                           Glyph.GlyphPath(point1: 6, point2: 7)]

        case .SelfB:
            glyph.paths = [Glyph.GlyphPath(point1: 8, point2: 10),
                           Glyph.GlyphPath(point1: 9, point2: 10)]

        case .Separate:
            glyph.paths = [Glyph.GlyphPath(point1: 1, point2: 3),
                           Glyph.GlyphPath(point1: 3, point2: 6),
                           Glyph.GlyphPath(point1: 4, point2: 6),
                           Glyph.GlyphPath(point1: 4, point2: 7),
                           Glyph.GlyphPath(point1: 7, point2: 9)]

        case .Shaper, .CollectiveBeing, .HumanB:
            glyph.paths = nil

        case .Shapers, .Collective:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 3),
                           Glyph.GlyphPath(point1: 0, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 6),
                           Glyph.GlyphPath(point1: 4, point2: 7),
                           Glyph.GlyphPath(point1: 6, point2: 8),
                           Glyph.GlyphPath(point1: 7, point2: 9)]

        case .Share:
            glyph.paths = [Glyph.GlyphPath(point1: 6, point2: 7),
                           Glyph.GlyphPath(point1: 6, point2: 8),
                           Glyph.GlyphPath(point1: 7, point2: 9),
                           Glyph.GlyphPath(point1: 7, point2: 10)]

        case .Simple:
            glyph.paths = [Glyph.GlyphPath(point1: 6, point2: 7)]

        case .Soul, .Spirit, .Life, .Force:
            glyph.paths = [Glyph.GlyphPath(point1: 4, point2: 5),
                           Glyph.GlyphPath(point1: 4, point2: 7),
                           Glyph.GlyphPath(point1: 5, point2: 10),
                           Glyph.GlyphPath(point1: 7, point2: 10)]

        case .Stability, .Stay:
            glyph.paths = [Glyph.GlyphPath(point1: 6, point2: 7),
                           Glyph.GlyphPath(point1: 6, point2: 8),
                           Glyph.GlyphPath(point1: 7, point2: 9)]

        case .Strong:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 6),
                           Glyph.GlyphPath(point1: 4, point2: 7),
                           Glyph.GlyphPath(point1: 6, point2: 7)]

        case .Them:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 6),
                           Glyph.GlyphPath(point1: 6, point2: 7)]
            
        case .Together:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 5),
                           Glyph.GlyphPath(point1: 4, point2: 8)]

        case .Truth:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 6),
                           Glyph.GlyphPath(point1: 3, point2: 7),
                           Glyph.GlyphPath(point1: 4, point2: 6),
                           Glyph.GlyphPath(point1: 4, point2: 7)]

        case .Use:
            glyph.paths = [Glyph.GlyphPath(point1: 2, point2: 7),
                           Glyph.GlyphPath(point1: 5, point2: 7)]

        case .Victory:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 3),
                           Glyph.GlyphPath(point1: 0, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 10),
                           Glyph.GlyphPath(point1: 4, point2: 10)]

        case .Want, .Desire:
            glyph.paths = [Glyph.GlyphPath(point1: 6, point2: 8),
                           Glyph.GlyphPath(point1: 6, point2: 10),
                           Glyph.GlyphPath(point1: 7, point2: 10)]

        case .We, .Us:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 4, point2: 10)]

        case .Weak:
            glyph.paths = [Glyph.GlyphPath(point1: 1, point2: 3),
                           Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 4, point2: 7)]

        case .Worth:
            glyph.paths = nil

        case .Xm:
            glyph.paths = [Glyph.GlyphPath(point1: 3, point2: 4),
                           Glyph.GlyphPath(point1: 3, point2: 6),
                           Glyph.GlyphPath(point1: 4, point2: 7),
                           Glyph.GlyphPath(point1: 5, point2: 6),
                           Glyph.GlyphPath(point1: 5, point2: 7)]

        case .You, .Other:
            glyph.paths = [Glyph.GlyphPath(point1: 0, point2: 6),
                           Glyph.GlyphPath(point1: 0, point2: 7),
                           Glyph.GlyphPath(point1: 6, point2: 7)]
            
        case .UserInteractionResult:
            glyph.paths = path
        }
        
        return glyph
    }
}
