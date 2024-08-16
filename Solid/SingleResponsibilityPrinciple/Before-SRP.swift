import Foundation

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

    // Persistence methods are added here, violating SRP
    func save(to filename: String, overwrite: Bool = false) {
        // Save journals to file
        print("Saving journal to \(filename)")
    }

    func load(from filename: String) {
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

    myJournal.save(to: "myJournal.txt")
}

main()
