#!/bin/bash

echo "rm -f *.json"
rm -f *.json

echo "python3 item_generator.py"
python3 item_generator.py

echo "python3 sequence_generator.py"
python3 sequence_generator.py