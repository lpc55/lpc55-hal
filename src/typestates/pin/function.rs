#![allow(non_camel_case_types)]
pub trait Function {}

pub struct SWCLK;
impl Function for SWCLK {}

pub struct SWDIO;
impl Function for SWDIO {}

pub struct USB0_VBUS;
impl Function for USB0_VBUS {}

// these are generated with `generate-flexcomm-pin-driver.py`
pub struct FC0_CTS_SDA_SSEL0;
impl Function for FC0_CTS_SDA_SSEL0 {}
pub struct FC0_RTS_SCL_SSEL1;
impl Function for FC0_RTS_SCL_SSEL1 {}
pub struct FC0_RXD_SDA_MOSI_DATA;
impl Function for FC0_RXD_SDA_MOSI_DATA {}
pub struct FC0_SCK;
impl Function for FC0_SCK {}
pub struct FC0_TXD_SCL_MISO_WS;
impl Function for FC0_TXD_SCL_MISO_WS {}
pub struct FC1_CTS_SDA_SSEL0;
impl Function for FC1_CTS_SDA_SSEL0 {}
pub struct FC1_RTS_SCL_SSEL1;
impl Function for FC1_RTS_SCL_SSEL1 {}
pub struct FC1_RXD_SDA_MOSI_DATA;
impl Function for FC1_RXD_SDA_MOSI_DATA {}
pub struct FC1_SCK;
impl Function for FC1_SCK {}
pub struct FC1_TXD_SCL_MISO_WS;
impl Function for FC1_TXD_SCL_MISO_WS {}
pub struct FC2_CTS_SDA_SSEL0;
impl Function for FC2_CTS_SDA_SSEL0 {}
pub struct FC2_RTS_SCL_SSEL1;
impl Function for FC2_RTS_SCL_SSEL1 {}
pub struct FC2_RXD_SDA_MOSI_DATA;
impl Function for FC2_RXD_SDA_MOSI_DATA {}
pub struct FC2_SCK;
impl Function for FC2_SCK {}
pub struct FC2_TXD_SCL_MISO_WS;
impl Function for FC2_TXD_SCL_MISO_WS {}
pub struct FC3_CTS_SDA_SSEL0;
impl Function for FC3_CTS_SDA_SSEL0 {}
pub struct FC3_RTS_SCL_SSEL1;
impl Function for FC3_RTS_SCL_SSEL1 {}
pub struct FC3_RXD_SDA_MOSI_DATA;
impl Function for FC3_RXD_SDA_MOSI_DATA {}
pub struct FC3_SCK;
impl Function for FC3_SCK {}
pub struct FC3_SSEL2;
impl Function for FC3_SSEL2 {}
pub struct FC3_SSEL3;
impl Function for FC3_SSEL3 {}
pub struct FC3_TXD_SCL_MISO_WS;
impl Function for FC3_TXD_SCL_MISO_WS {}
pub struct FC4_CTS_SDA_SSEL0;
impl Function for FC4_CTS_SDA_SSEL0 {}
pub struct FC4_RTS_SCL_SSEL1;
impl Function for FC4_RTS_SCL_SSEL1 {}
pub struct FC4_RXD_SDA_MOSI_DATA;
impl Function for FC4_RXD_SDA_MOSI_DATA {}
pub struct FC4_SCK;
impl Function for FC4_SCK {}
pub struct FC4_SSEL2;
impl Function for FC4_SSEL2 {}
pub struct FC4_SSEL3;
impl Function for FC4_SSEL3 {}
pub struct FC4_TXD_SCL_MISO_WS;
impl Function for FC4_TXD_SCL_MISO_WS {}
pub struct FC5_CTS_SDA_SSEL0;
impl Function for FC5_CTS_SDA_SSEL0 {}
pub struct FC5_RTS_SCL_SSEL1;
impl Function for FC5_RTS_SCL_SSEL1 {}
pub struct FC5_RXD_SDA_MOSI_DATA;
impl Function for FC5_RXD_SDA_MOSI_DATA {}
pub struct FC5_SCK;
impl Function for FC5_SCK {}
pub struct FC5_TXD_SCL_MISO_WS;
impl Function for FC5_TXD_SCL_MISO_WS {}
pub struct FC6_CTS_SDA_SSEL0;
impl Function for FC6_CTS_SDA_SSEL0 {}
pub struct FC6_RTS_SCL_SSEL1;
impl Function for FC6_RTS_SCL_SSEL1 {}
pub struct FC6_RXD_SDA_MOSI_DATA;
impl Function for FC6_RXD_SDA_MOSI_DATA {}
pub struct FC6_SCK;
impl Function for FC6_SCK {}
pub struct FC6_TXD_SCL_MISO_WS;
impl Function for FC6_TXD_SCL_MISO_WS {}
pub struct FC7_CTS_SDA_SSEL0;
impl Function for FC7_CTS_SDA_SSEL0 {}
pub struct FC7_RTS_SCL_SSEL1;
impl Function for FC7_RTS_SCL_SSEL1 {}
pub struct FC7_RXD_SDA_MOSI_DATA;
impl Function for FC7_RXD_SDA_MOSI_DATA {}
pub struct FC7_SCK;
impl Function for FC7_SCK {}
pub struct FC7_TXD_SCL_MISO_WS;
impl Function for FC7_TXD_SCL_MISO_WS {}

pub struct HS_SPI_SCK {}
impl Function for HS_SPI_SCK {}
pub struct HS_SPI_MOSI {}
impl Function for HS_SPI_MOSI {}
pub struct HS_SPI_MISO {}
impl Function for HS_SPI_MISO {}
pub struct HS_SPI_SSEL0 {}
impl Function for HS_SPI_SSEL0 {}
pub struct HS_SPI_SSEL1 {}
impl Function for HS_SPI_SSEL1 {}
pub struct HS_SPI_SSEL2 {}
impl Function for HS_SPI_SSEL2 {}
pub struct HS_SPI_SSEL3 {}
impl Function for HS_SPI_SSEL3 {}
