
import Foundation
import RealmSwift

class Reminder: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var date = Date()
    @objc dynamic var isComplete = Bool()
    //testing code without setting false by default
    
}
