<!--
SPDX-FileCopyrightText: 2020-2023 Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# Metadata attributes

The Metadata attributes contain metadata that are common for each non-wrapper USEF message.

XML representation summary

```
SenderDomain    = InternetDomain
RecipientDomain = InternetDomain
TimeStamp       = DateTime
MessageID       = UUID
ConversationID  = UUID
ISP-Duration    = Duration
TimeZone        = TimezoneName
Version         = SpecVersion
```

|                 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| SenderDomain    | The Internet domain of the USEF participant sending this message. When receiving a message, its value should match the value specified in the SignedMessage wrapper: otherwise, the message must be rejected as invalid. When replying to this message, this attribute, combined with the SenderRole, is used to look up the USEF endpoint the reply message should be delivered to.                                                                                                                                                                      |
| RecipientDomain | Internet domain of the participant this message is intended for. When sending a message this attribute is used to look up the Shapeshifter endpoint the message should be delivered to.                                                                                                                                                                                                                                                                                                                                        |
| TimeStamp       | Date and time this message was created, including the time zone (ISO 8601 formatted as per [http://www.w3.org/TR/NOTE-datetime](http://www.w3.org/TR/NOTE-datetime)).                                                                                                                                                                                                                                                                                                                                                                                     |
| MessageID       | Unique identifier (UUID/GUID as per IETF RFC 4122) for this message, to be generated when composing each message.                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| ConversationID  | Unique identifier (UUID/GUID as per IETF RFC 4122) used to correlate responses with requests, to be generated when composing the first message in a conversation and subsequently copied from the original message to each reply message.                                                                                                                                                                                                                                                                                                                 |
| ISP-Duration    | ISO 8601 time interval (minutes only, for example PT15M) indicating the duration of the ISPs referenced in this message. Although the ISP length is a market-wide fixed value, making this assumption explicit in relevant messages is important for validation purposes, allowing implementations to reject messages with an errant ISP duration.</br>Only messages that refer to individual ISPs must include this attribute in the metadata.                                                                                                           |
| TimeZone        | Time zone ID (as per the IANA time zone database, [http://www.iana.org/time-zones](http://www.iana.org/time-zones), for example: Europe/Amsterdam) indicating the UTC offset that applies to the Period referenced in this message. Although the time zone is a market-wide fixed value, making this assumption explicit in relevant messages is important for validation purposes, allowing implementations to reject messages with an errant UTC offset.</br>Only messages that refer to a specific Period must include this attribute in the metadata. |
| Version         | Shapeshifter specification version following semantic versioning rules e.g. 3.0.0                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
