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

This list is not all-encompassing: stakeholders are allowed to formulate other reasonable causes to reject a message, as long as it is clearly explained in the RejectionReason field.
This field can contain multiple reasons for rejections (separated by a semicolon).

| RejectionReason                  | Cause of rejection                                                                                                                                                                                                    |
|----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Invalid Sender                   | Despite being schema-compliant, the syntax, type or semantics of the message were unacceptable for the receiving implementation.                                                                                      |
| Invalid Message                  | There is a mismatch between the SenderDomain/Role combination in the message wrapper and the inner XML message.                                                                                                       |
| Unknown Recipient                | The RecipientDomain and/or RecipientRole specified in the inner XML message is not handled by this endpoint.                                                                                                          |
| Barred Sender                    | This endpoint is explicitly blocking messages from this sender.                                                                                                                                                       |
| Duplicate Identifier             | The MessageID attribute of the inner XML message is not unique, and has already been used for a message with different content. This message has been rejected.                                                       |
| Already Submitted                | The MessageID attribute of the inner XML message is not unique, but since the message content is the same as that of a previously accepted message, this copy can be considered to be successfully submitted as well. |
| ISP duration rejected            | The message specifies a ISP duration that is not the agreed-upon common value for the market in which it is used.                                                                                                     |
| Time zone rejected               | The message specifies a time zone that has a different UTC offset than is the agreed- upon common value for the market.                                                                                               |
| Invalid congestion point         | Unknown congestion point or the recipient is not active at this congestion point.                                                                                                                                     |
| Unknown reference <Reference\>  | The message with the sequence where is referred to is unknown.</br>For <Reference\> the concerning reference field name can be filled in (for example FlexRequestSequence or PrognosisSequence).                     |
| Reference Period mismatch        | The message(s) with the sequence where is referred to contains a different Period.                                                                                                                                    |
| Reference message expired        | The message that is referred to is expired.                                                                                                                                                                           |
| Reference message revoked        | The message that is referred to is revoked.                                                                                                                                                                           |
| ISPs out of bounds               | One or more ISPs are outside the tolerated boundaries: ISPs do not exist.                                                                                                                                             |
| ISP conflict                     | One or more ISPs are defined more than once, possibly because of an incorrect duration.                                                                                                                               |
| Period out of bounds             | Period of the message is inappropriate.</br>For example: a FlexRequest with a Period in the past or a settlement item in a FlexSettlement with a Period outside the concerning settlement period.                     |
| ExpirationDateTime out of bounds | ExpirationDateTime is in the past or exceeds the ISPs in the message.                                                                                                                                                 |
