# InputField

`InputField` is a SwiftUI view that displays an input field with a header component, input component, and footnote component with a input counter. It uses an internal `InputFieldManager` object as its `ObservedObject` that handles the state and automatically changes appearance of the `InputField` depending on the user input.

### Initializer

- `init(inputText: String, maximumCharacters: Int)`: Initializes an `InputField` instance with the provided `inputText` and `maximumCharacters`. In the initializer the `InputFieldManager` manager object is created with the given input text and maximum character limit. Within `InputFieldManager` the state variable with type `InputFieldState` is initialized and together with the manager this will automatically handle the appearance of `InputField` depending on the state decided by the user input.

### View Hierarchy

- `VStack`:
  - `HeaderComponent`
  - `InputComponent`
  - `FootnoteComponent`

### EnvironmentObject Modifier

- `.environmentObject(manager)`: Sets the `manager` object as the environment object for the view so the components have access to the source of truth.

### Usage 

```
struct ContentView: View {
    @State var inputText: String = ""
    
    var body: some View {
        InputField(inputText: inputText, maximumInputCharacters: 8)
    }
}
```
---

