/** @file

  Copyright (c) 2011 - 2020, Arm Limited. All rights reserved.<BR>

  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef _PREPI_H_
#define _PREPI_H_

#include <PiPei.h>

#include <Library/PcdLib.h>
#include <Library/ArmLib.h>
#include <Library/BaseMemoryLib.h>
#include <Library/DebugLib.h>
#include <Library/IoLib.h>
#include <Library/MemoryAllocationLib.h>
#include <Library/HobLib.h>
#include <Library/SerialPortLib.h>
#include <Library/ArmPlatformLib.h>

#define MDP_BASE                    (0x900000)
#define REG_MDP(off)                (MDP_BASE + (off))
#define MDP_HW_REV                  REG_MDP(0x1000)
#define MDP_CTL_0_BASE				      REG_MDP(0x2000)

#define CTL_FLUSH                               0x18
#define CTL_START                               0x1C

#define MDSS_MDP_REG_PP_SYNC_CONFIG_VSYNC       0x004
#define MDSS_MDP_REG_PP_AUTOREFRESH_CONFIG      0x030

#define MDSS_MDP_REV(major, minor, step) \
        ((((major) & 0x000F) << 28) |    \
         (((minor) & 0x0FFF) << 16) |    \
         ((step)   & 0xFFFF))
#define MDSS_MDP_HW_REV_102    MDSS_MDP_REV(1, 2, 0) /* 8974 v2.0 */
#define MDSS_MDP_HW_REV_105    MDSS_MDP_REV(1, 5, 0) /* 8994 v1.0 */

#define BIT(bit) (1 << (bit))

extern UINT64  mSystemMemoryEnd;

RETURN_STATUS
EFIAPI
TimerConstructor (
  VOID
  );

VOID
PrePiMain (
  IN  UINTN   UefiMemoryBase,
  IN  UINTN   StacksBase,
  IN  UINT64  StartTimeStamp
  );

EFI_STATUS
EFIAPI
MemoryPeim (
  IN EFI_PHYSICAL_ADDRESS  UefiMemoryBase,
  IN UINT64                UefiMemorySize
  );

EFI_STATUS
EFIAPI
PlatformPeim (
  VOID
  );

VOID
PrimaryMain (
  IN  UINTN   UefiMemoryBase,
  IN  UINTN   StacksBase,
  IN  UINT64  StartTimeStamp
  );

VOID
SecondaryMain (
  IN  UINTN  MpId
  );

// Either implemented by PrePiLib or by MemoryInitPei
VOID
BuildMemoryTypeInformationHob (
  VOID
  );

EFI_STATUS
GetPlatformPpi (
  IN  EFI_GUID  *PpiGuid,
  OUT VOID      **Ppi
  );

// Initialize the Architecture specific controllers
VOID
ArchInitialize (
  VOID
  );

VOID
EFIAPI
ProcessLibraryConstructorList (
  VOID
  );

#endif /* _PREPI_H_ */
