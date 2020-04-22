//
//  HHSLearView.swift
//  HHSwiftTest_Example
//
//  Created by Han Jize on 2020/4/22.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
/*
 使用 rawValue 属性来访问一个枚举成员的原始值。
枚举的关联值是实际值，并不是原始值的另一种表达方法。实际上，如果没有比较有意义的原始值，你就不需要提供原始值。
 在任何已知变量类型的情况下都可以使用缩写。
 使用 struct 来创建一个结构体。结构体和类有很多相同的地方，包括方法和构造器。它们之间最大的一个区别就是结构体是传值，类是传引用。
 */
typealias DrinkExamProtocol = DrinkProtocol & ExamProtocol

protocol ExamProtocol {
    var simDescription:String { get }
    mutating func adjust()
     
}

protocol DrinkProtocol {
    mutating func drinkKind(akhole:Bool)
}

//extension Int:ExamProtocol {
//    var simDescription: String {
//        return "The number "
//    }
//    mutating func adjust() {
//        print("use ExamProtocol")
//    }
//}

enum HHError:Error{
    case networkError
    case uiError
    case needError
}

enum HHRank:Int,DrinkExamProtocol{
    mutating func drinkKind(akhole: Bool) {
        if akhole {
            print("normal drink")
        }else{
            print("alkhole drink")
        }
    }
    
    var simDescription: String{
        let test = self.rankName()
        return "The number \(test)"
    }
    
    mutating func adjust() {
        print("test protocoal")
    }
    
    case kRankGolden = 1
    case kRankSliver
    case kRankGray
    
    func rankName() -> String {
        if  self.rawValue == HHRank.kRankGray.rawValue {
            return "kRankGray"
        }else{
            
        }
        return "other Color"
    }
}

extension Double {
    var absoluteValue:String {
        return ""
    }
}

class HHSLearView: UIView,ExamProtocol {
    var simDescription: String
    var titleLabel:UILabel = UILabel.init()
    var viewRank:HHRank?
    override init(frame: CGRect) {
        self.simDescription = ""
        defer {
            print("HHSLearView init function end ")
        }
        super.init(frame: frame)
        self.titleLabel.frame = CGRect(x: 0, y: 0, width: self.frame.size.width/2, height: self.frame.size.height/2)
        self.titleLabel.backgroundColor = UIColor.clear
        self.titleLabel.isUserInteractionEnabled = false
        self.titleLabel.textColor = UIColor.white
        self.titleLabel.textAlignment = NSTextAlignment.center
        self.titleLabel.text = "学习Swift"
        self.viewRank = .kRankSliver
        print("********" + (self.viewRank?.rankName() ?? ""))
        print("#######" + (self.viewRank?.simDescription ?? ""))
        self.addSubview(self.titleLabel)
        do {
            let printTryThrows = try tryThrows()
            print(printTryThrows)
        } catch HHError.needError{
            print("test do catch ")
        } catch HHError.uiError{
            print("test do catch ")
        } catch HHError.networkError{
            print("test do catch")
        } catch {
            print("test do catch \(error)")
        }
    }
    required init?(coder: NSCoder) {
        self.simDescription = ""
        super.init(coder: coder)
        let enumValue:HHRank? = HHRank.init(rawValue: 2)
        print("test enum + \(enumValue?.rankName() ?? "")")
    }
    
    func addButton() {
        let clickButton = UIButton.init(type: UIButtonType.custom)
        clickButton.backgroundColor = UIColor.orange
        clickButton.addTarget(self, action: #selector(buttonClick), for: UIControlEvents.touchUpInside)
        clickButton.frame = self.frame
        self.insertSubview(clickButton, belowSubview: self.titleLabel)
    }
    
    @objc func buttonClick(_ button: UIButton) {
         print("test buttonClick HHSLearView")
    }
    
    func tryThrows()throws -> String {
        throw HHError.needError
    }
    
    func adjust() {
        print("test protocoal")
    }

}
