// DO NOT EDIT.
// swift-format-ignore-file
// swiftlint:disable all
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: signatures.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

enum Signatures_Tag: SwiftProtobuf.Enum, Swift.CaseIterable {
  typealias RawValue = Int
  case signatureType // = 0
  case domain // = 1
  case personalization // = 2
  case epoch // = 3
  case expiresAt // = 4
  case counter // = 5
  case challenge // = 6
  case flags // = 7
  case requestHash // = 8
  case fault // = 9
  case end // = 255
  case UNRECOGNIZED(Int)

  init() {
    self = .signatureType
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .signatureType
    case 1: self = .domain
    case 2: self = .personalization
    case 3: self = .epoch
    case 4: self = .expiresAt
    case 5: self = .counter
    case 6: self = .challenge
    case 7: self = .flags
    case 8: self = .requestHash
    case 9: self = .fault
    case 255: self = .end
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .signatureType: return 0
    case .domain: return 1
    case .personalization: return 2
    case .epoch: return 3
    case .expiresAt: return 4
    case .counter: return 5
    case .challenge: return 6
    case .flags: return 7
    case .requestHash: return 8
    case .fault: return 9
    case .end: return 255
    case .UNRECOGNIZED(let i): return i
    }
  }

  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static let allCases: [Signatures_Tag] = [
    .signatureType,
    .domain,
    .personalization,
    .epoch,
    .expiresAt,
    .counter,
    .challenge,
    .flags,
    .requestHash,
    .fault,
    .end,
  ]

}

enum Signatures_SignatureType: SwiftProtobuf.Enum, Swift.CaseIterable {
  typealias RawValue = Int
  case aesGcm // = 0
  case aesGcmPersonalized // = 5
  case hmac // = 6
  case hmacPersonalized // = 8
  case aesGcmResponse // = 9
  case UNRECOGNIZED(Int)

  init() {
    self = .aesGcm
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .aesGcm
    case 5: self = .aesGcmPersonalized
    case 6: self = .hmac
    case 8: self = .hmacPersonalized
    case 9: self = .aesGcmResponse
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .aesGcm: return 0
    case .aesGcmPersonalized: return 5
    case .hmac: return 6
    case .hmacPersonalized: return 8
    case .aesGcmResponse: return 9
    case .UNRECOGNIZED(let i): return i
    }
  }

  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static let allCases: [Signatures_SignatureType] = [
    .aesGcm,
    .aesGcmPersonalized,
    .hmac,
    .hmacPersonalized,
    .aesGcmResponse,
  ]

}

enum Signatures_Session_Info_Status: SwiftProtobuf.Enum, Swift.CaseIterable {
  typealias RawValue = Int
  case ok // = 0
  case keyNotOnWhitelist // = 1
  case UNRECOGNIZED(Int)

  init() {
    self = .ok
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .ok
    case 1: self = .keyNotOnWhitelist
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .ok: return 0
    case .keyNotOnWhitelist: return 1
    case .UNRECOGNIZED(let i): return i
    }
  }

  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static let allCases: [Signatures_Session_Info_Status] = [
    .ok,
    .keyNotOnWhitelist,
  ]

}

struct Signatures_KeyIdentity: @unchecked Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var identityType: Signatures_KeyIdentity.OneOf_IdentityType? = nil

  var publicKey: Data {
    get {
      if case .publicKey(let v)? = identityType {return v}
      return Data()
    }
    set {identityType = .publicKey(newValue)}
  }

  var handle: UInt32 {
    get {
      if case .handle(let v)? = identityType {return v}
      return 0
    }
    set {identityType = .handle(newValue)}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum OneOf_IdentityType: Equatable, @unchecked Sendable {
    case publicKey(Data)
    case handle(UInt32)

  }

  init() {}
}

