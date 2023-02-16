# Privacy and security by design

USEF – like most complex information systems – deals with sensitive data and therefore requires security and privacy preservation measures.
Privacy & security are system-wide issues; protection of individual subsystems/components is not enough; the system is as strong as the weakest link.
USEF therefore follows the principle of privacy & security by design.

USEF provides a separate privacy and security guideline [^B5] that lists approximately 50 design principles which, combined, present a complete view of the privacy and security aspects associated with smart energy systems.
It takes into account the current legal and social views on privacy & security and links these to the future directions in which they will likely evolve.

[^B5]: USEF Foundation, "USEF: The Privacy and Security Guideline," USEF Foundation, Arnhem, 2015.

The guideline forms the basis for the logical security architecture that is reflected in USEF’s process flows and use cases.
Some remarks about security and responsibility:

- Personal and personally identifiable data represent commercially sensitive information. These include:
    - connection identifiers
    - existence of congestion points
    - details on AGRs associated to a connection
    - portfolio data
    - forecast data, content of D-prognoses and the fact whether or not a given AGR submitted a D-prognosis in a timely fashion
    - the existence, content and timing of a flexibility request and other flexibility trading messages
    - settlement items, including the acknowledgement or disputation of their correctness
- Personal and personally identifiable data (such as forecasts or smart meter readings) should not be retained longer than strictly required. The retention period should be specified and be communicated to the data subject.
- The exact identity of the AGR for each connection should not be disclosed to the DSO. Instead, only aggregate connection counts should be provided (which represent commercially sensitive information).
- It is the responsibility of the CRO to have policies regarding access, data retention, data security and conflict resolution compliant with the USEF privacy & security guidelines.
- The CRO should only disclose the existence of the congestion point on a need-to-know basis, i.e. only to those AGRs which provide an associated connection identifier in their queries.
