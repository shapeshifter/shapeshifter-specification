<!--
SPDX-FileCopyrightText: 2020-2025 Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# Optional security measures

When implementing the specification, it is recommended to add additional security measures on top of the described in [message signing mechanism](message-transport-mechanism.md).
This has the main benefit of adding sender verification before actually processing a message, offering better protection against certain attacks, such as DOS style attacks.

## OAuth 2.0

OAuth 2.0 is seen as the default additional measure that should be used when implementing the specification.
On top of being the industry standard, it provides a relatively simple, low-maintenance and flexible way to add endpoint security. 
OAuth 2.0 also suits the flexibility that Shapeshifter aims to support.  

It can be added as an optional component to the system, with each participant deciding for themselves whether it is worthwhile to implement.
You can imagine a system where the DSO has configured an OAuth provider, while a smaller AGR might rely solely on the message signing mechanism, since the DSO is much more likely to be targeted by malicious actors.
This distinction can then be integrated into the Discovery phase, where the DSO can advertise that it requires OAuth 2.0 for communication.

It is recommended to use the `client_credentials` grant type, as it is the most suitable for machine-to-machine communication.
Each party would get an authorized client in the OAuth provider of the parties they are communicating with.

More information about OAuth 2.0 can be found here
* OAuth 2.0 specification: https://oauth.net/2/
* OAuth 2.0 providers: https://oauth.net/code/

### Example system - both parties using OAuth 2.0

A system using ShapeShifter and OAuth 2.0 could look like this.   
![components in a system using oauth](../assets/images/example-implementation-using-oauth-components.svg "Example")

With the following sequence when the DSO sends a FlexRequest to the AGR.  
![example system using oauth](../assets/images/example-implementation-using-oauth-sequence.svg "Example")

### Example system - Only DSO using OAuth 2.0

A system where only the DSO uses OAuth 2.0 could look like this.  
![components in a system using oauth](../assets/images/example-dso-only-implementation-using-oauth-components.svg "Example")

With the following sequence when the DSO sends a FlexRequest to the AGR.  
![example system using oauth](../assets/images/example-dso-only-implementation-using-oauth-sequence.svg "Example")
