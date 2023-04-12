//
//  ShoeCollectionViewCell.swift
//  Nike3DConcept
//
//  Created by Ben Lee on 4/9/23.
//

import UIKit

class ShoeCollectionViewCell: UICollectionViewCell {
    
    let shoeImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "zoomPegasus")?.withRenderingMode(.alwaysOriginal))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let heartButton: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal), for: .normal)
       //b.setImage(UIImage(systemName: "heart"), for: .normal)
        b.contentMode = .scaleAspectFill
        //b.tintColor = UIColor.appBlack()
        b.backgroundColor = .white
        b.layer.cornerRadius = 15
        b.clipsToBounds = true
        return b
    }()
    
    let dividerLine: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.appBackgroundGray()
        v.layer.cornerRadius = 5
        return v
    }()
    
    let nameLabel:UILabel = {
        let l = UILabel().withCustomAttributes(text: "Nike Zoom Pegasus", spacing: -0.1, fontName: "Inter-Medium", fontSize: 24, color: UIColor.appBlack())
        return l
    }()
    
    let priceLabel:UILabel = {
        let l = UILabel().withCustomAttributes(text: "$128", spacing: -0.1, fontName: "Inter-Medium", fontSize: 24, color: UIColor.appBlack())
        l.textAlignment = .right
        return l
    }()
    
    let definitionLabel = UILabel().withCustomAttributes(text: "Men's Road Running Shoe", spacing: 0.3, fontName: "Oxygen", fontSize: 14.2, color: UIColor.rgb(red: 164, green: 169, blue: 175))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    func setupViews() {
        layer.cornerRadius = 20
        backgroundColor = .white
        
        addSubview(shoeImageView)
        shoeImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 12, paddingLeft: 12, paddingBottom: 0, paddingRight: 12, width: 0, height: 222)
        
        addSubview(heartButton)
        heartButton.anchor(top: shoeImageView.topAnchor, left: nil, bottom: nil, right: shoeImageView.rightAnchor, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 12, width: 42, height: 42)
        
        addSubview(dividerLine)
        dividerLine.anchor(top: shoeImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 15, paddingLeft: 12, paddingBottom: 0, paddingRight: 12, width: 0, height: 1)
        
        addSubview(priceLabel)
        priceLabel.anchor(top: dividerLine.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 12, width: 75, height: 33)
        
        addSubview(nameLabel)
        nameLabel.anchor(top: dividerLine.bottomAnchor, left: leftAnchor, bottom: nil, right: priceLabel.leftAnchor, paddingTop: 15, paddingLeft: 12, paddingBottom: 0, paddingRight: 5, width: 0, height: 33)
        
       
        
        addSubview(definitionLabel)
        definitionLabel.anchor(top: nameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 6, paddingLeft: 12, paddingBottom: 0, paddingRight: 12, width: 0, height: 0)
        //definitionLabel.alpha = 1
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
