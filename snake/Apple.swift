//
//  Apple.swift
//  snake
//
//  Created by Vadim Dmitriev on 29.03.2020.
//  Copyright © 2020 geekbrains. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Apple : SKShapeNode {
    //вспомогательный инициализатор (присваивание значения без новых параметров)
    convenience init(position: CGPoint) {
        self.init()
        //параметры объекта
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 10, height: 10)).cgPath
        fillColor = UIColor.red
        strokeColor = UIColor.red
        lineWidth = 5
        self.position = position
        
         //определение категории объекта (границы экрана)
        self.physicsBody = SKPhysicsBody(circleOfRadius: 10.0, center: CGPoint(x: 5, y: 5))
        //установка взаимодействующих категорий объектов
        self.physicsBody?.categoryBitMask = CollisionCategory.Apple
    }
}
