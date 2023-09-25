import Combine

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var isLoggedIn = false
    @Published var errorMessage = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    func login() {
        // Implemente a lógica de autenticação aqui e atualize isLoggedIn e errorMessage de acordo.
        // Exemplo simplificado:
        
        if username == "usuarioteste" && password == "senhateste" {
            isLoggedIn = true
            errorMessage = ""
        } else {
            isLoggedIn = false
            errorMessage = "Credenciais inválidas"
        }
    }
}
