INCLUDE memory.x

ENTRY(_start_0);

EXTERN(VECTORS_0);
EXTERN(VECTORS_1);
EXTERN(_start_1);

_stack_start_0 = ORIGIN(SRAM0) + LENGTH(SRAM0);
_stack_start_1 = ORIGIN(SRAM1) + LENGTH(SRAM1);

SECTIONS
{
  .vectors_0 :
  {
    LONG(_stack_start_0);
    LONG(_start_0);
    KEEP(*(.vectors_0));
  } > FLASH

  .text :
  {
    *(.text_0.*);
    *(.text .text.*);
  } > FLASH

  .rodata :
  {
    *(.rodata .rodata.*);

    /* align the LMA of the following sections */
    . = ALIGN(4);
  } > FLASH

  /* start of core-specific RTFM sections */
  .data_0 : ALIGN(4)
  {
    *(.data_0.*);
    . = ALIGN(4);
  } > SRAM0 AT > FLASH

  _sdata_0 = ADDR(.data_0);
  _edata_0 = ADDR(.data_0) + SIZEOF(.data_0);
  _sidata_0 = LOADADDR(.data_0);

  .bss_0 (NOLOAD) : ALIGN(4)
  {
    *(.bss_0.*);
    . = ALIGN(4);
  } > SRAM0

  /* _sbss_0 = _edata_0; /\* asserted below *\/ */
  _ebss_0 = ADDR(.bss_0) + SIZEOF(.bss_0);

  .uninit_0 (NOLOAD) :
  {
    *(.uninit_0.*);
  } > SRAM0

  .vectors_1 :
  {
    LONG(_stack_start_1);
    LONG(_start_1);
    KEEP(*(.vectors_1));
  } > SRAM1 AT > FLASH

  .text_1 :
  {
    *(.text_1.*);
    . = ALIGN(4);
  } > SRAM1 AT > FLASH

  .data_1 : ALIGN(4)
  {
    *(.data_1.*);
    . = ALIGN(4);
  } > SRAM1 AT > FLASH

  _sslave = ADDR(.vectors_1);
  _eslave = ADDR(.data_1) + SIZEOF(.data_1);
  _sislave = LOADADDR(.vectors_1);

  .bss_1 (NOLOAD) : ALIGN(4)
  {
    *(.bss_1.*);
    . = ALIGN(4);
  } > SRAM1

  /* _sbss_1 = _eslave; /\* asserted below *\/ */
  _ebss_1 = ADDR(.bss_1) + SIZEOF(.bss_1);

  .uninit_1 (NOLOAD) :
  {
    *(.uninit_1.*);
  } > SRAM1

  /* end of core-specific RTFM sections */

  .data : ALIGN(4)
  {
    *(.data .data.*);
    . = ALIGN(4);
  } > SRAM2 AT > FLASH

  _sdata = ADDR(.data);
  _edata = ADDR(.data) + SIZEOF(.data);
  _sidata = LOADADDR(.data);

  .bss (NOLOAD) : ALIGN(4)
  {
    *(.bss .bss.*);
    . = ALIGN(4);
  } > SRAM2

  /* _sbss = _edata; /\* asserted below *\/ */
  _ebss = ADDR(.bss) + SIZEOF(.bss);

  .uninit (NOLOAD) :
  {
    *(.uninit .uninit.*);
  } > SRAM2

  /DISCARD/ :
  {
    *(.ARM.exidx);
    *(.ARM.exidx.*);
    *(.ARM.extab.*);
  }
}

ASSERT(ADDR(.vectors_0) == ORIGIN(FLASH), ".vectors_0 not aligned");
ASSERT(ADDR(.vectors_1) == ORIGIN(SRAM1), ".vectors_1 not aligned");

ASSERT(_sdata_0 % 4 == 0 && _edata_0 % 4 == 0 && _sidata_0 % 4 == 0, ".data_0 not aligned");
ASSERT(_ebss_0 % 4 == 0, ".bss_0 not aligned");
ASSERT(_sslave % 4 == 0 && _eslave % 4 == 0 && _sislave % 4 == 0, "slave memory not aligned");
ASSERT(_ebss_1 % 4 == 0, ".bss_1 not aligned");
ASSERT(_sdata % 4 == 0 && _edata % 4 == 0 && _sidata % 4 == 0, ".data not aligned");
ASSERT(_ebss % 4 == 0, ".bss not aligned");

