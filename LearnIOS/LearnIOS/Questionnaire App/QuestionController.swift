//
//  QuestionController.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/10/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

var questionList :  [Question] = [Question(questionString: "What is your favourite type of food?", answers: ["Fast Food","see Food","Pizza","surri Food"],selectedAnswerIndex:nil),Question(questionString: "What is your favourite country?", answers: ["Asia","Sharm el shehk","dahab"],selectedAnswerIndex:nil),Question(questionString: "What is your favourite player?", answers: ["Ahmed","Mohamed Salah","Ramadan sobhy"],selectedAnswerIndex:nil)]
class QuestionController: UITableViewController {

    let cellId = "QuestionCellId"
    let headerId = "HeaderId"
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.register(QuestionCell.self, forCellReuseIdentifier: cellId)
        tableView.register(QuestionHeaderCell.self, forHeaderFooterViewReuseIdentifier: headerId)
        tableView.sectionHeaderHeight = 50
        tableView.tableFooterView = UIView()
        if let index = self.navigationController?.viewControllers.lastIndex(of: self) {
            currentIndex = index
            navigationItem.title =   " \(currentIndex + 1) / \(questionList.count)"
        }
        setupNav()
    }
    func setupNav(){
        //For back button in navigation bar
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard questionList[currentIndex].answers != nil else {return 0}
        return (questionList[currentIndex].answers!.count)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! QuestionCell
        cell.nameLabel.text = questionList[currentIndex].answers?[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header =  tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as! QuestionHeaderCell
        header.nameLabel.text = questionList[currentIndex].questionString
        return header
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if currentIndex < questionList.count - 1 {
            let vc = QuestionController()
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            questionList[currentIndex].selectedAnswerIndex = indexPath.row
            let vc = ResultsVC(question: questionList[currentIndex])
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
