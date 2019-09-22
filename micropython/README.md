

`ht16e07.py` Methods to send commands to a Holtek HT16E07

`mhoc201.py` Extends `ht16e07.py` with methods and values (LUTs and segment positions) specific to the MHO-C201 display.

## Example: Update top number from 0 to 199

```python
from machine import Pin
from mhoc201 import MHOC201Display

display = MHOC201Display(
    busy_n_pin=Pin(4, Pin.IN, Pin.PULL_UP),
    rst_n_pin=Pin(12, Pin.OUT),
    shd_n_pin=Pin(13, Pin.OUT),
    csp_pin=Pin(0, Pin.OUT),
    scl_pin=Pin(5, Pin.OUT),
    sda_pin=Pin(14, Pin.OUT),
)

display.full_clear()

for i in range(200):
    display.set_top_number(i)
    display.flush()
```

