//
//  CountryPickerViewController.swift
//  eNews
//
//  Created by Reynaldo Cristinus Hutahaean on 05/11/21.
//

import UIKit

protocol CountryPickerPopUpDelegate {
    func selectPicker(countryName: String)
}

class CountryPickerViewController: UIViewController {

    @IBOutlet weak var bgButton: UIButton!
    @IBOutlet weak var pickerContainerView: UIView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: CountryPickerPopUpDelegate?
    var pickerArray = [String]()
    var countryArray = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        initTableView()
    }


    func initUI() {
        pickerContainerView.roundedCorner(cornerRadius: 8)
        searchView.roundedCorner(cornerRadius: 8)
    }
    
    func initTableView() {
        tableView.register(UINib(nibName: "CountryPickerTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryPickerTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        tableView.contentInset = UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0)
        tableView.estimatedRowHeight = 45
    }
    
    @IBAction func searchTextFieldEditingChanged(_ sender: Any) {
        if (searchTextField.text == "") {
            pickerArray = countryArray.map { $0.name }
        } else {
            let filteredCountry = countryArray.filter { $0.name.uppercased().contains(searchTextField.text!.uppercased()) }
            pickerArray = filteredCountry.map { $0.name }
        }

        tableView.reloadData()
    }
    
    @IBAction func bgButtonTapped(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }

}

extension CountryPickerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pickerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryPickerTableViewCell", for: indexPath) as! CountryPickerTableViewCell
        cell.countryLabel.text = pickerArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: false, completion: nil)
        
        if (delegate != nil) {
            delegate?.selectPicker(countryName: pickerArray[indexPath.row])
        }
    }
}
