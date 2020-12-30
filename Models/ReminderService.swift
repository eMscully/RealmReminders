
import Foundation
import RealmSwift


class ReminderService {
    
let realm = try! Realm()
    var remindersList : Results<Reminder>!
    var reminderItem : Reminder!
    
    static let shared = ReminderService()
    
    //create reminder
    func addNewReminder() {
        do {
            try realm.write {
        
                realm.add(reminderItem)
            }
        } catch {
            print("Error saving reminder to database : \(error.localizedDescription)")
        }
    }
    
    //update reminder
    
    func updateReminder(updateReminder: Reminder, index: Int) {
    
        //this method uses index to retrieve position of reminder from a given position in reminders array
        let reminder = remindersList[index]
        
        do {
            try realm.write {
                realm.add(reminder)
            }
        } catch {
            print("Error updating reminder in database : \(error.localizedDescription)")
        }
    }
    
    
    //get number of reminders
    func loadReminders() -> Results<Reminder> {
      return realm.objects(Reminder.self)
    }
    
    
    // return reminder list count   ??
    
    func getRemindersCount() -> Int {
        return remindersList.count
    }
    
    //get a specific reminder ???
    func getSpecificReminder(index: Int) -> Reminder {
        return remindersList[index]
    }
    
    
    // toggle completed status
    func updateCompletedStatus() {
        do {
            try realm.write {
            
            reminderItem.isComplete = !reminderItem.isComplete
                realm.add(reminderItem)
                
            }
        } catch {
            print("Error saving completed item status : \(error.localizedDescription)")
        }
    }
    
    // delete reminder
        
        func deleteReminder(reminder: Reminder){
            do {
                try realm.write {
                    realm.delete(reminder)
                }
            } catch {
                print("Error deleting reminder : \(error.localizedDescription)")
            }
        }
    
    //get oldest reminder ("favorited reminder")
        func getFavoriteReminder() -> Reminder? {
            
            if let favoriteReminder = remindersList?.first {
                return favoriteReminder
            } else {
                return nil
            }
        }
    

}
