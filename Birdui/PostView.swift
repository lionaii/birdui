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
  
  var body: some View {
    // TODO: This should look exactly like Birdie's table view cell.
    // The post text is left-aligned below the mascot image.
    // The image, if any, is horizontally centered in the view.
    VStack(alignment: .leading) {
        HStack {
            Image("mascot_swift-badge")
                .resizable()
                .frame(width: 30, height: 30, alignment: .leading)
            VStack {
                Text(post.userName)
                Text("TODO readable timestamp")
            }
        }
        Text(post.textBody ?? "")
        if post.uiImage != nil {
          Image(uiImage: post.uiImage!)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: imageSize, height: imageSize)
        }
    }
  }
}

struct PostView_Previews: PreviewProvider {
  static var previews: some View {
    PostView(post: MediaPost(textBody: "Went to the Aquarium today :]",
      userName: "Audrey", timestamp: Date(timeIntervalSinceNow: -9876),
      uiImage: UIImage(named: "octopus")))
  }
}
