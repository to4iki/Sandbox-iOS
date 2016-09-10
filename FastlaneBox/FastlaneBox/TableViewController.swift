import UIKit

final class TableViewController: UITableViewController {

    private let data = Array(1...20)

    private static let ReusableCellIdentifier = "TableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDataSource

extension TableViewController {

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(TableViewController.ReusableCellIdentifier) else {
            fatalError()
        }
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
}
