import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // セルを一つの単位として読み上げるようにする
        tableView.isAccessibilityElement = false
        tableView.shouldGroupAccessibilityChildren = true
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell else { return UITableViewCell() }
        cell.mainImageView.accessibilityLabel = "icon"
        cell.sectionLabel.text = "section:\(indexPath.section)"
        cell.rowLabel.text = "row:\(indexPath.row)"
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
}
