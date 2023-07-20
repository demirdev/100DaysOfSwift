//
//  DetailViewController.swift
//  Day-23-Milenostone-Project1-2-3
//
//  Created by Mehmet Demir on 20.07.2023.
//

import UIKit

class DetailViewController: UIViewController {
    var fileName: String!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.image = UIImage(named: fileName)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))
        
    }
    
    @objc func share() {
        let vc = UIActivityViewController(activityItems: [imageView.image?.jpegData(compressionQuality: 0.8)], applicationActivities: [])
        
        present(vc, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
