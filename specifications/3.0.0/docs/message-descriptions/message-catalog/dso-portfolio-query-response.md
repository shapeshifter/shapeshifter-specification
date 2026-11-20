<!--
SPDX-FileCopyrightText: 2020-2023 Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# DSOPortfolioQueryResponse

Upon receiving and processing a DSOPortfolioQuery message, the receiving implementation must reply with a DSOPortfolioQueryResponse, indicating whether the query executed successfully, and if it did, including the query results.
Most queries will return zero or more congestion points

```
<DSOPortfolioQueryResponse
  Metadata…
  DSOPortfolioQueryMessageID = UUID
  Result                     = ("Success" | "Failure")
  RejectionReason            = String (only if Result = "Failure")
  Period                     = Date
  <CongestionPoint             (0..n, 0 if Result = "Success")
    EntityAddress            = EntityAddress
      <Connection              (1..n)
        EntityAddress        = EntityAddress
        AGR-Domain           = InternetDomain (optional)
      />
   />
/>
```

|                            |                                                                                                           |
|----------------------------|-----------------------------------------------------------------------------------------------------------|
| Metadata                   | The metadata for this message. For details, see [metadata attributes](metadata-attributes.md).            |
| DSOPortfolioQueryMessageID | MessageID of the DSOPortfolioQuery message                                                                |
| Result                     | Indication whether the query was executed successfully or failed.                                         |
| RejectionReason            | In case the query failed, this attribute must contain a human-readable description of the failure reason. |
| Period                     | The period that was queried. This is also the Period for which the portfolio is valid.                    |
| CongestionPoint            | The congestion point that was queried.                                                                    |
| ⇥ EntityAddress            | The entity address of the congestion point.                                                               |
| ⇥ Connection               | A Connection that is part of the congestion point.                                                        |
| ⇥ ⇥ EntityAddress          | The entity address of the Connection                                                                      |
| ⇥ ⇥ AGR-Domain             | The internet domain of the AGR that represents the prosumer connected on this Connection, if applicable.  |
