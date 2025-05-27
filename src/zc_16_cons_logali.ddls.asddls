@AbapCatalog.sqlViewName: 'ZC16CO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS - Consumption'
@VDM.viewType: #CONSUMPTION
@Analytics.query: true
@OData.publish: true
define view zc_16_cons_logali
  with parameters
    p_airline : s_carr_id
  as select from ZI_15_Cube_Logali
{
      @AnalyticsDetails.query.axis: #ROWS
  key Airline,
      @AnalyticsDetails.query.axis: #ROWS
  key Flightconnection,
      @AnalyticsDetails.query.axis: #ROWS
  key FlightDate,
      @AnalyticsDetails.query.axis: #COLUMNS
      FlightPrice,
      @AnalyticsDetails.query.axis: #COLUMNS
      currency,
      @AnalyticsDetails.query.axis: #COLUMNS
      MaxNumberofSeat,
      @AnalyticsDetails.query.axis: #COLUMNS
      NumberofOcupiedSeats,
      @AnalyticsDetails.query.axis: #COLUMNS
      @DefaultAggregation: #FORMULA
      @EndUserText.label: 'Availabel Seats'
      MaxNumberofSeat - NumberofOcupiedSeats as NumberOfAvailableSeats,
      @AnalyticsDetails.query.axis: #COLUMNS
      totalAmount
}
where
  Airline = $parameters.p_airline;
