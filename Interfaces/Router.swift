//
//  Router.swift
//  Interfaces
//
//  Created by 王航 on 2017/10/21.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

@objc public enum RouteType:Int{
    case push
    case replase
}

@objc public protocol Router: AnyObject {
    typealias Middleware = (RouteType, [String : Any], UIViewController?, () -> Void) -> Void

    func push(path:String)
    func push(path:String, parameters:[String:Any], pass:[String:Any])
    func replace(path:String)
    func replace(path:String, parameters:[String:Any], pass:[String:Any])
    func pop()
    
    func addRouter(path:String,comptent:@escaping (String,[String:Any])->UIViewController?)
    func addDefaultRouter(comptent:@escaping (String,[String:Any])->UIViewController?)
    func addSubRouter(path:String, comptent:@escaping (String,[String:Any])->Void) -> Router
    
    func addMiddleware(middleware:@escaping Middleware)
}
