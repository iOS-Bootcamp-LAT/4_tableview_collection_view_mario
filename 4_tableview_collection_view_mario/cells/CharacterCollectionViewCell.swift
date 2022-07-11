//
//  CharacterCollectionViewCell.swift
//  4_tableview_collection_view_mario
//
//  Created by David Granado Jordan on 6/6/22.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var characterImageView: UIImageView!
    
    @IBOutlet weak var characterNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
