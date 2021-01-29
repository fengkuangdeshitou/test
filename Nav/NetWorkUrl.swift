//
//  NetWorkUrl.swift
//  Nav
//
//  Created by maiyou on 2020/12/17.
//

import UIKit

let baseUrl = "https://api.apiopen.top/"

let newJokeUrl = baseUrl + "getJoke"

class NetWorkUrl: NSObject {
    
    static let MemberInfoUrl = "http://api3.app.99maiyou.com/base/common/getMemberInfo"
    static let ActivitysUrl = "http://api3.app.99maiyou.com/base/common/getActivitys"
    
    class func newJoke() -> String {
        return newJokeUrl
    }
}
