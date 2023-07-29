//
//  AddDiscussionViewController.swift
//  RMC_Thesis_CS6200
//
//  Created by Rebecca Rose McCarthy
//  Student Number: 121105576
//  Course Code: MScIM22
//
//
import UIKit
import CoreData

class CellClass: UITableViewCell {
}

class AddDiscussionViewController: UIViewController {

    let transparentView = UIView()
    let tableView = UITableView()
    var selectedButton = UIButton()
    var dataSource = [String]()
    
    @IBOutlet weak var catagorySelected: UIButton!
    @IBOutlet weak var questionTF: UITextField!
    
    @IBOutlet weak var adviceView: UIView!
    @IBAction func catagoryButton(_ sender: Any) {
        dataSource = ["Sensory", "Environment", "Other"]
        selectedButton = catagorySelected
        addTransparentView(frames: catagorySelected.frame)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if pManagedObject == nil{save()}
        else {}

        navigationController?.popViewController(animated: true)
    }
    
    func addTransparentView(frames: CGRect) {
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
        self.view.addSubview(transparentView)
             
        tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        self.view.addSubview(tableView)
        tableView.layer.cornerRadius = 5
             
        transparentView.backgroundColor = UIColor.black
        tableView.reloadData()
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        transparentView.addGestureRecognizer(tapgesture)
        transparentView.alpha = 0
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: CGFloat(self.dataSource.count * 50))
        }, completion: nil)
    }
    
    @objc func removeTransparentView() {
        let frames = selectedButton.frame
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
             }, completion: nil)
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var pManagedObject : Prompts! = nil
    var pEntity : NSEntityDescription! = nil
    
    func save(){
        // create a new managed object
        pEntity = NSEntityDescription.entity(forEntityName: "Prompts", in: context)
        pManagedObject = Prompts(entity: pEntity, insertInto: context)
        pManagedObject.topic = catagorySelected.titleLabel!.text
        pManagedObject.prompt = questionTF.text
        do{
            try context.save()
        }catch{
            print("CD CONTEXT CANNOT SAVE")
        }
    }
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        adviceView.layer.cornerRadius = 20
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CellClass.self, forCellReuseIdentifier: "Cell")
        
        if pManagedObject != nil{
            catagorySelected.titleLabel!.text  = pManagedObject.topic
            questionTF.text = pManagedObject.prompt
        }
    }


}

extension AddDiscussionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedButton.setTitle(dataSource[indexPath.row], for: .normal)
        removeTransparentView()
    }
}
