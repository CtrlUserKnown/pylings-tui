import Foundation
import Darwin

// MARK: - ANSI Helpers

enum Attr: Int {
    case reset = 0, bold = 1, dim = 2, reverse = 7
    case green = 32, red = 31, yellow = 33, cyan = 36, white = 37
    case bgBlue = 44, bgGray = 100
}

func ansi(_ attrs: Attr...) -> String {
    "\u{1B}[\(attrs.map(\.rawValue).map(String.init).joined(separator: ";"))m"
}

let S = ansi()  // reset
let BOLD = ansi(.bold)
let DIM = ansi(.dim)
let REV = ansi(.reverse)
let GREEN = ansi(.green)
let RED = ansi(.red)
let YELLOW = ansi(.yellow)
let CYAN = ansi(.cyan)
let WHITE = ansi(.white)
let BG_BLUE = ansi(.bgBlue)
let BG_GRAY = ansi(.bgGray)

func cls() { write("\u{1B}[2J\u{1B}[H") }
func hideCursor() { write("\u{1B}[?25l") }
func showCursor() { write("\u{1B}[?25h") }
func write(_ s: String) { FileHandle.standardOutput.write(Data(s.utf8)) }

func terminalSize() -> (rows: Int, cols: Int) {
    var w = winsize()
    if ioctl(STDOUT_FILENO, TIOCGWINSZ, &w) == 0, w.ws_row > 0 {
        return (Int(w.ws_row), Int(w.ws_col))
    }
    return (24, 80)
}

// MARK: - Raw Terminal Mode

func enableRaw() -> termios {
    var raw = termios()
    tcgetattr(STDIN_FILENO, &raw)
    let orig = raw
    raw.c_lflag &= ~UInt(ECHO | ICANON | ISIG | IEXTEN)
    raw.c_iflag &= ~UInt(BRKINT | ICRNL | INPCK | ISTRIP | IXON)
    raw.c_oflag &= ~UInt(OPOST)
    raw.c_cflag |= UInt(CS8)
    raw.c_cc.15 = 1 // VMIN
    raw.c_cc.16 = 0 // VTIME
    tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw)
    return orig
}

func disableRaw(_ orig: termios) {
    var o = orig
    tcsetattr(STDIN_FILENO, TCSAFLUSH, &o)
}

// MARK: - Keyboard Input

enum Key: Equatable {
    case up, down, home, end
    case enter, esc
    case char(Character)
}

func readKey() -> Key {
    var b: UInt8 = 0
    guard read(STDIN_FILENO, &b, 1) == 1 else { return .esc }

    if b == 0x1B {
        // Check for escape sequence with select() timeout
        var rfds = fd_set()
        withUnsafeMutablePointer(to: &rfds) {
            bzero($0, MemoryLayout<fd_set>.size)
        }
        rfds.fds_bits.0 = 1 // bit for fd 0 (stdin)
        var tv = timeval(tv_sec: 0, tv_usec: 100_000) // 100ms
        let ret = select(1, &rfds, nil, nil, &tv)

        if ret > 0 {
            var n: UInt8 = 0
            if read(STDIN_FILENO, &n, 1) == 1, n == 0x5B { // '['
                var more: UInt8 = 0
                if read(STDIN_FILENO, &more, 1) == 1 {
                    switch more {
                    case 0x41: return .up
                    case 0x42: return .down
                    case 0x48: return .home
                    case 0x46: return .end
                    default: return .esc
                    }
                }
            }
        }
        return .esc
    }

    let ch = Character(UnicodeScalar(b))
    switch ch {
    case "\r", "\n": return .enter
    case "\u{7F}": return .char("h")  // DEL → help
    default: return .char(ch)
    }
}

// MARK: - Exercise Model

struct Exercise {
    let number: Int
    let title: String
    var isDone: Bool
    let filePath: String
}

let MODULE_TITLES: [Int: String] = [
    1: "Variables, Math, and Functions",
    2: "Data Types and Functions",
    3: "Operators and Conditionals",
    4: "Scopes",
    5: "Loops",
    6: "Error Handling",
    7: "Classes and Inheritance",
    8: "Common Methods",
    9: "Modules and Packages",
    10: "List Comprehensions",
    11: "Advanced Dicts and Sets",
    12: "Advanced Functions",
    13: "String Formatting and Text",
    14: "Numbers and Math",
    15: "Dates and Time",
    16: "CSV and JSON",
]

