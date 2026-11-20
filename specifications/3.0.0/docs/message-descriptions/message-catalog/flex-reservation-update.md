<!--
SPDX-FileCopyrightText: 2020-2023 Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# FlexReservationUpdate

For bilateral contracts, FlexReservationUpdate messages are used by DSOs to signal to an AGR which part of the contracted volume is still reserved and which part is not needed and may be used for other purposes.
For each ISP, a power value is given which indicates how much power is still reserved. Zero power means that no power is reserved for that ISP and the sign of the power indicates the direction.

```
<FlexReservationUpdate
  Metadata…
  Period          = Period
  CongestionPoint = EntityAddress
  ContractID      = Text
  Reference       = String
  <ISP              (1...n)
    Power         = Integer
    Start         = Integer
    Duration      = Integer (optional, default = 1)
  />
/>
```

|                 |                                                                                                                                                                     |
|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Metadata        | The metadata for this message. For details, see section [metadata attributes](metadata-attributes.md).                                                              |
| Period          | The Period this FlexRequest message applies to.                                                                                                                     |
| CongestionPoint | Entity Address of the Congestion Point this FlexRequest message applies to.                                                                                         |
| ContractID      | Reference to the bilateral contract in question.                                                                                                                    |
| Reference       | Message reference, assigned by the DSO originating the FlexReservationUpdate.                                                                                       |
| ISP             |                                                                                                                                                                     |
| ⇥ Power         | Remaining reserved power specified for this ISP in Watts. See important notes about the [flex reservation mechanism](../../appendix/flex-reservation-mechanism.md). |
| ⇥ Start         | Number of the first ISP this element refers to. The first ISP of a day has number 1.                                                                                |
| ⇥ Duration      | The number of the ISPs this element represents. Optional, default value is 1.                                                                                       |
