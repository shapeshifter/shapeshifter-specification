# FlexOrderResponse

Upon receiving and processing a FlexOrder message, the receiving implementation must reply with a FlexOrderResponse, indicating whether the update was handled successfully.

```
<FlexOrderResponse
  Metadata…
  FlexOrderMessageID = UUID
  Result             = ("Accepted" | "Rejected")
  RejectionReason    = String (Only if Result = "Rejected")
/>
```

|                    |                                                                                                                                                                                                                                 |
|--------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Metadata           | The metadata for this message. For details, see section 4.2.2.                                                                                                                                                                  |
| FlexOrderMessageID | MessageID of the FlexOrder that has just been accepted or rejected.                                                                                                                                                             |
| Result             | Indication whether the order was accepted or rejected. Rejection is only allowed in case the FlexOrder was already accepted previously, cannot be found, or does not exactly match the contents of the corresponding FlexOffer. |
| RejectionReason    | In case the order was rejected, this attribute must contain a human-readable description of the reason.                                                                                                                         |
