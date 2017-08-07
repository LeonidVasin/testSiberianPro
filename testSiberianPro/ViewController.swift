//
//  ViewController.swift
//  testSiberianPro
//
//  Created by Leonid on 06.08.17.
//  Copyright © 2017 Leonid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var groups: [Group] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(GroupTableViewHeaderView.classForCoder(), forHeaderFooterViewReuseIdentifier: "headerGroup")
        tableView.register(UINib(nibName: "GroupTableViewHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "headerGroup")
        DispatchQueue.global().async {
            let file = Bundle.main.path(forResource: "data", ofType: "json")
            if let data = try? Data(contentsOf: URL(fileURLWithPath: file!)) {
                self.groups = GroupsParser.parse(at: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func showOkAlert(at title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return groups.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as! ItemTableViewCell
        cell.setup(at: groups[indexPath.section].items[indexPath.row])
        cell.delegate = self
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Style.celleHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Style.sectionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerGroup") as! GroupTableViewHeaderView
        view.setup(at: groups[section].groupTitle)
        view.delegate = self
        view.sectionIndex = section
        return view
    }
}

extension ViewController: GroupHeaderDelagate {
    func longPress(at single: Bool) {
        rotateView(targetView: tableView, duration: 0.5, singleAngle: single ? 1.0 : -1.0)
    }
    func rotateView(targetView: UIView, duration: Double, singleAngle: CGFloat) {
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
            targetView.transform = targetView.transform.rotated(by: singleAngle*CGFloat.pi*0.9999)
        }) { finished in
            UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
                targetView.transform = targetView.transform.rotated(by: singleAngle*CGFloat.pi)
            }) { finished in
                targetView.transform = .identity
            }
        }
    }
}

extension ViewController: ItemCellDelegate {
    func longPressOn(_ cell: ItemTableViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            let title = groups[indexPath.section].groupTitle
            let message = groups[indexPath.section].items[indexPath.row].itemTitle
            showOkAlert(at: title, message: message)
        }
    }
}
