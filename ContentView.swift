//
//  ContentView.swift
//  week8
//
//  Created by 王竣翔 on 2022/12/7.
//

import SwiftUI

struct ContentView: View {
    
    @State var userName: String = ""
    @State var password: String = ""
    @State var showAlert: Bool = false
    @State var showSheet: Bool = false
    
    var body: some View {
        
        VStack {
            TextField("請輸入帳號", text: $userName)
                .textFieldStyle(.roundedBorder)
                .shadow(radius: 10)
                .padding()
            SecureField("請輸入密碼", text: $password)
                .textFieldStyle(.roundedBorder)
                .shadow(radius: 10)
                .padding()
            Button {
                if userName == "FCUiOSClub" && password == "123" {
                    showSheet.toggle()
                } else {
                    showAlert.toggle()
                }
            } label: {
                Text("登入")
                    .font(.title)
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
                
            }
        }
        .sheet(isPresented: $showSheet, content: {
            Text("成功登入 歡迎")
            Button(action: {
                showSheet = false
            }, label: {
                Text("登出")
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
            })
        })
        .alert(isPresented: $showAlert) {
            Alert(title: Text("錯誤"), message: Text("帳號密碼錯誤"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
