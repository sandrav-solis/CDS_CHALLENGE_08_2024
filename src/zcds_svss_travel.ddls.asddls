@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Travel'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
//@AbapCatalog.viewEnhancementCategory: 
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_SVSS_TRAVEL
  as select from zsvss_travel
  association [0..*] to /DMO/I_Overall_Status_VH_Text as _status on _status.OverallStatus = $projection.Status
{
  key travel_id                                                       as TravelId,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      total_price                                                     as TotalPrice,
      currency_code                                                   as CurrencyCode,
      concat( cast( total_price as abap.char( 25 ) ), currency_code ) as TotalProceCurr,
      description                                                     as Description,
      @ObjectModel.text.element: [ 'OverallStatus' ]
      @Consumption.valueHelpDefinition: [{ entity: {name: 'ZCDS_SVSS_STAT_001', element: 'Status'  } } ]
      status                                               as Status,
//      @Consumption.valueHelpDefinition: [{ entity: {name: 'ZCDS_SVSS_STAT_001', element: 'Status'  } } ]
      _status.Text                                         as OverallStatus,
      _status
}
