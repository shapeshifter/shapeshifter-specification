# AGRPortfolioUpdate

The AGRPortfolioUpdate is used by the AGR to indicate on which Connections it represents prosumers.

```
<AGRPortfolioUpdate
  Metadata…
  <Connection       (0...n)
    EntityAddress = EntityAddress
    StartPeriod   = Date
    EndPeriod     = Date (optional)
  />
/>
```

|                 |                                                                                                |
|-----------------|------------------------------------------------------------------------------------------------|
| Metadata        | The metadata for this message. For details, see [metadata attributes](metadata-attributes.md). |
| Connection      |                                                                                                |
| ⇥ EntityAddress | EntityAddress of the Connection entity being updated.                                          |
| ⇥ StartPeriod   | The first Period hat the AGR represents the prosumer at this Connection.                       |
| ⇥ EndPeriod     | The last Period that the AGR represents the prosumer at this Connection, if applicable.        |
