//
//  ViewController.swift
//  tableview
//
//  Created by Jyo Mithun on 20/10/2017.
//  Copyright © 2017 Jyo Mithun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView : UITableView = {
      let tv = UITableView()
        tv.separatorStyle = .none
        tv.allowsSelection = false
        return tv
    }()
    let bandCellId = "bandCellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupNavigationBar()
        setupTableView()
       
    }

    func setupNavigationBar(){
        navigationItem.title = "ChartFive"
        navigationController?.navigationBar.barTintColor = UIColor(r: 0, g: 255, b: 198)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.darkGray, NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20)]
    }
func setupTableView()
{
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(BandCell.self, forCellReuseIdentifier: bandCellId)
    tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bandCellId", for: indexPath)as! BandCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1{
            return "topSongs"
            }
        return "topBands"
        
    }
}
class BandCell: UITableViewCell {
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setCellShadow()
        return view
    }()
    let pictureImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .red
        return iv
        
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = UIColor.darkGray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    func setUp(){
        addSubview(cellView)
        backgroundColor = UIColor(r: 245, g: 245, b: 245)
        cellView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 4, paddingRight: 8)
        cellView.addSubview(pictureImageView)
        pictureImageView.anchor(top: nil, left: cellView.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width : 40, height : 40)
        pictureImageView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        cellView.addSubview(titleLabel)
        titleLabel.anchor(top: nil, left: pictureImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width : 0, height: 40)
        titleLabel.centerYAnchor.constraint(equalTo: pictureImageView.centerYAnchor).isActive = true
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
