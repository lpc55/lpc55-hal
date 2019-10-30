data = """\
PIO0_0 , 2, FC3_SCK,
PIO0_1 , 2, FC3_CTS_SDA_SSEL0,
PIO0_2 , 1, FC3_TXD_SCL_MISO_WS,
PIO0_3 , 1, FC3_RXD_SDA_MOSI_DATA,
PIO0_4 , 2, FC4_SCK,
PIO0_5 , 2, FC4_RXD_SDA_MOSI_DATA,
PIO0_5 , 8, FC3_RTS_SCL_SSEL1,
PIO0_6 , 1, FC3_SCK,
PIO0_7 , 1, FC3_RTS_SCL_SSEL1,
PIO0_7 , 3, FC5_SCK,
PIO0_7 , 4, FC1_SCK,
PIO0_8 , 1, FC3_SSEL3,
PIO0_8 , 3, FC5_RXD_SDA_MOSI_DATA,
PIO0_9 , 1, FC3_SSEL2,
PIO0_9 , 3, FC5_TXD_SCL_MISO_WS,
PIO0_10, 1, FC6_SCK,
PIO0_10, 4, FC1_TXD_SCL_MISO_WS,
PIO0_11, 1, FC6_RXD_SDA_MOSI_DATA,
PIO0_12, 1, FC3_TXD_SCL_MISO_WS,
PIO0_12, 7, FC6_TXD_SCL_MISO_WS,
PIO0_13, 1, FC1_CTS_SDA_SSEL0,
PIO0_13, 5, FC1_RXD_SDA_MOSI_DATA,
PIO0_14, 1, FC1_RTS_SCL_SSEL1,
PIO0_14, 6, FC1_TXD_SCL_MISO_WS,
PIO0_15, 1, FC6_CTS_SDA_SSEL0,
PIO0_16, 1, FC4_TXD_SCL_MISO_WS,
PIO0_17, 1, FC4_SSEL2,
PIO0_18, 1, FC4_CTS_SDA_SSEL0,
PIO0_19, 1, FC4_RTS_SCL_SSEL1,
PIO0_19, 7, FC7_TXD_SCL_MISO_WS,
PIO0_20, 1, FC3_CTS_SDA_SSEL0,
PIO0_20, 7, FC7_RXD_SDA_MOSI_DATA,
PIO0_20, 1, FC4_TXD_SCL_MISO_WS,
PIO0_21, 1, FC3_RTS_SCL_SSEL1,
PIO0_21, 7, FC7_SCK,
PIO0_22, 1, FC6_TXD_SCL_MISO_WS,
PIO0_23, 5, FC0_CTS_SDA_SSEL0,
PIO0_24, 1, FC0_RXD_SDA_MOSI_DATA,
PIO0_25, 1, FC0_TXD_SCL_MISO_WS,
PIO0_26, 1, FC2_RXD_SDA_MOSI_DATA,
PIO0_26, 8, FC0_SCK,
PIO0_27, 1, FC2_TXD_SCL_MISO_WS,
PIO0_27, 7, FC7_RXD_SDA_MOSI_DATA,
PIO0_28, 1, FC0_SCK,
PIO0_29, 1, FC0_RXD_SDA_MOSI_DATA,
PIO0_30, 1, FC0_TXD_SCL_MISO_WS,
PIO0_31, 1, FC0_CTS_SDA_SSEL0,
PIO1_0 , 1, FC0_RTS_SCL_SSEL1,
PIO1_1 , 1, FC3_RXD_SDA_MOSI_DATA,
PIO1_4 , 1, FC0_SCK,
PIO1_5 , 1, FC0_RXD_SDA_MOSI_DATA,
PIO1_6 , 1, FC0_TXD_SCL_MISO_WS,
PIO1_7 , 1, FC0_RTS_SCL_SSEL1,
PIO1_8 , 1, FC0_CTS_SDA_SSEL0,
PIO1_8 , 5, FC4_SSEL2,
PIO1_9 , 2, FC1_SCK,
PIO1_9 , 5, FC4_CTS_SDA_SSEL0,
PIO1_10, 2, FC1_RXD_SDA_MOSI_DATA,
PIO1_11, 2, FC1_TXD_SCL_MISO_WS,
PIO1_12, 2, FC6_SCK,
PIO1_13, 2, FC6_RXD_SDA_MOSI_DATA,
PIO1_14, 4, FC5_CTS_SDA_SSEL0,
PIO1_15, 4, FC5_RTS_SCL_SSEL1,
PIO1_15, 5, FC4_RTS_SCL_SSEL1,
PIO1_16, 2, FC6_TXD_SCL_MISO_WS,
PIO1_17, 3, FC6_RTS_SCL_SSEL1,
PIO1_19, 5, FC4_SCK,
PIO1_20, 1, FC7_RTS_SCL_SSEL1,
PIO1_20, 5, FC4_TXD_SCL_MISO_WS,
PIO1_21, 1, FC7_CTS_SDA_SSEL0,
PIO1_21, 5, FC4_RXD_SDA_MOSI_DATA,
PIO1_22, 5, FC4_SSEL3,
PIO1_23, 1, FC2_SCK,
PIO1_23, 5, FC3_SSEL2,
PIO1_24, 1, FC2_RXD_SDA_MOSI_DATA,
PIO1_24, 5, FC3_SSEL3,
PIO1_25, 1, FC2_TXD_SCL_MISO_WS,
PIO1_26, 1, FC2_CTS_SDA_SSEL0,
PIO1_27, 1, FC2_RTS_SCL_SSEL1,
PIO1_28, 1, FC7_SCK,
PIO1_29, 1, FC7_RXD_SDA_MOSI_DATA,
PIO1_30, 1, FC7_TXD_SCL_MISO_WS,
PIO1_30, 1, FC7_RXD_SDA_MOSI_DATA"""

