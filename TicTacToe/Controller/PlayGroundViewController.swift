//
//  ViewController.swift
//  TicTacToe
//
//  Created by Harapriya on 12/10/23.
//

import UIKit

class PlayGroundViewController: UIViewController {
    
    enum Turn {
        case Nought
        case Cross
    }
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var buttonA1: UIButton!
    @IBOutlet weak var buttonA2: UIButton!
    @IBOutlet weak var buttonA3: UIButton!
    @IBOutlet weak var buttonB1: UIButton!
    @IBOutlet weak var buttonB2: UIButton!
    @IBOutlet weak var buttonB3: UIButton!
    @IBOutlet weak var buttonC1: UIButton!
    @IBOutlet weak var buttonC2: UIButton!
    @IBOutlet weak var buttonC3: UIButton!
    
    var firstTurn = Turn.Cross
    var curentTurn = Turn.Cross
    var NOUGHT = "O"
    var CROSS = "X"
    var board = [UIButton]()
    var noughtsScore = 0
    var crossesScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initboard()
        
    }
    
    func initboard(){
        board.append(buttonA1)
        board.append(buttonA2)
        board.append(buttonA3)
        board.append(buttonB1)
        board.append(buttonB2)
        board.append(buttonB3)
        board.append(buttonC1)
        board.append(buttonC2)
        board.append(buttonC3)
        
    }
    
    func checkForVictory(_ s: String) -> Bool {
        
        //Horizontal Check
        
        if thisSymbol(buttonA1, s) && thisSymbol(buttonA2, s) && thisSymbol(buttonA3, s) {
            return true
        }
        if thisSymbol(buttonB1, s) && thisSymbol(buttonB2, s) && thisSymbol(buttonB3, s) {
            return true
        }
        if thisSymbol(buttonC1, s) && thisSymbol(buttonC2, s) && thisSymbol(buttonC3, s) {
            return true
        }
        
        //Vertical Check
        
        if thisSymbol(buttonA1, s) && thisSymbol(buttonB1, s) && thisSymbol(buttonC1, s) {
            return true
        }
        if thisSymbol(buttonA2, s) && thisSymbol(buttonB2, s) && thisSymbol(buttonC2, s) {
            return true
        }
        if thisSymbol(buttonA3, s) && thisSymbol(buttonB3, s) && thisSymbol(buttonC3, s) {
            return true
        }
        
        //Diagonal Check
        
        if thisSymbol(buttonA1, s) && thisSymbol(buttonB2, s) && thisSymbol(buttonC3, s) {
            return true
        }
        if thisSymbol(buttonA3, s) && thisSymbol(buttonB2, s) && thisSymbol(buttonC1, s) {
            return true
        }
        return false
    }
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
    
    @IBAction func boardTapAction(_ sender: UIButton) {
        
        addToBoard(sender)
        
        if checkForVictory(CROSS) {
            crossesScore += 1
            resultAlert(title: "Crosses Win!")
        }
        if checkForVictory(NOUGHT) {
            noughtsScore += 1
            resultAlert(title: "Noughts Win!")
        }
        
        if fullBoard() {
            resultAlert(title: "Draw!")
        }
        
    }
    
    func resultAlert(title: String) {
        let message = "\nNoughts :  " + String(noughtsScore) + "\n\nCrosses :  " + String(crossesScore)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { (_) in
            self.resetboard()
        }))
        self.present(ac, animated: true)
    }
    
    func resetboard() {
        for button in board {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if firstTurn == Turn.Nought {
            firstTurn = Turn.Cross
            turnLabel.text = CROSS
        }
        else if firstTurn == Turn.Cross {
            firstTurn = Turn.Nought
            turnLabel.text = NOUGHT
        }
        curentTurn = firstTurn
    }
    
    
    func fullBoard() -> Bool{
        for button in board {
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
    
    func addToBoard(_ sender: UIButton) {
        if (sender.title(for: .normal) == nil) {
            if (curentTurn == Turn.Nought) {
                sender.setTitle(NOUGHT, for: .normal)
                curentTurn = Turn.Cross
                turnLabel.text = CROSS
            }
            else if (curentTurn == Turn.Cross) {
                sender.setTitle(CROSS, for: .normal)
                curentTurn = Turn.Nought
                turnLabel.text = NOUGHT
            }
            sender.isEnabled = false
        }
    }
}

