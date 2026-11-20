<!--
SPDX-FileCopyrightText: 2020-2023 Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# FlexOfferRevocation

The FlexOfferRevocation message is used by the AGR to revoke a FlexOffer previously sent to a DSO.
It voids the FlexOffer, even if its validity time has not yet expired.
Revocation is not allowed for FlexOffers that already have associated accepted FlexOrders.

```
<FlexOfferRevocation
  Metadata...
  FlexOfferMessageID = UUID
/>
```

|                    |                                                                                                              |
|--------------------|--------------------------------------------------------------------------------------------------------------|
| Metadata           | The metadata for this message. For details, see [metadata attributes](metadata-attributes.md).               |
| FlexOfferMessageID | MessageID of the FlexOffer message that is being revoked: this FlexOffer must have been accepted previously. |
