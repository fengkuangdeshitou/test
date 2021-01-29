//
//  PersonHeader.swift
//  Nav
//
//  Created by maiyou on 2021/1/20.
//

import SwiftUI

struct PersonHeader: View {
    var data:[Int] = [0,1]
    var body: some View {
        NavigationView(content: {
            LandmarkList()
            .navigationBarTitle("首页", displayMode: .inline)
            .navigationBarItems(trailing: Button("确定", action: {

            })
                .foregroundColor(.white)
                .frame(width: 44, height: 44, alignment: .center)
                .background(Color.yellow)
                .offset(x: 10, y: 0)
            )
        })
    }
}

struct PersonHeader_Previews: PreviewProvider {
    static var previews: some View {
        PersonHeader()
        
    }
}
