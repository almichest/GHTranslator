//
//  GlyphView.swift
//  GlyphHackPractice
//
//  Created by OhnoHiraku on 2015/03/28.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit
import SpriteKit

public class GlyphView: SKView, GlyphSceneDelegate {
    
    weak var glyphDelegate:GlyphViewDelegate?
    
    func didTapLevelSelectionLabel(scene: GlyphScene) {
        self.glyphDelegate?.didSelectLevelSelectButton(self)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        let scene = self.scene as! GlyphScene
        scene.glyphDelegate = self
    }
}

protocol GlyphViewDelegate:class {
    func didSelectLevelSelectButton(view:GlyphView)
}
