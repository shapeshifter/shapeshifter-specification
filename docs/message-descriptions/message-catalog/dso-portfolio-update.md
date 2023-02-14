# DSOPortfolioUpdate

The DSOPortfolioUpdate is used by the DSO to indicate on which congestion points it wants to engage in flexibility trading.

```
<DSOPortfolioUpdate
  Metadata…
  <CongestionPoint         (0...n)
    EntityAddress        = EntityAddress
    StartPeriod          = Date
    EndPeriod            = Date (optional)
    MutexOffersSupported = Boolean
    DayAheadRedispatchBy = ("AGR" | "DSO" )
    IntradayRedispatchBy = ("AGR" | "DSO" ) (optional)
    <Connection            (1...n)
      EntityAddress      = EntityAddress
      StartPeriod        = Date
      EndPeriod          = Date (optional)
    />
  />
/>
```

<table>
  <tr>
    <td>Metadata</td>
    <td>The metadata for this message. For details, see section 4.2.2.</td>
  </tr>
  <tr>
    <td>CongestionPoint</td>
    <td></td>
  </tr>
  <tr>
    <td>⇥ EntityAddress</td>
    <td>Entity Address of the CongestionPoint entity being updated.</td>
  </tr>
  <tr>
    <td>⇥ StartPeriod</td>
    <td>The first Period that the DSO is trading on this CongestionPoint.</td>
  </tr>
  <tr>
    <td>⇥ EndPeriod</td>
    <td>The last Period that the DSO is trading on this CongestionPoint.</td>
  </tr>
  <tr>
    <td>⇥ MutexOffersSupported</td>
    <td>Indicates whether the DSO accepts mutual exclusive FlexOffers on this CongestionPoint</td>
  </tr>
  <tr>
    <td>⇥ DayAheadRedispatchBy</td>
    <td>Indicates which party is responsible for day-ahead redispatch, AGR or DSO.</td>
  </tr>
  <tr>
    <td>⇥ IntradayRedispatchBy</td>
    <td>Indicates which party is responsible for intraday ahead redispatch, AGR or DSO. If not specified, there will be no intraday trading on this CongestionPoint.</td>
  </tr>
  <tr>
    <td>⇥ Connection</td>
    <td></td>
  </tr>
  <tr>
    <td>⇥ ⇥ EntityAddress</td>
    <td>Entity Address of a Connection that is part of this CongestionPoint.</td>
  </tr>
  <tr>
    <td>⇥ ⇥ StartPeriod</td>
    <td>The first Period that the Connection is part of this CongestionPoint.</br>Notes:</br>The StartPeriod of a Connection should be greater than or equal to the StartPeriod of the CongestionPoint.</br>The StartPeriod of a Connection should be smaller than or equal to the EndPeriod of the CongestionPoint.</br></br>CRO implementors may choose to explicitly check for this and reject updates that do not comply.</td>
  </tr>
  <tr>
    <td>⇥ ⇥ EndPeriod</td>
    <td>The last Period that the Connection is part of this CongestionPoint.</br></br>Notes:</br>The EndPeriod of a Connection should be null if and only if the EndPeriod of the CongestionPoint is null.</br>The EndPeriod of a Connection should be greater than or equal to the StartPeriod of the CongestionPoint.</br>The EndPeriod of a Connection should be smaller than or equal to the EndPeriod of the CongestionPoint.</br>CRO implementors may choose to explicitly check for this and reject updates that do not comply.</br></td>
</table>
