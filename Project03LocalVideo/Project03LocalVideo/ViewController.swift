//
//  ViewController.swift
//  Project03LocalVideo
//
//  Created by Han Jize on 2020/4/26.
//  Copyright © 2020 Han Jize. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    let webSourceUrl:String = "https://vfx.mtime.cn/Video/2019/01/15/mp4/190115161611510728_480.mp4"
    let webSourceUrl2:String = "https://media.w3.org/2010/05/sintel/trailer.mp4"
    
    @IBOutlet weak var videoTableView: UITableView!
    
    var data = [
           // 给项目编译后属于同一个module，所以Video不需要import就可以使用
           Video(image: "videoScreenshot01",
                 title: "Introduce 3DS Mario",
                 source: "Youtube - 06:32",
                 isWebUrl: true),
           Video(image: "videoScreenshot02",
                 title: "Emoji Among Us",
                 source: "Vimeo - 3:34",
                 isWebUrl: false),
           Video(image: "videoScreenshot03",
                 title: "Seals Documentary",
                 source: "Vine - 00:06",
                 isWebUrl: false),
           Video(image: "videoScreenshot04",
                 title: "Adventure Time",
                 source: "Youtube - 02:39",
                 isWebUrl: false),
           Video(image: "videoScreenshot05",
                 title: "Facebook HQ",
                 source: "Facebook - 10:20",
                 isWebUrl: false),
           Video(image: "videoScreenshot06",
                 title: "Lijiang Lugu Lake",
                 source: "Allen - 20:30",
                 isWebUrl: false)
       ]
    
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func playVieoButtonDidTouch(_ sender:AnyObject){
        //let path = Bundle.main.path(forResource:  "emoji zone", ofType: "mp4")
        
        //playerView = AVPlayer(url: URL(fileURLWithPath: path!))
        
        playerView = AVPlayer(url: URL(string: webSourceUrl)!)
        
        playViewController.player = playerView
        
        self.present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }
}

extension ViewController :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    // 知识点：向下转型
    // as! 强制类型转换，无法转换时会抛出运行时异常
    // as？可选类型转换，无法转换时返回nil
        
        let cell = videoTableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        let video = data[indexPath.row]

        cell.videoScreenshot.image = UIImage(named: video.image)
        cell.videoTitleLabel.text = video.title
        cell.videoSourceLabel.text = video.source
        
        return cell

    }
}

