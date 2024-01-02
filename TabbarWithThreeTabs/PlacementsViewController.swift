//
//  ViewController.swift
//  TabbarWithThreeTabs
//
//  Created by Mac on 14/12/23.
//

import UIKit

class PlacementsViewController: UIViewController {
    
    @IBOutlet weak var placementsTableView: UITableView!
    
    var placementImageArray = [UIImage(named: "student"),
                               UIImage(named: "student"),
                               UIImage(named: "student"),
                               UIImage(named: "student"),
                               UIImage(named: "student"),
                               UIImage(named: "student"),
                               UIImage(named: "student"),
                               UIImage(named: "student"),
                               UIImage(named: "student"),
                               UIImage(named: "student"),
                               UIImage(named: "student")]
    
    var placedStudentNameArray = ["StudentName : Gajanan" , "StudentName : Harsh" , "StudentName : Ashitosh" , "StudentName : Shailesh" , "StudentName : Rutik" , "StudentName : Komal" ,"StudentName : Smita", "StudentName : Aditya" , "StudentName : Chandrika" , "StudentName : Devshri"]
    
    var placedCompanyNameArray = ["PlacedAt : Google" , "PlacedAt : SpeceX" , "PlacedAt : Apple" , "PlacedAt : Aurus" , "PlacedAt : Microsof" , "PlacedAt : Bitcode" , "PlacedAt : OnePlus" , "PlacedAt : Dell" , "PlacedAt : Asus" , "PlacedAt : HP" ]
    
    var placementsViewController : PlacementsViewController?
    var placementsTableViewCell : PlacementsTableViewCell?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTableView()
        registerXIBWithTableView()
    }
    func initializeTableView()
    {
        placementsTableView.dataSource = self
        placementsTableView.delegate = self
    }
    func registerXIBWithTableView()
    {
        let uinib = UINib(nibName: "PlacementsTableViewCell", bundle: nil)
        placementsTableView.register(uinib, forCellReuseIdentifier: "PlacementsTableViewCell")
    }
    


}
extension PlacementsViewController : UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        110.5
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            placementsTableView.beginUpdates()
            placementsTableView.deleteRows(at: [indexPath], with: .fade)
            placementImageArray.remove(at: indexPath.row)
            placedStudentNameArray.remove(at: indexPath.row)
            placedCompanyNameArray.remove(at: indexPath.row)
            placementsTableView.endUpdates()
        }
            
    }
}
extension PlacementsViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        placedStudentNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        placementsTableViewCell = (self.placementsTableView.dequeueReusableCell(withIdentifier: "PlacementsTableViewCell", for: indexPath) as! PlacementsTableViewCell)
        
        placementsTableViewCell?.studentImageLabel.image = placementImageArray[indexPath.row]
        placementsTableViewCell?.studentNameLabel.text = placedStudentNameArray[indexPath.row]
        placementsTableViewCell?.placedCompanyNameLabel.text = placedCompanyNameArray[indexPath.row]
       
        return placementsTableViewCell!
    }
    
    

}


