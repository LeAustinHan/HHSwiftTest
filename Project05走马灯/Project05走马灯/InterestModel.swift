//
//  InterestModel.swift
//  Project05走马灯
//
//  Created by Han Jize on 2020/4/28.
//  Copyright © 2020 Han Jize. All rights reserved.
//

import UIKit

class InterestModel {
    var title = ""
    var description = ""
    var numberOfPosts = 0
    var numberOfMembers = 0
    var featuredImage : UIImage!
    
    init(title: String,description:String, featuredImage: UIImage!){
        self.title = title
        self.description = description
        self.featuredImage = featuredImage
        numberOfPosts = 1
        numberOfMembers = 1
    }
    
    static func createInsterestModel() -> [InterestModel]
    {
        return [
            InterestModel(title: "Hello there, i miss u.", description: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "hello")!),
            InterestModel(title: "🐳🐳🐳🐳🐳", description: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "dudu")!),
            InterestModel(title: "Training like this, #bodyline", description: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "bodyline")!),
            InterestModel(title: "I'm hungry, indeed.", description: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "wave")!),
            InterestModel(title: "Dark Varder, #emoji", description: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "darkvarder")!),
            InterestModel(title: "I have no idea, bitch", description: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "hhhhh")!),
        ]
    }

}
