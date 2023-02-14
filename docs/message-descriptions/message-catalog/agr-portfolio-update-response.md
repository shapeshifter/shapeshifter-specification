# AGRPortfolioUpdateResponse

Upon receiving and processing an AGRPortfolioUpdate message, the receiving implementation must reply with an AGRPortfolioUpdateResponse, indicating whether the update was handled successfully.

```
<AGRPortfolioUpdateResponse
  Metadata…
  AGRPortfolioUpdateMessageID = UUID
  Result                      = ("Accepted" | "Rejected")
  RejectionReadon             = String (only if Result = "Rejected")
/>
```

|                             |                                                                                                                      |
|-----------------------------|----------------------------------------------------------------------------------------------------------------------|
| Metadata                    | The metadata for this message. For details, see section 4.2.2.                                                       |
| AGRPortfolioUpdateMessageID | MessageID of the AGRPortfolioUpdate message                                                                          |
| Result                      | Indication whether the AGRPortfolioUpdate was accepted or rejected.                                                  |
| RejectionReason             | In case the AGRPortfolioUpdate was rejected, this attribute must contain a human-readable description of the reason. |
