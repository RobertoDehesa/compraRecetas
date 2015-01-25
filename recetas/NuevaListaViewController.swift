//
//  NuevaListaViewController.swift
//  recetas
//
//  Created by Roberto Dehesa  on 17/1/15.
//  Copyright (c) 2015 Roberto Dehesa. All rights reserved.
//

import UIKit

protocol NuevaListaDelegate{
    func nuevaLista(lista: Lista)
}

class NuevaListaViewController: UIViewController {

    @IBOutlet weak var nombreTextField: UITextField!
    
    @IBOutlet weak var supermercadoTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func cancelarButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)    }
    
    
    @IBAction func guardarButton(sender: AnyObject) {
        var lista = Lista()
        
        lista.supermercado = supermercadoTextField.text
        lista.nombre = nombreTextField.text
        
        delegate?.nuevaLista(lista)
        dismissViewControllerAnimated(true, completion: nil)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
