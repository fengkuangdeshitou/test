//
//  DetailViewController.swift
//  Nav
//
//  Created by maiyou on 2020/12/17.
//

import UIKit
import Alamofire
import AVFoundation

typealias CloseBlock = (_ params:String) -> Void

class DetailViewController: UIViewController, mainAlertViewDelegate {
    
    var sid:String
    var data:PersonModel?
    var player:AVPlayer?
    var block:CloseBlock?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadData(sid: self.sid)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        MainAlertView.showAlertView(delegate: self)
        self.block!("aaaa")
    }
    
    func onComple(mainAlertView: MainAlertView, text: String) {
        print(text)
//        self.data?.sid = self.sid
        let params:Dictionary<String,String> = [:]
        NetWork.post(url: "http:api.laigetalk.com/getTeacherList", params:params) { (response) in
            debugPrint(response)
        } failure: { (errorMessage) in
            print(errorMessage)
        }
    }
    
    func loadData(sid:String) {
        AF.request("https://api.apiopen.top/getSingleJoke?sid=\(self.sid)", method: .get, parameters: ["":""], encoder: URLEncodedFormParameterEncoder.default, headers: nil).responseJSON { [self] (response) in
            switch (response.result) {
            case .success:
                print(response)
                let json = response.value as! [String:Any]
                self.data = PersonModel.mj_object(withKeyValues: json["result"])
                loadPlayer(url: self.data!.video!)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func loadPlayer(url:String) {
        let item = AVPlayerItem.init(url: URL.init(string: url)!)
        player = AVPlayer.init(playerItem: item)
        let playerLayer = AVPlayerLayer.init()
        playerLayer.player = player
        playerLayer.backgroundColor = UIColor.black.cgColor
        playerLayer.frame = CGRect.init(x: 0, y: 0, width: self.view.mj_w, height: self.view.mj_h)
        self.view.layer .addSublayer(playerLayer)
        player?.play()
    }
    
    init(sid:String) {
        self.sid = sid
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
