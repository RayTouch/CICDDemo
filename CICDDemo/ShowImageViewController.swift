//
//  ShowImageViewController.swift
//  CICDDemo
//
//  Created by Ray on 2019/7/3.
//  Copyright © 2019 Ray. All rights reserved.
//

import UIKit
import SDWebImage

class ShowImageViewController: UIViewController {

    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func btnTest(_ sender: UIButton) {
        self.textField.text = self.imageURL
        guard let url = URL(string: self.imageURL) else { return }
        self.showImageView.sd_setImage(with: url, completed: nil)
    }
    private let imageURL: String = "http://i.17173cdn.com/0561y4/YWxqaGBf/gamebase/game-cover-horizontal/ffHbmObmCgEwxCD.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
