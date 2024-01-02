//
//  CourcesDetailViewController.swift
//  TabbarWithThreeTabs
//
//  Created by Mac on 14/12/23.
//

import UIKit

class CourcesDetailViewController: UIViewController {

    @IBOutlet weak var courceNameLabel: UILabel!
    
    @IBOutlet weak var courceDetailsTextView: UITextView!
    
    var labelContainer : String?
    var textFieldContainer : String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.courceNameLabel.text = labelContainer!
        self.courceDetailsTextView.text = textFieldContainer!
        
    }
    


}
