//
//  ViewController.swift
//  SaveLocally
//
//  Created by Luiz Dias on 30/04/19.
//  Copyright © 2019 Luiz Fernando Dias. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var commentTextView: UITextView!
    fileprivate var newComments = [String]()
    
    @IBAction func postComment(_ sender: UIButton) {
        if (commentTextView.text != nil && commentTextView.text != "") {
            saveComment(commentTextView.text)
            updateTableView()
            resetTextView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    fileprivate func saveComment(_ comment: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let commenttEntity = NSEntityDescription.entity(forEntityName: EntityNames.comment, in: managedContext)!
        let aComment = NSManagedObject(entity: commenttEntity, insertInto: managedContext)
        aComment.setValue(comment, forKey: CommentKeys.textKey)

        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
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
        newComments = [String]()
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

