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
        self.view.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.8, delay: 0) {
            self.view.backgroundColor = UIColor.rgb(red: 245, green: 247, blue: 251)
            self.view.alpha = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackAndHeartButton()
        setup3DView()
        setupDescriptionView()
        setupGradientView()
        setupAddToBagButton()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setupBackAndHeartButton() {
        view.addSubview(backButton)
        backButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 43, paddingLeft: 23, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        view.addSubview(heartButton)
        heartButton.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 43, paddingLeft: 0, paddingBottom: 0, paddingRight: 23, width: 40, height: 40)
        
    }
    
    func setup3DView(){
        view.addSubview(shoe3DView)
        shoe3DView.anchor(top: backButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 300)
    }
    
    func setupDescriptionView() {
        view.addSubview(descriptionView)
        descriptionView.anchor(top: shoe3DView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func setupGradientView() {
        
        view.addSubview(gradientView)
        gradientView.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 150)
        
    }
    
    func setupAddToBagButton() {
        view.addSubview(addToBagButton)
        addToBagButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 25, paddingBottom: -37, paddingRight: 25, width: 0, height: 60)
    }
    
    @objc func backButtonPressed() {
        self.dismiss(animated: false)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
