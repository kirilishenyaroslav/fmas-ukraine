unit TiCommonTypes;

interface

uses iBase;

type TUser = record
 Id:integer;
 Name:string;
 Id_Card:integer;
 Fio:string;
 DB_Handle:TISC_DB_HANDLE;
 DbPath:string;
end;

type TReestrParam = record
 Id_reestr        : integer;
 Num_Reestr       : integer;
 Kod_setup_Reestr : string;
 DATABEG_REESTR   : TDateTime;
 DATAEND_REESTR   : TDateTime;
end;

type TTITaxInvoicesInfo = record
  is_insert             : Boolean;
  id_TaxLiabilities     : Integer;
  Name_TaxLiabilities   : string;
  Id_TaxKredit          : Integer;
  Name_TaxKredit        : string;
  data_Vipiski          : TDateTime;
  Num_Nakl              : string;
  id_SpecialNotes       : Integer;
  Name_SpecialNotes     : string;
  Num_SpecialNotes      : string;
  id_seller             : Integer;
  ipn_seller            : string;
  Name_seller           : string;
  Place_seller          : string;
  Phone_seller          : string;
  NumReestr_seller      : string;
  id_customer           : Integer;
  Name_customer         : string;
  Full_name_customer     : string;
  ipn_customer          : string;
  place_customer        : string;
  phone_customer        : string;
  NumReestr_customer    : string;
  EDRPOU_Customer       : string;
  id_TermsDelivery      : Integer;
  Name_TermsDelivery    : string;
  data_termsdelivery    : TDateTime;
  num_termsdelivery     : string;
  id_FormCalculations   : Integer;
  Name_FormCalculations : string;
  id_vid_nakl_doc       : Integer;
  ID_TYPE_DOCUMENT      : Integer;
  NAME_TYPE_DOCUMENT    : string;
  IS_ISSUED_BUYER           : Integer;
  IS_ERPN                   : Integer;
  IS_REMAINS_SELLER         : Integer;
  IS_COPY                   : Integer;
  is_issued_buyer_two_ekz   : Integer;
  is_erpn_two_ekz           : Integer;
  is_remains_seller_two_ekz : Integer;
  is_copy_two_ekz           : Integer;
  id_SpecialNotes_two_ekz   : Integer;
  Name_SpecialNotes_two_ekz : string;
  Num_SpecialNotes_two_ekz  : string;
  id_note : Integer;
  article_note : string;
  short_name_note : string;
  long_name_note : string;
end;

type TTiFormStyle = (tifsModal, tifsNormal, tifsChild, tifsModalParent);

type TTiControlFormStyle = (ticfsInsert, ticfsUpdate, ticfsDelete, ticfsShowDetails, ticfsInsertWizard);

implementation

end.
