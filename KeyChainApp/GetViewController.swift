//
//  CollectionView.swift
//  Stackview
//
//  Created by Maria on 12/01/2021.
//

//
//  ViewController.swift
//  sectionOne
//
//  Created by Maria on 04/12/2020.
//

import UIKit
import KeychainSwift

class GetViewController: UIViewController {
    
    let getView = GetView()
    let keychain = KeychainSwift(keyPrefix: Keys.keyPrefix)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupNavBar()
        setLayout()
        style()
        getView.getIntoKeychainButton.addTarget(self, action: #selector(getFromKeyChainButtonTapped), for: .touchUpInside)
    }
}

extension GetViewController {
    
    @objc fileprivate func getFromKeyChainButtonTapped() {
        guard let imageData = keychain.getData(Keys.profileImage) else { return }
        if keychain.lastResultCode != noErr
        {print(keychain.lastResultCode)}
        let image = UIImage(data : imageData)
        getView.profileImageView.image = image
        
        if let name = keychain.get(Keys.name) {
            getView.nameLabel.text = "Name: \(name)"
        }
        
        if let isPrivate = keychain.getBool(Keys.accountIsPrivate){
            getView.isPrivateLabel.text = "Account Private: \(isPrivate)"
        }
    }
    
}

extension GetViewController {
    
    fileprivate func setupNavBar() {
        navigationItem.title = "Get"
    }
    
    fileprivate func setLayout() {
        view.addSubview(getView)
        getView.edgeToSafeArea(view, constant: 20)
        
    }
    
    fileprivate func style() {
        view.backgroundColor = .white
        
    }
}
