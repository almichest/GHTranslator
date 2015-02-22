//
//  Glyph.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/02/22.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit

enum GlyphType: String {
    case Abandon
    case Adapt
    case Advance
    case AgainRepeat
    case All
    case Answer
    case AttackWar
    case AvoidStruggle
    case BarrierObstacle
    case Begin
    case BeingHuman
    case BodyShell
    case Breathe
    case Capture
    case ChangeModify
    case ChaosDisorder
    case Clear
    case CloseAll
    case Complex
    case Conflict
    case Consequence
    case Contemplate
    case ContractRecuce
    case Courage
    case CreateCreation
    case Creativity
    case CreativityMindThoughtIdea
    case Danger
    case DataSignalMessage
    case Defend
    case Destination
    case Destiny
    case DestroyDestruction
    case DeteriorateErode
    case Die
    case Difficult
    case Discover
    case DistanceOutside
    case Easy
    case EndCloseFinality
    case EnlightenedEnlightenment
    case EnlightenedEnlightenmentB
    case Equal
    case Escape
    case EvolutionSuccessProgress
    case Failure
    case Fear
    case Follow
    case Forget
    case FutureForwardTime
    case Gain
    case GovernmentCityCivilizationStructure
    case Grow
    case Harm
    case HarmonyPeace
    case Have
    case Help
    case Hide
    case IMeSelf
    case Ignore
    case Imperfect
    case Improve
    case Impure
    case Journey
    case Knowledge
    case Lead
    case Legacy
    case Less
    case Liberate
    case Lie
    case LiveAgainReincarnate
    case LoseLoss
    case Message
    case MindIdeaThought
    case More
    case Mystery
    case Nature
    case New
    case NoNotAbsentInside
    case Nourish
    case Old
    case OpenAccept
    case OpenAll
    case OpeningDoorwayPortal
    case Past
    case Path
    case PerfectionBalance
    case Perspective
    case Potential
    case Presence
    case PresentNow
    case PurePurity
    case PursueAspiration
    case PursueChase
    case Question
    case React
    case Rebel
    case Recharge
    case ResistResistanceStruggle
    case Restraint
    case Retreat
    case Safety
    case SaveRescure
    case See
    case SeekSearch
    case Self_
    case Separate
    case ShaperCollectiveBeingHuman
    case ShapersCollective
    case Shere
    case Simple
    case SoulSpiritLifeForce
    case StabilityStay
    case Strong
    case Together
    case Truth
    case Use
    case Victory
    case WantDesire
    case WeUs
    case Weak
    case Worth
    case Xm
    case YouOther
}

public class Glyph: NSObject {
    
    
    var paths: [Path]?
    let type: GlyphType
    
    init(type: GlyphType) {
        self.type = type
        super.init()
        
        self.prepare()
    }
    
    private func prepare() {
        
    }
    
    /* Internal class */
    public class Path: NSObject {
        
        /* Point2 must be larger than Point1. */
        let point1: Int
        let point2: Int
        
        init(point1: Int, point2: Int) {
            assert(point2 > point1, "Point2 must be greater than Point1")
            self.point1 = point1
            self.point2 = point2
        }
        
        override public func isEqual(object: AnyObject?) -> Bool {
            var another = object as Path
            return ((self.point1 == another.point1) && (self.point2 == another.point2));
        }
    }
    
}
