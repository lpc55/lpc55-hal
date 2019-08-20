MEMORY
{
  FLASH : ORIGIN = 0x00000000, LENGTH = 630K

  /* for use with standard link.x */
  RAM : ORIGIN = 0x20000000, LENGTH = 256K

  /* would be used with proper link.x */
  /* needs changes to r0 (initialization code) */
  /* SRAM0 : ORIGIN = 0x20000000, LENGTH = 64K */
  /* SRAM1 : ORIGIN = 0x20010000, LENGTH = 64K */
  /* SRAM2 : ORIGIN = 0x20020000, LENGTH = 64K */
  /* SRAM3 : ORIGIN = 0x20030000, LENGTH = 64K */

  /* USB SRAM can also be used */
  /* ...but I think it needs to be powered up first */
  /* RAM : ORIGIN = 0x40100000, LENGTH = 16K */

}
