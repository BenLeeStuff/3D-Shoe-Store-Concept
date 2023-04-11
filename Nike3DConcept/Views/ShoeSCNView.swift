//
//  ShoeSCNView.swift
//  Nike3DConcept
//
//  Created by Ben Lee on 4/10/23.
//

import UIKit
import SceneKit
import SceneKit.ModelIO

class ShoeSCNView: SCNView {
    
    override init(frame: CGRect, options: [String : Any]? = nil) {
        super.init(frame: frame)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        showsStatistics = true
        let scene = SCNScene()
        self.scene = scene

//        let sceneView = self as! SCNView
//        
//        sceneView.scene = scene
//        sceneView.showsStatistics = true
        //sceneView.allowsCameraControl = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
