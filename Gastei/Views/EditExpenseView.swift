import SwiftUI

struct EditExpenseView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var updatedName: String
    @State private var updatedAmount: String
    
    let expense: Expense
    let viewModel: BudgetViewModel
    
    init(expense: Expense, viewModel: BudgetViewModel) {
        self.expense = expense
        self.viewModel = viewModel
        self._updatedName = State(initialValue: expense.name)
        self._updatedAmount = State(initialValue: String(expense.amount))
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Editar Despesa")) {
                    TextField("Nome", text: $updatedName)
                    TextField("Valor", text: $updatedAmount)
                        .keyboardType(.decimalPad)
                }
                
                Button(action: updateExpense) {
                    Text("Salvar")
                }
                .foregroundColor(.blue)
            }
            .navigationTitle("Editar Despesa")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: deleteExpense) {
                        Image(systemName: "trash")
                    }
                }
            }
        }
    }
    
    func updateExpense() {
        if let updatedAmountValue = Double(updatedAmount) {
            viewModel.updateExpense(expense, withName: updatedName, andAmount: updatedAmountValue)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func deleteExpense() {
        viewModel.deleteExpense(expense)
        presentationMode.wrappedValue.dismiss()
    }
}

struct EditExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        EditExpenseView(expense: Expense(name: "Rent", amount: 800.0), viewModel: BudgetViewModel())
    }
}
