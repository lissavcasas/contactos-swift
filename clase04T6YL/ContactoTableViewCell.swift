//
//  ContactoTableViewCell.swift
//  clase04T6YL
//
//  Created by iMundo on 11/06/23.
//

import UIKit

class ContactoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nombreApellidoLabel: UILabel!
    
    @IBOutlet weak var telefonoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