func findPracticeDir() -> String {
    let cwd = FileManager.default.currentDirectoryPath
    let checks = [
        cwd + "/Practice/Mod1.py",
        cwd + "/PylingsTUI/Practice/Mod1.py",
    ]
    for p in checks {
        if FileManager.default.fileExists(atPath: p) {
            return URL(fileURLWithPath: p).deletingLastPathComponent().path
        }
    }
    return cwd + "/Practice"
}

func findPylingsScript() -> String {
    let cwd = FileManager.default.currentDirectoryPath
    let checks = [
        cwd + "/pylings",
        cwd + "/PylingsTUI/pylings",
    ]
    for p in checks {
        if FileManager.default.fileExists(atPath: p) { return p }
    }
    return cwd + "/pylings"
}

let PRACTICE_DIR = findPracticeDir()
let PYLINGS_SCRIPT = findPylingsScript()

func scanExercises() -> [Exercise] {
    var exercises: [Exercise] = []
    for i in 1...16 {
        let path = PRACTICE_DIR + "/Mod\(i).py"
        let exists = FileManager.default.fileExists(atPath: path)
        var isDone = false
        if exists, let content = try? String(contentsOfFile: path, encoding: .utf8) {
            isDone = !content.contains("# I AM NOT DONE")
        }
        exercises.append(Exercise(
            number: i,
            title: MODULE_TITLES[i] ?? "Unknown",
            isDone: isDone,
            filePath: path
        ))
    }
    return exercises
}

// MARK: - Running Exercises

func runExercise(_ ex: Exercise) -> String {
    let task = Process()
    task.executableURL = URL(fileURLWithPath: "/usr/bin/env")
    task.arguments = ["python3", PYLINGS_SCRIPT, String(ex.number)]
    let out = Pipe()
    task.standardOutput = out
    task.standardError = out
    do {
        try task.run()
        task.waitUntilExit()
        let data = out.fileHandleForReading.readDataToEndOfFile()
        return String(data: data, encoding: .utf8) ?? "(no output)"
    } catch {
        return "Error: \(error.localizedDescription)"
    }
}

func getHints(_ ex: Exercise) -> String {
    guard let content = try? String(contentsOfFile: ex.filePath, encoding: .utf8) else {
        return "Could not read exercise file."
    }
    var hints: [String] = []
    var foundImpl = false
    for line in content.split(separator: "\n") {
        let t = line.trimmingCharacters(in: .whitespaces)
        if t.contains("# TODO:") {
            let msg = t.components(separatedBy: "# TODO:").last?.trimmingCharacters(in: .whitespaces) ?? ""
            hints.append("  \(YELLOW)●\(S)  \(msg)")
        }
        if t.contains("raise NotImplementedError") {
            foundImpl = true
        }
    }
    // Find function names with NotImplementedError
    if foundImpl {
        let lines = content.split(separator: "\n")
        for i in 0..<lines.count {
            let t = lines[i].trimmingCharacters(in: .whitespaces)
            if t.hasPrefix("def ") {
                let name = t.dropFirst(4).split(separator: "(").first.map(String.init) ?? "?"
                if i + 1 < lines.count, lines[i + 1].contains("NotImplementedError") {
                    hints.append("  \(YELLOW)●\(S)  Implement function '\(name)()'")
                }
            }
        }
    }
    if hints.isEmpty {
        return "  \(DIM)No hints available for this exercise.\(S)"
    }
    return "\(BOLD)Hints:\(S)\n" + hints.joined(separator: "\n")
}

// MARK: - TUI

struct App {
    var exercises: [Exercise] = scanExercises()
    var sel: Int = 0
    var result: String = ""
    var hints: String = ""
    var showHints = false
    var status = ""
    var cols = 80
    var rows = 24

    mutating func run() {
        let orig = enableRaw()
        hideCursor()
        defer { showCursor(); disableRaw(orig); cls(); }

        while true {
            (rows, cols) = terminalSize()
            render()
            guard let key = handleKey() else { return }
            _ = key
        }
    }

