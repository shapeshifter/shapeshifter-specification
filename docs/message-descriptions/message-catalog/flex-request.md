# FlexRequest

FlexRequest messages are used by DSOs to request flexibility from AGRs.
In addition to one or more ISP elements with Disposition=Requested, indicating the actual need to reduce consumption or production, the message should also include the remaining ISPs for the current period where Disposition=Available.

```
<FlexRequest
  Metadata…
  Period             = Period
  ContractID         = String (optional)
  ServiceType        = String (optional)
  CongestionPoint    = EntityAddress
  Revision           = Long
  ExpirationDateTime = DateTime
  <ISP                 (1...n)
    Disposition      = "Available" | "Requested"
    MinPower         = Integer
    MaxPower         = Integer
    Start            = Integer
    Duration         = Integer (optional, default = 1)
  />
/>
```

|                    |                                                                                                                                                                                                                                                                                                                                                                                  |
|--------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Metadata           | The metadata for this message. For details, see [metadata attributes](metadata-attributes.md).                                                                                                                                                                                                                                                                                   |
| Period             | The Period this FlexRequest message applies to.                                                                                                                                                                                                                                                                                                                                  |
| ContractID         | Reference to the concerning contract, if applicable. The contract may be either bilateral or commoditized market contract.                                                                                                                                                                                                                                                       |
| ServiceType        | Service type for this request, the service type determines response characteristics such as latency or asset participation type. Each contract may specify multiple service-types.                                                                                                                                                                                               |
| CongestionPoint    | Entity Address of the Congestion Point this FlexRequest message applies to.                                                                                                                                                                                                                                                                                                      |
| Revision           | Revision of this message, a sequence number that must be incremented each time a new revision of a FlexRequest message is sent.                                                                                                                                                                                                                                                  |
| ExpirationDateTime | Date and time, including the time zone (ISO 8601 formatted as per [http://www.w3.org/TR/NOTE-datetime](http://www.w3.org/TR/NOTE-datetime)) until when the FlexRequest message is valid.                                                                                                                                                                                         |
| ISP                |                                                                                                                                                                                                                                                                                                                                                                                  |
| ⇥ Disposition      | indication whether the Power specified for this ISP represents available capacity or a request for reduction/increase.</br>At least one ISP should have Disposition = Requested                                                                                                                                                                                                  |
| ⇥ MinPower         | Lower bound for available/requested space to deviate from the baseline (in Watts).</br>For further explanation, see section [Flexibility trading between the AGR and DSO](../../general-description/validate-phase.md#flexibility-trading-between-the-agr-and-dso). Also see the important notes about the sign of this attribute in the ISP element, section [power](power.md). |
| ⇥ MaxPower         | Upper bound for available/requested space to deviate from the baseline (in Watts).</br>For further explanation, see section [Flexibility trading between the AGR and DSO](../../general-description/validate-phase.md#flexibility-trading-between-the-agr-and-dso). Also see the important notes about the sign of this attribute in the ISP element, section [power](power.md). |
| ⇥ Start            | Number of the first ISP this element refers to. The first ISP of a day has number 1.                                                                                                                                                                                                                                                                                             |
| ⇥ Duration         | The number of the ISPs this element represents. Optional, default value is 1.                                                                                                                                                                                                                                                                                                    |
