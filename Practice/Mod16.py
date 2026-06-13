"""
Data Import and Export Module

Functions for reading, writing, and transforming
data between CSV and JSON formats.
"""
# I AM NOT DONE

import csv
import json

# TODO: Read 'sales.csv' using csv.reader and store rows in a list
# (Assume the file exists from previous exercises)
csvRows = []

# TODO: Read 'sales.csv' using csv.DictReader and store rows in a list
csvDictRows = []

# TODO: Write data to 'output.csv' using csv.writer
outputData = [
    ["name", "age", "city"],
    ["Gaby", 25, "Austin"],
    ["Bob", 30, "Dallas"],
]

# TODO: Write data to 'output_dict.csv' using csv.DictWriter
outputDictData = [
    {"name": "Gaby", "age": "25", "city": "Austin"},
    {"name": "Bob", "age": "30", "city": "Dallas"},
]

# TODO: Create a Python dict and save it as 'data.json' using json.dump()
sampleData = {
    "bakery": "Sweet Treats",
    "items": [
        {"name": "croissant", "price": 3.50},
        {"name": "muffin", "price": 2.00},
    ],
    "isOpen": True,
}

# TODO: Read 'data.json' back using json.load() and store the result
loadedData = None

# TODO: Convert a JSON string to a Python dict using json.loads()
jsonString = '{"name": "Test", "value": 42}'
parsedJson = None

# TODO: Convert a Python dict to a JSON string using json.dumps()
pythonDict = {"language": "Python", "version": 3.11}
jsonOutput = None
