//
//  TableViewController.swift
//  SaveLocally
//
//  Created by f6476359 on 30/04/19.
//  Copyright © 2019 Luiz Fernando Dias. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    fileprivate var comments = [String]()
    var commentsDataSource : [String?] = []{
        didSet{
            guard let newComment = commentsDataSource as? [String] else {
                return
            }
            comments = newComment
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
