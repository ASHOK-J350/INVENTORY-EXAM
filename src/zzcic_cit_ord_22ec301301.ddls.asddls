@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZZCICIT_ORD_22EC301301'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZZCIC_CIT_ORD_22EC301301
  provider contract TRANSACTIONAL_QUERY
  as projection on ZZCIR_CIT_ORD_22EC301301
  association [1..1] to ZZCIR_CIT_ORD_22EC301301 as _BaseEntity on $projection.ORDERID = _BaseEntity.ORDERID
{
  key OrderID,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Lastchangedby: true
  }
  LastChangedBy,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  Status,
  Description,
  _BaseEntity
}
