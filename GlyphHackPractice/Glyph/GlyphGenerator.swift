//
//  GlyphGenerator.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/03/01.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit

class GlyphGenerator: NSObject {
    
    class func createGlyphWithType(type: GlyphType, path: Set<Glyph.Path>) -> Glyph {
        let glyph = Glyph(type: type)
        switch type {
        case .Abandon:
            glyph.paths = [Glyph.Path(point1: 2, point2: 4), Glyph.Path(point1: 4, point2: 5), Glyph.Path(point1: 5, point2: 6), Glyph.Path(point1: 6, point2: 8), Glyph.Path(point1: 8, point2: 10)]
            
        case .Adapt:
            glyph.paths = [Glyph.Path(point1: 1, point2: 6), Glyph.Path(point1: 5, point2: 6), Glyph.Path(point1: 5, point2: 7)]
            
        case .Advance:
            glyph.paths = [Glyph.Path(point1: 0, point2: 3), Glyph.Path(point1: 3, point2: 8)]
        
        case .After:
            glyph.paths = [Glyph.Path(point1: 2, point2: 4), Glyph.Path(point1: 4, point2: 5), Glyph.Path(point1: 5, point2: 7), Glyph.Path(point1: 7, point2: 9), Glyph.Path(point1: 2, point2: 9)]
            
        case .Again, .Repeat:
            glyph.paths = [Glyph.Path(point1: 3, point2: 8), Glyph.Path(point1: 3, point2: 6), Glyph.Path(point1: 5, point2: 6), Glyph.Path(point1: 4, point2: 5), Glyph.Path(point1: 4, point2: 6)]
            
        case .All:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1), Glyph.Path(point1: 1, point2: 8), Glyph.Path(point1: 8, point2: 10), Glyph.Path(point1: 9, point2: 10), Glyph.Path(point1: 2, point2: 9), Glyph.Path(point1: 0, point2: 2)]
            
        case .Answer:
            glyph.paths = [Glyph.Path(point1: 3, point2: 4), Glyph.Path(point1: 4, point2: 7), Glyph.Path(point1: 5, point2: 7)]
            
        case .Attack, .War:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
            
        case .Avoid, .Struggle:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
            
        case .Barrier, .Obstacle:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Begin:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Being, .HumanA:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Body, .Shell:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Breathe:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Capture:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Change, .Modify:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Chaos, .Disorder:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Clear:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .CloseAll:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Complex:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Conflict:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
            
        case .Consequence:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
            
        case .Contemplate:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
            
        case .Contract, .Reduce:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
            
        case .Courage:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
            
        case .Create, .Creation:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
            
        case .CreativityA:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
            
        case .CreativityB, .MindA, .ThoughtA, .IdeaA:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
            
        case .Danger:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Data, .Signal, .MessageA:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Defend:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Destination:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Destiny:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Destroy, .Destruction:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Deteriorate, .Erode:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Die:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Difficult:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Discover:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Distance, .Outside:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Easy:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .End, .Close, .Finality:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .EnlightenedA, .EnlightenmentA:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .EnlightenedB, .EnlightenmentB:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Equal:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Escape:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Evolution, .Success, .Progress:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Failure:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Fear:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Follow:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Forget:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Future, .ForwardTime:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Gain:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Government, .City, .Civilization, .Structure:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Grow:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Harm:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Harmony, .Peace:

            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
        case .Have:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Help:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Hide:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .I, .Me, .SelfA:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Ignore:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Imperfect:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Improve:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Impure:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Journey:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Knowledge:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Lead:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Legacy:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Less:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Liberate:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Lie:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .LiveAgain, .Reincarnate:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Lose, .Loss:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .MessageB:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .MindB, .IdeaB, .ThoughtB:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .More:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Mystery:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Nature:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .New:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .No, .Not, .Absent, .Inside:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Nourish:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Old:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Open, .Accept:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .OpenAll:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Opening, .Doorway, .Portal:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Past:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Path:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Perfection, .Balance:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Perspective:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Potential:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Presence:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Present, .Now:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Pure, .Purity:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .PursueA, .Aspiration:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .PursueB, .Chase:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Question:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .React:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Rebel:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Recharge:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Resist, .Resistance, .StruggleB:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Restraint:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Retreat:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Safety:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Save, .Rescure:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .See:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Seek, .Search:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .SelfB:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Separate:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Shaper, .CollectiveBeing, .HumanB:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Shapers, .Collective:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Shere:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Simple:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Soul, .Spirit, .Life, .Force:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Stability, .Stay:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Strong:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Together:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Truth:
            glyph.paths = [Glyph.Path(point1: 3, point2: 5),
                           Glyph.Path(point1: 3, point2: 6),
                           Glyph.Path(point1: 4, point2: 5),
                           Glyph.Path(point1: 4, point2: 7),
                           Glyph.Path(point1: 5, point2: 6),
                           Glyph.Path(point1: 5, point2: 7)]

        case .Use:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Victory:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Want, .Desire:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .We, .Us:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Weak:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Worth:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .Xm:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]

        case .You, .Other:
            glyph.paths = [Glyph.Path(point1: 0, point2: 1)]
            
        case .UserInteractionResult:
            glyph.paths = path
        }
        
        return glyph
    }
}
