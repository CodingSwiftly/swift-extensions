extension CharacterSet {
  static let spaceCharSet: CharacterSet = {
    return CharacterSet(charactersIn: String.singleSpace)
  }()
  
  static let spaceTabCharSet: CharacterSet = {
    return CharacterSet(charactersIn: String.singleSpace + String.tabSpace)
  }()
  
  static let spaceTabNewLineCharSet: CharacterSet = {
    return CharacterSet(charactersIn: String.singleSpace + String.tabSpace + String.newLine)
  }()
}

extension String {
  static let emptyString = ""
  static let singleSpace = " "
  static let tabSpace = "\t"
  static let newLine = "\n"
  
  mutating func trimSingleLine() {
    self = words.joined(separator: String.singleSpace)
  }

  mutating func trimParagraph() {
    self = words.joined(separator: String.singleSpace)
  }
  
  mutating func trimMultiLines() {
    trimParagraph()
  }
  
  var singleLineWords:[String] {
    return components(separatedBy: CharacterSet.spaceTabCharSet).filter{$0 != String.emptyString}
  }
  
  var multiLineWords:[String] {
    return components(separatedBy: CharacterSet.spaceTabNewLineCharSet).filter{$0 != String.emptyString}
  }
  
  var words:[String] {
    return multiLineWords
  }
  
  func toCharacter() -> Character? {
    guard count == 1 else { return nil }
    return characters[index(startIndex, offsetBy: 0)]
  }
}
