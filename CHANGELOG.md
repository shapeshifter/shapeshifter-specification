<!--
SPDX-FileCopyrightText: 2020-2023 Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Latest]

### Added
* `ReferenceMessageID` attribute in `PayloadMessageResponseType` to replace the specific `*MessageID` attributes in each specific response type. This will simplify handling of response messages.

### Changed
* `FlexOrder` can be sent directly without a `FlexOfferMessageID`.

### Removed
* Specific `*MessageID` attributes in each response type. These have been replaced by the generic `ReferenceMessageID` attribute in the `PayloadMessageResponseType`.

## [3.0.0] - 2022-06-01

Imported project from USEF UFTP.

### Added

Metering Messages - To support submission of metering data from the AGR to the DSO.
Version tag in PayloadMessageType - So that the version number is specified in every message and the DSO can support multiple versions at the same time
Service type in FlexRequest message - so that the aggregate knows which service is being requested
Order Reference in FlexOrderSettlement - so that the aggregate knows which order the settlement is for

### Changed
Improve the description of FlexRequestMessageID and D-PrognosisMessageID fields

### Removed
Reference from FlexSettlement and FlexSettlementResponse - These fields supplied the same functionality as the FlexSettlementMessageID field. Now please use the FlexSettlementMessageID field in the FlexSettlementResponse

## [2.0.0]

Project was called USEF (Universal Smart Energy Framework) UFTP (USEF Flexibility Trading Protocol)