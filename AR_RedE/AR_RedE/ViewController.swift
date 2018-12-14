//
//  ViewController.swift
//  AR-U-redE
//
//  Created by Andrea Murphy on 12/4/18.
//  Copyright © 2018 Andrea Murphy. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate{
    
    // MARK: Properties
    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // sceneView.debugOptions =[ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
    
        let position = SCNVector3(0, 0, -3)
        let space = addSphere(at: position)
        scene.rootNode.addChildNode(space)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Tell the session to automatically detect horizontal planes
        configuration.planeDetection = .horizontal
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // Release any cached data, images, etc that aren't in use.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // Create a new scene
func addSphere(at position: SCNVector3) -> SCNNode {
    
        let sphere = SCNSphere(radius: 0.1)
        let sphereNode = SCNNode(geometry: sphere)
    
        sphereNode.position = SCNVector3(0,0,-0.5)
        
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "lava")
        sphere.materials = [material]
    
        return sphereNode
    }
    
}



