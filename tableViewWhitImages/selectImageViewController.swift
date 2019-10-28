//
//  selectImageViewController.swift
//  tableViewWhitImages
//
//  Created by Raul Armas Santiago on 10/9/19.
//  Copyright © 2019 Sento40. All rights reserved.
//

import UIKit

class selectImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageViewPersonaje: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    var imageSelected = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveBtn.isEnabled = false

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func selectImageAtion(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
    
        if let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.imageSelected = selectedImage
            imageViewPersonaje.image = selectedImage
        }
        self.dismiss(animated: true, completion: nil)
        
        saveBtn.isEnabled = true
    }
    
    @IBAction func saveBtnAction(_ sender: Any) {
        print("Save")
        guard let textFieldName = nameTextField.text else {
            return
        }
        if textFieldName == ""{
            let alertFailed = UIAlertController(title: "Error", message: "Ingresar un nombre a la imagen", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Cerrar", style: .cancel, handler: nil)
            
            alertFailed.addAction(okAction);
            
            present(alertFailed,animated: true, completion: nil)
        }else{
            let alertSuccess = UIAlertController(title: "Foto Validada", message: "Imagen seleccionada satisfactoriamente", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) -> Void in
                imagePersonaje.append(self.imageSelected)
                namePersonaje.append(textFieldName)
                if let navContoroller = self.navigationController{
                    navContoroller.popViewController(animated: true)
                }
            })
            
            alertSuccess.addAction(okAction);
            
            present(alertSuccess, animated: true, completion: nil)
        }
    }
    
}
