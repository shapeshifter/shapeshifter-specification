<!--
SPDX-FileCopyrightText: 2020-2023 Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# Settle phase

## Overall description

In the settle phase, the AGR is remunerated for the delivered flexibility.
There should be a check first, to ensure that the procured flexibility was actually delivered.
A penalty may be applied when there is a mismatch between the baseline and the actual profile.
Except for metering data, USEF assumes that both AGR and DSO have all the information to make these calculations.
The DSO sends its calculation to the AGR for verification.

<figure markdown>
  ![General information flow flex settlement between DSO and AGR](../diagrams/settle-phase.puml){ .no-lightbox }
  <figcaption>General information flow flex settlement between DSO and AGR</figcaption>
</figure>

In order to perform the settlement, it is necessary for the DSO to compare the metering for each ISP against the baseline, as contained in the demand-prognosis message.
In some regions the metering for the ISP periods for the fiscal meter may already be available to the DSO, through its own systems.
However, where the DSO does not have access to the meter data, or where plant metering is used for settlement assessment, the metering data must be communicated to the DSO by the AGR.
For this purpose the AGR will use the Metering messages to send the daily metering per ISP from each connection point.

**Recommended Practice:** It is recommended to the include the Power profile in the settlement messages.

Each month, the DSO will calculate the flexibility settlement volumes and prices for each AGR according to the steps below.

1. **Calculate procured flexibility**</br>
For each congestion point and ISP, both the volumes and prices of the acquired flexibility are collected.
2. **Gather Metering Data**</br>
This is done either based on the DSO’s own metering records or using the metering message
3. **Validate if baselines are met**</br>
This step is only performed where flexibility has been procured from the specific AGR, for a congestion point and ISP.
The deviation between the final forecast (taking into account all procured flexibility) and the realized profile is calculated.
4. **Calculate flex settlement volumes and prices**</br>
The settlement volumes and prices are calculated (see example below).
5. **Send settlement message to AGR**</br>
This shows, per month, the accumulated settlement volume, accumulated deviation from the agreed baselines, and accumulated settlement price (accumulated over the ISPs and the congestion points).

The AGR will use its own information to do the same calculations

1. **Calculate sold flexibility** (equivalent to 1)
2. **Validate if baselines are met** (equivalent to 2)
3. **Plausibility check** (equivalent to 3)</br>
The results are compared to the settlement message received from the DSO.

If the difference in the previous plausibility check is within limits, the AGR sends an acknowledgement to the DSO.
If the difference exceeds predefined limits, the DSO’s calculation is disputed.
This is signaled via the SettlementResponseMessage.
The dispute process is not part of USEF.

## Settlement details

The DSO is responsible for settling the flexibility that it has acquired from the AGR.
Within this settlement, the DSO needs to check whether the acquired flexibility has been delivered according to the agreements.
Penalties can arise where agreements have not been met and this is considered an integral part of the settlement process.

This section describes how the supply of flexibility from the AGR to the DSO is settled.
Several methods are possible, depending on how the flexibility is offered to the DSO and, more precisely, whether the DSO uses the mechanism of long-term and short- term flex options, and whether these flex options are rewarded, even if they are not exercised.
Passive contribution to constraint management may also be rewarded.

Calculations are (in general) performed at ISP level, with settlement calculated over a one-month period.

### Settlement components

The settlement consists of five components:

