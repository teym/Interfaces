//
//  Network.swift
//  Interfaces
//
//  Created by 王航 on 2017/10/21.
//  Copyright © 2017年 mike. All rights reserved.
//

import Foundation

@objc public protocol NetworkResponse:AnyObject {
    var headers: [String : String]?{get}
    var mimeType: String?{get}
    var data: Data{get}
    var statusCode: Int{get}
    var URL: URL?{get}
    var error: Error?{get}
}

@objc public protocol NetworkTask:AnyObject {
    @discardableResult
    func response(success:@escaping (Data,NetworkResponse)->Void, failure:@escaping (Error?,NetworkResponse?)->Void) -> NetworkTask
    @discardableResult
    func responseJSON(success:@escaping (Any,NetworkResponse)->Void, failure:@escaping (Error?,NetworkResponse?)->Void) -> NetworkTask
    @discardableResult
    func progress(block:@escaping (Float)->Void) -> NetworkTask
}

@objc public enum ReachabilityType:Int{
    case notReachable
    case reachableWiFi
    case reachableWWAN
}

@objc public protocol Network:AnyObject {
    typealias URLMap = (String,String)->String
    var requestMap:URLMap?{get set}
    var reachability:ReachabilityType {get}
    func request(url:String, method:String, parameters:Any?, headers:[String:String]?) -> NetworkTask
    func upload(url:String,files:[String:AnyObject], headers:[String:String]?) -> NetworkTask
}
