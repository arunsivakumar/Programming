import UIKit

func numberOfRows(in tableView: UITableView, section: Int = 0) -> Int? {
    return tableView.dataSource?.tableView(
        tableView, numberOfRowsInSection: section)
}

func cellForRow(in tableView: UITableView, row: Int, section: Int = 0)
    -> UITableViewCell? {
        return tableView.dataSource?.tableView(
            tableView, cellForRowAt: IndexPath(row: row, section: section))
}

func didSelectRow(in tableView: UITableView, row: Int, section: Int = 0) {
    tableView.delegate?.tableView?(
        tableView, didSelectRowAt: IndexPath(row: row, section: section))
}
