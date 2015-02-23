//
//  DonorCell.swift
//  
//
//  Created by Samuel Shih on 2/20/15.
//
//

import UIKit

class DonorCell: UITableViewCell {

    
    @IBOutlet weak var donorName: UILabel!
    @IBOutlet weak var donorPhoneNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
