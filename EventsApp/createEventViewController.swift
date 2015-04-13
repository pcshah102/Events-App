//
//  createEventViewController.swift
//  EventsApp
//
//  Created by pcshah on 4/12/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

import UIKit

class createEventViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailsTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    let imagePicker = UIImagePickerController()
    var selectedImage = UIImage?()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCamera()
    }
    
    func setUpCamera()
    {
         imagePicker.delegate = self
         imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
         imagePicker.allowsEditing = true
    }
    
    @IBAction func onDoneButtonTapped(sender: UIBarButtonItem) {
        if titleTextField.text == "" || detailsTextField.text == "" || locationTextField.text == "" || selectedImage == nil
        {
            showAlert("Please fill out all required fields", nil, self)
        }
    }
    
    @IBAction func onCancelButtonTapped(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onSelectPhotoButtonTapped(sender: UIButton) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        dismissViewControllerAnimated(true, completion: { () -> Void in
                self.selectedImage = image
        })
    }

}
