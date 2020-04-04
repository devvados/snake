//
//  SnakeHead.swift
//  snake
//
//  Created by Vadim Dmitriev on 29.03.2020.
//  Copyright © 2020 geekbrains. All rights reserved.
//

import Foundation
import UIKit

class SnakeHead : SnakeBodyPart {
    override init(atPoint point: CGPoint) {
        super.init(atPoint: point)
         //определение категории объекта (границы экрана)
        self.physicsBody?.categoryBitMask = CollisionCategory.SnakeHead
        //установка взаимодействующих категорий объектов
        self.physicsBody?.contactTestBitMask = CollisionCategory.EdgeBody | CollisionCategory.Apple | CollisionCategory.Snake
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

