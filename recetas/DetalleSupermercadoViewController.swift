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
    
    @IBOutlet weak var nombreLabel: UILabel!
    
    @IBOutlet weak var direccionLabel: UILabel!
    
    @IBOutlet weak var poblacionLabel: UILabel!
    
    //var idtienda_buscar:UInt64 = 20150321175902
    //var supermercado = Tienda()
   
    var nombre_tienda:String = ""
    var direccion_tienda:String = ""
    var poblacion_tienda:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //consultamos los datos de detalle del supermercado seleccionado en el listado
    func buscarSupermercado() {
        
      self.nombreLabel.text = nombre_tienda
      self.direccionLabel.text = direccion_tienda
      self.poblacionLabel.text = poblacion_tienda
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
