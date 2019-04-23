//
//  ViewController.swift
//  White
//
//  Created by Myo Set Paing on 4/11/19.
//  Copyright © 2019 Myo Set Paing. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var mypicker:UIImagePickerController? = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture(gesture:)))
        photoImageView.addGestureRecognizer(tapGesture)
        photoImageView.isUserInteractionEnabled = true
        mypicker?.delegate=self
    }
    
    
    @IBAction func setDefaultLabelText(_ sender: Any) {
        
        mealNameLabel.text = "Default Text"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func tapGesture(gesture: UIGestureRecognizer) {
        openGallary()
    }
    
    func openGallary() {
        mypicker?.allowsEditing = false
        mypicker?.sourceType = .photoLibrary
        present(mypicker!, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let choosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.image = choosenImage
        dismiss(animated: true, completion: nil)
    }
}

