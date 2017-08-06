//
//  CoolSlidingMenuCollectionViewCell.swift
//  CoolSlidingMenu
//
//  Created by 陈波 on 2017/7/15.
//  Copyright © 2017年 陈波. All rights reserved.
//

import UIKit

class CoolSlidingMenuCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgViewIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    public var dicMenu:Dictionary<String, Any>! = nil {
        didSet {
            imgViewIcon.image = UIImage(named: dicMenu["image"] as! String)
            lblTitle.text = dicMenu["title"] as? String
            lblTitle.adjustsFontSizeToFitWidth = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
}
