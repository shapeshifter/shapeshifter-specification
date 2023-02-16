# Common concepts

The USEF specification standardizes the logical interfaces and defines the minimum functionality of the components in the form of use cases (this chapter) and message transport specifications and message descriptions (Chapter 4).
This leaves room for innovation and possibilities to develop specific implementation architectures based on e.g. size of the market, specific local circumstances or commercial exploitation of USEF platforms.
Stakeholders involved in a USEF market can and must develop business functions and capabilities independently, and focus on their core business and competitive advantage.

While the USEF specification is technology and implementation agnostic, there are some basic principles to which any USEF implementation architecture must adhere.
Some of these are listed as high-level requirements.
When an ICT implementation architecture is defined, the actual implementation requirements must be defined and included in the design.

- A USEF market implementation will typically consist of multiple information systems interacting together according to the USEF interaction standard in order to run the market processes.
The USEF foundation does not want to narrow down the open nature of the USEF specifications by defining exactly how the information system architecture must be implemented.
- The USEF specifications do not currently define exceptions and how to handle them.
Therefore, the use cases also prescribe only the default main scenario without error handling, and only the successful outcome.
The single exception to this rule is described in the next bullet.
USEF does provide some recommended practices for handling some of the failure handling.
- Any USEF IT architecture must adhere to the USEF privacy & security guideline (see [^B5]).
In the USEF use cases the most relevant privacy & security considerations are provided.

[^B5]: USEF Foundation, "USEF: The Privacy and Security Guideline," USEF Foundation, Arnhem, 2015.
