//******************************************************************************
// Проект "Контракты"
// Справочник входящего остатка
// Чернявский А.Э. 2005г.
//******************************************************************************

unit EntryRest_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  DM_EntryRest, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cxCurrencyEdit, cxGroupBox, cxLabel,
  EntryRest_Istochniki, cn_Common_Types, StdCtrls, cnConsts_Messages,
  cn_Common_Messages, AccMgmt;


type
  TfrmEntryRest = class(TForm)
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
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
    GroupBox: TcxGroupBox;
    FIO_Label: TcxLabel;
    Grid_istochniki: TcxGrid;
    Grid_istochnikiTableView: TcxGridTableView;
    smeta: TcxGridColumn;
    razdel: TcxGridColumn;
    stat: TcxGridColumn;
    kekv: TcxGridColumn;
    summa: TcxGridColumn;
    id_smeta: TcxGridColumn;
    id_razdel: TcxGridColumn;
    id_statya: TcxGridColumn;
    id_kekv: TcxGridColumn;
    Grid_istochnikiLevel: TcxGridLevel;
    id_type_rest: TcxGridColumn;
    AvtoButton: TdxBarLargeButton;
    SummaLabel: TLabel;
    SummaEdit: TcxCurrencyEdit;
    SaveButton: TdxBarLargeButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SummaEditKeyPress(Sender: TObject; var Key: Char);
    procedure AvtoButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure Grid_istochnikiTableViewDblClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM:TDM_ER;
    is_admin : Boolean;
    procedure FormIniLanguage;
  public
    res:Variant;
    ID_DOG_ROOT : Int64;
    ID_STUD     : Int64;
    ID_DOG, id_user : int64;
    User_Name : string;
    Entry_Rest_Ids:array of int64;
    constructor  Create(AParameter:TcnSimpleParamsEx);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmEntryRest.Create(AParameter:TcnSimpleParamsEx);
var
  i: integer;
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AParameter.Owner);

  FormIniLanguage();

  Grid_istochnikiTableView.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
  Grid_istochnikiTableView.Items[1].DataBinding.ValueTypeClass := TcxIntegerValueType;
  Grid_istochnikiTableView.Items[2].DataBinding.ValueTypeClass := TcxIntegerValueType;
  Grid_istochnikiTableView.Items[3].DataBinding.ValueTypeClass := TcxIntegerValueType;
  Grid_istochnikiTableView.Items[4].DataBinding.ValueTypeClass := TcxFloatValueType;
  Grid_istochnikiTableView.Items[5].DataBinding.ValueTypeClass := TcxLargeIntValueType;
  Grid_istochnikiTableView.Items[6].DataBinding.ValueTypeClass := TcxLargeIntValueType;
  Grid_istochnikiTableView.Items[7].DataBinding.ValueTypeClass := TcxLargeIntValueType;
  Grid_istochnikiTableView.Items[8].DataBinding.ValueTypeClass := TcxLargeIntValueType;
  Grid_istochnikiTableView.Items[9].DataBinding.ValueTypeClass := TcxLargeIntValueType;

  ID_DOG_ROOT := AParameter.cnParamsToPakage.ID_DOG_ROOT;
  ID_STUD     := AParameter.cnParamsToPakage.ID_STUD;
  FIO_Label.Caption:= AParameter.cnParamsToPakage.FIO;
  ID_DOG      := AParameter.cnParamsToPakage.ID_DOG;
  id_user     := AParameter.ID_User;
  is_admin    := AParameter.is_admin;
  User_Name   := AParameter.User_Name;

