//
//  ViewController.swift
//  Day-23-Milenostone-Project1-2-3
//
//  Created by Mehmet Demir on 20.07.2023.
//

import UIKit

class ViewController: UITableViewController {
    var images = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadImages()
    }
    
    func loadImages() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try!  fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("unnamed") {
                images.append(item)
            }
        }
        
        print(images)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = images[indexPath.row]
        
        cell.imageView?.image = UIImage(named: images[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            print("Not found DetailVC")
            return
        }
        
        detailVC.fileName = images[indexPath.row]
        
//        present(detailVC, animated: true)
        navigationController?.pushViewController(detailVC, animated: true)
        
        
    }


}

