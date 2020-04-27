//
//  ContentView.swift
//  TextView
//
//  Created by Huynh Tan Phu on 4/27/20.
//  Copyright © 2020 Filesoft. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State var text: String = "This is a testing text."
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextView(text: $text, font: UIFont.systemFont(ofSize: 17))
                .frame(height: 100)
            if text.isEmpty {
                Text("Type something...")
                    .foregroundColor(.secondary)
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct TextView: UIViewRepresentable {
    @Binding var text: String
    var isScrollEnabled: Bool = true
    var font: UIFont? = UIFont.systemFont(ofSize: 17)
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let uiTextView = UITextView()
        uiTextView.isScrollEnabled = self.isScrollEnabled
        uiTextView.text = self.text
        uiTextView.font = self.font
        // remove all UITextView's padding
        uiTextView.textContainerInset = .zero
        uiTextView.textContainer.lineFragmentPadding = 0
        // add text view delegate
        uiTextView.delegate = context.coordinator
        return uiTextView
    }
    
    func updateUIView(_ uiTextView: UITextView, context: Context) {
        uiTextView.text = self.text
    }
    
    typealias UIViewType = UITextView
    
    class Coordinator: NSObject, UITextViewDelegate {
        let control: TextView
        
        init(_ control: TextView) {
            self.control = control
        }
        
        func textViewDidChange(_ textView: UITextView) {
            control.text = textView.text
        }
    }
}

struct PlaceholderTextView: View {
    var placeholder: String = ""
    @Binding var text: String
    var isScrollEnabled: Bool = true
    var font: UIFont? = UIFont.systemFont(ofSize: 17)
    
    init(_ placeholder: String = "", text: Binding<String>, isScrollEnabled: Bool = true, font: UIFont = UIFont.systemFont(ofSize: 17)) {
        self.placeholder = placeholder
        self._text = text
        self.isScrollEnabled = isScrollEnabled
        self.font = font
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            TextView(text: $text, font: UIFont.systemFont(ofSize: 17))
            if text.isEmpty {
                Text(self.placeholder)
                    .foregroundColor(.secondary)
            }
        }
    }
}
