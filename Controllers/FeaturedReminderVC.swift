
import UIKit
import RealmSwift

class FeaturedReminderVC: UIViewController {

    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var titleLabel: UILabel!
    
    let realm = try! Realm()
    var reminders : Results<Reminder>!
    var favoriteReminder : Reminder!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        reminders = realm.objects(Reminder.self)
        
        titleLabel.text = favoriteReminder.title
        let dateFormatter = DateFormatter()
        dateLabel.text = dateFormatter.string(from: favoriteReminder.date)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

    
    }
    


}
