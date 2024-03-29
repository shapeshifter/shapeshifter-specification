<!--
SPDX-FileCopyrightText: 2020-2023 Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# DSOPortfolioUpdate

The DSOPortfolioUpdate is used by the DSO to indicate on which congestion points it wants to engage in flexibility trading.

```
<DSOPortfolioUpdate
  Metadata…
  <CongestionPoint         (0...n)
    EntityAddress        = EntityAddress
    StartPeriod          = Date
    EndPeriod            = Date (optional)
    MutexOffersSupported = Boolean
    DayAheadRedispatchBy = ("AGR" | "DSO" )
    IntradayRedispatchBy = ("AGR" | "DSO" ) (optional)
    <Connection            (1...n)
      EntityAddress      = EntityAddress
      StartPeriod        = Date
      EndPeriod          = Date (optional)
    />
  />
/>
```

|                        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Metadata               | The metadata for this message. For details, see [metadata attributes](metadata-attributes.md).                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| CongestionPoint        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| ⇥ EntityAddress        | Entity Address of the CongestionPoint entity being updated.                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| ⇥ StartPeriod          | The first Period that the DSO is trading on this CongestionPoint.                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| ⇥ EndPeriod            | The last Period that the DSO is trading on this CongestionPoint.                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| ⇥ MutexOffersSupported | Indicates whether the DSO accepts mutual exclusive FlexOffers on this CongestionPoint                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ⇥ DayAheadRedispatchBy | Indicates which party is responsible for day-ahead redispatch, AGR or DSO.                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| ⇥ IntradayRedispatchBy | Indicates which party is responsible for intraday ahead redispatch, AGR or DSO. If not specified, there will be no intraday trading on this CongestionPoint.                                                                                                                                                                                                                                                                                                                                                                             |
| ⇥ Connection           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| ⇥ ⇥ EntityAddress      | Entity Address of a Connection that is part of this CongestionPoint.                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ⇥ ⇥ StartPeriod        | The first Period that the Connection is part of this CongestionPoint. Notes: <ul><li>The StartPeriod of a Connection should be greater than or equal to the StartPeriod of the CongestionPoint.</li><li>The StartPeriod of a Connection should be smaller than or equal to the EndPeriod of the CongestionPoint.</li><li>CRO implementors may choose to explicitly check for this and reject updates that do not comply.</li></ul>                                                                                                       |
| ⇥ ⇥ EndPeriod          | The last Period that the Connection is part of this CongestionPoint. Notes: <ul><li>The EndPeriod of a Connection should be null if and only if the EndPeriod of the CongestionPoint is null.</br>The EndPeriod of a Connection should be greater than or equal to the StartPeriod of the CongestionPoint.</li><li>The EndPeriod of a Connection should be smaller than or equal to the EndPeriod of the CongestionPoint.</li><li>CRO implementors may choose to explicitly check for this and reject updates that do not comply.</li></ul> |
