//
//  ListDetail.swift
//  Nav
//
//  Created by maiyou on 2021/1/21.
//

import SwiftUI

struct ListDetail: View {
    var landmark:Landmark?
    var body: some View {
        Text(landmark!.name!)
            .navigationBarTitle("详情")
            .navigationBarItems(trailing: Button("item", action: {

            }))
    }
}

struct ListDetail_Previews: PreviewProvider {
    static var previews: some View {
        ListDetail()
    }
}
