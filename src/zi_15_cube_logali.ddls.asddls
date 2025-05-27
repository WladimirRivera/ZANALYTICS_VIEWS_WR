@AbapCatalog.sqlViewName: 'ZC15CUBE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS - Basic View'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
@Analytics.dataCategory: #CUBE
define view ZI_15_Cube_Logali
  as select from sflight
  association [0..1] to ZI_14_MSHE241 as _Flightconnection on  $projection.Airline          = _Flightconnection.Carrid
                                                           and $projection.Flightconnection = _Flightconnection.Connid
{

  key carrid     as Airline,
  key connid     as Flightconnection,
  key fldate     as FlightDate,
      @Semantics.amount.currencyCode: 'Currency'
      @DefaultAggregation: #MIN
      price      as FlightPrice,
      @Semantics.currencyCode: true
      currency   as currency,
      @DefaultAggregation: #SUM
      seatsmax   as MaxNumberofSeat,
      @DefaultAggregation: #SUM
      seatsocc   as NumberofOcupiedSeats,
      @Semantics.amount.currencyCode: 'currency'
      @DefaultAggregation: #SUM
      paymentsum as totalAmount,
      _Flightconnection

}