DM:=TDM_ER.Create(Self);
DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_ENTRS_SMET_SELECT('+
                                       inttostr(AParameter.cnParamsToPakage.ID_DOG_ROOT)
                                       + ','+ inttostr(AParameter.cnParamsToPakage.ID_STUD)
                                       +')';
DM.DB.Handle:=AParameter.Db_Handle;
DM.ReadDataSet.Open;
DM.ReadDataSet.FetchAll;

if DM.ReadDataSet.RecordCount >0 then
SetLength(Entry_Rest_Ids, DM.ReadDataSet.RecordCount);

 if DM.ReadDataSet.RecordCount <> 0 then begin
  for i := 0 to DM.ReadDataSet.RecordCount-1  do begin
   Grid_istochnikiTableView.DataController.RecordCount := Grid_istochnikiTableView.DataController.RecordCount+1;
   Grid_istochnikiTableView.DataController.Values[i, 0] := DM.ReadDataSet['KOD_SM'];
   Grid_istochnikiTableView.DataController.Values[i, 1] := DM.ReadDataSet['KOD_RAZD'];
   Grid_istochnikiTableView.DataController.Values[i, 2] := DM.ReadDataSet['KOD_ST'];
   Grid_istochnikiTableView.DataController.Values[i, 3] := DM.ReadDataSet['KOD_KEKV'];
   Grid_istochnikiTableView.DataController.Values[i, 4] := DM.ReadDataSet['SUMMA'];
   Grid_istochnikiTableView.DataController.Values[i, 5] := DM.ReadDataSet['ID_SMET'];
   Grid_istochnikiTableView.DataController.Values[i, 6] := DM.ReadDataSet['ID_RAZD'];
   Grid_istochnikiTableView.DataController.Values[i, 7] := DM.ReadDataSet['ID_STAT'];
   Grid_istochnikiTableView.DataController.Values[i, 8] := DM.ReadDataSet['ID_KEKV'];
   Grid_istochnikiTableView.DataController.Values[i, 9] := DM.ReadDataSet['ID_TYPE_REST'];
   Entry_Rest_Ids[i]:= DM.ReadDataSet['ID_ENTRS_SMET'];
   DM.ReadDataSet.Next;
  end;
Screen.Cursor:=crDefault;

DM.ReadDataSet.close;
DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from CN_SUM_ENTRYREST_SELECT('+
                                       inttostr(AParameter.cnParamsToPakage.ID_STUD)
                                       + ','+ inttostr(AParameter.cnParamsToPakage.ID_DOG_ROOT)
                                       +')';
DM.ReadDataSet.open;
SummaEdit.Value := DM.ReadDataSet['SUM_ENTRY_REST'];
DM.ReadDataSet.Close;
end;
end;

procedure TfrmEntryRest.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();
 //кэпшн формы
 Caption:=                      cnConsts.cn_EntryRest[PLanguageIndex];
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

 // грид
 smeta.Caption :=               cnConsts.cn_Smeta[PLanguageIndex];
 razdel.Caption :=              cnConsts.cn_Razdel[PLanguageIndex];
 stat.Caption :=                cnConsts.cn_Statya[PLanguageIndex];
 kekv.Caption :=                cnConsts.cn_Kekv[PLanguageIndex];
 summa.Caption :=               cnConsts.cn_Summa_Column[PLanguageIndex];
 SummaLabel.Caption :=          cnConsts.cn_Summa_Column[PLanguageIndex];
 AvtoButton.Caption :=          cnConsts.cn_AutoShort_Caption[PLanguageIndex];
 SaveButton.Caption :=          cnConsts.cn_Accept[PLanguageIndex];
  //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  cnConsts.cn_F10Btn_ShortCut[PLanguageIndex]     + cnConsts.cn_Accept[PLanguageIndex];
 StatusBar.Panels[4].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

end;

procedure TfrmEntryRest.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmEntryRest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DM.Free;
end;

procedure TfrmEntryRest.SelectButtonClick(Sender: TObject);
begin
Res:=-1;
ModalResult:=mrOk;
end;

procedure TfrmEntryRest.AddButtonClick(Sender: TObject);
var
  ViewForm : Tfrm_EntryRestIstochniki_AE;
begin
  If not Is_Admin then
    If fibCheckPermission('/ROOT/Contracts/cn_entryrest','Add') <> 0
     then
       Begin
        messagebox(handle,
        pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
        +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
        pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
       End;

ViewForm:=Tfrm_EntryRestIstochniki_AE.create(Self, DM.DB.Handle);
ViewForm.Caption:=  cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
if ViewForm.ShowModal = mrOk then
 begin
    Grid_istochnikiTableView.DataController.RecordCount := Grid_istochnikiTableView.DataController.RecordCount + 1;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 0] := ViewForm.Smeta_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 1] := ViewForm.Razdel_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 2] := ViewForm.Stat_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 3] := ViewForm.Kekv_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 4] := ViewForm.Persent_Edit.Text;

    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 5] := ViewForm.id_smeta;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 6] := ViewForm.id_razdel;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 7] := ViewForm.id_stat;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 8] := ViewForm.id_kekv;

    SummaEdit.Value := Grid_istochnikiTableView.DataController.Summary.FooterSummaryValues[0];
 end;
 ViewForm.Free;
