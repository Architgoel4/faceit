//
//  EmotionsViewController.swift
//  Faceit
//
//  Created by Archit Goel on 26/11/17.
//  Copyright © 2017 Archigoel. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        var destinationViewController = segue.destination
        if let navigationalViewController = destinationViewController as? UINavigationController {
            destinationViewController = navigationalViewController.visibleViewController ?? destinationViewController
        }
        if let faceViewController = destinationViewController as? FaceViewController, let identifer = segue.identifier, let expression = emottionalFaces[identifer]{
            faceViewController.expression  = expression
            faceViewController.navigationItem.title = (sender as? UIButton)?.currentTitle
        }
        
    }
    private let emottionalFaces: Dictionary<String, FacialExpression> = [
        "sad": FacialExpression(eyes: .closed, mouth: .frown),
        "happy": FacialExpression(eyes:.open, mouth: .smile),
        "worried": FacialExpression(eyes:.open, mouth:.smirk)
    
    ]

}
