//
//  SectionView.swift
//  Quiet
//
//  Created by Milena Lima de Alcântara on 24/02/23.
//

import UIKit

class SectionView: UIView {

    public var title: String
    public var bodyText: String
//    public var isNeedTable: Bool
    
    private lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.textColor = .label
        return label
    }()
    
    lazy var card: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "F2F0F1") // .systemGray6
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 12
        view.accessibilityScroll(.up)
        return view
    }()
    
    lazy var bodyTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = bodyText
        label.numberOfLines = 0
        label.textColor = .label
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
//    lazy var tableView: UITableView = {
//        let tableView = UITableView(frame: .zero, style: .plain)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.isHidden = !isNeedTable
//        return tableView
//    }()
    
    required init(title: String, bodyText: String) { // isNeedTable: Bool = false
        self.title = title
        self.bodyText = bodyText
//        self.isNeedTable = isNeedTable
        super.init(frame: CGRect.zero)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(card)
        card.addSubview(bodyTextLabel)
//        card.addSubview(tableView)
        configureConstraints()
//        presentTableIfNeed()
    }
    
//    func presentTableIfNeed() {
//        if isNeedTable {
//            card.addSubview(tableView)
//
//            NSLayoutConstraint.activate([
//                tableView.centerXAnchor.constraint(equalTo: card.centerXAnchor),
//                tableView.centerYAnchor.constraint(equalTo: card.centerYAnchor),
//                tableView.widthAnchor.constraint(equalTo: card.widthAnchor, multiplier: 0.9),
//                tableView.topAnchor.constraint(equalTo: bodyTextLabel.bottomAnchor, constant: 5)
//            ])
//        }
//    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            card.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            card.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            card.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            bodyTextLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            bodyTextLabel.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            bodyTextLabel.widthAnchor.constraint(equalTo: card.widthAnchor, multiplier: 0.9),
            //            bodyTextLabel.heightAnchor.constraint(equalTo: card.heightAnchor, multiplier: 0.9)
            
//            tableView.centerXAnchor.constraint(equalTo: card.centerXAnchor),
//            tableView.centerYAnchor.constraint(equalTo: card.centerYAnchor),
//            tableView.widthAnchor.constraint(equalTo: card.widthAnchor, multiplier: 0.9),
//            tableView.topAnchor.constraint(equalTo: bodyTextLabel.bottomAnchor, constant: 5)
        ])
    }
}


/*
 
 
//        view.accessibilityScroll(.down)
//        view.contentCompressionResistancePriority(for: .vertical)
//        view.setContentCompressionResistancePriority(.fittingSizeLevel, for: .vertical)
 
 //    lazy var subcard: UIView = {
 //        let view = UIView()
 //        view.translatesAutoresizingMaskIntoConstraints = false
 //        view.backgroundColor = .clear
 //        view.layer.borderColor = UIColor.systemGray.cgColor
 //        view.layer.borderWidth = 1
 //        view.layer.cornerRadius = 8
 //        view.accessibilityScroll(.down)
 //        return view
 //    }()
 
 
//        addSubview(titleLabel)
//        addSubview(card)
//        card.addSubview(bodyTextLabel)
//        self.addSubview(subcard)
 
 
 
//            subcard.leadingAnchor.constraint(equalTo: self.card.leadingAnchor, constant: 5),
//            subcard.trailingAnchor.constraint(equalTo: self.card.trailingAnchor, constant: -5),
//            subcard.topAnchor.constraint(equalTo: self.card.topAnchor, constant: 5),
//            subcard.bottomAnchor.constraint(equalTo: self.card.bottomAnchor, constant: -5),
 */
