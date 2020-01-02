//
//  MasterViewController.swift
//  ExampleApp
//
//  Created by Rajdeep Kwatra on 2/1/20.
//  Copyright © 2020 Rajdeep Kwatra. All rights reserved.
//

import UIKit

struct Navigation {
    let title: String
    let items: [NavigationItem]
}

struct NavigationItem {
    let title: String
    let viewController: UIViewController
}

class MasterViewController: UITableViewController {

    let navigation = [
        Navigation(title: "Basic features", items: [NavigationItem(title: "Autogrowing TextView", viewController: AutogrowingTextViewExampleViewController())])
    ]

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return navigation.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        navigation[section].title
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return navigation[section].items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel!.text = navigation.item(at: indexPath).title
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = navigation.item(at: indexPath).viewController
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension Array where Element == Navigation {
    func item(at indexPath: IndexPath) -> NavigationItem {
        return self[indexPath.section].items[indexPath.row]
    }
}