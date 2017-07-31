//
//  ViewController.swift
//  CoolSlidingMenu
//
//  Created by 陈波 on 2017/7/15.
//  Copyright © 2017年 陈波. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stepperRowsCount: UIStepper!
    @IBOutlet weak var stepperColsCount: UIStepper!
    @IBOutlet weak var stepperItemsCount: UIStepper!
    
    @IBOutlet weak var lblRows: UILabel!
    @IBOutlet weak var lblCols: UILabel!
    @IBOutlet weak var lblItemsCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        stepperRowsCount.minimumValue = 1;
        stepperRowsCount.maximumValue = 5;
        stepperColsCount.minimumValue = 4;
        stepperColsCount.maximumValue = 10;
        stepperItemsCount.minimumValue = 1;
        stepperItemsCount.maximumValue = 30;
        stepperRowsCount.value = 2;
        stepperColsCount.value = 5;
        stepperRowsCount.stepValue = 1;
        stepperColsCount.stepValue = 1;
        lblRows.text = String(Int(stepperRowsCount.value))
        lblCols.text = String(Int(stepperColsCount.value))
        lblItemsCount.text = String(Int(stepperItemsCount.value))
        stepperRowsCount.addTarget(self, action: #selector(stepperValueChanged), for: .touchUpInside)
        stepperColsCount.addTarget(self, action: #selector(stepperValueChanged), for: .touchUpInside)
        stepperItemsCount.addTarget(self, action: #selector(stepperValueChanged), for: .touchUpInside)
    }
    
    func stepperValueChanged() {
        lblRows.text = String(Int(stepperRowsCount.value))
        lblCols.text = String(Int(stepperColsCount.value))
        lblItemsCount.text = String(Int(stepperItemsCount.value))
    }
    
    @IBAction func btnBottomClicked(_ sender: Any) {
        let tvc = DemoTableViewController(style: .plain)
        tvc.countRow = Int(stepperRowsCount.value)
        tvc.countCol = Int(stepperColsCount.value)
        self.navigationController?.pushViewController(tvc, animated: true)
    }
    
    
}

