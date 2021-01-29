//
//  MainAlertVIew.swift
//  Nav
//
//  Created by maiyou on 2020/12/17.
//

import UIKit

protocol mainAlertViewDelegate {
    func onComple(mainAlertView:MainAlertView,text:String)
}

class MainAlertView: UIView {
    var delegate:mainAlertViewDelegate?
    @IBOutlet weak var textLabel:UILabel!
    class func showAlertView(delegate:mainAlertViewDelegate) {
        let alertView = Bundle.main.loadNibNamed("\(MainAlertView.self)", owner: nil, options: nil)?.last as! MainAlertView
        alertView.frame = UIScreen.main.bounds
        alertView.delegate = delegate
        alertView.alpha = 0
        self.getKeyWindow()!.addSubview(alertView)
        UIView.animate(withDuration: 0.1) {
            alertView.alpha = 1
        }
    }

    @IBAction func doneAction () {
        self.delegate?.onComple(mainAlertView: self, text: self.textLabel.text!)
        self.dismissAlertView()
    }
    
    @IBAction func dismissAlertView() {
        UIView.animate(withDuration: 0.1) {
            self.alpha = 0
        } completion: { (finish) in
            self.removeFromSuperview()
        }
    }
    
}

extension MainAlertView {
    class func getKeyWindow() -> UIWindow? {
        for windowScene in UIApplication.shared.connectedScenes as! Set<UIWindowScene> {
            if windowScene.activationState == .foregroundActive {
                return windowScene.windows.last
            }
        }
        return nil
    }
}


