//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var Movies: [Movie]!
    
    var fontSize = StartingValue.startingFontSize
    

    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllMovies()
        configureTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        movieTableView.reloadData()
    }
    
    private func getAllMovies() {
        let items = Movie.allMovies
        Movies = items
    }

    private func configureTableView() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.tableFooterView = UIView()
        movieTableView.estimatedRowHeight = 85.0
        movieTableView.rowHeight = UITableView.automaticDimension
    }

}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = Movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        cell.textLabel?.text = movie.name
        cell.textLabel?.font = cell.textLabel?.font.withSize(fontSize)
        cell.detailTextLabel?.text = movie.year.description
        cell.detailTextLabel?.font = cell.textLabel?.font.withSize(fontSize)
    
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailViewController else{fatalError()}
        destination.delegate = self
        destination.startingValue = fontSize
    }
}
extension ViewController: FontDelegate {
    
    func changeFont(size: CGFloat) {
        fontSize = size
    }
    
}






