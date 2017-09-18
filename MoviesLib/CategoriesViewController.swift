//
//  CategoriesViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 13/09/17.
//  Copyright © 2017 EricBrito. All rights reserved.
//

import UIKit
import CoreData

enum CategoryAlertType{
    case add,edit
}

class CategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSource: [Category] = []
    var movie: Movie!
    
    @IBAction func add(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func close(_ sender: UIBarButtonItem) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadCategories()
    }
    
    func loadCategories(){
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name",ascending:true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do{
            dataSource = try context.fetch(fetchRequest)
            tableView.reloadData()
        }catch{
            print(error.localizedDescription)
        }
        
    }
}
extension CategoriesViewController : UITableViewDelegate{
    
}

extension CategoriesViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell",for : indexPath)
        
        let category = dataSource[indexPath.row]
        
        cell.textLabel?.text = category.name
        
        return cell
    }
    
}
