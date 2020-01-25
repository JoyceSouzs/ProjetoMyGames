//
//  GamesCollectionViewCell.swift
//  MyGames
//
//  Created by aluno on 22/01/20.
//  Copyright © 2020 School. All rights reserved.
//

import UIKit

struct GamesCollectionViewCellModel {
    var title: String?
    var description: String?
    var imageName: UIImage?
    
    init(_ title: String, _ description: String,
         _ imageName: UIImage) {
        self.title = title
        self.description = description
        self.imageName = imageName
    }
}

class GamesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lbTitulo: UILabel!
    
    @IBOutlet weak var lbDesc: UILabel!
    var model: GamesCollectionViewCellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func populate(model: GamesCollectionViewCellModel) {
        self.model = model
         lbTitulo.text = model.title
         lbDesc.text = model.description
        img.image = model.imageName
//        if let imageName = model.imageName {
//            img.image = UIImage(named: imageName)
//        }
    }

}
