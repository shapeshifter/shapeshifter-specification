# FlexSettlementResponse

Upon receiving and processing a FlexSettlement message, the AGR must reply with a FlexSettlementResponse, indicating whether the initial message was handled successfully.
When a FlexSettlement message is rejected, the DSO should consider all FlexOrderSettlement elements of that message related to potential dispute.

```
<FlexSettlementResponse
  Metadata…
  FlexSettlementMessageID    = UUID
  Result                     = ("Accepted" | "Rejected")
  RejectionReason            = String (Only if Result = "Rejected")
  <FlexOrderSettlementStatus   (0...n, only if Result = "Accepted")
    OrderReference           = String
    Disposition              = ("Accepted" | "Disputed")
    DisputeReason            = String (Only if Disposition = "Disputed")
  />
  <ContractSettlementStatus    (0...n, only if Result = "Accepted")
    ContractID               = Text
    <Period                    (0...n)
      Period                 = Period
      <ISP                     (0...n)
        Start                = Integer
        Duration             = Integer (optional, default = 1)
        Disposition          = ("Accepted" | "Disputed")
        DisputeReason        = String (Only if Disposition = "Disputed")
      />
    />
  />
/>
```

|                           |                                                                                                                                                                                                                                                                                                                                                                                                                                      |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Metadata                  | The metadata for this message. For details, see section 4.2.2.                                                                                                                                                                                                                                                                                                                                                                       |
| FlexSettlementMessageID   | MessageID of the FlexSettlement that has just been accepted or rejected                                                                                                                                                                                                                                                                                                                                                              |
| Result                    | Indication whether the message was accepted or rejected. Rejection is only allowed in case a FlexSettlement covering a given period was already accepted previously, or contains invalid data. If one or more settlement items included in the message are not in accordance with the AGR’s accounting, the message should still be accepted, and the dispute communicated using the appropriate FlexOrderSettlementStatus elements. |
| RejectionReason           | In case the message was rejected, this attribute must contain a human-readable description of the reason.                                                                                                                                                                                                                                                                                                                            |
| FlexOrderSettlementStatus | Each FlexOrderSettlementStatus element indicates whether the settlement details about a FlexOrder, included in the corresponding FlexOrderSettlement element, are accepted or disputed by the AGR.                                                                                                                                                                                                                                   |
| ⇥ OrderReference          | Order reference assigned by the DSO when originating the FlexOrder.                                                                                                                                                                                                                                                                                                                                                                  |
| ⇥ Disposition             | Indication whether the AGR accepts the order settlement details provided by the DSO (and will invoice accordingly), or disputes these details.                                                                                                                                                                                                                                                                                       |
| ⇥ DisputeReason           | In case the order settlement was disputed, this attribute must contain a human-readable description of the reason.                                                                                                                                                                                                                                                                                                                   |
| ContractSettlementStatus  | Each ContractSettlementStatus element indicates whether the settlement details about a bilateral contract, included in the corresponding ContractSettlement element, are accepted or disputed by the AGR.                                                                                                                                                                                                                            |
| ⇥ ContractID              | Reference to the concerning bilateral contract.                                                                                                                                                                                                                                                                                                                                                                                      |
| ⇥ Period                  | List of all periods from the ContractSettlement, including possible lacking periods                                                                                                                                                                                                                                                                                                                                                  |
| ⇥ ⇥ Period                | Period the settlement status refers to.                                                                                                                                                                                                                                                                                                                                                                                              |
| ⇥ ⇥ ISP                   |                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| ⇥ ⇥ ⇥ Start               | Number of the first ISP this element refers to. The first ISP of a day has number 1.                                                                                                                                                                                                                                                                                                                                                 |
| ⇥ ⇥ ⇥ Duration            | The number of ISPs this element represents. It is recommended to merge consecutive ISPs with the same disposition.                                                                                                                                                                                                                                                                                                                   |
| ⇥ ⇥ ⇥ Disposition         | Indication whether the AGR accepts the settlement details as provided by the DSO from the ISP(s) in question (and will invoice accordingly), or disputes these details.                                                                                                                                                                                                                                                              |
| ⇥ ⇥ ⇥ DisputeReason       | In case the settlement from the ISP(s) was disputed, this attribute must contain a human-readable description of the reason.                                                                                                                                                                                                                                                                                                         |

Handling disputed settlement details is a manual process outside the UFTP scope.
