//
//  AddPersonViewController.swift
//  CD People
//
//  Created by stabirca on 21/03/2021.
//

import UIKit
import CoreData

class AddPersonViewController: UIViewController {
    // outlets and action
   
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var imageTF: UITextField!
    
    @IBAction func addUpdateAction(_ sender: Any) {
        if pManagedObject == nil{save()}
        else {update()}
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    // core data objects and functions
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var pManagedObject : Prompts! = nil
    var pEntity : NSEntityDescription! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // setup the TF-s
        if pManagedObject != nil{
            nameTF.text  = pManagedObject.name
            phoneTF.text = pManagedObject.phone

        }
    }
    
    // function to deal with data
    
    func update(){
        // update the pManagedObject
        pManagedObject.name = nameTF.text
        pManagedObject.phone = phoneTF.text
        pManagedObject.address = addressTF.text
        pManagedObject.email = emailTF.text
        pManagedObject.image = imageTF.text
        
        do{
            try context.save()
        }catch{
            print("CD CONTEXT CANNOT SAVE")
        }
    }

    func save(){
        // create a new managed object
        pEntity = NSEntityDescription.entity(forEntityName: "People", in: context)
        pManagedObject = People(entity: pEntity, insertInto: context)
        
        // update the pManagedObject
        pManagedObject.name = nameTF.text
        pManagedObject.phone = phoneTF.text
        pManagedObject.address = addressTF.text
        pManagedObject.email = emailTF.text
        pManagedObject.image = imageTF.text
        
        do{
            try context.save()
        }catch{
            print("CD CONTEXT CANNOT SAVE")
        }
    }
}
