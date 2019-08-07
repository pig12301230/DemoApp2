//
//  Cell.swift
//  Demo
//
//  Created by 莊英祺 on 2019/8/7.
//  Copyright © 2019 Winston. All rights reserved.
//

import Foundation
import UIKit

class Cell: UICollectionViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnail: CustomImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
