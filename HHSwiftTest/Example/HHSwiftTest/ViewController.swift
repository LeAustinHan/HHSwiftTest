//
//  ViewController.swift
//  HHSwiftTest
//
//  Created by LeAustinHan on 04/14/2020.
//  Copyright (c) 2020 LeAustinHan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("hello swift")
/*      常亮和变量 不用明确地声明类型,值永远不会被隐式转换为其他类型,需转换,
        把值转换成字符串的方法：把值写到括号中，并且在括号之前写一个反斜杠\()
         使用三个双引号（"""）来包含多行字符串内容
         在 if 语句中，条件必须是一个布尔表达式—
         使用 if 和 switch 来进行条件操作，使用 for-in、while 和 repeat-while 来进行循环。包裹条件和循环变量的括号可以省略，但是语句体的大括号是必须的
         运行 switch 中匹配到的 case 语句之后，程序会退出 switch 语句，并不会继续向下运行，所以不需要在每个子句结尾写 break。
         你可以使用 for-in 来遍历字典，需要一对儿变量来表示每个键值对。
         你可以在循环中使用 ..< 来表示下标范围
         使用 ..< 创建的范围不包含上界，如果想包含的话需要使用 ...
 */
        var myVariable = 42
        myVariable = 50
        let myConstant = 42
        let explicitDouble:Double = 70
        //exercise
        let weight:Float = 4
        let tip = "keep health"
        let slognText = tip + String(weight)
        
        let slognTextSimple = "simple keep health  \(tip)"
        print(slognText)
        print(slognTextSimple)
        
        let sentences = """
let me tell you something
yes the world is complex \(tip) and \(weight)
"""
        print(sentences)
        var zoo = ["dog","cat","fish"];
        zoo[0] = "bear"
        zoo.append("tiger")
        print(zoo)
        var bagDic = [
            "pc":"macbook",
            "phone":"iPhone",
            "key":"car_key",
        ]
        bagDic["pc"] = "iPad"
        print(bagDic)
        var emptyArray = [String]()
        var emptyDic = [String:NSNumber]()
        emptyArray.append("China")
        emptyArray.append("Japan")
        print(emptyArray)
//        var home = []
//        home.append("mimi")
        for animal in zoo {
            if animal == "cat" {
                print("find mimi")
            }
        }
        
        let animal = "bear"
        switch animal {
        case "fish":
            print("find fish")
        case "bear":
            print("find bear")
        case "dog":
            print("find dog")
        default:
            print("cant find fish")
        }
        
        for (key,thing) in bagDic {
            print("print key \(key) and value \(thing)")
        }
        
        var n = 2
        while n<100 {
            n *= 2
        }
        print(n)
        
        var m = 2
        repeat {
            m *= 2
        }while m<100
        print(m)
        
        for i in 0 ... 3 {
            print("try ... + \(i)")
        }
        for i in 0 ..< 3 {
            print("try ..< + \(i)")
        }
        
        
        /*
               [函数和闭包]
         默认情况下，函数使用它们的参数名称作为它们参数的标签，在参数名称前可以自定义参数标签，或者使用 _ 表示不使用参数标签。
         使用元组来生成复合值，比如让一个函数返回多个值。该元组的元素可以用名称或数字来获取。
         函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数。
         setter 中，新值的名字是 newValue。你可以在 set 之后的圆括号中显式地设置一个名字。
         
         处理变量的可选值时，你可以在操作（比如方法、属性和子脚本）之前加 ?。如果 ? 之前的值是 nil，? 后面的东西都会被忽略，并且整个表达式返回 nil。否则，可选值会被解包，之后的所有代码都会按照解包后的值运行。
        */
        var result = greet(person: "HanHan", vagetable: "tomato")
        print(result)
        result = greet(person: "HanHan", day: "Good day")
        print(result)
        //参数标签,参数可以加标签，XX：。或者缺省标签 “_”。
        let resultBag = greet(om: "HanHan", "Good day")
        print(resultBag.0)
        print(resultBag.1)
        print(resultBag.2)
        
        //print("lets clear room \(clearRoom(with: "hands").1)")
        
        let clearRoomItem = clear()
        
        print("start to \(clearRoomItem("test"))")
        updateLife(action: "wash", actionFunction: clearRoom(use:))
        
        let numbers = [33,57,23,66]
        let numPrt = numbers.map({
            (number:Int)->Int in
            if number % 2 == 1 {
                return 0
            }else{
                return number
            }
        })
        
        let numStatus = numbers.map({
            (number:Int)->String in
            if number % 2 == 1 {
                return "wihte"
            }else{
                return "black"
            }
        })
        print(numPrt)
        print(numStatus)
        let sortNumber = numbers.sorted{$0 > $1}
        print(sortNumber)
        
        let numberDouble = numbers.map{$0 * 2}
        print(numberDouble)
        
        let learnViewUp:HHSLearnUpView = HHSLearnUpView.init(name: "firstTest", radio: 3.14)
        learnViewUp.resetFrame(CGRect(x: 0, y: 44, width: self.view.frame.size.width, height: 100))
        self.view.addSubview(learnViewUp)
        learnViewUp.perimeter = 24
        learnViewUp.oldName = "lady GaGa"
//        learnViewUp.layer.cornerRadius = 8.0
//        learnViewUp.layer.masksToBounds = true
        
        print(learnViewUp.area())
        
        let firstVCL:HHSFirstViewController = HHSFirstViewController.init()
        self.navigationController?.pushViewController(firstVCL, animated: true)
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func learn(test:String) {
        
    }
    
    func greet(person:String,vagetable:String) -> String {
        return "Hello \(person),today is vagetable is \(vagetable)"
    }
    
    func greet(person:String,day:String) -> String {
        return "Hello \(person),today is vagetable is \(day)"
    }
    
    func greet(om person:String,_ bag:String) -> (String,String,String) {
        return ("Hello \(person),today is bag is \(bag)","test result","third ")
    }
    
    func clearRoom(with tool:String) -> (String,String) {
        return (tool,"tired")
    }
    //与上个函数属于同一类
    func clearRoom(use tool:String) -> (String,String) {
        return (tool,"tired")
    }
    
    func clear() -> ((String)->(String,String)) {
        print(clearRoom(use: "feet"))
        
        return clearRoom(with:)
    }
    
    func updateLife(action:String,actionFunction:((String)->(String,String))) {
        print(actionFunction(action));
    }
    
    

}


class HHPhone: NSObject {
    let life = "noLife"
    var height = 0.0
    var weight = 0
    var os = "iOS"
    var price = 4599.0
    var width = 0.0
    var name = ""
    init(name:String) {
        self.name = name
    }
    func type(system os:String) -> String{
        if os == "iOS" {
            return "iPhone"
        }else{
            return "OtherPhone"
        }
    }
    
    func area()->Double{
        return height * width
    }
}

class HHiPhone11: HHPhone {
    var video = ""
    init(price:String,name:String) {
        super.init(name: name)
        self.video = self.startHDVideo(name)
    }
    var standCamera = ""
    func startHDVideo(_ name:String) -> String {
        return name + "Success"
    }
    var voice : Double {
        get {
            return price*3
        }
        set {
            price = width/5
        }
    }
}

