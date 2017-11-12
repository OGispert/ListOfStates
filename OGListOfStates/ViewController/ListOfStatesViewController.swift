//
//  ListOfStatesViewController.swift
//  OGListOfStates
//
//  Created by Othmar Gispert on 11/8/17.
//  Copyright © 2017 Othmar Gispert. All rights reserved.
//

import UIKit
import OGCustomCell

class ListOfStatesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var listOfStatesTableView: UITableView!
    
    lazy var worker = ListOfStatesWorker()
    var model = StateItemsModel(JSON: Dictionary())!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        listOfStatesTableView.delegate = self
        listOfStatesTableView.dataSource = self
        
        let bundle = Bundle(for: OGTableViewCell.self)
        listOfStatesTableView.register(UINib.init(nibName: LIST_OF_STATES_CELL_NAME, bundle: bundle), forCellReuseIdentifier: LIST_OF_STATES_CELL_ID)
        
        worker.downloadListOfStates(with: model)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.title = NSLocalizedString("View_Title", comment: "Title")
    }
    
    //MARK: TableView delegate methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = listOfStatesTableView.dequeueReusableCell(withIdentifier: LIST_OF_STATES_CELL_ID) as? OGTableViewCell
        {
            cell.state.text = model.stateNames[indexPath.row]
            cell.abbreviation.text = model.stateAbbrs[indexPath.row]
            cell.country.text = model.stateCountries[indexPath.row]
            cell.city.text = model.stateCities[indexPath.row]
            cell.capital.text = model.stateCapitals[indexPath.row]
            cell.area.text =  model.stateAreas[indexPath.row]
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return model.stateNames.count
    }
}
