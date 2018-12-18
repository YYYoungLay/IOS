//
//  ViewController.swift
//  FoodTrackerDemo
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate ,UIImagePickerControllerDelegate ,UINavigationControllerDelegate{

    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //To set the ViewController object as the delegate of its nameTextField property
        nameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Dismiss the picker if the user canceled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //The info dictionary may contain multiple representations of the image.You want to use the original
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image,but was provided the following:\(info)")
        }
        
        
        //Set photoImageView to dispaly the selected image.
        photoImageView.image = selectedImage
        
        //Dismiss the picker
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        //Hide the keyboard.
        nameTextField.resignFirstResponder()
        
        //UIImagePickerController is a view controller that lets a user pick media from their photo library
        //UIImagePickerController是一个可以让用户从photo library中取出图像的视图控制器
        let imagePickerController = UIImagePickerController()
        
        //Only allow photos to be picked,not taken?
        //这行代码设置图像选择器控制器的源代码，或者它获取图像的位置。photolibrary选项使用模拟器的相机胶卷。
        imagePickerController.sourceType = .photoLibrary
        
        //Make sure ViewCintroller is notified when the user picks an image.
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
        
        print("Tap Tap")
    }
    
}

