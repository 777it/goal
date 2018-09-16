//
//  DayDetailViewController.swift
//  goal
//
//  Created by 開発 on 2018/09/02.
//  Copyright © 2018年 Kronos. All rights reserved.
//

import UIKit

class DayDetailViewController: UIViewController, UITextFieldDelegate{
    
    //MARK: - field
    public var myGoal = ""
    public var myGoalNum = 0
    
    private var myGiveItems: [String] = []
    private var myTakeItems: [String] = []
    
    private var  label_give: UILabel!
    private var  label_take: UILabel!
    
    private var textField_give: UITextField!
    private var textField_take: UITextField!
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        setNavRightController()
        super.viewDidLoad()
        
        // Viewの背景を青にする
        self.view.backgroundColor = UIColor.cyan

        //MARK: Size
        // ボタンのサイズを定義
        let bWidth: CGFloat = 300
        let bHeight: CGFloat = 50
        
        let hWidth: CGFloat = 100
        let hHeight: CGFloat = 20
        
        // テキストフィールドのサイズを定義
        let tWidth: CGFloat = 300
        let tHeight: CGFloat = 50
        
        //MARK: CGRect
        // 配置する座標を定義
        let posX: CGFloat = self.view.bounds.width/2 - bWidth/2
        let posY: CGFloat = bHeight * 2
        
        let posY_label_limit: CGFloat = posY + bHeight
        
        let posY_label_give_title: CGFloat = posY_label_limit + bHeight
        let posY_label_give: CGFloat = posY_label_give_title + hHeight + 20
        let posY_label_take_title: CGFloat = posY_label_give + bHeight + 30
        let posY_label_take: CGFloat = posY_label_take_title + hHeight + 20
        
        //MARK: Goal
        // Labelを作成
        let label_goal: UILabel = UILabel(frame: CGRect(x: posX, y: posY, width: bWidth, height: bHeight))
        
        // UILabelの背景をオレンジ色に
        label_goal.backgroundColor = UIColor.orange
        
        // UILabelの枠を丸くする
        label_goal.layer.masksToBounds = true
        
        // 丸くするコーナーの半径
        label_goal.layer.cornerRadius = 20.0
        
        // 文字の色を白に定義
        label_goal.textColor = UIColor.white
        
        // UIlabelに文字を代入
        label_goal.text = myGoal
        
        // 文字の影をグレーに定義
        label_goal.shadowColor = UIColor.gray
        
        // Textを中央寄せにする
        label_goal.textAlignment = NSTextAlignment.center
        
        //TODO: 期限を表示する
        let label_limit = UILabel(frame: CGRect(x: posX, y: posY_label_limit, width: bWidth, height: bHeight))
        label_limit.text = ""
        label_limit.textAlignment = NSTextAlignment.center
        
        //MARK: Give
        
        let label_give_title = UILabel(frame: CGRect(x: posX, y: posY_label_give_title, width: hWidth, height: hHeight))
        label_give_title.backgroundColor = UIColor.blue
        label_give_title.layer.masksToBounds = true
        label_give_title.layer.cornerRadius = 10.0
        label_give_title.textColor = UIColor.white
        label_give_title.text = "TODO"
        label_give_title.shadowColor = UIColor.gray
        label_give_title.textAlignment = NSTextAlignment.center
        
        label_give = UILabel(frame: CGRect(x: posX, y: posY_label_give, width: bWidth, height: bHeight))
        let userDefaults:UserDefaults = UserDefaults.standard
        let giveThings = userDefaults.stringArray(forKey: "KEY_Goal_day_give")
        let giveThing = giveThings![myGoalNum]
        
        if (giveThing.isEmpty) {
            label_give.text = "未設定"
        }
        else {
            label_give.text = giveThings?[myGoalNum]
        }
        
        textField_give = UITextField(frame: CGRect(x: posX, y: posY_label_give, width: tWidth, height: tHeight))
        textField_give.text = label_give.text
        textField_give.delegate = self
        textField_give.borderStyle = .roundedRect
        textField_give.clearButtonMode = .whileEditing
        
