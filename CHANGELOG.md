# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.0.0]

Project was called USEF (Universal Smart Energy Framework) UFTP (USEF Flexibility Trading Protocol)

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

## [3.1.0] - 2024-11-05

### Added
* Added attribute(s) in `FlexRequestType`
    * `Unit`: so that the aggregate knows which in with unit of power the message sent
* Added attribute(s) in `FlexReservationUpdateType`
    * `Service Type`: so that the aggregate knows which service is being requested
    * `Unit`: so that the aggregate knows which in with unit of power the message sent
* Added attribute(s) in `FlexReservationUpdateISPType`
    * `Disposition`: ? so that the aggrate knows whether the Power specified for this ISP represents available capacity or a request for reduction/increase.
* Added attribute(s) in `FlexOfferType`
    * `Service Type`: so that the DSO knows which service is being requested
    * `Unit`: so that the DSO knows in which unit of power the message sent
* Added attribute(s) in `FlexOrderType`
    * `Service Type`: so that the aggregate knows which service is being requested
    * `Unit`: so that the aggregate knows in which unit of power the message sent
* Added attribute(s) in `PrognosisType`
    * `Unit`: so that the DSO knows which in which unit of power the message sent
* Added attribute(s) in `FlexSettlementType`
    * `Unit`: so that the aggregate knows in which unit of power the message sent