unit cn_fr_ModeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, DM_Mode,
  cn_Common_Types, cn_Common_Funcs, cnConsts, cxRadioGroup, cxControls,
  cxGroupBox, ExtCtrls, PrintLoader, cn_Common_Loader;

type
  TfrmChooseReport = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    CalcRadioButton: TcxRadioButton;
    PayRadioButton: TcxRadioButton;
    Image1: TImage;
    Sch_Button: TcxRadioButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OkButtonClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM:TDM_Choose;
    ID_DOG: int64;
    ID_STUD: int64;
    ID_DOG_ROOT: int64;
    NUM_DOG : string;
    ID_RATE_ACCOUNT, id_user : int64;
    User_Name : string;
    DATE_DOG : TDateTime;
    procedure FormIniLanguage;
  public
    constructor  Create(AParameter:TcnSimpleParamsEx);reintroduce;
  end;

var
  frmChooseReport: TfrmChooseReport;

implementation

{$R *.dfm}
constructor TfrmChooseReport.Create(AParameter:TcnSimpleParamsEx);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AParameter.Owner);

    id_user     := AParameter.ID_User;
    User_Name   := AParameter.User_Name;
    
DM:=TDM_Choose.Create(Self);
DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from sys_options'; // просто чтобы убить транзакцию галимую
DM.DB.Handle:=AParameter.Db_Handle;
DM.ReadDataSet.Open;
DM.ReadDataSet.Close;
 ID_DOG_ROOT := AParameter.cnParamsToPakage.ID_DOG_ROOT;
 ID_DOG      := AParameter.cnParamsToPakage.ID_DOG;
 ID_STUD     := AParameter.cnParamsToPakage.ID_STUD;
 NUM_DOG     := AParameter.cnParamsToPakage.Num_Doc;
 DATE_DOG    := AParameter.cnParamsToPakage.DATE_DOG;
 ID_RATE_ACCOUNT := AParameter.cnParamsToPakage.ID_RATE_ACCOUNT;
Screen.Cursor:=crDefault;
FormIniLanguage();
end;

procedure TfrmChooseReport.FormIniLanguage;
begin
 PLanguageIndex:= cn_Common_Funcs.cnLanguageIndex();
 caption :=                  cnConsts.cn_Print_Caption[PLanguageIndex];
 CalcRadioButton.Caption:=   cnConsts.fr_Reports_CalcDocs[PLanguageIndex];
 PayRadioButton.Caption:=    cnConsts.fr_Reports_PayDocs[PLanguageIndex];
 Sch_Button.Caption:=        cnConsts.cn_RaxynokNaSplatyCaption[PLanguageIndex];

 OkButton.Caption:=          cnConsts.cn_Accept[PLanguageIndex];
 CancelButton.Caption:=      cnConsts.cn_Cancel[PLanguageIndex];
end;
procedure TfrmChooseReport.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmChooseReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dm.free;
end;

procedure TfrmChooseReport.OkButtonClick(Sender: TObject);
var
    InParameter : TcnSimpleParamsEx;
begin
      // -----------логирование работы с печатью------------------------------------
           Dm.ReadDataSet.Close;
           Dm.ReadDataSet.SelectSQL.Clear;
           Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_Print' + '''' + ')';
           Dm.ReadDataSet.Open;
           DM.StProc.StoredProcName := 'CN_ACTION_HISTORY_INSERT';
           DM.StProc.Transaction.StartTransaction;
           DM.StProc.Prepare;
           DM.StProc.ParamByName('ID_DOG_ROOT').AsInt64     := ID_DOG_ROOT;
           DM.StProc.ParamByName('ID_DOG').AsInt64          := ID_DOG;
           DM.StProc.ParamByName('ID_STUD').AsInt64         := ID_STUD;
           DM.StProc.ParamByName('ID_USER').AsInt64         := ID_User;
           DM.StProc.ParamByName('USER_NAME').AsString      := User_Name;
           DM.StProc.ParamByName('ID_ACTION').AsInt64       := Dm.ReadDataSet['ID_ACTION'];
           DM.StProc.ExecProc;
           DM.StProc.Transaction.Commit;
           Dm.ReadDataSet.Close;

 if PayRadioButton.Checked then
  begin
    PrintLoader.LPrintDogs(Self, DM.DB, ID_STUD);
    exit;
  end;
 if CalcRadioButton.Checked then
  begin
   InParameter:= TcnSimpleParamsEx.Create;
   InParameter.Owner:=self;
   InParameter.Db_Handle:= DM.DB.Handle;
   InParameter.Formstyle:=fsNormal;
   InParameter.cnParamsToPakage.ID_DOG      := ID_DOG;
   InParameter.cnParamsToPakage.ID_STUD     := ID_STUD;
   InParameter.cnParamsToPakage.Num_Doc     := NUM_DOG;
   InParameter.WaitPakageOwner:= frmChooseReport;
   RunFunctionFromPackage(InParameter, 'Contracts\cn_fr_Calc.bpl','frCalcReport');
   InParameter.Free;
   Screen.Cursor := crDefault;
   exit;
  end;
 if Sch_Button.Checked then
  begin
   InParameter:= TcnSimpleParamsEx.Create;
   InParameter.Owner:=self;
   InParameter.Db_Handle:= DM.DB.Handle;
   InParameter.Formstyle:=fsNormal;
   InParameter.cnParamsToPakage.ID_DOG_ROOT := ID_DOG_ROOT;
   InParameter.cnParamsToPakage.ID_DOG      := ID_DOG;
   InParameter.cnParamsToPakage.ID_STUD     := ID_STUD;
   InParameter.cnParamsToPakage.Num_Doc     := NUM_DOG;
   InParameter.cnParamsToPakage.ID_RATE_ACCOUNT := ID_RATE_ACCOUNT;
   InParameter.cnParamsToPakage.DATE_DOG    := DATE_DOG;
   InParameter.WaitPakageOwner:= frmChooseReport;
   RunFunctionFromPackage(InParameter, 'Contracts\cn_SchToPay.bpl','ShowSchToPay');
   InParameter.Free;
   Screen.Cursor := crDefault;
   exit;
  end;
end;

end.
