//
//  PlacementsTableViewCell.swift
//  TabbarWithThreeTabs
//
//  Created by Mac on 15/12/23.
//

import UIKit

class PlacementsTableViewCell: UITableViewCell {

   
    
    @IBOutlet weak var studentImageLabel: UIImageView!
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var placedCompanyNameLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     
    }
    
}
