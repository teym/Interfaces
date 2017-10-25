//
//  UserAuth.swift
//  Interfaces
//
//  Created by 王航 on 2017/10/21.
//  Copyright © 2017年 mike. All rights reserved.
//

import Foundation

@objc public protocol UserAuth:AnyObject {
    var pid:String?{get}
    var uid:String?{get}
    @objc var token:String?{get}
    func refresh();
    func invalidate();
    func login(name:String,pass:String,handle:(String?,Error?)->Void)
    func anonymous(type:String,token:[String:Any],handle:(String?,Error?)->Void)
}
