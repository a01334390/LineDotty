//
//  ViewController.swift
//  LineDotty
//
//  Created by Fernando Martin Garcia Del Angel on 13/02/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentLevel = 0 // Current Level to display
    var connections = [UIView]() // Connection dots to display

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        levelUp()
    }
    
    /**
        Creates a new and harder level
     - Returns:
            - Void
        
     */
    func levelUp() {
        currentLevel += 1
        // Restore connections to original status
        connections.forEach { $0.removeFromSuperview() }
        // Remove all connections
        connections.removeAll()
        // Add five draggable areas every time
        for _ in 1...(currentLevel + 4) {
            let connection = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 44, height: 44)))
            connection.backgroundColor = .white
            connection.layer.cornerRadius = 22
            connection.layer.borderWidth = 2
            connections.append(connection)
            view.addSubview(connection)
        }
    }


}

