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

    let mAppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    //var mAppDelegate:AppDelegate=UIApplication.sharedApplication().delegate as AppDelegate
    
    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController()
    
    override func viewDidAppear(animated: Bool) {
        
        //Declaramos una variable con nuestro navigationBar
       // var nav = self.navigationController?.navigationBar
        //Cambiamos el estilo y el color por medio de los métodos barStyle y tintColor
      //  nav?.barStyle = UIBarStyle.Default
        //nav?.tintColor = UIColor.greenColor()
       // nav?.backgroundColor = UIColor.greenColor()
        
       // var navItem = self.navigationItem.title
        
       
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        fetchedResultController = getFetchedResultController()
        fetchedResultController.delegate = self
        fetchedResultController.performFetch(nil)
        
        //let contexto = mAppDelegate.managedObjectContext
        
       // var listasupermercados:NSEntityDescription = NSEntityDescription.entityForName("Tienda", inManagedObjectContext: contexto!)!
        
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
        //return fetchedResultController.sections.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return fetchedResultController.sections![section].numberOfObjects
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        let supermercado = fetchedResultController.objectAtIndexPath(indexPath) as Tienda
        cell.textLabel!.text = supermercado.nombre
        return cell

    }
    
    func taskFetchRequest() -> NSFetchRequest {
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
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
