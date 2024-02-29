//
//  AddUser.swift
//  MoyaDemo
//
//  Created by Ahmad Fadli Akbar on 2/29/24.
//

import SwiftUI

struct AddUser: View {
    
    @ObservedObject var viewModel: UserViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $viewModel.nameField)
                TextField("Job", text: $viewModel.jobField)
                Button(action: {
                    Task {
                        await viewModel.postUser()
                    }
                }, label: {
                    Text("Simpan")
                })
                .onAppear {
                    Task {
                        await viewModel.postUser()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
        }
    }
}

#Preview {
    AddUser(viewModel: UserViewModel())
}
