//
//  LandmarkList.swift
//  Nav
//
//  Created by maiyou on 2021/1/21.
//

import SwiftUI
import Alamofire

var landmarks:[Landmark] = [
//    Landmark(id: 0, name: "name0", park: "打开了手机福利费", state: "多久啦副经理", description: "大姐夫垃圾费临时冻结父类积分垃圾费了"),
//    Landmark(id: 1, name: "name1", park: "打开了发生率近福利费", state: "多久啦副经理", description: "大姐夫垃圾费临时冻结父类积分垃圾费了"),
//    Landmark(id: 2, name: "name2", park: "解放啦舒服了", state: "多久啦副经理", description: "大姐夫垃圾费临时冻结父类积分垃圾费了"),
//    Landmark(id: 3, name: "name3", park: "积分萨里看风景拉伸", state: "多久啦副经理", description: "大姐夫垃圾费临时冻结父类积分垃圾费了"),
//    Landmark(id: 4, name: "name4", park: "打开了手机福利费积分索拉卡积分", state: "健身房啦解放路卡萨丁", description: "大姐夫垃圾费临时冻结父类积分垃圾费了")
]

struct LandmarkList: View {
    
    init() {
        loadData()
    }
    
    var body: some View {
        List(landmarks, id: \.id) { landmark in
            NavigationLink(
                destination: ListDetail(landmark: landmark),
                label: {
                    LandmarkRow(landmark: landmark)
                }
            )
        }
        .background(Color.orange)
    }
    
    func loadData() {
        AF.request(NetWorkUrl.newJoke(), method: .get, parameters: ["page":"1","count":"10","type":"video"], encoder: URLEncodedFormParameterEncoder.default).responseJSON { (response) in
            switch response.result {
            case .success:
                let json = response.value as! Dictionary<String,Any>
                let result = json["result"] as! [[String:Any]]
                for item in result {
                    var model = Landmark()
                    model.name = String(describing: item["name"]!)
//                    model.description = item[""]
                    landmarks.append(model)
                }
                
                break
            case .failure:
                break
            }
        }
    }
    
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .previewDevice(PreviewDevice(rawValue: "iPhone"))
    }
}
