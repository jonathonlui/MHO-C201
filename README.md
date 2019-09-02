## TODO

- [ ] Compare LUTs
  - [ ] Why Vcom, KK, KW LUTs but no WK, WW LUTs?
- [ ] Map display segment to DTM data
- [ ] Why two FRC commands on initial power on and only 1 for updates?


# MHO-C201 Teardown

![product-image](images/product-image.jpg)

## Schematic

![schematic](images/schematic.png)

## Components

- **Display** at **P1**: Segmented e-paper display controller connected to PCB with 10-pin FPC.

  - Probably a [**HT16E07**](https://www.holtek.com/productdetail/-/vg/16E07). The commands captured between the MCU and Display match the HT16E07 datasheet

    - Except the MCU here seems to send a 14-byte DTM command whereas the datasheet says 17 bytes are required otherwise "the result of the data comparison between the new_data register and the previous_data register will be incorrect."

  - Segments: visually there are 84 segments (TODO: confirm).

    - The HT16E07 supports 120 segments. Based on the logic analyzer captures, the DTM command sent is 14 bytes composed of 1 command-type byte followed 13 bytes of data. This means this display probably has at most 104 segments  (8 segments per byte * 13 bytes).

  - Pins (from "top")
    1. VDL
       - From HT16E07 datasheet:
         - 2.75V to 3.25V
         - Driver low supply voltage – bypass to GND with 1μF capacitor
       - Connected to capacitor at **C3**.
       - Measured voltage: 3.4V.
    2. VDH
       - From HT16E07 datasheet:
         - > Driver high supply voltage – bypass to GND with 1μF capacitor
         - > On startup **Panel Setting (PSR)** command sets to black/white. When black/white:  "VDH is fixed to 12V and VDL is set by the PWR command"
       - Connected to capacitor at **C2**.
       - Measured voltage 11.6V
    3. GND
    4. VDD
       - Datasheet: 2.4 to 3.6V

    5. SHD_N
       - From datasheet:

         - > Charge pump enable pin – low shutdown

    6. RST_N
    7. SDA (data)
    8. SCL (clock)
    9. CSB (latch) (Low during data clock pulses, pulses high after 9 clocks pulses)
    10. BUSY_N

        - From datasheet:

          - > Busy flag output pin
            > BUSY_N="0" – driver is busy, driver is refreshing the display
            > BUSY_N="1" – driver is idle, host can send command/data to driver


- **MCU** at **U2**: HT66F0182 [datasheet](datasheets/HT66F0182v110.pdf)

  - Pins
      1. GND
      2. Display P1-7
      3. Not connected
      4. Display P1-6
      5. Not connected
      6. Display P1-5
      7. Display P1-9
      8. Display P1-8
      9. Display P1-10
      10. S1
      11. ???
      12. Sensor U1-4 I2C SCL
      13. Sensor U1-3 Alert
      14. Sensor U1-1 I2C SDA
      15. Sensor U1-6 Reset
      16. +BATT. Connected to nearby  capacitor at **C4**.

- **Sensor** at **U1**: SHT30-DIS [datasheet](datasheets/SHT3X-DIS Sensirion_Humidity_Sensors_SHT3x_Datasheet_digital.pdf)

  - Pins
    1. SDA
    2. ADDR. Seems not connected but docs for SHT30-DIS say "do not leave floating". MCU addresses Sensor using the default address 0x44 so assume this is "connected to logic low".
    3. ALERT
    4. SCL
    5. VDD
       - Datasheet: 2.15 - 5.5V. 3.3V typical
       - Connected to nearby to capacitor at **C1**
    6. nRESET
    7. R
       - Datasheet: No electrical function; to be connected to VSS
    8. VSS

- **Switch** at **S1**: Toggles between C and F units.

  - Connects MCU pin 10 to GND when pressed

- **Capacitors**:
  - **C1** decoupling capacitor for sensor
  - **C2** capacitor connected to pin 1 of P1
  - **C3** capacitor connected to pin 2 of P1
  - **C4** decoupling capacitor for MCU and/or display controller

- **R1**/**R2** are footprints for pull-up resistors for the Sensor SDA/SCL lines but they're are unpopulated probably because the MCU pins (14, 12) are using internal pull-ups.

## Product Manual and Datasheets

- [MHO-C201 English User Manual](datasheets/MHO-C201 English User Manual.pdf)

-  [HT16E07v100 120 Segments EPD Driver IC Datasheet](datasheets/HT16E07v100.pdf)

-  [HT66F0182v110 A/D Flash MCU Datasheet](datasheets/HT66F0182v110.pdf)

-  [SHT3X-DIS Humidity and Temperature Sensor Datasheet](datasheets/SHT3X-DIS Sensirion_Humidity_Sensors_SHT3x_Datasheet_digital.pdf)

## Startup and Update

### On startup the stock MCU:

1. MCU powers on
2.  After 500 ms, sets Display SHD_N high
3. Goes through sequence of steps to turn on all segments (all black) (see below for "**Steps to Update Display**")
   - BUSY_N is low for 3,000 ms between after sending DRF
4. 100ms after sending first CPOF pulse RST_N low for 0.5ms
5. During this 100ms the MCU reads temp from Sensor
   1. Immediately after DRF, MCU writes "Single Shot Data Acquisition Mode" command to sensor: 0x2416 (no clock stretching, low repeatability)
   2. 86 ms later (maybe triggered by Sensor ALERT line, I didn't have logic analyzer hooked to this line), read 6 bytes from Sensor, 2-byte  temperature, 1-byte checksum, 2 byte humidity, 1-byte checksum.
   3. No other messages between MCU and Sensor observed in the first 10s after power on.
6. Goes through steps to turn off all segments (all white)
   - This time BUSY_N is low for 500 ms after DRF
7. Sends commands to turn  on some segments (to show temp/humidity), BUSY_N is low for 1,000 ms
   1. This time BUSY_N is low for 1,00 ms after DRF
8. Sends final (third) CPOF
9. RST_N pulse low for 1.5ms
10. SHD_N low

Values for Panel Settings (PSR), Power Settings (PWR), Frame Rate Contol (FRC) are always the same.

LUTV, LUT_KK, LUT_KW varies with the last 6 bytes usually 00h except for the all-black display sequence during power-on.

### Steps to Update Display

1. Send low pulse on RST_N 0.5ms

2. Wait 0.5ms

3. Send: Panel Setting (PSR)

4. Send: Power Setting (PWR)

5. Send: Charge Pump ON (CPON)

6. Wait for BUSY_N high

7. Send: Frame Rate Control (FRC)

8. Send: Frame Rate Control (FRC) (seems this second FRC i sonly sent on initial all-on refresh)

9. Send: LUTV, LUT_KK, LUT_KW

10. Send: Data Start Transmission (DTM)

    - Datasheet:

      > Note that users must send the full 17-byte command at once. If less than a 17-byte command is sent, the contents of the previous_data register will be incorrect. In this case the outcome will be that the result of the data comparison between the new_data register and the previous_data register will be incorrect.

    - Logic analyzer capture shows DTM command is consistently 14 bytes.

11. Send: Data Stop (DSP)

12. Send: Display Refresh (DRF)

13. BUSY_N goes low which means display is refreshing

    - Datasheet

      > After executing a DTM command and a DSP command, BUSY_N will be set to “0”.

14. Wait for BUSY_N high

    - Datasheet:

      > After finishing a display refresh, BUSY_N will be set to “1” and the data_flag wil be set to “0”.

15. Send: Charge Pump OFF (CPOF)

