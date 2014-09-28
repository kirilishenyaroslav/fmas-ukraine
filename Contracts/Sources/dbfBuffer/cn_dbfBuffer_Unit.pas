//******************************************************************************
// Проект "Контракты"
// dbf-buffer
// Чернявский А.Э. 2006г.
//******************************************************************************

unit cn_dbfBuffer_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cn_DM_dbf, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, StdCtrls, cxRadioGroup, cxGroupBox,cn_Common_Messages,
  ActnList, cn_dbfBuffer_Import, cxLabel, ExtCtrls, cn_dbfBuffer_Log;

type
  TfrmBuffer = class(TForm)
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    StatusBar: TdxStatusBar;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    FIO_COMBO: TcxGridDBColumn;
    NUM_DOG: TcxGridDBColumn;
    DATE_DOG: TcxGridDBColumn;
    DATE_BEG: TcxGridDBColumn;
    DATE_END: TcxGridDBColumn;
    GET_REC: TcxGridDBColumn;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    PrintButton: TdxBarLargeButton;
    PayButton: TdxBarLargeButton;
    LgotaButton: TdxBarLargeButton;
    EntryRestButton: TdxBarLargeButton;
    HistoryButton: TdxBarLargeButton;
    FIO_BarContainer: TdxBarControlContainerItem;
    FilterExecute_Button: TdxBarButton;
    Dog_Filter_Edit: TdxBarEdit;
    GlobalFilterButton: TdxBarLargeButton;
    DsetRecordCount: TdxBarButton;
    CreditButton: TdxBarLargeButton;
    Faculty_Footer_Label: TdxBarStatic;
    Spec_Footer_Label: TdxBarStatic;
    Gragdanstvo_Footer_Label: TdxBarStatic;
    FormStudy_Footer_Label: TdxBarStatic;
    CategoryStudy_Footer_Label: TdxBarStatic;
    Kurs_Footer_Label: TdxBarStatic;
    Group_Footer_Label: TdxBarStatic;
    UpLoad_Button: TdxBarLargeButton;
    BreakDown_Button: TdxBarLargeButton;
    PayerData_Button: TdxBarButton;
    RastorgPri4ina_Button: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    Dodatki_Button: TdxBarSubItem;
    SelectButton: TdxBarLargeButton;
    Filtration_GroupBox: TcxGroupBox;
    FiltrByFIO_RadioButton: TcxRadioButton;
    FiltrByNum_RadioButton: TcxRadioButton;
    FetchAll: TdxBarButton;
    dxBarStatic2: TdxBarStatic;
    ShowAll_Button: TdxBarLargeButton;
    ClearBuffer: TdxBarLargeButton;
    Contracts_ActionList: TActionList;
    FilterAction: TAction;
    Magic_DissToNotDiss_Action: TAction;
    dxBarButton1: TdxBarButton;
    ImportButton: TdxBarLargeButton;
    WorkButton: TdxBarLargeButton;
    WorkAllButton: TdxBarLargeButton;
    Panel1: TPanel;
    cxProgressBar1: TcxProgressBar;
    cxLabel1: TcxLabel;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DsetRecordCountClick(Sender: TObject);
    procedure FetchAllClick(Sender: TObject);
    procedure GridDBViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure RefreshButtonClick(Sender: TObject);
    procedure ShowAll_ButtonClick(Sender: TObject);
    procedure ClearBufferClick(Sender: TObject);
    procedure GridDBViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FilterExecute_ButtonClick(Sender: TObject);
    procedure Dog_Filter_EditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dog_Filter_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FilterActionExecute(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
    procedure ImportButtonClick(Sender: TObject);
    procedure WorkButtonClick(Sender: TObject);
    procedure WorkAllButtonClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM:TDM_dbf;
    procedure FormIniLanguage;
  public
    res:Variant;
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmBuffer.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AOwner);
DM:=TDM_dbf.Create(Self);
DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_BUFFER_SELECT_NOT_GET';
DM.DB.Handle:=DB_Handle;
DM.DataSet.Open;
GridDBView.DataController.DataSource := DM.DataSource;
FormIniLanguage();
Screen.Cursor:=crDefault;
end;

