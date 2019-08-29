//
//  RandomUserViewController.swift
//  JSONLAB
//
//  Created by hildy abreu on 8/28/19.
//  Copyright © 2019 hildy abreu. All rights reserved.
//

import UIKit

class RandomUserViewController: UIViewController {
    
    var peopleInfo = [PeopleInfo](){
        didSet{
            randomUserTableView.reloadData()
        }
    }

    @IBOutlet weak var randomUserTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        randomUserTableView.dataSource = self
        loadData()

        // Do any additional setup after loading the view.
    }
    

    private func loadData(){
        guard let pathToJSONfile = Bundle.main.path(forResource: "randomusers", ofType: "json") else{
            return
        }
    let url = URL(fileURLWithPath: pathToJSONfile)
        do {
            let data = try Data (contentsOf: url)
            peopleInfo = try RandomUserData.getRandomUsers(data: data)
        }
            catch {
                print (error)
                
            }
        
        
        
        }


    
    
    
}
extension RandomUserViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = randomUserTableView.dequeueReusableCell(withIdentifier: "randomUserCell", for: indexPath)
        var personInfo = peopleInfo[indexPath.row]
        cell.textLabel?.text = "\(personInfo.name.first) \(personInfo.name.last)"
        cell.detailTextLabel?.text = personInfo.email
        return cell
    }
    
    
}
extension RandomUserViewController: UITableViewDelegate{
    
}
