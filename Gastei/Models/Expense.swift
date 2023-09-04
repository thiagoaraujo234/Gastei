import SwiftUI

struct Expense: Identifiable {
    let id = UUID()
    var name: String
    var amount: Double
}
