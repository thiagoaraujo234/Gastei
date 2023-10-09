import Foundation
import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel = RegisterViewModel()
    @State private var isShowingRegistration = false
    @State private var isRegistrationActive = false
    
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
                    
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button(action: viewModel.register) {
                    Text("Registrar")
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
                        isRegistrationActive = true
                        isShowingRegistration.toggle()
                    }) {
                        // Use o NavigationLink para redirecionar para a tela de registro
                        NavigationLink(destination: LoginView()) {
                            Text("Já tenho uma conta")
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.blue)
                        }
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

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
