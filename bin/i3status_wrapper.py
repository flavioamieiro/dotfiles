#!/usr/bin/env python3
import sys
import json


def repeat_first_two_lines():
    sys.stdout.write(sys.stdin.readline())
    sys.stdout.flush()
    sys.stdout.write(sys.stdin.readline())
    sys.stdout.flush()

def get_media_player_info():
    full_text = "Fixed Text"
    return {"name": "media_player", "full_text": full_text}

repeat_first_two_lines()

while True:
    try:
        input_starts_with_comma = False
        line = sys.stdin.readline()

        if line.startswith(","):
            input_starts_with_comma = True
            line = line[1:]
        else:
            input_starts_with_comma = False

        status = json.loads(line)

    except json.decoder.JSONDecodeError:
        sys.stdout.write("       ")
        sys.stdout.write("       ")
        sys.stdout.write("       ")
        sys.stdout.write("       ")
        sys.stdout.write("ERROR: ")
        sys.stdout.write(line)
        sys.stdout.write("       ")
        sys.stdout.write("       ")
        sys.stdout.write("       ")
        sys.stdout.write("       ")
        sys.stdout.flush()

    extra_blocks = [get_media_player_info()]
    for block in extra_blocks[::-1]:
        status.insert(0, block)
    wrapped_line = json.dumps(status)

    output = wrapped_line if not input_starts_with_comma else "," + wrapped_line

    sys.stdout.write(output)
    sys.stdout.flush()
