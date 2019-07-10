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
        //self.showImageView.sd_setImage(with: url, completed: nil)
        
        self.showImageView.sd_setImage(with: url) { (image, error, catche, url) in
            guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "second") as? SecondViewController else { return }
            
            self.present(vc, animated: true, completion: nil)
        }
    }
    private let imageURL: String = "http://i.17173cdn.com/0561y4/YWxqaGBf/gamebase/game-cover-horizontal/ffHbmObmCgEwxCD.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
