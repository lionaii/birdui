//
//  PostListView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostListView: View {
  @ObservedObject private var postHandler = PostViewModel()
  @State private var showingNewPostView = false

  var body: some View {
    // TODO: This should look exactly like the Birdie table view,
    // but with only one button.
//    Text("Layout header, new-post button, List of posts")
    // header
    VStack {
        HStack {
            Image("mascot_swift-badge")
                .resizable()
                .frame(width: 50, height: 50, alignment: .leading)
            Text("Home")
        }
        Button(action: {
            self.showingNewPostView = true
        }) {
            Text("add new post")
        }
        List {
            ForEach(postHandler.posts) { post in
                PostView(post: post)
            }
        }
        Spacer()
    }
    .sheet(isPresented: $showingNewPostView) {
        NewPostView(postHandler: self.postHandler)
    }
  }
}

struct PostListView_Previews: PreviewProvider {
  static var previews: some View {
    PostListView()
  }
}
