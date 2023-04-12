//
//  Shoe3DViewController.swift
//  Nike3DConcept
//
//  Created by Ben Lee on 4/10/23.
//

import UIKit
import SceneKit
import SceneKit.ModelIO

class ShoeDetailsViewController: UIViewController {
    let imageFinalY: CGFloat = 136-70
    public var imageStartFrame: CGRect?
    
    let backgroundView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.rgb(red: 245, green: 247, blue: 251)
        return v
    }()
    
    let shoeImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "zoomPegasus")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 15
        return iv
    }()
    let backButton: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), for: .normal)
        b.contentMode = .scaleAspectFill
        b.backgroundColor = .white
        b.layer.cornerRadius = 15
        b.clipsToBounds = true
        return b
    }()
    
    let heartButton: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal), for: .normal)
        b.contentMode = .scaleAspectFill
        b.backgroundColor = .white
        b.layer.cornerRadius = 15
        b.clipsToBounds = true
        return b
    }()
    
    let shoe3DView = Shoe3DView()
    let descriptionView = ShoeDescriptionView()
    var descriptionViewFinalY: CGFloat?
    var descriptionViewStartY: CGFloat?
    
    let gradientView = UIImageView(image: UIImage(named: "gradient")?.withRenderingMode(.alwaysOriginal))
    
    let addToBagButton: UIButton = {
       let b = UIButton()
        b.setTitle("Add to Bag", for: .normal)
        b.setTitleColor(UIColor.white, for: .normal)
        b.layer.cornerRadius = 15
        b.backgroundColor = UIColor.rgb(red: 24, green: 28, blue: 31)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return b
    }()
    
    override func viewWillAppear(_ animated: Bool) {

//        if let imageStartFrame = self.imageStartFrame {
//            self.shoeImageView.isHidden = false
//            self.shoeImageView.frame = imageStartFrame
//            self.shoe3DView.isHidden = true
//        } else {
//            fatalError("viewWillAppear - no image start frame")
//        }
//        backgroundView.alpha = 0
        //backgroundView.backgroundColor = .red
        
//        if let startY = descriptionViewStartY {
//            self.descriptionView.frame.origin.y = startY
//        } else {
//            fatalError("viewWillAppear - no final y")
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        if let imageStartFrame = self.imageStartFrame {
//            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut) {
//                self.shoeImageView.frame.origin.y = imageStartFrame.minY
//            } completion: { (complete) in
//                self.shoeImageView.isHidden = true
//                self.shoe3DView.isHidden = false
//            }
//        } else {
//            fatalError("viewDidAppear- no image start frame")
//        }
        
//        UIView.animate(withDuration: 0.8, delay: 0, options: .curveEaseOut) {
//            self.backgroundView.alpha = 1
//        }

        
//        if let finalY = descriptionViewFinalY {
//           let startingY = finalY - 65
//            UIView.animate(withDuration: 0.8, delay: 0, options: .curveEaseOut) {
//                self.backgroundView.alpha = 1
//                self.descriptionView.frame.origin.y = startingY
//            }
//        } else {
//            fatalError("viewDidAppear - no final y")
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupBackgroundView()
        setupBackAndHeartButton()
        setup3DView()
        setupDescriptionView()
        setupGradientView()
        setupAddToBagButton()
        //setupShoeImageView()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setupBackgroundView() {
        view.addSubview(backgroundView)
        backgroundView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func setupBackAndHeartButton() {
        backgroundView.addSubview(backButton)
        backButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 43, paddingLeft: 23, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        backgroundView.addSubview(heartButton)
        heartButton.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 43, paddingLeft: 0, paddingBottom: 0, paddingRight: 23, width: 40, height: 40)
        
    }
    
    func setup3DView(){
        backgroundView.addSubview(shoe3DView)
        shoe3DView.anchor(top: backButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 300)
    }
    
    func setupDescriptionView() {
        backgroundView.addSubview(descriptionView)
        
        descriptionView.anchor(top: shoe3DView.bottomAnchor, left: view.leftAnchor, bottom: backgroundView.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
//        descriptionView.widthAnchor.constraint(equalToConstant: backgroundView.frame.size.width).isActive = true
//        descriptionView.heightAnchor.constraint(equalToConstant: backgroundView.frame.size.height / 2).isActive = true
//
//        descriptionViewStartY = (view.frame.size.height * 0.542) + 50
//        descriptionViewFinalY = view.frame.size.height * 0.542
//
//        descriptionView.frame.origin = CGPoint(x: 0, y: descriptionViewStartY ?? 0)
    }
    
    func setupGradientView() {
        
        backgroundView.addSubview(gradientView)
        gradientView.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 150)
    }
    
    func setupAddToBagButton() {
        backgroundView.addSubview(addToBagButton)
        addToBagButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 25, paddingBottom: -37, paddingRight: 25, width: 0, height: 60)
    }
    
    func setupShoeImageView() {
        if let imageStartFrame = self.imageStartFrame {
            print("TestVC Cell Frame: x:\(imageStartFrame.minX) y:\(imageStartFrame.minY), width:\(imageStartFrame.width), height:\(imageStartFrame.height)")
            view.addSubview(shoeImageView)
            shoeImageView.frame = imageStartFrame
        } else {
            print("viewDidLoad - no image start frame")
        }
    }
    
    
    @objc func backButtonPressed() {
        self.dismiss(animated: false)
    }

}
