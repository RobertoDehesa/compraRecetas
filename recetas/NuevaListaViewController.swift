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
    var colors = ["Red","Yellow","Green","Blue"]
    var supermercados = []
 
    var mAppDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
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
        var nuevaCesta = NSEntityDescription.insertNewObjectForEntityForName("Cesta", inManagedObjectContext: contexto) as Cesta
        
        nuevaCesta.nombre = self.nombreTextField.text
        nuevaCesta.comentarios = self.comentariosTextField.text
        
        
        self.nombreTextField.text = ""
        self.comentariosTextField.text = ""
        
        
        //guardamos el contexto
        var error:NSError?
        contexto.save(&error)
        if error == nil{
            dismissViewControllerAnimated(true, completion:nil)
        }
    }
    
    var delegate: NuevaListaDelegate?
    
        override func viewDidLoad() {
        super.viewDidLoad()
       
            
        // Do any additional setup after loading the view.
    }
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return colors[row]
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
