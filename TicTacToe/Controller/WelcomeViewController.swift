//
//  WelcomeViewController.swift
//  TicTacToe
//
//  Created by Harapriya on 13/10/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var gameImageInWelcome: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "PlayGroundViewController") as! PlayGroundViewController
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
