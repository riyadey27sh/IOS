//
//  ViewController.swift
//  ApplePie
//
//  Created by Apple Lab 17 on 26/10/26.
//

import UIKit

class ViewController: UIViewController {
    //    SHOW FOR TWO PLAYERS AS TWO PLAYERS ARE PLAYING SIMULTAEOUSLY AND THAT WAY SHOW HOW IT WILL WORKK
    var listOfWords=["curious","learner","swift"]
    var wordsForPlayer2 = ["gourmet", "callback", "debugger"]
    let incorrectMovesAllowed=7
    
    var player1: Game!
    var player2: Game!
    var player1Wins = 0
    var player1Losses = 0
    var player2Wins = 0
    var player2Losses = 0
    var activePlayer = 2
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet var playerTurnLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    func newRound(){
        if !listOfWords.isEmpty && !wordsForPlayer2.isEmpty {
            let word1 = listOfWords.removeFirst()
            let word2 = wordsForPlayer2.removeFirst()
            
            player1 = Game(word: word1, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            player2 = Game(word: word2, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            
            activePlayer = 1
            enableLetterButtons(true)
            updateUI()
            
           
            }
        else{
            enableLetterButtons(true)
            correctWordLabel.text = "Game Over!"
            playerTurnLabel.text = "All rounds completed."
        }
    }
    
    func enableLetterButtons(_ enable: Bool){
        for button in letterButtons{
            button.isEnabled=enable
        }
    }
    
    func updateUI(){
        let currentGame = (activePlayer == 1) ? player1 : player2
        var letters=[String]()
        for letter in currentGame!.formattedWord{
            letters.append(String(letter))
        }
        //        let wordWithSpacing=letters.joined(separator: " ")
        correctWordLabel.text = letters.joined(separator: " ")
        playerTurnLabel.text = "Player \(activePlayer)'s Turn"
        scoreLabel.text = "P1 [Wins: \(player1Wins), Losses: \(player1Losses)] | P2 [Wins: \(player2Wins), Losses: \(player2Losses)]"
        treeImageView.image = UIImage(named: "Tree \(currentGame!.incorrectMovesRemaining)")
        
    }
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled=false
        let letterString=sender.configuration!.title!
        
        let letter=Character(letterString.lowercased())
        if activePlayer == 1 {
            player1.playerGuessed(letter: letter)
        } else {
            player2.playerGuessed(letter: letter)}
        updateGameState()
    }
    
    
    func updateGameState() {
        let currentGame = (activePlayer == 1) ? player1! : player2!

        if currentGame.incorrectMovesRemaining == 0 {
            if activePlayer == 1 {
                player1Losses += 1
            } else {
                player2Losses += 1
            }

            switchPlayer()
            
        } else if currentGame.word == currentGame.formattedWord {
            if activePlayer == 1 {
                player1Wins += 1
            } else {
                player2Wins += 1
            }

            switchPlayer()
            
        } else {
            updateUI()
        }
    }

    func switchPlayer() {
        activePlayer = (activePlayer == 1) ? 2 : 1

        enableLetterButtons(true)
        updateUI()
    }

    
}
