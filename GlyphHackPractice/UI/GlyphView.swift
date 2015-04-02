//
//  GlyphView.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/03/28.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit
import SpriteKit

public class GlyphView: SKView, HomeSceneDelegate, GlyphSceneDelegate, ResultSceneDelegate, ScoreSceneDelegate {
    
    weak var glyphViewDelegate:GlyphViewDelegate?
    
    func presentHomeScene(scene:HomeScene) {
        scene.homeSceneDelegate = self
        super.presentScene(scene, transition:SKTransition.fadeWithDuration(1.0))
    }
    
    func presentGlyphScene(scene:GlyphScene) {
        scene.glyphSceneDelegate = self
        super.presentScene(scene, transition:SKTransition.fadeWithDuration(1.0))
    }
    
    func presentResultScene(scene:ResultScene) {
        scene.resultSceneDelegate = self
        super.presentScene(scene, transition:SKTransition.fadeWithDuration(1.0))
    }
    
    func presentScoreScene(scene:ScoreScene) {
        scene.scoreSceneDelegate = self
        super.presentScene(scene, transition:SKTransition.fadeWithDuration(1.0))
    }
    
    //MARK: - HomeSceneDelegate
    
    func didTapStartNodeInScene(scene: HomeScene) {
        self.glyphViewDelegate?.didSelectStartItemInView(self)
    }
    
    func didTapSelectLevelNodeInScene(scene: HomeScene) {
        self.glyphViewDelegate?.didSelectSelectLevelItemInView(self)
    }
    
    func didTapScoreNodeInScene(scene: HomeScene) {
        self.glyphViewDelegate?.didSelectScoreItemInView(self)
    }
    
    //MARK: - GlyphSceneDelegate
    func didSelectHomeNodeInScene(scene: GlyphScene) {
        self.glyphViewDelegate?.didSelectHomeItemInView(self)
    }
    
    func didCompleteUserInputs(answer:[GlyphType], userInputs:[Set<GlyphPath>?]) {
        self.glyphViewDelegate?.didCompleteUserInput(answer, userInputs: userInputs)
    }
    
    func didDetectPreparingAd(scene: GlyphScene) {
        self.glyphViewDelegate?.didDetectPreparingAd(self)
    }
    //MARK: - ResultSceneDelegate
    func didTapOKButtonOfScene(scene: ResultScene) {
        self.glyphViewDelegate?.didConfirmResultInView(self)
    }
    
    //MARK - ScoreSceneDelegate
    func didTapBackButton(scece: ScoreScene) {
        self.glyphViewDelegate?.didSelectBackButton(self)
    }
}

public protocol GlyphViewDelegate: class {
    func didSelectStartItemInView(view:GlyphView)
    func didSelectSelectLevelItemInView(view:GlyphView)
    func didSelectScoreItemInView(view:GlyphView)
    func didSelectHomeItemInView(view:GlyphView)
    
    func didCompleteUserInput(answer:[GlyphType], userInputs:[Set<GlyphPath>?])
    func didDetectPreparingAd(view:GlyphView)
    
    func didConfirmResultInView(view:GlyphView)
    
    func didSelectBackButton(view:GlyphView)
    
}
