<!--
SPDX-FileCopyrightText: 2020-2023 Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# MeteringResponse

Upon receiving and processing a Metering message, the receiving implementation must reply with a MeteringResponse, indicating whether the update was handled successfully.

```
<MeteringResponse
  Metadata…
  ReferenceMessageID = UUID
  Result             = ("Accepted" | "Rejected")
  RejectionReason    = String (Only if Result = "Rejected")
/>
```

|                     |                                                                                                            |
|---------------------|------------------------------------------------------------------------------------------------------------|
| Metadata            | The metadata for this message. For details, see section [metadata attributes](metadata-attributes.md).     |
| ReferenceMessageID  | MessageID of the Metering message that has just been accepted or rejected.                                 |
| Result              | Indication whether the order was accepted or rejected.                                                     |
| RejectionReason     | In case the metering was rejected, this attribute must contain a human-readable description of the reason. |
