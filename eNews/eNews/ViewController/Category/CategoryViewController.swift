//
//  CategoryViewController.swift
//  eNews
//
//  Created by Reynaldo Cristinus Hutahaean on 05/11/21.
//

import UIKit

class CategoryViewController: ParentViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var businessButton: UIButton!
    @IBOutlet weak var sportButton: UIButton!
    @IBOutlet weak var generalButton: UIButton!
    @IBOutlet weak var healthButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var categoryNews = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        initTableView()
        getExploreNews(category: "business")
    }
    
    func initUI() {
        headerView.dropShadow()
        businessButton.setButton(width: 0.5, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), cornerRadius: 10.0, backgroundColor: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
        businessButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        sportButton.setButton(width: 0.5, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), cornerRadius: 10.0, backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        sportButton.setTitleColor(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), for: .normal)
        generalButton.setButton(width: 0.5, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), cornerRadius: 10.0, backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        generalButton.setTitleColor(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), for: .normal)
        healthButton.setButton(width: 0.5, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), cornerRadius: 10.0, backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        healthButton.setTitleColor(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), for: .normal)
    }
    
    func initTableView() {
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

    func getExploreNews(category: String) {
        self.showLoading(self.view)
        NewsService().getExploreNews(category: category, successBlock: { (isSuccess, response) in
            self.hideLoading(self.view)
            self.categoryNews = response
            self.tableView.reloadData()
        }, errorBlock: { (errorCode, errorString) in
            self.hideLoading(self.view)
            print(errorCode)
        })
    }
    
    @IBAction func businessButtonTapped(_ sender: Any) {
        businessButton.setButton(width: 0.5, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), cornerRadius: 10.0, backgroundColor: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
        businessButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        sportButton.setButton(width: 0.5, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), cornerRadius: 10.0, backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        sportButton.setTitleColor(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), for: .normal)
        generalButton.setButton(width: 0.5, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), cornerRadius: 10.0, backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        generalButton.setTitleColor(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), for: .normal)
        healthButton.setButton(width: 0.5, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), cornerRadius: 10.0, backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        healthButton.setTitleColor(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), for: .normal)
        
        categoryNews.removeAll()
        getExploreNews(category: "business")
        tableView.reloadData()
    }
    
    @IBAction func sportButtonTapped(_ sender: Any) {
        businessButton.setButton(width: 0.5, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), cornerRadius: 10.0, backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        businessButton.setTitleColor(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), for: .normal)
        sportButton.setButton(width: 0.5, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), cornerRadius: 10.0, backgroundColor: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
        sportButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        generalButton.setButton(width: 0.5, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), cornerRadius: 10.0, backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        generalButton.setTitleColor(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), for: .normal)
        healthButton.setButton(width: 0.5, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), cornerRadius: 10.0, backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        healthButton.setTitleColor(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), for: .normal)

        categoryNews.removeAll()
        getExploreNews(category: "sport")
        tableView.reloadData()
    }
    
    @IBAction func generalButtonTapped(_ sender: Any) {
        businessButton.setButton(width: 0.5, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), cornerRadius: 10.0, backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        businessButton.setTitleColor(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), for: .normal)
        sportButton.setButton(width: 0.5, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), cornerRadius: 10.0, backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        sportButton.setTitleColor(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), for: .normal)
        generalButton.setButton(width: 0.5, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), cornerRadius: 10.0, backgroundColor: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
        generalButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        healthButton.setButton(width: 0.5, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), cornerRadius: 10.0, backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        healthButton.setTitleColor(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), for: .normal)
        
        categoryNews.removeAll()
        getExploreNews(category: "general")
        tableView.reloadData()
    }
    
    @IBAction func healthButtonTapped(_ sender: Any) {
        businessButton.setButton(width: 0.5, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), cornerRadius: 10.0, backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        businessButton.setTitleColor(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), for: .normal)
        sportButton.setButton(width: 0.5, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), cornerRadius: 10.0, backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        sportButton.setTitleColor(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), for: .normal)
        generalButton.setButton(width: 0.5, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), cornerRadius: 10.0, backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        generalButton.setTitleColor(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), for: .normal)
        healthButton.setButton(width: 0.5, color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), cornerRadius: 10.0, backgroundColor: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
        healthButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        categoryNews.removeAll()
        getExploreNews(category: "health")
        tableView.reloadData()
    }
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
        cell.setData(categoryNews: categoryNews[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailNewsViewController()
        vc.detailNews = categoryNews[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        TheAppController.mainNavigationController?.pushViewController(vc, animated: true)
    }
}
