//
//  TopView.swift
//  goal
//
//  Created by 開発 on 2018/09/09.
//  Copyright © 2018年 Kronos. All rights reserved.
//

import UIKit

class TopView: UIView {
    let btn_list :UIButton
    let table :UITableView
    let refreshControl:UIRefreshControl
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init() {
        let buttonWidth: CGFloat = 100
        let buttonHeight: CGFloat = 50
        let posX: CGFloat = (self.bounds.width - buttonWidth)/2
        let posY: CGFloat = 200
        btn_list = UIButton(frame: CGRect(x: posX, y: posY, width: buttonWidth, height: buttonHeight))
        btn_list.layer.masksToBounds = true
        btn_list.layer.cornerRadius = 20.0
        btn_list.setTitle("目標を見る", for: .normal)

        super.init(frame: CGRectm);
        self.addSubview(btn_list);
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor.cyan
    }
    //        // Viewの背景色をCyanに設定する.
    //        self.view.backgroundColor = UIColor.cyan
    //
    //        // 一覧ボタンの定義をおこなう.
    //        let buttonWidth: CGFloat = 100
    //        let buttonHeight: CGFloat = 50
    //        let posX: CGFloat = (self.view.bounds.width - buttonWidth)/2
    //        let posY: CGFloat = 200
    //        let listButton = UIButton(frame: CGRect(x: posX, y: posY, width: buttonWidth, height: buttonHeight))
    //        listButton.backgroundColor = UIColor.orange
    //        listButton.layer.masksToBounds = true
    //        listButton.layer.cornerRadius = 20.0
    //        listButton.setTitle("目標を見る", for: .normal)
    //        listButton.addTarget(self, action: #selector(onClickListButton(sender:)), for: .touchUpInside)
    //
    //        // 一覧ボタンをViewに追加する.
    //        self.view.addSubview(listButton);
}

