"""
Payment and File Processing Module

Demonstrates error handling patterns for payment validation,
data conversion, and file operations.
"""
# I AM NOT DONE

result1 = None  # TODO: try/except ZeroDivisionError from 10/0
result2 = None  # TODO: try/except ValueError from int("hello")

shortList = None  # TODO: Set to a list with 3 items
result3 = None    # TODO: try/except IndexError from shortList[10]

divResult = None    # TODO: try/except/else dividing 10 by 2, store in else
finallyRan = None   # TODO: try/except/finally, store "finally ran" in finally


def getElement(lst, index):
    """Return the element at index, or None if out of range (use try/except)."""
    raise NotImplementedError()


result7 = None  # TODO: try/except calling validateAge(-1) to catch ValueError


def validateAge(age):
    """Raise ValueError if age is negative."""
    raise NotImplementedError()


def safeDivide(a, b):
    """Return a/b or raise ZeroDivisionError if b is 0."""
    raise NotImplementedError()


result9 = None  # TODO: try/except to catch TypeError from "hello" + 5


def checkStock(quantity):
    """
    Raise ValueError if quantity < 0.
    Raise Exception("Out of stock.") if quantity == 0.
    Return "In stock" otherwise.
    """
    raise NotImplementedError()


parsedFloat = None    # TODO: try/except/else/finally to convert "3.14" to float
inputCheckDone = None # TODO: Store "done" in the finally block


def openFile():
    """Try to open "data.txt". Return "file found" or "file not found"."""
    raise NotImplementedError()
