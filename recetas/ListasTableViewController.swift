//
//  ListasTableViewController.swift
//  recetas
//
//  Created by Roberto Dehesa  on 11/1/15.
//  Copyright (c) 2015 Roberto Dehesa. All rights reserved.
//

import UIKit
import CoreData

class ListasTableViewController: UITableViewController, NuevaListaDelegate, NSFetchedResultsControllerDelegate {

    let mAppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var listaArray = Array<Lista>()
    
    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchedResultController = getFetchedResultController()
        fetchedResultController.delegate = self
        fetchedResultController.performFetch(nil)
        
//        for i in 1...10{
//            var lista = Lista()
//            
//            lista.nombre = "Nombre\(i)"
//            lista.numArticulos = "NumArticulos\(i)"
//            lista.supermercado = "Supermercado\(i)"
//            lista.importe = "Importe\(i)"
//            
//            listaArray.append(lista)
//        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        //return listaArray.count
        return fetchedResultController.sections![section].numberOfObjects
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        let cesta = fetchedResultController.objectAtIndexPath(indexPath) as! Cesta
        //let lista = listaArray[indexPath.row]
        // Configure the cell...
      //  cell.textLabel?.text = lista.nombre + " " + lista.supermercado
        cell.textLabel?.text = cesta.nombre

        return cell
    }
    
    
    func taskFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "Cesta")
        let sortDescriptor = NSSortDescriptor(key: "nombre", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }
    
    func getFetchedResultController() -> NSFetchedResultsController {
        fetchedResultController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext:
            mAppDelegate!, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultController
    }
    
    
    func controllerDidChangeContent(controller: NSFetchedResultsController!)
    {
        tableView.reloadData()
    }
    

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            mAppDelegate?.deleteObject(fetchedResultController.objectAtIndexPath(indexPath) as! NSManagedObject)
            var error:NSError?
           mAppDelegate?.save(&error)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToNuevaListaFromListas" {
            var navigationController = segue.destinationViewController as! UINavigationController
            var nuevaListaViewController = navigationController.viewControllers[0] as! NuevaListaViewController
            nuevaListaViewController.delegate = self 
        
        }
    }
    
    
    // MARK - NuevaListaDelegate
    func nuevaLista(lista: Lista) {
        listaArray.append(lista)
        tableView.reloadData()
    }

}
