@AbapCatalog.sqlViewName: 'ZC14BASIC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS - Basic View'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #BASIC
@Analytics.dataCategory: #DIMENSION
define view ZI_14_BASIC_LOGALI
  as select from spfli as Flight
{
  key carrid    as Carrid,
  key connid    as Connid,
      countryfr as Countryfr,
      cityfrom  as Cityfrom,
      airpfrom  as Airpfrom,
      countryto as Countryto,
      cityto    as Cityto,
      airpto    as Airpto,
      fltime    as Fltime,
      deptime   as Deptime,
      arrtime   as Arrtime,
      distance  as Distance,
      distid    as Distid,
      fltype    as Fltype,
      period    as Period
}
