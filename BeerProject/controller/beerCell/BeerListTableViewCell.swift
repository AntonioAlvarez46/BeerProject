//
//  BeerListTableViewCell.swift
//  BeerProject
//
//  Created by Antonio Álvarez de los Santos on 6/3/22.
//

import UIKit

class BeerListTableViewCell: UITableViewCell {

    @IBOutlet weak var beerView: UIView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var imageBeer: UIImageView!
    @IBOutlet weak var viewSeparator: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        loadStyle()
    }
    
    func loadStyle() {
//        lbTitle
        lbTitle.font = UIFont.boldSystemFont(ofSize: 18)
        
//        viewSeparator
//        It should go in a separate class with all the styles, but being such a small project I don't see it necessary since it would contain a line just for this case
        viewSeparator.backgroundColor = UIColor.rgb(red: 52, green: 35, blue: 35, alpha: 26)
    }
}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
      }
}