procedure TfrmBuffer.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      cnConsts.cn_VC_BufferCaption[PLanguageIndex];
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=        cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
 ClearBuffer.Caption :=         cnConsts.cn_VC_ClearBuffer[PLanguageIndex];
 ClearBuffer.Hint :=            cnConsts.cn_VC_ClearBuffer[PLanguageIndex];
 ShowAll_Button.Caption :=      cnConsts.cn_VC_AllBuffer[PLanguageIndex];
  //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_EnterBtn_ShortCut[PLanguageIndex]   + cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

  // Грид
 FIO_COMBO.Caption:=            cnConsts.cn_grid_FIO_Column[PLanguageIndex];
 date_dog.Caption:=             cnConsts.cn_grid_Date_Dog_Column[PLanguageIndex];
 num_dog.Caption:=              cnConsts.cn_grid_Num_Dog_Column[PLanguageIndex];
 date_beg.Caption:=             cnConsts.cn_grid_Date_Beg[PLanguageIndex];
 date_end.Caption:=             cnConsts.cn_grid_Date_End[PLanguageIndex];

 Dog_Filter_Edit.Caption:=                cnConsts.cn_SearchBtn_Caption[PLanguageIndex];
 FiltrByFIO_RadioButton.Caption:=         cnConsts.cn_FiltrByFIO[PLanguageIndex];
 FiltrByNum_RadioButton.Caption:=         cnConsts.cn_FiltrByNum[PLanguageIndex];
 FilterExecute_Button.Hint:=              cnConsts.cn_SearchBtn_Caption[PLanguageIndex];

 ImportButton.Caption := cnConsts.cn_ImportDbf[PLanguageIndex];
 WorkButton.Caption := cnConsts.cn_ImportAdd[PLanguageIndex];
 WorkAllButton.Caption := cnConsts.cn_ImportAddAll[PLanguageIndex];

 DsetRecordCount.Caption:=   cnConsts.cn_DSetRecordCount[PLanguageIndex];
end;

procedure TfrmBuffer.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmBuffer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if FormStyle = fsMDIChild then action:=caFree
else
DM.Free;
end;

procedure TfrmBuffer.SelectButtonClick(Sender: TObject);
var id_sp: int64;
begin
Res:=VarArrayCreate([0,20],varVariant);
if DM.DataSet['ID_MEN'] <> null then
id_sp:=  DM.DataSet['ID_MEN']
else
id_sp:= -1;
Res[0]:= id_sp;
Res[1]:= DM.DataSet['NUM_DOG'];
Res[2]:= DM.DataSet['DATE_DOG'];
Res[3]:= DM.DataSet['DATE_BEG'];
Res[4]:= DM.DataSet['DATE_END'];
Res[5]:= DM.DataSet['TIN'];
Res[6]:= DM.DataSet['FAMILIA'];
Res[7]:= DM.DataSet['IMYA'];
Res[8]:= DM.DataSet['OTCHESTVO'];
Res[9]:= DM.DataSet['DATE_RO'];
Res[10]:=DM.DataSet['STAT'];
Res[11]:=DM.DataSet['ID_FACUL'];
Res[12]:=DM.DataSet['ID_SPEC'];
Res[13]:=DM.DataSet['ID_NATIONAL'];
Res[14]:=DM.DataSet['ID_FORM_STUD'];
Res[15]:=DM.DataSet['ID_KAT_STUD'];
Res[16]:=DM.DataSet['KURS'];
Res[17]:=DM.DataSet['FIO_COMBO'];
//Res[17]:=DM.DataSet['GET_REC'];
//Res[18]:=DM.DataSet['DATE_STAMP'];

ModalResult:=mrOk;
end;

