//
//  GlyphGenerator.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/03/01.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit

class GlyphGenerator: NSObject {
    
    static func createGlyphWithType(type: GlyphType, path: Set<GlyphPath>? = nil) -> Glyph {
        let glyph = Glyph(type: type)
        Log.d("Type = \(type.rawValue)")
        assert(type != GlyphType.UserInteractionResult || path != nil, "")
        switch type {
        case .Abandon:
            glyph.paths = [GlyphPath(point1: 2, point2: 8),
                           GlyphPath(point1: 8, point2: 10)]
            
        case .Adapt, .Adjust:
            glyph.paths = [GlyphPath(point1: 1, point2: 6),
                           GlyphPath(point1: 5, point2: 6),
                           GlyphPath(point1: 5, point2: 7)]
            
        case .Advance:
            glyph.paths = [GlyphPath(point1: 0, point2: 8)]
        
        case .After:
            glyph.paths = [GlyphPath(point1: 2, point2: 4),
                           GlyphPath(point1: 4, point2: 5),
                           GlyphPath(point1: 5, point2: 7),
                           GlyphPath(point1: 7, point2: 9),
                           GlyphPath(point1: 2, point2: 9)]
            
        case .Again, .Repeat:
            glyph.paths = [GlyphPath(point1: 3, point2: 6),
                           GlyphPath(point1: 3, point2: 8),
                           GlyphPath(point1: 4, point2: 6),
                           GlyphPath(point1: 4, point2: 7)]
            
        case .All:
            glyph.paths = [GlyphPath(point1: 0, point2: 1),
                           GlyphPath(point1: 1, point2: 8),
                           GlyphPath(point1: 8, point2: 10),
                           GlyphPath(point1: 9, point2: 10),
                           GlyphPath(point1: 2, point2: 9),
                           GlyphPath(point1: 0, point2: 2)]
            
        case .Answer:
            glyph.paths = [GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 4, point2: 7),
                           GlyphPath(point1: 5, point2: 7)]
            
        case .Attack, .War:
            glyph.paths = [GlyphPath(point1: 0, point2: 8),
                           GlyphPath(point1: 0, point2: 9)]
            
        case .Avoid, .Struggle:
            glyph.paths = [GlyphPath(point1: 0, point2: 1),
                           GlyphPath(point1: 0, point2: 4),
                           GlyphPath(point1: 2, point2: 4),
                           GlyphPath(point1: 2, point2: 7)]
            
        case .Barrier, .Obstacle:
            glyph.paths = [GlyphPath(point1: 0, point2: 5),
                           GlyphPath(point1: 5, point2: 9)]

        case .Begin:
            glyph.paths = [GlyphPath(point1: 0, point2: 6),
                           GlyphPath(point1: 6, point2: 10),
                           GlyphPath(point1: 7, point2: 10)]

        case .Being, .HumanA:
            glyph.paths = [GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 3, point2: 6),
                           GlyphPath(point1: 4, point2: 7),
                           GlyphPath(point1: 6, point2: 10),
                           GlyphPath(point1: 7, point2: 10)]

