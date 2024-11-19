//
//  MarkdownStrikethrough.swift
//  Pods
//
//  Created by _ on _.
//
//
import UIKit

open class MarkdownStrikethrough: MarkdownCommonElement {
  fileprivate static let regex = "(.?|^)(\\~\\~)(?=\\S)(.+?)(?<=\\S)(\\2)"
  
  open var font: MarkdownFont?
  open var color: MarkdownColor?
  open var paragraphStyle: MarkdownParagraphStyle?
  
  open var regex: String {
    return MarkdownStrikethrough.regex
  }
  
  public init(font: MarkdownFont? = nil, color: MarkdownColor? = nil,
              paragraphStyle: MarkdownParagraphStyle? = nil) {
    self.font = font
    self.color = color
    self.paragraphStyle = paragraphStyle
  }

  public func match(_ match: NSTextCheckingResult, attributedString: NSMutableAttributedString) {
    attributedString.deleteCharacters(in: match.range(at: 4))

    attributedString.addAttribute(
      NSAttributedString.Key.strikethroughStyle,
      value: NSNumber.init(value: NSUnderlineStyle.single.rawValue),
      range: match.range(at: 3)
    )

    attributedString.deleteCharacters(in: match.range(at: 2))
  }
}
