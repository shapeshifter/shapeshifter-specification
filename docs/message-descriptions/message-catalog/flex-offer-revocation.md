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
| Metadata           | The metadata for this message. For details,  see section 4.2.2.                                              |
| FlexOfferMessageID | MessageID of the FlexOffer message that is being revoked: this FlexOffer must have been accepted previously. |