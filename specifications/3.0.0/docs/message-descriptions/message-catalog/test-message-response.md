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
/>
```

|          |                                                                                                |
|----------|------------------------------------------------------------------------------------------------|
| Metadata | The metadata for this message. For details, see [metadata attributes](metadata-attributes.md). |
