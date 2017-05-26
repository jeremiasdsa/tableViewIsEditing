//
//  cellTableViewCell.swift
//  TableEditing
//
//  Created by jeremias araujo on 25/05/17.
//  Copyright © 2017 jeremias araujo. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configure(str : String){
        self.lbTitle.text = str
    }

}
