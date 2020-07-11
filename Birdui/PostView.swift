//
//  PostView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostView: View {
  let post: MediaPost
    
  let imageSize: CGFloat = 200
  
  static let postDateFormat: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
  }()
  
  var body: some View {
    // TODO: This should look exactly like Birdie's table view cell.
    // The post text is left-aligned below the mascot image.
    // The image, if any, is horizontally centered in the view.
    VStack(alignment: .leading){
        HStack {
            Image("mascot_swift-badge")
                .resizable()
                .frame(width: 50, height: 50, alignment: .leading)
          VStack(alignment: .leading) {
            Text(post.userName)
            Text("\(post.timestamp, formatter: Self.postDateFormat)")
            }
        }
      Text(post.textBody ?? "")
        .multilineTextAlignment(.leading)
        if post.uiImage != nil {
          Image(uiImage: post.uiImage!)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100, alignment: .center)
        }
    }
  }
}

struct PostView_Previews: PreviewProvider {
  static var previews: some View {
    Group{
      PostView(post: MediaPost(textBody: "Went to the Aquarium today :]",
                               userName: "Audrey", timestamp: Date(timeIntervalSinceNow: -9876),
                               uiImage: UIImage(named: "octopus")))
      
      PostView(post: MediaPost(textBody: "This is my favorite social media app! This is my favorite social media app! This is my favorite social media app!", userName: "Jeff", timestamp: Date(timeIntervalSinceNow: -2345), uiImage: nil))
    }
    
  }
}
