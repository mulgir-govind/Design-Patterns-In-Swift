import Foundation

/*
 Explanation:

    The Single Responsibility Principle (SRP) states that a class should have only one reason to change. 
    In the provided code, the Persistance class is responsible for handling data persistence for the Journal class.
    By creating a separate class for managing persistence, we adhere to the SRP and achieve several advantages:
 
        1. Modularity: Each class or file will have a single responsibility. 
        The Journal class can focus on its core functionality, such as representing journal entries, 
        while the Persistance class can handle the saving and loading of journals. 
        This separation allows for easier maintenance and understanding of the codebase.

        2. Code Organization: Having a separate class for persistence improves code organization. 
        All the functions related to persistence are grouped together in the Persistance class, 
        making it easier to locate and modify them when needed.

        3. Reusability: The Persistance class can be reused in other parts of the codebase. 
        If there are other classes that require data persistence, they can utilize the same Persistance class without duplicating code.
        This promotes code reuse and reduces the chances of introducing bugs.

        4. Testing: Separating the persistence logic into its own class allows for easier testing. 
        With a dedicated Persistance class, we can write unit tests specifically for the persistence functionality, 
        ensuring that it works correctly without the need to test the entire Journal class.

    If we hadn't created a separate class for managing persistence, the code and functionalities would be affected in
    the following ways when modifying them:
        1. Code Clutter: The Journal class would have additional functions for saving and loading journals, 
        making the class more complex and harder to understand. This violates the SRP and can lead to code clutter, 
        making it difficult to maintain and modify the codebase.

        2. Violation of SRP: The Journal class would have multiple responsibilities, violating the SRP. 
        This can make the code harder to maintain, as any changes to the persistence logic would require modifications to
        the Journal class, even if the changes are unrelated to the core functionality of the Journal class.

        3. Limited Reusability: Without a separate class for persistence, the code for saving and loading journals would be 
        tightly coupled with the Journal class. This limits the reusability of the persistence logic in other parts of the codebase,
        as it would be specific to the Journal class.

    By creating a separate class for managing persistence, we ensure that each class has a single responsibility, 
    making the code more modular, maintainable, and easier to understand.
*/

class Journal: CustomStringConvertible {
    var entries = [String]()
    var count = 0

    func addEntry(_ text: String) -> Int {
        count += 1
        entries.append("\(count): \(text)")
        return count - 1
    }

    func removeEntry(at index: Int) {
        entries.remove(at: index)
    }

    var description: String {
        return entries.joined(separator: "\n")
    }

    /*
        The following functions save(to:overwrite:), load(from filename:), and load(from url:) functions break the Single Responsibility Principle
        because they introduce additional responsibilities to the Journal class that are not directly related to managing journal entries.
        These functions are responsible for saving and loading data from different sources, which is a separate concern from 
        the core responsibility of managing journal entries.

        To adhere to the Single Responsibility Principle, it is recommended to move these functions into separate files or classes that are
        specifically responsible for handling data persistence. This way, each class or file will have a single responsibility, 
        making the code more modular, maintainable, and easier to understand.

        func save(to filename: String, overwrite: Bool = false) {
            // Save journals to file
        }

        func load(from filename: String) {
            // Load journals from file
        }

        func load(from url: URL) {
            // Load journals from remote server
        }
    */
}


class Persistance {
    func save(_ journal: Journal, to filename: String, overwrite: Bool = false) {
        // Save journals to file
        print("Saving journal to \(filename)")
    }

    func load(from filename: String){
        // Load journals from file
        print("Loading journal from \(filename)")
    }

    func load(from url: URL) {
        // Load journals from remote server
        print("Loading journal from \(url)")
    }
}

// MARK: - Execute

func main() {
    let myJournal = Journal()
    let _ = myJournal.addEntry("Completed GitHub advance course")
    let _ = myJournal.addEntry("Completed ReactNative course")
    print("=====\n\(myJournal)")

    myJournal.removeEntry(at: 1)
    print("=====\n\(myJournal)")

    let persistance = Persistance()
    persistance.save(myJournal, to: "myJournal.txt")
}

main()