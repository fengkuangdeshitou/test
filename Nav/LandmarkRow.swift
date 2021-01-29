//
//  LandmarkRow.swift
//  Nav
//
//  Created by maiyou on 2021/1/21.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark:Landmark?
    var body: some View {
        HStack{
            landmark?.image
                .resizable()
                .frame(width: 44, height: 44, alignment: .center)
            Text(landmark!.name!)
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow()
    }
}
