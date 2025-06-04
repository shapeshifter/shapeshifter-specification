<!--
SPDX-FileCopyrightText: 2020-2023 Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# Plan phase

In [Plan phase](../../general-description/plan-phase.md) the informative description of the plan phase processes are provided.
In this chapter, use cases will be described as derived from the plan phase.

The USEF MCM plan phase specifies the following use cases:

_Use cases for the Plan phase._

| Name                                                                                | Direction | Message types                                         |
|-------------------------------------------------------------------------------------|-----------|-------------------------------------------------------|
| [Retrieve Congestion Points](#retrieve-congestion-points)                           | AGR → CRO | AGRPortfolioQuery / AGRPortfolioQueryResponse         |
| [Retrieve Active Aggregators](#retrieve-active-aggregators)                         | DSO → CRO | DSOPortfolioQuery / DSOPortfolioQueryResponse         |
| [Exchange Flexibility Reservation Update](#exchange-flexibility-reservation-update) | AGR ← DSO | FlexReservationUpdate / FlexReservationUpdateResponse |

The use cases are explained in the following sections.

If operating in open mode, the CRO will accept updates from any USEF-compliant participants implementing the AGR role.
In closed mode, participants will need to be pre-configured in order for updates to be accepted.

## Retrieve Congestion Points

The common reference allows an AGR to determine whether there are any congestion points where prosumers in its portfolio
can offer flexibility.

<figure markdown>
  ![Retrieval of Congestion Points corresponding to AGR's connections](../../diagrams/use-case-3-3-retrieval-of-congestion-points.puml){ .no-lightbox }
  <figcaption>Retrieval of Congestion Points corresponding to AGR's connections</figcaption>
</figure>

<table>
  <tr>
    <th></th>
    <th colspan="2">Publish Congestion Points / DSO Portfolio</th>
  </tr>
  <tr>
    <th>Goal in context</th>
    <td colspan="2">Retrieve a list of all registered Connections represented by this AGR, grouped by Congestion Point, in order to enable flex trading with the responsible DSO.</td>
  </tr>
  <tr>
    <th>Preconditions</th>
    <td colspan="2">The AGR has registered the Connection identifiers for which it represents Prosumers in the Common Reference.</td>
  </tr>
  <tr>
    <th>Successful outcome</th>
    <td colspan="2">The AGR receives a list of Connections, grouped by Connection Point and responsible DSO, and a list of Connections that have not been allocated to a DSO.</td>
  </tr>
  <tr>
    <th rowspan="6">Failure outcome</th>
    <th>RejectionReason</th>
    <th>Cause of rejection</th>
  </tr>
  <tr>
    <td>&lt;See Message validation&gt;</td>
    <td>AGRPortfolioQuery failed to pass validation by the CRO</td>
  </tr>
  <tr>
    <td>Unauthorized</td>
    <td>CRO is operating in closed mode and the AGR is not pre-registered as an authorized participant</td>
  </tr>
  <tr>
    <td>No connections available</td>
    <td>The AGR has no registered connections at the Common Reference</td>
  </tr>
  <tr>
    <td>[User defined]</td>
    <td>Any other reasonable cause to reject the message</td>
  </tr>
</table>

### Related information

AGRs will only obtain DSO identities, congestion point identifiers and connection identifiers for those connections they have registered in the common reference themselves.

Registered connections that have not (yet) been allocated by a DSO are returned in a separate list, to inform the AGR that there is no DSO available to trade with at those connections.

## Retrieve Active Aggregators

If operating in open mode, the CRO will accept queries from any USEF-compliant participants implementing the AGR role.
In closed mode, participants will need to be pre-configured in order for updates to be accepted.

<figure markdown>
  ![Retrieval of registered Connections, grouped by Congestion Point, including corresponding AGR identity](../../diagrams/use-case-3-4-retrieval-of-registered-connections.puml){ .no-lightbox }
  <figcaption>Retrieval of registered Connections, grouped by Congestion Point, including corresponding AGR identity</figcaption>
</figure>

<table>
  <tr>
    <th></th>
    <th colspan="2">Publish Congestion Points / DSO Portfolio</th>
  </tr>
  <tr>
    <th>Goal in context</th>
    <td colspan="2">Retrieve a list of all DSO-registered Congestion Points with, for each such point, a list of AGRs representing Prosumers there, including the number of Connections each AGR represents.</br></br>The DSO then knows from which AGRs D-prognoses can be expected, and which percentage of the total Connections on each Congestion Point is affected by those prognoses.</td>
  </tr>
  <tr>
    <th>Preconditions</th>
    <td colspan="2">The DSO has determined its Congestion Points and published this information, including the associated Connection identifiers in the Common Reference.</br>The AGR has registered the Connection identifiers for which it represents Prosumers in the Common Reference (see UC1027)</td>
  </tr>
  <tr>
    <th>Successful outcome</th>
    <td colspan="2">AGRs which represent Prosumers at any of the Congestion Points registered by the DSO are available to the DSO</td>
  </tr>
  <tr>
    <th rowspan="6">Failure outcome</th>
    <th>RejectionReason</th>
    <th>Cause of rejection</th>
  </tr>
  <tr>
    <td>&lt;See Message validation&gt;</td>
    <td>DSOPortfolioQuery failed to pass validation by the CRO</td>
  </tr>
  <tr>
    <td>Unauthorized</td>
    <td>CRO is operating in closed mode and the AGR is not pre-registered as an authorized participant</td>
  </tr>
  <tr>
    <td>No connections available</td>
    <td>The DSO has no registered connections at the Common Reference</td>
  </tr>
  <tr>
    <td>[User defined]</td>
    <td>Any other reasonable cause to reject the message</td>
  </tr>
</table>

### Related information

DSOs may only obtain AGR identities and combined connection counts for those congestion points they have registered in the common reference themselves.

## Exchange Flexibility Reservation Update

Where bilateral contracts are used, the FlexReservationUpdate message can be used at this stage to set or release reserved flexibility.

<figure markdown>
  ![Exchange of FlexReservationUpdate](../../diagrams/use-case-3-5-exchange-of-flexreservationupdate.puml){ .no-lightbox }
  <figcaption>Exchange of FlexReservationUpdate</figcaption>
</figure>

<table>
  <tr>
    <th></th>
    <th colspan="2">Publish Congestion Points / DSO Portfolio</th>
  </tr>
  <tr>
    <th>Goal in context</th>
    <td colspan="2">For all reserved power in a bilateral contract, the DSO signals which part of the contracted volume is still reserved and which part is not needed and may be used for other purposes.</td>
  </tr>
  <tr>
    <th>Preconditions</th>
    <td colspan="2">The DSO and AGR have agreed on a bilateral contract (out of scope for UFTP) which the FlexReservationUpdate refers to.</td>
  </tr>
  <tr>
    <th>Successful outcome</th>
    <td colspan="2">The AGR has received the update and can potentially reoptimize its portfolio based on the changes. The DSO registers the update for settlement purposes.</td>
  </tr>
  <tr>
    <th rowspan="6">Failure outcome</th>
    <th>RejectionReason</th>
    <th>Cause of rejection</th>
  </tr>
  <tr>
    <td>&lt;See Message validation&gt;</td>
    <td>FlexReservationUpdate failed to pass validation by the AGR</td>
  </tr>
  <tr>
    <td>Deadline expired</td>
    <td>The deadline for the DSO to release reserved flexibility has expired</td>
  </tr>
  <tr>
    <td>Power value rejection</td>
    <td>One or more Power values in the FlexReservationUpdate are not conform agreement</td>
  </tr>
  <tr>
    <td>[User defined]</td>
    <td>Any other reasonable cause to reject the message</td>
  </tr>
</table>
