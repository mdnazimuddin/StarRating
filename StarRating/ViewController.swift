//
//  ViewController.swift
//  StarRating
//
//  Created by Nazim Uddin on 15/10/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cosmosViewFill: CosmosView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingSlider: UISlider!
    private let starRating:Float = 3.7
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cosmosViewFill.didTouchCosmos = didTouchCosmos
        cosmosViewFill.didFinishTouchingCosmos = didFinishTouchingCosmos
        ratingSlider.value = starRating
        updateRating()
    }

    @IBAction func didChangeSlider(_ sender: Any) {
        updateRating()
    }
    private func updateRating(){
        let value = Double(ratingSlider.value)
        cosmosViewFill.rating = value
        
        self.ratingLabel.text = ViewController.formatValue(value)
    }
}
extension ViewController{
    private class func formatValue(_ value:Double)-> String
    {
        return String(format: "%.2f", value)
    }
    private func didTouchCosmos(_ rating:Double){
        ratingSlider.value = Float(rating)
        ratingLabel.text = ViewController.formatValue(rating)
    }
    private func didFinishTouchingCosmos(_ rating:Double) {
        ratingSlider.value = Float(rating)
        ratingLabel.text = ViewController.formatValue(rating)
    }
}

