//
//  customTableViewCell.swift
//  LernGruppe
//
//  Created by BulBul on 30.05.18.
//  Copyright © 2018 BulBul. All rights reserved.
//

import UIKit

class customTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: customTableViewCell!
  
    @IBOutlet weak var Institutionlabel: UILabel!
    
    @IBOutlet weak var cellName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
