//
//  Landmark.swift
//  Nav
//
//  Created by maiyou on 2021/1/21.
//

import SwiftUI

struct Landmark:Hashable,Codable{
    var id:Int?
    var name:String?
    var park:String?
    var state:String?
    var description:String?
    
    private var imageName:String = ""
    var image:Image {
        Image(imageName)
    }
    
    init(){
        
    }
    
    init(id:Int,name:String,park:String,state:String,description:String) {
        self.id = id
        self.name = name
        self.park = park
        self.state = state
        self.description = description
    }
    
}
