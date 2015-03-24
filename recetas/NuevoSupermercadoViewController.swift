//
//  NuevoSupermercadoViewController.swift
//  recetas
//
//  Created by Eugenia Perez Velasco on 20/3/15.
//  Copyright (c) 2015 Roberto Dehesa. All rights reserved.
//

import UIKit
import CoreData

class NuevoSupermercadoViewController: UIViewController {

    var mAppDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    
    @IBOutlet weak var NombreTextField: UITextField!
    
    @IBOutlet weak var DireccionTextField: UITextField!
    
    @IBOutlet weak var PoblacionTextField: UITextField!
    
    
    @IBAction func GuardarPushButton(sender: AnyObject) {
        
        //tenemos que generar el contexto
        var contexto:NSManagedObjectContext = mAppDelegate.managedObjectContext!
        var nuevoSupermercado = NSEntityDescription.insertNewObjectForEntityForName("Tienda", inManagedObjectContext: contexto) as Tienda
        
        //recogemos la fecha y hora de hoy para guardarlas como id del nuevo supermercado
        //con el formato= "YYYYMMDDHHmmss"
        var fechaHoy:NSDate = NSDate()
        var fechaFormateada:NSDateFormatter = NSDateFormatter()
        fechaFormateada.dateFormat = "yyyyMMddHHmmss"
        var fechaString:String = fechaFormateada.stringFromDate(fechaHoy)
        
        //Int64("42222222222".toInt()!
        nuevoSupermercado.idtienda = NSNumber(longLong: Int64(fechaString.toInt()!))
        nuevoSupermercado.nombre = self.NombreTextField.text
        nuevoSupermercado.direccion = self.DireccionTextField.text
        nuevoSupermercado.poblacion = self.PoblacionTextField.text
        nuevoSupermercado.localizacion_longitud = 0.0
        nuevoSupermercado.localizacion_latitud = 0.0
        
        self.NombreTextField.text = ""
        self.DireccionTextField.text = ""
        self.PoblacionTextField.text = ""
        
        //guardamos el contexto
        var error:NSError?
        contexto.save(&error)
        if error == nil{
            dismissViewControllerAnimated(true, completion:nil)
        }
    }
    
    
    @IBAction func CancelarPushButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion:nil)
    }
    
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
