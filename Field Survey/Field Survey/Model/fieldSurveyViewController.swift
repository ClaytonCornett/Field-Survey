//
//  fieldSurveyViewController.swift
//  Field Survey
//
//  Created by Clayton Cornett on 7/20/17.
//  Copyright © 2017 Clayton Cornett. All rights reserved.
//

import UIKit

class fieldSurveyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var fieldSurveyTableView: UITableView!
    let fieldSurveyEvents = FieldSurveyEventJSONLoader.load(fileName: "field_observations")
    
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        self.title = "Field Survey"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldSurveyEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fieldSurveyCell", for: indexPath)
        
        if let cell = cell as? FieldSurveyTableViewCell{
            
            let fieldSurveyEvent = fieldSurveyEvents[indexPath.row]
            cell.observationIconImageView.image = fieldSurveyEvent.classification.image
            cell.titleLabel.text = fieldSurveyEvent.title
            cell.dateLabel.text = dateFormatter.string(from: fieldSurveyEvent.date)
   
        }
        
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? fieldSurveyDetailViewController,
            let row = fieldSurveyTableView.indexPathForSelectedRow?.row {
            
            
            
            destination.fieldSurveyEvent = fieldSurveyEvents[row]
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