end;

procedure TfrmEntryRest.EditButtonClick(Sender: TObject);
var
  ViewForm : Tfrm_EntryRestIstochniki_AE;
begin
  If not Is_Admin then
    If fibCheckPermission('/ROOT/Contracts/cn_entryrest','Edit') <> 0
     then
       Begin
        messagebox(handle,
        pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
        +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
        pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
       End;

if Grid_istochnikiTableView.DataController.RecordCount = 0 then exit;

ViewForm:=Tfrm_EntryRestIstochniki_AE.create(Self, DM.DB.Handle);
ViewForm.Caption:=  cnConsts.cn_EditBtn_Caption[PLanguageIndex];

 ViewForm.ID_SMETA  := Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 5];
 ViewForm.ID_RAZDEL := Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 6];
 ViewForm.ID_STAT   := Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 7];
 ViewForm.ID_KEKV   := Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 8];

 ViewForm.Smeta_Edit.Text  := Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 0];
 ViewForm.Razdel_Edit.Text := Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 1];
 ViewForm.Stat_Edit.Text   := Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 2];
 ViewForm.Kekv_Edit.Text   := Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 3];
 ViewForm.Persent_Edit.Value  := Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 4];

 if  ViewForm.ShowModal = mrOk then begin
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 0] := ViewForm.Smeta_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 1] := ViewForm.Razdel_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 2] := ViewForm.Stat_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 3] := ViewForm.Kekv_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 4] := ViewForm.Persent_Edit.Text;

    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 5] := ViewForm.id_smeta;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 6] := ViewForm.id_razdel;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 7] := ViewForm.id_stat;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 8] := ViewForm.id_kekv;

  EditButton.Enabled := true;
  DeleteButton.Enabled := true;

  SummaEdit.Value := Grid_istochnikiTableView.DataController.Summary.FooterSummaryValues[0];
  ViewForm.Free;
 end;
end;

procedure TfrmEntryRest.FormShow(Sender: TObject);
begin
SummaEdit.SetFocus;
if Grid_istochnikiTableView.DataController.RecordCount > 0 then
   Grid_istochnikiTableView.DataController.FocusedRecordIndex :=0;
end;

procedure TfrmEntryRest.SummaEditKeyPress(Sender: TObject; var Key: Char);
  var
  i:integer;
  begin
if SummaEdit.Value = 0 then exit;
if key=#13 then begin
if Grid_istochnikiTableView.DataController.RecordCount<>0 then
for i:=Grid_istochnikiTableView.DataController.RecordCount-1 downto 0 do
Grid_istochnikiTableView.DataController.DeleteRecord(i);

Screen.Cursor:=crHourGlass;
DM.ReadDataSet.Close;
DM.ReadDataSet.SelectSQL.Clear;
DM.ReadDataSet.SelectSQL.Text:='select * from CN_INSOST_BY_SMET_SELECT('+
                                       inttostr(ID_DOG_ROOT)
                                       + ','+ inttostr(ID_STUD)
                                       +')';
DM.ReadDataSet.Open;
DM.ReadDataSet.FetchAll;