procedure TfrmBuffer.FormShow(Sender: TObject);
begin
if FormStyle = fsMDIChild then  SelectButton.Enabled:=false;
DsetRecordCountClick(Sender);
if Dm.DataSet.RecordCount =0 then  SelectButton.Enabled:=false;
end;

procedure TfrmBuffer.DsetRecordCountClick(Sender: TObject);
begin
DsetRecordCount.Caption:=   cnConsts.cn_DSetRecordCount[PLanguageIndex];
DsetRecordCount.Caption:=DsetRecordCount.Caption+ inttostr(Dm.DataSet.RecordCount);
end;

procedure TfrmBuffer.FetchAllClick(Sender: TObject);
begin
Screen.Cursor := crSQLWait;
DM.DataSet.FetchAll;
DsetRecordCountClick(Sender);
Screen.Cursor := crDefault;
end;

procedure TfrmBuffer.GridDBViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var Arect : TRect;
begin
 if ((AViewInfo.GridRecord.Values[5]= 1) and  (not AViewInfo.GridRecord.Focused )) then  begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00F2EFEC;
      ACanvas.Canvas.FillRect(Arect);
   end;
  if ((AViewInfo.GridRecord.Values[5]= 1) and (AViewInfo.GridRecord.Focused )) then  begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00B7B7B7;
      ACanvas.Canvas.FillRect(Arect);
   end;
end;

procedure TfrmBuffer.RefreshButtonClick(Sender: TObject);
begin
Screen.Cursor := crSQLWait;
DM.DataSet.CloseOpen(False);
Screen.Cursor := crDefault;
end;

procedure TfrmBuffer.ShowAll_ButtonClick(Sender: TObject);
var SQL_Select : string;
begin
ShowAll_Button.AutoGrayScale := not ShowAll_Button.Down;

SQL_Select :='select * from ';
if ShowAll_Button.Down then
SQL_Select := SQL_Select + 'CN_VC_BUFFER_SELECT'
else
SQL_Select := SQL_Select + 'CN_VC_BUFFER_SELECT_NOT_GET';

DM.DataSet.Close;
DM.DataSet.SelectSQL.Clear;
DM.DataSet.SelectSQL.Text := SQL_Select;
DM.DataSet.CloseOpen(False);

end;

procedure TfrmBuffer.ClearBufferClick(Sender: TObject);
var i: integer;
begin
 i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_ClearBufferPromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
 if ((i = 7) or (i= 2)) then exit;
         DM.StProc.StoredProcName := 'CN_VC_BUFFER_DELETE_ALL';
         DM.StProc.Transaction.StartTransaction;
         DM.StProc.Prepare;
         DM.StProc.ExecProc;
         DM.StProc.Transaction.Commit;
         DM.DataSet.CloseOpen(False);
end;

procedure TfrmBuffer.GridDBViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_delete then ClearBufferClick(Sender);
end;

procedure TfrmBuffer.FilterExecute_ButtonClick(Sender: TObject);
var ss: TShiftState;
   key : Word;
begin
ss:=[ssShift] ;
key :=13;
Dog_Filter_EditKeyDown(self, key, ss);
end;

procedure TfrmBuffer.Dog_Filter_EditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  begin
  if Dog_Filter_Edit.CurText = '' then exit;
if key = vk_return then
 begin
  Screen.Cursor := crHourGlass;
  DM.DataSet.Close;
  DM.DataSet.SelectSQL.Text:= 'select * from CN_VC_BUFFER_FILTER_FIO('+
                             ''''+
                             cn_Common_Funcs.UpperCaseRusUkr(Dog_Filter_Edit.CurText)
                             + ''''+',';
  if FiltrByFIO_RadioButton.Checked then
  DM.DataSet.SelectSQL.Text:=DM.DataSet.SelectSQL.Text + '1)'
  else
  DM.DataSet.SelectSQL.Text:=DM.DataSet.SelectSQL.Text + '2)';


  DM.DataSet.Open;
  Screen.Cursor := crDefault;
  DsetRecordCount.Caption:=   cnConsts.cn_DSetRecordCount[PLanguageIndex];
  DsetRecordCount.Caption:=DsetRecordCount.Caption+ inttostr(Dm.DataSet.RecordCount);
 end;
