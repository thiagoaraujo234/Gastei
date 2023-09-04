import SwiftUI

struct EditIncomeView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var updatedName: String
    @State private var updatedAmount: String
    
    let income: Income
    let viewModel: BudgetViewModel
    
    init(income: Income, viewModel: BudgetViewModel) {
        self.income = income
        self.viewModel = viewModel
        self._updatedName = State(initialValue: income.name)
        self._updatedAmount = State(initialValue: String(income.amount))
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Editar Receita")) {
                    TextField("Nome", text: $updatedName)
                    TextField("Valor", text: $updatedAmount)
                        .keyboardType(.decimalPad)
                }
                
                Button(action: updateIncome) {
                    Text("Salvar")
                }
                .foregroundColor(.blue)
            }
            .navigationTitle("Editar Receita")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: deleteIncome) {
                        Image(systemName: "trash")
                    }
                }
            }
        }
    }
    
    func updateIncome() {
        if let updatedAmountValue = Double(updatedAmount) {
            viewModel.updateIncome(income, withName: updatedName, andAmount: updatedAmountValue)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func deleteIncome() {
        viewModel.deleteIncome(income)
        presentationMode.wrappedValue.dismiss()
    }
}

struct EditIncomeView_Previews: PreviewProvider {
    static var previews: some View {
        EditIncomeView(income: Income(name: "Salary", amount: 1000.0), viewModel: BudgetViewModel())
    }
}
