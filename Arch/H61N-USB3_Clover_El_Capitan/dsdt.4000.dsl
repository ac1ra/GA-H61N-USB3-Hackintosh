/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20150515-64
 * Copyright (c) 2000 - 2015 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of dsdt.aml, Fri Mar  4 11:54:19 2016
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x000049E0 (18912)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0x2F
 *     OEM ID           "Apple "
 *     OEM Table ID     "GBTUACPI"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20150515 (538248469)
 */
DefinitionBlock ("dsdt.4000.aml", "DSDT", 1, "Apple ", "GBTUACPI", 0x00001000)
{
    Name (VER0, "Clover autopatched modified by tluck for HD4000")
    Name (WXP1, "Windows 2001")
    Method (GET9, 2, NotSerialized)
    {
        CreateByteField (Arg0, Arg1, TCH9)
        Return (TCH9) /* \GET9.TCH9 */
    }

    Method (STR9, 2, NotSerialized)
    {
        Name (STR8, Buffer (0x50) {})
        Name (STR9, Buffer (0x50) {})
        STR8 = Arg0
        STR9 = Arg1
        Local0 = Zero
        Local1 = One
        While (Local1)
        {
            Local1 = GET9 (STR8, Local0)
            Local2 = GET9 (STR9, Local0)
            If ((Local1 != Local2))
            {
                Return (Zero)
            }

            Local0++
        }

        Return (One)
    }

    Method (OOSI, 1, NotSerialized)
    {
        If (STR9 (WXP1, Arg0))
        {
            Return (One)
        }

        Return (Zero)
    }

    Scope (_PR)
    {
        Processor (CPU0, 0x00, 0x00000410, 0x06) {}
        Processor (CPU1, 0x01, 0x00000410, 0x06) {}
        Processor (CPU2, 0x02, 0x00000410, 0x06) {}
        Processor (CPU3, 0x03, 0x00000410, 0x06) {}
        Processor (CPU4, 0x04, 0x00000410, 0x06) {}
        Processor (CPU5, 0x05, 0x00000410, 0x06) {}
        Processor (CPU6, 0x06, 0x00000410, 0x06) {}
        Processor (CPU7, 0x07, 0x00000410, 0x06) {}
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    Name (SS1, Package (0x04)
    {
        One, 
        Zero, 
        Zero, 
        Zero
    })
    Name (_S3, Package (0x04)  // _S3_: S3 System State
    {
        0x05, 
        Zero, 
        Zero, 
        Zero
    })
    Name (_S4, Package (0x04)  // _S4_: S4 System State
    {
        0x06, 
        Zero, 
        Zero, 
        Zero
    })
    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x07, 
        Zero, 
        Zero, 
        Zero
    })
    Name (FLAG, Zero)
    Name (STAT, Zero)
    OperationRegion (SMOD, SystemMemory, 0x000FF840, One)
    Field (SMOD, ByteAcc, NoLock, Preserve)
    {
            ,   7, 
        SUSF,   1
    }

    OperationRegion (LBOC, SystemMemory, 0x000FF820, 0x02)
    Field (LBOC, ByteAcc, NoLock, Preserve)
    {
        UBMC,   1, 
        Offset (0x02)
    }

    OperationRegion (DEBG, SystemIO, 0x80, One)
    Field (DEBG, ByteAcc, NoLock, Preserve)
    {
        DBG1,   8
    }

    OperationRegion (RCRB, SystemMemory, 0xFED1C000, 0x4000)
    Field (RCRB, DWordAcc, Lock, Preserve)
    {
        Offset (0x3404), 
            ,   7, 
        HPTF,   1
    }

    OperationRegion (ELKM, SystemMemory, 0x000FFFEA, One)
    Field (ELKM, ByteAcc, NoLock, Preserve)
    {
            ,   1, 
            ,   1, 
        ELSO,   1, 
            ,   1, 
            ,   1, 
            ,   1, 
            ,   1
    }

    OperationRegion (EXTM, SystemMemory, 0x000FF830, 0x10)
    Field (EXTM, WordAcc, NoLock, Preserve)
    {
        ROM1,   16, 
        RMS1,   16, 
        ROM2,   16, 
        RMS2,   16, 
        ROM3,   16, 
        RMS3,   16, 
        AMEM,   32
    }

    OperationRegion (SMIC, SystemIO, 0xB2, One)
    Field (SMIC, ByteAcc, NoLock, Preserve)
    {
        SCP,    8
    }

    OperationRegion (TCOI, SystemIO, 0x0460, 0x08)
    Field (TCOI, WordAcc, NoLock, Preserve)
    {
        Offset (0x04), 
            ,   9, 
        SCIS,   1, 
        Offset (0x06)
    }

    OperationRegion (GP2C, SystemIO, 0x042C, 0x02)
    Field (GP2C, ByteAcc, NoLock, Preserve)
    {
        G2C1,   8, 
        G2C2,   8
    }

    OperationRegion (APMP, SystemIO, 0xB2, 0x02)
    Field (APMP, ByteAcc, NoLock, Preserve)
    {
        APMC,   8, 
        APMD,   8
    }

    OperationRegion (AGPS, SystemIO, 0x0438, 0x04)
    Field (AGPS, ByteAcc, NoLock, Preserve)
    {
        GPSE,   16, 
        GPSS,   16
    }

    OperationRegion (GPCN, SystemIO, 0x0442, One)
    Field (GPCN, ByteAcc, NoLock, Preserve)
    {
            ,   1, 
        SWGC,   1, 
        Offset (0x01)
    }

    Name (OSFX, One)
    Name (LINX, Zero)
    Name (AMAC, Zero)
    Name (OSFL, One)
    Method (STRC, 2, NotSerialized)
    {
        If ((SizeOf (Arg0) != SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Local0 = (SizeOf (Arg0) + One)
        Name (BUF0, Buffer (Local0) {})
        Name (BUF1, Buffer (Local0) {})
        BUF0 = Arg0
        BUF1 = Arg1
        While (Local0)
        {
            Local0--
            If ((DerefOf (Index (BUF0, Local0)) != DerefOf (Index (BUF1, Local0
                ))))
            {
                Return (Zero)
            }
        }

        Return (One)
    }

    OperationRegion (INFO, SystemMemory, 0x000FF840, One)
    Field (INFO, ByteAcc, NoLock, Preserve)
    {
        KBDI,   1, 
        RTCW,   1, 
        PS2F,   1, 
        IRFL,   2, 
        DISE,   1, 
        SSHU,   1
    }

    Scope (\)
    {
        Name (PICF, Zero)
        Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
        {
            PICF = Arg0
        }
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        Local0 = (Arg0 | 0xF0)
        DBG1 = Local0
        OSTP ()
        Local0 = (Arg0 | 0xF0)
        DBG1 = Local0
        If ((Arg0 == One)) {}
        If ((Arg0 == 0x03)) {}
        If ((Arg0 == 0x05))
        {
            SMIP = 0x99
        }

        If ((Arg0 == 0x04))
        {
            If (!PICF)
            {
                Sleep (0x64)
            }
        }
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        DBG1 = 0xFF
        If ((Arg0 == 0x04))
        {
            If ((OSFL == One))
            {
                SMIP = 0x56
            }

            If ((OSFL == 0x02))
            {
                SMIP = 0x57
            }

            If ((OSFL == Zero))
            {
                Local0 = 0x58
                If ((OSFX == 0x03))
                {
                    Local0 = 0x59
                }

                If ((OSFX == 0x05))
                {
                    Local0 = 0x5B
                }

                If ((OSFX == 0x07))
                {
                    Local0 = 0x5D
                }

                SMIP = Local0
            }
        }

        If ((Arg0 == One)) {}
        If (OSFL)
        {
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }
        Else
        {
            If ((RTCW == Zero))
            {
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }
        }
    }

    Scope (_SI)
    {
        Method (_MSG, 1, NotSerialized)  // _MSG: Message
        {
            Local0 = Zero
        }

        Method (_SST, 1, NotSerialized)  // _SST: System Status
        {
            Local0 = Zero
        }
    }

    Scope (_GPE)
    {
        Method (_L06, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            If (\_SB.PCI0.IGPU.GSSE)
            {
                \_SB.PCI0.IGPU.OPRN ()
            }
            Else
            {
                SCIS = One
            }
        }

        Method (_L0D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.EH01, 0x02) // Device Wake
            Notify (\_SB.PCI0.EH02, 0x02) // Device Wake
            Notify (\_SB.PWRB, 0x02) // Device Wake
            Notify (\_SB.PCI0.HDEF, 0x02) // Device Wake
        }

        Method (_L0B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.HUB0, 0x02) // Device Wake
        }

        Method (_L09, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.PEX0, 0x02) // Device Wake
            Notify (\_SB.PCI0.PEX1, 0x02) // Device Wake
            Notify (\_SB.PCI0.PEX2, 0x02) // Device Wake
            Notify (\_SB.PCI0.PEX3, 0x02) // Device Wake
            Notify (\_SB.PCI0.PEX4, 0x02) // Device Wake
            Notify (\_SB.PCI0.PEX5, 0x02) // Device Wake
            Notify (\_SB.PCI0.PEX6, 0x02) // Device Wake
            Notify (\_SB.PCI0.PEX7, 0x02) // Device Wake
        }
    }

    Scope (_SB)
    {
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0B)
            }
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03") /* PCI Bus */)  // _HID: Hardware ID
            Name (_ADR, Zero)  // _ADR: Address
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_BBN, Zero)  // _BBN: BIOS Bus Number
            OperationRegion (MMDR, PCI_Config, 0x90, 0x30)
            Scope (\)
            {
                Field (\_SB.PCI0.MMDR, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x08), 
                    Offset (0x10), 
                    Offset (0x18), 
                    Offset (0x20), 
                    SMBD,   32, 
                    SMBG,   32, 
                    TSMB,   32, 
                    TLUD,   32
                }
            }

            Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
            {
                If ((OSFL == 0x02))
                {
                    Return (0x02)
                }
                Else
                {
                    Return (0x03)
                }
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    WordBusNumber (ResourceConsumer, MinNotFixed, MaxNotFixed, PosDecode,
                        0x0000,             // Granularity
                        0x0000,             // Range Minimum
                        0x003F,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0040,             // Length
                        ,, )
                    IO (Decode16,
                        0x0CF8,             // Range Minimum
                        0x0CF8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        )
                    WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                        0x0000,             // Granularity
                        0x0000,             // Range Minimum
                        0x0CF7,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0CF8,             // Length
                        ,, , TypeStatic)
                    WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                        0x0000,             // Granularity
                        0x0D00,             // Range Minimum
                        0xFFFF,             // Range Maximum
                        0x0000,             // Translation Offset
                        0xF300,             // Length
                        ,, , TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000A0000,         // Range Minimum
                        0x000BFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00020000,         // Length
                        ,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000C0000,         // Range Minimum
                        0x000DFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00020000,         // Length
                        ,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0xFED40000,         // Range Minimum
                        0xFED44FFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00005000,         // Length
                        ,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x00100000,         // Range Minimum
                        0xFEBFFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0xFEB00000,         // Length
                        ,, _Y00, AddressRangeMemory, TypeStatic)
                })
                CreateDWordField (BUF0, \_SB.PCI0._CRS._Y00._MIN, TCMM)  // _MIN: Minimum Base Address
                CreateDWordField (BUF0, \_SB.PCI0._CRS._Y00._LEN, TOMM)  // _LEN: Length
                TCMM = TLUD /* \TLUD */
                TOMM = (0xFEC00000 - TCMM) /* \_SB_.PCI0._CRS.TCMM */
                Return (BUF0) /* \_SB_.PCI0._CRS.BUF0 */
            }

            Name (PICM, Package (0x1F)
            {
                Package (0x04)
                {
                    0x0002FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    0x03, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001BFFFF, 
                    Zero, 
                    LNK0, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x03, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x03, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    Zero, 
                    LNK1, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    One, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x03, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    One, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    One, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    One, 
                    LNKF, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }
            })
            Name (APIC, Package (0x23)
            {
                Package (0x04)
                {
                    0x0002FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001BFFFF, 
                    Zero, 
                    Zero, 
                    0x16
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    Zero, 
                    Zero, 
                    0x17
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    One, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x03, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    One, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    One, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    One, 
                    Zero, 
                    0x15
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }
            })
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (!PICF)
                {
                    Return (PICM) /* \_SB_.PCI0.PICM */
                }
                Else
                {
                    Return (APIC) /* \_SB_.PCI0.APIC */
                }
            }

            Device (IGPU)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                OperationRegion (IGDP, PCI_Config, 0x40, 0xC0)
                Field (IGDP, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x12), 
                        ,   1, 
                    GIVD,   1, 
                        ,   2, 
                    GUMA,   3, 
                    Offset (0x14), 
                        ,   4, 
                    GMFN,   1, 
                    Offset (0x18), 
                    SSRW,   32, 
                    Offset (0xA4), 
                    ASLE,   8, 
                    Offset (0xA8), 
                    GSSE,   1, 
                    GSSB,   14, 
                    GSES,   1, 
                    Offset (0xB0), 
                    Offset (0xB1), 
                    CDVL,   5, 
                    Offset (0xB2), 
                    Offset (0xBC), 
                    ASLS,   32
                }

                OperationRegion (IGDM, SystemMemory, 0xDCF40800, 0x2040)
                Field (IGDM, AnyAcc, NoLock, Preserve)
                {
                    SIGN,   128, 
                    SIZE,   32, 
                    OVER,   32, 
                    SVER,   256, 
                    VVER,   128, 
                    GVER,   128, 
                    MBOX,   32, 
                    Offset (0x100), 
                    DRDY,   32, 
                    CSTS,   32, 
                    CEVT,   32, 
                    Offset (0x120), 
                    DIDL,   256, 
                    CPDL,   256, 
                    CADL,   256, 
                    NADL,   256, 
                    ASLP,   32, 
                    TIDX,   32, 
                    CHPD,   32, 
                    CLID,   32, 
                    CDCK,   32, 
                    SXSW,   32, 
                    EVTS,   32, 
                    CNOT,   32, 
                    NRDY,   32, 
                    Offset (0x200), 
                    SCIE,   1, 
                    GEFC,   4, 
                    GXFC,   3, 
                    GESF,   8, 
                    Offset (0x204), 
                    PARM,   32, 
                    DSLP,   32, 
                    Offset (0x300), 
                    ARDY,   32, 
                    ASLC,   32, 
                    TCHE,   32, 
                    ALSI,   32, 
                    BCLP,   32, 
                    PFIT,   32, 
                    Offset (0x400), 
                    GVD1,   57344, 
                    IBTT,   8, 
                    IPAT,   8, 
                    ITVF,   8, 
                    ITVM,   8, 
                    IPSC,   8, 
                    IBLC,   8, 
                    IBIA,   8, 
                    ISSC,   8, 
                    I409,   8, 
                    I509,   8, 
                    I609,   8, 
                    I709,   8, 
                    IDMM,   8, 
                    IDMS,   8, 
                    IF1E,   8, 
                    GSMI,   8, 
                    HVCO,   8, 
                    LIDS,   8, 
                    CGCS,   16
                }

                Name (DBTB, Package (0x11)
                {
                    Zero, 
                    One, 
                    0x02, 
                    0x03, 
                    0x04, 
                    0x05, 
                    0x06, 
                    0x07, 
                    0x08, 
                    0x09, 
                    0x0A, 
                    0x10, 
                    0x11, 
                    0x12, 
                    0x13, 
                    0x14, 
                    0xFF
                })
                Name (SUCC, One)
                Name (NVLD, 0x02)
                Name (CRIT, 0x04)
                Name (NCRT, 0x06)
                Method (OPRN, 0, Serialized)
                {
                    Method (GBDA, 0, Serialized)
                    {
                        If ((GESF == Zero))
                        {
                            PARM = Zero
                            PARM |= One
                            PARM |= 0x08
                            PARM |= 0x10
                            PARM |= 0x20
                            PARM |= 0x40
                            PARM |= 0x0200
                            GESF = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If ((GESF == One))
                        {
                            PARM = 0x0240
                            GESF = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If ((GESF == 0x04))
                        {
                            Name (LOOP, Zero)
                            PARM &= 0xFFFFFF00
                            PARM |= DerefOf (Index (DBTB, IBTT))
                            GESF = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If ((GESF == 0x05))
                        {
                            PARM = IPSC /* \_SB_.PCI0.IGPU.IPSC */
                            PARM |= (IPAT << 0x08)
                            PARM += 0x0100
                            PARM |= (LIDS << 0x10)
                            PARM += 0x00010000
                            PARM |= (IBIA << 0x14)
                            GESF = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If ((GESF == 0x06))
                        {
                            PARM = ITVF /* \_SB_.PCI0.IGPU.ITVF */
                            PARM |= (ITVM << 0x04)
                            GESF = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If ((GESF == 0x07))
                        {
                            PARM = GIVD /* \_SB_.PCI0.IGPU.GIVD */
                            PARM ^= One
                            PARM |= (GMFN << One)
                            PARM |= 0x1800
                            If ((IDMM == Zero))
                            {
                                PARM |= (IDMS << 0x0D)
                            }

                            If (((IDMM == One) || (IDMM == 0x03)))
                            {
                                PARM |= (IDMS << 0x11)
                            }

                            PARM |= (CGCS << 0x15)
                            GESF = One
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If ((GESF == 0x0A))
                        {
                            PARM = Zero
                            If (ISSC)
                            {
                                PARM |= 0x03
                            }

                            GESF = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        GESF = Zero
                        Return (CRIT) /* \_SB_.PCI0.IGPU.CRIT */
                    }

                    Method (SBCB, 0, Serialized)
                    {
                        If ((GESF == Zero))
                        {
                            PARM = Zero
                            GESF = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If ((GESF == One))
                        {
                            GESF = Zero
                            PARM = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If ((GESF == 0x03))
                        {
                            GESF = Zero
                            PARM = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If ((GESF == 0x04))
                        {
                            GESF = Zero
                            PARM = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If ((GESF == 0x05))
                        {
                            GESF = Zero
                            PARM = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If ((GESF == 0x06))
                        {
                            ITVF = (PARM & 0x0F)
                            ITVM = ((PARM & 0xF0) >> 0x04)
                            GESF = Zero
                            PARM = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If ((GESF == 0x07))
                        {
                            GESF = Zero
                            PARM = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If ((GESF == 0x08))
                        {
                            GESF = Zero
                            PARM = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If ((GESF == 0x09))
                        {
                            IBTT = (PARM & 0xFF)
                            GESF = Zero
                            PARM = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If ((GESF == 0x0A))
                        {
                            IPSC = (PARM & 0xFF)
                            If (((PARM >> 0x08) & 0xFF))
                            {
                                IPAT = ((PARM >> 0x08) & 0xFF)
                                IPAT--
                            }

                            IBIA = ((PARM >> 0x14) & 0x07)
                            GESF = Zero
                            PARM = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If ((GESF == 0x0B))
                        {
                            IF1E = ((PARM >> One) & One)
                            If ((PARM & 0x0001E000))
                            {
                                IDMS = ((PARM >> 0x0D) & 0x0F)
                                IDMM = Zero
                            }
                            Else
                            {
                                IDMS = ((PARM >> 0x11) & 0x0F)
                                IDMM = One
                            }

                            GESF = Zero
                            PARM = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If ((GESF == 0x10))
                        {
                            GESF = Zero
                            PARM = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If ((GESF == 0x11))
                        {
                            PARM = (LIDS << 0x08)
                            PARM += 0x0100
                            GESF = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If ((GESF == 0x12))
                        {
                            If ((PARM & One))
                            {
                                If (((PARM >> One) == One))
                                {
                                    ISSC = One
                                }
                                Else
                                {
                                    GESF = Zero
                                    Return (CRIT) /* \_SB_.PCI0.IGPU.CRIT */
                                }
                            }
                            Else
                            {
                                ISSC = Zero
                            }

                            GESF = Zero
                            PARM = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If ((GESF == 0x13))
                        {
                            GESF = Zero
                            PARM = Zero
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        GESF = Zero
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If ((GEFC == 0x04))
                    {
                        GXFC = GBDA ()
                    }

                    If ((GEFC == 0x06))
                    {
                        GXFC = SBCB ()
                    }

                    SSRW = PARM /* \_SB_.PCI0.IGPU.PARM */
                    GEFC = Zero
                    SCIS = One
                    GSSE = Zero
                    SCIE = Zero
                    Return (Zero)
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Local0 = Package (0x0A)
                        {
                            "AAPL00,override-no-connect", 
                            Buffer (0x80)
                            {
                                /* 0000 */  0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00,  /* ........ */
                                /* 0008 */  0x22, 0xF0, 0x36, 0x29, 0x01, 0x01, 0x01, 0x01,  /* ".6).... */
                                /* 0010 */  0x32, 0x15, 0x01, 0x03, 0x80, 0x30, 0x1B, 0x78,  /* 2....0.x */
                                /* 0018 */  0x2A, 0x95, 0x25, 0xA1, 0x59, 0x57, 0x9F, 0x27,  /* *.%.YW.' */
                                /* 0020 */  0x0D, 0x50, 0x54, 0xA1, 0x08, 0x00, 0x81, 0xC0,  /* .PT..... */
                                /* 0028 */  0x81, 0x80, 0x95, 0x00, 0xB3, 0x00, 0xD1, 0xC0,  /* ........ */
                                /* 0030 */  0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x3A,  /* .......: */
                                /* 0038 */  0x80, 0x18, 0x71, 0x38, 0x2E, 0x40, 0x58, 0x2C,  /* ..q8.@X, */
                                /* 0040 */  0x40, 0x00, 0xE0, 0x0E, 0x11, 0x00, 0x00, 0x1E,  /* @....... */
                                /* 0048 */  0x00, 0x00, 0x00, 0xFD, 0x00, 0x32, 0x4C, 0x18,  /* .....2L. */
                                /* 0050 */  0x5E, 0x11, 0x00, 0x0A, 0x20, 0x20, 0x20, 0x20,  /* ^...     */
                                /* 0058 */  0x20, 0x20, 0x00, 0x00, 0x00, 0xFC, 0x00, 0x4D,  /*   .....M */
                                /* 0060 */  0x6F, 0x6E, 0x69, 0x74, 0x6F, 0x72, 0x0A, 0x20,  /* onitor.  */
                                /* 0068 */  0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF,  /*     .... */
                                /* 0070 */  0x00, 0x53, 0x45, 0x52, 0x49, 0x41, 0x4C, 0x4E,  /* .SERIALN */
                                /* 0078 */  0x55, 0x4D, 0x42, 0x45, 0x52, 0x0A, 0x00, 0xD5   /* UMBER... */
                            }, 
/* HD 3000
                            "device-id", 
                            Buffer (0x04)
                            {
                                 0x26, 0x01, 0x00, 0x00
                            }, 

                            "AAPL,snb-platform-id", 
                            Buffer (0x04)
                            {
                                 0x10, 0x00, 0x03, 0x00
                            }, 

                            "model", 
                            Buffer (0x17)
                            {
                                "Intel HD Graphics 3000"
                            }, 
   HD 3000 */
/* HD 4000 */
                            "device-id",
                            Buffer (0x04)
                            {
                                 0x62, 0x01, 0x00, 0x00
                            },

                            "AAPL,ig-platform-id",
                            Buffer (0x04)
                            {
                                 0x05, 0x00, 0x62, 0x01
                            },

                            "model",
                            Buffer (0x17)
                            {
                                "Intel HD Graphics 4000"
                            },
/*  HD 4000 */

                            "hda-gfx", 
                            Buffer (0x0A)
                            {
                                "onboard-1"
                            }
                        }
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (IGD1)
            {
                Name (_ADR, 0x00020001)  // _ADR: Address
            }

            Device (PEGP)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PE00, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (AE00, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (!PICF)
                    {
                        Return (PE00) /* \_SB_.PCI0.PEGP.PE00 */
                    }
                    Else
                    {
                        Return (AE00) /* \_SB_.PCI0.PEGP.AE00 */
                    }
                }
            }

            Device (PEG1)
            {
                Name (_ADR, 0x00010001)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PE01, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKA, 
                        Zero
                    }
                })
                Name (AE01, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x10
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (!PICF)
                    {
                        Return (PE01) /* \_SB_.PCI0.PEG1.PE01 */
                    }
                    Else
                    {
                        Return (AE01) /* \_SB_.PCI0.PEG1.AE01 */
                    }
                }
            }

            Device (PEX0)
            {
                Name (_ADR, 0x001C0000)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC0, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (API0, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (!PICF)
                    {
                        Return (PIC0) /* \_SB_.PCI0.PEX0.PIC0 */
                    }
                    Else
                    {
                        Return (API0) /* \_SB_.PCI0.PEX0.API0 */
                    }
                }

                Device (GIGE)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        Local0 = Package (0x06)
                            {
                                "built-in", 
                                Buffer (One)
                                {
                                     0x00                                             /* . */
                                }, 

                                "model", 
                                Buffer (0x24)
                                {
                                    "Realtek 8168/8101E Gigabit Ethernet"
                                }, 

                                "device_type", 
                                Buffer (0x09)
                                {
                                    "Ethernet"
                                }
                            }
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)
                    }

                    Name (_SUN, 0x02)  // _SUN: Slot User Number
                }
            }

            Device (PEX1)
            {
                Name (_ADR, 0x001C0001)  // _ADR: Address
                Device (XHC1)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        Local0 = Package (0x13)
                            {
                                "device-id", 
                                Buffer (0x04)
                                {
                                     0x00, 0x11, 0x00, 0x00                           /* .... */
                                }, 

                                "built-in", 
                                Buffer (One)
                                {
                                     0x00                                             /* . */
                                }, 

                                "device_type", 
                                Buffer (0x05)
                                {
                                    "XHCI"
                                }, 

                                "AAPL,clock-id", 
                                Buffer (One)
                                {
                                     0x00                                             /* . */
                                }, 

                                "AAPL,current-available", 
                                0x0834, 
                                "AAPL,current-extra", 
                                0x0898, 
                                "AAPL,current-extra-in-sleep", 
                                0x0640, 
                                "AAPL,max-port-current-in-sleep", 
                                0x0834, 
                                "AAPL,device-internal", 
                                Zero, 
                                Buffer (One)
                                {
                                     0x00                                             /* . */
                                }
                            }
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)
                    }
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC1, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKA, 
                        Zero
                    }
                })
                Name (API1, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x10
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (!PICF)
                    {
                        Return (PIC1) /* \_SB_.PCI0.PEX1.PIC1 */
                    }
                    Else
                    {
                        Return (API1) /* \_SB_.PCI0.PEX1.API1 */
                    }
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Local0 = Package (0x13)
                        {
                            "device-id", 
                            Buffer (0x04)
                            {
                                 0x09, 0x10, 0x00, 0x00                           /* .... */
                            }, 

                            "built-in", 
                            Buffer (One)
                            {
                                 0x00                                             /* . */
                            }, 

                            "device_type", 
                            Buffer (0x05)
                            {
                                "XHCI"
                            }, 

                            "AAPL,clock-id", 
                            Buffer (One)
                            {
                                 0x00                                             /* . */
                            }, 

                            "AAPL,current-available", 
                            0x0834, 
                            "AAPL,current-extra", 
                            0x0A8C, 
                            "AAPL,current-in-sleep", 
                            0x0A8C, 
                            "AAPL,max-port-current-in-sleep", 
                            0x0834, 
                            "AAPL,device-internal", 
                            Zero, 
                            Buffer (One)
                            {
                                 0x00                                             /* . */
                            }
                        }
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (PEX2)
            {
                Name (_ADR, 0x001C0002)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC2, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKB, 
                        Zero
                    }
                })
                Name (API2, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x11
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (!PICF)
                    {
                        Return (PIC2) /* \_SB_.PCI0.PEX2.PIC2 */
                    }
                    Else
                    {
                        Return (API2) /* \_SB_.PCI0.PEX2.API2 */
                    }
                }
            }

            Device (PEX3)
            {
                Name (_ADR, 0x001C0003)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC3, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKC, 
                        Zero
                    }
                })
                Name (API3, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x12
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (!PICF)
                    {
                        Return (PIC3) /* \_SB_.PCI0.PEX3.PIC3 */
                    }
                    Else
                    {
                        Return (API3) /* \_SB_.PCI0.PEX3.API3 */
                    }
                }
            }

            Device (PEX4)
            {
                Name (_ADR, 0x001C0004)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC4, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (API4, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (!PICF)
                    {
                        Return (PIC4) /* \_SB_.PCI0.PEX4.PIC4 */
                    }
                    Else
                    {
                        Return (API4) /* \_SB_.PCI0.PEX4.API4 */
                    }
                }
            }

            Device (PEX5)
            {
                Name (_ADR, 0x001C0005)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC5, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKA, 
                        Zero
                    }
                })
                Name (API5, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x10
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (!PICF)
                    {
                        Return (PIC5) /* \_SB_.PCI0.PEX5.PIC5 */
                    }
                    Else
                    {
                        Return (API5) /* \_SB_.PCI0.PEX5.API5 */
                    }
                }
            }

            Device (PEX6)
            {
                Name (_ADR, 0x001C0006)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC6, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKB, 
                        Zero
                    }
                })
                Name (API6, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x11
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (!PICF)
                    {
                        Return (PIC6) /* \_SB_.PCI0.PEX6.PIC6 */
                    }
                    Else
                    {
                        Return (API6) /* \_SB_.PCI0.PEX6.API6 */
                    }
                }
            }

            Device (PEX7)
            {
                Name (_ADR, 0x001C0007)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC7, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKC, 
                        Zero
                    }
                })
                Name (API7, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x12
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (!PICF)
                    {
                        Return (PIC7) /* \_SB_.PCI0.PEX7.PIC7 */
                    }
                    Else
                    {
                        Return (API7) /* \_SB_.PCI0.PEX7.API7 */
                    }
                }
            }

            Device (HUB0)
            {
                Name (_ADR, 0x001E0000)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x0B, 
                        0x05
                    })
                }
            }

            Device (LPCB)
            {
                Name (_ADR, 0x001F0000)  // _ADR: Address
                OperationRegion (PREV, PCI_Config, 0x08, One)
                Scope (\)
                {
                    Field (\_SB.PCI0.LPCB.PREV, ByteAcc, NoLock, Preserve)
                    {
                        REV0,   8
                    }
                }

                OperationRegion (PIRQ, PCI_Config, 0x60, 0x04)
                Scope (\)
                {
                    Field (\_SB.PCI0.LPCB.PIRQ, ByteAcc, NoLock, Preserve)
                    {
                        PIRA,   8, 
                        PIRB,   8, 
                        PIRC,   8, 
                        PIRD,   8
                    }
                }

                OperationRegion (PIR2, PCI_Config, 0x68, 0x04)
                Scope (\)
                {
                    Field (\_SB.PCI0.LPCB.PIR2, ByteAcc, NoLock, Preserve)
                    {
                        PIRE,   8, 
                        PIRF,   8, 
                        PIRG,   8, 
                        PIRH,   8
                    }
                }

                OperationRegion (LPIO, PCI_Config, 0x80, 0x0E)
                Scope (\)
                {
                    Field (\_SB.PCI0.LPCB.LPIO, ByteAcc, NoLock, Preserve)
                    {
                        UAIO,   8, 
                        PRIO,   8, 
                        LPE1,   8, 
                        LPE2,   8, 
                        GN1L,   8, 
                        GN1H,   8, 
                        GN2L,   8, 
                        GN2H,   8
                    }

                    Method (DISD, 1, NotSerialized)
                    {
                        If ((Arg0 == Zero))
                        {
                            LPE1 &= 0xFE
                        }

                        If ((Arg0 == One))
                        {
                            LPE1 &= 0xFD
                        }

                        If ((Arg0 == 0x02))
                        {
                            LPE1 &= 0xFB
                        }

                        If ((Arg0 == 0x03))
                        {
                            LPE1 &= 0xF7
                        }

                        If ((Arg0 == 0x04))
                        {
                            LPE2 &= 0xFC
                        }

                        If ((Arg0 == 0x05))
                        {
                            LPE1 &= 0xDF
                        }

                        If ((Arg0 == 0x06))
                        {
                            GN2L &= 0xFE
                        }
                    }

                    Method (CKIO, 2, NotSerialized)
                    {
                        If ((Arg1 == Zero))
                        {
                            LPE1 |= One
                            Local0 = (UAIO & 0xF0)
                            If ((Arg0 == 0x03F8))
                            {
                                UAIO = (Local0 | Zero)
                            }

                            If ((Arg0 == 0x02F8))
                            {
                                UAIO = (Local0 | One)
                            }

                            If ((Arg0 == 0x02E8))
                            {
                                UAIO = (Local0 | 0x05)
                            }

                            If ((Arg0 == 0x03E8))
                            {
                                UAIO = (Local0 | 0x07)
                            }
                        }

                        If ((Arg1 == One))
                        {
                            LPE1 |= 0x02
                            Local0 = (UAIO & 0x0F)
                            If ((Arg0 == 0x03F8))
                            {
                                UAIO = (Local0 | Zero)
                            }

                            If ((Arg0 == 0x02F8))
                            {
                                UAIO = (Local0 | 0x10)
                            }

                            If ((Arg0 == 0x02E8))
                            {
                                UAIO = (Local0 | 0x50)
                            }

                            If ((Arg0 == 0x03E8))
                            {
                                UAIO = (Local0 | 0x70)
                            }
                        }

                        If ((Arg1 == 0x02))
                        {
                            LPE1 |= 0x04
                            Local0 = (PRIO & 0xFC)
                            If ((Arg0 == 0x0378))
                            {
                                PRIO = (Local0 | Zero)
                            }

                            If ((Arg0 == 0x0278))
                            {
                                PRIO = (Local0 | One)
                            }

                            If ((Arg0 == 0x03BC))
                            {
                                PRIO = (Local0 | 0x02)
                            }
                        }

                        If ((Arg1 == 0x03))
                        {
                            LPE1 |= 0x08
                        }

                        If ((Arg1 == 0x04))
                        {
                            If ((Arg0 == 0x0201))
                            {
                                LPE2 |= One
                            }

                            If ((Arg0 == 0x0209))
                            {
                                LPE2 |= 0x02
                            }
                        }

                        If ((Arg1 == 0x06))
                        {
                            If ((Arg0 != 0xFFFF))
                            {
                                Local0 = (Arg0 & 0xFF)
                                GN2L = (Local0 | One)
                                GN2H = (Arg0 >> 0x08)
                            }
                            Else
                            {
                                GN2H = Zero
                                GN2L = Zero
                            }
                        }
                    }
                }

                Scope (\)
                {
                    Method (SLDM, 2, NotSerialized)
                    {
                    }
                }

                Scope (\)
                {
                    OperationRegion (SCPP, SystemIO, 0xB2, One)
                    Field (SCPP, ByteAcc, NoLock, Preserve)
                    {
                        SMIP,   8
                    }
                }

                Method (^_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    If (STRC (_OS, "Microsoft Windows"))
                    {
                        SMIP = 0x56
                    }
                    Else
                    {
                        If (STRC (_OS, "Microsoft Windows NT"))
                        {
                            If (CondRefOf (\OOSI, Local0))
                            {
                                Local2 = Zero
                                If (OOSI ("Windows 2001"))
                                {
                                    OSFL = Zero
                                    Local1 = 0x59
                                    OSFX = 0x03
                                    Local2 = One
                                }

                                If (OOSI ("Windows 2006"))
                                {
                                    OSFL = Zero
                                    Local1 = 0x5B
                                    OSFX = 0x05
                                    Local2 = One
                                }

                                If (OOSI ("Windows 2009"))
                                {
                                    OSFL = Zero
                                    Local1 = 0x5D
                                    OSFX = 0x07
                                    Local2 = One
                                }

                                If ((Local2 != Zero))
                                {
                                    SMIP = Local1
                                }
                            }
                            Else
                            {
                                SMIP = 0x58
                                OSFL = Zero
                            }
                        }
                        Else
                        {
                            If (CondRefOf (\OOSI, Local0))
                            {
                                If (OOSI ("Linux"))
                                {
                                    LINX = One
                                }

                                If (OOSI ("Darwin"))
                                {
                                    AMAC = One
                                }
                            }

                            SMIP = 0x57
                            OSFL = 0x02
                        }
                    }
                }

                Scope (\)
                {
                    Method (OSTP, 0, NotSerialized)
                    {
                        If ((OSFL == One))
                        {
                            SMIP = 0x56
                        }

                        If ((OSFL == 0x02))
                        {
                            SMIP = 0x57
                        }

                        If ((OSFL == Zero))
                        {
                            Local1 = 0x58
                            If ((OSFX >= 0x03))
                            {
                                Local1 = 0x59
                                If ((OSFX == 0x05))
                                {
                                    Local1 = 0x5B
                                }

                                If ((OSFX == 0x07))
                                {
                                    Local1 = 0x5D
                                }
                            }

                            SMIP = Local1
                        }
                    }
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x01,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x01,               // Alignment
                            0x0A,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x01,               // Alignment
                            0x0B,               // Length
                            )
                        IO (Decode16,
                            0x0074,             // Range Minimum
                            0x0074,             // Range Maximum
                            0x01,               // Alignment
                            0x0C,               // Length
                            )
                        IO (Decode16,
                            0x0091,             // Range Minimum
                            0x0091,             // Range Maximum
                            0x01,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x01,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0290,             // Range Minimum
                            0x0290,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x01,               // Alignment
                            0x06,               // Length
                            )
                        IO (Decode16,
                            0x0290,             // Range Minimum
                            0x0290,             // Range Maximum
                            0x01,               // Alignment
                            0x05,               // Length
                            )
                        IO (Decode16,
                            0x0880,             // Range Minimum
                            0x0880,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                    })
                }

                Device (DMA1)
                {
                    Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x11,               // Length
                            )
                        IO (Decode16,
                            0x0094,             // Range Minimum
                            0x0094,             // Range Maximum
                            0x01,               // Alignment
                            0x0C,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID
                    Name (ATT5, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Name (ATT6, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If ((OSFX >= 0x03))
                        {
                            If (HPTF)
                            {
                                Return (ATT6) /* \_SB_.PCI0.LPCB.TMR_.ATT6 */
                            }
                            Else
                            {
                                Return (ATT5) /* \_SB_.PCI0.LPCB.TMR_.ATT5 */
                            }
                        }
                        Else
                        {
                            Return (ATT5) /* \_SB_.PCI0.LPCB.TMR_.ATT5 */
                        }
                    }
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
                    Name (ATT3, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {0}
                        IRQNoFlags ()
                            {8}
                        Memory32Fixed (ReadWrite,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            )
                    })
                    Name (ATT4, ResourceTemplate ()
                    {
                    })
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((OSFX >= 0x03))
                        {
                            If (HPTF)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If ((OSFX >= 0x03))
                        {
                            If (HPTF)
                            {
                                Return (ATT3) /* \_SB_.PCI0.LPCB.HPET.ATT3 */
                            }
                            Else
                            {
                                Return (ATT4) /* \_SB_.PCI0.LPCB.HPET.ATT4 */
                            }
                        }
                        Else
                        {
                            Return (ATT4) /* \_SB_.PCI0.LPCB.HPET.ATT4 */
                        }
                    }
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
                    Name (ATT0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Name (ATT1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Name (ATT2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                    Name (ATT3, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If ((OSFX >= 0x03))
                        {
                            If (HPTF)
                            {
                                Return (ATT1) /* \_SB_.PCI0.LPCB.RTC_.ATT1 */
                            }
                            Else
                            {
                                Return (ATT0) /* \_SB_.PCI0.LPCB.RTC_.ATT0 */
                            }
                        }
                        Else
                        {
                            If ((AMAC == One))
                            {
                                Return (ATT2) /* \_SB_.PCI0.LPCB.RTC_.ATT2 */
                            }

                            Return (ATT0) /* \_SB_.PCI0.LPCB.RTC_.ATT0 */
                        }
                    }
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04") /* x87-compatible Floating Point Processing Unit */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Scope (\)
                {
                    OperationRegion (WIN1, SystemIO, 0x2E, 0x02)
                    Field (WIN1, ByteAcc, NoLock, Preserve)
                    {
                        INDP,   8, 
                        DATP,   8
                    }

                    OperationRegion (GPIO, SystemIO, 0x0800, 0x05)
                    Field (GPIO, ByteAcc, NoLock, Preserve)
                    {
                        GO01,   8, 
                        GO02,   8, 
                        GO03,   8, 
                        GO04,   8, 
                        GO05,   8
                    }

                    IndexField (INDP, DATP, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x02), 
                        CFG,    8, 
                        Offset (0x07), 
                        LDN,    8, 
                        Offset (0x20), 
                        IDHI,   8, 
                        IDLO,   8, 
                        POWC,   8, 
                        Offset (0x30), 
                        ACTR,   8, 
                        Offset (0x60), 
                        IOAH,   8, 
                        IOAL,   8, 
                        IO2H,   8, 
                        IO2L,   8, 
                        Offset (0x70), 
                        INTR,   8, 
                        Offset (0x72), 
                        INT1,   8, 
                        Offset (0x74), 
                        DMCH,   8, 
                        Offset (0xC0), 
                        GP40,   8, 
                        Offset (0xF0), 
                        OPT1,   8, 
                        OPT2,   8, 
                        OPT3,   8, 
                        OPT4,   8
                    }

                    Method (ENFG, 0, NotSerialized)
                    {
                        INDP = 0x87
                        INDP = One
                        INDP = 0x55
                        INDP = 0x55
                    }

                    Method (EXFG, 0, NotSerialized)
                    {
                        CFG = 0x02
                    }

                    Method (GSRG, 1, NotSerialized)
                    {
                        INDP = Arg0
                        Return (DATP) /* \DATP */
                    }

                    Method (SSRG, 2, NotSerialized)
                    {
                        INDP = Arg0
                        DATP = Arg1
                    }
                }

                OperationRegion (KBCT, SystemIO, 0x60, 0x05)
                Field (KBCT, ByteAcc, NoLock, Preserve)
                {
                    P060,   8, 
                    Offset (0x04), 
                    P064,   8
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((KBDI == One))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                }

                Device (PSMR)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, 0x03)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((KBDI == Zero))
                        {
                            Return (Zero)
                        }

                        If ((PS2F == Zero))
                        {
                            If ((OSFL == 0x02))
                            {
                                Return (0x0F)
                            }

                            If ((OSFL == One))
                            {
                                Return (0x0F)
                            }

                            Return (Zero)
                        }

                        Return (Zero)
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Scope (\_SB.PCI0.LPCB)
                {
                    OperationRegion (CCCC, SystemMemory, 0x000FE2BC, 0x05)
                    Field (CCCC, ByteAcc, NoLock, Preserve)
                    {
                        PPRQ,   8, 
                        PPLO,   8, 
                        PPRP,   8, 
                        PPOR,   8, 
                        TPRS,   8
                    }

                    OperationRegion (CMO2, SystemIO, 0x72, 0x73)
                    Field (CMO2, ByteAcc, NoLock, Preserve)
                    {
                        IND2,   8, 
                        DAT2,   8
                    }

                    IndexField (IND2, DAT2, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x90), 
                        PRQC,   4
                    }

                    OperationRegion (TPMI, SystemMemory, 0x000FFFEA, One)
                    Field (TPMI, ByteAcc, NoLock, Preserve)
                    {
                            ,   3, 
                        TPME,   1
                    }

                    Device (TPM)
                    {
                        Name (_HID, EisaId ("IFX0102"))  // _HID: Hardware ID
                        Name (_CID, EisaId ("PNP0C31"))  // _CID: Compatible ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (TPME)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                        {
                            Memory32Fixed (ReadWrite,
                                0xFED40000,         // Address Base
                                0x00005000,         // Address Length
                                )
                            IO (Decode16,
                                0x004E,             // Range Minimum
                                0x004E,             // Range Maximum
                                0x01,               // Alignment
                                0x02,               // Length
                                )
                            IO (Decode16,
                                0x4700,             // Range Minimum
                                0x4700,             // Range Maximum
                                0x01,               // Alignment
                                0x0C,               // Length
                                )
                        })
                        Method (UCMP, 2, NotSerialized)
                        {
                            If ((0x10 != SizeOf (Arg0)))
                            {
                                Return (Zero)
                            }

                            If ((0x10 != SizeOf (Arg1)))
                            {
                                Return (Zero)
                            }

                            Local0 = Zero
                            While ((Local0 < 0x10))
                            {
                                If ((DerefOf (Index (Arg0, Local0)) != DerefOf (Index (Arg1, Local0
                                    ))))
                                {
                                    Return (Zero)
                                }

                                Local0++
                            }

                            Return (One)
                        }

                        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                        {
                            If ((UCMP (Arg0, ToUUID ("3dddfaa6-361b-4eb4-a424-8d10089d1653") /* Physical Presence Interface */) == One))
                            {
                                If ((Arg2 == Zero))
                                {
                                    Return (Buffer (One)
                                    {
                                         0x7F                                             /* . */
                                    })
                                }

                                If ((Arg2 == One))
                                {
                                    If ((SizeOf (Arg3) == Zero))
                                    {
                                        Return (Buffer (0x04)
                                        {
                                            "1.0"
                                        })
                                    }

                                    Return (One)
                                }

                                If ((Arg2 == 0x02))
                                {
                                    If ((TPRS != Zero))
                                    {
                                        If ((DerefOf (Index (Arg3, Zero)) == Zero))
                                        {
                                            SCP = 0xF0
                                            PPRQ = Zero
                                            SCP = 0xF1
                                            Return (Zero)
                                        }

                                        If ((DerefOf (Index (Arg3, Zero)) == One))
                                        {
                                            SCP = 0xF0
                                            PPRQ = One
                                            SCP = 0xF1
                                            Return (Zero)
                                        }

                                        If ((DerefOf (Index (Arg3, Zero)) == 0x02))
                                        {
                                            SCP = 0xF0
                                            PPRQ = 0x02
                                            SCP = 0xF1
                                            Return (Zero)
                                        }

                                        If ((DerefOf (Index (Arg3, Zero)) == 0x03))
                                        {
                                            SCP = 0xF0
                                            PPRQ = 0x03
                                            SCP = 0xF1
                                            Return (Zero)
                                        }

                                        If ((DerefOf (Index (Arg3, Zero)) == 0x04))
                                        {
                                            SCP = 0xF0
                                            PPRQ = 0x04
                                            SCP = 0xF1
                                            Return (Zero)
                                        }

                                        If ((DerefOf (Index (Arg3, Zero)) == 0x05))
                                        {
                                            SCP = 0xF0
                                            PPRQ = 0x05
                                            SCP = 0xF1
                                            Return (Zero)
                                        }

                                        If ((DerefOf (Index (Arg3, Zero)) == 0x06))
                                        {
                                            SCP = 0xF0
                                            PPRQ = 0x06
                                            SCP = 0xF1
                                            Return (Zero)
                                        }

                                        If ((DerefOf (Index (Arg3, Zero)) == 0x07))
                                        {
                                            SCP = 0xF0
                                            PPRQ = 0x07
                                            SCP = 0xF1
                                            Return (Zero)
                                        }

                                        If ((DerefOf (Index (Arg3, Zero)) == 0x08))
                                        {
                                            SCP = 0xF0
                                            PPRQ = 0x08
                                            SCP = 0xF1
                                            Return (Zero)
                                        }

                                        If ((DerefOf (Index (Arg3, Zero)) == 0x09))
                                        {
                                            SCP = 0xF0
                                            PPRQ = 0x09
                                            SCP = 0xF1
                                            Return (Zero)
                                        }

                                        If ((DerefOf (Index (Arg3, Zero)) == 0x0A))
                                        {
                                            SCP = 0xF0
                                            PPRQ = 0x0A
                                            SCP = 0xF1
                                            Return (Zero)
                                        }

                                        If ((DerefOf (Index (Arg3, Zero)) == 0x0B))
                                        {
                                            SCP = 0xF0
                                            PPRQ = 0x0B
                                            SCP = 0xF1
                                            Return (Zero)
                                        }

                                        If ((DerefOf (Index (Arg3, Zero)) == 0x0C))
                                        {
                                            SCP = 0xF0
                                            PPRQ = 0x0C
                                            SCP = 0xF1
                                            Return (One)
                                        }

                                        If ((DerefOf (Index (Arg3, Zero)) == 0x0D))
                                        {
                                            SCP = 0xF0
                                            PPRQ = 0x0D
                                            SCP = 0xF1
                                            Return (One)
                                        }

                                        If ((DerefOf (Index (Arg3, Zero)) == 0x0E))
                                        {
                                            SCP = 0xF0
                                            PPRQ = 0x0E
                                            SCP = 0xF1
                                            Return (Zero)
                                        }

                                        Return (One)
                                    }

                                    Return (One)
                                }

                                If ((Arg2 == 0x03))
                                {
                                    Name (TMP1, Package (0x02)
                                    {
                                        Zero, 
                                        Ones
                                    })
                                    Index (TMP1, One) = PPRQ /* \_SB_.PCI0.LPCB.PPRQ */
                                    Return (TMP1) /* \_SB_.PCI0.LPCB.TPM_._DSM.TMP1 */
                                }

                                If ((Arg2 == 0x04))
                                {
                                    Return (One)
                                }

                                If ((Arg2 == 0x05))
                                {
                                    Name (TMP2, Package (0x03)
                                    {
                                        Zero, 
                                        Ones, 
                                        Ones
                                    })
                                    Index (TMP2, One) = PPLO /* \_SB_.PCI0.LPCB.PPLO */
                                    If ((((PPLO > 0x0E) || (PPLO == 0x0C)) || (PPLO == 0x0D)))
                                    {
                                        Index (TMP2, 0x02) = 0xFFFFFFF1
                                        Return (TMP2) /* \_SB_.PCI0.LPCB.TPM_._DSM.TMP2 */
                                    }

                                    If ((PPRP == 0xFF))
                                    {
                                        Index (TMP2, 0x02) = 0xFFFFFFF1
                                        Return (TMP2) /* \_SB_.PCI0.LPCB.TPM_._DSM.TMP2 */
                                    }

                                    If (PPOR)
                                    {
                                        Index (TMP2, 0x02) = 0xFFFFFFF0
                                        Return (TMP2) /* \_SB_.PCI0.LPCB.TPM_._DSM.TMP2 */
                                    }

                                    Index (TMP2, 0x02) = PPRP /* \_SB_.PCI0.LPCB.PPRP */
                                    Return (TMP2) /* \_SB_.PCI0.LPCB.TPM_._DSM.TMP2 */
                                }

                                If ((Arg2 == 0x06))
                                {
                                    CreateByteField (Arg3, 0x04, LAN0)
                                    CreateByteField (Arg3, 0x05, LAN1)
                                    If (((LAN0 == 0x65) || (LAN0 == 0x45)))
                                    {
                                        If (((LAN1 == 0x6E) || (LAN1 == 0x4E)))
                                        {
                                            Return (Zero)
                                        }
                                    }

                                    Return (One)
                                }

                                Return (One)
                            }

                            Return (Buffer (One)
                            {
                                 0x00                                             /* . */
                            })
                        }
                    }
                }

                Device (PMIO)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, 0x02)  // _UID: Unique ID
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0400,             // Range Minimum
                                0x0400,             // Range Maximum
                                0x01,               // Alignment
                                0xD0,               // Length
                                )
                            IO (Decode16,
                                0x04D2,             // Range Minimum
                                0x04D2,             // Range Maximum
                                0x01,               // Alignment
                                0x2E,               // Length
                                )
                        })
                        Return (BUF0) /* \_SB_.PCI0.LPCB.PMIO._CRS.BUF0 */
                    }
                }

                OperationRegion (CDPR, SystemIO, 0x1800, 0x01FF)
                Field (CDPR, ByteAcc, NoLock, Preserve)
                {
                    BCLK,   8, 
                    Offset (0x10), 
                    VCC1,   8, 
                    Offset (0x12), 
                    VDDI,   8, 
                    Offset (0x14), 
                    VTTC,   8, 
                    Offset (0x16), 
                    V15C,   8, 
                    Offset (0x18), 
                    V18C,   8, 
                    Offset (0x1A), 
                    VSAC,   8, 
                    Offset (0x1C), 
                    AXGC,   8, 
                    Offset (0x1E), 
                    VIDC,   8, 
                    Offset (0x20), 
                    Offset (0xC0), 
                    VCCB,   32, 
                    VCCS,   16, 
                    Offset (0xC8), 
                    VDDB,   32, 
                    VDDS,   16, 
                    Offset (0xD0), 
                    VTTB,   32, 
                    VTTS,   16, 
                    Offset (0xD8), 
                    V15B,   32, 
                    V15S,   16, 
                    Offset (0xE0), 
                    V18B,   32, 
                    V18S,   16, 
                    Offset (0xE8), 
                    VSAB,   32, 
                    VSAS,   16, 
                    Offset (0xF0), 
                    AXGB,   32, 
                    AXGS,   16, 
                    Offset (0xF8), 
                    VIDB,   32, 
                    VIDS,   16, 
                    Offset (0x100), 
                    Offset (0x1C0), 
                    CTMP,   8, 
                    Offset (0x1C3)
                }

                Device (PTMD)
                {
                    Name (_HID, EisaId ("ICD0001"))  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _CID: Compatible ID
                    Name (IVER, 0x10000001)
                    Name (_STA, 0xFF)  // _STA: Status
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x1000,             // Range Minimum
                            0x1000,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x1080,             // Range Minimum
                            0x1080,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x1100,             // Range Minimum
                            0x1100,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x1180,             // Range Minimum
                            0x1180,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                    })
                    Name (TMPV, Package (0x04)
                    {
                        One, 
                        0x02, 
                        Zero, 
                        Zero
                    })
                    Name (VLTV, Package (0x10)
                    {
                        0x09, 
                        0x05, 
                        Zero, 
                        Zero, 
                        0x0E, 
                        0x06, 
                        Zero, 
                        Zero, 
                        0x13, 
                        0x07, 
                        Zero, 
                        Zero, 
                        0x11, 
                        0x08, 
                        Zero, 
                        Zero
                    })
                    Name (RPMV, Package (0x00) {})
                    Name (RDVL, Package (0x02)
                    {
                        Zero, 
                        Zero
                    })
                    Method (CDRD, 2, Serialized)
                    {
                        While (One)
                        {
                            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                            _T_0 = Arg0
                            If ((_T_0 == One))
                            {
                                While (One)
                                {
                                    Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler
                                    _T_1 = Arg1
                                    If ((_T_1 == Zero))
                                    {
                                        Index (RDVL, One) = VCC1 /* \_SB_.PCI0.LPCB.VCC1 */
                                    }
                                    Else
                                    {
                                        If ((_T_1 == 0x04))
                                        {
                                            Index (RDVL, One) = VDDI /* \_SB_.PCI0.LPCB.VDDI */
                                        }
                                        Else
                                        {
                                            If ((_T_1 == 0x07))
                                            {
                                                Index (RDVL, One) = VSAC /* \_SB_.PCI0.LPCB.VSAC */
                                            }
                                            Else
                                            {
                                                If ((_T_1 == 0x08))
                                                {
                                                    Index (RDVL, One) = VIDC /* \_SB_.PCI0.LPCB.VIDC */
                                                }
                                                Else
                                                {
                                                    If ((_T_1 == 0x09))
                                                    {
                                                        Index (RDVL, One) = V15C /* \_SB_.PCI0.LPCB.V15C */
                                                    }
                                                    Else
                                                    {
                                                        If ((_T_1 == 0x0A))
                                                        {
                                                            Index (RDVL, One) = V18C /* \_SB_.PCI0.LPCB.V18C */
                                                        }
                                                        Else
                                                        {
                                                            Index (RDVL, Zero) = One
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }

                                    Break
                                }
                            }
                            Else
                            {
                                If ((_T_0 == 0x02))
                                {
                                    While (One)
                                    {
                                        Name (_T_2, Zero)  // _T_x: Emitted by ASL Compiler
                                        _T_2 = Arg1
                                        If ((_T_2 == Zero))
                                        {
                                            Index (RDVL, One) = BCLK /* \_SB_.PCI0.LPCB.BCLK */
                                        }
                                        Else
                                        {
                                            Index (RDVL, Zero) = One
                                        }

                                        Break
                                    }
                                }
                                Else
                                {
                                    Index (RDVL, Zero) = One
                                }
                            }

                            Break
                        }

                        Return (RDVL) /* \_SB_.PCI0.LPCB.PTMD.RDVL */
                    }

                    Method (CDWR, 3, Serialized)
                    {
                        While (One)
                        {
                            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                            _T_0 = Arg0
                            If ((_T_0 == One))
                            {
                                While (One)
                                {
                                    Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler
                                    _T_1 = Arg1
                                    If ((_T_1 == Zero))
                                    {
                                        DBG1 = Arg2
                                        VCC1 = Arg2
                                    }
                                    Else
                                    {
                                        If ((_T_1 == 0x04))
                                        {
                                            DBG1 = Arg2
                                            VDDI = Arg2
                                        }
                                        Else
                                        {
                                            If ((_T_1 == 0x07))
                                            {
                                                DBG1 = Arg2
                                                VSAC = Arg2
                                            }
                                            Else
                                            {
                                                If ((_T_1 == 0x08))
                                                {
                                                    DBG1 = Arg2
                                                    VIDC = Arg2
                                                }
                                                Else
                                                {
                                                    If ((_T_1 == 0x09))
                                                    {
                                                        DBG1 = Arg2
                                                        V15C = Arg2
                                                    }
                                                    Else
                                                    {
                                                        If ((_T_1 == 0x0A))
                                                        {
                                                            V18C = Arg2
                                                        }
                                                        Else
                                                        {
                                                            Return (One)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }

                                    Break
                                }
                            }
                            Else
                            {
                                If ((_T_0 == 0x02))
                                {
                                    While (One)
                                    {
                                        Name (_T_2, Zero)  // _T_x: Emitted by ASL Compiler
                                        _T_2 = Arg1
                                        If ((_T_2 == Zero))
                                        {
                                            DBG1 = Arg2
                                            BCLK = Arg2
                                        }
                                        Else
                                        {
                                            Return (One)
                                        }

                                        Break
                                    }
                                }
                                Else
                                {
                                    Return (One)
                                }
                            }

                            Break
                        }

                        Return (Zero)
                    }

                    Method (TSDD, 0, NotSerialized)
                    {
                        Name (TMPC, Zero)
                        Return (TMPV) /* \_SB_.PCI0.LPCB.PTMD.TMPV */
                    }

                    Method (VSDD, 0, NotSerialized)
                    {
                        Name (VLTC, Zero)
                        Return (VLTV) /* \_SB_.PCI0.LPCB.PTMD.VLTV */
                    }

                    Method (FSDD, 0, NotSerialized)
                    {
                        Name (RPMC, Zero)
                        Return (RPMV) /* \_SB_.PCI0.LPCB.PTMD.RPMV */
                    }

                    Method (SDSP, 0, NotSerialized)
                    {
                        Return (0x0A)
                    }
                }
            }

            Device (EH01)
            {
                Name (_ADR, 0x001D0000)  // _ADR: Address
                Name (_S4D, 0x02)  // _S4D: S4 Device State
                Name (_S3D, 0x02)  // _S3D: S3 Device State
                Name (_S2D, 0x02)  // _S2D: S2 Device State
                Name (_S1D, 0x02)  // _S1D: S1 Device State
                Device (HUBN)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PR10)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                        {
                            ToPLD (
                                PLD_Revision       = 0x1,
                                PLD_IgnoreColor    = 0x1,
                                PLD_Red            = 0x0,
                                PLD_Green          = 0x0,
                                PLD_Blue           = 0x0,
                                PLD_Width          = 0x0,
                                PLD_Height         = 0x0,
                                PLD_UserVisible    = 0x0,
                                PLD_Dock           = 0x0,
                                PLD_Lid            = 0x0,
                                PLD_Panel          = "UNKNOWN",
                                PLD_VerticalPosition = "UPPER",
                                PLD_HorizontalPosition = "LEFT",
                                PLD_Shape          = "UNKNOWN",
                                PLD_GroupOrientation = 0x0,
                                PLD_GroupToken     = 0x0,
                                PLD_GroupPosition  = 0x0,
                                PLD_Bay            = 0x0,
                                PLD_Ejectable      = 0x0,
                                PLD_EjectRequired  = 0x0,
                                PLD_CabinetNumber  = 0x0,
                                PLD_CardCageNumber = 0x0,
                                PLD_Reference      = 0x0,
                                PLD_Rotation       = 0x0,
                                PLD_Order          = 0x0,
                                PLD_VerticalOffset = 0x0,
                                PLD_HorizontalOffset = 0x0)

                        })
                        Device (PR30)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x1,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "FRONT",
                                    PLD_VerticalPosition = "UPPER",
                                    PLD_HorizontalPosition = "LEFT",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PR31)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x1,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "FRONT",
                                    PLD_VerticalPosition = "UPPER",
                                    PLD_HorizontalPosition = "CENTER",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PR32)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x1,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "FRONT",
                                    PLD_VerticalPosition = "UPPER",
                                    PLD_HorizontalPosition = "CENTER",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PR33)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x1,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "FRONT",
                                    PLD_VerticalPosition = "UPPER",
                                    PLD_HorizontalPosition = "RIGHT",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PR34)
                        {
                            Name (_ADR, 0x05)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x1,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "UNKNOWN",
                                    PLD_VerticalPosition = "LOWER",
                                    PLD_HorizontalPosition = "RIGHT",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PR35)
                        {
                            Name (_ADR, 0x06)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x1,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "UNKNOWN",
                                    PLD_VerticalPosition = "LOWER",
                                    PLD_HorizontalPosition = "RIGHT",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PR36)
                        {
                            Name (_ADR, 0x07)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x1,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "UNKNOWN",
                                    PLD_VerticalPosition = "LOWER",
                                    PLD_HorizontalPosition = "RIGHT",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PR37)
                        {
                            Name (_ADR, 0x08)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x1,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "UNKNOWN",
                                    PLD_VerticalPosition = "LOWER",
                                    PLD_HorizontalPosition = "RIGHT",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }
                    }
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x0D, 
                    0x03
                })
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Local0 = Package (0x0F)
                        {
                            "built-in", 
                            Buffer (One)
                            {
                                 0x00                                             /* . */
                            }, 

                            "device_type", 
                            Buffer (0x05)
                            {
                                "EHCI"
                            }, 

                            "AAPL,clock-id", 
                            Buffer (One)
                            {
                                 0x00                                             /* . */
                            }, 

                            "AAPL,current-available", 
                            0x05DC, 
                            "AAPL,current-extra", 
                            0x03E8, 
                            "AAPL,current-in-sleep", 
                            0x0BB8, 
                            Buffer (One)
                            {
                                 0x00                                             /* . */
                            }
                        }
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (EH02)
            {
                Name (_ADR, 0x001A0000)  // _ADR: Address
                Name (_S4D, 0x02)  // _S4D: S4 Device State
                Name (_S3D, 0x02)  // _S3D: S3 Device State
                Name (_S2D, 0x02)  // _S2D: S2 Device State
                Name (_S1D, 0x02)  // _S1D: S1 Device State
                Device (HUBN)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PR10)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                        {
                            ToPLD (
                                PLD_Revision       = 0x1,
                                PLD_IgnoreColor    = 0x1,
                                PLD_Red            = 0x0,
                                PLD_Green          = 0x0,
                                PLD_Blue           = 0x0,
                                PLD_Width          = 0x0,
                                PLD_Height         = 0x0,
                                PLD_UserVisible    = 0x0,
                                PLD_Dock           = 0x0,
                                PLD_Lid            = 0x0,
                                PLD_Panel          = "UNKNOWN",
                                PLD_VerticalPosition = "UPPER",
                                PLD_HorizontalPosition = "LEFT",
                                PLD_Shape          = "UNKNOWN",
                                PLD_GroupOrientation = 0x0,
                                PLD_GroupToken     = 0x0,
                                PLD_GroupPosition  = 0x0,
                                PLD_Bay            = 0x0,
                                PLD_Ejectable      = 0x0,
                                PLD_EjectRequired  = 0x0,
                                PLD_CabinetNumber  = 0x0,
                                PLD_CardCageNumber = 0x0,
                                PLD_Reference      = 0x0,
                                PLD_Rotation       = 0x0,
                                PLD_Order          = 0x0,
                                PLD_VerticalOffset = 0x0,
                                PLD_HorizontalOffset = 0x0)

                        })
                        Device (PR30)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x1,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "FRONT",
                                    PLD_VerticalPosition = "UPPER",
                                    PLD_HorizontalPosition = "LEFT",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PR31)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x1,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "FRONT",
                                    PLD_VerticalPosition = "UPPER",
                                    PLD_HorizontalPosition = "CENTER",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PR32)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x1,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "FRONT",
                                    PLD_VerticalPosition = "UPPER",
                                    PLD_HorizontalPosition = "CENTER",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PR33)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x1,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "FRONT",
                                    PLD_VerticalPosition = "UPPER",
                                    PLD_HorizontalPosition = "RIGHT",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PR34)
                        {
                            Name (_ADR, 0x05)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x1,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "UNKNOWN",
                                    PLD_VerticalPosition = "LOWER",
                                    PLD_HorizontalPosition = "RIGHT",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PR35)
                        {
                            Name (_ADR, 0x06)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x1,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "FRONT",
                                    PLD_VerticalPosition = "UPPER",
                                    PLD_HorizontalPosition = "RIGHT",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }
                    }
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x0D, 
                    0x03
                })
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Local0 = Package (0x0F)
                        {
                            "built-in", 
                            Buffer (One)
                            {
                                 0x00                                             /* . */
                            }, 

                            "device_type", 
                            Buffer (0x05)
                            {
                                "EHCI"
                            }, 

                            "AAPL,clock-id", 
                            Buffer (One)
                            {
                                 0x00                                             /* . */
                            }, 

                            "AAPL,current-available", 
                            0x05DC, 
                            "AAPL,current-extra", 
                            0x03E8, 
                            "AAPL,current-in-sleep", 
                            0x0BB8, 
                            Buffer (One)
                            {
                                 0x00                                             /* . */
                            }
                        }
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (IDE1)
            {
                Name (_ADR, 0x001F0002)  // _ADR: Address
                OperationRegion (PCI, PCI_Config, 0x40, 0x20)
                Field (PCI, DWordAcc, NoLock, Preserve)
                {
                    ITM0,   16, 
                    ITM1,   16, 
                    SIT0,   4, 
                    SIT1,   4, 
                    Offset (0x08), 
                    UDC0,   2, 
                    UDC1,   2, 
                    Offset (0x0A), 
                    UDT0,   8, 
                    UDT1,   8, 
                    Offset (0x14), 
                    ICF0,   2, 
                    ICF1,   2, 
                        ,   6, 
                    WPPE,   1, 
                        ,   1, 
                    FAS0,   2, 
                    FAS1,   2
                }

                Device (PRIM)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local0 = GTM (ITM0, SIT0, UDC0, UDT0, ICF0, FAS0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Local0 = STM (Arg0, Arg1, Arg2)
                        CreateDWordField (Local0, Zero, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        CreateDWordField (Local0, 0x14, FAS)
                        UDC0 = UDC /* \_SB_.PCI0.IDE1.PRIM._STM.UDC_ */
                        UDT0 = UDT /* \_SB_.PCI0.IDE1.PRIM._STM.UDT_ */
                        ICF0 = ICF /* \_SB_.PCI0.IDE1.PRIM._STM.ICF_ */
                        FAS0 = FAS /* \_SB_.PCI0.IDE1.PRIM._STM.FAS_ */
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Local0 = GTF0 (ITM0, SIT0, UDC0, UDT0, ICF0, H15F, FAS0)
                            Return (Local0)
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Local0 = GTF1 (ITM0, SIT0, UDC0, UDT0, ICF0, H15F, FAS0)
                            Return (Local0)
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local0 = GTM (ITM1, SIT1, UDC1, UDT1, ICF1, FAS1)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Local0 = STM (Arg0, Arg1, Arg2)
                        CreateDWordField (Local0, Zero, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        CreateDWordField (Local0, 0x14, FAS)
                        UDC1 = UDC /* \_SB_.PCI0.IDE1.SECD._STM.UDC_ */
                        UDT1 = UDT /* \_SB_.PCI0.IDE1.SECD._STM.UDT_ */
                        ICF1 = ICF /* \_SB_.PCI0.IDE1.SECD._STM.ICF_ */
                        FAS1 = FAS /* \_SB_.PCI0.IDE1.SECD._STM.FAS_ */
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Local0 = GTF0 (ITM1, SIT1, UDC1, UDT1, ICF1, H15F, FAS1)
                            Return (Local0)
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Local0 = GTF1 (ITM1, SIT1, UDC1, UDT1, ICF1, H15F, FAS1)
                            Return (Local0)
                        }
                    }
                }
            }

            Device (IDE2)
            {
                Name (_ADR, 0x001F0005)  // _ADR: Address
                OperationRegion (PCI, PCI_Config, 0x40, 0x20)
                Field (PCI, DWordAcc, NoLock, Preserve)
                {
                    ITM0,   16, 
                    ITM1,   16, 
                    SIT0,   4, 
                    SIT1,   4, 
                    Offset (0x08), 
                    UDC0,   1, 
                        ,   1, 
                    UDC1,   1, 
                    Offset (0x0A), 
                    UDT0,   8, 
                    UDT1,   8, 
                    Offset (0x14), 
                    ICF0,   2, 
                    ICF1,   2, 
                        ,   6, 
                    WPPE,   1, 
                        ,   1, 
                    FAS0,   2, 
                    FAS1,   2
                }

                Device (PRIM)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local0 = GTM (ITM0, SIT0, UDC0, UDT0, ICF0, FAS0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Local0 = STM (Arg0, Arg1, Arg2)
                        CreateDWordField (Local0, Zero, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        CreateDWordField (Local0, 0x14, FAS)
                        UDC0 = UDC /* \_SB_.PCI0.IDE2.PRIM._STM.UDC_ */
                        UDT0 = UDT /* \_SB_.PCI0.IDE2.PRIM._STM.UDT_ */
                        ICF0 = ICF /* \_SB_.PCI0.IDE2.PRIM._STM.ICF_ */
                        FAS0 = FAS /* \_SB_.PCI0.IDE2.PRIM._STM.FAS_ */
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Local0 = GTF0 (ITM0, SIT0, UDC0, UDT0, ICF0, H15F, FAS0)
                            Return (Local0)
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Local0 = GTF1 (ITM0, SIT0, UDC0, UDT0, ICF0, H15F, FAS0)
                            Return (Local0)
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local0 = GTM (ITM1, SIT1, UDC1, UDT1, ICF1, FAS1)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Local0 = STM (Arg0, Arg1, Arg2)
                        CreateDWordField (Local0, Zero, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        CreateDWordField (Local0, 0x14, FAS)
                        UDC1 = UDC /* \_SB_.PCI0.IDE2.SECD._STM.UDC_ */
                        UDT1 = UDT /* \_SB_.PCI0.IDE2.SECD._STM.UDT_ */
                        ICF1 = ICF /* \_SB_.PCI0.IDE2.SECD._STM.ICF_ */
                        FAS1 = FAS /* \_SB_.PCI0.IDE2.SECD._STM.FAS_ */
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Local0 = GTF0 (ITM1, SIT1, UDC1, UDT1, ICF1, H15F, FAS1)
                            Return (Local0)
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Local0 = GTF1 (ITM1, SIT1, UDC1, UDT1, ICF1, H15F, FAS1)
                            Return (Local0)
                        }
                    }
                }
            }

            Method (GTM, 6, NotSerialized)
            {
                Local0 = Buffer (0x14) {}
                CreateDWordField (Local0, Zero, PIO0)
                CreateDWordField (Local0, 0x04, DMA0)
                CreateDWordField (Local0, 0x08, PIO1)
                CreateDWordField (Local0, 0x0C, DMA1)
                CreateDWordField (Local0, 0x10, FLAG)
                FLAG = 0x10
                If (((Arg0 & 0x08) || !(Arg0 & One)))
                {
                    PIO0 = 0x0384
                }
                Else
                {
                    Local1 = (((Arg0 & 0x0300) >> 0x08) + ((Arg0 & 
                        0x3000) >> 0x0C))
                    PIO0 = ((0x09 - Local1) * 0x1E)
                }

                If (((Arg0 && 0x4000) || (Arg2 && One)))
                {
                    If (((Arg0 & 0x80) || !(Arg0 & 0x10)))
                    {
                        PIO1 = 0x0384
                    }
                    Else
                    {
                        Local1 = ((Arg1 & 0x03) + ((Arg1 & 0x0C) >> 0x02
                            ))
                        PIO1 = ((0x09 - Local1) * 0x1E)
                    }
                }
                Else
                {
                    PIO1 = PIO0 /* \_SB_.PCI0.GTM_.PIO0 */
                }

                If ((Arg2 & One))
                {
                    Local1 = (0x04 - (Arg3 & 0x03))
                    If ((Arg5 & One))
                    {
                        DMA0 = 0x14
                    }
                    Else
                    {
                        If ((Arg4 & One))
                        {
                            DMA0 = (Local1 * 0x0F)
                        }
                        Else
                        {
                            DMA0 = (Local1 * 0x1E)
                        }
                    }
                }
                Else
                {
                    DMA0 = PIO0 /* \_SB_.PCI0.GTM_.PIO0 */
                }

                If (((Arg0 && 0x4000) || (Arg2 && One)))
                {
                    If ((Arg2 & 0x02))
                    {
                        Local1 = (0x04 - ((Arg3 & 0x30) >> 0x04))
                        If ((Arg5 & 0x02))
                        {
                            DMA1 = 0x14
                        }
                        Else
                        {
                            If ((Arg4 & 0x02))
                            {
                                DMA1 = (Local1 * 0x0F)
                            }
                            Else
                            {
                                DMA1 = (Local1 * 0x1E)
                            }
                        }
                    }
                    Else
                    {
                        DMA1 = PIO1 /* \_SB_.PCI0.GTM_.PIO1 */
                    }
                }
                Else
                {
                    DMA1 = DMA0 /* \_SB_.PCI0.GTM_.DMA0 */
                }

                FLAG = Zero
                If ((Arg0 & One))
                {
                    FLAG |= 0x10
                }

                If ((Arg2 & One))
                {
                    FLAG |= One
                }

                If ((Arg0 & 0x02))
                {
                    FLAG |= 0x02
                }

                If ((Arg2 & 0x02))
                {
                    FLAG |= 0x04
                }

                If ((Arg0 & 0x20))
                {
                    FLAG |= 0x08
                }

                Return (Local0)
            }

            Method (STM, 3, NotSerialized)
            {
                Local7 = Buffer (0x18) {}
                CreateDWordField (Local7, Zero, ITM)
                CreateDWordField (Local7, 0x04, SIT)
                CreateDWordField (Local7, 0x08, UDC)
                CreateDWordField (Local7, 0x0C, UDT)
                CreateDWordField (Local7, 0x10, ICF)
                CreateDWordField (Local7, 0x14, FAS)
                CreateDWordField (Arg0, Zero, PIO0)
                CreateDWordField (Arg0, 0x04, DMA0)
                CreateDWordField (Arg0, 0x08, PIO1)
                CreateDWordField (Arg0, 0x0C, DMA1)
                CreateDWordField (Arg0, 0x10, FLAG)
                Local4 = FLAG /* \_SB_.PCI0.STM_.FLAG */
                Local0 = 0x8000
                If ((Local4 & 0x02))
                {
                    Local0 |= 0x07
                }

                If ((Local4 & 0x08))
                {
                    Local0 |= 0x4000
                    Local0 |= 0x70
                }

                If (((DMA0 < PIO0) && !(Local4 & One)))
                {
                    Local0 |= 0x08
                }

                If (((DMA1 < PIO1) && !(Local4 & 0x04)))
                {
                    Local0 |= 0x80
                }

                If (PIO0)
                {
                    If ((PIO0 < 0x0384))
                    {
                        Local0 |= One
                    }
                }

                If (PIO1)
                {
                    If ((PIO1 < 0x0384))
                    {
                        Local0 |= 0x10
                    }
                }

                If ((Local4 & One))
                {
                    Local1 = PIO0 /* \_SB_.PCI0.STM_.PIO0 */
                }
                Else
                {
                    Local1 = DMA0 /* \_SB_.PCI0.STM_.DMA0 */
                }

                If (Local1)
                {
                    If ((Local1 <= 0x78))
                    {
                        Local0 |= 0x2300
                    }
                    Else
                    {
                        If ((Local1 <= 0xB4))
                        {
                            Local0 |= 0x2100
                        }
                        Else
                        {
                            If ((Local1 <= 0xF0))
                            {
                                Local0 |= 0x1000
                            }
                        }
                    }
                }

                ITM = Local0
                Local0 = Zero
                If ((Local4 & 0x04))
                {
                    Local1 = PIO1 /* \_SB_.PCI0.STM_.PIO1 */
                }
                Else
                {
                    Local1 = DMA1 /* \_SB_.PCI0.STM_.DMA1 */
                }

                If (Local1)
                {
                    If ((Local1 <= 0x78))
                    {
                        Local0 = 0x0B
                    }
                    Else
                    {
                        If ((Local1 <= 0xB4))
                        {
                            Local0 = 0x09
                        }
                        Else
                        {
                            If ((Local1 <= 0xF0))
                            {
                                Local0 = 0x04
                            }
                        }
                    }
                }

                SIT = Local0
                Local0 = Zero
                If ((Local4 & One))
                {
                    Local0 |= One
                }

                If ((Local4 & 0x04))
                {
                    Local0 |= 0x02
                }

                UDC = Local0
                Local0 = Zero
                If ((Local4 & One))
                {
                    If ((DMA0 == 0x14))
                    {
                        Local0 = One
                    }
                    Else
                    {
                        If ((DMA0 < 0x3C))
                        {
                            Local1 = (DMA0 / 0x0F)
                        }
                        Else
                        {
                            Local1 = (DMA0 / 0x1E)
                        }

                        Local0 = (0x04 - Local1)
                    }
                }

                If ((Local4 & 0x04))
                {
                    If ((DMA1 == 0x14))
                    {
                        Local1 = One
                    }
                    Else
                    {
                        If ((DMA1 < 0x3C))
                        {
                            Local1 = (DMA1 / 0x0F)
                        }
                        Else
                        {
                            Local1 = (DMA1 / 0x1E)
                        }

                        Local1 -= 0x04
                    }

                    Local1 <<= 0x04
                    Local0 |= Local1
                }

                UDT = Local0
                Local0 = Zero
                If (DMA0)
                {
                    If ((DMA0 > 0x14))
                    {
                        If ((DMA0 < 0x3C))
                        {
                            Local0 |= One
                        }
                    }
                }

                If (DMA1)
                {
                    If ((DMA1 > 0x14))
                    {
                        If ((DMA1 < 0x3C))
                        {
                            Local0 |= 0x02
                        }
                    }
                }

                ICF = Local0
                Local0 = Zero
                If ((DMA0 == 0x14))
                {
                    Local0 |= One
                }

                If ((DMA1 == 0x14))
                {
                    Local0 |= 0x02
                }

                FAS = Local0
                Return (Local7)
            }

            Method (H15P, 1, NotSerialized)
            {
                Name (BUFF, Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                })
                Local0 = Arg0
                Local1 = BUFF /* \_SB_.PCI0.H15P.BUFF */
                Concatenate (Local0, Local1, Local7)
                CreateWordField (Local7, 0x02, CYL)
                CreateWordField (Local7, 0x06, HEAD)
                CreateWordField (Local7, 0x0C, SPT)
                If (((HEAD >= 0x10) && (CYL >= 0x2000)))
                {
                    Return (SPT) /* \_SB_.PCI0.H15P.SPT_ */
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (GTF0, 7, NotSerialized)
            {
                Local7 = Buffer (0x07)
                    {
                         0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF         /* ....... */
                    }
                CreateByteField (Local7, One, MODE)
                If ((Arg2 & One))
                {
                    Local0 = (Arg3 & 0x03)
                    If ((Arg6 & One))
                    {
                        Local0 += 0x04
                    }
                    Else
                    {
                        If ((Arg4 & One))
                        {
                            Local0 += 0x02
                        }
                    }

                    MODE = (Local0 | 0x40)
                }
                Else
                {
                    Local0 = (((Arg0 & 0x0300) >> 0x08) + ((Arg0 & 
                        0x3000) >> 0x0C))
                    If ((Local0 >= 0x05))
                    {
                        MODE = 0x22
                    }
                    Else
                    {
                        If ((Local0 >= 0x03))
                        {
                            MODE = 0x21
                        }
                        Else
                        {
                            MODE = 0x20
                        }
                    }
                }

                Concatenate (Local7, Local7, Local6)
                If (((Arg0 & 0x08) || !(Arg0 & One)))
                {
                    If ((Arg0 & 0x02))
                    {
                        MODE = Zero
                    }
                    Else
                    {
                        MODE = One
                    }
                }
                Else
                {
                    Local0 = (((Arg0 & 0x0300) >> 0x08) + ((Arg0 & 
                        0x3000) >> 0x0C))
                    If ((Local0 >= 0x05))
                    {
                        MODE = 0x0C
                    }
                    Else
                    {
                        If ((Local0 >= 0x03))
                        {
                            MODE = 0x0B
                        }
                        Else
                        {
                            MODE = 0x0A
                        }
                    }
                }

                Concatenate (Local6, Local7, Local5)
                If (Arg5)
                {
                    Local4 = Buffer (0x07)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0xAE, 0x91         /* ....... */
                        }
                    CreateByteField (Local4, One, SPT)
                    SPT = Arg5
                    Concatenate (Local5, Local4, Local6)
                    Return (Local6)
                }
                Else
                {
                    Return (Local5)
                }
            }

            Method (GTF1, 7, NotSerialized)
            {
                Local7 = Buffer (0x07)
                    {
                         0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF         /* ....... */
                    }
                CreateByteField (Local7, One, MODE)
                If ((Arg2 & 0x02))
                {
                    Local0 = ((Arg3 & 0x30) >> 0x04)
                    If ((Arg6 & 0x02))
                    {
                        Local0 += 0x04
                    }
                    Else
                    {
                        If ((Arg4 & 0x02))
                        {
                            Local0 += 0x02
                        }
                    }

                    MODE = (Local0 | 0x40)
                }
                Else
                {
                    Local0 = (((Arg1 & 0x03) >> 0x02) + (Arg1 & 0x0C
                        ))
                    If ((Local0 >= 0x05))
                    {
                        MODE = 0x22
                    }
                    Else
                    {
                        If ((Local0 >= 0x03))
                        {
                            MODE = 0x21
                        }
                        Else
                        {
                            MODE = 0x20
                        }
                    }
                }

                Concatenate (Local7, Local7, Local6)
                If (((Arg0 & 0x80) || !(Arg0 & 0x10)))
                {
                    If ((Arg0 & 0x20))
                    {
                        MODE = Zero
                    }
                    Else
                    {
                        MODE = One
                    }
                }
                Else
                {
                    Local0 = (((Arg1 & 0x03) >> 0x02) + (Arg1 & 0x0C
                        ))
                    If ((Local0 >= 0x05))
                    {
                        MODE = 0x0C
                    }
                    Else
                    {
                        If ((Local0 >= 0x03))
                        {
                            MODE = 0x0B
                        }
                        Else
                        {
                            MODE = 0x0A
                        }
                    }
                }

                Concatenate (Local6, Local7, Local5)
                If (Arg5)
                {
                    Local4 = Buffer (0x07)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0xBE, 0x91         /* ....... */
                        }
                    CreateByteField (Local4, One, SPT)
                    SPT = Arg5
                    Concatenate (Local5, Local4, Local6)
                    Return (Local6)
                }
                Else
                {
                    Return (Local5)
                }
            }

            Device (PX43)
            {
                Name (_ADR, 0x001F0003)  // _ADR: Address
                OperationRegion (PBAS, PCI_Config, 0x20, 0x02)
                Field (PBAS, ByteAcc, NoLock, Preserve)
                {
                    BAS0,   16
                }

                Method (SMBB, 0, NotSerialized)
                {
                    Local0 = (BAS0 & 0xFFFE)
                    Return (Local0)
                }

                Device (BUS0)
                {
                    Name (_CID, "smbus")  // _CID: Compatible ID
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (DVL0)
                    {
                        Name (_ADR, 0x57)  // _ADR: Address
                        Name (_CID, "diagsvault")  // _CID: Compatible ID
                        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                        {
                            Local0 = Package (0x02)
                                {
                                    "address", 
                                    0x57
                                }
                            DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                            Return (Local0)
                        }
                    }
                }
            }

            Device (HDEF)
            {
                Name (_ADR, 0x001B0000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x0D, 
                        0x05
                    })
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Local0 = Package (0x08)
                        {
                            "hda-gfx", 
                            Buffer (0x0A)
                            {
                                "onboard-1"
                            }, 

                            "layout-id", 
                            Unicode ("\x03"), 
                            "MaximumBootBeepVolume", 
                            Buffer (One)
                            {
                                 0x01                                             /* . */
                            }, 

                            "PinConfigurations", 
                            Buffer (Zero) {}
                        }
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Name (BUFA, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11,12,14,15}
            })
            Name (BUFB, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {}
            })
            CreateWordField (BUFB, One, IRQV)
            Device (LNKA)
            {
                Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                Name (_UID, One)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Local0 = (PIRA & 0x80)
                    If ((Local0 == 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                {
                    Return (BUFA) /* \_SB_.PCI0.BUFA */
                }

                Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                {
                    PIRA |= 0x80
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Local0 = (PIRA & 0x0F)
                    IRQV = (One << Local0)
                    Return (BUFB) /* \_SB_.PCI0.BUFB */
                }

                Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                {
                    CreateWordField (Arg0, One, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Local0--
                    PIRA = Local0
                }
            }

            Device (LNKB)
            {
                Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                Name (_UID, 0x02)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Local0 = (PIRB & 0x80)
                    If ((Local0 == 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                {
                    Return (BUFA) /* \_SB_.PCI0.BUFA */
                }

                Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                {
                    PIRB |= 0x80
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Local0 = (PIRB & 0x0F)
                    IRQV = (One << Local0)
                    Return (BUFB) /* \_SB_.PCI0.BUFB */
                }

                Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                {
                    CreateWordField (Arg0, One, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Local0--
                    PIRB = Local0
                }
            }

            Device (LNKC)
            {
                Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                Name (_UID, 0x03)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Local0 = (PIRC & 0x80)
                    If ((Local0 == 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                {
                    Return (BUFA) /* \_SB_.PCI0.BUFA */
                }

                Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                {
                    PIRC |= 0x80
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Local0 = (PIRC & 0x0F)
                    IRQV = (One << Local0)
                    Return (BUFB) /* \_SB_.PCI0.BUFB */
                }

                Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                {
                    CreateWordField (Arg0, One, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Local0--
                    PIRC = Local0
                }
            }

            Device (LNKD)
            {
                Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                Name (_UID, 0x04)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Local0 = (PIRD & 0x80)
                    If ((Local0 == 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                {
                    Return (BUFA) /* \_SB_.PCI0.BUFA */
                }

                Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                {
                    PIRD |= 0x80
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Local0 = (PIRD & 0x0F)
                    IRQV = (One << Local0)
                    Return (BUFB) /* \_SB_.PCI0.BUFB */
                }

                Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                {
                    CreateWordField (Arg0, One, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Local0--
                    PIRD = Local0
                }
            }

            Device (LNKE)
            {
                Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                Name (_UID, 0x05)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Local0 = (PIRE & 0x80)
                    If ((Local0 == 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                {
                    Return (BUFA) /* \_SB_.PCI0.BUFA */
                }

                Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                {
                    PIRE |= 0x80
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Local0 = (PIRE & 0x0F)
                    IRQV = (One << Local0)
                    Return (BUFB) /* \_SB_.PCI0.BUFB */
                }

                Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                {
                    CreateWordField (Arg0, One, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Local0--
                    PIRE = Local0
                }
            }

            Device (LNKF)
            {
                Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                Name (_UID, 0x06)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Local0 = (PIRF & 0x80)
                    If ((Local0 == 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                {
                    Return (BUFA) /* \_SB_.PCI0.BUFA */
                }

                Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                {
                    PIRF |= 0x80
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Local0 = (PIRF & 0x0F)
                    IRQV = (One << Local0)
                    Return (BUFB) /* \_SB_.PCI0.BUFB */
                }

                Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                {
                    CreateWordField (Arg0, One, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Local0--
                    PIRF = Local0
                }
            }

            Device (LNK0)
            {
                Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                Name (_UID, 0x07)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Local0 = (PIRG & 0x80)
                    If ((Local0 == 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                {
                    Return (BUFA) /* \_SB_.PCI0.BUFA */
                }

                Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                {
                    PIRG |= 0x80
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Local0 = (PIRG & 0x0F)
                    IRQV = (One << Local0)
                    Return (BUFB) /* \_SB_.PCI0.BUFB */
                }

                Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                {
                    CreateWordField (Arg0, One, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Local0--
                    PIRG = Local0
                }
            }

            Device (LNK1)
            {
                Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                Name (_UID, 0x08)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Local0 = (PIRH & 0x80)
                    If ((Local0 == 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                {
                    Return (BUFA) /* \_SB_.PCI0.BUFA */
                }

                Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                {
                    PIRH |= 0x80
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Local0 = (PIRH & 0x0F)
                    IRQV = (One << Local0)
                    Return (BUFB) /* \_SB_.PCI0.BUFB */
                }

                Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                {
                    CreateWordField (Arg0, One, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Local0--
                    PIRH = Local0
                }
            }

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (Package (0x02)
                {
                    0x0B, 
                    0x05
                })
            }

            Device (CWDT)
            {
                Name (_HID, EisaId ("INT3F0D") /* ACPI Motherboard Resources */)  // _HID: Hardware ID
                Name (_CID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _CID: Compatible ID
                Name (BUF0, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0454,             // Range Minimum
                        0x0454,             // Range Maximum
                        0x04,               // Alignment
                        0x04,               // Length
                        )
                })
                Method (_STA, 0, Serialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                {
                    Return (BUF0) /* \_SB_.PCI0.CWDT.BUF0 */
                }
            }
/* tjl
            Device (IMEI)
            {
                Name (_ADR, 0x00160000)  // _ADR: Address
            }
   tjl */
        }

        Device (MEM)
        {
            Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x000F0000,         // Address Base
                        0x00004000,         // Address Length
                        _Y02)
                    Memory32Fixed (ReadWrite,
                        0x000F4000,         // Address Base
                        0x00004000,         // Address Length
                        _Y03)
                    Memory32Fixed (ReadWrite,
                        0x000F8000,         // Address Base
                        0x00004000,         // Address Length
                        _Y04)
                    Memory32Fixed (ReadWrite,
                        0x000FC000,         // Address Base
                        0x00004000,         // Address Length
                        _Y05)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00080000,         // Address Length
                        _Y01)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x000A0000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x00100000,         // Address Base
                        0x00000000,         // Address Length
                        _Y08)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y09)
                    Memory32Fixed (ReadWrite,
                        0xFEC00000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED10000,         // Address Base
                        0x0000E000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED20000,         // Address Base
                        0x00070000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEE00000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFFB00000,         // Address Base
                        0x00080000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFFF00000,         // Address Base
                        0x00100000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x000E0000,         // Address Base
                        0x00010000,         // Address Length
                        _Y06)
                    Memory32Fixed (ReadWrite,
                        0x20000000,         // Address Base
                        0x00200000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x40000000,         // Address Base
                        0x00100000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFFF00000,         // Address Base
                        0x00010000,         // Address Length
                        _Y07)
                })
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y01._BAS, ACMM)  // _BAS: Base Address
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y02._BAS, RMA1)  // _BAS: Base Address
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y02._LEN, RSS1)  // _LEN: Length
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y03._BAS, RMA2)  // _BAS: Base Address
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y03._LEN, RSS2)  // _LEN: Length
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y04._BAS, RMA3)  // _BAS: Base Address
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y04._LEN, RSS3)  // _LEN: Length
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y05._BAS, RMA4)  // _BAS: Base Address
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y05._LEN, RSS4)  // _LEN: Length
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y06._BAS, ERMA)  // _BAS: Base Address
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y06._LEN, ERMS)  // _LEN: Length
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y07._BAS, ISMB)  // _BAS: Base Address
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y07._LEN, ISMS)  // _LEN: Length
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y08._LEN, EXTM)  // _LEN: Length
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y09._BAS, USMA)  // _BAS: Base Address
                CreateDWordField (BUF0, \_SB.MEM._CRS._Y09._LEN, USMS)  // _LEN: Length
                USMA = (AMEM + 0x00080000)
                USMS += 0x00040000
                EXTM = (AMEM - 0x00100000)
                If ((ROM1 != Zero))
                {
                    RMA2 = RMA1 /* \_SB_.MEM_._CRS.RMA1 */
                    Local0 = (ROM1 << 0x08)
                    RMA1 = Local0
                    Local0 = (RMS1 << 0x08)
                    RSS1 = Local0
                    RSS2 = 0x8000
                }

                If ((ROM2 != Zero))
                {
                    RMA3 = RMA2 /* \_SB_.MEM_._CRS.RMA2 */
                    Local0 = (ROM2 << 0x08)
                    RMA2 = Local0
                    Local0 = (RMS2 << 0x08)
                    RSS2 = Local0
                    RSS3 = 0xC000
                }

                If ((ROM3 != Zero))
                {
                    RMA4 = RMA3 /* \_SB_.MEM_._CRS.RMA3 */
                    Local0 = (ROM3 << 0x08)
                    RMA3 = Local0
                    Local0 = (RMS3 << 0x08)
                    RSS3 = Local0
                    RSS4 = 0x00010000
                }

                Local1 = ERMA /* \_SB_.MEM_._CRS.ERMA */
                If ((RMA1 > 0x000D0000))
                {
                    If ((RMA1 < 0x000F0000))
                    {
                        Local0 = (RMA1 + RSS1) /* \_SB_.MEM_._CRS.RSS1 */
                        If ((Local0 > 0x000E0000))
                        {
                            If ((Local0 > Local1))
                            {
                                Local1 = Local0
                            }
                        }
                    }
                }

                If ((RMA2 > 0x000D0000))
                {
                    If ((RMA2 < 0x000F0000))
                    {
                        Local0 = (RMA2 + RSS2) /* \_SB_.MEM_._CRS.RSS2 */
                        If ((Local0 > 0x000E0000))
                        {
                            If ((Local0 > Local1))
                            {
                                Local1 = Local0
                            }
                        }
                    }
                }

                If ((RMA3 > 0x000D0000))
                {
                    If ((RMA3 < 0x000F0000))
                    {
                        Local0 = (RMA3 + RSS3) /* \_SB_.MEM_._CRS.RSS3 */
                        If ((Local0 > 0x000E0000))
                        {
                            If ((Local0 > Local1))
                            {
                                Local1 = Local0
                            }
                        }
                    }
                }

                If ((Local1 > ERMA))
                {
                    Local0 = (Local1 - ERMA) /* \_SB_.MEM_._CRS.ERMA */
                    If ((Local0 <= 0x00010000))
                    {
                        ERMA = Local1
                        ERMS = (0x00010000 - Local0)
                    }
                }

                ISMB = TSMB /* \TSMB */
                ISMS = (TLUD - TSMB) /* \TSMB */
                ACMM = AMEM /* \AMEM */
                Return (BUF0) /* \_SB_.MEM_._CRS.BUF0 */
            }
        }

        Device (FWH)
        {
            Name (_HID, EisaId ("INT0800") /* Intel 82802 Firmware Hub Device */)  // _HID: Hardware ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (FWH0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFFB80000,         // Address Base
                        0x00080000,         // Address Length
                        )
                })
                Return (FWH0) /* \_SB_.FWH_._CRS.FWH0 */
            }
        }

        Device (PCI0.EXPL)
        {
            Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xF4000000,         // Address Base
                        0x04000000,         // Address Length
                        )
                })
                Return (BUF0) /* \_SB_.PCI0.EXPL._CRS.BUF0 */
            }
        }
    }

    Method (DTGP, 5, NotSerialized)
    {
        If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
        {
            If ((Arg1 == One))
            {
                If ((Arg2 == Zero))
                {
                    Arg4 = Buffer (One)
                        {
                             0x03                                             /* . */
                        }
                    Return (One)
                }

                If ((Arg2 == One))
                {
                    Return (One)
                }
            }
        }

        Arg4 = Buffer (One)
            {
                 0x00                                             /* . */
            }
        Return (Zero)
    }
}

