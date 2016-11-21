
# These modules and functions will be available in interactive sessions.

import datetime
import json
import os
from pprint import pprint
import random
import sys
import string
import subprocess


def run(command, **kwargs):
    """Takes a string and executes it as a Bash command."""
    kwargs.setdefault('timeout', 60)
    return subprocess.check_call(['bash', '-c', command], **kwargs)

