//
//  HomeView.swift
//  MoyaDemo
//
//  Created by Yazid Al Ghozali on 14/02/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.userList) { user in
                        userRow(user)
                    }
                }
            }
            .navigationTitle("Home")
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
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
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
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
