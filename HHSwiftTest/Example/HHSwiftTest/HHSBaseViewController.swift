//
//  HHSBaseViewController.swift
//  HHSwiftTest_Example
//
//  Created by Han Jize on 2020/4/22.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class HHSBaseViewController: UIViewController {
    
    convenience init(_ title:String){
        self.init()
        self.titleText = title
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = self.titleText
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = UIColor.black

        // Do any additional setup after loading the view.
    }
    var viewModel : HHSBaseControllerViewModel = HHSBaseControllerViewModel.init()
    var titleText : String{
        get {
            return ""
        }
        set {
            //self.view.backgroundColor = UIColor.lightGray
            self.navigationItem.title = newValue
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
