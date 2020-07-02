//
//  ViewController.swift
//  SwiftUIKitNavigation
//
//  Created by Johansson, Thomas on 2020-07-02.
//  Copyright © 2020 Johansson, Thomas. All rights reserved.
//

import UIKit

protocol PersonsDelegate {
    func open(person: Person)
    func persons() -> [Person]
}

class PersonsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellid = "cellid"
    var delegate: PersonsDelegate!
    var tableView: UITableView!
    var persons: [Person]?
    
    init(delegate: PersonsDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        self.persons = delegate.persons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
        cell.textLabel?.text = persons![indexPath.row].name
        return cell
    }

    override func viewDidLoad() {
        tableView = UITableView()
        self.view.addSubview(tableView)
        tableView.fillSuperview()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellid)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = persons![indexPath.row]
        delegate.open(person: person)
    }
}
