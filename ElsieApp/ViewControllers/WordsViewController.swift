//
//  WordsViewController.swift
//  ElsieApp
//
//  Created by Ross Harding on 8/17/19.
//  Copyright © 2019 Harding LLC. All rights reserved.
//

import UIKit

class WordsViewController: ParentViewController {

    @IBOutlet var tableView: UITableView!
    
    var quotes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTable()
        fetchData()
    }
    
    func configureTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: quoteTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: quoteTableViewCellIdentifier)
    }
    
    func fetchData() {
        DatabaseDataLayer().loadQuotes { (loadedQuotes) in
            self.quotes = loadedQuotes
            self.tableView.reloadData()
        }
    }

}

extension WordsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: quoteTableViewCellIdentifier, for: indexPath) as? QuoteTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: quotes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return generateHeaderView("Words")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
}
