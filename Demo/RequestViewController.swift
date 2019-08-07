//
//  RequestViewController.swift
//  Demo
//
//  Created by 莊英祺 on 2019/8/7.
//  Copyright © 2019 Winston. All rights reserved.
//

import Foundation
import UIKit

class RequestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func requestButtonClicked(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        self.navigationController?.pushViewController(vc, animated: true)
     }
}
