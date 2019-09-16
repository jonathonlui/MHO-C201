from machine import idle
from ht16e07 import HT16E07


class MHOC201Display(HT16E07):
    # LUT values based on logic analyzer captures
    # The lookup table (LUT) values control the timing and voltages for
    # refreshing the display. These values are likely specific to the
    # epaper panel used in the MHO-C201.
    # See HT16E07 datasheet for more details about the meaning of the values.

    # LUT*_FULL_CLEAR values are used turn off-on-off all the segments
    LUTV_FULL_CLEAR = [
        0x47, 0x47, 0x01,
        0x87, 0x87, 0x01,
        0x47, 0x47, 0x01,
        0x87, 0x87, 0x01,
        0x81, 0x81, 0x01,
    ]

    LUT_KK_FULL_CLEAR = [
        0x87, 0x87, 0x01,
        0x87, 0x87, 0x01,
        0x47, 0x47, 0x01,
        0x47, 0x47, 0x01,
        0x81, 0x81, 0x01,
    ]

    LUT_KW_FULL_CLEAR = [
        0x47, 0x47, 0x01,
        0x47, 0x47, 0x01,
        0x87, 0x87, 0x01,
        0x87, 0x87, 0x01,
        0x81, 0x81, 0x01,
    ]

    LUTV_UPDATE_WHITE = [
        0x47, 0x47, 0x01,
        0x4C, 0xC2, 0x01,
        0x42, 0x82, 0x01,
        0x00, 0x00, 0x00,
        0x00, 0x00, 0x00,
    ]

    LUT_KK_UPDATE_WHITE = [
        0x47, 0x47, 0x01,
        0x4C, 0xC2, 0x01,
        0x42, 0x82, 0x01,
        0x00, 0x00, 0x00,
        0x00, 0x00, 0x00,
    ]

    LUT_KW_UPDATE_WHITE = [
        0x87, 0x87, 0x01,
        0x8C, 0xC2, 0x01,
        0x82, 0x82, 0x01,
        0x00, 0x00, 0x00,
        0x00, 0x00, 0x00,
    ]

    # LUT*_UPDATE_BLACK are used when updating display to turn on segments
    LUTV_UPDATE_BLACK = [
        0x90, 0x90, 0x01,
        0x90, 0x90, 0x01,
        0x82, 0x82, 0x01,
        0x00, 0x00, 0x00,
        0x00, 0x00, 0x00,
    ]

    LUT_KK_UPDATE_BLACK = [
        0x50, 0x50, 0x01,
        0x50, 0x50, 0x01,
        0x82, 0x82, 0x01,
        0x00, 0x00, 0x00,
        0x00, 0x00, 0x00,
    ]

    LUT_KW_UPDATE_BLACK = [
        0x90, 0x90, 0x01,
        0x90, 0x90, 0x01,
        0x82, 0x82, 0x01,
        0x00, 0x00, 0x00,
        0x00, 0x00, 0x00,
    ]

    def on_with_default_settings(self):
        """Turns on charge pump and sets default panel and power settings"""
        self.on()
        self.reset()
        # Panel and power settings based on logic analyzer captures
        # See HT16E07 datasheet for value descriptions
        self.send(self.PANEL_SETTING_PSR, [0x0f])
        self.send(self.POWER_SETTING_PWR, [0x0f, 0x0f])

        self.send(self.CHARGE_PUMP_ON_CPON)
        self.wait_until_not_busy()

    def off_with_default_settings(self):
        """Turns off charge pump"""
        self.wait_until_not_busy()
        # 0x03 = Segment, bg, and com voltages set to ground
        self.send(self.CHARGE_PUMP_OFF_CPOF, [0x03])
        self.off()
        self.reset()

    def wait_until_not_busy(self):
        """Waits until display is ready (until BUSY_N is high)"""
        while self.is_busy:
            idle()

    def send_luts(self, lutv, lut_kk, lut_kw):
        self.send(self.LUTV, lutv)
        self.send(self.LUT_KK, lut_kk)
        self.send(self.LUT_KW, lut_kw)

    def send_display_data(self, values):
        self.send(self.DATA_START_TRANSMISSION_DTM, values)
        self.send(self.DATA_STOP_DSP)
        self.send(self.DISPLAY_REFRESH_DRF)
        self.wait_until_not_busy()

    def full_clear(self):
        """Sends an update sequence that turns on then off all the segments.

        This should be called occasionally to remove any ghosting.
        """
        self.on_with_default_settings()

        # SF = 2Mhz, NF = 2MHz, Framerate = 20hz
        self.send(self.FRAME_RATE_CONTROL_FRC, [0x01])
        self.send_luts(self.LUTV_FULL_CLEAR,
                       self.LUT_KK_FULL_CLEAR,
                       self.LUT_KW_FULL_CLEAR)

        self.send_display_data([0xff] * 13)

        self.off_with_default_settings()

    def update_white(self, values):
        """Sets segments white/off"""
        self.on_with_default_settings()

        # SF = 2Mhz, NF = 2MHz, Framerate = 67hz
        self.send(self.FRAME_RATE_CONTROL_FRC, [0x05])
        self.send_luts(self.LUTV_UPDATE_WHITE,
                       self.LUT_KK_UPDATE_WHITE,
                       self.LUT_KW_UPDATE_WHITE)

        self.send_display_data(values)

        self.off_with_default_settings()

    def update_black(self, values):
        """Sets segments black/on"""
        self.on_with_default_settings()

        # SF = 2Mhz, NF = 2MHz, Framerate = 67hz
        self.send(self.FRAME_RATE_CONTROL_FRC, [0x05])
        self.send_luts(self.LUTV_UPDATE_BLACK,
                       self.LUT_KK_UPDATE_BLACK,
                       self.LUT_KW_UPDATE_BLACK)

        self.send_display_data(values)

        self.off_with_default_settings()

    def clear(self):
        self.update_white([0xff] * 13)

    def fill(self):
        self.update_black([0x00] * 13)