for i:=0 to DM.ReadDataSet.RecordCount-1 do begin
Grid_istochnikiTableView.DataController.RecordCount := Grid_istochnikiTableView.DataController.RecordCount + 1;
Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 0] := DM.ReadDataSet['NOMER_SM'];
Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 1] := DM.ReadDataSet['NOMER_RAZD'];
Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 2] := DM.ReadDataSet['NOMER_ST'];
Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 3] := DM.ReadDataSet['NOMER_KEKV'];
Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 4] := SummaEdit.Value*DM.ReadDataSet['PERCENT']/100;
Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 5] := DM.ReadDataSet['KOD_SM'];
Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 6] := DM.ReadDataSet['KOD_RAZD'];
Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 7] := DM.ReadDataSet['KOD_ST'];
Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 8] := DM.ReadDataSet['KOD_KEKV'];
DM.ReadDataSet.Next;
end;

DM.ReadDataSet.close;
Grid_istochnikiTableView.DataController.FocusedRowIndex:=Grid_istochnikiTableView.DataController.RecordCount - 1;

if Grid_istochnikiTableView.DataController.RecordCount<>0 then
 begin
  EditButton.Enabled:=true;
  DeleteButton.Enabled:=true;
 end;

Screen.Cursor:=crDefault;
end;
end;

procedure TfrmEntryRest.AvtoButtonClick(Sender: TObject);
var
 enter : char;
begin
 enter := #13;
 SummaEdit.Value := StrToFloat(SummaEdit.Text);
 SummaEditKeyPress(self, enter);
end;

procedure TfrmEntryRest.SaveButtonClick(Sender: TObject);
var
 i: integer;
 all_right : boolean;
 s : Double;
begin
 all_right:= false;

 SummaEdit.Value := strtofloat(SummaEdit.text);

 S := 0;
 if Grid_istochnikiTableView.DataController.RecordCount <> 0
  then s := Grid_istochnikiTableView.DataController.Summary.FooterSummaryValues[0];

 if SummaEdit.Value <> s then
  begin
   ShowMessage(pchar(cnConsts_Messages.cn_warning_SummaNotSame[PLanguageIndex])); // Сума розбивки не співпадає з зазначеною!
   SummaEdit.SetFocus;
   exit;
  end;

  // изменение входящего остатка
