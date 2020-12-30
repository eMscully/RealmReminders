
import RealmSwift
import UIKit

class NewReminderVC: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var isCompleteSwitch: UISwitch!

    let realm = try! Realm()
    var reminder =  Reminder()
    var reminders : Results<Reminder>?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        reminders = realm.objects(Reminder.self)
        titleTextField.text = reminder.title
        datePicker.date = reminder.date
        isCompleteSwitch.isOn = reminder.isComplete
        
    }
    
    
    @IBAction func saveBttnPressed(_ sender: UIButton) {
      
        do {
            try realm.write {
                if let title = titleTextField.text {
                    reminder.title = title
                    reminder.date = datePicker.date
                    reminder.isComplete = !isCompleteSwitch.isOn
                }
                    realm.add(reminder)
    
                performSegue(withIdentifier: K.savedReminder, sender: self)
                }
        }
              catch {
                print("error: \(error.localizedDescription)")
            }
    }
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              if let destinationVC = segue.destination as? ReminderListVC {
                  destinationVC.reminderItem = reminder
                }
            }

    @IBAction func toggleChanged(_ sender: UISwitch) {
       
        do {
            try realm.write{
                reminder.isComplete = sender.isOn
                realm.add(reminder)
            }
        } catch {
            print("did not save toggle state")
        }
    }
    
}
    



        
    



