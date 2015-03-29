//
//  GlyphView.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/03/28.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit
import SpriteKit

public class GlyphView: SKView, HomeSceneDelegate, GlyphSceneDelegate {
    
    weak var glyphViewDelegate:GlyphViewDelegate?
    
    func presentHomeScene(scene:HomeScene) {
        super.presentScene(scene, transition:SKTransition.fadeWithDuration(1.0))
        scene.homeSceneDelegate = self
    }
    
    func presentGlyphScene(scene:GlyphScene) {
        super.presentScene(scene, transition:SKTransition.fadeWithDuration(1.0))
        scene.glyphSceneDelegate = self
    }
    
    //MARK: - HomeSceneDelegate
    
    func didTapStartNodeInScene(scene: HomeScene) {
        self.glyphViewDelegate?.didSelectStartItemInView(self)
    }
    
    func didTapSelectLevelNodeInScene(scene: HomeScene) {
        self.glyphViewDelegate?.didSelectSelectLevelItemInView(self)
    }
    
    func didTapResultNodeInScene(scene: HomeScene) {
        self.glyphViewDelegate?.didSelectResultItemInView(self)
    }
    
    //MARK: - GlyphSceneDelegate
    func didSelectHomeNodeInScene(scene: GlyphScene) {
        self.glyphViewDelegate?.didSelectHomeItemInView(self)
    }
}

public protocol GlyphViewDelegate: class {
    func didSelectStartItemInView(view:GlyphView)
    func didSelectSelectLevelItemInView(view:GlyphView)
    func didSelectResultItemInView(view:GlyphView)
    func didSelectHomeItemInView(view:GlyphView)
}
