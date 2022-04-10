//
//  ViewController.swift
//  randomMyPhoto2
//
//  Created by 김홍규 on 2022/04/10.
//

import UIKit

class ViewController: UIViewController {
    
    let picker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        picker.delegate = self
    }
    
        
    func openLibrary() {
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    func openCamera() {
        if(UIImagePickerController .isSourceTypeAvailable(.camera)) {
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        }
        else {
            print("Camera not available")
        }
    }

    @IBAction func addAction(_ sender: Any) {
        
        let alert = UIAlertController(title:"원하는 타이틀", message:"원하는 메세지", preferredStyle: .actionSheet)
        let library = UIAlertAction(title:"사진앨범", style:.default) {(action) in self.openLibrary()}
        let camera = UIAlertAction(title:"카메라", style:.default) {(action) in self.openCamera()}
        let cancle = UIAlertAction(title: "취소", style: .default, handler: nil)
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancle)
        present(alert, animated: false, completion: nil)
        
    }
    
}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = image
            print(info)
        }
        
        dismiss(animated: true, completion: nil)
                
    }
}


