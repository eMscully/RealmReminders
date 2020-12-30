
import RealmSwift
import UIKit

class NewReminderVC: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var isCompleteSwitch: UISwitch!

    var realm = try! Realm()
    let newReminder = Reminder()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveBttnPressed(_ sender: UIButton) {


        do {
            try realm.write {
                if let title = titleTextField.text {
                    newReminder.title = title
                    newReminder.date = datePicker.date
                    
                    newReminder.isComplete = !isCompleteSwitch.isOn

                }
                realm.add(newReminder)
                
                performSegue(withIdentifier: K.savedReminder, sender: self)
            }
        } catch {
            print("Error saving user input: \(error.localizedDescription)")
        }


  }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ReminderListVC {
            destinationVC.newReminder = newReminder
        }
    }
        
    }



