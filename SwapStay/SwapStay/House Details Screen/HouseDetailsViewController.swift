//
//  HouseDetailViewController.swift
//  SwapStay
//
//  Created by 李凱鈞 on 12/4/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class HouseDetailsViewController: UIViewController {
    
    let houseDetailScreen = HouseDetailsView()

    var post: House?
    let db                 = Firestore.firestore()      // Get database reference
    
    
    override func loadView() {
        view = houseDetailScreen
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = .black
        
        if let post = post {
            updateView(with: post)
            configureButton(for: post)
        }

    }
    
    func updateView(with post: House) {
        houseDetailScreen.labelOwner.text = "\(post.ownerName)'s Place"

        if let imageUrl = URL(string: post.housePhoto), let imageData = try? Data(contentsOf: imageUrl) {
            houseDetailScreen.imageHouse.image = UIImage(data: imageData)
        } else {
            // Handle error or set a default image
            houseDetailScreen.imageHouse.image = UIImage(systemName: "house")
        }

        houseDetailScreen.labelPost.text = post.description
    }
    
    func configureButton(for post: House) {
        // Check if the current user is the post owner
        if let currentUserEmail = Auth.auth().currentUser?.email, currentUserEmail == post.ownerEmail {
            // Current user is the post owner, configure as Delete Post button
            houseDetailScreen.buttonBook.setTitle("Delete Post", for: .normal)
            houseDetailScreen.buttonBook.removeTarget(nil, action: nil, for: .allEvents)
            houseDetailScreen.buttonBook.addTarget(self, action: #selector(deletePost), for: .touchUpInside)
        } else {
            // Current user is not the post owner, configure as Book Chat button
            houseDetailScreen.buttonBook.setTitle("Book Chat", for: .normal)
            houseDetailScreen.buttonBook.removeTarget(nil, action: nil, for: .allEvents)
            houseDetailScreen.buttonBook.addTarget(self, action: #selector(bookRoomTapped), for: .touchUpInside)
        }
    }
    
    // MARK: if the poster is the same as current user, button to book is change to option to delete
    @objc func deletePost() {
        guard let user = Auth.auth().currentUser, let userEmail = user.email, let postId = post?.postId else {
            print("Current user or post ID not available")
            return
        }

        // Delete from user's personal post collection
        db.collection("users").document(userEmail).collection("posts").document(postId).delete { error in
            if let error = error {
                print("Error deleting post from user's collection: \(error)")
            } else {
                print("Post deleted from user's collection successfully.")
            }
        }

        // Delete from global posts collection
        db.collection("posts").document(postId).delete { error in
            if let error = error {
                print("Error deleting post from global collection: \(error)")
            } else {
                print("Post deleted from global collection successfully.")
                // Pop back to the previous view controller after successful deletion
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    // MARK: Else choose book room button to chat with poster
    @objc func bookRoomTapped() {
        guard let post = self.post else { return }

        // Assuming 'post' is an instance of 'House' with all required data
        let chat = Chat(name: post.ownerName, email: post.ownerEmail, address: "Some address", date: Date())
        let messagesVC = MessagesViewController()
        messagesVC.receiver = chat

        self.navigationController?.pushViewController(messagesVC, animated: true)
    }


}