end;

procedure TfrmBuffer.Dog_Filter_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Grid.SetFocus;

if ((key <> #8) and (key <> '/')) then
if IntegerCheck(Key) then
  FiltrByNum_RadioButton.Checked:=true
else
  FiltrByFIO_RadioButton.Checked:=true;
end;

procedure TfrmBuffer.FilterActionExecute(Sender: TObject);
begin
Dog_Filter_Edit.Setfocus;
end;

procedure TfrmBuffer.GridDBViewDblClick(Sender: TObject);
begin
if SelectButton.Enabled then SelectButtonClick(Sender);
end;

procedure TfrmBuffer.ImportButtonClick(Sender: TObject);
var
  T: TfrmImportDBF;
begin
  T:=TfrmImportDBF.Create(self);
  T.StoredProc.Database:=DM.DB;
  T.StoredProc.Transaction:=DM.WriteTransaction;
  T.ShowModal;
  T.Free;
  DM.DataSet.CloseOpen(False);
end;

procedure TfrmBuffer.WorkButtonClick(Sender: TObject);
var
  res: Integer;
  res_msg: string;
begin
  DM.StProc.StoredProcName := 'CN_VC_BUFFER_IMPORT_DOGOVOR';
  DM.StProc.Transaction.StartTransaction;
  DM.StProc.Prepare;
  DM.StProc.ParamByName('ID_REC').Value:=DM.DataSet.FieldByName('ID_REC').AsInteger;
  DM.StProc.ExecProc;
  res:=DM.StProc.ParamByName('RESULT').Value;
  res_msg:=DM.StProc.ParamByName('RESULT_MSG').Value;
  DM.StProc.Transaction.Commit;
  if res<>1 then
    ShowMessage('Помилка імпорту: '+res_msg);
  DM.DataSet.CloseOpen(False);
end;

procedure TfrmBuffer.WorkAllButtonClick(Sender: TObject);
var
  strRecCnt: string;
  T: TfrmLog;
  res: Integer;
  res_msg: string;
  flag: Integer;
begin
  Panel1.Visible:=true;
  DM.DataSet.FetchAll;
  cxProgressBar1.Properties.Max:=DM.DataSet.RecordCount;
  strRecCnt:=IntToStr(DM.DataSet.RecordCount);
  DM.DataSet.First;
  DM.DataSet.DisableControls;
  T:=TfrmLog.Create(self);
  flag:=0;
  while not DM.DataSet.Eof do
  begin
    try
      DM.StProc.StoredProcName := 'CN_VC_BUFFER_IMPORT_DOGOVOR';
      DM.StProc.Transaction.StartTransaction;
      DM.StProc.Prepare;
      DM.StProc.ParamByName('ID_REC').Value:=DM.DataSet.FieldByName('ID_REC').AsInteger;
      DM.StProc.ExecProc;
      res:=DM.StProc.ParamByName('RESULT').Value;
      res_msg:=DM.StProc.ParamByName('RESULT_MSG').Value;
      DM.StProc.Transaction.Commit;
      if res<>1 then
      begin
        T.cxMemo1.Lines.Add(VarToStr(DM.DataSet['FIO_COMBO'])+' помилка імпорту: '+res_msg);
        Inc(flag);
      end;
    except on E:Exception do begin
          DM.StProc.Transaction.Rollback;
          ShowMessage(E.Message);
        end;
    end;
    cxProgressBar1.Position:=DM.DataSet.RecNo;
    cxLabel1.Caption:=IntToStr(DM.DataSet.RecNo)+' з '+strRecCnt;
    Application.ProcessMessages;
    DM.DataSet.Next;
  end;
  Panel1.Visible:=False;
  DM.DataSet.EnableControls;
  DM.DataSet.CloseOpen(False);
  if flag>0 then
    T.ShowModal;
  T.Free;
end;

end.