        //MARK: Take
        let label_take_title = UILabel(frame: CGRect(x: posX, y: posY_label_take_title, width: hWidth, height: hHeight))
        label_take_title.backgroundColor = UIColor.blue
        label_take_title.layer.masksToBounds = true
        label_take_title.layer.cornerRadius = 10.0
        label_take_title.textColor = UIColor.white
        label_take_title.text = "ごほうび"
        label_take_title.shadowColor = UIColor.gray
        label_take_title.textAlignment = NSTextAlignment.center
        
        label_take = UILabel(frame: CGRect(x: posX, y: posY_label_take, width: bWidth, height: bHeight))
        let takeThings = userDefaults.stringArray(forKey: "KEY_Goal_day_take")
        let takeThing = takeThings![myGoalNum]
        
        if (takeThing.isEmpty) {
            label_take.text = "未設定"
        }
        else {
            label_take.text = takeThings?[myGoalNum]
        }
        
        textField_take = UITextField(frame: CGRect(x: posX, y: posY_label_take, width: tWidth, height: tHeight))
        textField_take.text = label_take.text
        textField_take.delegate = self
        textField_take.borderStyle = .roundedRect
        textField_take.clearButtonMode = .whileEditing
        
        // ViewにLabelを追加
        self.view.addSubview(label_goal)
        self.view.addSubview(label_limit)
        self.view.addSubview(label_give_title)
        self.view.addSubview(label_give)
        self.view.addSubview(label_take_title)
        self.view.addSubview(label_take)
        
        // Viewにテキストボックスを追加
        self.view.addSubview(textField_give)
        self.view.addSubview(textField_take)
        
        // テキストボックスを非表示
        textField_give.isHidden = true
        textField_take.isHidden = true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Method
    // 初期表示は編集モードOFF
    func setNavRightController() {
        let editBtn = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(startEdit))
        editBtn.tintColor = .black
        
        navigationItem.rightBarButtonItems = [editBtn]
    }
    
    // 編集モードONにする
    @objc func startEdit(){
        // 戻るボタンを非表示にする
        self.navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItems?.remove(at: 0)
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(endEdit))
        doneBtn.tintColor = .black
        
        navigationItem.rightBarButtonItems = [doneBtn]
        
        // ラベルを非表示
        self.label_give.isHidden = true
        self.label_take.isHidden = true
        
        // 内容を反映
        self.textField_give.text = self.label_give.text
        self.textField_take.text = self.label_take.text
        
        // テキストボックスを表示
        self.textField_give.isHidden = false
        self.textField_take.isHidden = false
    }
    
    // 編集モードOFFにする
    @objc func endEdit(){
        // 戻るボタンを表示する
        self.navigationItem.hidesBackButton = false
        
        navigationItem.rightBarButtonItems?.remove(at: 0)
        let editBtn = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(startEdit))
        editBtn.tintColor = .black
        
        navigationItem.rightBarButtonItems = [editBtn]
        
        // テキストボックスを非表示
        self.textField_give.isHidden = true
        self.textField_take.isHidden = true
        
        // 内容を反映
        self.label_give.text = self.textField_give.text
        self.label_take.text = self.textField_take.text
        
        // 記憶させる
        let userDefaults:UserDefaults = UserDefaults.standard
        
        var strGives = userDefaults.array(forKey: "KEY_Goal_day_give") as! [String]
        var strTakes = userDefaults.array(forKey: "KEY_Goal_day_take") as! [String]
        
        strGives[myGoalNum] = self.label_give.text!
        strTakes[myGoalNum] = self.label_take.text!
        
        userDefaults.set(strGives, forKey: "KEY_Goal_day_give")
        userDefaults.set(strTakes, forKey: "KEY_Goal_day_take")
        
        // ラベルを表示
        self.label_give.isHidden = false
        self.label_take.isHidden = false
    }
    
    //MARK: - Method(TextField)
    /*
     UITextFieldが編集された直前に呼ばれる
     */
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing: \(textField.text!)")
    }
    
    /*
     UITextFieldが編集された直後に呼ばれる
     */
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing: \(textField.text!)")
    }
    
    /*
     改行ボタンが押された際に呼ばれる
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn \(textField.text!)")
        
        // 改行ボタンが押されたらKeyboardを閉じる処理
        textField.resignFirstResponder()
        
        return true
    }
}
