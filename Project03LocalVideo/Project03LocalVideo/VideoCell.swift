//
//  VideoCell.swift
//  Project03LocalVideo
//
//  Created by Han Jize on 2020/4/26.
//  Copyright © 2020 Han Jize. All rights reserved.
//

import UIKit

typealias block  = ()->Void

struct Video {
    let image: String
    let title: String
    let source: String
    let isWebUrl: Bool
    
}

class VideoCell: UITableViewCell {
    @IBOutlet weak var videoScreenshot: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoSourceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
