# Scope

This chapter provides details of the functions that contain interactions relevant to the DSO and AGR, in order to be active in the USEF MCM.
To be USEF compliant, these functions must be implemented according to the use case descriptions in this chapter.

The use cases have been derived from the MCM sequence diagrams detailed in Chapter [General description](../general-description/index.md).
Use cases are separate activities that require interaction between DSO and AGR, each containing multiple messages in both directions.
DSO and AGR internal processes are not addressed in this chapter.

The messages types that occur in these use cases are mentioned and further described in Section [Message catalog](../message-descriptions/message-catalog/index.md).

## Introduction

The core of the USEF specification is the MCM and the processes governing it.
These define how the different stakeholders active in the MCM should behave and interact.
All use cases related to these functions are described to the extent relevant for the USEF specifications.
All aspects not specified by USEF are explicitly mentioned.
An example of this is that USEF does not specify how an AGR optimizes its portfolio or determines how much flexibility is available, where or when.
The result of this portfolio optimization is, however, a prerequisite for participating in the flexibility bidding process.

For the flexibility market to function, it is essential to have a functioning common reference populated with all AGR-represented connections.

Given the open nature of the USEF specifications, any implementation can choose to adopt all or only part of the specifications.
In any situation, all participants within a single USEF market will have to adopt a common specification of the market processes and information exchange.
