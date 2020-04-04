//
//  GameViewController.swift
//  snake
//
//  Created by Vadim Dmitriev on 29.03.2020.
//  Copyright © 2020 geekbrains. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //создание сцены + определение размеров
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        
        //отображение FPS и количества объектов
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        //растягивание сцены в зависимости от разрешения
        scene.scaleMode = .resizeFill
        
        //добавление созданной сцены на экран
        skView.presentScene(scene)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
