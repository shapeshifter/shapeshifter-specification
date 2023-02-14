# SignedMessage

The SignedMessage element represents the secure wrapper used to submit USEF XML messages from the local message queue to the message queue of a remote participant.
It contains minimal metadata (which is distinct from the common metadata used for all other messages), allowing the recipient to look up the sender's cryptographic scheme and public keys, and the actual XML message, as transformed (signed/sealed) using that cryptographic scheme.

XML representation summary

```
<SignedMessage
  SenderDomain = InternetDomain
  SenderRole   = ("AGR" | "CRO" | "DSO")
  Body         = base64Binary
/>
```

|              |                                                                                                                                                                                                                                                                                                                                                                            |
|--------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| SenderDomain | The Internet domain of the USEF participant sending this message. Upon receiving a message, the recipient should validate that its value matches the corresponding attribute value specified in the inner XML message, once un-sealed: if not, the message must be rejected as invalid.</br>Domain name matching regular expression ^([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}$ |
| SenderRole   | The USEF role of the participant sending this message: AGR, CRO or DSO. Receive-time validation should take place as described for the SenderDomain attribute above. The USEF specification identifies additional roles such as BRP and MDC. These are however not in scope of UFTP.                                                                                       |
| Body         | The Base-64 encoded inner XML message contained in this wrapper, as transformed (signed/sealed) using the sender's cryptographic scheme. The recipient can determine which scheme applies using a DNS or configuration file lookup, based on the combination of SenderDomain and SenderRole.                                                                               |
