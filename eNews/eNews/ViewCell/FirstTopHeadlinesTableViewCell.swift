//
//  FirstTopHeadlinesTableViewCell.swift
//  eNews
//
//  Created by Reynaldo Cristinus Hutahaean on 05/11/21.
//

import UIKit
import AlamofireImage

class FirstTopHeadlinesTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsSourceLabel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsAuthorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(topHeadlines: News) {
        if topHeadlines.urlToImage.prefix(4) == "http" || topHeadlines.urlToImage.prefix(5) == "https"{
            let url = topHeadlines.urlToImage.replacingOccurrences(of: " ", with: "%20")
            newsImageView.af.setImage(withURL: URL(string: url)!)
        } else {
            newsImageView.af.setImage(withURL: URL(string: "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg")!)
        }
        newsSourceLabel.text = topHeadlines.name
        let newsLabel = topHeadlines.title
        let index = newsLabel.firstIndex(of: "-")
        newsTitleLabel.text = String(newsLabel[..<index!])
        newsAuthorLabel.text = topHeadlines.author
    }
}
