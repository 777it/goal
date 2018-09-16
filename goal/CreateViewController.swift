//
//  CreateViewController.swift
//  goal
//
//  Created by 開発 on 2018/09/04.
//  Copyright © 2018年 Kronos. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Viewの背景色を設定する.
        self.view.backgroundColor = UIColor.red
        
        // 一覧ボタンの定義をおこなう.
        let buttonWidth: CGFloat = 100
        let buttonHeight: CGFloat = 50
        let posX: CGFloat = (self.view.bounds.width - buttonWidth)/2
        let posY: CGFloat = 200
        let listButton = UIButton(frame: CGRect(x: posX, y: posY, width: buttonWidth, height: buttonHeight))
        listButton.backgroundColor = UIColor.orange
        listButton.layer.masksToBounds = true
        listButton.layer.cornerRadius = 20.0
        listButton.setTitle("目標を設定", for: .normal)
        listButton.addTarget(self, action: #selector(onClickDetailButton(sender:)), for: .touchUpInside)
        
        // 一覧ボタンをViewに追加する.
        self.view.addSubview(listButton);
        
    }
    
    @objc
    internal func onClickDetailButton(sender: UIButton){
        // 移動先を定義する.
        let mainTabBarController: UITabBarController = MainTabBarController()
        
        // 一覧画面に移動する.
        self.navigationController?.pushViewController(mainTabBarController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
