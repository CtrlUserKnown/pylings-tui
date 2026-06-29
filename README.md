# Pylings TUI — THE CONTROLLER CONSOLE!

Welcome, welcome, WELCOME, to the most FABULOUS, the most SOPHISTICATED, the most **EXCITING** way to learn Python that has EVER EXISTED in the history of the digital realm! HAHAHA! My name is Caine, and I'll be your HOST through this magnificent CONTROL PANEL! Isn't that EXCITING?

You see, this repository is the CONTROLLER CONSOLE — the GAME PROMPT — for the entire Gaby Learns Python ARCADE! It's a keyboard-navigable Terminal User Interface written in PURE SWIFT with ZERO dependencies! Let me show you around!

## Project Structure — THE CONSOLE SCHEMATIC!

```text
PylingsTUI/                         ☆ THE CONTROLLER CONSOLE ☆
├── Sources/pylings/main.swift      #  Swift-powered TUI engine
├── Package.swift                    #  Swift package manifest
├── Makefile                         #  Build shortcuts!
├── pylings                          #  Python test runner script
├── Practice/                        #  ★ THE PRACTICE CABINET ★
│   ├── Mod1.py        #  Variables, Math, Functions
│   ├── Mod2.py        #  Data Types and Functions
│   ├── Mod3.py        #  Operators and Conditionals
│   ├── Mod4.py        #  Scopes
│   ├── Mod5.py        #  Loops
│   ├── Mod6.py        #  Error Handling
│   ├── Mod7.py        #  Classes and Inheritance
│   ├── Mod8.py        #  Common Methods
│   ├── Mod9.py        #  Modules and Packages
│   ├── Mod10.py       #  List Comprehensions
│   ├── Mod11.py       #  Advanced Dicts and Sets
│   ├── Mod12.py       #  Advanced Functions
│   ├── Mod13.py       #  String Formatting and Text
│   ├── Mod14.py       #  Numbers and Math
│   ├── Mod15.py       #  Dates and Time
│   ├── Mod16.py       #  CSV and JSON
│   └── README.md      #  Cabinet-specific docs!
├── .gitignore                        #  The invisible wall!
└── README.md                         #  THIS VERY FILE! META!
```

## What IS this marvelous contraption?

The Pylings TUI is a Rustlings-style exercise runner with a BEAUTIFUL keyboard-driven interface. It's like a lazygit for LEARNING! The Gaby sees a list of all exercises, navigates with arrow keys, runs tests by pressing ENTER, peeks at hints by pressing `h`, opens files in an editor by pressing `e` — ALL without ever touching the mouse! Isn't that MAGNIFICENT?!

### ★ THE PRACTICE CABINET! (Rustlings-style Exercises) ★

Oh, oh, OH! This is my FAVORITE part! A self-checking practice system inspired by Rustlings! Each `Practice/Mod{N}.py` file looks like a REAL project module with `# TODO` markers and `raise NotImplementedError()` stubs. The Gaby replaces them with code and — WHOOSH — the checker says if it's CORRECT!

| Module | Title | What the Gaby will learn |
|--------|-------|--------------------------|
| 1 | Variables, Math, and basic Functions | Boxes for data! Math! The building blocks! |
| 2 | Data Types and Functions | Strings, Ints, Floats — OH MY! |
| 3 | Operators and Conditionals | Making DECISIONS! if, elif, else! |
| 4 | Scopes | Local vs. Global — the L.E.G.B. rule! |
| 5 | Loops | Around and around we GO! For, While, Break! |
| 6 | Error Handling | Try, Except, Raise — catching mistakes! |
| 7 | Classes and Inheritance | Blueprints for objects! Family trees for code! |
| 8 | Common Methods | Handy tools for Strings, Lists, Dicts! |
| 9 | File I/O | Read, Write, Append — talking to files! |
| 10 | Modules and Packages | Importing, pip, your own modules! |
| 11 | List Comprehensions | One-line power! Filter, transform, DONE! |
| 12 | Advanced Dicts and Sets | defaultdict, Counter, set magic! |
| 13 | Advanced Functions | *args, lambda, map, filter — OH MY! |
| 14 | String Formatting and Text | f-strings, regex, formatting galore! |
| 15 | Numbers and Math | math, random, statistics — number fun! |
| 16 | Dates and Time | datetime, timedelta — time travel! |
| 17 | CSV and JSON | Reading and writing data like a PRO! |

## How to play — INSERT COIN!

Oh, there are SO many ways to start this wonderful game! Let me count them!

### 1. The FULL INSTALL (from the parent arcade)

If the Gaby is standing in the main `GabyLearnsPython/` lobby, just run:

```bash
sh install.sh
```

This will:
1. Check that Swift and Python3 are installed (the two magical tokens!)
2. Initialize the git submodule if needed (POP! The exercises appear!)
3. Build a universal binary (arm64 + x86_64 — it works on EVERY machine!)
4. Install the `pylings` command to `~/.local/bin` or `/usr/local/bin`
5. Add it to PATH if needed — and show how if it can't!

