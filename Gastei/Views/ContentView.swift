import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = BudgetViewModel()
    
    var body: some View {
        TabView {
            // Primeira aba
            VStack {
                Text("Gastei")
                    .font(.largeTitle)
                    .padding(.top, 20)
                
                VStack {
                    Text("Saldo")
                        .font(.title)
                        .foregroundColor(.white)
                    Text("Saldo atual: \(viewModel.saldo, specifier: "%.2f")")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(15)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 8)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Receita: \(viewModel.totalIncome, specifier: "%.2f")")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Button(action: {
                        viewModel.isAddingIncome.toggle()
                    }) {
                        Text("Clique para adicionar")
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .background(Color.green)
                .cornerRadius(15)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 8)
                
                if viewModel.isAddingIncome {
                    VStack {
                        TextField("Nome da Receita", text: $viewModel.incomeName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Valor da Receita", text: $viewModel.incomeValue)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                        Button(action: {
                            viewModel.addIncome()
                        }) {
                            Text("Adicionar Receita")
                        }
                    }
                    .padding()
                    .background(Color.green)
                    .cornerRadius(15)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 8)
                }
                
                VStack {
                    Text("Despesa: \(viewModel.totalExpenses, specifier: "%.2f")")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Button(action: {
                        viewModel.isAddingExpense.toggle()
                    }) {
                        Text("Clique para adicionar")
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .background(Color.red)
                .cornerRadius(15)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 8)
                
                if viewModel.isAddingExpense {
                    VStack {
                        TextField("Nome da Despesa", text: $viewModel.expenseName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Valor da Despesa", text: $viewModel.expenseValue)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                        Button(action: {
                            viewModel.addExpense()
                        }) {
                            Text("Adicionar Despesa")
                        }
                    }
                    .padding()
                    .background(Color.red)
                    .cornerRadius(15)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 8)
                }
                
                Spacer()
            }
            .tabItem {
                Image(systemName: "dollarsign.circle.fill")
                Text("Gastos")
            }
            
            VStack {
                    
           }
           .tabItem {
               Image(systemName: "chart.bar.fill")
               Text("Estatísticas")
           }

           // Terceira aba - Login
            VStack {
                LoginView()
            }
           .tabItem {
               Image(systemName: "person.fill")
               Text("Login")
           }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
