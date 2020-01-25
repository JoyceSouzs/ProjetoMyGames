//
//  OnboardingCollectionViewCell.swift
//  MyGames
//
//  Created by aluno on 20/01/20.
//  Copyright © 2020 School. All rights reserved.
//

import UIKit
struct OnboardingCollectionViewCellModel {
    //var title: String?
    //var description: String?
    var imageName: String?
    
    init(//title: String, description: String,
         imageName: String) {
        //self.title = title
        //self.description = description
        self.imageName = imageName
    }
}

class OnboardingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
     var model: OnboardingCollectionViewCellModel?
       
       override func awakeFromNib() {
           super.awakeFromNib()
       }
       
       func populate(model: OnboardingCollectionViewCellModel) {
           self.model = model
         //  titleLabel.text = model.title
           //descriptionLabel.text = model.description
           
           if let imageName = model.imageName {
               imgView.image = UIImage(named: imageName)
           }
       }

}
