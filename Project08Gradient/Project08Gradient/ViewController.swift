//
//  ViewController.swift
//  Project08Gradient
//
//  Created by Han Jize on 2020/5/19.
//  Copyright © 2020 Han Jize. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    let gradientLayer = CAGradientLayer()
    
    var timer : Timer?
    
    var backgroundColor:(red: CGFloat, green: CGFloat,blue: CGFloat,alpha:CGFloat)!{
        didSet {
            let color1 = UIColor(red: backgroundColor.blue, green: backgroundColor.green, blue: 0, alpha: backgroundColor.alpha).cgColor
            let color2 = UIColor(red: backgroundColor.red, green: backgroundColor.green, blue: backgroundColor.blue, alpha: backgroundColor.alpha).cgColor
            gradientLayer.colors = [color1,color2];
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    @IBAction func playMusicButtonDidTouch(_ sender:AnyObject){
        
        let bgMusic = URL(fileURLWithPath: Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")!)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: bgMusic)
            
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch let audioError as NSError {
            print(audioError)
        }
        
        if (timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.randomColor), userInfo: nil, repeats: true)
        }
        
        let redValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        let greenVlaue = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor(red: redValue, green: greenVlaue, blue: blueValue, alpha: 1.0)
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        self.view.layer.addSublayer(gradientLayer)
    }
    
    @objc func randomColor(){
        let redValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        let greenVlaue = CGFloat(drand48())
        
        backgroundColor = (redValue,blueValue,greenVlaue,1)
    }

}

