
import RealmSwift
import UIKit

class NewReminderVC: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var isCompleteSwitch: UISwitch!

    let realm = try! Realm()
    var newReminder =  Reminder()
    var existingReminder = Reminder()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.text = existingReminder.title
        datePicker.date = existingReminder.date
        
        
    }
    
    
    @IBAction func saveBttnPressed(_ sender: UIButton) {
      
        do {
           
            try realm.write {
                if let title = titleTextField.text {
                    newReminder.title = title
                    newReminder.date = datePicker.date
                    newReminder.isComplete = isCompleteSwitch.isOn
                }
                    realm.add(newReminder)
    
                performSegue(withIdentifier: K.savedReminder, sender: self)
                }
        }
              catch {
                print("error: \(error.localizedDescription)")
            }
    }
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              if let destinationVC = segue.destination as? ReminderListVC {
                  destinationVC.reminderItem = newReminder
                }
            }
        
          }


        
    


//
//        if let newReminder = newReminder {
//
//            newReminder.title = title ?? ""
//            newReminder.date = datePicker.date
//            newReminder.isComplete = isCompleteSwitch.isOn
//            do {
//            try realm.write{
//                realm.add(newReminder)
//
//            }
//            } catch {
//
//            }
//        }
//            performSegue(withIdentifier: K.savedReminder, sender: self)
//        }
   
    

   

//        do {
//            try realm.write {
//                if let title = titleTextField.text {
//                    newReminder.title = title
//                    newReminder.date = datePicker.date
//
//                    newReminder.isComplete = !isCompleteSwitch.isOn
//
//                }
//                realm.add(newReminder)
//
//                performSegue(withIdentifier: K.savedReminder, sender: self)
//            }
//        } catch {
//            print("Error saving user input: \(error.localizedDescription)")
//        }



        
    



