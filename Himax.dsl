        Device (THPA)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "HIMX0001")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.GIO0
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    GpioIo (Exclusive, PullNone, 0x0000, 0x0640, IoRestrictionNone,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0063
                        }
                    GpioInt (Edge, ActiveLow, Exclusive, PullNone, 0x0000,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x00AF
                        }
                    GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullNone, 0x0000,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0008
                        }
                    SpiSerialBusV2 (0x0000, PolarityLow, FourWireMode, 0x08,
                        ControllerInitiated, 0x00B71B00, ClockPolarityLow,
                        ClockPhaseFirst, "\\_SB.SPI7",
                        0x00, ResourceConsumer, , Exclusive,
                        RawDataBuffer (0x07)  // Vendor Data
                        {
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                })
                Return (RBUF) /* \_SB_.THPA._CRS.RBUF */
            }

            Method (LCMT, 0, NotSerialized)
            {
                Local0 = TG02 /* \_SB_.TG02 */
                Return (Local0)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = DT02 /* \_SB_.DT02 */
                If ((Local0 == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (THPB)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "HIMX0002")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.GIO0
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    GpioInt (Edge, ActiveLow, Exclusive, PullNone, 0x0000,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0027
                        }
                    SpiSerialBusV2 (0x0000, PolarityLow, FourWireMode, 0x08,
                        ControllerInitiated, 0x00B71B00, ClockPolarityLow,
                        ClockPhaseFirst, "\\_SB.SP21",
                        0x00, ResourceConsumer, , Exclusive,
                        RawDataBuffer (0x07)  // Vendor Data
                        {
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                })
                Return (RBUF) /* \_SB_.THPB._CRS.RBUF */
            }

            Method (LCMS, 0, NotSerialized)
            {
                Local0 = D302 /* \_SB_.D302 */
                If ((Local0 == Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (One)
                }
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = DT02 /* \_SB_.DT02 */
                If ((Local0 == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }


        Device (HIMX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "HIMX1234")  // _HID: Hardware ID
            Name (_SUB, "HX83121A")  // _SUB: Subsystem ID
            Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
            Name (_HRV, One)  // _HRV: Hardware Revision
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_DEP, Package (0x03)  // _DEP: Dependencies
            {
                \_SB.GIO0, 
                \_SB.I2C5, 
                \_SB.PEP0
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x004F, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB.I2C5",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    GpioIo (Shared, PullDefault, 0x0000, 0x0000, IoRestrictionInputOnly,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0063
                        }
                    GpioInt (Level, ActiveLow, ExclusiveAndWake, PullNone, 0x0000,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x00AF
                        }
                })
                Return (RBUF) /* \_SB_.HIMX._CRS.RBUF */
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                While (One)
                {
                    Name (_T_0, Buffer (0x01)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    {
                         0x00                                             // .
                    })
                    CopyObject (ToBuffer (Arg0), _T_0) /* \_SB_.HIMX._DSM._T_0 */
                    If ((_T_0 == ToUUID ("3cdff6f7-4267-4555-ad05-b30a3d8938de") /* HID I2C Device */))
                    {
                        While (One)
                        {
                            Name (_T_1, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_1 = ToInteger (Arg2)
                            If ((_T_1 == Zero))
                            {
                                While (One)
                                {
                                    Name (_T_2, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                    _T_2 = ToInteger (Arg1)
                                    If ((_T_2 == One))
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }
                                    Else
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x00                                             // .
                                        })
                                    }

                                    Break
                                }
                            }
                            ElseIf ((_T_1 == One))
                            {
                                Return (One)
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
                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }

                    Break
                }
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = DT02 /* \_SB_.DT02 */
                If ((Local0 == Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }