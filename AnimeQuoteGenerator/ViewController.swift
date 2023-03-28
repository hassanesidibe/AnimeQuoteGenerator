//
//  ViewController.swift
//  AnimeQuoteGenerator
//
//  Created by Hassane Sidibe on 3/27/23.
//

import UIKit

class ViewController: UIViewController {

    private let backgroundImages = ["background1", "background2", "background3", "background4", "background5", "background6", "background7"]
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var animeNameLabel: UILabel!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let chosenImage = backgroundImages.randomElement()!
        backgroundImageView.image = UIImage(named: chosenImage)
        quoteLabel.adjustsFontSizeToFitWidth = true
        quoteLabel.minimumScaleFactor = 0.5
        quoteLabel.numberOfLines = 0
    }


}

