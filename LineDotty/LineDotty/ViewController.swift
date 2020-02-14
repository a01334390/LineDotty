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
    var connections = [ConnectionView]() // Connection dots to display

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        levelUp()
    }
    
    /**
        Places the dots into the super view
        - Parameters:
            - connection : UIView as a connection to be placed
     */
    func place(_ connection : UIView) {
        let randomX = CGFloat.random(in: 20...view.bounds.maxX - 20)
        let randomY = CGFloat.random(in: 50...view.bounds.maxY - 50)
        connection.center = CGPoint(x: randomX, y: randomY)
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
            let connection = ConnectionView (frame: CGRect(origin: .zero, size: CGSize(width: 44, height: 44)))
            connection.backgroundColor = .white
            connection.layer.cornerRadius = 22
            connection.layer.borderWidth = 2
            connections.append(connection)
            view.addSubview(connection)
        }
        
        connections.forEach ( place )
    }


}

