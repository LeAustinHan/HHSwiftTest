//
//  ViewController.swift
//  Project07Refresh
//
//  Created by Han Jize on 2020/5/18.
//  Copyright © 2020 Han Jize. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    var index = 0
    let cellIdentifer = "HHCellIdentifier"
    
    let favoriteEmoji = ["💪💪💪💪💪💪","🌺🌺🌺🌺🌺🌺","🥛🥛🥛🥛🥛🥛","🚄🚄🚄🚄🚄🚄"]
    let newFavoriteEmoji = ["🌲🌲🌲🌲🌲🌲","☎️☎️☎️☎️☎️☎️","🍓🍓🍓🍓🍓🍓","⛄️⛄️⛄️⛄️⛄️⛄️","🍌🍌🍌🍌🍌🍌","😎😎😎😎😎😎","🖱🖱🖱🖱🖱🖱","☀️☀️☀️☀️☀️☀️",]
    var emojiData = [String]()
    var tableView:UITableView!
    
    var refreshControl = UIRefreshControl()
    
    //足以kScreen的使用，类似于Object-C中的宏定义。在Const.swift文件中声明全局变量kScreen
    var navBar:UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: kScreen.width, height: 64))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView = UITableView(frame: self.view.frame, style: .plain)
        
        emojiData = favoriteEmoji
        let emojiTableView = tableView
        
        emojiTableView?.backgroundColor = UIColor(red:0.092, green:0.096, blue:0.116, alpha:1)
        emojiTableView?.dataSource = self
        emojiTableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifer)
        
        tableView.refreshControl = self.refreshControl
        self.refreshControl.addTarget(self, action: #selector(didRoadEmoji), for: .valueChanged)
        self.refreshControl.backgroundColor = UIColor(red:0.113, green:0.113, blue:0.145, alpha:1)
        
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.refreshControl.attributedTitle = NSAttributedString(string: "Last updated on \(Date())", attributes: attributes)
        self.refreshControl.tintColor = UIColor.white
        
        self.navigationItem.title = "test title"
        self.navBar.barStyle = UIBarStyle.black
        self.navBar.isTranslucent = true
        self.navBar.topItem;
        emojiTableView?.rowHeight = UITableView.automaticDimension
        emojiTableView?.estimatedRowHeight = 60.0
        emojiTableView?.tableFooterView = UIView(frame: CGRect.zero)
        emojiTableView?.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        
        self.view.addSubview(emojiTableView!)
        self.view.addSubview(navBar)
    }
    
    @objc func didRoadEmoji() {
        print("didRoadEmoji")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.emojiData = [self.newFavoriteEmoji,self.favoriteEmoji][self.index]
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
            self.index = (self.index + 1) % 2
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

}

extension ViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer)! as UITableViewCell
        cell.textLabel!.text = self.emojiData[indexPath.row]
        cell.textLabel!.textAlignment = NSTextAlignment.center
        cell.textLabel!.font = UIFont.systemFont(ofSize: 50)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
    
}

