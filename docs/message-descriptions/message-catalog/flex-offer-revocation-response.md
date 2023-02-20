<!--
SPDX-FileCopyrightText: 2020-2023 Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# FlexOfferRevocationResponse

Upon receiving and processing a FlexOfferRevocation message, the receiving implementation must reply with a FlexOfferRevocationResponse, indicating whether the revocation was handled successfully.

```
<FlexOfferRevocationResponse
  Metadata...
  FlexOfferRevocationMessageID = UUID
  Result                       = ("Accepted" | "Rejected")
  RejectionReason              = String (Only if Result = "Rejected")
/>
```

|                              |                                                                                                                                                                                                                                                                                          |
|------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Metadata                     | The metadata for this message. For details, see [metadata attributes](metadata-attributes.md).                                                                                                                                                                                           |
| FlexOfferRevocationMessageID | MessageID  of the FlexOffer that a revocation message was received for.                                                                                                                                                                                                                  |
| Result                       | Indication whether the revocation was accepted or rejected. Rejection is allowed in case the FlexOffer is unknown (it is the responsibility of the sending party not to revoke FlexOffer messages that have not yet been accepted), or the offered flexibility has already been ordered. |
| RejectionReason              | In case the revocation was rejected, this attribute must contain a human-readable description of the reason.                                                                                                                                                                             |
