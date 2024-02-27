//
//  NotificationViewController.swift
//  4monthTestPractic
//
//  Created by Apple on 26.2.2024.
//


import UIKit

class NotificationViewController: UIViewController  {
    
    var contacts: [Contact] = []
    private let cellID = "cell"
    
    private let tableView: UITableView = {
        let tView = UITableView()
        tView.translatesAutoresizingMaskIntoConstraints = false
        return tView
    }()
    
    private let stacViewVer: UIStackView = {
        let stac = UIStackView()
        stac.axis = .vertical
        stac.spacing = 1
        stac.alignment = .center
        stac.translatesAutoresizingMaskIntoConstraints = false
        return stac
    }()
    private let secondStacViewVer: UIStackView = {
        let stac = UIStackView()
        stac.axis = .vertical
        stac.spacing = 1
        stac.alignment = .center
        stac.translatesAutoresizingMaskIntoConstraints = false
        return stac
    }()
    
    
    
    private let natificationLbl = MakerView().makerLabel(text: "Notification", size: 24, weight: .bold)
    
    
    private let ganeralBtn = MakerView().makeButton(title: "General", fontBtn: UIFont.boldSystemFont(ofSize: 16), colorBt: UIColor(hex: "#F5484A"), target: self, action: #selector(ganeralBtnTapped))
    
    
    
    private let yellow = MakerView().makerLabel(text: "____________________",size: 14, textColor: UIColor(hex: "#F5484A") )
    
                                                    
    private let systemBtn = MakerView().makeButton(title: "System", fontBtn: UIFont.boldSystemFont(ofSize: 16),colorBt: UIColor(hex: "#9E9E9E"), target: self, action: #selector(systemBtnTapped))
                                                    
                                                    
    private let gray = MakerView().makerLabel(text: "______________________",size: 14, textColor: UIColor(hex: "#9E9E9E"))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupUI()
        setupTableView()
        setupData()
        
        
        let backButtonImage = UIImage(systemName: "chevron.left")
                let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonTapped))
                navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                navigationItem.leftBarButtonItem = backButton

         
        
        let rightBarBtn = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(itemBtnTapped))
        navigationItem.rightBarButtonItem = rightBarBtn
        self.navigationController?.navigationBar.tintColor = UIColor.black
        
    }
    @objc func itemBtnTapped() {
        print("Работает")
    }
    @objc func ganeralBtnTapped(_ sender: UIButton){
        
    }
    @objc func systemBtnTapped(_ sender: UIButton){
        
    }
    
    
    private func setupUI(){
        
        view.addSubview(natificationLbl)
        NSLayoutConstraint.activate([
            natificationLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            natificationLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
        ])
        
        view.addSubview(stacViewVer)
        view.addSubview(secondStacViewVer)
        stacViewVer.addArrangedSubview(ganeralBtn)
        stacViewVer.addArrangedSubview(yellow)
        secondStacViewVer.addArrangedSubview(systemBtn)
        secondStacViewVer.addArrangedSubview(gray)
    
        NSLayoutConstraint.activate([
            stacViewVer.topAnchor.constraint(equalTo: natificationLbl.bottomAnchor, constant: 20),
            stacViewVer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stacViewVer.heightAnchor.constraint(equalToConstant: 35),
            stacViewVer.widthAnchor.constraint(equalToConstant: 182)
        ])
        
        NSLayoutConstraint.activate([
            secondStacViewVer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 11),
            secondStacViewVer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            secondStacViewVer.heightAnchor.constraint(equalToConstant: 35),
            secondStacViewVer.widthAnchor.constraint(equalToConstant: 182)
        ])
    }
    private func setupTableView(){
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo:stacViewVer.bottomAnchor , constant: 24),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor , constant: -20),
        ])
        tableView.register(CostumTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
       
    }
    
    private func setupData(){
        contacts = [
            Contact(image: "Image",
                    text: "Jane Cooper has published a new recipe!",
                    secondText: "Today | 9:24 AM",
                    secondImage: "Image7",
                    image3: "Image14"),
            
            Contact(image: "Image1", 
                    text: "Rochel has commented on your recipe!",
                    secondText: "1 day ago | 14:43 PM ",
                    secondImage: "Image8",
                    image3: "Image14"),
            Contact(image: "Image2",
                    text: "Brad Wiginington liked your comment!",
                    secondText: "1 day ago | 10:30 AM",
                    secondImage: "Image9",
                    image3: "Image14"),
            Contact(image: "Image3",
                    text: "Tyra Ballentine has published a new recipe!",
                    secondText: "2 days ago | 10:29 AM",
                    secondImage: "Image10",
                    image3: "Image14"),
            Contact(image: "Image4",
                    text: "Marci Winkles has published a new recipe!",
                    secondText: "3 days ago | 16:34 PM",
                    secondImage: "Image11",
                    image3: "Image14"),
            Contact(image: "Image5",
                    text: "Ailen has commented on ypur recipe!",
                    secondText: "4 day ago | 20:23 PM",
                    secondImage: "Image12",
                    image3: "Image14"),
            Contact(image: "Image6", 
                    text: "George has commented on your recipe!",
                    secondText: "5 day ago | 09:20 AM",
                    secondImage: "Image13",
                    image3: "Image14")
        ]
        tableView.reloadData()
    }
    
    @objc func backButtonTapped() {
           for controller in navigationController?.viewControllers ?? [] {
               if let SignInViewController = controller as? SignInViewController {
                   navigationController?.popToViewController(SignInViewController, animated: true)
                   break
               }
           }
       }
    
}
extension NotificationViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < contacts.count else {
            return UITableViewCell()
        }
        let contact = contacts[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CostumTableViewCell
        
        cell.configure(with: contact)
        return cell

    }


}
