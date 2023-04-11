//
//  BrandCollectionViewCell.swift
//  Nike3DConcept
//
//  Created by Ben Lee on 4/9/23.
//

import UIKit

class BrandCollectionViewCell: UICollectionViewCell {
    
    let brandImageView: UIImageView = {
        let v = UIImageView()
        v.contentMode = .scaleAspectFit
        v.layer.masksToBounds = true
        v.layer.cornerRadius = 20
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 20
        backgroundColor = .white
        
        setupViews()
    }
    
    func setupViews() {
        addSubview(brandImageView)
        brandImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
