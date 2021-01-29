//
//  MainTableViewCell.swift
//  Nav
//
//  Created by maiyou on 2020/12/16.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    public static var cellIdentifity:String = "\(MainTableViewCell.self)"
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        print(#function,#file)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
}
