# FlexRequestResponse

Upon receiving and processing a FlexRequest message, the receiving implementation must reply with a FlexRequestResponse, indicating whether the flexibility request was processed successfully.

```
<FlexRequestResponse
  Metadata…
  FlexRequestMessageID = UUID
  Result               = ("Accepted" | "Rejected")
  RejectionReason      = String (Only if Result = "Rejected")
/>
```

|                      |                                                                                                                                                                                                                                                                                                                                                          |
|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Metadata             | The metadata for this message. For details, see section 4.2.2.                                                                                                                                                                                                                                                                                           |
| FlexRequestMessageID | MessageID of the FlexRequest that has been accepted or rejected.                                                                                                                                                                                                                                                                                         |
| Result               | Indication whether the flex request was accepted or rejected. Rejection is allowed in case the FlexRequest is not based on our latest Prognosis, a FlexRequest from the same participant for the indicated period with a higher sequence number was already accepted previously or the FlexRequest does not contain any ISPs with Disposition=Requested. |
| RejectionReason      | In case the request was rejected, this attribute must contain a human-readable description of the reason.                                                                                                                                                                                                                                                |