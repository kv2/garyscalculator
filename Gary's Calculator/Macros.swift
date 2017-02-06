import Foundation

#if DEBUG
    func dLog(message: String, filename: String = #file, function: String = #function, line: Int = #line) {
        NSLog("%@","[\((filename as NSString).lastPathComponent):\(line)] \(function) - \(message)")
    }
#else
    func dLog(message: String, filename: String = #file, function: String = #function, line: Int = #line) {
    }
#endif
func aLog(message: String, filename: String = #file, function: String = #function, line: Int = #line) {
    NSLog("%@","[\((filename as NSString).lastPathComponent):\(line)] \(function) - \(message)")
}
