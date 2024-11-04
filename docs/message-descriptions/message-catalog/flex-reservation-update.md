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
  ContractID      = String
  ServiceType     = String (optional)
  Reference       = String
  Unit            = PowerUnitType (optional)
  <ISP              (1...n)
    Disposition      = "Available" | "Requested" (optional)
    Power         = Integer
    Start         = Integer
    Duration      = Integer (optional, default = 1)
  />
/>
```

|                 |                                                                                                                                                                                      |
|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Metadata        | The metadata for this message. For details, see section [metadata attributes](metadata-attributes.md).                                                                               |
| Period          | The Period this FlexRequest message applies to.                                                                                                                                      |
| CongestionPoint | Entity Address of the Congestion Point this FlexRequest message applies to.                                                                                                          |
| ContractID      | Reference to the bilateral contract in question.                                                                                                                                     |
| ServiceType     | Service type for this request, the service type determines response characteristics such as latency or asset participation type. Each contract may specify multiple service-types.   |
| Reference       | Message reference, assigned by the DSO originating the FlexReservationUpdate.                                                                                                        |
| Unit            | he unit of Power that applies to the Power of the ISP's (optional, if not specified, assume that the Power is specified in Watts)                                                    |
| ISP             |                                                                                                                                                                                      |
| ⇥ Disposition   | Indication whether the Power specified for this ISP represents available capacity or a request for reduction/increase.                                                               |
| ⇥ Power         | Remaining reserved power specified for this ISP (in the specified `Unit`). See important notes about the [flex reservation mechanism](../../appendix/flex-reservation-mechanism.md). |
| ⇥ Start         | Number of the first ISP this element refers to. The first ISP of a day has number 1.                                                                                                 |
| ⇥ Duration      | The number of the ISPs this element represents. Optional, default value is 1.                                                                                                        |
