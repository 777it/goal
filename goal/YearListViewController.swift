//
//  YearListViewController.swift
//  goal
//
//  Created by 開発 on 2018/09/04.
//  Copyright © 2018年 Kronos. All rights reserved.
//

import UIKit

class YearListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    //MARK: - field
    // Tableで使用する配列を設定する
    private var myItems: [String] = []
    private var myTableView: UITableView!
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: TableView
        // Status Barの高さを取得する.
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        
        // Viewの高さと幅を取得する.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // TableViewの生成(Status barの高さをずらして表示).
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight))
        
        // Cell名の登録をおこなう.
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        // DataSourceを自身に設定する.
        myTableView.dataSource = self
        
        // Delegateを自身に設定する.
        myTableView.delegate = self
        
        // Viewに追加する.
        self.view.addSubview(myTableView)
        
        //MARK: Cellに表示する目標を格納
        let userDefaults:UserDefaults = UserDefaults.standard
        let goals = userDefaults.stringArray(forKey: "KEY_Goal_year")
        if (goals != nil) {
            for goal in goals! {
                myItems.append(goal)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Method
    // 新しい目標を追加する
    class func addGoal(str:String) {
        
        let myNewGoal = str
        
        let userDefaults:UserDefaults = UserDefaults.standard
        let goals = userDefaults.array(forKey: "KEY_Goal_year")
        
        if (goals == nil) {
            userDefaults.set([myNewGoal], forKey: "KEY_Goal_year")
            userDefaults.set([""], forKey: "KEY_Goal_year_give")
            userDefaults.set([""], forKey: "KEY_Goal_year_take")
        }
        else {
            var strGoals = userDefaults.array(forKey: "KEY_Goal_year") as! [String]
            var strGives = userDefaults.array(forKey: "KEY_Goal_year_give") as! [String]
            var strTakes = userDefaults.array(forKey: "KEY_Goal_year_take") as! [String]
            
            strGoals.append(myNewGoal)
            strGives.append("")
            strTakes.append("")
            
            userDefaults.set(strGoals, forKey: "KEY_Goal_year")
            userDefaults.set(strGives, forKey: "KEY_Goal_year_give")
            userDefaults.set(strTakes, forKey: "KEY_Goal_year_take")
        }
    }
    
    //MARK: - Method(tableView)
    /*
     Cellが選択された際に呼び出される
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myItems[indexPath.row])")
        
        // 移動先を定義する.
        let yearDetailViewController = YearDetailViewController()
        
        // 選択された値を移動先にセット
        yearDetailViewController.myGoal = myItems[indexPath.row]
        yearDetailViewController.myGoalNum = indexPath.row
        
        // 詳細画面に移動する.
        self.navigationController?.pushViewController(yearDetailViewController, animated: true)
        
        
    }
    
    /*
     Cellの総数を返す.
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }
    
    /*
     Cellに値を設定する
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        
        // Cellに値を設定する.
        cell.textLabel!.text = "\(myItems[indexPath.row])"
        
        return cell
    }
    
    /*
     Cellを削除しようとした際に呼び出される
     */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            let userDefaults:UserDefaults = UserDefaults.standard
            var strGoals = userDefaults.array(forKey: "KEY_Goal_year") as! [String]
            var strGives = userDefaults.array(forKey: "KEY_Goal_year_give") as! [String]
            var strTakes = userDefaults.array(forKey: "KEY_Goal_year_take") as! [String]
            
            strGoals.remove(at: indexPath.row)
            strGives.remove(at: indexPath.row)
            strTakes.remove(at: indexPath.row)
            
            userDefaults.set(strGoals, forKey: "KEY_Goal_year")
            userDefaults.set(strGives, forKey: "KEY_Goal_year_give")
            userDefaults.set(strTakes, forKey: "KEY_Goal_year_take")
        }
    }
}
