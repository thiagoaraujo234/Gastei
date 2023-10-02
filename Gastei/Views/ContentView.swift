import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = BudgetViewModel()
    
    var body: some View {
        TabView {
            // Primeira aba
            VStack {
                GastosView()
            }
            .tabItem {
                Image(systemName: "dollarsign.circle.fill")
                Text("Gastos")
            }
            
            VStack {
                Text("Estatisticas")
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
