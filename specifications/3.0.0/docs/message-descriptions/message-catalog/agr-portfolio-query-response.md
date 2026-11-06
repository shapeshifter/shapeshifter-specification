<!--
SPDX-FileCopyrightText: 2020-2023 Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# AGRPortfolioQueryResponse

Upon receiving and processing an AGRPortfolioQuery message, the receiving implementation must reply with an AGRPortfolioUpdate, indicating whether the query was handled successfully.

```
<AGRPortfolioQueryResponse
  Metadata…
  AGRPortfolioQueryMessageID = UUID
  Result                     = ("Accepted" | "Rejected")
  RejectionReason            = String (only if Result = "Rejected")
  Period                     = Date
  <DSO-View                    (only if Result = "Accepted")
    <DSO-Portfolio             (0...n)
      DSO-Domain             = InternetDomain
      <CongestionPoint         (1...n)
        EntityAddress        = EntityAddress
        MutexOffersSupported = Boolean
        DayAheadRedispatchBy = ("AGR" | "DSO" )
        IntradayRedispatchBy = ("AGR" | "DSO" ) (optional)
        <Connection          = (1...n)
          EntityAddress      = EntityAddress
        />
      />
      <Connection            = (0...n)
        EntityAddress        = EntityAddress
        />
      />
    />
  />
/>
```

|                            |                                                                                                                                                              |
|----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Metadata                   | The metadata for this message. For details, see section [metadata attributes](metadata-attributes.md).                                                       |
| AGRPortfolioQueryMessageID | MessageID of the AGRPortfolioQuery message                                                                                                                   |
| Result                     | Indication whether the AGRPortfolioQuery was accepted or rejected.                                                                                           |
| RejectionReason            | In case the AGRPortfolioQuery was rejected, this attribute must contain a human-readable description of the reason.                                          |
| Period                     | The Period that the portfolio is valid.                                                                                                                      |
| DSO-View                   |                                                                                                                                                              |
| ⇥ DSO-Portfolio            | Portfolio of a single DSO that shares connections with the AGR                                                                                               |
| ⇥ ⇥ DSO-Domain             | The InternetDomain of the DSO the portfolio applied to.                                                                                                      |
| ⇥ ⇥ CongestionPoint        | A CongestionPoint that contains at least one Connection of a prosumer that is represented by the AGR.                                                        |
| ⇥ ⇥ ⇥ EntityAddress        | Entity Address of the CongestionPoint entity being updated.                                                                                                  |
| ⇥ ⇥ ⇥ MutexOffersSupported | Indicates whether the DSO accepts mutual exclusive FlexOffers on this CongestionPoint                                                                        |
| ⇥ ⇥ ⇥ DayAheadRedispatchBy | Indicates which party is responsible for day-ahead redispatch, AGR or DSO.                                                                                   |
| ⇥ ⇥ ⇥ IntradayRedispatchBy | Indicates which party is responsible for intraday ahead redispatch, AGR or DSO. If not specified, there will be no intraday trading on this CongestionPoint. |
| ⇥ ⇥ ⇥ Connection           |                                                                                                                                                              |
| ⇥ ⇥ ⇥ ⇥ EntityAddress      | Entity Address of a Connection that is part of this CongestionPoint.                                                                                         |
| ⇥ ⇥ Connection             | Connection not belonging to any DSO CongestionPoint                                                                                                          |
| ⇥ ⇥ ⇥ EntityAddress        | Entity Address of the Connection                                                                                                                             |
