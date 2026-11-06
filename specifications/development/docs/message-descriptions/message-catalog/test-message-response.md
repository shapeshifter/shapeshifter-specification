<!--
SPDX-FileCopyrightText: 2020-2023 Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# TestMessageResponse

Upon receiving a TestMessage, the receiving implementation must reply with a TestMessageResponse.
Like the TestMessage itself, the TestMessageResponse does not have any content (other than the mandatory metadata).

```
<TestMessageResponse
  Metadata...
  ReferenceMessageID = UUID
  Result             = ("Accepted" | "Rejected")
  RejectionReason    = String (Only if Result = "Rejected")
/>
```

|                    |                                                                                                               |
|--------------------|---------------------------------------------------------------------------------------------------------------|
| Metadata           | The metadata for this message. For details, see [metadata attributes](metadata-attributes.md).                |
| ReferenceMessageID | MessageID of the TestMessage message that has just been accepted or rejected.                                 |
| Result             | Indication whether the TestMessage was accepted or rejected.                                                  |
| RejectionReason    | In case the TestMessage was rejected, this attribute must contain a human-readable description of the reason. |
