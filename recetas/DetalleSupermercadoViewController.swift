//
//  DetalleSupermercadoViewController.swift
//  recetas
//
//  Created by Eugenia Perez Velasco on 25/3/15.
//  Copyright (c) 2015 Roberto Dehesa. All rights reserved.
//

import UIKit
import CoreData

class DetalleSupermercadoViewController: UIViewController {
    
    var mAppDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    @IBOutlet weak var toolbar: UIToolbar!
    
    @IBOutlet weak var nombreTextField: UITextField!
    
    @IBOutlet weak var direccionTextField: UITextField!
    
    @IBOutlet weak var poblacionTextField: UITextField!
    
    //@IBOutlet weak var nombreLabel: UILabel!
    
    //@IBOutlet weak var direccionLabel: UILabel!
    
    //@IBOutlet weak var poblacionLabel: UILabel!
    
    //var idtienda_buscar:UInt64 = 20150321175902
    //var supermercado = Tienda()
   
    var nombre_tienda:String = ""
    var direccion_tienda:String = ""
    var poblacion_tienda:String = ""
    var existingItem:NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nombreTextField.text = nombre_tienda
        self.direccionTextField.text = direccion_tienda
        self.poblacionTextField.text = poblacion_tienda
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func savePushButton(sender: AnyObject) {
        var contexto:NSManagedObjectContext = mAppDelegate.managedObjectContext!
        var updateSupermercado = NSEntityDescription.entityForName("Tienda", inManagedObjectContext: contexto)
        
        existingItem.setValue(nombreTextField.text as String, forKey: "nombre")
        existingItem.setValue(direccionTextField.text as String, forKey: "direccion")
        existingItem.setValue(poblacionTextField.text as String, forKey: "poblacion")
        
        //guardamos el contexto
        var error:NSError?
        contexto.save(&error)
        if error == nil{
             self.navigationController?.popToRootViewControllerAnimated(true)
        }
    }
    
    
    @IBAction func cancelPushButton(sender: AnyObject) {
    
        self.navigationController?.popToRootViewControllerAnimated(true)
       // dismissViewControllerAnimated(true, completion:nil)
    }
    
    
    @IBAction func deletePushButton(sender: AnyObject) {
       
   // @IBAction func deletePushButton(sender: AnyObject) {
        
        
        //primero habría que preguntar si está seguro con un alert
        
        var context:NSManagedObjectContext = mAppDelegate.managedObjectContext!
        
        
        
        var refreshAlert = UIAlertController(title: "Eliminar Supermercado", message: "¿Está seguro que desea eliminar el supermercado?", preferredStyle: UIAlertControllerStyle.Alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            
            var error:NSError? = nil
            if !context.save(&error){
                abort()
            }
            else
            {
                context.deleteObject(self.existingItem)
                self.navigationController?.popToRootViewControllerAnimated(true)
            }
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction!) in
            //println("Handle Cancel Logic here")
            
        }))
        
        presentViewController(refreshAlert, animated: true, completion: nil)
        
    }
    
    //para que al rotar el móvil el toolbar cambie el height y se reduzca a 32 pt en landscape
    /*override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        var customToolbarFrame: CGRect!
        if toInterfaceOrientation == UIInterfaceOrientation.Portrait {
            customToolbarFrame = CGRectMake(0,self.view.bounds.size.height - 44, self.toolbar.frame.size.width, 44)
        }
        else {
            customToolbarFrame = CGRectMake(0,self.view.bounds.size.height - 32, self.toolbar.frame.size.width, 32)
        }
        //UIView.animateWithDuration(duration, animations: {
            self.toolbar.frame = customToolbarFrame
        //})
    }
*/
    //consultamos los datos de detalle del supermercado seleccionado en el listado
    func buscarSupermercado() {
        
     
      /*  var contexto = mAppDelegate.managedObjectContext
        var contenido_Entidad:NSEntityDescription = NSEntityDescription.entityForName("Tienda", inManagedObjectContext: contexto!)!
        var consulta = NSFetchRequest()
        consulta.entity = contenido_Entidad
        
        var condicion:NSPredicate = NSPredicate(format: "idtienda == %@", idtienda_buscar)!
        
        consulta.predicate = condicion
        var error: NSError?
        var resultadoArray = contexto?.executeFetchRequest(consulta, error: &error) as [Tienda]
        
        if resultadoArray.count==0{
            ////mensaje de que no se encuentra ese registro
        }
        else
        {
            var supermercado:Tienda = resultadoArray[0]
            self.nombreLabel.text = supermercado.nombre
            self.direccionLabel.text = supermercado.direccion
            self.poblacionLabel.text = supermercado.poblacion
            
        }
        */
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        
   //     nombreLabel.text = supermercado.nombre
   //     direccionLabel.text = supermercado.direccion
   //     poblacionLabel.text = supermercado.poblacion
   
       
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
