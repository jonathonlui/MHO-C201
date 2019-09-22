from machine import Pin
from utime import sleep_ms

from mhoc201 import MHOC201Display

display = MHOC201Display(
    busy_n_pin=Pin(4, Pin.IN, Pin.PULL_UP),
    rst_n_pin=Pin(12, Pin.OUT),
    shd_n_pin=Pin(13, Pin.OUT),
    csp_pin=Pin(0, Pin.OUT),
    scl_pin=Pin(5, Pin.OUT),
    sda_pin=Pin(14, Pin.OUT),
)

noop_segments = [
    16, 18, 20, 22, 24, 26, 27, 28, 30, 32, 34, 36, 38, 40, 42, 44, 45, 46, 47,
    49, 51, 53, 55, 57, 59, 61, 63, 65,
]


def count():
    wait = 5000
    display.full_clear()
    sleep_ms(500)
    while 1:
        for i in range(200):
            display.set_top_number(i)
            if i < 100:
                display.set_bottom_number(i)
            display.flush()
            sleep_ms(wait)
        for i in range(199, -1, -1):
            display.set_top_number(i)
            if i < 100:
                display.set_bottom_number(i)
            display.flush()
            sleep_ms(wait)


def loop(start=0):
    values = bytearray([0x0 for _ in range(13)])
    for bit in filter(lambda s: s not in noop_segments and s >= start,
                      range((8 * 12) + 1)):
        for row in range(0, 13):
            value = 0
            for col in range(0, 8):
                value |= ((0 if bit == ((row * 8) + col) else 1)) << 7 - col
            values[row] = value
        print('{:3}'.format(bit), end=' ')
        for value in values:
            print('{:08b}'.format(value), end=' ')
        print()
        display.update_black(values)


def set_segment(segment_id):
    values = bytearray([0x0 for _ in range(13)])
    for row in range(0, 13):
        value = 0
        for col in range(0, 8):
            value |= ((0 if segment_id == ((row * 8) + col) else 1)) << 7 - col
        values[row] = value
    display.update_black(values)


def set_segment_white(segment_id):
    values = bytearray([0x0 for _ in range(13)])
    for row in range(0, 13):
        value = 0
        for col in range(0, 8):
            value |= ((1 if segment_id == ((row * 8) + col) else 0)) << 7 - col
        values[row] = value
    display.update_white(values)
