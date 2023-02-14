# DSOPortfolioUpdateResponse

Upon receiving and processing a DSOPortfolioUpdate message, the receiving implementation must reply with a DSOPortfolioUpdateResponse, indicating whether the update was handled successfully.

```
< DSOPortfolioUpdateResponse
  Metadata…
  DSOPortfolioUpdateMessageID = UUID
  Result                      = ("Accepted" | "Rejected")
  RejectionReason             = String (only if Result = "Rejected")
/>
```

|                             |                                                                                                                      |
|-----------------------------|----------------------------------------------------------------------------------------------------------------------|
| Metadata                    | The metadata for this message. For details, see section 4.2.2.                                                       |
| DSOPortfolioUpdateMessageID | MessageID of the DSOPortfolioUpdate message                                                                          |
| Result                      | Indication whether the DSOPortfolioUpdate was accepted or rejected.                                                  |
| RejectionReason             | In case the DSOPortfolioUpdate was rejected, this attribute must contain a human-readable description of the reason. |
