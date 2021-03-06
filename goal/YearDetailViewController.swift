//
//  YearDetailViewController.swift
//  goal
//
//  Created by 開発 on 2018/09/04.
//  Copyright © 2018年 Kronos. All rights reserved.
//

import UIKit

class YearDetailViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - field
    public var myGoal = ""
    public var myGoalNum = 0
    
    private var myGiveItems: [String] = []
    private var myTakeItems: [String] = []
    
    private var  label_give: UILabel!
    private var  label_take: UILabel!
    
    private var textField_give: UITextField!
    private var textField_take: UITextField!
    
    //MARK: - Color
    // ハロウィンカラー
    private let main_color = UIColor(red: 0.945, green: 0.478, blue: 0.247, alpha: 1.0) // オレンジ
    private let point_color = UIColor(red: 0.122, green: 0.290, blue: 0.031, alpha: 1.0) //緑
    
    // クリスマスカラー
//    private let main_color = UIColor(red: 1.000, green: 0.420, blue: 0.420, alpha: 1.0) // 赤
//    private let point_color = UIColor(red: 0.145, green: 0.518, blue: 0.157, alpha: 1.0) // 緑
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        setNavRightController()
        super.viewDidLoad()
        
        // Viewの背景色を定義する
        self.view.backgroundColor = UIColor.white
        
        //MARK: Size
        // ボタンのサイズを定義
        let bWidth: CGFloat = 300
        let bHeight: CGFloat = 50
        
        let hWidth: CGFloat = 100
        let hHeight: CGFloat = 20
        
        // テキストフィールドのサイズを定義
        let tWidth: CGFloat = 300
        let tHeight: CGFloat = 50
        
        // UIImageViewのサイズを定義(画像)
        let illustrationWidth: CGFloat = 300
        let illustrationHeight: CGFloat = 150
        
        //MARK: CGRect
        // 配置する座標を定義
        let posX: CGFloat = self.view.bounds.width/2 - bWidth/2
        let posY: CGFloat = bHeight * 2
        
        let posY_label_limit: CGFloat = posY + bHeight
        
        let posY_label_give_title: CGFloat = posY_label_limit + bHeight
        let posY_label_give: CGFloat = posY_label_give_title + hHeight + 20
        let posY_label_take_title: CGFloat = posY_label_give + bHeight + 30
        let posY_label_take: CGFloat = posY_label_take_title + hHeight + 20
        let posX_image: CGFloat = (self.view.bounds.width - illustrationWidth)/2
        let posY_image_illustration: CGFloat = posY_label_take + bHeight + 30
        
        //MARK: Goal
        // Labelを作成
        let label_goal: UILabel = UILabel(frame: CGRect(x: posX, y: posY, width: bWidth, height: bHeight))
        
        // UILabelの背景を設定する
        label_goal.backgroundColor = point_color
        
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
        label_give_title.backgroundColor = main_color
        label_give_title.layer.masksToBounds = true
        label_give_title.layer.cornerRadius = 10.0
        label_give_title.textColor = UIColor.white
        label_give_title.text = "TODO"
        label_give_title.shadowColor = UIColor.gray
        label_give_title.textAlignment = NSTextAlignment.center
        
        label_give = UILabel(frame: CGRect(x: posX, y: posY_label_give, width: bWidth, height: bHeight))
        let userDefaults:UserDefaults = UserDefaults.standard
        let giveThings = userDefaults.stringArray(forKey: "KEY_Goal_year_give")
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
        label_take_title.backgroundColor = main_color
        label_take_title.layer.masksToBounds = true
        label_take_title.layer.cornerRadius = 10.0
        label_take_title.textColor = UIColor.white
        label_take_title.text = "ごほうび"
        label_take_title.shadowColor = UIColor.gray
        label_take_title.textAlignment = NSTextAlignment.center
        
        label_take = UILabel(frame: CGRect(x: posX, y: posY_label_take, width: bWidth, height: bHeight))
        let takeThings = userDefaults.stringArray(forKey: "KEY_Goal_year_take")
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
        
        //MARK: Illustration
        let imageView_illustration = UIImageView(frame: CGRect(x: posX_image, y: posY_image_illustration, width: illustrationWidth, height: illustrationHeight))
        let image_illustration: UIImage = UIImage(named: "present.png")!
        imageView_illustration.image = image_illustration
        
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
        
        // ViewにUIImageViewを追加
        self.view.addSubview(imageView_illustration)
        
        // テキストボックスを非表示
        textField_give.isHidden = true
        textField_take.isHidden = true
    }
    
    //MARK: - Method
    // 初期表示は編集モードOFF
    func setNavRightController() {
        let editBtn = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(startEdit))
        
        navigationItem.rightBarButtonItems = [editBtn]
    }
    
    // 編集モードONにする
    @objc func startEdit(){
        // 戻るボタンを非表示にする
        self.navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItems?.remove(at: 0)
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(endEdit))
        
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
        
        navigationItem.rightBarButtonItems = [editBtn]
        
        // テキストボックスを非表示
        self.textField_give.isHidden = true
        self.textField_take.isHidden = true
        
        // 内容を反映
        self.label_give.text = self.textField_give.text
        self.label_take.text = self.textField_take.text
        
        // 記憶させる
        let userDefaults:UserDefaults = UserDefaults.standard
        
        var strGives = userDefaults.array(forKey: "KEY_Goal_year_give") as! [String]
        var strTakes = userDefaults.array(forKey: "KEY_Goal_year_take") as! [String]
        
        strGives[myGoalNum] = self.label_give.text!
        strTakes[myGoalNum] = self.label_take.text!
        
        userDefaults.set(strGives, forKey: "KEY_Goal_year_give")
        userDefaults.set(strTakes, forKey: "KEY_Goal_year_take")
        
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
