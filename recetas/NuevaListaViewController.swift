//
//  NuevaListaViewController.swift
//  recetas
//
//  Created by Roberto Dehesa  on 17/1/15.
//  Copyright (c) 2015 Roberto Dehesa. All rights reserved.
//

import UIKit
import CoreData

protocol NuevaListaDelegate{
    func nuevaLista(lista: Lista)
}

class NuevaListaViewController: UIViewController, NSFetchedResultsControllerDelegate {
    var colors = ["Red","Yellow","Green","Blue", "1", "2"]
    var supermercados = Array<String>()
    var num = 0
    var idTienda: Int = 0
 
    var mAppDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    @IBOutlet weak var comentariosTextField: UITextField!
    
    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController()
    
    @IBOutlet weak var nombreTextField: UITextField!
    
    @IBOutlet weak var supermercadoTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBAction func cancelarButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)    }
    
    
    @IBAction func guardarButton(sender: AnyObject) {
        
       
        
        //tenemos que generar el contexto
        var contexto:NSManagedObjectContext = mAppDelegate.managedObjectContext!
        var nuevaCesta = NSEntityDescription.insertNewObjectForEntityForName("Cesta", inManagedObjectContext: contexto) as! Cesta
        
        nuevaCesta.nombre = self.nombreTextField.text
        nuevaCesta.comentarios = self.comentariosTextField.text
        nuevaCesta.aviso_localizacion = 0
        nuevaCesta.fechahora_creacion = NSDate()
        nuevaCesta.orden = 2
        
        
        self.nombreTextField.text = ""
        self.comentariosTextField.text = ""
        
        //guardamos el contexto
        var error:NSError?
        contexto.save(&error)
        if error == nil{
            dismissViewControllerAnimated(true, completion:nil)
        }
    }
    
    @IBOutlet weak var switchButton: UISwitch!
    

    
    var delegate: NuevaListaDelegate?
    
        override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view.
            
        fetchedResultController = getFetchedResultController()
        fetchedResultController.delegate = self
        fetchedResultController.performFetch(nil)
        
        fillSupermercados()
            
            if switchButton.on {
                println("on")
            }else {
                println("on")
            }
    }
    
    func fillSupermercados(){
       let result = fetchedResultController.fetchedObjects as [Tienda]
        println(result.count)
        for i in 0...(result.count-1) {
            supermercados.append(result[i].nombre)
            println(result[i].idtienda)
        }
    }
    
    
    func taskFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "Tienda")
        let sortDescriptor = NSSortDescriptor(key: "nombre", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }
    
    func getFetchedResultController() -> NSFetchedResultsController {
        fetchedResultController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: mAppDelegate.managedObjectContext!, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
     //   return fetchedResultController.sections![component].numberOfObjects
        return supermercados.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return supermercados[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        println(supermercados[row])
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
