import SwiftUI

class BudgetViewModel: ObservableObject {
    @Published var isAddingIncome = false
    @Published var isAddingExpense = false
    @Published var incomeName = ""
    @Published var expenseName = ""
    @Published var incomeValue = ""
    @Published var expenseValue = ""
    
    @Published var totalIncome: Double = 0
    @Published var totalExpenses: Double = 0
    
    @Published var incomes: [Income] = []
    @Published var expenses: [Expense] = []
    
    var saldo: Double {
        totalIncome - totalExpenses
    }
    
    func addIncome() {
        if let value = Double(incomeValue) {
            let income = Income(name: incomeName, amount: value)
            incomes.append(income)
            totalIncome += value
            incomeValue = ""
            incomeName = ""
            isAddingIncome = false
        }
    }
    
    func updateIncome(_ income: Income, withName name: String, andAmount amount: Double) {
        if let index = incomes.firstIndex(where: { $0.id == income.id }) {
            incomes[index].name = name
            incomes[index].amount = amount
            // Atualizar o total de receita aqui, se necessário
        }
    }
    
    func deleteIncome(_ income: Income) {
        if let index = incomes.firstIndex(where: { $0.id == income.id }) {
            let deletedIncome = incomes.remove(at: index)
            totalIncome -= deletedIncome.amount
        }
    }
    
    func addExpense() {
        if let value = Double(expenseValue) {
            let expense = Expense(name: expenseName, amount: value)
            expenses.append(expense)
            totalExpenses += value
            expenseValue = ""
            expenseName = ""
            isAddingExpense = false
        }
    }
    
    func updateExpense(_ expense: Expense, withName name: String, andAmount amount: Double) {
        if let index = expenses.firstIndex(where: { $0.id == expense.id }) {
            expenses[index].name = name
            expenses[index].amount = amount
            // Atualizar o total de despesa aqui, se necessário
        }
    }
    
    func deleteExpense(_ expense: Expense) {
        if let index = expenses.firstIndex(where: { $0.id == expense.id }) {
            let deletedExpense = expenses.remove(at: index)
            totalExpenses -= deletedExpense.amount
        }
    }
}
