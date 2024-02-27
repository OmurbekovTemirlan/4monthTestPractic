//
//  CustomTableViewCell.swift
//  4monthTestPractic
//
//  Created by Apple on 27.2.2024.
//

import UIKit

class CostumTableViewCell: UITableViewCell {
    
    private let cellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.font = .systemFont(ofSize: 16, weight: .medium)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let timeLbl: UILabel = {
        let lbl = UILabel()
        lbl.tintColor = .gray
        lbl.font = .systemFont(ofSize: 14, weight: .light)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let contacAva: UIImageView = {
        let ava = UIImageView()
        ava.layer.cornerRadius = 35
        ava.translatesAutoresizingMaskIntoConstraints = false
        return ava
    }()
    
    let secondContacImage: UIImageView = {
        let ava = UIImageView()
        ava.translatesAutoresizingMaskIntoConstraints = false
        return ava
    }()
    
    let Image3: UIImageView = {
        let ava = UIImageView()
        ava.translatesAutoresizingMaskIntoConstraints = false
        return ava
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellView)
        contentView.addSubview(nameLbl)
        contentView.addSubview(timeLbl)
        contentView.addSubview(contacAva)
        contentView.addSubview(secondContacImage)
        contentView.addSubview(Image3)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            cellView.heightAnchor.constraint(equalToConstant: 84),
            
            nameLbl.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 8),
            nameLbl.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 60),
            nameLbl.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -75),
      
            timeLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 4),
            timeLbl.leadingAnchor.constraint(equalTo: contacAva.trailingAnchor, constant: 8),
            
            contacAva.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 8),
            contacAva.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 3),
            contacAva.heightAnchor.constraint(equalToConstant: 48),
            contacAva.widthAnchor.constraint(equalToConstant: 48),
            
            secondContacImage.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 8),
            secondContacImage.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -15),
            secondContacImage.heightAnchor.constraint(equalToConstant: 60),
            secondContacImage.widthAnchor.constraint(equalToConstant: 60),
            
            Image3.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 27),
            Image3.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: 5),
            Image3.heightAnchor.constraint(equalToConstant: 15),
            Image3.widthAnchor.constraint(equalToConstant: 5),
        ])
     
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with contact: Contact) {
        nameLbl.text = contact.text
        timeLbl.text = contact.secondText
        contacAva.image = UIImage(named: contact.image)
        secondContacImage.image = UIImage(named: contact.secondImage)
        Image3.image = UIImage(named: contact.image3)
    }
    
}
