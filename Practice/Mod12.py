"""
Function Utility Library

Demonstrates advanced Python function features including
*args, **kwargs, lambda functions, closures, and map/filter patterns.
"""
# I AM NOT DONE


def sumAll(*args):
    """Return the sum of all numbers passed in."""
    raise NotImplementedError()


def buildProfile(**kwargs):
    """Return a string with key=value pairs joined by commas."""
    raise NotImplementedError()


def applyDiscount(discount):
    """Return a lambda that reduces a price by the given discount (as decimal).
    E.g., applyDiscount(0.1) returns a function that subtracts 10%.
    """
    raise NotImplementedError()


# TODO: Create a lambda that doubles a number and assign it to double
double = None


# TODO: Use map() with a lambda to convert ["1", "2", "3"] to [1, 2, 3]
stringNums = ["1", "2", "3"]
parsedNums = None


# TODO: Use filter() with a lambda to keep only numbers > 10
mixedNums = [3, 15, 7, 22, 1, 18]
bigNums = None


# TODO: Use sorted() with a lambda key to sort by the second element
pairs = [("a", 3), ("b", 1), ("c", 2)]
sortedPairs = None


# TODO: Call sumAll(1, 2, 3, 4, 5) and store the result
total = None

# TODO: Call buildProfile(name="Gaby", age=25, city="Austin") and store
profile = None
