//
//  SearchView.swift
//  Nike3DConcept
//
//  Created by Ben Lee on 4/8/23.
//

import UIKit

class SearchView: UIView {
    
    let searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.setImage(UIImage(), for: .search, state: .normal)
        sb.setPositionAdjustment(UIOffset(horizontal: -20, vertical: 0), for: .search)
        
        let text = "  Search shoes..."
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 175, green: 182, blue: 187), NSAttributedString.Key.font: UIFont(name: "Inter-Medium", size: 16)] as [NSAttributedString.Key : Any]
        
        let textAttribute = NSAttributedString(string: text, attributes: attributes)
        sb.searchTextField.attributedPlaceholder = textAttribute
        //sb.searchTextField.attributedPlaceholder =  NSAttributedString.init(string: "Search anything...", attributes: [NSAttributedString.Key.foregroundColor:UIColor.appTextLightGray(), NSAttributedString.Key.font = UIFont(name: "Inter-Regular", size: 16)])
        sb.searchBarStyle = .minimal
        return sb
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        
        let text = "  Search shoes..."
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 175, green: 182, blue: 187), NSAttributedString.Key.font: UIFont(name: "Inter-Medium", size: 16)] as [NSAttributedString.Key : Any]
        
        let textAttribute = NSAttributedString(string: text, attributes: attributes)
        tf.attributedPlaceholder = textAttribute
        return tf
    }()
    
    let searchButton: UIButton = {
        let b = UIButton()
        b.backgroundColor = .appBlack()
        b.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        b.tintColor = .white
        b.layer.cornerRadius = 15
        return b
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        layer.cornerRadius = 20
        self.backgroundColor = .white
        
        addSubview(textField)
        textField.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 14, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(searchButton)
        searchButton.anchor(top: textField.topAnchor, left: nil, bottom: textField.bottomAnchor, right: textField.rightAnchor, paddingTop: 6, paddingLeft: 0, paddingBottom: -6, paddingRight: 6, width: 42, height: 0)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
