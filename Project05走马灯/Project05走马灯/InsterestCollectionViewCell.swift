//
//  InsterestCollectionViewCell.swift
//  Project05走马灯
//
//  Created by Han Jize on 2020/4/28.
//  Copyright © 2020 Han Jize. All rights reserved.
//

import UIKit

class InsterestCollectionViewCell: UICollectionViewCell {
    
    var insterest : InterestModel! {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var featuredImageView : UIImageView!
    @IBOutlet weak var interestTitleLabel:UILabel!
    
    fileprivate func updateViews(){
        interestTitleLabel?.text! = insterest.title
        featuredImageView?.image! = insterest.featuredImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}