1. **Settlement of acquired flexibility**</br>
The DSO will acquire flexibility through the market mechanism if congestion is expected, either ahead of time (validate phase) or real-time (operate phase).
On average, the market price is determined by the equilibrium of demanded and offered flexibility (merit order).
Following the recommendation given in Section [Flexibility trading between the AGR and DSO](validate-phase.md#flexibility-trading-between-the-agr-and-dso), pay-as-bid pricing is used for individual settlements.
2. **Settlement of deviations from baselines**</br>
AGRs that have sold flexibility to the DSO need to limit their capacity to the value stated in the baseline, corrected for the sold flexibility.
A penalty is raised for each ISP where the agreed capacity has (on average) been exceeded.
The penalty is single sided, meaning that the AGR is allowed to deviate from its baseline as long as the deviation contributes to avoiding the grid constraint.
3. **[optional] Settlement of long-term flexibility options (bilateral contracts)**</br>
The DSO may acquire long-term flexibility options to ensure that congestion can be avoided at all times.
This may be necessary to justify a decision to delay or defer grid investments, or where grid constraints are expected in the (near) future.
The DSO will determine (e.g. through audits) that the AGR is always capable of providing the contracted flexibility (at contracted times).
4. **[optional] Settlement of short-term flexibility options (FlexOffers which are not procured)**</br>
When grid constraints are expected during the validate phase by the DSO, all AGRs are asked to place flexibility offers.
AGRs whose flexibility bids are accepted by the DSO are expected to meet their (adjusted) baselines.
However, it is just as important for the DSO that the other AGRs are also bound to their baselines.
To enforce and reward this, the DSO may also accept an option on the flexibility offered by the AGR, even if the bid is not accepted, to ensure the AGR will not jeopardize grid constraints by invoking its flexibility for other purposes.
The DSO will pay the AGR for the option, as this will put a constraint on the total capacity of the AGRs portfolio.
5. **[Optional] Settlement of passive contribution to constraint management**</br>
Possible reward for AGRs that passively support the management of grid constraints – either by staying below the agreed value expressed in their baselines or by reducing more power than agreed in the exercised flexibility bid.
This is specifically relevant if constraints have been resolved by passive contributions, where other AGRs have exceeded the agreed capacities.
In this situation, the passive contribution can be rewarded using the raised penalties (zero sum calculations).

The settlement method implicitly assumes that each AGR has the motivation and capacity to produce high quality baselines.

### Settlement calculations

(numbers refer to the settlement components above)

| Nr.   | Amount     | P =                                                                                                                             | Q =                                                                                                                                           | Remark(s)                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
|-------|------------|---------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **1** | P x Q      | P = flexiblity fee                                                                                                              | Q = power called ("Delivered Flex Quantity")                                                                                                  | The flexibility fee is determined by the equilibrium of demanded and offered flexibility (flexibility market).                                                                                                                                                                                                                                                                                                                                                               |
| **2** | P x Q      | P = excess penalty (asymmetrical, only applied when deviation has contributed to congestion)                                    | Q = allocation – initial baseline – Σ FlexOrders ("Power Deficiency Quantity"), where allocation is the average realized power during the ISP | This penalty only applies to AGRs that have sold flexibility (for this ISP), and corresponds with not meeting the agreements of the flexibility bid.                                                                                                                                                                                                                                                                                                                         |
| **3** | negotiated | n.a.                                                                                                                            | n.a.                                                                                                                                          | The DSO will pay compensation for the long-term flexibility contract in proportion to the agreed power, the duration of the time slot, the nomination lead-time and the duration of the contract. Fixed fee may be derived from:<ul><li>The costs for allowing thermal limitations to be violated;</li><li>The avoided costs for grid reinforcements;</li><li>The value of flexibility for alternative uses;</li><li>The costs of alternative flexibility options.</li></ul> |
| **4** | P x Q      | P = flexibility option fee                                                                                                      | Q = power option                                                                                                                              | In this settlement component, an AGR can be rewarded for participating in the flexibility market through short-term products. Rationale for relating the flexibility option settlement to the capacity offered is that an option to cap the capacity of an AGR with twice the capacity of another AGR, has twice the value to the DSO.                                                                                                                                       |
| **5** | P x Q      | P = contribution fee (asymmetrical, only applied when deviation has relieved congestion). Derived from excess penalties raised. | Q = allocation - baselines – power flexibility called during Operate phase where allocation is the average realized power during the ISP.     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |

### Settlement example

For a specific ISP we assume:

- The AGR has specified a total load of 10 MW in its initial baseline
- During one or more flexibility requests, a total of 2 MW of flexibility has been acquired by the DSO, yielding an adjusted baseline of 8 MW
- The table below shows how different realizations are settled. The realization is specified by the allocation, representing the average power during one specific ISP for one congestion point. In this example the following (illustrative) prices are applied:
    - Flex price equals 7 € / MW
    - Baseline deviation penalty equals 11 € / MW (single sided)

| Allocation (MW) | Flex realized (MW) | Delivered flex quantity (MW) | Flex paid (€) | baseline deviation (MW) | Power deficiency quantity (MW) | Penalty raised (€) | Settlement (€) |
|-----------------|--------------------|------------------------------|---------------|-------------------------|--------------------------------|--------------------|----------------|
| 7               | 3                  | 2                            | 14            | -1                      | 0                              | 0                  | 14             |
| 8               | 2                  | 2                            | 14            | 0                       | 0                              | 0                  | 14             |
| 9               | 1                  | 1                            | 7             | 1                       | 1                              | -11                | -4             |
| 10              | 0                  | 0                            | 0             | 2                       | 2                              | -22                | -22            |
| 11              | -1                 | 0                            | 0             | 3                       | 3                              | -33                | -33            |

Elaboration of the calculations performed in the table:

1. _Allocation_ shows possible results of the realization of the AGR portfolio
2. The _flex realized_ equals the baseline associated with the flex offer minus the allocation
3. The delivered _flex quantity_, represents the flexibility that is both acquired (therefore maximum of 2) and delivered.
Passive contributions (as in the row with allocation=7) are not rewarded.
4. The _flex paid_ equals the _delivered flex quantity_ times the flex price
5. The _baseline deviation_ equals the allocation minus the adjusted baseline
6. The _power deficiency quantity_ equals the _baseline deviation_, where negative deviations are set to 0 since these are not penalized.
7. The _penalty raised_ equals the _power deficiency quantity_ times the penalty
8. The settlement price equals the sum of the _flex paid_ and _penalties raised_.
9. The monthly totals of the elements: _delivered flex quantity, power deficiency quantity and Settlement_ are sent to the AGR.
