//
//  ViewController.swift
//  AnimeQuoteGenerator
//
//  Created by Hassane Sidibe on 3/27/23.
//

import UIKit

class ViewController: UIViewController {

    private let backgroundImages = ["background1", "background4", "background5", "background7", "jiraiyaMode", "kaguya", "madara", "bleach", "bleach2", "bleach3"]
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var animeNameLabel: UILabel!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
    var animeManager = AnimeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set anime delegate
        animeManager.delegate = self
        
        
        // Do any additional setup after loading the view.
        let chosenImage = backgroundImages.randomElement()!
        backgroundImageView.image = UIImage(named: chosenImage)
        quoteLabel.adjustsFontSizeToFitWidth = true
        quoteLabel.minimumScaleFactor = 0.5
        quoteLabel.numberOfLines = 0
    }

    
    @IBAction func newQuoteButtonPressed(_ sender: UIButton) {
        //change anime info displayed on the screen
        animeManager.generateAnime()
    }
    
}


extension ViewController: AnimeManagerDelegate {
    func didUpdateAnime(_ animeManager: AnimeManager, quoteData: QuoteData) {
        
        DispatchQueue.main.async {
            self.animeNameLabel.text = quoteData.anime
            self.characterNameLabel.text = quoteData.character
            self.quoteLabel.text = quoteData.quote
            
            let chosenImage = self.backgroundImages.randomElement()!
            self.backgroundImageView.image = UIImage(named: chosenImage)
        }
    }
}




