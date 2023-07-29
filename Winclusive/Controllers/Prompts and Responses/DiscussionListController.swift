//
//  DiscussionListController.swift
//  Winclusive
//
//  Created by Rebecca Rose McCarthy
//
//

import UIKit
import CoreData

class DiscussionListController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var responseTF: UITextField!
    @IBOutlet weak var discussionLabel: UILabel!
    
    @IBAction func saveButton(_ sender: Any) {
        save()
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var pManagedObject : Prompts! = nil
    var dManagedObject : Discussion! = nil

    var frc : NSFetchedResultsController<NSFetchRequestResult>! = nil
        
    func makeRequest() -> NSFetchRequest<NSFetchRequestResult>{
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Discussion")

        // define predicates and sorters
        let sorter = NSSortDescriptor(key: "date", ascending: true)
        request.sortDescriptors = [sorter]
        
        let filter = pManagedObject
        let predicate = NSPredicate(format: "prompts = %@", filter!)
        request.predicate = predicate
        
        return request
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // frc gets the data from People
        frc = NSFetchedResultsController(fetchRequest: makeRequest(), managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        
        var this = frc.fetchedObjects
        do{
            try frc.performFetch()
        }catch{
            print("CD CANNOT FETCH")
        }
        
        discussionLabel.text  = pManagedObject!.prompt
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        print("Reloading Table Now")
        tableView.reloadData()
        i = 0
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pManagedObject?.discussion?.count ?? 0
        //return frc.sections![section].numberOfObjects

    }
    var i = 0
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "responseCell", for: indexPath)
        
        dManagedObject = (frc.object(at: indexPath) as! Discussion)
        if (dManagedObject.prompts == pManagedObject) {
            print("Populating Cell with ", dManagedObject.response)
            cell.textLabel?.text = dManagedObject.response
            
            let date = dManagedObject.date
            let formatter1 = DateFormatter()
            formatter1.dateFormat = "d MMM y @ HH:mm"
            cell.detailTextLabel?.text = formatter1.string(from: date!)
            cell.layer.cornerRadius=10
        }
        

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
            dManagedObject = frc.object(at: indexPath) as! Discussion
            if(dManagedObject.prompts == pManagedObject){
                context.delete(dManagedObject)
                
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
            }
        }
    }

    var pEntity : NSEntityDescription! = nil

    func save(){
        pEntity = NSEntityDescription.entity(forEntityName: "Discussion", in: context)
        dManagedObject = Discussion(entity: pEntity, insertInto: context)
        dManagedObject.response = responseTF.text
        dManagedObject.date = Date()
        dManagedObject.prompts = pManagedObject
        //pManagedObject.addToDiscussion(dManagedObject)
        
        do{
            try context.save()
            responseTF.text = ""
            responseTF.placeholder = "Enter your response..."
        }catch{
            print("CD CONTEXT CANNOT SAVE")
        }
    }
}
