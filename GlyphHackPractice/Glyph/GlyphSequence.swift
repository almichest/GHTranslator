//
//  GlyphSequence.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/03/26.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit

enum GlyphSequenceCount:Int {
    case One    = 1
    case Two    = 2
    case Three  = 3
    case Four   = 4
    case Five   = 5
}

class GlyphSequence: NSObject {
   
    let count: GlyphSequenceCount
    
    init(count: GlyphSequenceCount) {
        self.count = count
        super.init()
    }
    
    static let twoItemsSequences:   [[GlyphType]] = [[GlyphType.Advance, GlyphType.EnlightenedA],
                                                     [GlyphType.Avoid, GlyphType.Conflict],
                                                     [GlyphType.Change, GlyphType.Now],
                                                     [GlyphType.Discover, GlyphType.Portal],
                                                     [GlyphType.Escape, GlyphType.Together],
                                                     [GlyphType.Follow, GlyphType.Journey],
                                                     [GlyphType.Gain, GlyphType.Safety],
                                                     [GlyphType.Hide, GlyphType.Truth],
                                                     [GlyphType.Nourish, GlyphType.Journey],
                                                     [GlyphType.OpenAll, GlyphType.Portal],
                                                     [GlyphType.Path, GlyphType.Harmony],
                                                     [GlyphType.Path, GlyphType.Perfection],
                                                     [GlyphType.Pure, GlyphType.Truth],
                                                     [GlyphType.Question, GlyphType.All],
                                                     [GlyphType.Question, GlyphType.Truth],
                                                     [GlyphType.Question, GlyphType.Attack],
                                                     [GlyphType.Search, GlyphType.Potential],
                                                     [GlyphType.Strong, GlyphType.CreativityB],
                                                     [GlyphType.Strong, GlyphType.Soul]]
    
