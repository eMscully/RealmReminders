
import UIKit

class ReminderCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var isCompleteIcon: UIImageView!
    @IBOutlet var infoButton: UIButton!
    // created ^ reference outlet just in case
  
    

 
    var reminder : Reminder?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let reminder = reminder  {
            titleLabel.text = reminder.title
        let formatter = DateFormatter()
            dateLabel.text = formatter.string(from: reminder.date)
    
        }
        
    }
    
    func getIndex(reminder: Reminder, index: Int) {
        
    }
  
    // The function takes in a 'Reminder' Realm instance as an input and then calls for that reminder cell to change its UI based on the data passed back to it from the Add New Reminder View Controller
 
    func update(reminder: Reminder) {
        titleLabel.text = reminder.title
        let formatter = DateFormatter()
        dateLabel.text = formatter.string(from: reminder.date)
        if reminder.isComplete {
            
        } else {
            
        }
        
        
//        if reminder.isComplete {
//            print("the code definitely worked")
//        isCompleteIcon.image?.withTintColor(UIColor.green)
//        } else {
//            print("failed to record completed status")
//            isCompleteIcon.image?.withTintColor(UIColor(named: "white")!)
//        }

        
    }
    

    
        
        @IBAction func infoButtonPressed(_ sender: UIButton) {
        }
    }
    



