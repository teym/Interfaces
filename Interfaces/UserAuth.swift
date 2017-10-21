//
//  UserAuth.swift
//  Interfaces
//
//  Created by 王航 on 2017/10/21.
//  Copyright © 2017年 mike. All rights reserved.
//

import Foundation

@objc public protocol UserAuth:AnyObject {
    @objc var uid:String?{get}
    @objc var token:String?{get}
}
