# Message catalog

USEF messages consist of XML, use UTF-8 encoding, and should validate against the USEF schema corresponding to the specification version implemented by a participant.
The current version of this schema, as well as historic production versions are available for download from the [Shapeshifter Github](https://github.com/shapeshifter/shapeshifter-specification).
Message types can be differentiated using the name of their root node.

To allow extensibility as well as forward and backward compatibility of XML messages, the USEF schema allows additional elements in each defined sequence, as long as these elements have an explicit, non-default XML namespace.
