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
//            "task-version": "1",
//            "device-name": "iPhone X",
//            "request-timestamp": "1611999494",
//            "channel": "wf8z",
//            "IMEI": "8A611DA1-CE1E-4B4A-8DC0-A5D34F4D2978",
//            "encryption": "3dbcb41ae1d463ca055f9c22bb66b044",
//            "udid":"",
//            "device-version": "iOS14.3",
            "token": "f9f02f3705f9bbe93130eab1e538ab14",
//            "Accept-Language": "zh-Hans-CN;q=1, zh-Hant-HK;q=0.9, en-AU;q=0.8, zh-Hant-CN;q=0.7, yue-Hant-CN;q=0.6",
//            "sdk-version": "43",
//            "device-size": "5",
//            "device-type": "10",
            "username": "18092019028",
//            "Accept": "*/*",
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
        AF.request(url, method: .post, parameters: params, encoder: JSONParameterEncoder.default, headers: self.getHeader()).responseJSON { (response) in
            guard let json = response.value else {
                return
            }
            switch response.result {
            case .success:
                successComplete(json as! NSDictionary)
                break
            case.failure(let error):
                print(error)
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
