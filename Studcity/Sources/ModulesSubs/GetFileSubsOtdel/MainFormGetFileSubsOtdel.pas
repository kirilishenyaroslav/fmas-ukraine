unit MainFormGetFileSubsOtdel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, ComCtrls, StdCtrls,IBase,StudcityConst, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet,Halcn6db, FIBQuery, pFIBQuery,
  pFIBStoredProc, cxLookAndFeelPainters, cxButtons,St_ser_function,
  cxButtonEdit, cxLabel, st_common_types, st_common_loader, ExtCtrls;

type
  TfrmMainFormGetFileSubsOtdel = class(TForm)
    StatusBar1: TStatusBar;
    Gauge1: TGauge;
    OpenDialogDBF: TOpenDialog;
    GroupBox1: TGroupBox;
    DateTimePickerDateList: TDateTimePicker;
    pFIBDatabase: TpFIBDatabase;
    pFIBDataSetNumList: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    FIBSProc: TpFIBStoredProc;
    HalcyonDataSet: THalcyonDataSet;
    cxButtonClose: TcxButton;
    ButtonStart: TcxButton;
    ButtonOpenFile: TcxButton;
    serves_ButtonEdit: TcxButtonEdit;
    LabelDateList: TcxLabel;
    LabelNumberList: TcxLabel;
    cxLabel1: TcxLabel;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DateTimePickerDateListChange(Sender: TObject);
    procedure DateTimePickerDateListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonOpenFileClick(Sender: TObject);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
    procedure serves_ButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
  private
    id_serves : Int64;
    pos_bar : Integer;
    FileName : string;
    procedure UpdateBar;
    procedure ShowMsg();
  public
    Lang:Integer;
    Constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE);overload;
  end;

  function LoadGetFileSubsOtdel(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  exports LoadGetFileSubsOtdel;

var
  frmMainFormGetFileSubsOtdel: TfrmMainFormGetFileSubsOtdel;

implementation

uses DateUtils;

{$R *.dfm}

procedure TfrmMainFormGetFileSubsOtdel.UpdateBar;
begin
  Gauge1.Progress := pos_bar;
end;

function LoadGetFileSubsOtdel(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  GetFile:TfrmMainFormGetFileSubsOtdel;
begin
  GetFile:=TfrmMainFormGetFileSubsOtdel.Create(AOwner,DB);
end;

Constructor TfrmMainFormGetFileSubsOtdel.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
Var
  MM,YY,DD:Word;
begin
  Inherited Create(AOwner);
  pFIBDatabase.Handle:=DB;

  Lang:=ST_serLanguageIndex(DB);
  
  pFIBDataSetNumList.Active:=false;
  pFIBDataSetNumList.Active:=true;


  ButtonOpenFile.Caption:=StudcityConst.Studcity_ACTION_OPEN_CONST_EX[lang];
  ButtonStart.Caption:=StudcityConst.Studcity_ACTION_START_CONST_EX[lang];
  cxButtonClose.Caption:=StudcityConst.Studcity_ACTION_CLOSE_CONST_EX[lang];
  LabelDateList.Caption:=StudcityConst.Studcity_GetFileSubsDateList_EX[lang];
  Caption:=StudcityConst.Studcity_GetFileSubs_EX[lang];
  LabelNumberList.Caption:=StudcityConst.Studcity_GetFileSubsNUMList_EX[lang]+' № '+ VarToStr(pFIBDataSetNumList.FieldValues['value_num']+1);


  //Загрузка даты на начало месяца
  DateTimePickerDateList.Date:=Now;
  DecodeDate(DateTimePickerDateList.Date,YY,MM,DD);
  DateTimePickerDateList.Date:=EncodeDate(YY,MM,1);
end;

procedure TfrmMainFormGetFileSubsOtdel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmMainFormGetFileSubsOtdel.DateTimePickerDateListChange(
  Sender: TObject);
Var
  MM,YY,DD:Word;
begin
  DecodeDate(DateTimePickerDateList.Date,YY,MM,DD);
  DateTimePickerDateList.Date:=EncodeDate(YY,MM,1);
end;

procedure TfrmMainFormGetFileSubsOtdel.DateTimePickerDateListKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  MM,YY,DD:Word;
begin
  DecodeDate(DateTimePickerDateList.Date,YY,MM,DD);
  DateTimePickerDateList.Date:=EncodeDate(YY,MM,1);
end;

procedure TfrmMainFormGetFileSubsOtdel.ShowMsg();
begin
   ShowMessage('OK');
end;

procedure TfrmMainFormGetFileSubsOtdel.cxButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainFormGetFileSubsOtdel.ButtonOpenFileClick(
  Sender: TObject);
begin
 OpenDialogDBF.Execute;
 if OpenDialogDBF.FileName <> '' then
   begin
     ButtonStart.Enabled := True;
     FileName := OpenDialogDBF.FileName;
     StatusBar1.Panels.Items[0].Text := OpenDialogDBF.FileName;
   end;
end;

procedure TfrmMainFormGetFileSubsOtdel.ButtonStartClick(Sender: TObject);
var
  PathDBF:string;
  SPName:string;
  rcount,ID_LIST:Variant;
  j:Integer;
begin
  if serves_ButtonEdit.Text = '' then
   begin
    ShowMessage('Необхідно обрати послугу!!!');
    serves_ButtonEdit.SetFocus;
    Exit;
   end;

  ButtonOpenFile.Enabled := false;
  ButtonStart.Enabled := false;

  //добавляем список
  WriteTransaction.StartTransaction;
  FIBSProc.StoredProcName:='ST_DT_RZSUB_INSERT_NEW_LIST';
  FIBSProc.Prepare;
  FIBSProc.ParamByName('DATE_LIST').AsDate := DateTimePickerDateList.Date;
  FIBSProc.ParamByName('ID_SERVES').AsInt64 := id_serves;
  try
    FIBSProc.ExecProc;
    Except
      begin
        WriteTransaction.Rollback;
        messageBox(Application.MainForm.Handle,PChar(StudcityConst.Studcity_GetFileSubs_MSG_ERRO_CR_L_EX[2]),PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_OK or MB_ICONERROR);
        Exit;
      end;
    end;
  //FIBTrans.Commit;
  ID_LIST:=FIBSProc.FieldByName('ID_LIST_EX').AsVariant;

  //открываем файл
  try
    HalcyonDataSet.Active := false;
    HalcyonDataSet.TableName := FileName;
    HalcyonDataSet.Active := true;
  Except
    begin
      messageBox(Application.MainForm.Handle,PChar(StudcityConst.Studcity_GetFileSubs_MSG_ERR_FILE_EX[2]),PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_OK or MB_ICONERROR);
      Exit;
    end;
  end;

  //проверяем содержаться ли в нем записи
  rcount:=HalcyonDataSet.RecordCount;
  if HalcyonDataSet.RecordCount=0 then
    begin
      messageBox(Application.MainForm.Handle,PChar(StudcityConst.Studcity_GetFileSubs_MSG_ERR_NO_REC_EX[2]),PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_OK or MB_ICONERROR);
      Exit;
    end;

  //проверяем структуру файла
  try
    HalcyonDataSet.FieldValues['FIO'];
    HalcyonDataSet.FieldValues['ID_RAJ'];
    HalcyonDataSet.FieldValues['NP_CODE'];
    HalcyonDataSet.FieldValues['NP_NAME'];
    HalcyonDataSet.FieldValues['CAT_V'];
    HalcyonDataSet.FieldValues['VULCOD'];
    HalcyonDataSet.FieldValues['NAME_V'];
    HalcyonDataSet.FieldValues['BLD'];
    HalcyonDataSet.FieldValues['CORP'];
    HalcyonDataSet.FieldValues['FLAT'];
    HalcyonDataSet.FieldValues['RASH'];
    HalcyonDataSet.FieldValues['NUMB'];
    HalcyonDataSet.FieldValues['DAT1'];
    HalcyonDataSet.FieldValues['DAT2'];
    HalcyonDataSet.FieldValues['NM_PAY'];
    HalcyonDataSet.FieldValues['P1'];
    HalcyonDataSet.FieldValues['P2'];
    HalcyonDataSet.FieldValues['P3'];
    HalcyonDataSet.FieldValues['P4'];
    HalcyonDataSet.FieldValues['P5'];
    HalcyonDataSet.FieldValues['P6'];
    HalcyonDataSet.FieldValues['P7'];
    HalcyonDataSet.FieldValues['P8'];
    HalcyonDataSet.FieldValues['SM1'];
    HalcyonDataSet.FieldValues['SM2'];
    HalcyonDataSet.FieldValues['SM3'];
    HalcyonDataSet.FieldValues['SM4'];
    HalcyonDataSet.FieldValues['SM5'];
    HalcyonDataSet.FieldValues['SM6'];
    HalcyonDataSet.FieldValues['SM7'];
    HalcyonDataSet.FieldValues['SM8'];
    HalcyonDataSet.FieldValues['SB1'];
    HalcyonDataSet.FieldValues['SB2'];
    HalcyonDataSet.FieldValues['SB3'];
    HalcyonDataSet.FieldValues['SB4'];
    HalcyonDataSet.FieldValues['SB5'];
    HalcyonDataSet.FieldValues['SB6'];
    HalcyonDataSet.FieldValues['SB7'];
    HalcyonDataSet.FieldValues['SB8'];
    HalcyonDataSet.FieldValues['OB1'];
    HalcyonDataSet.FieldValues['OB2'];
    HalcyonDataSet.FieldValues['OB3'];
    HalcyonDataSet.FieldValues['OB4'];
    HalcyonDataSet.FieldValues['OB5'];
    HalcyonDataSet.FieldValues['OB6'];
    HalcyonDataSet.FieldValues['OB7'];
    HalcyonDataSet.FieldValues['OB8'];
    HalcyonDataSet.FieldValues['SUMMA'];
    HalcyonDataSet.FieldValues['NUMM'];
    HalcyonDataSet.FieldValues['SUBS'];
    HalcyonDataSet.FieldValues['KVT'];
    except
      begin
        messageBox(Application.MainForm.Handle,PChar(StudcityConst.Studcity_GetFileSubs_MSG_ERR_FILE_STR_EX[2]),PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_OK or MB_ICONERROR);
      end;
  end;

  //формируем список
  HalcyonDataSet.First;
  Gauge1.MaxValue:=RCount;
  //FIBSProc.Database:=DBIbx;
  //FIBSProc.Transaction:=FIBTrans;
  //FIBTrans.StartTransaction;
  FIBSProc.StoredProcName:='ST_DT_RZLIST_INSERT_PEOPLE';
  FIBSProc.Prepare;
  for j:=1 to rcount do
    begin
      FIBSProc.ParamByName('ID_LIST').AsInt64:=ID_LIST;
      FIBSProc.ParamByName('FIO').Value:=HalcyonDataSet.FieldValues['FIO'];
      FIBSProc.ParamByName('ID_RAJ').Value:=HalcyonDataSet.FieldValues['ID_RAJ'];
      FIBSProc.ParamByName('NP_CODE').Value:=HalcyonDataSet.FieldValues['NP_CODE'];
      FIBSProc.ParamByName('NP_NAME').Value:=HalcyonDataSet.FieldValues['NP_NAME'];
      FIBSProc.ParamByName('CAT_V').Value:=HalcyonDataSet.FieldValues['CAT_V'];
      FIBSProc.ParamByName('VULCOD').Value:=HalcyonDataSet.FieldValues['VULCOD'];
      FIBSProc.ParamByName('NAME_V').Value:=HalcyonDataSet.FieldValues['NAME_V'];
      FIBSProc.ParamByName('BLD').Value:=HalcyonDataSet.FieldValues['BLD'];
      FIBSProc.ParamByName('CORP').Value:=HalcyonDataSet.FieldValues['CORP'];
      FIBSProc.ParamByName('FLAT').Value:=HalcyonDataSet.FieldValues['FLAT'];
      FIBSProc.ParamByName('RASH').Value:=HalcyonDataSet.FieldValues['RASH'];
      FIBSProc.ParamByName('NUMB').Value:=HalcyonDataSet.FieldValues['NUMB'];
      FIBSProc.ParamByName('DAT1').Value:=HalcyonDataSet.FieldValues['DAT1'];
      FIBSProc.ParamByName('DAT2').Value:=HalcyonDataSet.FieldValues['DAT2'];
      FIBSProc.ParamByName('NM_PAY').Value:=HalcyonDataSet.FieldValues['NM_PAY'];
      FIBSProc.ParamByName('P1').Value:=HalcyonDataSet.FieldValues['P1'];
      FIBSProc.ParamByName('P2').Value:=HalcyonDataSet.FieldValues['P2'];
      FIBSProc.ParamByName('P3').Value:=HalcyonDataSet.FieldValues['P3'];
      FIBSProc.ParamByName('P4').Value:=HalcyonDataSet.FieldValues['P4'];
      FIBSProc.ParamByName('P5').Value:=HalcyonDataSet.FieldValues['P5'];
      FIBSProc.ParamByName('P6').Value:= HalcyonDataSet.FieldValues['P6'];
      FIBSProc.ParamByName('P7').Value:=HalcyonDataSet.FieldValues['P7'];
      FIBSProc.ParamByName('P8').Value:=HalcyonDataSet.FieldValues['P8'];
      FIBSProc.ParamByName('SM1').Value:=HalcyonDataSet.FieldValues['SM1'];
      FIBSProc.ParamByName('SM2').Value:=HalcyonDataSet.FieldValues['SM2'];
      FIBSProc.ParamByName('SM3').Value:=HalcyonDataSet.FieldValues['SM3'];
      FIBSProc.ParamByName('SM4').Value:=HalcyonDataSet.FieldValues['SM4'];
      FIBSProc.ParamByName('SM5').Value:=HalcyonDataSet.FieldValues['SM5'];
      FIBSProc.ParamByName('SM6').Value:=HalcyonDataSet.FieldValues['SM6'];
      FIBSProc.ParamByName('SM7').Value:=HalcyonDataSet.FieldValues['SM7'];
      FIBSProc.ParamByName('SM8').Value:=HalcyonDataSet.FieldValues['SM8'];
      FIBSProc.ParamByName('SB1').Value:=HalcyonDataSet.FieldValues['SB1'];
      FIBSProc.ParamByName('SB2').Value:=HalcyonDataSet.FieldValues['SB2'];
      FIBSProc.ParamByName('SB3').Value:=HalcyonDataSet.FieldValues['SB3'];
      FIBSProc.ParamByName('SB4').Value:=HalcyonDataSet.FieldValues['SB4'];
      FIBSProc.ParamByName('SB5').Value:=HalcyonDataSet.FieldValues['SB5'];
      FIBSProc.ParamByName('SB6').Value:=HalcyonDataSet.FieldValues['SB6'];
      FIBSProc.ParamByName('SB7').Value:=HalcyonDataSet.FieldValues['SB7'];
      FIBSProc.ParamByName('SB8').Value:=HalcyonDataSet.FieldValues['SB8'];
      FIBSProc.ParamByName('OB1').Value:=HalcyonDataSet.FieldValues['OB1'];
      FIBSProc.ParamByName('OB2').Value:=HalcyonDataSet.FieldValues['OB2'];
      FIBSProc.ParamByName('OB3').Value:=HalcyonDataSet.FieldValues['OB3'];
      FIBSProc.ParamByName('OB4').Value:=HalcyonDataSet.FieldValues['OB4'];
      FIBSProc.ParamByName('OB5').Value:=HalcyonDataSet.FieldValues['OB5'];
      FIBSProc.ParamByName('OB6').Value:=HalcyonDataSet.FieldValues['OB6'];
      FIBSProc.ParamByName('OB7').Value:=HalcyonDataSet.FieldValues['OB7'];
      FIBSProc.ParamByName('OB8').Value:=HalcyonDataSet.FieldValues['OB8'];
      FIBSProc.ParamByName('SUMMA').Value:=HalcyonDataSet.FieldValues['SUMMA'];
      FIBSProc.ParamByName('NUMM').Value:=HalcyonDataSet.FieldValues['NUMM'];
      FIBSProc.ParamByName('SUBS').Value:=HalcyonDataSet.FieldValues['SUBS'];
      FIBSProc.ParamByName('KVT').Value:=HalcyonDataSet.FieldValues['KVT'];
      try
        FIBSProc.ExecProc;
        Except
          begin
            messageBox(Application.MainForm.Handle,PChar(StudcityConst.Studcity_GetFileSubs_MSG_ERR_ADD_MAN_EX[2]),PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_OK or MB_ICONERROR);
//            Exit;
          end;
      end;
      pos_bar := j;
      UpdateBar;
      HalcyonDataSet.Next;
    end;
  //FIBTrans.Commit;

  //обновляем список в плане суммы и кол-ва записей
  //FIBSProc.Database:=DBIbx;
  //FIBSProc.Transaction:=FIBTrans;
  //FIBTrans.StartTransaction;
  FIBSProc.StoredProcName:='ST_DT_RZSUB_SUM_CNT';
  FIBSProc.Prepare;
  FIBSProc.ParamByName('IN_ID_LIST').AsInt64:=ID_LIST;
  try
    FIBSProc.ExecProc;
    Except
      begin
        WriteTransaction.Rollback;
        Exit;
      end;
  end;
  WriteTransaction.Commit;

  messageBox(Application.MainForm.Handle,PChar(StudcityConst.Studcity_GetFileSubs_MSG_OK_EX[2]),PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_OK or MB_ICONINFORMATION);
  ButtonOpenFile.Enabled := True;
  ButtonStart.Enabled    := False;

  pos_bar := RCount;
  UpdateBar;
end;

procedure TfrmMainFormGetFileSubsOtdel.serves_ButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  aParameter : TstSimpleParams;
  res : Variant;
begin
  aParameter                 := TstSimpleParams.Create;
  aParameter.Owner           := self;
  aParameter.Db_Handle       := pFIBDatabase.Handle;
  AParameter.Formstyle       := fsNormal;
  AParameter.WaitPakageOwner := self;
  //aParameter.is_admin        := is_admin;

  res := RunFunctionFromPackage(aParameter, 'Studcity\st_services.bpl', 'getServices');

  If VarArrayDimCount(res) <> 0 then
   begin
     id_serves              := res[0];
     serves_ButtonEdit.Text := res[1];
   end;

  aParameter.Free; 
end;

procedure TfrmMainFormGetFileSubsOtdel.FormShow(Sender: TObject);
begin
  ButtonStart.Enabled := False;
end;

end.
