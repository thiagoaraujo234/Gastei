import SwiftUI

struct CardView: View {
    var title: String
    var amount: Double

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            Text(String(format: "%.2f", amount))
                .font(.subheadline)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "Sample Expense", amount: 50.0)
    }
}
