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
    
    @IBOutlet weak var lblRows: UILabel!
    @IBOutlet weak var lblCols: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        stepperRowsCount.minimumValue = 0;
        stepperRowsCount.maximumValue = 7;
        stepperColsCount.minimumValue = 0;
        stepperColsCount.maximumValue = 7;
        stepperRowsCount.value = 2;
        stepperColsCount.value = 5;
        stepperRowsCount.stepValue = 1;
        stepperColsCount.stepValue = 1;
        lblRows.text = String(Int(stepperRowsCount.value))
        lblCols.text = String(Int(stepperColsCount.value))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let tvc = DemoTableViewController(style: .plain)
        self.navigationController?.pushViewController(tvc, animated: true)
    }
    
    

}

