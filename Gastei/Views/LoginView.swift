import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()
    @State private var isShowingRegistration = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Bem-vindo")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 10) {
                    TextField("Nome de usuário", text: $viewModel.username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    SecureField("Senha", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button(action: viewModel.login) {
                    Text("Entrar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    Button(action: {
                        isShowingRegistration.toggle()
                    }) {
                        Text("Cadastre-se aqui")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.blue)
                            
                        
                    }
                    .padding(.bottom) // Adiciona espaço abaixo do botão
                    .sheet(isPresented: $isShowingRegistration) {
                        //CHAMADA DA TELA 
                    }
                }
                
                Spacer() // Espaço flexível para centralizar verticalmente
            }
            .padding() // Adiciona margem externa
            .background(Color.clear) // Cria espaço uniforme acima e abaixo
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Centraliza verticalmente
    
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}