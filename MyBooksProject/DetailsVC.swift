//
//  DetailsVC.swift
//  MyBooksProject
//
//  Created by Ozan Çiçek on 5.10.2022.
//

import UIKit

class DetailsVC: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var writerText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRecognizer = UIGestureRecognizer(target: self, action: #selector(hideKeyboard))
    }
    
    @objc func hideKeyboard (){
        view.endEditing(true)
    }
    
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        
    }
    
    
}
