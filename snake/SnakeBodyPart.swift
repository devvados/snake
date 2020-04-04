//
//  SnakeBodyPart.swift
//  snake
//
//  Created by Vadim Dmitriev on 29.03.2020.
//  Copyright © 2020 geekbrains. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class SnakeBodyPart : SKShapeNode {
    let diameter = 10
    
    init(atPoint point: CGPoint) {
        super.init()
        
        //параметры объекта
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: diameter, height: diameter)).cgPath
        fillColor = UIColor.green
        strokeColor = UIColor.green
        lineWidth = 5
        self.position = point
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(diameter-4), center: CGPoint(x: 5, y: 5))
        self.physicsBody?.isDynamic = true
        //определение категории объекта (границы экрана)
        self.physicsBody?.categoryBitMask = CollisionCategory.Snake
        //установка взаимодействующих категорий объектов
        self.physicsBody?.contactTestBitMask = CollisionCategory.EdgeBody | CollisionCategory.Apple
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
