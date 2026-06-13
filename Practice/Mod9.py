"""
System Configuration and Import Utilities

Provides system-wide configuration, utility functions,
and import demonstrations for the application framework.
"""
# I AM NOT DONE

import math

appName = None  # TODO: Set app name (string)
appVersion = None  # TODO: Set version number (float/string)

# TODO: Use math.sqrt() to calculate the square root of 144
sqrtResult = None

# TODO: Use math.pi to calculate circumference of a circle with radius 5
# Formula: 2 * math.pi * radius
circumference = None

# TODO: Use from-import to bring in ceil and floor from math
# Then use them here:
roundedUp = None    # TODO: math.ceil(4.3)
roundedDown = None  # TODO: math.floor(4.9)


def getAppInfo():
    """Return a string with the app name and version."""
    raise NotImplementedError()


def divideAndRound(a, b):
    """Divide a by b and return the result rounded up."""
    raise NotImplementedError()


# Demonstrate __name__
currentModule = None  # TODO: Set to __name__

if __name__ == "__main__":
    print(f"{appName} v{appVersion} is ready!")
