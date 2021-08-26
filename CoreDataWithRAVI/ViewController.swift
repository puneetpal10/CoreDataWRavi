//
//  ViewController.swift
//  CoreDataWithRAVI
//
//  Created by puneet pal on 26/08/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.createEmployee()
        self.fetchEmployee()
        
    }

    
    func createEmployee(){
        
        let employee = CDEmployee(context: PersistentStorage.shared.context)
        employee.name = "Neha"
        PersistentStorage.shared.saveContext()
    }
    
    
    func fetchEmployee(){
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(path[0])
        
        do {
            guard let result = try? PersistentStorage.shared.context.fetch(CDEmployee.fetchRequest()) as? [Employee] else {return}
            
            result.forEach({print($0.name)})
        } catch let error {
            debugPrint(error)
        }
        
    }
}
	
