"""
Inventory and Collection Manager

Manages grouped data structures, frequency counting,
and set-based operations for data processing.
"""
# I AM NOT DONE

from collections import defaultdict, Counter

# TODO: Create a defaultdict(int) and count occurrences of each item
salesItems = ["croissant", "muffin", "croissant", "bagel",
              "croissant", "muffin", "cookie", "bagel", "croissant"]
salesCount = None  # Use defaultdict(int)

# After populating, croissant should have count 4
croissantCount = None

# TODO: Create a defaultdict(list) to group items by their first letter
wordList = ["apple", "banana", "avocado", "blueberry", "apricot", "cherry"]
groupedByLetter = None  # defaultdict(list)

# TODO: Use Counter to count the frequency of each item in salesItems
frequency = None  # Counter object

# TODO: Use .most_common() to get the top 2 items
topTwo = None

# TODO: Create two sets and perform operations
setA = None  # TODO: Set with at least 4 items
setB = None  # TODO: Set with at least 4 items (some overlap with setA)

unionResult = None        # TODO: setA | setB
intersectionResult = None  # TODO: setA & setB
diffResult = None          # TODO: setA - setB

# TODO: Use .issubset() to check if setA is a subset of setB
isSubset = None