    func render() {
        var buf = ""
        buf += "\u{1B}[2J\u{1B}[H" // cls + home

        // ── Header ──
        buf += "\(BG_GRAY)\(BOLD)  pylings — Gaby Learns Python  \(S)"
        let hdrPad = max(1, cols - 38)
        buf += String(repeating: " ", count: hdrPad)
        buf += "\(DIM)\(CYAN)\(sel+1)/\(exercises.count)\(S)\n"

        // ── Separator ──
        buf += "\(DIM)\(String(repeating: "─", count: cols))\(S)\n"

        // ── Exercise list (fill available visible rows, max 16) ──
        let detailMin = 5
        let maxVisible = max(1, rows - detailMin - 3) // -header -sep -status
        let visibleCount = min(exercises.count, maxVisible)
        let scrollOffset: Int
        if sel < visibleCount / 2 {
            scrollOffset = 0
        } else if sel >= exercises.count - visibleCount / 2 {
            scrollOffset = exercises.count - visibleCount
        } else {
            scrollOffset = sel - visibleCount / 2
        }

        for i in 0..<visibleCount {
            let idx = scrollOffset + i
            guard idx < exercises.count else { break }
            let ex = exercises[idx]
            let selected = idx == sel

            let prefix = selected ? "\(BG_BLUE)\(BOLD)\(WHITE)" : ""
            let suffix = selected ? "\(S)" : ""
            let statusIcon = ex.isDone ? "\(GREEN)✔\(S)" : "\(RED)✘\(S)"
            let marker = selected ? " \(CYAN)◀\(S)" : "  "

            let numStr = String(format: "%2d", ex.number)
            let maxTitle = max(1, cols - 14)
            let title = ex.title.count > maxTitle
                ? String(ex.title.prefix(maxTitle - 1)) + "…"
                : ex.title

            buf += "\(prefix)  \(numStr). \(statusIcon)  \(title)\(marker)\(suffix)\n"
        }

        // Fill remaining lines before detail
        let listLines = visibleCount + 2 // +header +sep
        let remaining = rows - listLines - 1 - 1 // -detail header -status bar

        // ── Detail separator ──
        if listLines < rows - 1 {
            buf += "\(DIM)\(String(repeating: "─", count: cols))\(S)\n"
        }

        // ── Detail panel ──
        if listLines < rows - 1 {
            let ex = exercises[sel]
            let detailRows = remaining
            var detailLines: [String] = []

            // Info lines
            detailLines.append("\(BOLD)  Module \(ex.number) — \(ex.title)\(S)")
            detailLines.append("\(DIM)  File: Practice/Mod\(ex.number).py\(S)")
            let doneStatus = ex.isDone ? "\(GREEN)✔ Done\(S)" : "\(RED)✘ Not Done\(S)"
            detailLines.append("  Status: \(doneStatus)")
            detailLines.append("")

            // Results or hints
            if showHints, !hints.isEmpty {
                for line in hints.split(separator: "\n") {
                    detailLines.append(String(line))
                }
            } else if !result.isEmpty {
                for line in result.split(separator: "\n") {
                    detailLines.append(String(line.prefix(cols - 2)))
                }
            } else {
                detailLines.append("  \(DIM)Press Enter to run this exercise\(S)")
            }

            // Trim to available space
            let maxDetail = max(1, detailRows)
            let shown = detailLines.prefix(maxDetail)
            for line in shown {
                buf += "\(line)\n"
            }

            // Clear remaining detail area
            for _ in shown.count..<maxDetail {
                buf += "\n"
            }
        }

        // ── Status bar ──
        let nav = "\(REV)  ↑↓/jk nav  ↵ run  h hints  e edit  r refresh  q quit  \(S)"
        buf += nav
        if !status.isEmpty {
            buf += "  \(DIM)\(status)\(S)"
        }
        buf += "\u{1B}[K" // clear to end of status line

        write(buf)
    }

    mutating func handleKey() -> Key? {
        let key = readKey()
        switch key {
        case .up, .char("k"):
            if sel > 0 { sel -= 1; clearDetails() }
        case .down, .char("j"):
            if sel < exercises.count - 1 { sel += 1; clearDetails() }
        case .home, .char("g"):
            sel = 0; clearDetails()
        case .end, .char("G"):
            sel = exercises.count - 1; clearDetails()
        case .enter:
            let ex = exercises[sel]
            status = "Running Module \(ex.number)..."
            render()
            result = runExercise(ex)
            hints = ""
            showHints = false
            exercises = scanExercises()
            status = ""
        case .char("h"):
            if hints.isEmpty { hints = getHints(exercises[sel]) }
            showHints.toggle()
        case .char("e"):
            let ex = exercises[sel]
            let t = Process()
            t.executableURL = URL(fileURLWithPath: "/usr/bin/open")
            t.arguments = ["-t", ex.filePath]
            try? t.run()
            status = "Opened in editor"
        case .char("r"):
            exercises = scanExercises()
            status = "Refreshed"
        case .char("q"), .esc:
            return nil
        default:
            break
        }
        return key
    }

    mutating func clearDetails() {
        result = ""
        hints = ""
        showHints = false
    }
}

// MARK: - Entry

var app = App()
app.run()
