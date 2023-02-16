# Operate phase

In [Operate phase](../../general-description/operate-phase.md) the informative description of the operate phase processes are provided.
In this chapter, the use cases will be described as derived from the operate phase.

The USEF MCM operate phase specifies the following use cases:

_Use cases for the operate phase._

| Name                             | Direction | Message types                                     |
|----------------------------------|-----------|---------------------------------------------------|
| **Exchange updated D-Prognoses** | AGR → DSO | Prognosis / PrognosisResponse                     |
| **Revocation Flexibility Offer** | AGR → DSO | FlexOfferRevocation / FlexOfferRevocationResponse |
| **Exchange Flexibility Orders**  | AGR ← DSO | FlexOrder / FlexOrderResponse                     |

The use cases are explained in the following sections.

## Exchange updated D-Prognoses

The process diagram is similar to the figure in [Exchange D-Prognoses per Congestion Point](validate-phase.md#exchange-d-prognoses-per-congestion-point).

<table>
  <tr>
    <th></th>
    <th colspan="2">D-prognosis</th>
  </tr>
  <tr>
    <th>Goal in context</th>
    <td colspan="2">Changes in D-prognoses to be realized are transmitted.</td>
  </tr>
  <tr>
    <th>Preconditions</th>
    <td colspan="2">AGR has created initial D-prognoses in the Plan/Validate phases, and has subsequently detected deviations in Operate that resulted in a portfolio state that requires those prognoses to be re-created.</td>
  </tr>
  <tr>
    <th>Successful outcome</th>
    <td colspan="2">Prognosis sent to DSO that reflects all relevant changes</td>
  </tr>
  <tr>
    <th rowspan="6">Failure outcome</th>
    <th>RejectionReason</th>
    <th>Cause of rejection</th>
  </tr>
  <tr>
    <td>&lt;See action 3.5&gt;</td>
    <td>D-prognosis failed to pass validation by the DSO</td>
  </tr>
  <tr>
    <td>Lacking ISPs</td>
    <td>The prognosis does not include all ISPs in the Period it applies to</td>
  </tr>
  <tr>
    <td>Power value rejection</td>
    <td>One or more Power values in the prognosis are not plausible</td>
  </tr>
  <tr>
    <td>Subordinate sequence number</td>
    <td>The message sequence is lower than that of a previously received D-prognosis</td>
  </tr>
  <tr>
    <td>[User defined]</td>
    <td>Any other reasonable cause to reject the message</td>
  </tr>
</table>

### Related information

The process is similar to that described in [Exchange D-Prognoses per Congestion Point](validate-phase.md#exchange-d-prognoses-per-congestion-point).
Deviations can be caused by new flexibility orders from the DSO and by unforeseen change of behavior by assets.

The basic process for re-creating D-prognoses is the same as that used to create them in the first place, in the plan/validate phases.
When re-creating prognoses in the operate phase, values for ISPs that are already in the past should remain unchanged, as these will be ignored by DSOs anyway.

## Revocation Flexibility Offer

The process diagram is similar to the figure in [Revocation of FlexOffer](validate-phase.md#revocation-flexibility-offer).

<table>
  <tr>
    <th></th>
    <th colspan="2">Revoke FlexOffer</th>
  </tr>
  <tr>
    <th>Goal in context</th>
    <td colspan="2">Inform the DSO that a previously sent flexibility offer is no longer valid, despite the validity period of the offer not having expired yet.</td>
  </tr>
  <tr>
    <th>Preconditions</th>
    <td colspan="2">A flexibility offer has been sent to and acknowledged by the DSO</td>
  </tr>
  <tr>
    <th>Successful outcome</th>
    <td colspan="2">Flexibility offer revocation notification submitted to the DSO</td>
  </tr>
  <tr>
    <th rowspan="6">Failure outcome</th>
    <th>RejectionReason</th>
    <th>Cause of rejection</th>
  </tr>
  <tr>
    <td>&lt;See action 3.5&gt;</td>
    <td>FlexOfferRevocation failed to pass validation by the DSO</td>
  </tr>
  <tr>
    <td>Flexibility procured</td>
    <td>The FlexOffer cannot be revoked because its flexibility has already been ordered</td>
  </tr>
  <tr>
    <td>[User defined]</td>
    <td>Any other reasonable cause to reject the message</td>
  </tr>
</table>

### Related information

The process is similar to that described in [Revocation Flexibility Offer](validate-phase.md#revocation-flexibility-offer).

Flexibility offers may be revoked in the operate phase provided that none of the ISPs in the period the offer applies to are
already in, or past, the operate phase.

## Exchange Flexibility Orders

This process is triggered when flexibility is required to resolve congestion detected during the operate phase.
This might, for example, be the case when the prognoses change after the validate phase and there are still FlexOffers available.

The process diagram is similar to the figure in [Exchange Flexibility Orders](validate-phase.md#exchange-flexibility-orders).

<table>
  <tr>
    <th></th>
    <th colspan="2">Revoke FlexOrder</th>
  </tr>
  <tr>
    <th>Goal in context</th>
    <td colspan="2">Accept (some) flexibility offers to solve congestion during Operate phase.</td>
  </tr>
  <tr>
    <th>Preconditions</th>
    <td colspan="2">Congestion detected while monitoring the grid, corresponding FlexOffer has been received and accepted by DSO and is still valid.</td>
  </tr>
  <tr>
    <th>Successful outcome</th>
    <td colspan="2">Flexibility procured</td>
  </tr>
  <tr>
    <th rowspan="6">Failure outcome</th>
    <th>RejectionReason</th>
    <th>Cause of rejection</th>
  </tr>
  <tr>
    <td>&lt;See action 3.5&gt;</td>
    <td>FlexOrder failed to pass validation by the AGR</td>
  </tr>
  <tr>
    <td>ISP mismatch</td>
    <td>ISPs from the FlexOrder do not match the ISPs given in the FlexOffer</td>
  </tr>
  <tr>
    <td>Power mismatch</td>
    <td>Ordered flexibility does not match the offered flexibility</td>
  </tr>
  <tr>
    <td>Price mismatch</td>
    <td>Price in the order does not match the price given in the offer</td>
  </tr>
  <tr>
    <td>[User defined]</td>
    <td>Any other reasonable cause to reject the message</td>
  </tr>
</table>

### Related information

The process is similar to that described in [Exchange Flexibility Orders](validate-phase.md#exchange-flexibility-orders).
Note that where a FlexOrder is rejected, manual processing is unlikely to result in timely resolution at this stage.
Note that although the updated D-prognosis is unlikely to be of immediate use to the DSO, it’s definitely required for settlement.
