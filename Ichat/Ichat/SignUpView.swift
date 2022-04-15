//
//  SignUpView.swift
//  Ichat
//
//  Created by silvarlei soares on 28/03/22.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        // NavigationView{
        ContainerSignUp()
        //}
    }
}

struct ContainerSignUp :View{
    
    @StateObject var viewModel = SignUpViewModel()
    @State var isShowPhotoLibrary = false

    init(){
        SignUpViewModel().delegateSignUp.self
    }
   
    
    var body: some View {
        
        
        VStack{
            
            Button{
                isShowPhotoLibrary = true
            }label: {
                if viewModel.image.size.width > 0 {
                    Image(uiImage: viewModel.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 130)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color("GreenColor"),
                                        lineWidth:4.0))
                                .shadow(radius: 7)
                            }else{
                                Text("Foto")
                                    .frame(width: 130, height: 130)
                                    .padding()
                                    .background(Color("GreenColor"))
                                    .foregroundColor(Color.white)
                                    .cornerRadius(100.0)
                            }
                            }
                                .padding(.bottom,32)
                                .sheet(isPresented: $isShowPhotoLibrary){
                                    ImagePicker(selectedImage: $viewModel.image)
                                }
                            
                            TextField("Entre com seu Nome" , text: $viewModel.nome)
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
                            
                            TextField("Entre com seu Email" , text: $viewModel.email)
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
                            
                            if viewModel.isLoading {
                                ProgressView()
                                    .padding()
                            }
                            
                            Button {
                                viewModel.singUp()
                            }label:{
                                Text("Salvar")
                                
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
                            
                            
                            
                            Divider()
                                .padding()
                            
                            }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.horizontal,32)
                                .background(Color("Fundo"))
                            
                            }
                            }
                            
                            struct SignUpView_Previews: PreviewProvider {
                                static var previews: some View {
                                    SignUpView()
                                }
                            }




extension SignUpView : SignUpDelegate {
   
    
    func Cadastrado() {
   
        var body: some View {
            Text( "Usuario Cadastrado com Sucesso")
        }
            
    }
    
  
    
    
    
}
