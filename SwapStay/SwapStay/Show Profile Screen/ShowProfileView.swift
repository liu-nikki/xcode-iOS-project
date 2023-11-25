//
//  ShowProfileView.swift
//  SwapStay
//
//  Created by Yu Zou on 11/22/23.
//

import UIKit

class ShowProfileView: UIView {
    
    var imageProfile: UIImageView!
    var labelProfile: UILabel!
    var labelName: UILabel!
    var labelUsername: UILabel!
    //var labelPassword: UILabel!
    var labelPhone: UILabel!
    var labelAddress: UILabel!
    var buttonEdit: UIButton!
    var buttonLogOut: UIButton!
    
    //MARK: view initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //setting background color
        self.backgroundColor = .white
        
        setupImageProfile()
        setupLabelProfile()
        setupLabelName()
        setupLabelUsername()
        //setupLabelPassword()
        setupLabelPhone()
        setupLabelAddress()
        setupButtonEdit()
        setupButtonLogOut()
        
        initConstraints()
        
    }
    
    func setupImageProfile(){
        imageProfile = UIImageView()
        imageProfile.translatesAutoresizingMaskIntoConstraints = false
        imageProfile.image = UIImage(named: "AppDefaultProfiePic")
        self.addSubview(imageProfile)
    }
    
    func setupLabelProfile()
    {
        labelProfile = UILabel()
        labelProfile.translatesAutoresizingMaskIntoConstraints = false
        labelProfile.text = "Profile"
        labelProfile.font = UIFont.systemFont(ofSize: 20)
        self.addSubview(labelProfile)
        
    }
    
    func setupLabelName()
    {
        labelName = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.text = "Name: "
        labelName.font = UIFont.systemFont(ofSize: 20)
        self.addSubview(labelName)
        
    }
    
    func setupLabelUsername()
    {
        labelUsername = UILabel()
        labelUsername.translatesAutoresizingMaskIntoConstraints = false
        labelUsername.text = "Username: "
        labelUsername.font = UIFont.systemFont(ofSize: 20)
        self.addSubview(labelUsername)

    }
    
    func setupLabelPhone()
    {
        labelPhone = UILabel()
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        labelPhone.text = "Phone: "
        labelPhone.font = UIFont.systemFont(ofSize: 20)
        self.addSubview(labelPhone)
    }
    
    func setupLabelAddress(){
        labelAddress = UILabel()
        labelAddress.text = "Address"
        labelAddress.font = UIFont.systemFont(ofSize: 20)
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        labelAddress.numberOfLines = 0
        labelAddress.lineBreakMode = .byWordWrapping
        self.addSubview(labelAddress)
    }
    
    func setupButtonEdit(){
        buttonEdit = UIButton()
        buttonEdit.setTitle("Edit", for: .normal)
        //set the button font to 20
        buttonEdit.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        buttonEdit.setTitleColor(.white, for: .normal)
        buttonEdit.backgroundColor = .black
        buttonEdit.layer.cornerRadius = 3
        // set the button height to 20
        buttonEdit.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonEdit.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonEdit)
    }
    
    func setupButtonLogOut() {
        buttonLogOut = UIButton()
        buttonLogOut.setTitle("Log Out", for: .normal)
        //set the button font to 20
        buttonLogOut.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        buttonLogOut.setTitleColor(.white, for: .normal)
        buttonLogOut.backgroundColor = .black
        buttonLogOut.layer.cornerRadius = 3
        // set the button height to 20
        buttonLogOut.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonLogOut.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLogOut)
    }
    
    
    //MARK: initializing the constraints.
    func initConstraints() {
        NSLayoutConstraint.activate([
            imageProfile.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageProfile.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageProfile.widthAnchor.constraint(equalToConstant: 200),
            imageProfile.heightAnchor.constraint(equalToConstant: 200),
            
            labelProfile.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 20),
            labelProfile.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            labelName.topAnchor.constraint(equalTo: labelProfile.bottomAnchor, constant: 20),
            labelName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            labelUsername.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 20),
            labelUsername.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                   
            labelPhone.topAnchor.constraint(equalTo: labelUsername.bottomAnchor, constant: 20),
            labelPhone.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            labelAddress.topAnchor.constraint(equalTo: labelPhone.bottomAnchor, constant: 20),
            labelAddress.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            buttonEdit.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 56),
            buttonEdit.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonEdit.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            buttonEdit.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -120),
            
            buttonLogOut.topAnchor.constraint(equalTo: buttonEdit.bottomAnchor, constant: 16),
            buttonLogOut.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonLogOut.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            buttonLogOut.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -120),
//            buttonEdit.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
