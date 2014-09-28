unit NonSpisokControl_DataModule;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, ZTypes, DB, FIBDataSet, pFIBDataSet;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    StProcTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    DSourceCategory: TDataSource;
    DSetCategory: TpFIBDataSet;
    DSetTypePost: TpFIBDataSet;
    DSourceTypePost: TDataSource;
    procedure DataModuleDestroy(Sender: TObject);
  public
    PCurrentKodSetup:integer;
    constructor Create(Parameter:TNonSpisokControlParameter);reintroduce;
    property CurrentKodSetup:Integer read PCurrentKodSetup;
  end;

implementation

{$R *.dfm}

constructor TDM.Create(Parameter:TNonSpisokControlParameter);
begin
 inherited Create(Parameter.Owner);
 //******************************************************************************
 DB.Handle := Parameter.Db_Handle;
 DefaultTransaction.StartTransaction;
 DSetCategory.SQLs.SelectSQL.Text := ' SELECT * FROM SP_CATEGORY ';

 DSet.SQLs.SelectSQL.Text := 'Select * from Z_KOD_SETUP_RETURN';
 DSet.Open;
 PCurrentKodSetup:=DSet['KOD_SETUP'];
 DSet.Close;


 case Parameter.ControlFormStyle of
  zcfsInsert:
   begin
      DSet.SQLs.SelectSQL.Text := 'Select * from  Z_DATAPEOPLE_BY_ID_MAN('+
                                  IntToStr(Parameter.Id)+')';
   end;
  zcfsUpdate:
      DSet.SQLs.SelectSQL.Text := 'Select * from  Z_NONSPISOK_S_BY_ID('+
                                  IntToStr(Parameter.Id)+')';
  zcfsShowDetails:
      DSet.SQLs.SelectSQL.Text := 'Select * from  Z_NONSPISOK_S_BY_ID('+
                                  IntToStr(Parameter.Id)+')';
 end;
 if Parameter.ControlFormStyle<>zcfsDelete then
  begin
       DSet.Open;
       DSetCategory.Open;
       //DSetTypePost.Open;
  end;

end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
     if DefaultTransaction.InTransaction then DefaultTransaction.Commit;
end;

end.

