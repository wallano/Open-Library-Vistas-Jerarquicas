//
//  TableViewControllerMaster.swift
//  VistasJerarquicasOpenLibrary
//
//  Created by Walter Llano on 05/11/16.
//  Copyright © 2016 Walter Llano. All rights reserved.
//

import UIKit

class TableViewControllerMaster: UITableViewController
{
    @IBAction func redireccionaBusquedaISBN(_ sender: AnyObject)
    {
        //Este hace referencia al Storyboard
        let miStoryBoard: UIStoryboard =  UIStoryboard(name: "Main", bundle: nil)
        //Asociación de la vista al Story Board
        let vista = miStoryBoard.instantiateViewController(withIdentifier: "isbnView") as! ViewControllerISBN
        //Se envía el control a la vista
        self.navigationController!.pushViewController(vista, animated: true)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = "Libros"
        
        print("Vista Tabla")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
        print("libros tabla")
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        print(libros.count)
        return libros.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)

        // Configure the cell...
        cell.textLabel!.text = libros[(indexPath as NSIndexPath).row].titulo

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let control = segue.destination as! ViewControllerDetalle
        let indexPath = self.tableView.indexPathForSelectedRow
        control.librito = libros[(indexPath! as NSIndexPath).row]
        
    }
}
