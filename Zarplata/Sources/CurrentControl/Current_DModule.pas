unit Current_DModule;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, ZTypes, ZProc, Dialogs, UpKernelUnit;

type
  TDM = class(TDataModule)
    DataBase: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    DSetAllData: TpFIBDataSet;
    DSourceMoving: TDataSource;
    DSetMoving: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    DSourceAllData: TDataSource;
    DSetRmoving: TpFIBDataSet;
    DSourceRmoving: TDataSource;
    procedure DataModuleDestroy(Sender: TObject);
    procedure WriteTransactionAfterStart(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AParameter:TZCurrentParameters);reintroduce;
  end;

implementation

uses Variants;

{$R *.dfm}

constructor TDM.Create(AOwner:TComponent;AParameter:TZCurrentParameters);
begin
 inherited Create(AOwner);
//******************************************************************************
 case AParameter.ControlFormStyle of
  zcfsInsert:     DSetAllData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_CURRENT_SELECTONE('+IntToStr(AParameter.ID)+','+IntToStr(CurrentKodSetup(AParameter.Db_Handle))+')';
  zcfsUpdate:     DSetAllData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_CURRENT_SELECTONE('+IntToStr(AParameter.ID)+',-1)';
  zcfsDelete:     DSetAllData.SQLs.SelectSQL.Text := '';
  zcfsShowDetails:DSetAllData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_CURRENT_SELECTONE('+IntToStr(AParameter.ID)+',-1)';
 end;

//******************************************************************************
 if AParameter.ControlFormStyle<>zcfsDelete then
  begin
   DataBase.Handle:=AParameter.Db_Handle;
   DSetAllData.Open;
  end;
//******************************************************************************
 case AParameter.ControlFormStyle of
  zcfsInsert:
   begin
    DSetRmoving.SQLs.SelectSQL.Text := 'SELECT * FROM Z_GET_RMOVINGS('+IntToStr(AParameter.ID)+',NULL) ORDER BY name_sovmest descending';
    DSetMoving.SQLs.SelectSQL.Text  := 'SELECT * FROM Z_MAN_MOVINGS_BY_R(?RMOVING,NULL) ORDER BY DATE_END descending';
    DSetRmoving.Open;
    DSetMoving.Open;
   end;
  zcfsUpdate,zcfsShowDetails:
   begin
    if VarIsNULL(DSetAllData['KOD_SETUP']) then
    begin
     DSetRmoving.SQLs.SelectSQL.Text := 'SELECT * FROM Z_GET_RMOVINGS('+VarToStrDef(DSetAllData['ID_MAN'],'NULL')+',NULL) ORDER BY name_sovmest descending';
     DSetMoving.SQLs.SelectSQL.Text:='SELECT * FROM Z_MAN_MOVINGS_BY_R(?RMOVING,NULL) ORDER BY DATE_END'
    end
    else
    begin
     DSetRmoving.SQLs.SelectSQL.Text := 'SELECT * FROM Z_GET_RMOVINGS('+VarToStrDef(DSetAllData['ID_MAN'],'NULL')+','+
                                        VarToStr(DSetAllData['KOD_SETUP'])+') ORDER BY name_sovmest descending';

     DSetMoving.SQLs.SelectSQL.Text:='SELECT * FROM Z_MAN_MOVINGS_BY_R(?RMOVING,'+
                                     VarToStr(DSetAllData['KOD_SETUP'])+') ORDER BY DATE_END';
    end;
    DSetRmoving.Open;
    DSetMoving.Open;
   end;
 end;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if DefaultTransaction.InTransaction then DefaultTransaction.Commit;
end;

procedure TDM.WriteTransactionAfterStart(Sender: TObject);
begin
  UpKernelUnit.StartHistory(WriteTransaction,ValueFieldZSetup(DataBase.Handle,'Z_ID_SYSTEM'));
end;

end.
