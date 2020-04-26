//
//  HHSNetWork.swift
//  HHSwiftTest_Example
//
//  Created by Han Jize on 2020/4/23.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

import AFNetworking


class HHSNetWork: AFHTTPSessionManager {
    static let shareInstance : HHSNetWork = {
        
        let baseUrl = NSURL(string: "xxxxxx")!
        let configuration = URLSessionConfiguration.default
        let manager = HHSNetWork.init(baseURL: baseUrl as URL, sessionConfiguration: URLSessionConfiguration.default)
            //manager.requestSerializer.acceptableContentTypes = NSSet(objects: "application/json")
        return manager
        }()
    
    
    /**
    获取用户信息
    
    - parameter userAccount: 授权模型
    - parameter finfished:   回调
    - parameter error:       错误信息
    */
    func loadUserInfo(userAccount: String, finished: @escaping (_ objc: [String: AnyObject]?, _ error: NSError?)->())
    {
        let path = "http://dfubrap.test.xdf.cn/mock/146/api/lbocj/member/getClassList.json"
        
        // 1.封装参数
        let parameters = ["access_token": userAccount, "uid": userAccount]
        let headers = ["access_token": userAccount, "uid": userAccount]
        
        // 2.发送请求
        HHSNetWork.shareInstance.get(path, parameters: parameters, headers: headers, progress: { (downloadProgress:Progress)-> Void in
            
        }, success: { (_, JSON) -> Void in
            guard let dict = JSON as? [String: AnyObject] else
            {
                finished(nil, NSError(domain: "com.520it.lnj", code: 999, userInfo: ["message": "获取到的用户信息是nil"]))
                return
            }
            finished(dict, nil)
            
        },failure:{ (_, error) -> Void in
            finished(nil, error as NSError)
        })
    }
    
        /**
         get请求
         - parameter urlString:  请求的url
         - parameter parameters: 请求的参数
         - parameter success:    请求成功回调
         - parameter failure:    请求失败回调
         */
        class func get(urlString:String,parameters:AnyObject?,headers:AnyObject?,success:((_ responseObject:AnyObject?) -> Void)?,failure:((_ error:NSError) -> Void)?) -> Void {
            HHSNetWork.shareInstance.get(urlString, parameters: parameters, headers: headers as? [String : String], progress: { (progress) in }, success: { (task, responseObject) in
                
                //如果responseObject不为空时
                if responseObject != nil {
                    success!(responseObject as AnyObject?)
                }
                
                }, failure: { (task, error) in
                
                    failure!(error as NSError)
     
                })
        }
        /**
         post请求
         - parameter urlString:  请求的url
         - parameter parameters: 请求的参数
         - parameter success:    请求成功回调
         - parameter failure:    请求失败回调
         */
        class func post(urlString:String,parameters:AnyObject?,headers:AnyObject?,success:((_ responseObject:AnyObject?) -> Void)?,failure:((_ error:NSError) -> Void)?) -> Void {
            
            HHSNetWork.shareInstance.post(urlString, parameters: parameters, headers:headers as? [String : String], progress: { (progress) in
                
                }, success: { (task, responseObject) in
                    
                    //如果responseObject不为空时
                    if responseObject != nil {
                        
                        success!(responseObject as AnyObject?)
                    }
                    
            }) { (task, error) in
                
                failure!(error as NSError)
            }
    }
}
