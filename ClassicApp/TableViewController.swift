//
//  TableViewController.swift
//  ClassicApp
//
//  Created by Leo Dion on 2/8/22.
//

import UIKit

class TableViewController: UITableViewController {
  let repository : Repository = RepositoryImpl()
  var members : [Member]?
  var error : Error?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let nib = UINib(nibName: "TableViewCell", bundle: nil)
    self.tableView.register(nib, forCellReuseIdentifier: "reuseIdentifier")
    
    repository.getMembers { [weak self] result in
      switch result {
      case let .success(members):
        self?.members = members
      case let .failure(error):
        self?.error = error
      }
      self?.tableView.reloadData()
    }
  }
  
  // MARK: - Table view data source
  
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return self.members?.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let genericCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
    
    guard let cell = genericCell as? TableViewCell else {
      return genericCell
    }
    
    if let member = self.members?[indexPath.row] {
      cell.nameLabel.text = member.firstName
      cell.nameLabel.textColor = member.uiColor
    }
    
    return cell
  }
  
}
