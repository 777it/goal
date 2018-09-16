//
//  DayEditViewController.swift
//  goal
//
//  Created by 開発 on 2018/09/04.
//  Copyright © 2018年 Kronos. All rights reserved.
//

import UIKit

class DayUpdateViewController: UIViewController {
    
    override func viewDidLoad() {
        navRightController()
        super.viewDidLoad()
        
        // Controllerのタイトルを設定する.
        self.title = "Edit"
        
        // Viewの背景色を定義する.
        self.view.backgroundColor = UIColor.darkGray
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navRightController() {
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        doneBtn.tintColor = .white
        
        navigationItem.rightBarButtonItems = [doneBtn]
    }
    
    @objc func done(){
//        let dayDetailViewController: UIViewController = DayDetailViewController()
//        self.navigationController?.pushViewController(dayDetailViewController, animated: true)
        // 遷移するViewを定義する.
        let dayDetailViewController: UIViewController = DayDetailViewController()

        // Viewの移動する.
        self.present(dayDetailViewController, animated: true, completion: nil)
    }
    
}
