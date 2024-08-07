//
//  TeleBar.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 03/08/2024.
//

import SpriteKit

final class TeleBar: SKShapeNode {
    
    enum BarType { case leading, trailing }
    
    let barType: BarType
    var movementSpeed: CGFloat = 1
    
    // MARK: - INIT
    init(type barType: BarType) {
        self.barType = barType
        super.init()
        
        let path = CGPath(rect: CGRect(x: -2.5, y: -50, width: 5, height: 100), transform: nil)
        self.path = path
        
        zPosition = ZPosition.backgroundActiveElement.rawValue
        setShape()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - DESIGN
    private func setShape() {
        fillColor = .red
        lineWidth = 0
    }
    
    // MARK: - UPDATE
    func update() {
        guard let scene = scene as? GameScene else { return }
//        let player = scene.player
        
        position.y += movementSpeed
        
        if (position.y <= scene.sceneMargin.bottom + frame.height / 2) || (position.y >= scene.size.height - scene.sceneMargin.leading - frame.height / 2) {
            movementSpeed *= -1
        }
    }
}
