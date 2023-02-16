# DSOPortfolioQuery

DSOPortfolioQuery is used by DSOs to discover which AGRs represent connections on its registered congestion point(s).

```
<DSOPortfolioQuery
  Metadata…
  EntityAddress = EntityAddress
  Period        = Date
/>
```

|               |                                                                                                |
|---------------|------------------------------------------------------------------------------------------------|
| Metadata      | The metadata for this message. For details, see [metadata attributes](metadata-attributes.md). |
| EntityAddress | Entity Address of the CongestionPoint entity being queried.                                    |
| Period        | The Period being queried.                                                                      |
