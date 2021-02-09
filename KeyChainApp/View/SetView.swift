//
//  Section1CellView.swift
//  Stackview
//
//  Created by Maria on 28/01/2021.
//

import UIKit

class SetView: CustomUIView {
    
    let profileImageButtonHeight: CGFloat = 120
    var profileImageButton = CustomeUIButton()
    let formView = CustomUIView()
    let textFieldView = CustomUIView()
    let nameLabel = CustomUILabel()
    var nameTextField = UITextField()
    let switchView = CustomUIView()
    let isPrivateLabel = CustomUILabel()
    let isPrivateSwitch = CustomeUISwitch()
    var setIntoKeychainButton = UIButton(type: .system)
    var deleteNameButton = UIButton(type: .system)
    var clearButton = UIButton(type: .system)
    
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
        
        self.addSubview(profileImageButton)
        profileImageButton.toTopAndCenter(topView: self, centerView: self)
        profileImageButton.setWidth(profileImageButtonHeight)
        profileImageButton.setHeight(profileImageButtonHeight)
        
        
        self.addSubview(formView)
        formView.setAnchor(top: profileImageButton.bottomAnchor, bottom: self.bottomAnchor, right: self.trailingAnchor, left: self.leadingAnchor,paddingTop: 20, paddingBottom: 100)
        textFieldView.HStack(nameLabel.setWidth(50),
                             nameTextField,
                             spacing: 8
        )

        switchView.HStack(isPrivateLabel,
                          isPrivateSwitch
                
        )
        switchView.addSubview(isPrivateLabel)
        switchView.addSubview(isPrivateSwitch)
        isPrivateLabel.setAnchor(top: switchView.topAnchor, bottom:  switchView.bottomAnchor, right:  nil, left:   switchView.leadingAnchor)
        isPrivateSwitch.setAnchor(top: switchView.topAnchor, bottom:  switchView.bottomAnchor, right: nil, left: isPrivateLabel.trailingAnchor, paddingLeft: 8)
        formView.VStack(textFieldView,
                    switchView,
                    setIntoKeychainButton,
                    deleteNameButton,
                    clearButton,
                    distribution: .equalCentering

        )

    }
    
    func setUp() {
        nameLabel.text = "Name"
        isPrivateLabel.text = "Account Private"
        setIntoKeychainButton.setTitle("Set", for: .normal)
        deleteNameButton.setTitle("Delete Name", for: .normal)
        clearButton.setTitle("Clear Keychain", for: .normal)

    }

    func style() {
        
        profileImageButton.layer.cornerRadius = profileImageButtonHeight / 2
        profileImageButton.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.7450980392, blue: 0.7647058824, alpha: 1)
        profileImageButton.layer.masksToBounds = true
        
        nameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        nameTextField.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.7450980392, blue: 0.7647058824, alpha: 1)
        nameTextField.sizeToFit()
        
        isPrivateLabel.sizeToFit()
        
        isPrivateSwitch.onTintColor = #colorLiteral(red: 0.9921568627, green: 0.7960784314, blue: 0.431372549, alpha: 1)
        isPrivateSwitch.layer.cornerRadius = 16
        isPrivateSwitch.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.7450980392, blue: 0.7647058824, alpha: 1)
        
        setIntoKeychainButton.setTitleColor(.white, for: .normal)
        setIntoKeychainButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        setIntoKeychainButton.backgroundColor = #colorLiteral(red: 0, green: 0.7215686275, blue: 0.5803921569, alpha: 1)
        setIntoKeychainButton.layer.cornerRadius = 8
        setIntoKeychainButton.layer.masksToBounds = true
        
        deleteNameButton.setTitleColor(.white, for: .normal)
        deleteNameButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        deleteNameButton.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.7960784314, blue: 0.431372549, alpha: 1)
        deleteNameButton.layer.cornerRadius = 8
        deleteNameButton.layer.masksToBounds = true
        
        clearButton.setTitleColor(.white, for: .normal)
        clearButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        clearButton.backgroundColor = #colorLiteral(red: 0.8392156863, green: 0.1882352941, blue: 0.1921568627, alpha: 1)
        clearButton.layer.cornerRadius = 8
        clearButton.layer.masksToBounds = true
    }
}




