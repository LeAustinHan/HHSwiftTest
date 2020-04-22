//
//  HHSLearnUpView.swift
//  HHSwiftTest_Example
//
//  Created by Han Jize on 2020/4/22.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class HHSLearnUpView: HHSLearView {
    var sideLength:Double = 0.0
    var name:String = ""
    init(name:String,radio:Double) {
        super.init(frame: CGRect.zero)
        self.name = name
        self.sideLength = radio * 2
        print(self.name + String(self.sideLength))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func resetFrame(_ frame:CGRect) {
        self.frame = frame
        self.titleLabel.frame = frame
        self.titleLabel.text = "更进一步SWIFT"
        self.addButton()
    }
    
    func area() -> Double {
        return self.sideLength*self.sideLength
    }
    
    @objc override func buttonClick(_ button: UIButton) {
         print("test buttonClick HHSLearnUpView")
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    var questionValue:Double {
        get{
            return sideLength*10
        }
        set {
            sideLength = newValue/10
        }
    }
    
    var oldName:String{
        get {
            return "old +\(name)"
        }
        set (inputValue){
            name = inputValue + " new"
            print("name == \(name)")
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
