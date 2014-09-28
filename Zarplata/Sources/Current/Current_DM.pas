unit Current_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  IBase, Current_Filter, Dialogs, ZProc;

type
  TDM = class(TDataModule)
    DSource1: TDataSource;
    DSet1: TpFIBDataSet;
    DSource3: TDataSource;
    DSet3: TpFIBDataSet;
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    procedure DataModuleDestroy(Sender: TObject);
  private
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE;CurrentFilter:TzCurrentFilter);reintroduce;
  end;

implementation

uses StrUtils;

{$R *.dfm}

constructor TDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE;CurrentFilter:TzCurrentFilter);
begin
 inherited Create(AOwner);
 DB.Handle:=AHandle;
 DefaultTransaction.StartTransaction;
//******************************************************************************
 DSet1.SQLs.SelectSQL.Text := 'SELECT * FROM Z_CURRENT_SELECT_FIO('+
                               IfThen(CurrentFilter.Is_KodSetup,IntToStr(CurrentFilter.Kod_Setup1)+','+
                                                                IntToStr(CurrentFilter.Kod_Setup2),'NULL,NULL')+','+
                               IfThen(CurrentFilter.Is_Man,IntToStr(CurrentFilter.Id_man),'NULL')+','+
                               IfThen(CurrentFilter.Is_Department,IntToStr(CurrentFilter.Id_department),'NULL')+','+
                               IfThen(CurrentFilter.Is_VidOpl,IntToStr(CurrentFilter.Id_VidOpl),'NULL')+','+
                               IfThen(CurrentFilter.Is_Smeta,IntToStr(CurrentFilter.Id_smeta),'NULL')+','+
                               IfThen(CurrentFilter.Is_Prikaz,''''+StringPrepareToQueryText(CurrentFilter.Prikaz)+'''','NULL')+') ORDER BY TN';
 if CurrentFilter.Is_OperationsFilter then
  DSet3.SQLs.SelectSQL.Text := 'select * from Z_CURRENT_SELECT_DATA(?ID_MAN,'+
                                IfThen(CurrentFilter.Is_KodSetup,IntToStr(CurrentFilter.Kod_Setup1)+','+
                                                                 IntToStr(CurrentFilter.Kod_Setup2),'NULL,NULL')+','+
                                IfThen(CurrentFilter.Is_Department,IntToStr(CurrentFilter.Id_department),'NULL')+','+
                                IfThen(CurrentFilter.Is_VidOpl,IntToStr(CurrentFilter.Id_VidOpl),'NULL')+','+
                                IfThen(CurrentFilter.Is_Smeta,IntToStr(CurrentFilter.Id_smeta),'NULL')+','+
                                IfThen(CurrentFilter.Is_Prikaz,''''+StringPrepareToQueryText(CurrentFilter.Prikaz)+'''','NULL')+') ORDER BY KOD_SETUP DESCENDING'
 else
  DSet3.SQLs.SelectSQL.Text := 'select * from Z_CURRENT_SELECT_DATA(?ID_MAN,NULL,NULL,NULL,NULL,NULL,NULL) ORDER BY KOD_SETUP DESCENDING';
 DSet1.Open;
 if not DSet1.IsEmpty then DSet3.Open;
//******************************************************************************
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
 if DefaultTransaction.InTransaction then DefaultTransaction.Commit;
end;

end.
