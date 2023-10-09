import Combine

class RegisterViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var email = ""
    @Published var errorMessage = ""
    @Published var users : [User] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    func register() {
        if (username.count <= 3) {
            errorMessage = "digite um nome de usuário válido"
            return
        }
        if (password.count <= 5) {
            errorMessage = "digite uma senha de no mínimo 5 digitos"
        }
        if (!isValidEmail(email: email)) {
            errorMessage = "digite um email válido"
        }
        if (users.first(where: {$0.email == email}) == nil) {
            errorMessage = "Email já existe tente outro!!! hehehe tankyou!!!"
        }
        print(users)
    }
    
    // Função para verificar se um email é válido usando expressão regular
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"

        if let _ = email.range(of: emailRegex, options: .regularExpression) {
            return true
        } else {
            return false
        }
    }

}
