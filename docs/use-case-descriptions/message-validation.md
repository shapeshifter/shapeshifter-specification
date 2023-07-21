<!--
SPDX-FileCopyrightText: 2020-2023 Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# Message validation

Incoming messages need to be validated by the recipient for their correctness.
Validation of the semantics is performed by the HTTP over TLS (explained in [Message transport mechanism](../appendix/message-transport-mechanism.md)), but the content still needs to be checked for possible discrepancies.
If the message passes validation, a response message is sent with ‘accepted’ in the result field.
If it fails validation, a response message is sent with ‘rejected’ in the result field, along with a description of the reason why the message is rejected in the RejectionReason field.
Some causes to reject a message are specific for the type of message and are mentioned in the remainder of this chapter.
Other causes are more generic and are listed in the table below.

This list is not all-encompassing: stakeholders are allowed to formulate other reasonable causes to reject a message, as long as it is clearly explained in the RejectionReason field. Adding the cause of rejection helps the receiving implementation to quickly resolve the issue. 
This field can contain multiple reasons for rejections (separated by a semicolon).


| RejectionReason | Cause of rejection | Applicable to messages |
|---|---|---|
| Unknown SenderDomain | SenderDomain specified in the SignedMessage is unknown to the receiving implementation. | SM |
| Invalid SenderRole | The SenderRole specified in the SignedMessage is invalid. | SM |
| Invalid Sender combination | The combination SenderDomain and SenderRole in the SignedMessage is invalid.| SM |
| Mismatch SenderDomain | SenderDomain specified in the SignedMessage doesn't match with the SenderDomain in the inner XML message. | SM & All other message types |
| Invalid SignedMessage | Despite being schema-compliant, the syntax, type or semantics of the SignedMessage were unacceptable for the receiving implementation. | SM |
| Invalid Message | Despite being schema-compliant, the syntax, type or semantics of the message were unacceptable for the receiving implementation. | All message types |
| Unknown RecipientDomain | The RecipientDomain specified in the inner XML message is not known to the receiving implementation. | All message types |
| Unknown SenderDomain | SignedMessage\SenderDomain doesn't match SignedMessage\Body\SenderDomain. | SM & All other message types |
| Barred Sender | This endpoint is explicitly blocking messages from this sender. | SM |
| Duplicate Identifier | The MessageID attribute of the inner XML message is not unique, and has already been used for a message with different content. This message has been rejected. | All message types except SM |
| Already Submitted | The MessageID attribute of the inner XML message is not unique, but since the message content is the same as that of a previously accepted message, this copy can be considered to be successfully submitted as well. | All message types except SM |
| ISP duration rejected | The message specifies a ISP duration that is not the agreed-upon common value for the market in which it is used. | FRU, DP, FR, FO, FOR, M, FS, FS_R (All message types that contain ISP's)|
| TimeZone rejected | The message specifies a TimeZone that has a different UTC offset than is the agreed-upon common value for the market. | APQ, APQ_R, DPQ, DPQ_R, FRU, DP, FR, FO, FOR, M, FS, FS_R (All message types that contain Period) |
| Invalid CongestionPoint | Unknown CongestionPoint or the recipient is not active at this CongestionPoint. | FRU, DP, FR, FO, FOR, FS |
| Unknown <MessageType\>MessageID reference | The message the MessageID refers to is unknown.</br>For <MessageType\> the referenced MessageType can be filled in; for example FlexRequestMessageID or D-PrognosisMessageID. | APU_R, APQ_R, FRU_R, DP_R, FR_R, FO, FOF_R, FOFR, FOFR_R, FOR, FOR_R, M_R, FS, FS_R |
| Reference Period mismatch | The message the <MessageType\>MessageID refers to contains a different Period. | APQ_R, FO FOFR, FOR, FS, FS_R (MessageTypes that refer to other messages using <MessageType\>MessageID AND contain a Period themselves |
| Reference message expired | The message <MessageType\>MessageID refers to is expired. | APU_R, APQ_R, FRU_R, DP_R, FR_R, FO, FOF_R, FOFR, FOFR_R, FOR, FOR_R, M_R, FS, FS_R |
| Reference message revoked | The message <MessageType\>MessageID refers is revoked. | APU_R, APQ_R, FRU_R, DP_R, FR_R, FO, FOF_R, FOFR, FOFR_R, FOR, FOR_R, M_R, FS, FS_R |
| ISPs out of bounds | One or more ISPs are outside the tolerated boundaries: ISPs do not exist. | FRU, DP, FR, FO, FOR, M, FS, FS_R |
| ISP conflict | One or more ISPs are defined more than once, possibly because of an incorrect duration. | FRU, DP, FR, FO, FOR, M, FS, FS_R |
| Period out of bounds | Period of the message is inappropriate.</br>For example: a FlexRequest with a Period in the past or a settlement item in a FlexSettlement with a Period outside the concerning settlement period. | APQ, APQ_R, DPQ, DPQ_R, FRU, DP, FR, FO, FOR, M, FS, FS_R |
| ExpirationDateTime out of bounds | ExpirationDateTime is in the past or exceeds the ISPs in the message. | FR, FOF |
| [Other reasonable cause] | [Implementation specific rejection reason] | TBD |

Because typing all MessageTypes out fully takes a lot of space, a list of abbreviations for use when communicating about the specification is created:
|   MessageType |   Abbreviation    |
|---|---|
|   SignedMessage |   SM  |
|   TestMessage |   TM  |
|   TestMessageResponse |   TM_R  |
|   AGRPortfolioUpdate |   APU  |
|   AGRPortfolioUpdateResponse |   APU_R  |
|   AGRPortfolioQuery |   APQ  |
|   AGRPortfolioQueryResponse |   APQ_R  |
|   DSOPortfolioUpdate |   DPU  |
|   DSOPortfolioUpdateResponse |   DPU_R  |
|   DSOPortfolioQuery |   DPQ  |
|   DSOPortfolioQueryResponse |   DPQ_R  |
|   FlexReservationUpdate |   FRU  |
|   FlexReservationUpdateResponse |   FRU_R  |
|   D-Prognosis |   DP  |
|   D-PrognosisResponse |   DP_R  |
|   FlexRequest |   FR  |
|   FlexRequestResponse |   FR_R  |
|   FlexOffer |   FOF  |
|   FlexOfferResponse |   FOF_R  |
|   FlexOfferRevocation |   FOFR  |
|   FlexOfferRevocationResponse |   FOFR_R  |
|   FlexOrder |   FOR  |
|   FlexOrderResponse |   FOR_R  |
|   Metering |   M  |
|   MeteringResponse |   M_R  |
|   FlexSettlement |   FS  |
|   FlexSettlementResponse |   FS_R  |