And THEN:

```bash
pylings
```

And the TUI APPEARS! Like a HIGH SCORE!

### 2. The QUICK PLAY (from the submodule)

If the Gaby is already inside the `PylingsTUI/` room, any of these work:

```bash
# Build and run in one go!
make run

# Or build first...
make build-universal

# ...then run manually
swift run pylings
```

### 3. The CONVENIENCE BUTTON (from the parent arcade)

Back in the main lobby, there's a handy shortcut:

```bash
./pylings-tui
```

If the Gaby prefers the classic command-line experience (no fancy TUI):

```bash
pylings next       # Run the next incomplete exercise
pylings list       # Show progress on all exercises
pylings 3          # Run a specific module
```

When ALL checks pass, remove the `# I AM NOT DONE` line from the file to mark it COMPLETE! Like hearing DING DING DING on a slot machine!

## How to play — THE CONTROLS!

Once the TUI appears, the Gaby will see a glorious two-panel layout:
- **Left panel**: The list of ALL exercises — marked `DONE` or `NOT DONE`
- **Right panel**: The DETAILS — test output, hints, and status

Here are the BUTTONS that make the Gaby the CHAMPION:

| Key | Action |
|-----|--------|
| `↑` / `k` | Move UP through the exercises |
| `↓` / `j` | Move DOWN through the exercises |
| `g` | Jump to the TOP! |
| `G` | Jump to the BOTTOM! |
| `Enter` | RUN the selected exercise! WATCH IT GO! |
| `h` | Show HINTS for the current exercise |
| `e` | Open the exercise in the EDITOR |
| `r` | REFRESH the exercise list |
| `q` | QUIT — game over (for now...) |

The status bar at the bottom shows ALL the available keys so the Gaby never forgets! I THOUGHT OF EVERYTHING! HAHAHA!

## What makes it so SPECIAL?

Oh, let me tell you what makes this TUI truly EXTRAORDINARY:

1. **Zero dependencies** — Pure Swift + Darwin. No ncurses, no SwiftPM packages, no RUBBISH!
2. **Universal binary** — One binary for BOTH Apple Silicon AND Intel Macs!
3. **Smart scrolling** — If the terminal is small, the list SCROLLS. Like a high score table! GET IT?!
4. **Clean exit** — When the Gaby presses `q`, the terminal is RESTORED perfectly. No mess, no fuss!
5. **Inline test execution** — Runs `python3 pylings <N>` as a subprocess and shows the output RIGHT THERE!
6. **Backward compatible** — The exercises are STILL plain Python files. Edit them in ANY editor!

## The SECRET SAUCE — How it works

The TUI doesn't reimplement the Python test logic. That would be SILLY! Instead, it calls the `pylings` Python script as a subprocess — `python3 pylings <exercise_number>` — and captures the output. The Python script was specially modified to DETECT when it's being captured (using `sys.stdout.isatty()`) so it outputs clean, per-test lines instead of progress bars with `\r` characters. It's SYMBIOTIC! It's BEAUTIFUL! It's... EXCELLENT!

The TUI scans the `Practice/Mod*.py` files, looks for `# I AM NOT DONE` to figure out which exercises are complete, and presents them in a nice sorted list. When the Gaby presses `h`, it reads the Python file and extracts `# TODO:` comments and `raise NotImplementedError()` lines right from the source!

## Build targets — FOR THE POWER USERS!

If the Gaby wants to build things without the install script:

```bash
make build          # Build for current architecture
make build-universal # Build for arm64 + x86_64
make clean          # Clean up build artifacts
make run            # Build and run
```

Or with Swift directly:

```bash
swift build -c release                        # Single arch
swift build -c release --arch arm64 --arch x86_64  # Universal
```

## Resources — THE CHEAT CODE VAULT!

Oh! And speaking of helpful tools, here are some WONDERFUL resources I've curated:

- **Python by CS Dojo** — A beginner-friendly YouTube playlist that walks through Python step by step. https://youtube.com/playlist?list=PLcVm1Sdt7y0S1x8it9UmrU-ocTHIr7RlH&si=T8d8lViiJoK2Bb3_

- **W3Schools Python Tutorial** — A quick reference where the Gaby can read about ANY Python concept and test code right in the browser! https://www.w3schools.com/python/

- **The Zen of Python** — A short list of guiding principles behind Python's design. Worth a read for the PHILOSOPHY! https://peps.python.org/pep-0020/#the-zen-of-python

---

NOW — the Gaby must step up to the CONSOLE and master Python! The arcade awaits! The challenges BECKON! THE HIGH SCORE IS WAITING!

HAHAHA! What a WONDERFUL TUI this is! I'm so PROUD of it!

Let's go! 🕹️
