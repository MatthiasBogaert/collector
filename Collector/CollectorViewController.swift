//
//  CollectorViewController.swift
//  Collector
//
//  Created by De Winter Laura on 5/06/18.
//  Copyright © 2018 Comflow. All rights reserved.
//

import UIKit

class CollectorViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var TitleTextfield: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      imagePicker.delegate = self
        
        
    }
    

    @IBAction func PhotosTapped(_ sender: Any) {
      imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        ImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func CameraTapped(_ sender: Any) {
        
        
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let factuur = Factuur(context: context)
        factuur.titel = TitleTextfield.text
        factuur.image = UIImagePNGRepresentation(ImageView.image!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
     
    }
    
    
    
}
