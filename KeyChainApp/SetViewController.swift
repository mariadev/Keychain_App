//
//  ViewController.swift
//  Stackview
//
//  Created by Maria on 12/01/2021.
//

import UIKit
import KeychainSwift

struct Keys {
    static let keyPrefix = "appTest_"
    static let profileImage = "profileImage"
    static let name = "name"
    static let accountIsPrivate = "accountIsPrivate"
}

class SetViewController: UIViewController {
    
    let setView = SetView()
    let keychain = KeychainSwift(keyPrefix: Keys.keyPrefix)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupNavBar()
        setLayout()
        style()
        setView.clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        setView.deleteNameButton.addTarget(self, action: #selector(deleteNameButtonTapped), for: .touchUpInside)
        setView.setIntoKeychainButton.addTarget(self, action: #selector(setIntoKeychainButtonTapped), for: .touchUpInside)
        setView.profileImageButton.addTarget(self, action: #selector(profileImageButtonTapped), for: .touchUpInside)
    }
    
    fileprivate func setupNavBar() {
        navigationItem.title = "Set"
        
        let goToGetViewControllerBarButtonItem = UIBarButtonItem(title: "Get", style: .done, target: self, action: #selector(goToGetViewControllerBarButtonItemTapped))
        navigationItem.setRightBarButton(goToGetViewControllerBarButtonItem, animated: true)
    }
    
    @objc fileprivate func profileImageButtonTapped() {
        showChooseSourceTypeAlertController()
    }
    
    @objc fileprivate func setIntoKeychainButtonTapped() {
        guard let image = setView.profileImageButton.imageView?.image,
              let imageData = image.jpegData(compressionQuality: 1.0)
        else { return }
        if keychain.set(imageData,
                        forKey: Keys.profileImage,
                        withAccess: KeychainSwiftAccessOptions.accessibleAlways) {
        }
        
        if setView.nameTextField.text != "" {
            guard let name = setView.nameTextField.text else {return}
            keychain.set(name, forKey: Keys.name, withAccess: .accessibleAlways)
        }
        
        let isAccountPrivate = setView.isPrivateSwitch.isOn
        keychain.set(isAccountPrivate, forKey: Keys.accountIsPrivate, withAccess: .accessibleAlways)
    }
    
    @objc fileprivate func deleteNameButtonTapped() {
        keychain.delete(Keys.name)
    }
    
    @objc fileprivate func clearButtonTapped() {
        keychain.clear()
    }
    
    @objc fileprivate func goToGetViewControllerBarButtonItemTapped() {
        let controller = GetViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}


extension SetViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showChooseSourceTypeAlertController() {
        let photoLibraryAction = UIAlertAction(title: "Choose a Photo", style: .default) { (action) in
            self.showImagePickerController(sourceType: .photoLibrary)
        }
        let cameraAction = UIAlertAction(title: "Take a New Photo", style: .default) { (action) in
            self.showImagePickerController(sourceType: .camera)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        Service.showAlert(style: .actionSheet, title: nil, message: nil, actions: [photoLibraryAction, cameraAction, cancelAction], completion: nil)
    }
    
    func showImagePickerController(sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            setView.profileImageButton.setImage(editedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            setView.profileImageButton.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        dismiss(animated: true, completion: nil)
    }
}

extension SetViewController {
    
    func setLayout() {
        view.addSubview(setView)
        setView.edgeToSafeArea(view, constant: 20)
        
    }
    
    func style() {
        view.backgroundColor = .white
        
    }
}
