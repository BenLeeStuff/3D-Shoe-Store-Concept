//
//  TopCollectionViewCell.swift
//  Nike3DConcept
//
//  Created by Ben Lee on 4/9/23.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {
    
    let topView = TopView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    func setupViews() {
        addSubview(topView)
        topView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
