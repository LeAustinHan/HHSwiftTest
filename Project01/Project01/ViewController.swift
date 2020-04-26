//
//  ViewController.swift
//  Project01
//
//  Created by Han Jize on 2020/4/24.
//  Copyright © 2020 Han Jize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //都是一定存在的属性，用叹号
    @IBOutlet weak var playBtn:UIButton!
    @IBOutlet weak var pauseBtn:UIButton!
    @IBOutlet weak var timeLabel:UILabel!
    //可以先复制，后跟着 属性设置观察等方法
    var counter:Float = 0.0 {
        //属性观察者
        didSet {
            timeLabel.text = String(format: "%.1f", counter)
        }
    }
    //可以在不用timer时收回内存
    var timer:Timer? = Timer()
    var isPlaying = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 符合LosslessStringConvertible协议的，
        // 都可以直接初始化一个String对象
        // timeLabel.text = String(counter)
        /*
         疑问，LosslessStringConvertible协议？
         查阅官方文档：https://developer.apple.com/documentation/swift/losslessstringconvertible
         概要：一种协议，遵循此协议的实例可以由表达String，并且可以根据String重新生成该实例。例如 1050，可以表达为“1050”，并且 “1050”.intValue
         */
        counter = 0.0
        timeLabel.textAlignment = NSTextAlignment.center
    }
    
    @IBAction func resetButtonDidTouch(_ sender:UIButton) {
        if let timerTemp = timer {
            timerTemp.invalidate()
        }
        timer = nil
        isPlaying = false
        counter = 0
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
    
    @IBAction func playButtonDidTouch(_ sender:UIButton) {
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
            self.counter = self.counter + 0.1
        })
    }
    
    @IBAction func pauseButtonDidTouch(_ sender:UIButton) {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        if let timerTemp = timer {
            timerTemp.invalidate()
        }
    }
}

