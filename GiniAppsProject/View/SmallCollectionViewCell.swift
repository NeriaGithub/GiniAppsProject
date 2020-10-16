//
//  SmallCollectionViewCell.swift
//  GiniAppsProject
//
//  Created by Neria Jerafi on 15/10/2020.
//





import UIKit

class SmallCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var labelWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelHeightConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(number:Number, labelHeight:CGFloat = 50, backgroundColor:UIColor = .systemOrange) {
        numberLabel.text = String(number.number)
        labelWidthConstraint.constant = (UIScreen.main.bounds.size.width * 0.33)  - 20
        labelHeightConstraint.constant = labelHeight
        numberLabel.backgroundColor = backgroundColor
        
    }
    
    
    // if do you want dynamic cell size do you need this function if you  have constant size of view or part of it (width or height) you have to set the constraint of with or height for view it the container in this example is a label
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
           setNeedsLayout()
           layoutIfNeeded()
           let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
           var frame = layoutAttributes.frame
           frame.size.height = ceil(size.height)
        frame.size.width = ceil(size.width)
           layoutAttributes.frame = frame
           return layoutAttributes
       }

}
