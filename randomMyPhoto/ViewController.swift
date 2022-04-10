//
//  ViewController.swift
//  randomMyPhoto
//
//  Created by 김홍규 on 2022/04/08.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    let photoButton = UIButton(frame: .zero)
    var imageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupViews()
        addConstraints()
    }
    
    func setupViews() {
        photoButton.setTitle("사진", for: .normal)
        photoButton.addTarget(self, action: #selector(uploadPhoto), for:.touchUpInside)
        
        view.addSubview(imageView)
        view.addSubview(photoButton)
        view.subviews.forEach{
            view in view.translatesAutoresizingMaskIntoConstraints = false
            view.sizeToFit()
        }
    }
    
    func addConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([imageView.heightAnchor.constraint(equalTo: view.heightAnchor), imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    }
    
    @objc func uploadPhoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
                            {
                                imageView.contentMode = .scaleAspectFit
                                imageView.image = pickedImage
                            }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

