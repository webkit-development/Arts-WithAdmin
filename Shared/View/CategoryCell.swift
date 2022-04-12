//
//  CategoryCell.swift
//  Art
//
//  Created by Kevin Stradtman on 4/9/22.
//

import UIKit
import Kingfisher


class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var categoryImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImg.layer.cornerRadius = 5
    }
    
    func configureCell(category: Category) {
        categoryLbl.text = category.name
        if let url = URL(string: category.imgUrl) {
            let placeholder = UIImage(named: "placeholder")
            let options : KingfisherOptionsInfo = [KingfisherOptionsInfoItem.transition(.fade(0.1))]
            categoryImg.kf.indicatorType = .activity
            categoryImg.kf.setImage(with: url, placeholder: placeholder, options: options)
        }
    }

}
