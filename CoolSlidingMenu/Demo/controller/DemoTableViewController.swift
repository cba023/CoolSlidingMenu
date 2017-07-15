//
//  DemoTableViewController.swift
//  SlidingCollectionItems
//
//  Created by 神灯科技 on 2017/4/4.
//  Copyright © 2017年 cba023. All rights reserved.
//

import UIKit

class DemoTableViewController: UITableViewController {
    
    var dataDic:Dictionary<String, Any>! = nil
    var arrIcon:Array<Any>! = nil
    var arrMenu:Array<Any>! = nil
    var countRow:Int = 2
    var countCol:Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setUI()
        regReuseView()
    }
    
    func setData() {
        let plistPath = Bundle.main.path(forResource: "menuData", ofType: "plist")
        arrMenu = NSArray(contentsOfFile: plistPath!) as!  Array
        tableView.reloadData()
    }
    
    func setUI() {
        self.title = "示例页面"
        self.view.backgroundColor = UIColor.init(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1)
    }
    
    // 注册可复用视图
    func regReuseView() {
        tableView.register(Demo1stTableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    
    // MARK: - 数据源
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! Demo1stTableViewCell
        cell.countRow = countRow
        cell.countCol = countCol
        cell.arrMenu = arrMenu
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (UIScreen.main.bounds.size.width / CGFloat(countCol) + 8.0) * CGFloat(countRow) + 10.0 // 10.0 用于显示pageControl, 8.0 为单个菜单按钮高度与宽度的差 ,此处数字不需要修改
    }
}
