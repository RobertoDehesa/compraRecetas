//
//  AñadirArticuloViewController.swift
//  recetas
//
//  Created by Roberto Dehesa  on 18/1/15.
//  Copyright (c) 2015 Roberto Dehesa. All rights reserved.
//

import UIKit

class An_adirArticuloViewController: UIViewController {

    @IBAction func cancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func saveButton(sender: AnyObject) {
        
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet weak var articuloTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

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
