# FlexOfferResponse

Upon receiving and processing a FlexOffer message, the receiving implementation must reply with a FlexOfferResponse, indicating whether the flexibility offer was processed successfully.

```
<FlexOfferResponse
  Metadata…
  FlexOfferMessageID = UUID
  Result             = ("Accepted" | "Rejected")
  RejectionReason    = String (Only if Result = "Rejected")
/>
```

|                    |                                                                                                                                                                                                                                                          |
|--------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Metadata           | The metadata for this message. For details, see [metadata attributes](metadata-attributes.md).                                                                                                                                                           |
| FlexOfferMessageID | MessageID of the FlexOffer that has been accepted or rejected.                                                                                                                                                                                           |
| Result             | Indication whether the flex offer was accepted or rejected. Rejection is allowed in case no matching FlexRequest can be found, or the FlexOffer does not contain a valid price for each ISP with Disposition=Requested in the corresponding FlexRequest. |
| RejectionReason    | In case the offer was rejected, this attribute must contain a human-readable description of the reason.                                                                                                                                                  |
