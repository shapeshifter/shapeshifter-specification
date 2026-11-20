<!--
SPDX-FileCopyrightText: 2020-2023 Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# DSOPortfolioUpdateResponse

Upon receiving and processing a DSOPortfolioUpdate message, the receiving implementation must reply with a DSOPortfolioUpdateResponse, indicating whether the update was handled successfully.

```
<DSOPortfolioUpdateResponse
  Metadata…
  ReferenceMessageID          = UUID
  Result                      = ("Accepted" | "Rejected")
  RejectionReason             = String (only if Result = "Rejected")
/>
```

|                    |                                                                                                                      |
|--------------------|----------------------------------------------------------------------------------------------------------------------|
| Metadata           | The metadata for this message. For details, see [metadata attributes](metadata-attributes.md).                       |
| ReferenceMessageID | MessageID of the DSOPortfolioUpdate message                                                                          |
| Result             | Indication whether the DSOPortfolioUpdate was accepted or rejected.                                                  |
| RejectionReason    | In case the DSOPortfolioUpdate was rejected, this attribute must contain a human-readable description of the reason. |
