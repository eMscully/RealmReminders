
import UIKit
import RealmSwift

class ReminderListVC: UIViewController {
    @IBOutlet var tableView: UITableView!
    
     let realm = try! Realm()
    var reminders : Results<Reminder>?
    var reminderItem: Reminder?
    


    override func viewDidLoad() {
        super.viewDidLoad()
      
        reminders = realm.objects(Reminder.self)
        
        
    }


}
//MARK: - TableView Data Source & Delegate methods
extension ReminderListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return reminders?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell", for: indexPath) as! ReminderCell
         
            if let reminderItem = reminders?[indexPath.row] {
                cell.update(reminder: reminderItem)
            
            return cell
            }
        
            return UITableViewCell()
        }
    }



    
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        let selection = tableView.indexPath(for: (reminders?[indexPath.row])!)
//    }
//
//
//}
//
//}
