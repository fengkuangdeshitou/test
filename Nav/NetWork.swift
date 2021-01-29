//
//  NetWork.swift
//  Nav
//
//  Created by maiyou on 2020/12/17.
//

import UIKit
import Alamofire
typealias successHandle = (AnyObject) -> Void
typealias failureHandle = (String) -> Void

class NetWork : NSObject {
    static func getHeader() -> HTTPHeaders {
        return [
            "userid":"24403",
            "token":"$2y$10$SAyZYvmtfXYbxdo2rFc1TOBYUOuuO.pR/jmY7LzSLfrYJb1Zlu5iG",
            "phone":"18092019028"
        ]
    }
    
    static func get<T:Encodable>(url:String,params:[String:T]?, success:@escaping successHandle,failure:@escaping failureHandle) {
        AF.request(url, method: .get, parameters: params, encoder: URLEncodedFormParameterEncoder.default, headers: self.getHeader()).responseJSON { (response) in
            guard let json:Dictionary = response.value as? Dictionary<String, Any> else {
                return
            }
            switch response.result {
            case .success:
                success(json as NSDictionary)
                break
            case.failure:
                failure(json["message"] as! String)
                break
            }
        }
    }
    
    static func post<T:Encodable>(url:String,params:[String:T]? = nil,successComplete:@escaping successHandle,failure:@escaping failureHandle) {
        AF.request(url, method: .post, parameters: params, encoder: URLEncodedFormParameterEncoder.default, headers: self.getHeader()).responseJSON { (response) in
            guard let json = response.value else {
                return
            }
            switch response.result {
            case .success:
                successComplete(json as! NSDictionary)
                break
            case.failure(let error):
                break
            }
        }
    }
    
    
//    static func post<T:Encodable>(url:String,params:[String:T]?,success:@escaping successHandle,failure:@escaping failureHandle) {
//        AF.request(url, method: .post, parameters: params, encoder: URLEncodedFormParameterEncoder.default, headers: self.getHeader()).responseJSON { (response) in
//            guard let json:Dictionary = response.value as? Dictionary<String, Any> else {
//                return
//            }
//            switch response.result {
//            case .success:
//                success(json as NSDictionary)
//                break
//            case.failure:
//                failure(json["message"] as! String)
//                break
//            }
//        }
//    }
    
}
