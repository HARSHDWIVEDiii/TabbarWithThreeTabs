//
//  Cources.swift
//  TabbarWithThreeTabs
//
//  Created by Mac on 14/12/23.
//

import UIKit

class Cources: UIViewController {

    @IBOutlet weak var courcesCollectionView: UICollectionView!
    
    var courcesDetailViewController : CourcesDetailViewController?
    
    var courcesImageArray = [UIImage(named: "android"),
                        UIImage(named: "apple"),
                        UIImage(named: "c"),
                        UIImage(named: "cpp"),
                        UIImage(named: "java"),
                        UIImage(named: "python"),
                        UIImage(named: "web")]
    
    var courcesNamesArray = ["Android","Apple","C","Cpp","Java","Python", "Web"]
    
    var detailedInformationArray = ["Become a professional Android App Developer. This course will help you develop Android Programming skills, and start career in Android.As part of the course, you will learn Android architecture, user interfaces, activities, controls, layouts, services, content providers, multimedia APIs, maps, web serices and lot more. You’ll gain practical development experience by working on live project during the Android app development course. Learn Android today, and secure a great job and fast moving career!", "Learn iOS app development and start a great career in Mobile App Development. This iOS course will cover the iOS 10 platform using swift 3 programming language, including user interfaces, input restrictions, notifications, messaging, web services and core data. You will also be getting chance to work on live project and experience the complete iOS app development process till the deployment on Apple App Store.", "C Programming is the right course to start with if you are new to programming. This course will create a strong base to jump to Object Oriented technologies. Through this course, you will be learning Algorithms and it's implementation, you will also learn topics like Arrays, Structures, Pointers and many more in depth. You will writing a lot of assignments to build concrete programming skills.","The Cpp programming course will cover Object Oriented Principles in depth with real time implementation. The course will cover new features introduced in CPP like references, inline functions, const and many more. It will then take you through the details of Class, Constructor, Inheritance, Polymorphism, Templates, STL, Exception Handling and many more important concepts This course will lay string foundation of Object Oriented Programming and it's usage in real time systems.", "Java is one of the most popular programming language and preferred platform by a huge community of developers around the globe.This Core Java course will take you through OOPs concepts and it's implementation. The course will also cover topics like Multithreading, I/O, Generics, Collections, Networking, JDBC, RMI and many more. The well designed course contents and sessions conducted by experienced facutly will make sure that you are a prefessional Java Programmer at the end of the course." ,"Python is in demand, be it Web, AI or ML Python is the preferred programming language throughout the industry. This Python programming course will take you through all the details and aspects of Python. You will be learning Python from the industry experts having more than 12 years of experience in IT. BitCode will also provide you placement with our recruiters once the course is completed." , "Master web development with the Web Expert course, perfect for both freshers and professionals. Covering HTML, JavaScript, HTML5, CSS3, Bootstrap, JQuery, PHP/MySQL, Angular 7, and Node.js, this program offers in-depth learning and hands-on projects. With a 90% placement track record, BitCode is the leader in web development training in Pune. Elevate your skills and career with the best in the industry. Enroll now for a comprehensive web development experience."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCollectView()
        registerXIBWithCollectionView()
        
    }
    func initializeCollectView()
    {
        courcesCollectionView.dataSource = self
        courcesCollectionView.delegate = self
    
    }
    func registerXIBWithCollectionView()
    {
        let uiNib = UINib(nibName: "CourcesCollectionViewCell", bundle: nil)
        courcesCollectionView.register(uiNib, forCellWithReuseIdentifier: "CourcesCollectionViewCell")
    }
    
}


extension Cources : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        courcesDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "CourcesDetailViewController") as? CourcesDetailViewController
        
        courcesDetailViewController?.labelContainer = courcesNamesArray[indexPath.item]
        courcesDetailViewController?.textFieldContainer = detailedInformationArray[indexPath.row]
        
        navigationController?.pushViewController(courcesDetailViewController!, animated: true)
    }
    
}
extension Cources : UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        courcesImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let courcesCollectionViewCell = self.courcesCollectionView.dequeueReusableCell(withReuseIdentifier: "CourcesCollectionViewCell", for: indexPath) as! CourcesCollectionViewCell
        
        courcesCollectionViewCell.courcesImage.image = courcesImageArray[indexPath.row]
        courcesCollectionViewCell.courcesNameLabel.text = courcesNamesArray[indexPath.row]
        
        
        return courcesCollectionViewCell
    }
    
   
    
    
}
extension Cources : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowlayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let spaceBetweenCells : CGFloat = (flowlayout.minimumInteritemSpacing ?? 0.0 ) + (flowlayout.sectionInset.left ?? 0.0) + (flowlayout.sectionInset.right ?? 0.0)
        
        let size = (self.courcesCollectionView.frame.width - spaceBetweenCells) / 2.0
        
        
        return CGSize(width : size , height : size)
    }
    
    
}