struct Signatures_AES_GCM_Personalized_Signature_Data: @unchecked Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var epoch: Data = Data()

  var nonce: Data = Data()

  var counter: UInt32 = 0

  var expiresAt: UInt32 = 0

  var tag: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Signatures_AES_GCM_Response_Signature_Data: @unchecked Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var nonce: Data = Data()

  var counter: UInt32 = 0

  var tag: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Signatures_HMAC_Signature_Data: @unchecked Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var tag: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Signatures_HMAC_Personalized_Signature_Data: @unchecked Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var epoch: Data = Data()

  var counter: UInt32 = 0

  var expiresAt: UInt32 = 0

  var tag: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Signatures_SignatureData: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var signerIdentity: Signatures_KeyIdentity {
    get {return _signerIdentity ?? Signatures_KeyIdentity()}
    set {_signerIdentity = newValue}
  }
  /// Returns true if `signerIdentity` has been explicitly set.
  var hasSignerIdentity: Bool {return self._signerIdentity != nil}
  /// Clears the value of `signerIdentity`. Subsequent reads from it will return its default value.
  mutating func clearSignerIdentity() {self._signerIdentity = nil}

  var sigType: Signatures_SignatureData.OneOf_SigType? = nil

  var aesGcmPersonalizedData: Signatures_AES_GCM_Personalized_Signature_Data {
    get {
      if case .aesGcmPersonalizedData(let v)? = sigType {return v}
      return Signatures_AES_GCM_Personalized_Signature_Data()
    }
    set {sigType = .aesGcmPersonalizedData(newValue)}
  }

  var sessionInfoTag: Signatures_HMAC_Signature_Data {
    get {
      if case .sessionInfoTag(let v)? = sigType {return v}
      return Signatures_HMAC_Signature_Data()
    }
    set {sigType = .sessionInfoTag(newValue)}
  }

  var hmacPersonalizedData: Signatures_HMAC_Personalized_Signature_Data {
    get {
      if case .hmacPersonalizedData(let v)? = sigType {return v}
      return Signatures_HMAC_Personalized_Signature_Data()
    }
    set {sigType = .hmacPersonalizedData(newValue)}
  }

  var aesGcmResponseData: Signatures_AES_GCM_Response_Signature_Data {
    get {
      if case .aesGcmResponseData(let v)? = sigType {return v}
      return Signatures_AES_GCM_Response_Signature_Data()
    }
    set {sigType = .aesGcmResponseData(newValue)}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum OneOf_SigType: Equatable, Sendable {
    case aesGcmPersonalizedData(Signatures_AES_GCM_Personalized_Signature_Data)
    case sessionInfoTag(Signatures_HMAC_Signature_Data)
    case hmacPersonalizedData(Signatures_HMAC_Personalized_Signature_Data)
    case aesGcmResponseData(Signatures_AES_GCM_Response_Signature_Data)

  }

  init() {}

  fileprivate var _signerIdentity: Signatures_KeyIdentity? = nil
}

struct Signatures_GetSessionInfoRequest: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var keyIdentity: Signatures_KeyIdentity {
    get {return _keyIdentity ?? Signatures_KeyIdentity()}
    set {_keyIdentity = newValue}
  }
  /// Returns true if `keyIdentity` has been explicitly set.
  var hasKeyIdentity: Bool {return self._keyIdentity != nil}
  /// Clears the value of `keyIdentity`. Subsequent reads from it will return its default value.
  mutating func clearKeyIdentity() {self._keyIdentity = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _keyIdentity: Signatures_KeyIdentity? = nil
}

struct Signatures_SessionInfo: @unchecked Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var counter: UInt32 = 0

  var publicKey: Data = Data()

  var epoch: Data = Data()

  var clockTime: UInt32 = 0

  var status: Signatures_Session_Info_Status = .ok

  var handle: UInt32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "Signatures"

extension Signatures_Tag: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "TAG_SIGNATURE_TYPE"),
    1: .same(proto: "TAG_DOMAIN"),
    2: .same(proto: "TAG_PERSONALIZATION"),
    3: .same(proto: "TAG_EPOCH"),
    4: .same(proto: "TAG_EXPIRES_AT"),
    5: .same(proto: "TAG_COUNTER"),
    6: .same(proto: "TAG_CHALLENGE"),
    7: .same(proto: "TAG_FLAGS"),
    8: .same(proto: "TAG_REQUEST_HASH"),
    9: .same(proto: "TAG_FAULT"),
    255: .same(proto: "TAG_END"),
  ]
}

extension Signatures_SignatureType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "SIGNATURE_TYPE_AES_GCM"),
    5: .same(proto: "SIGNATURE_TYPE_AES_GCM_PERSONALIZED"),
    6: .same(proto: "SIGNATURE_TYPE_HMAC"),
    8: .same(proto: "SIGNATURE_TYPE_HMAC_PERSONALIZED"),
    9: .same(proto: "SIGNATURE_TYPE_AES_GCM_RESPONSE"),
  ]
}

extension Signatures_Session_Info_Status: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "SESSION_INFO_STATUS_OK"),
    1: .same(proto: "SESSION_INFO_STATUS_KEY_NOT_ON_WHITELIST"),
  ]
}

