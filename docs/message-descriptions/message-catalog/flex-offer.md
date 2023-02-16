# FlexOffer

FlexOffer messages are used by AGRs to make DSOs an offer for provision of flexibility.
A FlexOffer message contains a list of ISPs and, for each ISP, the change in consumption or production offered and the price for the total amount of flexibility offered.
FlexOffer messages can be sent once a FlexRequest message has been received but can also be sent unsolicited.
Note that multiple FlexOffer messages may be sent based on a single FlexRequest, e.g. to increase the chance that the DSO will order at least part of its available flexibility.
The AGR must make sure that it can actually provide the flexibility offered across all of its FlexOffers.

```
<FlexOffer
  Metadata…
  Period                = Period
  CongestionPoint       = EntityAddress
  ExpirationDateTime    = DateTime
  FlexRequestMessageID  = UUID (mandatory if and only if solicited)
  ContractID            = Text (only if this offer refers to a bilateral contract)
  D-PrognosisMessageID  = UUID (mandatory if and only if unsolicited)
  BaselineReference     = Text (only if another baseline methodology is used)
  Currency              = ISO4217Currency
  <OfferOption            (1...n)
    OptionReference     = String (only if there are multiple OfferOptions)
    Price               = ISO4217Currency
    MinActivationFactor = Number (optional [0.01-1.00])
    <ISP                  (1...n)
      Power             = Integer
      Start             = Integer
      Duration          = Integer (optional, default = 1)
    />
  />
/>
```


|                       |                                                                                                                                                                                                                                                                                                                                              |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Metadata              | The metadata for this message. For details, see section [metadata attributes](metadata-attributes.md).                                                                                                                                                                                                                                       |
| Period                | The Period the ISPs referenced in this FlexOffer message belong to.                                                                                                                                                                                                                                                                          |
| CongestionPoint       | Entity Address of the Congestion Point this FlexOffer message applies to.                                                                                                                                                                                                                                                                    |
| ExpirationDateTime    | Date and time, including the time zone (ISO 8601 formatted as per [http://www.w3.org/TR/NOTE-datetime](http://www.w3.org/TR/NOTE-datetime)) until when the FlexOffer message is valid.                                                                                                                                                       |
| FlexRequestMessageID  | MessageID of the FlexRequest message this request is based on.                                                                                                                                                                                                                                                                               |
| ContractID            | Reference to the concerning bilateral contract, if applicable.                                                                                                                                                                                                                                                                               |
| D-PrognosisMessageID  | MessageID of the D-Prognosis this request is based on, if it has been agreed that the baseline is based on D-prognoses.                                                                                                                                                                                                                      |
| BaselineReference     | Identification of the baseline prognosis, if another baseline methodology is used than based on D-prognoses.                                                                                                                                                                                                                                 |
| Currency              | ISO 4217 code indicating the currency that applies to the price of the FlexOffer.                                                                                                                                                                                                                                                            |
| OfferOption           | If the DSO does not support mutually exclusive offers it will reject FlexOffers that contain more than one OfferOption.                                                                                                                                                                                                                      |
| ⇥ OptionReference     | The identification of this option                                                                                                                                                                                                                                                                                                            |
| ⇥ Price               | The asking price for the flexibility offered in this option.                                                                                                                                                                                                                                                                                 |
| ⇥ MinActivationFactor | The minimal activation factor for this OfferOption. If this attribute is omitted, a default value of 1.00 must be assumed.</br>An AGR may choose to include MinActivationFactor in FlexOffers even if the  DSO is not interested in partial activation. In that case the DSO will simply use an ActivationFactor of 1.00 in every FlexOrder. |
| ⇥ ISP                 |                                                                                                                                                                                                                                                                                                                                              |
| ⇥ ⇥ Disposition       | Optional, used only for FlexRequest messages: indication whether the Power specified for this ISP represents available capacity or a request for reduction/increase.                                                                                                                                                                         |
| ⇥ ⇥ Power             | Power specified for this ISP in Watts. Also see the important notes about the sign of this attribute in the main documentation entry for the ISP element, section 4.2.1.                                                                                                                                                                     |
| ⇥ ⇥ Start             | Number of the first ISP this element refers to. The first ISP of a day has number 1.                                                                                                                                                                                                                                                         |
| ⇥ ⇥ Duration          | The number of the ISPs this element represents. Optional, default value is 1.                                                                                                                                                                                                                                                                |

<!-- TODO: OfferOption.ISP.Disposition is not part of the XML structure -->
