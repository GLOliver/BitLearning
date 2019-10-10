//
//  ViewCollectionViewCell.swift
//  BitLearning
//
//  Created by Aluno Mack on 10/10/19.
//  Copyright © 2019 Aluno Mack. All rights reserved.
//

import UIKit

class ViewCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageViewCenter: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelPublished: UILabel!
    @IBOutlet weak var labelSubText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