        case .Body, .Shell:
            glyph.paths = [GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 3, point2: 5),
                           GlyphPath(point1: 4, point2: 5)]

        case .Breathe:
            glyph.paths = [GlyphPath(point1: 1, point2: 5),
                           GlyphPath(point1: 2, point2: 5)]

        case .Capture:
            glyph.paths = [GlyphPath(point1: 2, point2: 7),
                           GlyphPath(point1: 5, point2: 7),
                           GlyphPath(point1: 5, point2: 8),
                           GlyphPath(point1: 8, point2: 10)]

        case .Change, .Modify:
            glyph.paths = [GlyphPath(point1: 5, point2: 6),
                           GlyphPath(point1: 5, point2: 10),
                           GlyphPath(point1: 7, point2: 10)]

        case .Chaos, .Disorder:
            glyph.paths = [GlyphPath(point1: 0, point2: 1),
                           GlyphPath(point1: 0, point2: 2),
                           GlyphPath(point1: 1, point2: 8),
                           GlyphPath(point1: 2, point2: 4),
                           GlyphPath(point1: 4, point2: 5),
                           GlyphPath(point1: 5, point2: 6),
                           GlyphPath(point1: 6, point2: 10)]

        case .Clear:
            glyph.paths = [GlyphPath(point1: 0, point2: 10)]

        case .CloseAll:
            glyph.paths = [GlyphPath(point1: 0, point2: 1),
                           GlyphPath(point1: 0, point2: 2),
                           GlyphPath(point1: 0, point2: 10),
                           GlyphPath(point1: 1, point2: 8),
                           GlyphPath(point1: 2, point2: 9),
                           GlyphPath(point1: 8, point2: 10),
                           GlyphPath(point1: 9, point2: 10)]

        case .Complex:
            glyph.paths = [GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 3, point2: 5),
                           GlyphPath(point1: 5, point2: 6)]

        case .Conflict:
            glyph.paths = [GlyphPath(point1: 3, point2: 8),
                           GlyphPath(point1: 3, point2: 6),
                           GlyphPath(point1: 6, point2: 7),
                           GlyphPath(point1: 4, point2: 7),
                           GlyphPath(point1: 4, point2: 9)]
            
        case .Consequence:
            glyph.paths = nil
            
        case .Contemplate:
            glyph.paths = [GlyphPath(point1: 0, point2: 2),
                           GlyphPath(point1: 2, point2: 9),
                           GlyphPath(point1: 3, point2: 5),
                           GlyphPath(point1: 3, point2: 6),
                           GlyphPath(point1: 4, point2: 5),
                           GlyphPath(point1: 6, point2: 10),
                           GlyphPath(point1: 9, point2: 10)]
            
        case .Contract, .Reduce:
            glyph.paths = [GlyphPath(point1: 4, point2: 7),
                           GlyphPath(point1: 4, point2: 9)]
            
        case .Courage:
            glyph.paths = [GlyphPath(point1: 3, point2: 8),
                           GlyphPath(point1: 3, point2: 6),
                           GlyphPath(point1: 6, point2: 7)]
            
        case .Create, .Creation:
            glyph.paths = [GlyphPath(point1: 2, point2: 8)]
            
            
        case .CreativityA:
            glyph.paths = nil
            
        case .CreativityB, .MindA, .ThoughtA, .IdeaA:
            glyph.paths = [GlyphPath(point1: 1, point2: 8),
                           GlyphPath(point1: 1, point2: 9),
                           GlyphPath(point1: 2, point2: 4),
                           GlyphPath(point1: 2, point2: 9),
                           GlyphPath(point1: 6, point2: 8)]
            
        case .Danger:
            glyph.paths = [GlyphPath(point1: 0, point2: 3),
                           GlyphPath(point1: 3, point2: 5),
                           GlyphPath(point1: 5, point2: 10)]
            
        case .Data, .Signal, .MessageA:
            glyph.paths = [GlyphPath(point1: 0, point2: 4),
                           GlyphPath(point1: 4, point2: 6),
                           GlyphPath(point1: 6, point2: 10)]
            
        case .Defend:

            glyph.paths = [GlyphPath(point1: 1, point2: 10),
                           GlyphPath(point1: 2, point2: 10)]
        case .Destination:
            glyph.paths = nil
            
        case .Destiny:
            glyph.paths = [GlyphPath(point1: 3, point2: 5),
                           GlyphPath(point1: 4, point2: 5),
                           GlyphPath(point1: 4, point2: 7),
                           GlyphPath(point1: 6, point2: 7),
                           GlyphPath(point1: 6, point2: 10)]
            
        case .Destroy, .Destruction:
            glyph.paths = [GlyphPath(point1: 1, point2: 9)]
            
        case .Deteriorate, .Erode:
            glyph.paths = [GlyphPath(point1: 3, point2: 5),
                           GlyphPath(point1: 5, point2: 8)]
        case .Die:

            glyph.paths = [GlyphPath(point1: 5, point2: 8),
                           GlyphPath(point1: 5, point2: 9)]
        case .Difficult:
            glyph.paths = [GlyphPath(point1: 2, point2: 4),
                           GlyphPath(point1: 4, point2: 7),
                           GlyphPath(point1: 5, point2: 6),
                           GlyphPath(point1: 5, point2: 7)]
            
        case .Discover:
            glyph.paths = [GlyphPath(point1: 2, point2: 9),
                           GlyphPath(point1: 8, point2: 10),
                           GlyphPath(point1: 9, point2: 10)]
            
        case .Distance, .Outside:
            glyph.paths = [GlyphPath(point1: 0, point2: 1),
                           GlyphPath(point1: 1, point2: 8)]
            
        case .Easy:
            glyph.paths = [GlyphPath(point1: 4, point2: 6),
                           GlyphPath(point1: 6, point2: 10)]
            
        case .End, .Close, .Finality:
            glyph.paths = [GlyphPath(point1: 0, point2: 2),
                           GlyphPath(point1: 0, point2: 10),
                           GlyphPath(point1: 2, point2: 10)]
            
        case .EnlightenedA, .EnlightenmentA:
            glyph.paths = [GlyphPath(point1: 0, point2: 2),
                           GlyphPath(point1: 0, point2: 3),
                           GlyphPath(point1: 2, point2: 9),
                           GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 3, point2: 5),
                           GlyphPath(point1: 4, point2: 5),
                           GlyphPath(point1: 9, point2: 10)]
            
        case .EnlightenedB, .EnlightenmentB:
            glyph.paths = [GlyphPath(point1: 0, point2: 2),
                           GlyphPath(point1: 0, point2: 3),
                           GlyphPath(point1: 2, point2: 9),
                           GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 3, point2: 5),
                           GlyphPath(point1: 4, point2: 5),
                           GlyphPath(point1: 8, point2: 10),
                           GlyphPath(point1: 9, point2: 10)]
            
        case .Equal:
            glyph.paths = [GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 3, point2: 6),
                           GlyphPath(point1: 4, point2: 7)]
            
        case .Escape:
            glyph.paths = [GlyphPath(point1: 0, point2: 2),
                           GlyphPath(point1: 2, point2: 4),
                           GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 3, point2: 6)]

        case .Evolution, .Success, .Progress:
            glyph.paths = [GlyphPath(point1: 0, point2: 5),
                           GlyphPath(point1: 3, point2: 5),
                           GlyphPath(point1: 3, point2: 6)]
            
        case .Failure:
            glyph.paths = [GlyphPath(point1: 0, point2: 5),
                           GlyphPath(point1: 4, point2: 5),
                           GlyphPath(point1: 4, point2: 7)]
            
        case .Fear:
            glyph.paths = [GlyphPath(point1: 2, point2: 7),
                           GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 4, point2: 7)]
            
        case .Follow:
            glyph.paths = [GlyphPath(point1: 0, point2: 4),
                           GlyphPath(point1: 2, point2: 4),
                           GlyphPath(point1: 2, point2: 9)]
            
        case .Forget:
            glyph.paths = [GlyphPath(point1: 6, point2: 8)]
            
        case .Future, .ForwardTime:
            glyph.paths = [GlyphPath(point1: 2, point2: 4),
                           GlyphPath(point1: 4, point2: 7),
                           GlyphPath(point1: 7, point2: 9)]
            
        case .Gain:
            glyph.paths = [GlyphPath(point1: 1, point2: 6)]
            
        case .Government, .City, .Civilization, .Structure:
            glyph.paths = [GlyphPath(point1: 1, point2: 3),
                           GlyphPath(point1: 2, point2: 4),
                           GlyphPath(point1: 3, point2: 6),
                           GlyphPath(point1: 4, point2: 7),
                           GlyphPath(point1: 6, point2: 7)]
            
        case .Grow:
            glyph.paths = [GlyphPath(point1: 3, point2: 8),
                           GlyphPath(point1: 3, point2: 6)]

        case .Harm:
            glyph.paths = [GlyphPath(point1: 0, point2: 3),
                           GlyphPath(point1: 0, point2: 4),
                           GlyphPath(point1: 3, point2: 9),
                           GlyphPath(point1: 4, point2: 5)]
            
        case .Harmony, .Peace:
            glyph.paths = [GlyphPath(point1: 0, point2: 3),
                           GlyphPath(point1: 0, point2: 4),
                           GlyphPath(point1: 3, point2: 7),
                           GlyphPath(point1: 4, point2: 6),
                           GlyphPath(point1: 6, point2: 10),
                           GlyphPath(point1: 7, point2: 10)]
        case .Have:
            glyph.paths = [GlyphPath(point1: 5, point2: 6),
                           GlyphPath(point1: 5, point2: 7),
                           GlyphPath(point1: 6, point2: 10)]

        case .Help:
            glyph.paths = [GlyphPath(point1: 1, point2: 5),
                           GlyphPath(point1: 5, point2: 6),
                           GlyphPath(point1: 6, point2: 7)]

        case .Hide:
            glyph.paths = [GlyphPath(point1: 2, point2: 4),
                           GlyphPath(point1: 2, point2: 7),
                           GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 6, point2: 7)]

        case .I, .Me, .SelfA:
            glyph.paths = [GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 3, point2: 10),
                           GlyphPath(point1: 4, point2: 10)]

        case .Ignore:
            glyph.paths = [GlyphPath(point1: 7, point2: 9)]

        case .Imperfect:
            glyph.paths = [GlyphPath(point1: 3, point2: 5),
                           GlyphPath(point1: 3, point2: 6),
                           GlyphPath(point1: 4, point2: 6)]

        case .Improve:
            glyph.paths = [GlyphPath(point1: 2, point2: 5),
                           GlyphPath(point1: 5, point2: 7)]

        case .Impure:
            glyph.paths = [GlyphPath(point1: 3, point2: 5),
                           GlyphPath(point1: 3, point2: 6),
                           GlyphPath(point1: 5, point2: 6),
                           GlyphPath(point1: 5, point2: 10)]

        case .Journey:
            glyph.paths = [GlyphPath(point1: 1, point2: 5),
                           GlyphPath(point1: 1, point2: 8),
                           GlyphPath(point1: 2, point2: 5),
                           GlyphPath(point1: 8, point2: 10)]
        case .Knowledge:
            glyph.paths = [GlyphPath(point1: 3, point2: 5),
                           GlyphPath(point1: 3, point2: 10),
                           GlyphPath(point1: 4, point2: 5),
                           GlyphPath(point1: 4, point2: 10)]

        case .Lead:
            glyph.paths = [GlyphPath(point1: 0, point2: 1),
                           GlyphPath(point1: 1, point2: 8),
                           GlyphPath(point1: 6, point2: 8),
                           GlyphPath(point1: 6, point2: 10)]

        case .Legacy:
            glyph.paths = nil

        case .Less:
            glyph.paths = [GlyphPath(point1: 3, point2: 5),
                           GlyphPath(point1: 4, point2: 5)]

        case .Liberate:
            glyph.paths = [GlyphPath(point1: 0, point2: 2),
                           GlyphPath(point1: 2, point2: 5),
                           GlyphPath(point1: 3, point2: 5),
                           GlyphPath(point1: 3, point2: 8)]

        case .Lie:
            glyph.paths = [GlyphPath(point1: 3, point2: 6),
                           GlyphPath(point1: 3, point2: 7),
                           GlyphPath(point1: 4, point2: 5),
                           GlyphPath(point1: 4, point2: 7)]
        
        case .Live:
            glyph.paths = [GlyphPath(point1: 1, point2: 5),
                           GlyphPath(point1: 2, point2: 5)]

        case .LiveAgain, .Reincarnate:
            glyph.paths = nil

        case .Lose, .Loss:
            glyph.paths = [GlyphPath(point1: 2, point2: 7)]

        case .MessageB:
            glyph.paths = [GlyphPath(point1: 2, point2: 7),
                           GlyphPath(point1: 3, point2: 7),
                           GlyphPath(point1: 3, point2: 8)]

        case .MindB, .IdeaB, .ThoughtB:
            glyph.paths = [GlyphPath(point1: 3, point2: 5),
                           GlyphPath(point1: 3, point2: 6),
                           GlyphPath(point1: 5, point2: 10),
                           GlyphPath(point1: 6, point2: 10)]
        case .More:
            glyph.paths = [GlyphPath(point1: 5, point2: 6),
                           GlyphPath(point1: 5, point2: 7)]

        case .Mystery:
            glyph.paths = nil

        case .Nature:
            glyph.paths = [GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 3, point2: 6),
                           GlyphPath(point1: 4, point2: 7),
                           GlyphPath(point1: 6, point2: 8),
                           GlyphPath(point1: 7, point2: 9)]

        case .New:
            glyph.paths = [GlyphPath(point1: 4, point2: 7),
                           GlyphPath(point1: 7, point2: 9)]

        case .No, .Not, .Absent, .Inside:
            glyph.paths = [GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 4, point2: 7)]

        case .Nourish:
            glyph.paths = [GlyphPath(point1: 5, point2: 8),
                           GlyphPath(point1: 5, point2: 10),
                           GlyphPath(point1: 8, point2: 10)]

        case .Old:
            glyph.paths = [GlyphPath(point1: 1, point2: 3),
                           GlyphPath(point1: 3, point2: 6)]

        case .Open, .Accept:
            glyph.paths = [GlyphPath(point1: 6, point2: 7),
                           GlyphPath(point1: 6, point2: 10),
                           GlyphPath(point1: 7, point2: 10)]

        case .OpenAll:
            glyph.paths = [GlyphPath(point1: 0, point2: 1),
                           GlyphPath(point1: 0, point2: 2),
                           GlyphPath(point1: 1, point2: 8),
                           GlyphPath(point1: 2, point2: 9),
                           GlyphPath(point1: 6, point2: 7),
                           GlyphPath(point1: 6, point2: 10),
                           GlyphPath(point1: 7, point2: 10),
                           GlyphPath(point1: 8, point2: 10),
                           GlyphPath(point1: 9, point2: 10)]

        case .Opening, .Doorway, .Portal:
            glyph.paths = [GlyphPath(point1: 1, point2: 3),
                           GlyphPath(point1: 1, point2: 8),
                           GlyphPath(point1: 2, point2: 4),
                           GlyphPath(point1: 2, point2: 9),
                           GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 6, point2: 7),
                           GlyphPath(point1: 6, point2: 8),
                           GlyphPath(point1: 7, point2: 9)]

        case .Past:
            glyph.paths = [GlyphPath(point1: 1, point2: 3),
                           GlyphPath(point1: 3, point2: 6),
                           GlyphPath(point1: 6, point2: 8)]

        case .Path:
            glyph.paths = [GlyphPath(point1: 0, point2: 5),
                           GlyphPath(point1: 5, point2: 8)]

        case .Perfection, .Balance:
            glyph.paths = [GlyphPath(point1: 0, point2: 5),
                           GlyphPath(point1: 5, point2: 8),
                           GlyphPath(point1: 5, point2: 9),
                           GlyphPath(point1: 8, point2: 10),
                           GlyphPath(point1: 9, point2: 10)]
            

        case .Perspective:
            glyph.paths = nil

        case .Potential:
            glyph.paths = [GlyphPath(point1: 0, point2: 5),
                           GlyphPath(point1: 2, point2: 9),
                           GlyphPath(point1: 5, point2: 9)]

        case .Presence:
            glyph.paths = nil

        case .Present, .Now:
            glyph.paths = [GlyphPath(point1: 3, point2: 6),
                           GlyphPath(point1: 4, point2: 7),
                           GlyphPath(point1: 6, point2: 7)]

        case .Pure, .Purity:
            glyph.paths = [GlyphPath(point1: 0, point2: 5),
                           GlyphPath(point1: 4, point2: 5),
                           GlyphPath(point1: 4, point2: 7),
                           GlyphPath(point1: 5, point2: 7)]

        case .PursueA, .Aspiration:
            glyph.paths = [GlyphPath(point1: 0, point2: 3),
                           GlyphPath(point1: 0, point2: 4),
                           GlyphPath(point1: 1, point2: 3)]

        case .PursueB, .Chase:
            glyph.paths = nil

        case .Question:
            glyph.paths = [GlyphPath(point1: 0, point2: 4),
                           GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 3, point2: 6)]

        case .React:
            glyph.paths = [GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 3, point2: 9)]

        case .Rebel:
            glyph.paths = [GlyphPath(point1: 1, point2: 6),
                           GlyphPath(point1: 2, point2: 6),
                           GlyphPath(point1: 2, point2: 9)]

        case .Recharge:
            glyph.paths = [GlyphPath(point1: 0, point2: 1),
                           GlyphPath(point1: 0, point2: 5),
                           GlyphPath(point1: 1, point2: 5)]

        case .Resist, .Resistance, .StruggleB:
            glyph.paths = [GlyphPath(point1: 0, point2: 3),
                           GlyphPath(point1: 0, point2: 10),
                           GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 6, point2: 10)]

        case .Restraint:
            glyph.paths = [GlyphPath(point1: 1, point2: 9),
                           GlyphPath(point1: 9, point2: 10)]

        case .Retreat:
            glyph.paths = [GlyphPath(point1: 0, point2: 9)]

        case .Safety:
            glyph.paths = [GlyphPath(point1: 3, point2: 8),
                           GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 4, point2: 9)]

        case .Save, .Rescue:
            glyph.paths = [GlyphPath(point1: 2, point2: 7),
                           GlyphPath(point1: 5, point2: 6),
                           GlyphPath(point1: 5, point2: 7)]

        case .See:
            glyph.paths = [GlyphPath(point1: 0, point2: 3)]

        case .Seek, .Search:
            glyph.paths = [GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 3, point2: 6),
                           GlyphPath(point1: 4, point2: 5),
                           GlyphPath(point1: 6, point2: 7)]

        case .SelfB:
            glyph.paths = [GlyphPath(point1: 8, point2: 10),
                           GlyphPath(point1: 9, point2: 10)]

        case .Separate:
            glyph.paths = [GlyphPath(point1: 1, point2: 3),
                           GlyphPath(point1: 3, point2: 6),
                           GlyphPath(point1: 4, point2: 6),
                           GlyphPath(point1: 4, point2: 7),
                           GlyphPath(point1: 7, point2: 9)]

        case .Shaper, .CollectiveBeing, .HumanB:
            glyph.paths = nil

        case .Shapers, .Collective:
            glyph.paths = [GlyphPath(point1: 0, point2: 3),
                           GlyphPath(point1: 0, point2: 4),
                           GlyphPath(point1: 3, point2: 6),
                           GlyphPath(point1: 4, point2: 7),
                           GlyphPath(point1: 6, point2: 8),
                           GlyphPath(point1: 7, point2: 9)]

        case .Share:
            glyph.paths = [GlyphPath(point1: 6, point2: 7),
                           GlyphPath(point1: 6, point2: 8),
                           GlyphPath(point1: 7, point2: 9),
                           GlyphPath(point1: 8, point2: 10)]

        case .Simple:
            glyph.paths = [GlyphPath(point1: 6, point2: 7)]

        case .Soul, .Spirit, .Life, .Force:
            glyph.paths = [GlyphPath(point1: 4, point2: 5),
                           GlyphPath(point1: 4, point2: 7),
                           GlyphPath(point1: 5, point2: 10),
                           GlyphPath(point1: 7, point2: 10)]

        case .Stability, .Stay:
            glyph.paths = [GlyphPath(point1: 6, point2: 7),
                           GlyphPath(point1: 6, point2: 8),
                           GlyphPath(point1: 7, point2: 9)]

        case .Strong:
            glyph.paths = [GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 3, point2: 6),
                           GlyphPath(point1: 4, point2: 7),
                           GlyphPath(point1: 6, point2: 7)]

        case .Them:
            glyph.paths = [GlyphPath(point1: 0, point2: 6),
                           GlyphPath(point1: 6, point2: 7)]
            
        case .Together:
            glyph.paths = [GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 3, point2: 5),
                           GlyphPath(point1: 4, point2: 8)]

        case .Truth:
            glyph.paths = [GlyphPath(point1: 3, point2: 6),
                           GlyphPath(point1: 3, point2: 7),
                           GlyphPath(point1: 4, point2: 6),
                           GlyphPath(point1: 4, point2: 7)]

        case .Use:
            glyph.paths = [GlyphPath(point1: 2, point2: 7),
                           GlyphPath(point1: 5, point2: 7)]

        case .Victory:
            glyph.paths = [GlyphPath(point1: 0, point2: 3),
                           GlyphPath(point1: 0, point2: 4),
                           GlyphPath(point1: 3, point2: 10),
                           GlyphPath(point1: 4, point2: 10)]

        case .Want, .Desire:
            glyph.paths = [GlyphPath(point1: 6, point2: 8),
                           GlyphPath(point1: 6, point2: 10),
                           GlyphPath(point1: 7, point2: 10)]

        case .We, .Us:
            glyph.paths = [GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 4, point2: 10)]

        case .Weak:
            glyph.paths = [GlyphPath(point1: 1, point2: 3),
                           GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 4, point2: 7)]

        case .Worth:
            glyph.paths = nil

        case .Xm:
            glyph.paths = [GlyphPath(point1: 3, point2: 4),
                           GlyphPath(point1: 3, point2: 6),
                           GlyphPath(point1: 4, point2: 7),
                           GlyphPath(point1: 5, point2: 6),
                           GlyphPath(point1: 5, point2: 7)]

        case .You, .Other:
            glyph.paths = [GlyphPath(point1: 0, point2: 6),
                           GlyphPath(point1: 0, point2: 7),
                           GlyphPath(point1: 6, point2: 7)]
            
        case .UserInteractionResult:
            glyph.paths = path
        }
        
        return glyph
    }
}
