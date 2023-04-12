//
//  HomeViewController.swift
//  Nike3DConcept
//
//  Created by Ben Lee on 4/10/23.
//

import UIKit
import SceneKit
import SceneKit.ModelIO

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let topCellID = "topCellID"
    let brandsCellID = "brandsCellID"
    let shoeCellID = "shoeCellID"
    
    let shoesImages: [UIImage] = [UIImage(named: "zoomPegasus")?.withRenderingMode(.alwaysOriginal) ?? UIImage(), UIImage(named: "adidasDragon")?.withRenderingMode(.alwaysOriginal) ?? UIImage()]
    
    let topView = TopView()
    let holderView = UIView()
    let shoeDetailsViewController = ShoeDetailsViewController()
    let testViewController = TestViewController()
    
    lazy var homeColletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true
        cv.backgroundColor = .clear
        cv.contentInsetAdjustmentBehavior = .never

        return cv
    }()
    
    let shoeImageViewForAnimation: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "zoomPegasus")
        iv.alpha = 0
        iv.isUserInteractionEnabled = false
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.appBackgroundGray()
        registerCells()
        setupHomeCollectionView()

        // Do any additional setup after loading the view.
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        
        // 2
        var insets = view.safeAreaInsets
        insets.top = 0
        homeColletionView.contentInset = insets
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
 
    func registerCells() {
        homeColletionView.register(TopCollectionViewCell.self, forCellWithReuseIdentifier: topCellID)
        homeColletionView.register(ShoeCollectionViewCell.self, forCellWithReuseIdentifier: shoeCellID)
    }

    func setupHomeCollectionView() {
        view.addSubview(homeColletionView)
        homeColletionView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        homeColletionView.backgroundColor = .clear
    }
    
    func setupShoeAnimationView() {
        view.addSubview(shoeImageViewForAnimation)
        shoeImageViewForAnimation.frame = CGRect(x: 0, y: 0, width: homeColletionView.frame.size.width - 44, height: 222)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topCellID, for: indexPath) as! TopCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: shoeCellID, for: indexPath) as! ShoeCollectionViewCell
            
            cell.shoeImageView.image = shoesImages[indexPath.item - 1]
            
            if indexPath.item == 2 {
                cell.nameLabel.text = "Adidas Dragon"
                cell.definitionLabel.text = "Mens Classic Gray Trainers"
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1 + shoesImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0 {
            //top cell
            return CGSize(width: homeColletionView.frame.size.width, height: 313)
        }
        //shoes cell
        return CGSize(width: homeColletionView.frame.size.width - 44, height: 340)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? ShoeCollectionViewCell {
//            let attributes = collectionView.layoutAttributesForItem(at: indexPath)
//            let cellRect = attributes?.frame
//            let cellFrameInSuperview = collectionView.convert(cellRect ?? CGRect.zero, to: collectionView.superview)
//
//        }
        let attributes = collectionView.layoutAttributesForItem(at: indexPath)
        let cellRect = attributes?.frame
        let cellFrameInSuperview = collectionView.convert(cellRect ?? CGRect.zero, to: collectionView.superview)
        let imageFrameInSuperView = CGRect(x: cellFrameInSuperview.minX + 12, y: cellFrameInSuperview.minY + 12, width: cellFrameInSuperview.width - 24, height: cellFrameInSuperview.width - 24)
        
        print("Cell Frame: x:\(cellFrameInSuperview.minX) y:\(cellFrameInSuperview.minY), width:\(cellFrameInSuperview.width), height:\(cellFrameInSuperview.height)")
        
        print("image Frame: x:\(imageFrameInSuperView.minX) y:\(imageFrameInSuperView.minY), width:\(imageFrameInSuperView.width), height:\(imageFrameInSuperView.height)")
        
        
        self.testViewController.imageStartFrame = imageFrameInSuperView
        self.testViewController.modalPresentationStyle = .overCurrentContext
        self.present(self.testViewController, animated: false)
        
        //self.shoeDetailsViewController.modalPresentationStyle = .overCurrentContext
        //self.present(self.shoeDetailsViewController, animated: false)
        // animate and segue
    }

    func segueToDetails() {
        self.shoeDetailsViewController.modalPresentationStyle = .fullScreen
        self.present(self.shoeDetailsViewController, animated: false)
    }

}

