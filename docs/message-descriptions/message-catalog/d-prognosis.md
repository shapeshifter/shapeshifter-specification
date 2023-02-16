# D-Prognosis

D-Prognosis messages are used to communicate D-prognoses between AGRs and DSOs.
D-Prognosis messages always contain data for all ISPs for the period they apply to, even if a prognosis is sent after the start of the period, when one or more ISPs are already in the operate or settlement phase.
Receiving implementations should ignore the information supplied for those ISPs.

```
<D-Prognosis
  Metadata…
  Period          = Period
  CongestionPoint = EntityAddress
  Revision        = Long
  <ISP              (1...n)
    Power         = Integer
    Start         = Integer
    Duration      = Integer (optional, default = 1)
  />
/>
```

|                 |                                                                                                                                                                                               |
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Metadata        | The metadata for this message. For details, see [metadata attributes](metadata-attributes.md).                                                                                                |
| Period          | The Period this D-Prognosis applies to.                                                                                                                                                       |
| CongestionPoint | Entity Address of the Congestion Point this prognosis applies to. Required for D-prognoses, prohibited for other prognosis types.                                                             |
| Revision        | Revision of this message. A sequence number that must be incremented each time a new revision of a prognosis is sent. The combination of SenderDomain and PrognosisSequence should be unique. |
| ISP             |                                                                                                                                                                                               |
| ⇥ Power         | Power specified for this ISP in Watts. Also see the important notes about the sign of this attribute in the main documentation entry for the Power attribute.                                 |
| ⇥ Start         | Number of the first ISP this element refers to. The first ISP of a day has number 1.                                                                                                          |
| ⇥ Duration      | The number of the ISPs this element represents.                                                                                                                                               |

Note: Every day-ahead D-Prognosis must contain a Power value for every single ISP of the specified Period.
