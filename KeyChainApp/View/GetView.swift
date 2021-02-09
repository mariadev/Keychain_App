//
//  GetView.swift
//  KeyChainApp
//
//  Created by Maria on 08/02/2021.
//

import UIKit

class GetView: CustomUIView {
    
    let profileImageButtonHeight: CGFloat = 120
    var profileImageView = CustomUIImageView()
    let nameLabel = CustomUILabel()
    let isPrivateLabel = CustomUILabel()
    var getIntoKeychainButton = UIButton(type: .system)
    let formView = CustomUIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        setUp()
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        
        self.addSubview(profileImageView)
        profileImageView.toTopAndCenter(topView: self, centerView: self)
        profileImageView.setWidth(profileImageButtonHeight)
        profileImageView.setHeight(profileImageButtonHeight)
        
        
        self.addSubview(formView)
        formView.setAnchor(top: profileImageView.bottomAnchor, bottom: self.bottomAnchor, right: self.trailingAnchor, left: self.leadingAnchor,paddingTop: 20, paddingBottom: 200)
        formView.VStack(nameLabel,
                        isPrivateLabel,
                        getIntoKeychainButton,
                        distribution: .equalCentering
                        
        )
        
    }
    
    func setUp() {
        nameLabel.text = "Name:"
        isPrivateLabel.text = "Account Private:"
        getIntoKeychainButton.setTitle("Get", for: .normal)
        
    }
    
    func style() {
        
        profileImageView.layer.cornerRadius = profileImageButtonHeight / 2
        profileImageView.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.7450980392, blue: 0.7647058824, alpha: 1)
        profileImageView.layer.masksToBounds = true
        
        isPrivateLabel.sizeToFit()
        
        getIntoKeychainButton.setTitleColor(.white, for: .normal)
        getIntoKeychainButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        getIntoKeychainButton.backgroundColor = #colorLiteral(red: 0, green: 0.7215686275, blue: 0.5803921569, alpha: 1)
        getIntoKeychainButton.layer.cornerRadius = 8
        getIntoKeychainButton.layer.masksToBounds = true
        
    }
}





