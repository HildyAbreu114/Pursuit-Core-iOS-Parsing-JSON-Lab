//
//  ColorsViewController.swift
//  JSONLAB
//
//  Created by hildy abreu on 8/28/19.
//  Copyright © 2019 hildy abreu. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {
    
    var colorInfo = [ColorInfo](){
    didSet{
        colorsTableView.reloadData()
    }
}
    @IBOutlet weak var colorsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        colorsTableView.dataSource = self
        loadData()

        // Do any additional setup after loading the view.
    }

    private func loadData(){
        guard let pathAToJSONfFile = Bundle.main.path(forResource: "color", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: pathAToJSONfFile)
        do {
            let data = try Data (contentsOf: url)
            colorInfo = try ColorData.getColors(data: data)
        }
        catch {
            print (error)
        }
}


}
extension ColorsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = colorsTableView.dequeueReusableCell(withIdentifier: "colorsCell", for: indexPath)
        var perColorInfo = colorInfo[indexPath.row]
        cell.textLabel?.text = perColorInfo.name.value
//        cell.backgroundColor = perColorInfo.displayColors()
        cell.detailTextLabel?.text = "\(perColorInfo.hex.value)\(perColorInfo.hex.clean)"
        return cell
        
    }
    
    
}
extension ColorsViewController: UITabBarDelegate{
    
}