if Grid_istochnikiTableView.DataController.RecordCount > 0 then
begin
 With DM.StProc do
  begin
   Transaction.StartTransaction;
   StoredProcName := 'CN_DT_STUD_SUM_ER_UPDATE';
   Prepare;
   ParamByName('ID_DOG_ROOT').AsInt64 :=       ID_DOG_ROOT;
   ParamByName('ID_STUD').AsInt64 :=           ID_STUD;
   ParamByName('SUM_ENTRY_REST').AsCurrency:=  SummaEdit.Value;
   ExecProc;

   for i := 0 to Length(Entry_Rest_Ids)-1 do begin
    StoredProcName := 'CN_DT_ENTRS_SMET_DELETE';
    Prepare;
    ParamByName('ID_ENTRS_SMET').AsInt64 := Entry_Rest_Ids[i];
    ExecProc;
   end;

   for i := 0 to Grid_istochnikiTableView.DataController.RecordCount - 1 do begin
    StoredProcName := 'CN_DT_ENTRS_SMET_INSERT';
    Prepare;
    ParamByName('ID_DOG_ROOT').AsInt64 :=   ID_DOG_ROOT;
    ParamByName('ID_STUD').AsInt64 :=       ID_STUD;
    ParamByName('ID_SMET').AsInt64 :=       Grid_istochnikiTableView.DataController.Values[i, 5];
    ParamByName('ID_RAZD').AsInt64 :=       Grid_istochnikiTableView.DataController.Values[i, 6];
    ParamByName('ID_STAT').AsInt64 :=       Grid_istochnikiTableView.DataController.Values[i, 7];
    ParamByName('ID_KEKV').AsInt64 :=       Grid_istochnikiTableView.DataController.Values[i, 8];
    ParamByName('SUMMA').AsCurrency :=      Grid_istochnikiTableView.DataController.Values[i, 4];
    ExecProc;

        // -----------логирование добавления------------------------------------
           Dm.ReadDataSet.Close;
           Dm.ReadDataSet.SelectSQL.Clear;
           Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_InsOst' + '''' + ')';
           Dm.ReadDataSet.Open;
           DM.StProc.StoredProcName := 'CN_ACTION_HISTORY_INSERT';
           DM.StProc.Prepare;
           DM.StProc.ParamByName('ID_DOG_ROOT').AsInt64     := ID_DOG_ROOT;
           DM.StProc.ParamByName('ID_DOG').AsInt64          := ID_DOG;
           DM.StProc.ParamByName('ID_STUD').AsInt64         := ID_STUD;
           DM.StProc.ParamByName('ID_USER').AsInt64         := ID_User;
           DM.StProc.ParamByName('USER_NAME').AsString      := User_Name;
           DM.StProc.ParamByName('ID_ACTION').AsInt64       := Dm.ReadDataSet['ID_ACTION'];
           DM.StProc.ExecProc;
           Dm.ReadDataSet.Close;
   end;
  try
   Transaction.Commit;
   Close;
   all_right:= true;
   except
   Transaction.Rollback;
   close;
   end;
 end;
end
 else
  begin
  With DM.StProc do
  begin
   Transaction.StartTransaction;
   StoredProcName := 'CN_DT_STUD_SUM_ER_UPDATE';
   Prepare;
   ParamByName('ID_DOG_ROOT').AsInt64 :=       ID_DOG_ROOT;
   ParamByName('ID_STUD').AsInt64 :=           ID_STUD;
   ParamByName('SUM_ENTRY_REST').AsCurrency:=  0;
   ExecProc;

   for i := 0 to Length(Entry_Rest_Ids)-1 do begin
    StoredProcName := 'CN_DT_ENTRS_SMET_DELETE';
    Prepare;
    ParamByName('ID_ENTRS_SMET').AsInt64 := Entry_Rest_Ids[i];
    ExecProc;
   end;

           // -----------логирование добавления------------------------------------
           Dm.ReadDataSet.Close;
           Dm.ReadDataSet.SelectSQL.Clear;
           Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_InsOst' + '''' + ')';
           Dm.ReadDataSet.Open;
           DM.StProc.StoredProcName := 'CN_ACTION_HISTORY_INSERT';
           DM.StProc.Prepare;
           DM.StProc.ParamByName('ID_DOG_ROOT').AsInt64     := ID_DOG_ROOT;
           DM.StProc.ParamByName('ID_DOG').AsInt64          := ID_DOG;
           DM.StProc.ParamByName('ID_STUD').AsInt64         := ID_STUD;
           DM.StProc.ParamByName('ID_USER').AsInt64         := ID_User;
           DM.StProc.ParamByName('USER_NAME').AsString      := User_Name;
           DM.StProc.ParamByName('ID_ACTION').AsInt64       := Dm.ReadDataSet['ID_ACTION'];
           DM.StProc.ExecProc;
           Dm.ReadDataSet.Close;

   try
   Transaction.Commit;
   Close;
   all_right:= true;
   except
   Transaction.Rollback;
   close;
   end;
 end;
end;
 if all_right then Close;
end;

procedure TfrmEntryRest.DeleteButtonClick(Sender: TObject);
var i: Smallint;
begin
  If not Is_Admin then
    If fibCheckPermission('/ROOT/Contracts/cn_entryrest','Del') <> 0
     then
       Begin
        messagebox(handle,
        pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
        +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
        pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
       End;

  if Grid_istochnikiTableView.DataController.RecordCount = 0 then exit;
  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  Grid_istochnikiTableView.DataController.DeleteFocused;
  if Grid_istochnikiTableView.DataController.RecordCount = 0
   then SummaEdit.Value:= 0
   else SummaEdit.Value := Grid_istochnikiTableView.DataController.Summary.FooterSummaryValues[0];
end;

procedure TfrmEntryRest.Grid_istochnikiTableViewDblClick(Sender: TObject);
begin
  EditButtonClick(Sender);
end;

end.
