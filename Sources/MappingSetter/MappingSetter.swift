@propertyWrapper
public struct MappingSetter<Value> {
    private var value: Value!
    private let mappingSetter: (Value) -> Value
    
    public var wrappedValue: Value {
        get { value }
        set { value = mappingSetter(newValue) }
    }
    
    public init(wrappedValue: Value) {
        self.mappingSetter = { return $0 }
        self.wrappedValue = wrappedValue
    }
    
    public init(wrappedValue: Value, mappingSetter: (Value) -> Value) {
        self.mappingSetter = mappingSetter
        self.wrappedValue = wrappedValue
    }
}
