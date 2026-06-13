# Practice Runner

This is a self-checking practice system. You write your code directly in the
Mod files, run the checker, and it tells you what passed and what didn't.


## Folder Structure

Make sure your folder looks like this before you start:

     GabyLearnsPython/
    ├── pylings
    └── Practice/
        ├── Mod1.py
        ├── Mod2.py
        ├── Mod3.py
        ├── Mod4.py
        ├── Mod5.py
        ├── Mod6.py
        ├── Mod7.py
        ├── Mod8.py
        ├── Mod9.py
        ├── Mod10.py
        ├── Mod11.py
        ├── Mod12.py
        ├── Mod13.py
        ├── Mod14.py
        ├── Mod15.py
        └── Mod16.py

`pylings` needs to be one level above the Practice folder. If the structure is off,
the runner won't find your files.


## Commands

Run these from anywhere (after setup):

| Command | What it does |
|---|---|
| `pylings` | Auto-watch the next incomplete exercise |
| `pylings list` | List all exercises with ✔ Done / ✘ Not Done status |
| `pylings next` | Run the first incomplete exercise |
| `pylings 3` | Run a specific exercise (replace 3 with any number 1-16) |
| `pylings watch` | Watch the next incomplete exercise — tests re-run on every save |
| `pylings watch 3` | Watch a specific exercise |

**Watch-mode shortcuts:** press `q` to quit, `h` to show hints.

## How It Works (Rustlings-style)

1. Each Mod file starts with **`# I AM NOT DONE`** — this means the exercise is still waiting to be completed.

2. Open any Mod file (e.g. `Practice/Mod1.py`). Each module looks like a real project file with `# TODO` comments and `raise NotImplementedError()` stubs. Replace them with your code.

3. Run the checker whenever you want:

        pylings next

   or

        pylings 1

4. The output shows you what passed and what didn't:

        ✔  cityName is a non-empty string
        ✘  temperature is 98.6
           hint: temperature = 98.6

    At the bottom you'll see a progress bar:

        ████████████░░░░░░░░░░░░░░░░░░  8/13 passed

5. **When all checks pass**, the runner will tell you to remove `# I AM NOT DONE` from the file. Do that to mark the exercise as complete.

6. Use `pylings` (no arguments) or `pylings watch` for the full Rustlings experience — it watches your file and re-runs tests automatically every time you save.

## Tips

- Run `pylings list` anytime to see your overall progress.
- You don't have to finish all problems before running the checker. Run it as often as you want.
- Syntax errors are caught before tests run, with a clean message showing the exact line and column.
- Variable names must match exactly what the problem asks for — the checker looks for specific names.
- Some checks are flexible (e.g. `testScore` can be any number — the checker grades it based on what you pick).
- Use `raise NotImplementedError()` for functions you haven't implemented yet — the hints system (`h` key in watch mode) will pick them up.

## Module Topics

    Module 1  — Variables, Math, and Functions
    Module 2  — Data Types and Functions
    Module 3  — Operators and Conditionals
    Module 4  — Scopes
    Module 5  — Loops
    Module 6  — Error Handling
    Module 7  — Classes and Inheritance
    Module 8  — Common Methods
    Module 9  — Modules and Packages
    Module 10 — List Comprehensions
    Module 11 — Advanced Dicts and Sets
    Module 12 — Advanced Functions
    Module 13 — String Formatting and Text
    Module 14 — Numbers and Math
    Module 15 — Dates and Time
    Module 16 — CSV and JSON
