//
//  CardDetail.swift
//  Framewerk
//
//  Created by Michael Neas on 2/29/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//

import SwiftUI

struct CardDetail: View {
    @ObservedObject var card: Card
    @State var textHeight: CGFloat = 150
    @State var link: String
    
    var body: some View {
        Form {
            Section(header: Text("Title").foregroundColor(.black)) {
                TextField("Title", text: $card.question)
            }
            Section(header: Text("Description").foregroundColor(.black)) {
                ScrollView {
                    TextView(placeholder: "Card Solution", text: $card.answer, minHeight: 100.0, calculatedHeight: $textHeight)
                }.frame(minHeight: self.textHeight, maxHeight: self.textHeight)
            }
            Section(header: Text("Link").foregroundColor(.black)) {
                TextField("Link", text: $link)
            }
        }.background(Color(UIColor.systemGray)).edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle("Edit")
        .navigationBarItems(trailing:
            Button(action: {}) {
                Text("Save")
            }
        )
    }
}

struct CardDetail_Previews: PreviewProvider {
    static var previews: some View {
        CardDetail(card: Card.test, link: Card.test.link.absoluteString)
    }
}
