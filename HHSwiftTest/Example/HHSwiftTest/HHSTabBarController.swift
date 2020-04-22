//
//  HHSTabBarController.swift
//  HHSwiftTest_Example
//
//  Created by Han Jize on 2020/4/22.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class HHSTabBarController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self;
        self.navigationController?.title = "更进一步SWIFT"
        
        let firstVCL:HHSFirstViewController = HHSFirstViewController()
        firstVCL.tabBarItem.title = "基础知识"
        firstVCL.view.backgroundColor = UIColor.orange
        firstVCL.tabBarItem.image = UIImage.init(named: "tab_flash")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        firstVCL.titleText = "基础知识"
        let baseTab : UINavigationController = UINavigationController.init(rootViewController: firstVCL)
        
        let secondVCL:HHSFirstViewController = HHSFirstViewController()
        secondVCL.tabBarItem.title = "进阶知识"
        secondVCL.view.backgroundColor = UIColor.cyan
        secondVCL.titleText = "进阶知识"
        secondVCL.tabBarItem.image = UIImage.init(named: "tab_enroll")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let upTab : UINavigationController = UINavigationController.init(rootViewController: secondVCL)
        
        let thirdVCL:HHSFirstViewController = HHSFirstViewController()
        thirdVCL.tabBarItem.title = "项目知识"
        thirdVCL.view.backgroundColor = UIColor.magenta
        thirdVCL.titleText = "项目知识"
        thirdVCL.tabBarItem.image = UIImage.init(named: "tab_member")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let projectTab : UINavigationController = UINavigationController.init(rootViewController: thirdVCL)
//        
        self.viewControllers = [baseTab,upTab,projectTab]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        super.present(viewControllerToPresent, animated: flag) {
        }
    }

}