ASSERT(_edata_0 == ADDR(.bss_0), ".data_0 and .bss_0 are not contiguous");
ASSERT(
  ADDR(.vectors_1) + SIZEOF(.vectors_1) == ADDR(.text_1) &&
  LOADADDR(.vectors_1) + SIZEOF(.vectors_1) == LOADADDR(.text_1),
  ".vectors_1 and .text_1 are not contiguous");
ASSERT(
  ADDR(.text_1) + SIZEOF(.text_1) == ADDR(.data_1) &&
  LOADADDR(.text_1) + SIZEOF(.text_1) == LOADADDR(.data_1),
  ".text_1 and .data_1 are not contiguous");
ASSERT(_eslave == ADDR(.bss_1), ".data_1 and .bss_1 are not contiguous");
ASSERT(_edata == ADDR(.bss), ".data and .bss are not contiguous");

PROVIDE(NonMaskableInt_0 = DefaultHandler);
PROVIDE(HardFault_0 = DefaultHandler);
PROVIDE(MemoryManagement_0 = DefaultHandler);
PROVIDE(BusFault_0 = DefaultHandler);
PROVIDE(UsageFault_0 = DefaultHandler);
PROVIDE(SecureFault_0 = DefaultHandler);
PROVIDE(SVCall_0 = DefaultHandler);
PROVIDE(DebugMonitor_0 = DefaultHandler);
PROVIDE(PendSV_0 = DefaultHandler);
PROVIDE(SysTick_0 = DefaultHandler);

PROVIDE(WDT_0 = DefaultHandler);
PROVIDE(SDMA0_0 = DefaultHandler);
PROVIDE(GPIO_GLOBALINT0_0 = DefaultHandler);
PROVIDE(GPIO_GLOBALINT1_0 = DefaultHandler);
PROVIDE(GPIO_INT0_IRQ0_0 = DefaultHandler);
PROVIDE(GPIO_INT0_IRQ1_0 = DefaultHandler);
PROVIDE(GPIO_INT0_IRQ2_0 = DefaultHandler);
PROVIDE(GPIO_INT0_IRQ3_0 = DefaultHandler);
PROVIDE(UTICK_0 = DefaultHandler);
PROVIDE(MRT_0 = DefaultHandler);
PROVIDE(CTIMER0_0 = DefaultHandler);
PROVIDE(CTIMER1_0 = DefaultHandler);
PROVIDE(SCT_0 = DefaultHandler);
PROVIDE(CTIMER3_0 = DefaultHandler);
PROVIDE(Flexcomm0_0 = DefaultHandler);
PROVIDE(Flexcomm1_0 = DefaultHandler);
PROVIDE(Flexcomm2_0 = DefaultHandler);
PROVIDE(Flexcomm3_0 = DefaultHandler);
PROVIDE(Flexcomm4_0 = DefaultHandler);
PROVIDE(Flexcomm5_0 = DefaultHandler);
PROVIDE(Flexcomm6_0 = DefaultHandler);
PROVIDE(Flexcomm7_0 = DefaultHandler);
PROVIDE(ADC_0 = DefaultHandler);
PROVIDE(ACMP_0 = DefaultHandler);
PROVIDE(USB0_NEEDCLK_0 = DefaultHandler);
PROVIDE(USB0_0 = DefaultHandler);
PROVIDE(RTC_0 = DefaultHandler);
PROVIDE(MAILBOX_0 = DefaultHandler);
PROVIDE(PIN_INT4_0 = DefaultHandler);
PROVIDE(PIN_INT5_0 = DefaultHandler);
PROVIDE(PIN_INT6_0 = DefaultHandler);
PROVIDE(PIN_INT7_0 = DefaultHandler);
PROVIDE(CTIMER2_0 = DefaultHandler);
PROVIDE(CTIMER4_0 = DefaultHandler);
PROVIDE(OSEVTIMER_0 = DefaultHandler);
PROVIDE(SDIO_0 = DefaultHandler);
PROVIDE(USB1_0 = DefaultHandler);
PROVIDE(USB1_NEEDCLK_0 = DefaultHandler);
PROVIDE(HYPERVISOR_0 = DefaultHandler);
PROVIDE(SGPIO_INT0_IRQ0_0 = DefaultHandler);
PROVIDE(SGPIO_INT0_IRQ1_0 = DefaultHandler);
PROVIDE(PLU_0 = DefaultHandler);
PROVIDE(SEC_VIO_0 = DefaultHandler);
PROVIDE(HASH_0 = DefaultHandler);
PROVIDE(CASPER_0 = DefaultHandler);
PROVIDE(PUF_0 = DefaultHandler);
PROVIDE(PQ_0 = DefaultHandler);
PROVIDE(SDMA1_0 = DefaultHandler);
PROVIDE(HS_SPI_0 = DefaultHandler);

