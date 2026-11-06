<!--
SPDX-FileCopyrightText: 2020-2023 Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# AGRPortfolioUpdateResponse

Upon receiving and processing an AGRPortfolioUpdate message, the receiving implementation must reply with an AGRPortfolioUpdateResponse, indicating whether the update was handled successfully.

```
<AGRPortfolioUpdateResponse
  Metadata…
  ReferenceMessageID          = UUID
  Result                      = ("Accepted" | "Rejected")
  RejectionReadon             = String (only if Result = "Rejected")
/>
```

|                    |                                                                                                                      |
|--------------------|----------------------------------------------------------------------------------------------------------------------|
| Metadata           | The metadata for this message. For details, see [metadata attributes](metadata-attributes.md).                       |
| ReferenceMessageID | MessageID of the AGRPortfolioUpdate message                                                                          |
| Result             | Indication whether the AGRPortfolioUpdate was accepted or rejected.                                                  |
| RejectionReason    | In case the AGRPortfolioUpdate was rejected, this attribute must contain a human-readable description of the reason. |
