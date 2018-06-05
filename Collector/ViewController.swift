//
//  ViewController.swift
//  Collector
//
//  Created by De Winter Laura on 4/06/18.
//  Copyright © 2018 Comflow. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var facturen : [Factuur] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
        facturen = try context.fetch(Factuur.fetchRequest())
            tableView.reloadData()
        } catch {
            
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return facturen.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let factuur = facturen[indexPath.row]
        cell.textLabel?.text = factuur.titel
        cell.imageView?.image = UIImage(data: factuur.image as! Data)
        return cell
    }
    


}

