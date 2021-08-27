//
//  ViewController.swift
//  CoreDataWithRAVI
//
//  Created by puneet pal on 26/08/21.
//

import UIKit

class CreateEmploeeVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    
    @IBOutlet weak var imgProfilePicture: UIImageView!
    @IBOutlet weak var txtEmployeeName: UITextField!
    @IBOutlet weak var txtEmployeeEmailId: UITextField!

    private var manager: EmployeeManager = EmployeeManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.createEmployee()
 //       self.fetchEmployee()
        
    }

    
    @IBAction func createButtonTapped(_ sender: Any) {
        let employee = Employee(name: txtEmployeeName.text, email: txtEmployeeEmailId.text, profilePicture: imgProfilePicture.image?.pngData(), id: UUID())
        
        manager.createEmployee(employee: employee)
        self.performSegue(withIdentifier: SegueIdentifier.navigateToEmployeeList, sender: nil)
        
    }
//    func createEmployee(){
//
//        let employee = CDEmployee(context: PersistentStorage.shared.context)
//        employee.name = "Neha"
//        PersistentStorage.shared.saveContext()
//    }
    
    
//    func fetchEmployee(){
//
//        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        print(path[0])
//
//        do {
//            guard let result = try? PersistentStorage.shared.context.fetch(CDEmployee.fetchRequest()) as? [Employee] else {return}
//
//            result.forEach({print($0.name)})
//        } catch let error {
//            debugPrint(error)
//        }
//
//    }
    
    @IBAction func selectImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .savedPhotosAlbum
        picker.delegate = self
        present(picker, animated: true)
    }

    // MARK: Image picker delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let img = info[.originalImage] as? UIImage
        self.imgProfilePicture.image = img

        dismiss(animated: true, completion: nil)
    }

}
	