extension Signatures_KeyIdentity: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".KeyIdentity"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "public_key"),
    3: .same(proto: "handle"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try {
        var v: Data?
        try decoder.decodeSingularBytesField(value: &v)
        if let v = v {
          if self.identityType != nil {try decoder.handleConflictingOneOf()}
          self.identityType = .publicKey(v)
        }
      }()
      case 3: try {
        var v: UInt32?
        try decoder.decodeSingularUInt32Field(value: &v)
        if let v = v {
          if self.identityType != nil {try decoder.handleConflictingOneOf()}
          self.identityType = .handle(v)
        }
      }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    switch self.identityType {
    case .publicKey?: try {
      guard case .publicKey(let v)? = self.identityType else { preconditionFailure() }
      try visitor.visitSingularBytesField(value: v, fieldNumber: 1)
    }()
    case .handle?: try {
      guard case .handle(let v)? = self.identityType else { preconditionFailure() }
      try visitor.visitSingularUInt32Field(value: v, fieldNumber: 3)
    }()
    case nil: break
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Signatures_KeyIdentity, rhs: Signatures_KeyIdentity) -> Bool {
    if lhs.identityType != rhs.identityType {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Signatures_AES_GCM_Personalized_Signature_Data: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".AES_GCM_Personalized_Signature_Data"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "epoch"),
    2: .same(proto: "nonce"),
    3: .same(proto: "counter"),
    4: .standard(proto: "expires_at"),
    5: .same(proto: "tag"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.epoch) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.nonce) }()
      case 3: try { try decoder.decodeSingularUInt32Field(value: &self.counter) }()
      case 4: try { try decoder.decodeSingularFixed32Field(value: &self.expiresAt) }()
      case 5: try { try decoder.decodeSingularBytesField(value: &self.tag) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.epoch.isEmpty {
      try visitor.visitSingularBytesField(value: self.epoch, fieldNumber: 1)
    }
    if !self.nonce.isEmpty {
      try visitor.visitSingularBytesField(value: self.nonce, fieldNumber: 2)
    }
    if self.counter != 0 {
      try visitor.visitSingularUInt32Field(value: self.counter, fieldNumber: 3)
    }
    if self.expiresAt != 0 {
      try visitor.visitSingularFixed32Field(value: self.expiresAt, fieldNumber: 4)
    }
    if !self.tag.isEmpty {
      try visitor.visitSingularBytesField(value: self.tag, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Signatures_AES_GCM_Personalized_Signature_Data, rhs: Signatures_AES_GCM_Personalized_Signature_Data) -> Bool {
    if lhs.epoch != rhs.epoch {return false}
    if lhs.nonce != rhs.nonce {return false}
    if lhs.counter != rhs.counter {return false}
    if lhs.expiresAt != rhs.expiresAt {return false}
    if lhs.tag != rhs.tag {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Signatures_AES_GCM_Response_Signature_Data: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".AES_GCM_Response_Signature_Data"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "nonce"),
    2: .same(proto: "counter"),
    3: .same(proto: "tag"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.nonce) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.counter) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.tag) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.nonce.isEmpty {
      try visitor.visitSingularBytesField(value: self.nonce, fieldNumber: 1)
    }
    if self.counter != 0 {
      try visitor.visitSingularUInt32Field(value: self.counter, fieldNumber: 2)
    }
    if !self.tag.isEmpty {
      try visitor.visitSingularBytesField(value: self.tag, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Signatures_AES_GCM_Response_Signature_Data, rhs: Signatures_AES_GCM_Response_Signature_Data) -> Bool {
    if lhs.nonce != rhs.nonce {return false}
    if lhs.counter != rhs.counter {return false}
    if lhs.tag != rhs.tag {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Signatures_HMAC_Signature_Data: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".HMAC_Signature_Data"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "tag"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.tag) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.tag.isEmpty {
      try visitor.visitSingularBytesField(value: self.tag, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Signatures_HMAC_Signature_Data, rhs: Signatures_HMAC_Signature_Data) -> Bool {
    if lhs.tag != rhs.tag {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Signatures_HMAC_Personalized_Signature_Data: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".HMAC_Personalized_Signature_Data"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "epoch"),
    2: .same(proto: "counter"),
    3: .standard(proto: "expires_at"),
    4: .same(proto: "tag"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.epoch) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.counter) }()
      case 3: try { try decoder.decodeSingularFixed32Field(value: &self.expiresAt) }()
      case 4: try { try decoder.decodeSingularBytesField(value: &self.tag) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.epoch.isEmpty {
      try visitor.visitSingularBytesField(value: self.epoch, fieldNumber: 1)
    }
    if self.counter != 0 {
      try visitor.visitSingularUInt32Field(value: self.counter, fieldNumber: 2)
    }
    if self.expiresAt != 0 {
      try visitor.visitSingularFixed32Field(value: self.expiresAt, fieldNumber: 3)
    }
    if !self.tag.isEmpty {
      try visitor.visitSingularBytesField(value: self.tag, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Signatures_HMAC_Personalized_Signature_Data, rhs: Signatures_HMAC_Personalized_Signature_Data) -> Bool {
    if lhs.epoch != rhs.epoch {return false}
    if lhs.counter != rhs.counter {return false}
    if lhs.expiresAt != rhs.expiresAt {return false}
    if lhs.tag != rhs.tag {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Signatures_SignatureData: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SignatureData"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "signer_identity"),
    5: .standard(proto: "AES_GCM_Personalized_data"),
    6: .standard(proto: "session_info_tag"),
    8: .standard(proto: "HMAC_Personalized_data"),
    9: .standard(proto: "AES_GCM_Response_data"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._signerIdentity) }()
      case 5: try {
        var v: Signatures_AES_GCM_Personalized_Signature_Data?
        var hadOneofValue = false
        if let current = self.sigType {
          hadOneofValue = true
          if case .aesGcmPersonalizedData(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.sigType = .aesGcmPersonalizedData(v)
        }
      }()
      case 6: try {
        var v: Signatures_HMAC_Signature_Data?
        var hadOneofValue = false
        if let current = self.sigType {
          hadOneofValue = true
          if case .sessionInfoTag(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.sigType = .sessionInfoTag(v)
        }
      }()
      case 8: try {
        var v: Signatures_HMAC_Personalized_Signature_Data?
        var hadOneofValue = false
        if let current = self.sigType {
          hadOneofValue = true
          if case .hmacPersonalizedData(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.sigType = .hmacPersonalizedData(v)
        }
      }()
      case 9: try {
        var v: Signatures_AES_GCM_Response_Signature_Data?
        var hadOneofValue = false
        if let current = self.sigType {
          hadOneofValue = true
          if case .aesGcmResponseData(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.sigType = .aesGcmResponseData(v)
        }
      }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._signerIdentity {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    switch self.sigType {
    case .aesGcmPersonalizedData?: try {
      guard case .aesGcmPersonalizedData(let v)? = self.sigType else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    }()
    case .sessionInfoTag?: try {
      guard case .sessionInfoTag(let v)? = self.sigType else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
    }()
    case .hmacPersonalizedData?: try {
      guard case .hmacPersonalizedData(let v)? = self.sigType else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 8)
    }()
    case .aesGcmResponseData?: try {
      guard case .aesGcmResponseData(let v)? = self.sigType else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 9)
    }()
    case nil: break
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Signatures_SignatureData, rhs: Signatures_SignatureData) -> Bool {
    if lhs._signerIdentity != rhs._signerIdentity {return false}
    if lhs.sigType != rhs.sigType {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Signatures_GetSessionInfoRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetSessionInfoRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "key_identity"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._keyIdentity) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._keyIdentity {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Signatures_GetSessionInfoRequest, rhs: Signatures_GetSessionInfoRequest) -> Bool {
    if lhs._keyIdentity != rhs._keyIdentity {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Signatures_SessionInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SessionInfo"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "counter"),
    2: .same(proto: "publicKey"),
    3: .same(proto: "epoch"),
    4: .standard(proto: "clock_time"),
    5: .same(proto: "status"),
    6: .same(proto: "handle"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt32Field(value: &self.counter) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.publicKey) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.epoch) }()
      case 4: try { try decoder.decodeSingularFixed32Field(value: &self.clockTime) }()
      case 5: try { try decoder.decodeSingularEnumField(value: &self.status) }()
      case 6: try { try decoder.decodeSingularUInt32Field(value: &self.handle) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.counter != 0 {
      try visitor.visitSingularUInt32Field(value: self.counter, fieldNumber: 1)
    }
    if !self.publicKey.isEmpty {
      try visitor.visitSingularBytesField(value: self.publicKey, fieldNumber: 2)
    }
    if !self.epoch.isEmpty {
      try visitor.visitSingularBytesField(value: self.epoch, fieldNumber: 3)
    }
    if self.clockTime != 0 {
      try visitor.visitSingularFixed32Field(value: self.clockTime, fieldNumber: 4)
    }
    if self.status != .ok {
      try visitor.visitSingularEnumField(value: self.status, fieldNumber: 5)
    }
    if self.handle != 0 {
      try visitor.visitSingularUInt32Field(value: self.handle, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Signatures_SessionInfo, rhs: Signatures_SessionInfo) -> Bool {
    if lhs.counter != rhs.counter {return false}
    if lhs.publicKey != rhs.publicKey {return false}
    if lhs.epoch != rhs.epoch {return false}
    if lhs.clockTime != rhs.clockTime {return false}
    if lhs.status != rhs.status {return false}
    if lhs.handle != rhs.handle {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
