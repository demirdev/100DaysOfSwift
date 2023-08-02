//
//  ViewController.swift
//  Project 5 - Word Scramble
//
//  Created by Mehmet Demir on 2.08.2023.
//

import UIKit

class ViewController: UITableViewController {
    var allWords = [String]()
    var usedWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadWords()
        startGame()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
    }
    
   @objc func promptForAnswer() {
       let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
       ac.addTextField()
       
       let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] _ in
           guard let answer = ac?.textFields?[0].text else { return }
           self?.submit(answer)
       }
       
       ac.addAction(submitAction)
       present(ac, animated: true)
    }

    func submit(_ answer: String) {
        print(answer)
        
        if(allWords.contains(answer)){
            usedWords.append(answer)
            
            tableView.reloadData()
        }
        
    }
    
    func loadWords() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
    }
    
    func startGame() {
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }


}

