extension String {
  static let emptyString = ""
  static let singleSpace = " "
  static let newLine = "\n"
  
  var isValid: Bool {
    return (self != nil && self != String.emptyString)
  }
  
  var singleLineWords:[String]? { // returns array of trimmed words/strings
    guard !contains(String.newLine) else { return nil }
    return components(separatedBy: CharacterSet.whitespaces).filter{$0.isValid}
  }
  
  var multiLineWords:[String] { // returns array of trimmed 'lines'
    if contains(String.newLine) {
      return components(separatedBy: CharacterSet.newlines).filter{$0.isValid}.map{$0.trimmedString() ?? ""}
    }
    return components(separatedBy: CharacterSet.whitespacesAndNewlines).filter{$0.isValid}
  }
  
  var words:[String] { // returns array of trimmed words/strings. Joins lines
    return components(separatedBy: CharacterSet.whitespacesAndNewlines).filter{$0.isValid}
  }
  
  func trimmedString() -> String? {
    guard let snglLineWrds = singleLineWords else { return nil }
    return snglLineWrds.joined(separator: String.singleSpace)
  }
  
  mutating func trimSingleLine() {
    if let trimmedString = trimmedString() {
      self = trimmedString
    }
  }

  mutating func trimMultiLines() {
    self = multiLineWords.joined(separator: String.newLine)
  }
  
  mutating func trimParagraph() {
    self = words.joined(separator: String.singleSpace)
  }
  
  func toCharacter() -> Character? {
    guard count == 1 else { return nil }
    return characters[index(startIndex, offsetBy: 0)]
  }
}
