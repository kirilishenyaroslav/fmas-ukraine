{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Пакет "Справочник ВУЗов"                             }
{                 Модуль данных                                                }
{                                               ответственный: Тимофеев Антон  }
unit U_SPEducOrgDM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, pFIBStoredProc, SpCommon;

type
  TDM_SPEducOrg = class(TDataModule)
    FIBSpEducOrgDatabase: TpFIBDatabase;
    FIBSpEducOrgRT: TpFIBTransaction;
    FIBSpEducOrgWT: TpFIBTransaction;
    FIBDS_SelectOrg: TpFIBDataSet;
    FIBQuery: TpFIBQuery;
    FIBDS_SelectOrgID_ORG: TFIBIntegerField;
    FIBDS_SelectOrgNAME_FULL: TFIBStringField;
    FIBDS_SelectOrgNAME_SHORT: TFIBStringField;
    FIBDS_SelectOrgID_ADRESS: TFIBIntegerField;
    FIBDS_SelectOrgAKREDITATION: TFIBIntegerField;
    FIBDS_SelectOrgIS_LEARNING: TFIBIntegerField;
    FIBDS_SelectOrgIS_KVALIF: TFIBIntegerField;
    FIBDS_SelectOrgID_TYPE: TFIBIntegerField;
    FIBDS_SelectOrgtype_name: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_SPEducOrg: TDM_SPEducOrg;

implementation

{$R *.dfm}

end.
