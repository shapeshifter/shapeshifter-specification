<!--
SPDX-FileCopyrightText: 2020-2023 Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# Plan phase

USEF’s plan phase aims to find an economically optimized program to supply the energy demand of both AGR and BRP portfolios for a certain period.
In this phase, the AGR optimizes its portfolio and typically arbitrages between different flexibility markets to maximize the value of the available flexibility.
The result of this process is a balanced portfolio.
The exchange between AGR and BRP’s and corresponding trades on the energy markets are out-of-scope for UFTP.
The result, however, will lead to a D-prognosis in the validate phase.

The processes that take place during the plan phase are schematically depicted in the following figure.

<figure markdown>
  ![General information flow in the Plan phase](../diagrams/plan-phase.puml)
  <figcaption>General information flow in the Plan phase</figcaption>
</figure>

Since the list of connections belonging to a congestion point, and the list of customers that are served by the AGR, may switch from day to day, USEF specifies that this information is requested on a day-to-day basis.

The AGRs portfolio optimization is out-of-scope and depicted only for reference.
See [^3] for a detailed description of this process.
For UFTP, it is important to realize that the AGR optimizes its portfolio based on its clients’ needs, optionally taking into account its long-term contractual obligations.

For bilateral contracts, the DSO might provide a FlexReservationUpdate message e.g. signaling which part of the contracted volume is still reserved and which part is not needed and may be used for other purposes.
This will typically re-trigger the AGRs portfolio optimization process. More information about the flex reservation mechanism is added in [Rationale for information exchange in flexibility request](../appendix/rationale-for-information-exchange-in-flexibility-request.md).

[^3]: USEF, "USEF - The FrameWork Specifications 2015," 2015. [Online].
