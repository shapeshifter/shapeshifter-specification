<!--
SPDX-FileCopyrightText: 2020-2023 Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# FlexOrder

FlexOrder messages are used by DSOs to purchase flexibility from an AGR based on a previous FlexOffer.
A FlexOrder message contains a list of ISPs, with, for each ISP, the change in consumption or production to be realized by the AGR, and the accepted price to be paid by the DSO for this amount of flexibility.
This ISP list should be copied from the FlexOffer message without modification: AGR implementations will (and must) reject FlexOrder messages where the ISP list is not exactly the same as offered.

```
<FlexOrder
  Metadata…
  Period               = Period
  CongestionPoint      = EntityAddress
  FlexOfferMessageID   = UUID
  ContractID           = Text (only if the offer and order refer to a bilateral contract)
  ServiceType          = String (optional)  
  D-PrognosisMessageID = UUID (if present)
  BaselineReference    = Text (if present)
  Price                = CurrencyAmount
  Currency             = ISO4217Currency
  OrderReference       = String
  OptionReference      = String
  ActivationFactor     = Number (optional [0.01-1.00])
  <ISP                  (1...n)
    Power              = Integer
    DefaultBaseline    = Integer (optional)
    Baseline           = Integer (optional)
    Start              = Integer
    Duration           = Integer (optional, default = 1)
  />
/>
```

|                      |                                                                                                                                                                                                                                                                 |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Metadata             | The metadata for this message. For details, see [metadata attributes](metadata-attributes.md).                                                                                                                                                                  |
| Period               | Period the ISPs referenced in this FlexOrder message belong to.                                                                                                                                                                                                 |
| CongestionPoint      | Entity Address of the Congestion Point this FlexOrder message applies to                                                                                                                                                                                        |
| FlexOfferMessageID   | MessageID of the FlexOffer message this order is based on.                                                                                                                                                                                                      |
| ContractID           | Reference to the bilateral contract in question, if applicable.                                                                                                                                                                                                 |
| ServiceType          | Service type for this order, the service type determines response characteristics such as latency or asset participation type. Each contract may specify multiple service-types.                                                                                |
| D-PrognosisMessageID | MessageID of the D-Prognosis this order is based on, if present.                                                                                                                                                                                                |
| BaselineReference    | Identification of the baseline prognosis, if another baseline methodology is used than based on D-prognoses.                                                                                                                                                    |
| Price                | The price for the flexibility ordered. Usually, the price should match the price of the related FlexOffer.                                                                                                                                                      |
| Currency             | ISO 4217 code indicating the currency that applies to the price of the FlexOrder.                                                                                                                                                                               |
| OrderReference       | Order number assigned by the DSO originating the FlexOrder. To be stored by the AGR and used in the settlement phase.                                                                                                                                           |
| OptionReference      | The OptionReference from the OfferOption chosen from the FlexOffer.                                                                                                                                                                                             |
| ActivationFactor     | The activation factor for this OfferOption. If this  attribute is omitted, a default value of  1.00 must be assumed.</br>Notes:</br>The ActivationFactor must be greater than or equal to the MinActivationFactor in the OfferOption chosen from the FlexOffer. |
| ISP                  |                                                                                                                                                                                                                                                                 |
| ⇥ Power              | Power specified for this ISP in Watts. Also see the important notes about the sign of this attribute in the main documentation entry for the ISP element, section [power](power.md).                                                                            |
| ⇥ DefaultBaseline    | Capacity (specified in Watts) in the default situation that would occur if no flexibility were activated.                                                                                                                                                       |
| ⇥ Baseline           | Capacity baseline (specified in Watts) before this flexibility was requested. If flexibility was activated earlier for this ISP, then this is the capacity with the deviation applied.                                                                          |
| ⇥ Start              | Number of the first ISP this element refers to. The first ISP of a day has number 1.                                                                                                                                                                            |
| ⇥ Duration           | The number of the ISPs this element represents. Optional, default value is 1.                                                                                                                                                                                   |
