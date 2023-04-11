//
//  TopView.swift
//  Nike3DConcept
//
//  Created by Ben Lee on 4/9/23.
//

import UIKit

class TopView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let brands: [UIImage] = [UIImage(named: "reebok")?.withRenderingMode(.alwaysOriginal) ?? UIImage(), UIImage(named: "adidas")?.withRenderingMode(.alwaysOriginal) ?? UIImage(), UIImage(named: "nike")?.withRenderingMode(.alwaysOriginal) ?? UIImage(), UIImage(named: "lotto")?.withRenderingMode(.alwaysOriginal) ?? UIImage(), UIImage(named: "puma")?.withRenderingMode(.alwaysOriginal) ?? UIImage(), UIImage(named: "asics")?.withRenderingMode(.alwaysOriginal) ?? UIImage()]
    
    let menuButton: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal), for: .normal)
        b.contentMode = .scaleAspectFit
        return b
    }()
    
    let bellButton: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "bell")?.withRenderingMode(.alwaysOriginal), for: .normal)
        b.contentMode = .scaleAspectFit
        return b
    }()
    
    let searchView = SearchView()
    
    let brandCellID = "brandCellID"
    
    lazy var brandsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 19
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = false
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    let popularLabel: UILabel = {
        let l = UILabel().withCustomAttributes(text: "MOST POPULAR", spacing: 0.75, fontName: "Inter-SemiBold", fontSize: 16, color: UIColor.appTextDarkGray())
        l.alpha = 0.8
        return l
    }()
    
    let seeAllButton: UIButton = {
        let b = UIButton()
        let string = NSMutableAttributedString(string: "See all")
        let range = NSRange(location: 0, length: string.length)
        string.addAttribute(NSAttributedString.Key.kern, value: 0.19, range: range)
        string.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.appOrange(), range: range)
        string.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "Oxygen", size: 15), range: range)

        b.setAttributedTitle(string, for: .normal)
        b.titleLabel?.textAlignment = .left
        return b
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        registerCells()
        setupTopButtons()
        setupSearchView()
        setupBrandsCollectionView()
        setupPopularLabelAndSeeAllButon()
    }
    
    func registerCells() {
        brandsCollectionView.register(BrandCollectionViewCell.self, forCellWithReuseIdentifier: brandCellID)
    }
    
    func setupTopButtons() {
        addSubview(menuButton)
        addSubview(bellButton)
        
        menuButton.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 48, height: 30)
        
        bellButton.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 40, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 48, height: 30)
    }
    
    func setupSearchView() {
        addSubview(searchView)
        searchView.anchor(top: menuButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 23, paddingLeft: 23, paddingBottom: 0, paddingRight: 23, width: 0, height: 62)
    }
    
    func setupBrandsCollectionView() {
        addSubview(brandsCollectionView)
        brandsCollectionView.anchor(top: searchView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 24, paddingLeft: 23, paddingBottom: 0, paddingRight: 0, width: 0, height: 75)
    }
    
    func setupPopularLabelAndSeeAllButon() {
    
        addSubview(seeAllButton)
        seeAllButton.anchor(top: brandsCollectionView.bottomAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 24, paddingLeft: 0, paddingBottom: 0, paddingRight: 23, width: 80, height: 0)
        
        addSubview(popularLabel)
        popularLabel.anchor(top: brandsCollectionView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: seeAllButton.leftAnchor, paddingTop: 24, paddingLeft: 23, paddingBottom: 0, paddingRight: 23, width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: brandCellID, for: indexPath) as! BrandCollectionViewCell
        cell.brandImageView.image = brands[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 74, height: 75)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
