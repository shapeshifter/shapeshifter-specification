# Levels of compliancy

UFTP has mandatory components and optional components.
The tables below list all core and optional components.
Support of core components is mandatory for all implementations.
Optional components are signaled throughout the document.
Optional components in messages are always prefixed with [optional].


| Core UFTP components                 | USEF 2015 | UFTP   | Signaled in CRO? |
| ------------------------------------ | :-------: | :----: | :--------------: |
| **UFTP process:**                    |           |        |                  |
| Day-ahead Flex trading               | o         | o      | -                |
| Redispatch responsibility choice     | -         | o      | Y                |
| Baseline choice                      | -         | o      | Y                |
| **Market messages:**                 |           |        |                  |
| FlexRequest                          | o         | o      | -                |
| FlexOffer                            | o         | o      | -                |
| FlexOfferRevocation                  | o         | o      | -                |
| FlexOrder                            | o         | o      | -                |
| FlexSettlement                       | o         | o      | -                |

| Optional UFTP components             | USEF 2015 | UFTP   | Signaled in CRO? |
| ------------------------------------ | :-------: | :----: | :--------------: |
| **UFTP Process:**                    |           |        |                  |
| Intraday Flex Trading                | o         | o      | N                |
| Availability contracts (FlexOptions) | ~1        | o      | N                |
| Dynamic pooling                      | -         | future | ?                |
| **Market messages:**                 |           |        |                  |
| D-prognosis                          | o         | o      | Y                |
| FlexReservationUpdate                | -         | o      | N                |
| FlexOffer: mutual exclusive offers   | -         | o      | Y                |
| FlexOffer: unsolicited offers        | -         | o      | -                |
| FlexOffer: partial activation        | -         | o      | -                |
