//
//  DetalleArticuloViewController.swift
//  recetas
//
//  Created by Roberto Dehesa  on 25/1/15.
//  Copyright (c) 2015 Roberto Dehesa. All rights reserved.
//

import UIKit

class DetalleArticuloViewController: UIViewController {

    @IBOutlet weak var fotoImageView: UIImageView!
    let image = UIImage(named: "manzana.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fotoImageView.image = image

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
