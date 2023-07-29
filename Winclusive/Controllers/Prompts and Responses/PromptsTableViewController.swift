//
//  PromptsTableViewController.swift
//  RMC_Thesis_CS6200
//
//  Created by Rebecca Rose McCarthy
//  Student Number: 121105576
//  Course Code: MScIM22
//
//
import UIKit
import CoreData

class PromptsTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    @IBAction func addDiscussionButton(_ sender: Any) {
    }
    
    // core data objects and functions
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var pManagedObject : Prompts! = nil
    var frc : NSFetchedResultsController<NSFetchRequestResult>! = nil
        
    func makeRequest() -> NSFetchRequest<NSFetchRequestResult>{
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Prompts")

        // define predicates and sorters
        let sorter = NSSortDescriptor(key: "topic", ascending: true)
        request.sortDescriptors = [sorter]
        
        return request
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pManagedObject = nil
        
        // frc gets the data from Prompts
        frc = NSFetchedResultsController(fetchRequest: makeRequest(), managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        frc.delegate = self
        
        do{
            try frc.performFetch()
        }catch{
            print("CD CANNOT FETCH")
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return frc.sections![section].numberOfObjects
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subcells", for: indexPath)

        // Configure the cell...
        pManagedObject = (frc.object(at: indexPath) as! Prompts)
        
        cell.textLabel?.text = pManagedObject.prompt
        cell.detailTextLabel?.text = pManagedObject.topic

        cell.layer.cornerRadius=10
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            pManagedObject = frc.object(at: indexPath) as! Prompts
            context.delete(pManagedObject)
            
            do{
                try context.save()
            }catch{
                print("CD CONTEXT CANNOT SAVE")
            }
            
            do{
                try frc.performFetch()
            }catch{
                print("CD CANNOT FETCH")
            }
            
            tableView.reloadData()
            
        }
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewSegue"{
            // get the data from frc of indexPath
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            pManagedObject = frc.object(at: indexPath!) as! Prompts

            // push to DiscussionListController
            let destination = segue.destination as! DiscussionListController
            destination.pManagedObject = self.pManagedObject
        }

    }

}
