# TextView
A TextView for SwiftUI

## Basic Usage
```swift
struct ContentView: View {
    @State var text: String = "This is a testing text."
    var body: some View {
        TextView(text: $text)  
    }
}
```

## Change Font Size
```swift
TextView(text: $text, font: UIFont.systemFont(ofSize: 17))
```

## Add Placeholder text
```swift
ZStack(alignment: .topLeading) {
    TextView(text: $text, font: UIFont.systemFont(ofSize: 17))
        .frame(height: 100)
    if text.isEmpty {
        Text("Type something...")
            .foregroundColor(.secondary)
            .offset(x: 5, y: 5)
        }
}
```
## More simpler way to add the placeholder for the text view
```swift
PlaceholderTextView("Description", text: self.$text)


