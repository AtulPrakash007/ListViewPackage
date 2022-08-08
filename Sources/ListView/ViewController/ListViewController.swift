//
//  File.swift
//  
//
//  Created by Atul Prakash on 07/08/22.
//

import Foundation
import UIKit

public class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    public static let storyboardVC = UIStoryboard(name: "ListViewPackage", bundle: Bundle.module).instantiateInitialViewController()!
    public var headerData: ListModel?
    public var listData: [ListModel]?
    
    public init() {
        super.init(nibName: "ListViewController", bundle: Bundle(for: ListViewController.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var viewModel = ListViewModel()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCell()
    }
    
    func setUpViewModel() {
        if let headerData = headerData {
            viewModel.headerData = headerData
        }
        
        if let listData = listData {
            viewModel.tableData = listData
        }
    }
    
    func registerTableViewCell() {
        let nibName = UINib(nibName: ListTableViewCell.className, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: ListTableViewCell.className)
        tableView.estimatedRowHeight = 44
    }
    
    public func reloadTable(with newData: [ListModel]) {
        viewModel.tableData = newData
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK:- UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.className, for: indexPath) as? ListTableViewCell {
            let item = viewModel.itemAtIndexPath(indexPath: indexPath.row)
            cell.configureCell(labelColor: item.color, data: item.data)
            return cell
        }
        
        // Loading of next page yet to be implemented
        
        return UITableViewCell()
    }
}

// MARK:- UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    
}

