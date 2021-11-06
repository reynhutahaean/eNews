//
//  TopHeadlinesViewController.swift
//  eNews
//
//  Created by Reynaldo Cristinus Hutahaean on 05/11/21.
//

import UIKit
import SafariServices

class TopHeadlinesViewController: ParentViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var countryButton: UIButton!
    @IBOutlet weak var newsTableView: UITableView!
    
    var topHeadlineArray = [News]()
    var refreshControl = UIRefreshControl()
    var country = "id"
    var countryList = [Country]()
    var selectedCountry : Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        initTableView()
        initRefreshControl()
        listCountry()
        getTopHeadlineNews(country: country)
    }

    func initUI() {
        headerView.dropShadow()
        countryButton.setImage(UIImage(named: "ic_country_id"), for: .normal)
    }
    
    func initTableView() {
        newsTableView.register(UINib(nibName: "TopHeadlinesTableViewCell", bundle: nil), forCellReuseIdentifier: "TopHeadlinesTableViewCell")
        newsTableView.register(UINib(nibName: "FirstTopHeadlinesTableViewCell", bundle: nil), forCellReuseIdentifier: "FirstTopHeadlinesTableViewCell")
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
    
    func listCountry() {
        countryList = [Country(name: "Argentina", code: "ag"),
                       Country(name: "Brazil", code: "br"),
                       Country(name: "China", code: "cn"),
                       Country(name: "Indonesia", code: "id"),
                       Country(name: "Rusia", code: "ru"),
                       Country(name: "United States", code: "us")
                      ]
    }
    
    func initRefreshControl() {
        refreshControl.backgroundColor = UIColor.clear
        refreshControl.tintColor = UIColor.gray
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        newsTableView.addSubview(refreshControl)
    }
    
    @objc func refreshData() {
        print("requesting data")
        
        refreshControl.beginRefreshing()
        newsTableView.reloadData()
        let deadline = DispatchTime.now() + .milliseconds(2000)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            self.refreshControl.endRefreshing()
            self.getTopHeadlineNews(country: self.country)
            self.newsTableView.reloadData()
        }
    }
    
    func getTopHeadlineNews(country: String) {
        self.showLoading(self.view)
        NewsService().getTopHeadlines(country: country, successBlock: { (isSuccess, newsResponse) in
            self.hideLoading(self.view)
            self.topHeadlineArray = newsResponse
            self.newsTableView.reloadData()
        }, errorBlock: { (errorCode, errorString) in
            self.hideLoading(self.view)
            print(errorCode)
        })
    }
    
    @IBAction func countryButtonTapped(_ sender: Any) {
        let countryNames = self.countryList.map { $0.name }
        
        let vc = CountryPickerViewController()
        vc.delegate = self
        vc.pickerArray = countryNames
        vc.countryArray = countryList
        vc.modalPresentationStyle = .overFullScreen
        TheAppController.mainNavigationController?.present(vc, animated: false, completion: nil)
    }
}

extension TopHeadlinesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topHeadlineArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = newsTableView.dequeueReusableCell(withIdentifier: "FirstTopHeadlinesTableViewCell", for: indexPath) as! FirstTopHeadlinesTableViewCell
            cell.setData(topHeadlines: topHeadlineArray[indexPath.row])
            
            return cell
        } else {
            let cell = newsTableView.dequeueReusableCell(withIdentifier: "TopHeadlinesTableViewCell", for: indexPath) as! TopHeadlinesTableViewCell
            cell.setData(topHeadlines: topHeadlineArray[indexPath.row])
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urlString = topHeadlineArray[indexPath.row]
        
        guard let url = URL(string: urlString.url ?? "") else {
            return
        }
        
        let vc = DetailNewsViewController()
        tableView.deselectRow(at: indexPath, animated: true)
        vc.detailNews = topHeadlineArray[indexPath.row]
        TheAppController.mainNavigationController?.pushViewController(vc, animated: true)
    }
}

extension TopHeadlinesViewController: CountryPickerPopUpDelegate {
    func selectPicker(countryName: String) {
        if let countries = self.countryList.first(where: { $0.name == countryName }){
            self.selectedCountry = countries
            self.country = countries.code
            self.countryButton.setImage(UIImage(named: "ic_country_\(country)"), for: .normal)
            self.topHeadlineArray.removeAll()
            self.getTopHeadlineNews(country: country)
            self.newsTableView.reloadData()
        }
    }
}

