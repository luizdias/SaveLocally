//
//  TableViewController.swift
//  SaveLocally
//
//  Created by Luiz Dias on 30/04/19.
//  Copyright © 2019 Luiz Fernando Dias. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    fileprivate var comments = [String]()
    var commentsDataSource : [String?] = []{
        didSet{
            guard let newComment = commentsDataSource as? [String] else {
                return
            }
            comments.append(contentsOf: newComment)
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSavedData()
    }
    
    func loadSavedData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: EntityNames.comment)
        
        fetchRequest.fetchLimit = 1000
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "text", ascending: false)]
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                guard let savedComment = data as? Comment else { return }
                guard let commentText = savedComment.text else { return }
                comments.append(commentText)
            }
            
        } catch {
            print("Failed")
        }
        
    }


    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "simpleCell", for: indexPath)
        cell.textLabel?.text = comments[indexPath.row]

        return cell
    }

}
