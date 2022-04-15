//
//  SignInView.swift
//  Ichat
//
//  Created by silvarlei soares on 28/03/22.
//

import SwiftUI

struct SignInView: View {
    
    var body: some View {
        NavigationView{
            Container()
            
        }
       
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignInView()
        }
    }
    
    
    
}
struct Container :View{
    @StateObject var viewModel = SignViewModel()
    var body: some View {
        
        
        VStack{
            
            Text("📝")
                .padding()
                .font(.system(size: 100))
            
            TextField("Entre com seu email" , text: $viewModel.email)
                .padding()
                .border(Color(UIColor.separator))
                .autocapitalization(.none)
                .disableAutocorrection(false)
                .background(Color.white)
                .cornerRadius(24.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 24.0)
                        .strokeBorder(Color(UIColor.separator),
                                      style: StrokeStyle(lineWidth:1.0))
                )
                .padding(.bottom,20.0)
            
            SecureField("Entre com sua senha " , text: $viewModel.senha)
                .padding()
                .border(Color(UIColor.separator))
                .background(Color.white)
                .cornerRadius(24.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 24.0)
                        .strokeBorder(Color(UIColor.separator),
                                      style: StrokeStyle(lineWidth:1.0))
                )
                .padding(.bottom,20.0)
            
            if viewModel.isLoading{
                ProgressView()
                    .padding()
            }
            
            Button {
                viewModel.singIn()
            }label:{
                Text("enter")
                
                    .padding()
                    .frame(maxWidth:.infinity)
                    .foregroundColor(Color.white)
                    .background(Color("GreenColor"))
            }
            
            .alert(isPresented: $viewModel.formInvalid) {
                Alert(title:Text(viewModel.alerttext))
            }
            
            Divider()
                .padding()
            
            NavigationLink(
                destination: SignUpView()){
                    Text("Ainda nao sou cadastrado")
                        .padding()
                        .frame(maxWidth:.infinity)
                        .foregroundColor(Color.white)
                }
            
            
            Divider()
                .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal,32)
        .background(Color("Fundo"))
        .navigationTitle("Login")
        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}


