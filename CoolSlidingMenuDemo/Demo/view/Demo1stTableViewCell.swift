//
//  Demo1stTableViewCell.swift
//  CoolSlidingMenu
//
//  Created by 陈波 on 2017/7/15.
//  Copyright © 2017年 陈波. All rights reserved.
//

import UIKit

class Demo1stTableViewCell: UITableViewCell,CoolSlidingMenuViewDelegate {
    
    public var countRow:Int! 
    public var countCol:Int!
    public var pgCtrlNormalColor: UIColor!
    public var pgCtrlSelectedColor: UIColor!
    public var pgCtrlShouldHidden: Bool!
    
    var slidingMenuView:CoolSlidingMenuView = CoolSlidingMenuView()
    var arrMenu: Array<Dictionary<String,String>> = [] {
        willSet {
            slidingMenuView.pgCtrl.isHidden = pgCtrlShouldHidden
            slidingMenuView.pgCtrlNormalColor = pgCtrlNormalColor
            slidingMenuView.pgCtrlSelectedColor = pgCtrlSelectedColor
            slidingMenuView.countRow = countRow
            slidingMenuView.countCol = countCol
        }
        didSet {
            slidingMenuView.arrMenu = arrMenu
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        slidingMenuView = CoolSlidingMenuView()
        slidingMenuView.delegate = self
        self.selectionStyle = .none
        self.contentView.addSubview(slidingMenuView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        slidingMenuView.contentMode = .scaleAspectFit
        slidingMenuView.frame = CGRect(x: 0, y: 0, width: self.contentView.bounds.size.width, height: self.contentView.bounds.size.height)
    }
    
    // MARK: CoolSlidingMenuDelegate
    func coolSlidingMenu(_ slidingBoxMenu: CoolSlidingMenuView, didSelectedItemAt index: Int) {
        print("点击了第\(index)个元素")
    }
    
}
