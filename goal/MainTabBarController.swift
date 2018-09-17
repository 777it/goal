//
//  MainTabBarController.swift
//  goal
//
//  Created by 開発 on 2018/09/04.
//  Copyright © 2018年 Kronos. All rights reserved.
//
import UIKit

class MainTabBarController: UITabBarController {
    //TODO: 文言を検討する
    
    //MARK: - field
    // 新規作成から入力された文字列
    var InputStr:String!
    
    // 入力できる最大文字数.
    let maxLength: Int = 50
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        // ナビゲーションバー設定
        setNavRightController()
        
        super.viewDidLoad()
        var myTabs: [UIViewController] = []
        
        // Tabに設定するViewControllerのインスタンスを生成
        let myFirstTab: UIViewController = DayListViewController()
        let mySecondTab: UIViewController = MonthListViewController()
        let myThirdTab: UIViewController = YearListViewController()
        
        // タブの識別番号を設定
        myFirstTab.tabBarItem.tag = 1
        mySecondTab.tabBarItem.tag = 2
        myThirdTab.tabBarItem.tag = 3
        
        // タブの画像を設定
        myFirstTab.tabBarItem.title = "Day"
        mySecondTab.tabBarItem.title = "Month"
        myThirdTab.tabBarItem.title = "Year"
        
        // タブの画像を設定
        myFirstTab.tabBarItem.image = UIImage(named: "tab_day.png")
        mySecondTab.tabBarItem.image = UIImage(named: "tab_month.png")
        myThirdTab.tabBarItem.image = UIImage(named: "tab_year.png")
        
        // タブで表示するViewControllerを配列に格納します。
        myTabs.append(myFirstTab)
        myTabs.append(mySecondTab)
        myTabs.append(myThirdTab)

        // 配列をTabにセットします。
        self.setViewControllers(myTabs, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Method
    func setNavRightController() {
        // addボタン
        let addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onClickAddButton))
        addBtn.tintColor = .black

        // removeボタン
        let removeBtn = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(onClickRemoveButton))
        removeBtn.tintColor = .black
        
        navigationItem.rightBarButtonItems = [addBtn, removeBtn]
    }
    
    // 新規作成ボタンをクリック
    @objc
    func onClickAddButton() {

        // Alert生成.
        let myAlert: UIAlertController = UIAlertController(title: "目標は?", message: "50文字以下で入力", preferredStyle: UIAlertControllerStyle.alert)
        
        
        // OKアクション生成.
        let OkAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action: UIAlertAction!) -> Void in
            print("OK")
            let myNewGoal = self.InputStr
            let tagIndex = self.selectedIndex
            switch tagIndex {
            case 0:
                DayListViewController.addGoal(str: myNewGoal!)
            case 1:
                MonthListViewController.addGoal(str: myNewGoal!)
            case 2:
                YearListViewController.addGoal(str: myNewGoal!)
            default:
                print("ありえないパターン")
            }
        }

        // Cancelアクション生成.
        let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive) { (action: UIAlertAction!) -> Void in
            print("Cancel")
        }
        // AlertにTextFieldを追加.
        myAlert.addTextField { (textField: UITextField!) -> Void in

            // NotificationCenterを生成.
            let myNotificationCenter = NotificationCenter.default
            
            // textFieldに変更があればchangeTextFieldメソッドに通知.
            myNotificationCenter.addObserver(self, selector: #selector(MainTabBarController.changeTextField(sender:)), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
        }

        // Alertにアクションを追加.
        myAlert.addAction(OkAction)
        myAlert.addAction(CancelAction)

        // Alertを発動する.
        present(myAlert, animated: true, completion: nil)
    }
  
    // 全削除ボタンをクリック
    @objc
    func onClickRemoveButton() {
        // Alert生成.
        let myAlert: UIAlertController = UIAlertController(title: "削除", message: "すべての目標を削除してよろしいですか？", preferredStyle: UIAlertControllerStyle.alert)

        // OKアクション生成.
        let OkAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action: UIAlertAction!) -> Void in
            print("OK")
            //全て消す
            let userDefaults = UserDefaults.standard
            if let domain = Bundle.main.bundleIdentifier {
                userDefaults.removePersistentDomain(forName: domain)
            }
        }

        // Cancelアクション生成.
        let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive) { (action: UIAlertAction!) -> Void in
            print("Cancel")
        }

        // Alertにアクションを追加.
        myAlert.addAction(OkAction)
        myAlert.addAction(CancelAction)

        // Alertを発動する.
        present(myAlert, animated: true, completion: nil)
    }
    
    // テキストフィールドが変更された
    @objc
    func changeTextField (sender: NSNotification) {

        let textField = sender.object as! UITextField

        // 入力された文字を取得.
        InputStr = textField.text

        // 入力された文字が50文字を超えたら入力を制限.
        if InputStr.count < maxLength {
            textField.isEnabled = true

            // 入力された文字を表示.
            print(textField.text!)
        } else {
            textField.isEnabled = false
            print("50文字を超えています")
        }
    }
}
