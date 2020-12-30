
import UIKit
import RealmSwift

class ReminderListVC: UIViewController {
    var realm = try! Realm()
    
    var reminders : Results<Reminder>?
    
    var newReminder: Reminder?

    override func viewDidLoad() {
        super.viewDidLoad()
      
        reminders = realm.objects(Reminder.self)
        
        
    }


}
//MARK: - TableView Data Source & Delegate methods
extension ReminderListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if reminders?.count != nil {
            return reminders!.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell", for: indexPath) as! ReminderCell
        if let newReminder = reminders?[indexPath.row] {
        cell.update(reminder: newReminder)
            return cell
      
        }
        return UITableViewCell()
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

