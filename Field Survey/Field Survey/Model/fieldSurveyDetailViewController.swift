//
//  fieldSurveyDetailViewController.swift
//  Field Survey
//
//  Created by Clayton Cornett on 7/20/17.
//  Copyright © 2017 Clayton Cornett. All rights reserved.
//

import UIKit

class fieldSurveyDetailViewController: UIViewController {
    
    
    var fieldSurveyEvent: FieldSurveyEvent?
    
    var dateFormatter = DateFormatter()
    
    
    
    @IBOutlet weak var observationIconImageView: UIImageView!

    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var animalNameLabel: UILabel!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium

        self.title = "Observation"
        observationIconImageView.image = fieldSurveyEvent?.classification.image
        animalNameLabel.text = fieldSurveyEvent?.title

        if let date = fieldSurveyEvent?.date{
            dateLabel.text = dateFormatter.string(from: date)
        }
        else{
            dateLabel.text = ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
