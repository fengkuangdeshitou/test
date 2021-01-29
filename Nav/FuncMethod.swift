//
//  FuncMethod.swift
//  Nav
//
//  Created by maiyou on 2020/12/22.
//

import Foundation

class FuncMethod {
    
    init() {
        let result = function3(funcParams: function2(a:b:), x: 1, y: 1)
        print("aaaaaa=\(result)", separator: "开始", terminator: "end")
        
        function4(x: 2, y: 3)(1,1)
        
    }
    
    func function1(a x:Int,b y:Int) -> Int {
        return x + y
    }
    
    func function2(a x:Int,b y:Int) -> Int {
        return x - y
    }
    
    func function3(funcParams:(Int,Int) -> Int,x:Int,y:Int) -> Int {
        return funcParams(x,y)
    }
    
    func function4(x:Int,y:Int) -> (Int,Int) -> Int {
        return x < y ? function1(a:b:) : function2(a:b:)
    }
    
}
