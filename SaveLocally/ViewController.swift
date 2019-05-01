//
//  ViewController.swift
//  SaveLocally
//
//  Created by f6476359 on 30/04/19.
//  Copyright © 2019 Luiz Fernando Dias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var commentTextView: UITextView!
    fileprivate var newComments = [String]()
    
    @IBAction func postComment(_ sender: UIButton) {
        if (commentTextView.text != nil && commentTextView.text != "") {
            saveComment()
            updateTableView()
            resetTextView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    fileprivate func saveComment() {
        //save to coredata here
    }
    
    fileprivate func updateTableView() {
        guard let newText = commentTextView.text else {
            return
        }
        newComments.append(newText)
        
        guard let commentsTableView = self.children[0] as? TableViewController else {
            return
        }
        commentsTableView.commentsDataSource = newComments
    }
    
    func resetTextView() {
        commentTextView.text = nil
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        if (size.width != self.view.frame.size.width) {
            DispatchQueue.main.async {
                self.commentTextView.setNeedsDisplay()
            }
        }
    }
    
}

