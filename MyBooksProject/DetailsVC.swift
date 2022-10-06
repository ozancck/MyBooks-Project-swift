//
//  DetailsVC.swift
//  MyBooksProject
//
//  Created by Ozan Çiçek on 5.10.2022.
//

import UIKit
import CoreData

class DetailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var writerText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRecognizer = UIGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
        
        imageView.isUserInteractionEnabled = true
        let imageTabRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTabRecognizer)
        
        
        
    }
    
    
    
    @objc func selectImage (){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true)
        
        
    }
    
    @objc func hideKeyboard (){
        view.endEditing(true)
    }
    
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newBook = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context)
        
        newBook.setValue(nameText.text!, forKey: "name")
        newBook.setValue(writerText.text!, forKey: "writer")
        
        if let year = Int(yearText.text!){
            newBook.setValue(year, forKey: "year")
        }
        
        newBook.setValue(UUID(), forKey: "id")
        
        let data = imageView.image!.jpegData(compressionQuality: 0.5)
        newBook.setValue(data, forKey: "image")
        
        do{
            try context.save()
            print("succes")
        }catch {
            print("errro")
        }
        
        
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
}
