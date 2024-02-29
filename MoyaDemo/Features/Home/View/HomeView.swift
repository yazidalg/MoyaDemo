//
//  HomeView.swift
//  MoyaDemo
//
//  Created by Yazid Al Ghozali on 14/02/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @ObservedObject var userModel: UserViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.searchItem) { user in
                        userRow(user)
                    }
                }
            }
            .searchable(text: $viewModel.searchField)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Home")
                        .font(.title)
                        .bold()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        viewModel.showSheet.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                    .sheet(isPresented: $viewModel.showSheet, content: {
                        AddUser(viewModel: userModel)
                            .presentationDetents([.medium, .large])
                            .presentationDragIndicator(.hidden)
                    })
                }
            }
            .onAppear {
                Task {
                    await viewModel.getAllUser()
                }
            }
            .refreshable {
                Task {
                    await viewModel.getAllUser()
                }
            }
            
        }
    }
}

extension HomeView {
    @ViewBuilder
    func userRow(_ user: User) -> some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: user.avatar ?? "")) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable()
                    case .failure(let error):
                        Text("Failed Load Image")
                    case .empty:
                        ProgressView()
                    default:
                        ProgressView()
                    }
                }
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                
                VStack(alignment: .leading) {
                    Text(user.fullName)
                        .bold()
                    Text(user.email ?? "")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Image(systemName: "heart")
                    .padding()
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(), userModel: UserViewModel())
}
