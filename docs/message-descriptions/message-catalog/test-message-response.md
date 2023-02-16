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
