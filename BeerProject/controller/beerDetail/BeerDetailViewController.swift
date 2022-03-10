//
//  ViewController.swift
//  BeerProject
//
//  Created by Antonio Álvarez de los Santos on 5/3/22.
//

import UIKit

class BeerDetailViewController: UIViewController {
    
    @IBOutlet weak var imgBeer: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbAdvice: UILabel!
    @IBOutlet weak var lbFoodPairing: UILabel!
    
    var titleName = String()
    var img = String()
    var descripcion = String()
    var advice = String()
    var foodPairing = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadStyle()
    }
    
    func loadStyle() {
//        lbTitle
        lbTitle.text = title
        
//        imgBeer
        imgBeer.imageFromServerURL(urlString: img)
        
//        lbDescription
        let textDescripcion = descripcion.withBoldText(text: Constants.nameWords.description)
        lbDescription.attributedText =  textDescripcion
        
//        lbAdvice
        let textAdvice = advice.withBoldText(text: Constants.nameWords.advice)
        lbAdvice.attributedText =  textAdvice
        
//        lbFoodPairing
        lbFoodPairing.text = Constants.nameWords.accompanyingFood
        for food in foodPairing {
            lbFoodPairing.text! += Constants.nameWords.space + food
        }
        
        let textFoodPairing = lbFoodPairing.text!.withBoldText(text: Constants.nameWords.accompanyingFood)
        lbFoodPairing.attributedText =  textFoodPairing
    }
    
    func loadCell(name: String, image: String, description: String, tips: String, foods: [String]) {
        title = name
        img = image
        descripcion = Constants.nameWords.description + Constants.nameWords.space + description
        advice = Constants.nameWords.advice + Constants.nameWords.space + tips
        foodPairing = foods
    }
}

extension String {
    func withBoldText(text: String, font: UIFont? = nil) -> NSAttributedString {
        let _font = font ?? UIFont.systemFont(ofSize: 18, weight: .light)
        let fullString = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font: _font])
        let boldFontAttribute: [NSAttributedString.Key: Any] =        [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: _font.pointSize)]
        let range = (self as NSString).range(of: text)
        fullString.addAttributes(boldFontAttribute, range: range)
        return fullString
    }
}
