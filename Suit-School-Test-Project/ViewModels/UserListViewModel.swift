//
//  UserListViewModel.swift
//  Suit-School-Test-Project
//
//  Created by ahmadfarhanqf on 08/06/26.
//

import Foundation
import Combine

@MainActor
final class UserListViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    @Published var isLoading: Bool = false
    @Published var isLoadingMore: Bool = false
    @Published var errorMessage: String?
    
    private let userService = UserService()
    
    private var currentPage = 1
    private var totalPages = 1
    private let perPage = 6
    
    var isEmpty: Bool {
        users.isEmpty && !isLoading
    }
    
    func loadInitialUsers() async {
        currentPage = 1
        totalPages = 1
        users.removeAll()
        await fetchUsers(isInitialLoad: true)
    }
    
    func refreshUsers() async {
        currentPage = 1
        totalPages = 1
        users.removeAll()
        await fetchUsers(isInitialLoad: true)
    }
    
    func loadMoreUsersIfNeeded(currentUser: UserModel) async {
        guard currentUser == users.last else { return }
        guard currentPage < totalPages else { return }
        guard !isLoadingMore else { return }
        
        currentPage += 1
        await fetchUsers(isInitialLoad: false)
    }
    
    private func fetchUsers(isInitialLoad: Bool) async {
        if isInitialLoad {
            isLoading = true
        } else {
            isLoadingMore = true
        }
        
        errorMessage = nil
        
        do {
            let response = try await userService.fetchUsers(
                page: currentPage,
                perPage: perPage
            )
            
            totalPages = response.totalPages
            
            if isInitialLoad {
                users = response.data
            } else {
                users.append(contentsOf: response.data)
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
        isLoadingMore = false
    }
}
