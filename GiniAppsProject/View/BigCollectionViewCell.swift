//
//  BigCollectionViewCell.swift
//  GiniAppsProject
//
//  Created by Neria Jerafi on 15/10/2020.
//

import UIKit

class BigCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(number:Number) {
        numberLabel.text = String(number.number)
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
           setNeedsLayout()
           layoutIfNeeded()
           let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
           var frame = layoutAttributes.frame
           frame.size.height = ceil(size.height)
           layoutAttributes.frame = frame
           return layoutAttributes
       }

}
