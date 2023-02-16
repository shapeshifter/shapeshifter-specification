# Metering

The Metering message is an optional message.
The DSO will specify whether metering messages are required for a given program.
If metering messages are used then the AGR must send metering messages, with one message sent per connection point per day.
The metering messages must all be sent before the settlement can be performed.
It is recommend to send the metering messages daily, once the metering data has been collected for the day.

```
<Metering
  Metadata…
  Period        = Period
  EAN           = EntityAddress
  Currency      = ISO4217Currency (optional field, no longer used)
  <Profile        (1...n)
    ProfileType = MeteringProfileEnum
    Unit        = MeteringUnitType
    <ISP          (1...n)
      Value     = Integer
      Start     = Integer
    />
  />
/>
```

The profile types to use will be agreed between the DSO and AGR and all agreed profile types must be included.
It is recommended to include the Power profile and in a following major version the Power profile will become a mandatory profile.

Note: _The power profile represents the average active power during ISP, considering both import and export energy.
Power=(ImportEnergy-ExportEnergy)*(60/ISP-Length-Minutes).
For example with a 15 minute ISP length we have a multiplier of 4, with a 30 minute ISP length we have a multiplier of 2._


|               |                                                                                                                     |
|---------------|---------------------------------------------------------------------------------------------------------------------|
| Metadata      | The metadata for this message. For details, see section [metadata attributes](metadata-attributes.md)               |
| Period        | The day that the metering data covers                                                                               |
| EAN           | The connection ID which this data refers to                                                                         |
| Profile       | A profile carries a sequence of ISPs with a defined type of metering data                                           |
| ⇥ ProfileType | A value from the ProfileType enum, one of Power, ImportEnergy, ExportEnergy, ImportMeterReading, ExportMeterReading |
| ⇥ Unit        | MeteringUnit type, use kW for Power and kWh for energy profile types.                                               |
| ⇥ ISP         |                                                                                                                     |
| ⇥ ⇥ Start     | Number of the ISP this element refers to. The first ISP of a day has number 1.                                      |
| ⇥ ⇥ Value     | Metering, energy or price value at the end of this ISP, in the designated profile units                             |
