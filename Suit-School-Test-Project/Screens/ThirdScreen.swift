//
//  ThirdScreen.swift
//  Suit-School-Test-Project
//
//  Created by ahmadfarhanqf on 08/06/26.
//

import SwiftUI

struct ThirdScreen: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = UserListViewModel()
    
    let onUserSelected: (UserModel) -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(title: "Third Screen") {
                dismiss()
            }
            
            contentView
        }
        .navigationBarBackButtonHidden(true)
        .background(Color.white)
        .task {
            if viewModel.users.isEmpty {
                await viewModel.loadInitialUsers()
            }
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        if viewModel.isLoading {
            ProgressView("Loading users...")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else if viewModel.isEmpty {
            EmptyStateView()
                .refreshable {
                    await viewModel.refreshUsers()
                }
        } else {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.users) { user in
                        Button {
                            onUserSelected(user)
                            dismiss()
                        } label: {
                            VStack(spacing: 0) {
                                UserRowView(user: user)
                                
                                Divider()
                                    .padding(.leading, 28)
                                    .padding(.trailing, 28)
                            }
                        }
                        .buttonStyle(.plain)
                        .task {
                            await viewModel.loadMoreUsersIfNeeded(currentUser: user)
                        }
                    }
                    
                    if viewModel.isLoadingMore {
                        ProgressView()
                            .padding(.vertical, 24)
                    }
                }
                .padding(.top, 24)
            }
            .refreshable {
                await viewModel.refreshUsers()
            }
            .overlay(alignment: .bottom) {
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red.opacity(0.9))
                        .cornerRadius(12)
                        .padding(.bottom, 16)
                }
            }
        }
    }
}
