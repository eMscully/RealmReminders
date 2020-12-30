import RealmSwift
import Foundation


class ReminderService {
    let realm = try! Realm()
    
    func readData() -> Results<Reminder>? {
        let reminders = realm.objects(Reminder.self)
        return reminders
    }
    
    func save(reminder: Reminder) {
        do {
            try realm.write {
                realm.add(reminder)
            }
        } catch {
            print("Error saving data: \(error.localizedDescription)")
        }
    }
    
    
    
    
    
}
