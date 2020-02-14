//
//  ConnectionView.swift
//  LineDotty
//
//  Created by Fernando Martin Garcia Del Angel on 13/02/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import UIKit

class ConnectionView: UIView {
    
    var dragChanged : (() -> Void)?
    var dragFinished: (() -> Void)?
    var touchStartPos = CGPoint.zero
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        touchStartPos = touch.location(in: self)
        // Offset the fact that UIView.zero starts from the TL Corner
        touchStartPos.x -= frame.width / 2
        touchStartPos.y -= frame.height / 2
        // Transform the view to be a bit bigger
        transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
        // Bring it to the front
        superview?.bringSubviewToFront(self)
    }
    
}
