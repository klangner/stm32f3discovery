
MEMORY
{
  CCRAM : ORIGIN = 0x10000000, LENGTH = 8K
  FLASH : ORIGIN = 0x08000000, LENGTH = 256K
  RAM : ORIGIN = 0x20000000, LENGTH = 40K
}

ENTRY(_reset)

SECTIONS
{
  .text ORIGIN(FLASH) :
  {
    /* Vector table */
    LONG(ORIGIN(RAM) + LENGTH(RAM));
    LONG(_reset + 1);
    KEEP(*(.rodata._EXCEPTIONS));
    _eexceptions = .;
    /* Entry point: reset handler */
    _reset = .;
    *(.text._reset);

    *(.text.*);
    *(.rodata.*);
  } > FLASH
  /DISCARD/ :
  {
    *(.ARM.exidx.*)
    *(.bss.*)
    *(.data.*)
  }
}

/* HACK to make these symbols overrideable by _dependencies_ (they were
   already overridable by the top crate), we declare them as undefined
   (EXTERN) here. */
EXTERN(__aeabi_memclr4);
EXTERN(_default_exception_handler);
EXTERN(_init);

/* Exceptions */
PROVIDE(_nmi = _default_exception_handler);
PROVIDE(_hard_fault = _default_exception_handler);
PROVIDE(_memmanage_fault = _default_exception_handler);
PROVIDE(_bus_fault = _default_exception_handler);
PROVIDE(_usage_fault = _default_exception_handler);
PROVIDE(_svcall = _default_exception_handler);
PROVIDE(_pendsv = _default_exception_handler);
PROVIDE(_systick = _default_exception_handler);
ASSERT(_eexceptions - ORIGIN(FLASH) == 0x40, "exceptions not linked where expected");