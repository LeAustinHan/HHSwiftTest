//
//  HHSFirstViewController.swift
//  HHSwiftTest_Example
//
//  Created by Han Jize on 2020/4/22.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

import Masonry

class HHSFirstViewController: HHSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.addButton()
    }
    
    func addButton() {
        let clickButton = UIButton.init(type: UIButtonType.custom)
        clickButton.backgroundColor = UIColor.magenta
        clickButton.setTitle("Masonry布局", for: UIControlState.normal)
        clickButton.addTarget(self, action: #selector(buttonClick), for: UIControlEvents.touchUpInside)
        clickButton.frame = CGRect.zero
        self.view.addSubview(clickButton)
        clickButton.mas_makeConstraints { (make) in
            make?.center.equalTo()(self.view)
            make?.width.offset()(self.view.frame.size.width/2)
            make?.height.offset()(self.view.frame.size.width*0.25*0.618)
        }
    }
    
    
    @objc func buttonClick(_ button: UIButton) {
         print("test buttonClick HHSLearnUpView")
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
