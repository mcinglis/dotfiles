
# These modules will be available in interactive sessions.
import os
import sys
import string
import random
import datetime
import json
from pprint import pprint

history_path = os.path.expanduser('~/.python/history')

try:
    import readline, rlcompleter
    readline.parse_and_bind('tab: complete')

    def save_history(history_path=history_path):
        import readline
        readline.write_history_file(history_path)

    import atexit
    atexit.register(save_history)

    if os.path.exists(history_path):
        readline.read_history_file(history_path)

    del readline, rlcompleter, save_history, atexit

except ImportError:
    pass

del history_path
