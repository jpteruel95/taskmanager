//
//  TextFieldTableViewCell.swift
//  taskmanager
//
//  Created by John Patrick Teruel on 17/10/2017.
//  Copyright © 2017 Hoshizora. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var dataField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
