//
//  TestViewController.swift
//  Nike3DConcept
//
//  Created by Ben Lee on 4/11/23.
//

import UIKit

class TestViewController: UIViewController {
    
    let imageFinalY: CGFloat = 136
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
        // iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(backgroundView)
        backgroundView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        if let imageStartFrame = self.imageStartFrame {
            print("TestVC Cell Frame: x:\(imageStartFrame.minX) y:\(imageStartFrame.minY), width:\(imageStartFrame.width), height:\(imageStartFrame.height)")
            view.addSubview(shoeImageView)
            shoeImageView.frame = imageStartFrame
        } else {
            print("viewDidLoad - no image start frame")
        }
        
//        shoeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        shoeImageView.heightAnchor.constraint(equalToConstant: 222).isActive = true
//        shoeImageView.widthAnchor.constraint(equalToConstant: view.frame.size.width - 44 - 24).isActive = true
        
        //let origin = CGPoint(
        //shoeImageView.frame = CGRect(origin: <#T##CGPoint#>, size: <#T##CGSize#>)
        //CGRect(x: <#T##Int#>, y: <#T##Int#>, width: view.frame.size.width - 44, height: 222)
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let imageStartFrame = self.imageStartFrame {
            self.shoeImageView.isHidden = false
            //self.shoeImageView.frame.origin.y = imageStartFrame.minY
        } else {
            print("viewWillAppear - no image start frame")
        }
        backgroundView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let imageStartFrame = self.imageStartFrame {
            UIView.animate(withDuration: 1, delay: 0) {
                //self.view.backgroundColor = UIColor.rgb(red: 245, green: 247, blue: 251)
                self.backgroundView.alpha = 1
                
                self.shoeImageView.frame.origin.y = self.imageFinalY
            } completion: { (complete) in
                self.shoeImageView.isHidden = true
            }
        } else {
            print("no image start frame")
        }
        
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
