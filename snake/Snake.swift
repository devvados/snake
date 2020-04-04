//
//  Snake.swift
//  snake
//
//  Created by Vadim Dmitriev on 29.03.2020.
//  Copyright © 2020 geekbrains. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Snake: SKShapeNode {
    let moveSpeed = 125.0
    var rotateAngle: CGFloat = 0.0
    var body = [SnakeBodyPart]()
    
    convenience init(atPoint point: CGPoint) {
        self.init()
        //создание и добавление головы
        let head = SnakeHead(atPoint: point)
        
        body.append(head)
        addChild(head)
    }
    
    //добавление сегмента тела змеи
    func addBodyPart() {
        let newBodyPart = SnakeBodyPart(atPoint: CGPoint(x: body[0].position.x, y: body[0].position.y))
        
        body.append(newBodyPart)
        addChild(newBodyPart)
    }
    
    //движение змеи
    func move() {
        guard !body.isEmpty else { return }
        
        let head = body[0]
        moveHead(head)
        
        //перемещение последующих элементов на место
        for index in (0..<body.count) where index > 0 {
            let previousBodyPart = body[index - 1]
            let currentBodyPart = body[index]
            
            //перемещение остального тела змейки
            moveBodyPart(previousBodyPart, c: currentBodyPart)
        }
    }
    
    //правило перемещения первого элемента змейки
    func moveHead(_ head: SnakeBodyPart) {
        let dx = CGFloat(moveSpeed) * sin(rotateAngle)
        let dy = CGFloat(moveSpeed) * cos(rotateAngle)
        
        //расчет новой позиции головы змейки
        let nextPosition = CGPoint(x: head.position.x + dx, y: head.position.y + dy)
        //действие для перемещения
        let moveAction = SKAction.move(to: nextPosition, duration: 1.0)
        
        head.run(moveAction)
    }
    
    //перемещение тела змейки
    func moveBodyPart(_ p: SnakeBodyPart, c: SnakeBodyPart) {
        let moveAction = SKAction.move(to: CGPoint(x: p.position.x, y: p.position.y), duration: 0.1)
        c.run(moveAction)
    }
    
    func moveClockwise() {
        rotateAngle += CGFloat(Double.pi/2)
    }
    
    func moveCounterClockwise() {
        rotateAngle -= CGFloat(Double.pi/2)
    }
}
