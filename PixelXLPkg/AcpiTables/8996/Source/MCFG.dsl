/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180105 (64-bit version)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembly of mcfg.acp, Sat Apr 18 09:39:16 2020
 *
 * ACPI Data Table [MCFG]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "MCFG"    [Memory Mapped Configuration table]
[004h 0004   4]                 Table Length : 0000005C
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 00     /* Incorrect checksum, should be 63 */
[00Ah 0010   6]                       Oem ID : "QCOM  "
[010h 0016   8]                 Oem Table ID : "QCOMEDK2"
[018h 0024   4]                 Oem Revision : 00008996
[01Ch 0028   4]              Asl Compiler ID : "QCOM"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   8]                     Reserved : 0000000000000000

[02Ch 0044   8]                 Base Address : 000000000C000000
[034h 0052   2]         Segment Group Number : 0000
[036h 0054   1]             Start Bus Number : 00
[037h 0055   1]               End Bus Number : 01
[038h 0056   4]                     Reserved : 00000000

[03Ch 0060   8]                 Base Address : 000000000D000000
[044h 0068   2]         Segment Group Number : 0001
[046h 0070   1]             Start Bus Number : 00
[047h 0071   1]               End Bus Number : 01
[048h 0072   4]                     Reserved : 00000000

[04Ch 0076   8]                 Base Address : 000000000E000000
[054h 0084   2]         Segment Group Number : 0002
[056h 0086   1]             Start Bus Number : 00
[057h 0087   1]               End Bus Number : 01
[058h 0088   4]                     Reserved : 00000000

Raw Table Data: Length 92 (0x5C)

  0000: 4D 43 46 47 5C 00 00 00 01 00 51 43 4F 4D 20 20  // MCFG\.....QCOM  
  0010: 51 43 4F 4D 45 44 4B 32 96 89 00 00 51 43 4F 4D  // QCOMEDK2....QCOM
  0020: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0C  // ................
  0030: 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 0D  // ................
  0040: 00 00 00 00 01 00 00 01 00 00 00 00 00 00 00 0E  // ................
  0050: 00 00 00 00 02 00 00 01 00 00 00 00              // ............