PROVIDE(NonMaskableInt_1 = DefaultHandler);
PROVIDE(HardFault_1 = DefaultHandler);
PROVIDE(MemoryManagement_1 = DefaultHandler);
PROVIDE(BusFault_1 = DefaultHandler);
PROVIDE(UsageFault_1 = DefaultHandler);
PROVIDE(SecureFault_1 = DefaultHandler);
PROVIDE(SVCall_1 = DefaultHandler);
PROVIDE(DebugMonitor_1 = DefaultHandler);
PROVIDE(PendSV_1 = DefaultHandler);
PROVIDE(SysTick_1 = DefaultHandler);

PROVIDE(WDT_1 = DefaultHandler);
PROVIDE(SDMA0_1 = DefaultHandler);
PROVIDE(GPIO_GLOBALINT0_1 = DefaultHandler);
PROVIDE(GPIO_GLOBALINT1_1 = DefaultHandler);
PROVIDE(GPIO_INT0_IRQ0_1 = DefaultHandler);
PROVIDE(GPIO_INT0_IRQ1_1 = DefaultHandler);
PROVIDE(GPIO_INT0_IRQ2_1 = DefaultHandler);
PROVIDE(GPIO_INT0_IRQ3_1 = DefaultHandler);
PROVIDE(UTICK_1 = DefaultHandler);
PROVIDE(MRT_1 = DefaultHandler);
PROVIDE(CTIMER0_1 = DefaultHandler);
PROVIDE(CTIMER1_1 = DefaultHandler);
PROVIDE(SCT_1 = DefaultHandler);
PROVIDE(CTIMER3_1 = DefaultHandler);
PROVIDE(Flexcomm0_1 = DefaultHandler);
PROVIDE(Flexcomm1_1 = DefaultHandler);
PROVIDE(Flexcomm2_1 = DefaultHandler);
PROVIDE(Flexcomm3_1 = DefaultHandler);
PROVIDE(Flexcomm4_1 = DefaultHandler);
PROVIDE(Flexcomm5_1 = DefaultHandler);
PROVIDE(Flexcomm6_1 = DefaultHandler);
PROVIDE(Flexcomm7_1 = DefaultHandler);
PROVIDE(ADC_1 = DefaultHandler);
PROVIDE(ACMP_1 = DefaultHandler);
PROVIDE(USB0_NEEDCLK_1 = DefaultHandler);
PROVIDE(USB0_1 = DefaultHandler);
PROVIDE(RTC_1 = DefaultHandler);
PROVIDE(MAILBOX_1 = DefaultHandler);
PROVIDE(PIN_INT4_1 = DefaultHandler);
PROVIDE(PIN_INT5_1 = DefaultHandler);
PROVIDE(PIN_INT6_1 = DefaultHandler);
PROVIDE(PIN_INT7_1 = DefaultHandler);
PROVIDE(CTIMER2_1 = DefaultHandler);
PROVIDE(CTIMER4_1 = DefaultHandler);
PROVIDE(OSEVTIMER_1 = DefaultHandler);
PROVIDE(SDIO_1 = DefaultHandler);
PROVIDE(USB1_1 = DefaultHandler);
PROVIDE(USB1_NEEDCLK_1 = DefaultHandler);
PROVIDE(HYPERVISOR_1 = DefaultHandler);
PROVIDE(SGPIO_INT0_IRQ0_1 = DefaultHandler);
PROVIDE(SGPIO_INT0_IRQ1_1 = DefaultHandler);
PROVIDE(PLU_1 = DefaultHandler);
PROVIDE(SEC_VIO_1 = DefaultHandler);
PROVIDE(HASH_1 = DefaultHandler);
PROVIDE(CASPER_1 = DefaultHandler);
PROVIDE(PUF_1 = DefaultHandler);
PROVIDE(PQ_1 = DefaultHandler);
PROVIDE(SDMA1_1 = DefaultHandler);
PROVIDE(HS_SPI_1 = DefaultHandler);
