//
//  SupermercadosTableViewController.swift
//  recetas
//
//  Created by Eugenia Perez Velasco on 20/3/15.
//  Copyright (c) 2015 Roberto Dehesa. All rights reserved.
//

import UIKit
import CoreData

class SupermercadosTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var myList: Array<AnyObject>=[]
    
    /*let mAppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController()
    */
    
    override func viewDidAppear(animated: Bool) {
        
        let appDel : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        let freq = NSFetchRequest(entityName: "Tienda")
        
        myList = context.executeFetchRequest(freq, error: nil)!
        println(myList)
        tableView.reloadData()
       
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     /*   fetchedResultController = getFetchedResultController()
        fetchedResultController.delegate = self
        fetchedResultController.performFetch(nil)
        */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       
        // Return the number of sections.
        return 1
        //return fetchedResultController.sections.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        // Return the number of rows in the section.
        return myList.count
        //return fetchedResultController.sections![section].numberOfObjects
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

       /* let supermercado = fetchedResultController.objectAtIndexPath(indexPath) as Tienda
        cell.textLabel!.text = supermercado.nombre
        println("idtienda: \(supermercado.idtienda) nombre:\(supermercado.nombre)")
       */
        
       // if indexPath != nil
       // {
            var data:NSManagedObject = myList[indexPath.row] as! NSManagedObject
            cell.textLabel!.text = data.valueForKeyPath("nombre") as! String?
       // }
        
        return cell

    }
    
    /*func taskFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "Tienda")
        let sortDescriptor = NSSortDescriptor(key: "nombre", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }
    
    func getFetchedResultController() -> NSFetchedResultsController {
        fetchedResultController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: mAppDelegate!, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultController
    }
    
    
    
    func controllerDidChangeContent(controller: NSFetchedResultsController!)
    {
        tableView.reloadData()
    }
    */
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }

    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
           // if let tv = tableView{
                context.deleteObject(myList[indexPath.row] as! NSManagedObject)
                myList.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
           // }
            var error:NSError? = nil
            if !context.save(&error){
                abort()
            }
         //   mAppDelegate.deleteObject(fetchedResultController.objectAtIndexPath(indexPath) as! NSManagedObject)
         //   var error:NSError?
         //   mAppDelegate?.save(&error)
        }
        //else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        //}
    }
/*

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

        // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToDetalleSupermercadoFromListadoSupermercados"{
            var numrow = self.tableView.indexPathForSelectedRow()?.row
            var selectedItem: NSManagedObject = myList[numrow!] as! NSManagedObject
            
            // let addEventViewController: AddEventViewController = segue.destinationViewController as! AddEventViewController
            
            //addEventViewController.newTagArray = newTagArray
            
            /*sustituir por:
            
            let nav = segue.destinationViewController as UINavigationController
            let addEventViewController = nav.topViewController as! AddEventViewController
            
            addEventViewController.newTagArray = newTagArr
            */
            let nav = segue.destinationViewController as! UINavigationController
            let ivc: DetalleSupermercadoViewController = nav.topViewController as! DetalleSupermercadoViewController
            
            // let ivc: DetalleSupermercadoViewController = segue.destinationViewController as! DetalleSupermercadoViewController
            
            ivc.nombre_tienda = selectedItem.valueForKey("nombre") as! String
            ivc.direccion_tienda = selectedItem.valueForKey("direccion") as! String
            ivc.poblacion_tienda = selectedItem.valueForKey("poblacion") as! String
           // var detalleSupermercadoViewController = segue.destinationViewController as DetalleSupermercadoViewController
           //var celda = sender as UITableViewCell
           // DetalleSupermercadoViewController.supermercado = .....
        }
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    

}
