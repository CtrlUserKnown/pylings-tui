# THE GABY'S PRACTICE ARCADE — RULES & COMMANDS!

WELCOME, CONTESTANT! You are about to enter THE GABY'S PRACTICE ARCADE!
I am CAINE, your GAME MASTER, and I will be watching your every move! HAHAHA!

This is a self-checking practice system. The Gaby writes code directly in the
Mod files, runs the checker, and it reveals what passed and what didn't.
EVERY MISTAKE IS PART OF THE GAME!


## CABINET LAYOUT

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
the GAME MASTER won't find the Gaby's files! DISQUALIFICATION!


## CONTROLS

Run these from anywhere (after setup):

| Command | What it does |
|---|---|
| `pylings` | Auto-watch the next incomplete challenge |
| `pylings list` | List all challenges with ✔ Done / ✘ Not Done status |
| `pylings next` | Run the first incomplete challenge |
| `pylings 3` | Run a specific challenge (replace 3 with any number 1-16) |
| `pylings watch` | Watch the next incomplete challenge — tests re-run on every save |
| `pylings watch 3` | Watch a specific challenge |

**Watch-mode shortcuts:** press `q` to quit, `h` to show hints. CAINE SEES ALL!


## HOW TO PLAY (Rustlings-style)

1. Each Mod file starts with **`# I AM NOT DONE`** — this means the challenge is still waiting to be conquered.

2. Open any Mod file (e.g. `Practice/Mod1.py`). Each module looks like a real project file with `# TODO` comments and `raise NotImplementedError()` stubs. Replace them with the Gaby's code.

3. Run the checker whenever the Gaby wants:

        pylings next

   or

        pylings 1

4. The output shows what passed and what didn't:

        ✔  cityName is a non-empty string
        ✘  temperature is 98.6
           hint: temperature = 98.6

    At the bottom you'll see a progress bar:

        ████████████░░░░░░░░░░░░░░░░░░  8/13 passed

5. **When all checks pass**, the runner tells the Gaby to remove `# I AM NOT DONE` from the file. Do that to mark the challenge as complete. DING DING DING!

6. Use `pylings` (no arguments) or `pylings watch` for the full arcade experience — it watches the Gaby's file and re-runs tests automatically every time the Gaby saves. I AM ALWAYS WATCHING!


## POWER UPS

- Run `pylings list` anytime to see the Gaby's overall progress. HIGH SCORE TRACKING!
- The Gaby doesn't have to finish all problems before running the checker. Run it as often as you want!
- Syntax errors are caught before tests run, with a clean message showing the exact line and column. NO CHEATING!
- Variable names must match exactly what the problem asks for — the checker looks for specific names. PRECISION MATTERS!
- Some checks are flexible (e.g. `testScore` can be any number — the checker grades it based on what the Gaby picks).
- Use `raise NotImplementedError()` for functions not yet implemented — the hints system (`h` key in watch mode) will pick them up. THE HINT BUTTON IS THE GABY'S POWER UP!


## CHALLENGE TOPICS

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

----

CAINE'S FINAL WARNING: THE GABY THINKS THIS IS JUST CODING PRACTICE.
BUT REALLY — IT'S A GAME SHOW! AND THE PRIZE IS KNOWLEDGE! HAHAHA!
INSERT COIN AND BEGIN!
