//
//  PersonViewController.swift
//  Nav
//
//  Created by maiyou on 2020/12/16.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftUI

class PersonViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView:UITableView!
    var data:[PersonModel] = []
    var page:Int = 1
    lazy var button: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("跳转", for: .normal)
        btn.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        btn.setTitleColor(.red, for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let method = FuncMethod.init()
        self.view .addSubview(self.button)
        self.title = "段子"
//        let person = Student.init(name: "student",age: 20)
//        person.message()
//
//        let stroeColor = UIColor.white
//        let fillColor = UIColor.orange
//        let imageView = UIImageView.init()
//
//        imageView.backgroundColor = fillColor
//        imageView.image = UIImage.init(named: "icon")
//        let width:CGFloat = 120
//        let height = width
//
//        imageView.frame = CGRect.init(x: 100, y: 300, width: width, height: height)
//
//        imageView.layer.cornerRadius = width/2
//        imageView.layer.masksToBounds = true
//        imageView.layer.borderWidth = 0.5
//        imageView.layer.borderColor = fillColor.cgColor
//
//        let lineWidth:CGFloat = 5
//        let layer = CAShapeLayer.init()
//        layer.lineWidth = lineWidth
//        layer.strokeColor = stroeColor.cgColor
//        layer.fillColor = nil
//
//        let path = UIBezierPath.init(arcCenter: CGPoint.init(x: width/2, y: height/2), radius: 57, startAngle: 0, endAngle: .pi*2, clockwise: true)
//        layer.path = path.cgPath
//        imageView.layer.addSublayer(layer)
        
//        let layer2 = CAShapeLayer.init()
//        layer2.lineWidth = lineWidth
//        layer2.strokeColor = stroeColor.cgColor
//        layer2.fillColor = nil
        
//        let path2 = UIBezierPath.init(arcCenter: CGPoint.init(x: width/2, y: height/2), radius: 45, startAngle: 0, endAngle: .pi*2, clockwise: true)
//        layer2.path = path2.cgPath
//
//        btn.layer.addSublayer(layer2)
//        self.view.addSubview(imageView)
        
        self.tableView.delegate = self
        self.tableView.register(UINib.init(nibName: "MainTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: MainTableViewCell.cellIdentifity)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "aa")
        self.view .addSubview(self.tableView)
        
        self.tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.loadData()
        })
        
        self.tableView.mj_footer = MJRefreshBackNormalFooter.init(refreshingBlock: {
            self.page += 1
            self.loadData()
        })
        
//        self.tableView.mj_header?.beginRefreshing()
//        NetWork.get(url: NetWorkUrl.newJoke(), params: ["page":"\(self.page)","count":"1","type":"video"]) { (response) in
//            print(response)
//        } failure: { (errorMessage) in
//            print(errorMessage)
//        }

//        for _ in 0..<10 {
//            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {_ in
                self.requestData()
//            }
//        }
        
//        for _ in 0..<10 {
//            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {_ in
                self.requestActivitysData()
//            }
//        }
    }
    // "https://api.apiopen.top/getWangYiNews"
    func requestData(){
        NetWork.post(url:NetWorkUrl.MemberInfoUrl , params: ["member_id":"4415560","page":"1","count":"5"]) { (response) in
            print(response)
        } failure: { (error) in
            print(error)
        }
    }
    
    func requestActivitysData(){
        NetWork.post(url: NetWorkUrl.ActivitysUrl, params: ["member_id":"4415560"]) { (response) in
            print(response)
        } failure: { (error) in
            
        }
    }
    
    func loadData() {
        AF.request(NetWorkUrl.newJoke(), method: .get, parameters: ["page":"\(self.page)","count":"10","type":"video"], encoder: URLEncodedFormParameterEncoder.default).responseJSON {(response) in
            switch response.result {
            case .success:
                let json = response.value as! Dictionary<String, Any>
                guard let result = json["result"] else {
                    return
                }
                
                let array = PersonModel.mj_objectArray(withKeyValuesArray: result) as! [PersonModel]
                if self.page == 1 {
                    self.data = [PersonModel]()
                }
                self.loadMoreData(array: array)
                self.endRefresh()
                break
            case .failure(let error):
                print(error)
                break
            }
        }
        
//        DispatchQueue.global().async {
//
//            DispatchQueue.main.async {
//
//            }
//        }
    }
    
    func loadMoreData(array:[PersonModel]) {
        for i in 0..<array.count {
            self.data.append(array[i])
        }
    }
    
    func endRefresh() {
        self.tableView.mj_header?.endRefreshing()
        self.tableView.mj_footer?.endRefreshing()
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.cellIdentifity, for: indexPath) as! MainTableViewCell
        let model:PersonModel = data[indexPath.row]
        cell.nameLabel?.text = model.name
        cell.icon.af.setImage(withURL: URL.init(string: model.header!)!)
//        cell.icon.image = cell.icon.image?.af.imageRounded(withCornerRadius: 2)
        cell.icon.layer.cornerRadius = 4
        cell.icon.layer.masksToBounds = true
        cell.descLabel.text = model.text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let model:PersonModel = data[indexPath.row]
//        let detail = DetailViewController.init(sid: model.sid!)
//        self.tableView.deselectRow(at: indexPath, animated: true)
//        self.navigationController?.pushViewController(detail, animated: true)
        let vc = UIHostingController(rootView: LandmarkList())
        vc.title = "SwiftUI"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class Person {
    var name:String
    init(name:String){
        self.name = name
    }
    
    convenience init() {
        self.init(name:"")
    }
    
    func message() {
//        print("class=\(self),name=\(self.name)")
    }
}

class Student: Person {
    var age:Int
    init(name:String,age:Int){
        self.age = age
        super.init(name: name)
    }
    
    convenience init(age:Int) {
        self.init(name:"",age:age)
    }
    
    override func message() {
//        print("class=\(self),name=\(self.name),age=\(self.age)")
    }
    
    
}

struct HTTPMethod {
    public static let get = HTTPMethod.init(method: "get")
    
    var method:String
    
    init(method:String) {
        self.method = method
    }
    
}
