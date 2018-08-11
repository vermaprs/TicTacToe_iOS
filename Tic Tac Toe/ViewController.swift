//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Prashant Verma on 6/27/18.
//  Copyright © 2018 Prashant Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentPlayerImageView: UIImageView!
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    var count = 0;
    var state = [String](repeating: "-", count: 16)
    var currentPlayer = "x"

    var newGame = false
    let winCases = [[0,1,2,3], [4,5,6,7],[8,9,10,11],[12,13,14,15],[0,4,8,12],[1,5,9,13],[2,6,10,14],[3,7,11,15],[0,5,10,15],[3,6,9,12],[0,3,12,15],[0,1,4,5],[4,5,8,9],[8,9,12,13],[1,2,5,6],[5,6,9,10],[9,10,13,14],[2,3,6,7],[6,7,10,11],[10,11,14,15]]
    var isDraw = true
    
    @IBAction func click(_ sender: AnyObject)
    {
        if(state[sender.tag-1] == "-" && newGame == false){
            
            state[sender.tag-1] = currentPlayer
            
            if(currentPlayer == "x"){
                currentPlayer = "o"
                currentPlayerImageView.image = UIImage(named: "cross.png")
                sender.setImage(UIImage(named: "cross.png"), for: UIControlState())
                count = count + 1
            }
            else{
                currentPlayer = "x"
                currentPlayerImageView.image = UIImage(named: "naught.png")
                sender.setImage(UIImage(named: "naught.png"), for: UIControlState())
                count = count + 1
            }
    
        }
        else if (newGame == false){
            let positionAlert = UIAlertController(title: "Alert", message: "Please choose another square to fill.", preferredStyle: UIAlertControllerStyle.alert)
            positionAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(positionAlert, animated: true, completion: nil)

        }
        else{
            let newGameAlert = UIAlertController(title: "Alert", message: "Please select New Game.", preferredStyle: UIAlertControllerStyle.alert)
            newGameAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(newGameAlert, animated: true, completion: nil)

        }
        
        for win in winCases{
            if(state[win[0]] != "-" && state[win[0]] == state[win[1]] && state[win[1]] == state[win[2]] && state[win[2]] == state[win[3]]){
                
                isDraw = false
                
                if (state[win[0]] == "o"){
                    print("Nought Has won")
                    winnerLabel.text = "Nought Has won"
                }
                else if(state[win[0]] == "x"){
                    print("Cross has won")
                    winnerLabel.text = "Cross has won"
                }
                
                winnerLabel.isHidden = false
                newGame = true
            }
            
        }
        
        //To Declare a draw after all 16 squares are filled
        if(count == 16 && isDraw == true){
            print("It's a tie")
            winnerLabel.isHidden = false
            winnerLabel.text = "It's a tie"
            //Line to be added
            newGame = true
        }

    }
    
    //Reset game after one game
    @IBAction func newGame(_ sender: UIButton) {
        newGame = false
        currentPlayer = "x"
        currentPlayerImageView.image = UIImage(named:"cross.png")
        winnerLabel.isHidden = true
        state = [String](repeating: "-", count: 16)
        //Lines to be added
        isDraw = true
        count = 0
        
        for num in 1...16{
            let position = view.viewWithTag(num) as! UIButton
            position.setImage(nil, for: UIControlState())
        }
        
    }

}

