# FlexReservationUpdateResponse

Upon receiving and processing a FlexReservationUpdate message, the AGR must reply with a FlexReservationUpdateResponse, indicating whether the FlexReservationUpdate was processed successfully.

```
<FlexReservationUpdateResponse
  Metadata…
  FlexReservationUpdateMessageID = UUID
  Result                         = ("Accepted" | "Rejected")
  RejectionReason                = String (only if Result = "Rejected")
/>
```

|                                |                                                                                                                                                                                                                                           |
|--------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Metadata                       | The metadata for this message. For details, see section [metadata attributes](metadata-attributes.md).                                                                                                                                    |
| FlexReservationUpdateMessageID | MessageID  of the concerning FlexReservationUpdate message                                                                                                                                                                                |
| Result                         | Indication whether the FlexReservationUpdate was accepted or rejected. Rejection is allowed in case the FlexReservationUpdate does not match the bilateral contract or its agreements or the deadline for sending the update has expired. |
| RejectionReason                | In case the request was rejected, this attribute must contain a human-readable description of the reason.                                                                                                                                 |
