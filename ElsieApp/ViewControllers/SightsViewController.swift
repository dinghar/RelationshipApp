//
//  SightsViewController.swift
//  ElsieApp
//
//  Created by Ross Harding on 8/17/19.
//  Copyright © 2019 Harding LLC. All rights reserved.
//

import UIKit

class SightsViewController: ParentViewController {

    @IBOutlet var tableView: UITableView!
    
    var photoUrls = [String]()
    var photos: [String: UIImage?] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTable()
        fetchData()
    }
    
    func configureTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: photoTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: photoTableViewCellIdentifier)
    }
    
    func fetchData() {
        DatabaseDataLayer().loadImageUrls { (urls) in
            for url in urls {
                if let u = url {
                    self.photoUrls.append(u)
                }
            }
            for url in urls {
                ImageDataLayer().loadImage(from: url ?? "") { (img) in
                    self.photos[url ?? ""] = img
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension SightsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoUrls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: photoTableViewCellIdentifier, for: indexPath) as? PhotoTableViewCell else {
            return UITableViewCell()
        }
        let photoUrl = photoUrls[indexPath.row]
        let image: UIImage? = photos[photoUrl] ?? UIImage()
        cell.configureData(for: image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let photoUrl = photoUrls[indexPath.row]
        let currentImage = photos[photoUrl] ?? UIImage()
        let imageRatio = currentImage?.getImageRatio() ?? 1
        var height = tableView.frame.width / imageRatio
        if height < 1 {
            height = 1
        }
        return height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return generateHeaderView("Sights")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
}
