class HT16E07:
    """Holtek HT16E07 electronic paper display (EPD) driver IC

    https://www.holtek.com/productdetail/-/vg/16E07
    """

    PANEL_SETTING_PSR = 0x00
    POWER_SETTING_PWR = 0x01
    CHARGE_PUMP_OFF_CPOF = 0x02
    CHARGE_PUMP_ON_CPON = 0x04
    DATA_START_TRANSMISSION_DTM = 0x10
    DATA_STOP_DSP = 0x11
    DISPLAY_REFRESH_DRF = 0x12
    LUTV = 0x20
    LUT_KK = 0x21
    LUT_KW = 0x22
    LUT_WK = 0x23
    LUT_WW = 0x24
    FRAME_RATE_CONTROL_FRC = 0x30
    TEMPERATURE_SENSOR_TSC = 0x40
    REVISION_REV = 0x70
    GET_STATUS_FLG = 0x71
    CASCADE_SETTING = 0xe0
    TEST_MODE = 0xfe

    def __init__(self, busy_n_pin, rst_n_pin, shd_n_pin, csp_pin,
                 scl_pin, sda_pin):
        self.busy_n_pin = busy_n_pin
        self.rst_n_pin = rst_n_pin
        self.shd_n_pin = shd_n_pin
        self.csp_pin = csp_pin
        self.scl_pin = scl_pin
        self.sda_pin = sda_pin

        self.rst_n_pin.off()
        self.shd_n_pin.off()
        self.csp_pin.off()
        self.scl_pin.off()
        self.sda_pin.off()

    def _send_value(self, d_cx, value):
        # print('send {} 0x{:02x}'.format(d_cx, value))
        self.csp_pin.off()

        self.sda_pin.value(d_cx)
        self.scl_pin.on()
        self.scl_pin.off()

        for bit in range(7, -1, -1):
            self.sda_pin.value(value >> bit & 0x1)
            self.scl_pin.on()
            self.scl_pin.off()
        self.csp_pin.on()

    def _send_command_value(self, value):
        self._send_value(0, value)

    def _send_data_value(self, value):
        self._send_value(1, value)

    def send(self, cmd, values=[]):
        """Sends a command with optional values"""
        self._send_command_value(cmd)
        for value in values:
            self._send_data_value(value)

    def reset(self):
        """Pulses RST_N pin low"""
        self.rst_n_pin.off()
        self.rst_n_pin.on()

    def on(self):
        """Sets CSP, RST_N, and SHD_N pin high"""
        self.csp_pin.on()
        self.rst_n_pin.on()
        self.shd_n_pin.on()

    def off(self):
        """Sets SHD_N pin low"""
        self.shd_n_pin.off()

    @property
    def is_busy(self):
        return not self.busy_n_pin.value()
