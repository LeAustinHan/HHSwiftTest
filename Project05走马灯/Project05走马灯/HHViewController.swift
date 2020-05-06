//
//  ViewController.swift
//  Project05走马灯
//
//  Created by Han Jize on 2020/4/28.
//  Copyright © 2020 Han Jize. All rights reserved.
//

import UIKit

class HHViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView :UIImageView!
    @IBOutlet weak var colectionView: UICollectionView!
    
//    @IBOutlet weak var currentUserProfileImageButton:UIButton!
//    @IBOutlet weak var currentUserFullNameButton: UIButton!
    
    fileprivate var interests = InterestModel.createInsterestModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.colectionView.isPagingEnabled = true
    }
    //override 复写，重复写父类的属性，可以看到父类的UIViewController的 preferredStatusBarStyle属性是open修饰的
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    fileprivate struct Storyboard {
        static let CellIdentifier = "InterestCell"
        static let CellPadding: CGFloat = 20.0
    }
}

extension HHViewController : UICollectionViewDataSource {//不同于OC，把继承和实现代理写到一起。Swift 更适合把实现代理同类分开写
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! InsterestCollectionViewCell//这样强转
        cell.insterest = self.interests[indexPath.item]//设置值触发 cell的UI更新。更符合 数据 触发 UI 的思想
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension HHViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 2 * Storyboard.CellPadding, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2 * Storyboard.CellPadding
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: Storyboard.CellPadding, bottom: 0, right: Storyboard.CellPadding)
    }
}

extension HHViewController : UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>){
        let originPoint = targetContentOffset.pointee;
        var index = Int(originPoint.x / UIScreen.main.bounds.width)
        let offset = Int(originPoint.x) % Int(UIScreen.main.bounds.width)
        index += (offset > Int(UIScreen.main.bounds.width/2) ? 1 : 0)
        targetContentOffset.pointee = CGPoint(x: index * Int(UIScreen.main.bounds.width) , y: 0)
    }
}

