//
//  TuongTableViewCell.swift
//  News Game LMHT
//
//  Created by trinh truong vu on 5/25/18.
//  Copyright © 2018 TRUONGVU. All rights reserved.
//

import UIKit

class TuongTableViewCell: UITableViewCell {

    @IBOutlet weak var lbTuong: UILabel!
    
    @IBOutlet weak var imgTuong: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
