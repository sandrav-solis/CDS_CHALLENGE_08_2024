//@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'status'
//@Metadata.ignorePropagatedAnnotations: true
//@ObjectModel.usageType:{
//    serviceQuality: #X,
//    sizeCategory: #S,
//    dataClass: #MIXED
//}
define view entity zcds_svss_stat_001
  as select from /dmo/oall_stat_t as status
{
      @UI.textArrangement: #TEXT_ONLY
      @ObjectModel.text.element: [ 'OverallStatus' ]
  key status.overall_status as Status,
      @UI.hidden: true
      status.text           as OverallStatus

}