    static let threeItemsSequences: [[GlyphType]] = [[GlyphType.Adapt, GlyphType.HumanA, GlyphType.Weak],
                                                     [GlyphType.Advance, GlyphType.HumanA, GlyphType.EnlightenedA],
                                                     [GlyphType.Advance, GlyphType.HumanA, GlyphType.Resistance],
                                                     [GlyphType.Advance, GlyphType.Purity, GlyphType.Truth],
                                                     [GlyphType.Again, GlyphType.Journey, GlyphType.Outside],
                                                     [GlyphType.All, GlyphType.Civilization, GlyphType.Chaos],
                                                     [GlyphType.All, GlyphType.Xm, GlyphType.Liberate],
                                                     [GlyphType.Answer, GlyphType.Again, GlyphType.Avoid],
                                                     [GlyphType.Attack, GlyphType.Create, GlyphType.Danger],
                                                     [GlyphType.Attack, GlyphType.Destruction, GlyphType.Future],
                                                     [GlyphType.Attack, GlyphType.Difficult, GlyphType.Future],
                                                     [GlyphType.Attack, GlyphType.Shaper, GlyphType.Chaos],
                                                     [GlyphType.Attack, GlyphType.Shaper, GlyphType.Evolution],
                                                     [GlyphType.Attack, GlyphType.Shaper, GlyphType.Portal],
                                                     [GlyphType.Avoid, GlyphType.Attack, GlyphType.Chaos],
                                                     [GlyphType.Avoid, GlyphType.Chaos, GlyphType.Soul],
                                                     [GlyphType.Avoid, GlyphType.Complex, GlyphType.Conflict],
                                                     [GlyphType.Avoid, GlyphType.Complex, GlyphType.Soul],
                                                     [GlyphType.Avoid, GlyphType.Destiny, GlyphType.Lie],
                                                     [GlyphType.Avoid, GlyphType.Impure, GlyphType.Evolution],
                                                     [GlyphType.Avoid, GlyphType.Pure, GlyphType.Chaos],
                                                     [GlyphType.Avoid, GlyphType.Attack, GlyphType.Chaos],
                                                     [GlyphType.Capture, GlyphType.Shapers, GlyphType.Portal],
                                                     [GlyphType.Capture, GlyphType.Xm, GlyphType.Portal],
                                                     [GlyphType.Change, GlyphType.HumanA, GlyphType.Future],
                                                     [GlyphType.Civilization, GlyphType.Attack, GlyphType.Chaos],
                                                     [GlyphType.Complex, GlyphType.Journey, GlyphType.Future],
                                                     [GlyphType.Contemplate, GlyphType.Journey, GlyphType.Outside],
                                                     [GlyphType.Contemplate, GlyphType.Potential, GlyphType.Perfection],
                                                     [GlyphType.Contemplate, GlyphType.Potential, GlyphType.Journey],
                                                     [GlyphType.Contemplate, GlyphType.Potential, GlyphType.Perfection],
                                                     [GlyphType.Courage, GlyphType.Destiny, GlyphType.Rebel],
                                                     [GlyphType.Create, GlyphType.Future, GlyphType.Journey],
                                                     [GlyphType.Danger, GlyphType.Change, GlyphType.Past],
                                                     [GlyphType.Defend, GlyphType.Search, GlyphType.Safety],
                                                     [GlyphType.Destroy, GlyphType.Civilization, GlyphType.Danger],
                                                     [GlyphType.Destroy, GlyphType.Destiny, GlyphType.Barrier],
                                                     [GlyphType.Destroy, GlyphType.Difficult, GlyphType.Barrier],
                                                     [GlyphType.Destroy, GlyphType.Impure, GlyphType.Truth],
                                                     [GlyphType.Destroy, GlyphType.Weak, GlyphType.Civilization],
                                                     [GlyphType.Deteriorate, GlyphType.Advance, GlyphType.Now],
                                                     [GlyphType.Discover, GlyphType.Harmony, GlyphType.Equal],
                                                     [GlyphType.Discover, GlyphType.Portal, GlyphType.Truth],
                                                     [GlyphType.Discover, GlyphType.Pure, GlyphType.Truth],
                                                     [GlyphType.Discover, GlyphType.Resistance, GlyphType.Truth],
                                                     [GlyphType.Discover, GlyphType.Safety, GlyphType.Civilization],
                                                     [GlyphType.Discover, GlyphType.Shapers, GlyphType.Civilization],
                                                     [GlyphType.Discover, GlyphType.Shapers, GlyphType.EnlightenedA],
                                                     [GlyphType.Discover, GlyphType.Shapers, GlyphType.Lie],
                                                     [GlyphType.Discover, GlyphType.Shapers, GlyphType.Data],
                                                     [GlyphType.Escape, GlyphType.Impure, GlyphType.Evolution],
                                                     [GlyphType.Escape, GlyphType.Impure, GlyphType.Future],
                                                     [GlyphType.Escape, GlyphType.Impure, GlyphType.Truth],
                                                     [GlyphType.Escape, GlyphType.Portal, GlyphType.Harm],
                                                     [GlyphType.Escape, GlyphType.Shapers, GlyphType.Harm],
                                                     [GlyphType.Escape, GlyphType.Shapers, GlyphType.Harmony],
                                                     [GlyphType.Fear, GlyphType.Chaos, GlyphType.Xm],
                                                     [GlyphType.Fear, GlyphType.Complex, GlyphType.Xm],
                                                     [GlyphType.Follow, GlyphType.Pure, GlyphType.Journey],
                                                     [GlyphType.Future, GlyphType.Equal, GlyphType.Past],
                                                     [GlyphType.Gain, GlyphType.Civilization, GlyphType.Harmony],
                                                     [GlyphType.Gain, GlyphType.Future, GlyphType.Escape],
                                                     [GlyphType.Harm, GlyphType.Danger, GlyphType.Avoid],
                                                     [GlyphType.Harmony, GlyphType.Stability, GlyphType.Future],
                                                     [GlyphType.Hide, GlyphType.Journey, GlyphType.Truth],
                                                     [GlyphType.Hide, GlyphType.Path, GlyphType.Future],
                                                     [GlyphType.HumanA, GlyphType.Gain, GlyphType.Safety],
                                                     [GlyphType.Improve, GlyphType.Advance, GlyphType.Now],
                                                     [GlyphType.Improve, GlyphType.Future, GlyphType.Together],
                                                     [GlyphType.Improve, GlyphType.HumanA, GlyphType.Shapers],
                                                     [GlyphType.Not, GlyphType.CreativityB, GlyphType.Future],
                                                     [GlyphType.Not, GlyphType.Xm, GlyphType.Truth],
                                                     [GlyphType.Journey, GlyphType.Not, GlyphType.Soul],
                                                     [GlyphType.Lead, GlyphType.EnlightenedA, GlyphType.Civilization],
                                                     [GlyphType.Lead, GlyphType.Resistance, GlyphType.Question],
                                                     [GlyphType.Liberate, GlyphType.HumanA, GlyphType.Future],
                                                     [GlyphType.Liberate, GlyphType.Portal, GlyphType.Potential],
                                                     [GlyphType.Lose, GlyphType.Attack, GlyphType.Retreat],
                                                     [GlyphType.CreativityB, GlyphType.Body, GlyphType.Breathe],
                                                     [GlyphType.CreativityB, GlyphType.Equal, GlyphType.Truth],
                                                     [GlyphType.CreativityB, GlyphType.Open, GlyphType.Breathe],
                                                     [GlyphType.Nature, GlyphType.Purity, GlyphType.Defend],
                                                     [GlyphType.Nourish, GlyphType.CreativityB, GlyphType.Journey],
                                                     [GlyphType.Nourish, GlyphType.Xm, GlyphType.Portal],
                                                     [GlyphType.OpenAll, GlyphType.Portal, GlyphType.Evolution],
                                                     [GlyphType.OpenAll, GlyphType.Simple, GlyphType.Truth],
                                                     [GlyphType.Open, GlyphType.HumanA, GlyphType.Weak],
                                                     [GlyphType.Past, GlyphType.Equal, GlyphType.Future],
                                                     [GlyphType.Past, GlyphType.Harmony, GlyphType.Difficult],
                                                     [GlyphType.Past, GlyphType.Now, GlyphType.Future],
                                                     [GlyphType.Path, GlyphType.Harmony, GlyphType.Difficult],
                                                     [GlyphType.Harmony, GlyphType.Simple, GlyphType.Journey],
                                                     [GlyphType.Harmony, GlyphType.Stability, GlyphType.Future],
                                                     [GlyphType.Perfection, GlyphType.Past, GlyphType.Harmony],
                                                     [GlyphType.Potential, GlyphType.Truth, GlyphType.Harmony],
                                                     [GlyphType.Potential, GlyphType.Xm, GlyphType.Attack],
                                                     [GlyphType.Potential, GlyphType.Xm, GlyphType.Harmony],
                                                     [GlyphType.Potential, GlyphType.Xm, GlyphType.Attack],
                                                     [GlyphType.PursueA, GlyphType.Complex, GlyphType.Truth],
                                                     [GlyphType.PursueA, GlyphType.Purity, GlyphType.Body],
                                                     [GlyphType.Question, GlyphType.Conflict, GlyphType.Data],
                                                     [GlyphType.Question, GlyphType.Hide, GlyphType.Truth],
                                                     [GlyphType.Question, GlyphType.HumanA, GlyphType.Truth],
                                                     [GlyphType.Question, GlyphType.Shapers, GlyphType.Chaos],
                                                     [GlyphType.React, GlyphType.Impure, GlyphType.Civilization],
                                                     [GlyphType.React, GlyphType.Purity, GlyphType.Truth],
                                                     [GlyphType.Recharge, GlyphType.Nature, GlyphType.Perfection],
                                                     [GlyphType.Again, GlyphType.Journey, GlyphType.Outside],
                                                     [GlyphType.Retreat, GlyphType.Search, GlyphType.Safety],
                                                     [GlyphType.Search, GlyphType.Xm, GlyphType.Portal],
                                                     [GlyphType.See, GlyphType.Truth, GlyphType.Now],
                                                     [GlyphType.Separate, GlyphType.Future, GlyphType.Evolution],
                                                     [GlyphType.Separate, GlyphType.Future, GlyphType.PursueA],
                                                     [GlyphType.Together, GlyphType.Purity, GlyphType.Journey],
                                                     [GlyphType.Together, GlyphType.PursueA, GlyphType.Safety],
                                                     [GlyphType.Truth, GlyphType.Nourish, GlyphType.Soul],
                                                     [GlyphType.Want, GlyphType.Truth, GlyphType.Now],
                                                     [GlyphType.Want, GlyphType.Xm, GlyphType.Now],
                                                     [GlyphType.Attack, GlyphType.Attack, GlyphType.Chaos],
                                                     [GlyphType.Attack, GlyphType.Creation, GlyphType.Danger],
                                                     [GlyphType.Attack, GlyphType.Destruction, GlyphType.Future],
                                                     [GlyphType.Xm, GlyphType.Nourish, GlyphType.Civilization]]
    
    static let fourItemsSequences:  [[GlyphType]] = []
    static let fiveItemsSequences:  [[GlyphType]] = []
}
