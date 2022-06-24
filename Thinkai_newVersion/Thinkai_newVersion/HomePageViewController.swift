//
//  HomePageViewController.swift
//  Thinkai_newVersion
//
//  Created by Angi on 6/21/22.
//

import UIKit
//import SwiftUI

class HomePageViewController: UIViewController//, UITableViewDelegate, UITableViewDataSource {
{
    @IBOutlet weak var userFullNameLabel: UILabel!
    
    //var gameModels = [Question]()  // an array of questions
    
    //var currentQuestion: Question?
    
    //@IBOutlet var label: UILabel!
    //@IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //setupQuestions()
    }
    
    //override func viewDidLayoutSubviews(){
        //super.viewDidLayoutSubviews()
        //configureUI(question: gameModels.first!)
    //}
    
    //private func configureUI(question: Question){   //function called when user presses an answer
        //label.text = question.text
        //currentQuestion = question
        //table.delegate = self
        //table.dataSource = self
    //}
    
    //private func checkAnswer(answer: Answer, question: Question ) -> Bool{
     //   return question.answer.contains(where: {$0.text == answer.text}) && answer.correct
    //}
    
    //private func setupQuestions(){
        //gameModels.append(Question(text: "What is 2 + 2", answer: [ Answer(text: "1", correct: false),
           // Answer(text: "4", correct: true),
           // Answer(text: "2", correct: false),
            //Answer(text: "22", correct: false)                       ]))
        
        //gameModels.append(Question(text: "What is 2 + 10", answer: [ Answer(text: "1", correct: false),
            //Answer(text: "12", correct: true),
           // Answer(text: "2", correct: false),
            //Answer(text: "22", correct: false)                       ]))
        
        //gameModels.append(Question(text: "What is 2 + 0", answer: [ Answer(text: "20", correct: true),
            //Answer(text: "1", correct: false),
           // Answer(text: "0", correct: false),
            //Answer(text: "2", correct: false)                       ]))
        
    //}
    
    @IBAction func signOutButtonTapped(_ sender: Any) {
        print("Sign out button tapped.")
        
        let firstwindow = self.storyboard?.instantiateViewController(withIdentifier: "FirstWindowViewController") as! FirstWindowViewController
        
        self.present(firstwindow, animated: true)    }
    
    @IBAction func loadMemberProfileButtonTapped(_ sender: Any) {
        print("Load member profile button tapped.")
        
    }

    // table view functions
    
    //func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    //{
       // return currentQuestion?.answer.count ?? 0
    //}


//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
//{
   // let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    //cell.textLabel?.text = currentQuestion?.answer[indexPath.row].text
   // return cell
//}
}

struct Question{
    let text: String
    let answer: [Answer]
}

struct Answer{
    let text: String
    let correct: Bool
}