"""
- I2C
SCL I/O FCn_TXD_SCL_MISO_WS or FCn_RTS_SCL_SSEL1
SDA I/O FCn_RXD_SDA_MOSI_DATA or FCn_CTS_SDA_SSEL0

- USART
TXD O FCn_TXD_SCL_MISO_WS
RXD I FCn_RXD_SDA_MOSI_DATA
RTS O FCn_RTS_SCL_SSEL1
CTS I FCn_CTS_SDA_SSEL0
CLK I/O FCn_SCK

- SPI
SCK I/O FCn_SCK or HS_SPI_SCK
MOSI I/O FCn_RXD_SDA_MOSI_DATA or HS_SPI_MOSI
MISO I/O FCn_TXD_SCL_MISO_WSHS_SPI_MISO
SSEL0 I/O FCn_CTS_SDA_SSEL0 or HS_SPI_SSEL0
SSEL1 I/O FCn_RTS_SCL_SSEL1 or HS_SPI_SSEL1
SSEL2 I/O FCn_SSEL2 or HS_SPI_SSEL2
SSEL3 I/O FCn_SSEL3 or HS_SPI_SSEL3

- I2S
SCK I/O FCn_SCK
WS I/O FCn_TXD_SCL_MISO_WS
SDA I/O FCn_RXD_SDA_MOSI_DATA
MCLK I/O MCLK
"""


def some_lower(name):
    return name[:1].upper() + name[1:].lower()


configs = [list(map(str.strip, entry.split(","))) for entry in data.split(",\n")]
trait_impls = []
definitions = []
for config in configs:
    pin = config[0]
    alt = config[1]
    fci, kinds = config[2].split("_", 1)
    i = fci[-1]
    if kinds.count("_") == 0:
        if kinds.startswith("SSEL"):
            entries = {"SPI": kinds}
        else:
            assert kinds == "SCK", kinds
            entries = {"USART": "CLK"}
    if kinds.count("_") == 2:
        entries = dict(zip(["USART", "I2C", "SPI"], kinds.split("_")))
    if kinds.count("_") == 3:
        entries = dict(zip(["USART", "I2C", "SPI", "I2S"], kinds.split("_")))

    # print(entries)
    for p, k in entries.items():
        if k in ("RXD", "TXD"):
            k = k[:2]
        if p == "I2S" and k == "DATA":
            k = "SDA"
        if p == "USART" and k == "CLK":
            k = "SCLK"
        pin_type = some_lower(p) + some_lower(k) + "Pin"
        tech = config[2]
        p2 = p + i

        trait_impls.append(
            f"impl<PIO: PinId> {pin_type}<PIO, {some_lower(p2)}> for Pin<PIO, Special<{tech}>> {{}}"
        )
        # this is because there are sometimes (Pio0_13 and Pio)_14) multiple alternate functions
        # enabling the same thing e.g., FC1_RTS_SCL_SSEL1 and FC1_TXD_SCL_MISO_WS both would generate
        # a method `into_i2c1_scl_pin()`
        definition = (pin, p2, k)
        if definition in definitions:
            continue
        else:
            definitions.append(definition)
        print(
            f"""\
impl Pin<{some_lower(pin)}, pin_state::Unused> {{
    pub fn into_{p2.lower()}_{k.lower()}_pin(
        self,
        iocon: &mut Iocon<init_state::Enabled>,
    ) ->Pin<{some_lower(pin)}, pin_state::Special<{tech}>> {{
        // unfortunately, data sheet has more FUNCs than SVD has alts
        // otherwise, it would be safe
        iocon.raw.{pin.lower()}.modify(|_, w| unsafe {{
            w
            .func().bits({alt}) // FUNC{alt}, pin configured as {tech}
            .mode().inactive() // MODE_INACT, no additional pin function
            .slew().standard() // SLEW_STANDARD, standard mode, slew rate control is enabled
            .invert().disabled() // INV_DI, input function is not inverted
            .digimode().digital() // DIGITAL_EN, enable digital fucntion
            .od().normal() // OPENDRAIN_DI, open drain is disabled
        }});

        Pin {{
            id: self.id,
            state: Special {{
                _function: {tech},
            }},
        }}
    }}
}}"""
        )

for trait_impl in sorted(set(trait_impls)):
    print(trait_impl)

for function in sorted(set(list(c[2] for c in configs))):
    print(
        f"""\
pub struct {function};
impl Function for {function} {{}}"""
    )
