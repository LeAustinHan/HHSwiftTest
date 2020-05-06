//
//  ViewController.swift
//  Project04三屏滑动和相机
//
//  Created by Han Jize on 2020/4/26.
//  Copyright © 2020 Han Jize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView:UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let leftVCL : UIViewController = UINib(nibName: "LeftViewController", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIViewController
        let centerVCL :CameraViewController = CameraViewController(nibName: "CameraViewController", bundle: nil)
        let rightVCL : RightViewController = RightViewController(nibName: "RightViewController", bundle: nil)
        
        leftVCL.view.frame = CGRect(x: 0, y: 0, width: screenWidth-200, height: screenHeight)
        centerVCL.view.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: screenHeight)
        rightVCL.view.frame = CGRect(x: 2*screenWidth, y: 0, width: screenWidth, height: screenHeight)
        
        self.scrollView.addSubview(leftVCL.view)
        self.scrollView.addSubview(centerVCL.view)
        self.scrollView.addSubview(rightVCL.view)
        
        self.scrollView.contentSize = CGSize(width: screenWidth * 3, height: screenHeight)
        self.scrollView.isPagingEnabled = true
        
    }


}

