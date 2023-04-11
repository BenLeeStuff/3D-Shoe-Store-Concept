//
//  Shoe3DView.swift
//  Nike3DConcept
//
//  Created by Ben Lee on 4/10/23.
//

import UIKit
import SceneKit
import SceneKit.ModelIO

class Shoe3DView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScene()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupScene() {
        let scene = SCNScene()
        let sceneView = SCNView()
        sceneView.scene = scene
        
        sceneView.backgroundColor = .clear
        addSubview(sceneView)
        sceneView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        sceneView.allowsCameraControl = true
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: -20, z: 250)
        cameraNode.camera?.zFar = 1000
        cameraNode.camera?.automaticallyAdjustsZRange = true
        scene.rootNode.addChildNode(cameraNode)
        
//        let lightNode = SCNNode()
//        lightNode.light = SCNLight()
//        lightNode.light?.type = .omni
//        lightNode.position = SCNVector3(x: 0, y: 10, z: 2)
//
//        scene.rootNode.addChildNode(lightNode)

        guard let usdzURL = Bundle.main.url(forResource: "shoe", withExtension: "usdz")
        else {
            fatalError()
        }
        
        let referenceNode = SCNReferenceNode(url: usdzURL)!
        referenceNode.load()

        // Add node to scene
        scene.rootNode.addChildNode(referenceNode)
    }

}
