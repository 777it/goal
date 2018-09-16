//
//  TopViewController.swift
//  goal
//
//  Created by 開発 on 2018/09/02.
//  Copyright © 2018年 Kronos. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Viewの背景色をCyanに設定する
        self.view.backgroundColor = UIColor.cyan
        
        //MARK: Size
        // ボタンのサイズを定義
        let buttonWidth: CGFloat = 250
        let buttonHeight: CGFloat = 50
        // UIImageViewのサイズを定義(タイトル)
        let titleWidth: CGFloat = 300
        let titleHeight: CGFloat = 50
        // UIImageViewのサイズを定義(画像)
        let illustrationWidth: CGFloat = 300
        let illustrationHeight: CGFloat = 150
        
        //MARK: CGRect
        let posX: CGFloat = (self.view.bounds.width - buttonWidth)/2
        
        let posX_image: CGFloat = (self.view.bounds.width - titleWidth)/2
        let posY_image_title: CGFloat = 100
        
        let posY_image_illustration: CGFloat = self.view.bounds.height/4
        let posY_button_day: CGFloat = posY_image_illustration + illustrationHeight + 50
        let posY_button_month: CGFloat = posY_button_day + buttonHeight + 20
        let posY_button_year: CGFloat = posY_button_month + buttonHeight + 20
        
        //MARK: Title
        let imageView_title = UIImageView(frame: CGRect(x: posX_image, y: posY_image_title, width: titleWidth, height: titleHeight))
        let image_title: UIImage = UIImage(named: "goal_logo.png")!
        imageView_title.image = image_title

        //MARK: Illustration
        let imageView_illustration = UIImageView(frame: CGRect(x: posX_image, y: posY_image_illustration, width: illustrationWidth, height: illustrationHeight))
        let image_illustration: UIImage = UIImage(named: "goal_illustration.png")!
        imageView_illustration.image = image_illustration
        
        //MARK: Day
        let dayButton = UIButton(frame: CGRect(x: posX, y: posY_button_day, width: buttonWidth, height: buttonHeight))
        dayButton.backgroundColor = UIColor.orange
        dayButton.layer.masksToBounds = true
        dayButton.layer.cornerRadius = 20.0
        dayButton.setTitle(" DAY プラン", for: .normal)
        dayButton.addTarget(self, action: #selector(onClickDayListButton(sender:)), for: .touchUpInside)

        //MARK: Month
        let monthButton = UIButton(frame: CGRect(x: posX, y: posY_button_month, width: buttonWidth, height: buttonHeight))
        monthButton.backgroundColor = UIColor.orange
        monthButton.layer.masksToBounds = true
        monthButton.layer.cornerRadius = 20.0
        monthButton.setTitle(" MONTH プラン", for: .normal)
        monthButton.addTarget(self, action: #selector(onClickMonthListButton(sender:)), for: .touchUpInside)

        //MARK: Year
        let yearButton = UIButton(frame: CGRect(x: posX, y: posY_button_year, width: buttonWidth, height: buttonHeight))
        yearButton.backgroundColor = UIColor.orange
        yearButton.layer.masksToBounds = true
        yearButton.layer.cornerRadius = 20.0
        yearButton.setTitle(" YEAR プラン", for: .normal)
        yearButton.addTarget(self, action: #selector(onClickYearListButton(sender:)), for: .touchUpInside)

        // ViewにUIImageViewを追加
        self.view.addSubview(imageView_title)
        self.view.addSubview(imageView_illustration)
        
        // Viewにボタンを追加
        self.view.addSubview(dayButton);
        self.view.addSubview(monthButton);
        self.view.addSubview(yearButton);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: - Method
    @objc
    internal func onClickDayListButton(sender: UIButton){
        // 移動先を定義する
        let mainTabBarController: UITabBarController = MainTabBarController()
        // 選択されたメニューのインデックスを設定
        mainTabBarController.selectedIndex = 0
        // 一覧画面に移動する
        self.navigationController?.pushViewController(mainTabBarController, animated: true)
    }
    
    @objc
    internal func onClickMonthListButton(sender: UIButton){
        // 移動先を定義する
        let mainTabBarController = MainTabBarController()
        // 選択されたメニューのインデックスを設定
        mainTabBarController.selectedIndex = 1
        // 一覧画面に移動する
        self.navigationController?.pushViewController(mainTabBarController, animated: true)
    }
    
    @objc
    internal func onClickYearListButton(sender: UIButton){
        // 移動先を定義する
        let mainTabBarController: UITabBarController = MainTabBarController()
        // 選択されたメニューのインデックスを設定
        mainTabBarController.selectedIndex = 2
        // 一覧画面に移動する
        self.navigationController?.pushViewController(mainTabBarController, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

