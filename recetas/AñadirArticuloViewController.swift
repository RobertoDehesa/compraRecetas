//
//  AñadirArticuloViewController.swift
//  recetas
//
//  Created by Roberto Dehesa  on 18/1/15.
//  Copyright (c) 2015 Roberto Dehesa. All rights reserved.
//

import UIKit
import CoreData

class An_adirArticuloViewController: UIViewController {
    
    var mAppDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    @IBAction func cancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func saveButton(sender: AnyObject) {
        //tenemos que generar el contexto
        var contexto:NSManagedObjectContext = mAppDelegate.managedObjectContext!
        var nuevoArticulo = NSEntityDescription.insertNewObjectForEntityForName("Articulo", inManagedObjectContext: contexto) as! Articulo
        
        nuevoArticulo.nombre = self.articuloTextfield.text
        nuevoArticulo.descripcion = self.descriptionTextField.text
       // nuevoArticulo.imagen = nil

        self.articuloTextfield.text = ""
        
        //guardamos el contexto
        var error:NSError?
        contexto.save(&error)
        if error == nil{
            dismissViewControllerAnimated(true, completion:nil)
        }else {
            println(error?.description)
        }
    }
    @IBOutlet weak var articuloTextfield: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
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
