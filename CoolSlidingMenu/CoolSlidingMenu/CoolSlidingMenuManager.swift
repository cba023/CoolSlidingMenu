//
//  CoolSlidingMenuManager.swift
//  CoolSlidingMenu
//
//  Created by 陈波 on 2017/7/15.
//  Copyright © 2017年 陈波. All rights reserved.
//

import UIKit

class CoolSlidingMenuManager: NSObject {
    static public let manager = CoolSlidingMenuManager()
    private override init() {
        // 静默处理
    }
    
    func convertDirectionCount(Number number:Int, RowCount rowCount: Int, ColCount colCount: Int) -> Int {
        //        if number % ColCount == 0 {
        //            return number - number % (RowCount * ColCount) / ColCount
        //        }
        //        else {
        //            return (((RowCount * ColCount) - 1) - number % (RowCount * ColCount)) / ColCount + number;
        //        }

        let tempH = number / (colCount * rowCount)
        let tempL = number % (colCount * rowCount)
        let result:Int = tempL - (tempL / rowCount) * (rowCount - 1) + tempL % rowCount * (colCount - 1) + tempH * (colCount * rowCount)
        print("排序前:",number,"行数：",rowCount, "列数：" ,"tempH:",tempH,"tempL:",tempL, colCount,"----->",result)
        return result
    }

}
