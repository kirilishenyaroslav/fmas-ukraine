//******************************************************************************
// Проект "Контракты"
// Льготы по контракту
// Чернявский А.Э. 2005г.
//******************************************************************************

unit cn_Lgots_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cn_DM_Lg, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cn_Common_Types, cxCurrencyEdit, cxLabel,
  cxGroupBox, cn_Lgots_AddEdit, cn_Common_Messages, cn_Lgots_funcs, cnConsts_Messages,
  StdCtrls, Buttons, Registry;

type TLgotaCookies = record
 IsIt         : Boolean;
 Beg_Date     :TDate;
 End_Date     :TDate;
 Percent      : Currency;
 Summa        : Currency;
 ID_TYPE_LGOT : Int64;
 ORDER_DATE   : TDate;
 ORDER_NUM    : String;
 OSNOVANIE    : String;
 NameTypeLgot : String;
end;

type
  TfrmLgots = class(TForm)
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
    SaveButton: TdxBarLargeButton;
    Grid: TcxGrid;
    LgotsView: TcxGridTableView;
    GridLevel: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    cxGridTableViewStyleSheet2: TcxGridTableViewStyleSheet;
    GroupBox: TcxGroupBox;
    FIO_Label: TcxLabel;
    date_beg: TcxGridColumn;
    date_end: TcxGridColumn;
    summa: TcxGridColumn;
    percent: TcxGridColumn;
    ID_TYPE_LGOT: TcxGridColumn;
    ORDER_DATE: TcxGridColumn;
    ORDER_NUM: TcxGridColumn;
    OSNOVANIE: TcxGridColumn;
    DATE_REG: TcxGridColumn;
    NameTypeLgot: TcxGridColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM:TDM_Lg;
    Entry_Lg_Ids:array of int64;
    ID_DOG_ROOT : Int64;
    ID_STUD     : Int64;
    ID_DOG, id_user : int64;
    User_Name : string;
    function  LoadCookies (): TLgotaCookies;
    procedure SaveCookies (LgotaCookies: TLgotaCookies);
    procedure FormIniLanguage;
  public
    res:Variant;
    constructor  Create(AParameter:TcnSimpleParamsEx);reintroduce;
  end;


implementation

uses FIBQuery;

{$R *.dfm}

constructor TfrmLgots.Create(AParameter:TcnSimpleParamsEx);
var i: integer;
begin
Screen.Cursor:=crHourGlass;
inherited Create(AParameter.Owner);
FormIniLanguage();
 LgotsView.Items[0].DataBinding.ValueTypeClass := TcxDateTimeValueType;
 LgotsView.Items[1].DataBinding.ValueTypeClass := TcxDateTimeValueType;
 LgotsView.Items[2].DataBinding.ValueTypeClass := TcxCurrencyValueType;
 LgotsView.Items[3].DataBinding.ValueTypeClass := TcxCurrencyValueType;
 LgotsView.Items[4].DataBinding.ValueTypeClass := TcxLargeIntValueType;
 LgotsView.Items[5].DataBinding.ValueTypeClass := TcxDateTimeValueType;
 LgotsView.Items[6].DataBinding.ValueTypeClass := TcxStringValueType;
 LgotsView.Items[7].DataBinding.ValueTypeClass := TcxStringValueType;
 LgotsView.Items[8].DataBinding.ValueTypeClass := TcxDateTimeValueType;
 LgotsView.Items[9].DataBinding.ValueTypeClass := TcxStringValueType;

    ID_DOG_ROOT := AParameter.cnParamsToPakage.ID_DOG_ROOT;
    ID_STUD     := AParameter.cnParamsToPakage.ID_STUD;
    FIO_Label.Caption:= AParameter.cnParamsToPakage.FIO;
    ID_DOG      := AParameter.cnParamsToPakage.ID_DOG;
    id_user     := AParameter.ID_User;
    User_Name   := AParameter.User_Name;

DM:=TDM_LG.Create(Self);
DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_LGOT_SELECT('+
                                       inttostr(AParameter.cnParamsToPakage.ID_DOG_ROOT)
                                       + ','+ inttostr(AParameter.cnParamsToPakage.ID_STUD)
                                       +')';
DM.DB.Handle:=AParameter.Db_Handle;
DM.ReadDataSet.Open;
DM.ReadDataSet.FetchAll;

if DM.ReadDataSet.RecordCount >0 then
SetLength(Entry_Lg_Ids, DM.ReadDataSet.RecordCount);

 if DM.ReadDataSet.RecordCount <> 0 then
  begin
   for i := 0 to DM.ReadDataSet.RecordCount-1  do
    begin
     LgotsView.DataController.RecordCount :=  LgotsView.DataController.RecordCount+1;
     LgotsView.DataController.Values[i, 0] := DM.ReadDataSet['DATE_BEG'];
     LgotsView.DataController.Values[i, 1] := DM.ReadDataSet['DATE_END'];
     LgotsView.DataController.Values[i, 2] := DM.ReadDataSet['PERSENT'];
     LgotsView.DataController.Values[i, 3] := DM.ReadDataSet['SUMMA'];
     LgotsView.DataController.Values[i, 4] := DM.ReadDataSet['ID_TYPE_LGOT'];
     LgotsView.DataController.Values[i, 5] := DM.ReadDataSet['ORDER_DATE'];
     LgotsView.DataController.Values[i, 6] := DM.ReadDataSet['ORDER_NUM'];
     LgotsView.DataController.Values[i, 7] := DM.ReadDataSet['OSNOVANIE'];
     LgotsView.DataController.Values[i, 8] := DM.ReadDataSet['DATE_REG'];
     LgotsView.DataController.Values[i, 9] := DM.ReadDataSet['NAME_TYPE_LGOT'];
     Entry_Lg_Ids[i]:= DM.ReadDataSet['ID_LGOT'];
     DM.ReadDataSet.Next;
    end;
  end;
  DM.ReadDataSet.close;

Screen.Cursor:=crDefault;
end;

procedure TfrmLgots.FormIniLanguage;
begin
 PLanguageIndex:=               cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      cnConsts.cn_Lgots_Sp[PLanguageIndex];
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 SaveButton.Caption :=          cnConsts.cn_Accept[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

  //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  cnConsts.cn_F10Btn_ShortCut[PLanguageIndex]     + cnConsts.cn_Accept[PLanguageIndex];
 StatusBar.Panels[4].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

 date_beg.Caption := cnConsts.cn_grid_Date_Beg[PLanguageIndex];
 date_end.Caption := cnConsts.cn_grid_Date_End[PLanguageIndex];
 summa.Caption    := cnConsts.cn_Summa_Column[PLanguageIndex];
 percent.Caption  := cnConsts.cn_Persent_Column[PLanguageIndex];
end;

procedure TfrmLgots.SaveCookies (LgotaCookies: TLgotaCookies);
var
  reg: TRegistry;
begin
     reg := TRegistry.Create;
      try
       reg.RootKey:=HKEY_CURRENT_USER;
       if  reg.OpenKey('\Software\Contracts\Cookies\Lgota',True) then
       begin
         reg.WriteString('Beg_Date', DateToStr(LgotaCookies.Beg_Date));
         reg.WriteString('End_Date', DateToStr(LgotaCookies.End_Date));
         reg.WriteString('Percent',  FloatToStr(LgotaCookies.Percent));
         reg.WriteString('Summa',    FloatToStr(LgotaCookies.Summa));
         reg.WriteString('ID_TYPE_LGOT', IntToStr(LgotaCookies.ID_TYPE_LGOT));
         reg.WriteString('ORDER_DATE',   DateToStr(LgotaCookies.ORDER_DATE));
         reg.WriteString('ORDER_NUM',    LgotaCookies.ORDER_NUM);
         reg.WriteString('OSNOVANIE',    LgotaCookies.OSNOVANIE);
         reg.WriteString('NameTypeLgot', LgotaCookies.NameTypeLgot);
       end
      finally
       reg.Free;
     end;
end;

function  TfrmLgots.LoadCookies (): TLgotaCookies;
var
  reg: TRegistry;
  LgotaCookies : TLgotaCookies;
begin
     reg := TRegistry.Create;
      try
       reg.RootKey:=HKEY_CURRENT_USER;
       LgotaCookies.IsIt := False;
       if  reg.OpenKey('\Software\Contracts\Cookies\Lgota',False) then
       begin
         LgotaCookies.Beg_Date := StrToDate(reg.ReadString('Beg_Date')) ;
         LgotaCookies.End_Date := StrToDate(reg.ReadString('End_Date')) ;
         LgotaCookies.Percent :=  StrToCurr(reg.ReadString('Percent')) ;
         LgotaCookies.Summa :=    StrToCurr(reg.ReadString('Summa')) ;
         LgotaCookies.ID_TYPE_LGOT := StrToInt(reg.ReadString('ID_TYPE_LGOT')) ;
         LgotaCookies.ORDER_DATE :=   StrToDate(reg.ReadString('ORDER_DATE')) ;
         LgotaCookies.ORDER_NUM :=              reg.ReadString('ORDER_NUM') ;
         LgotaCookies.OSNOVANIE :=              reg.ReadString('OSNOVANIE') ;
         LgotaCookies.NameTypeLgot :=           reg.ReadString('NameTypeLgot') ;
         LgotaCookies.IsIt := True;
         Result := LgotaCookies;
       end
      finally
       reg.Free;
     end;
end;

procedure TfrmLgots.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmLgots.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DM.Free;
end;

procedure TfrmLgots.AddButtonClick(Sender: TObject);
var
  ViewForm: TfrmLgots_AddEdit;
  LgotaCookiesLoad :TLgotaCookies;
  LgotaCookiesSave :TLgotaCookies;
begin
  ViewForm:= TfrmLgots_AddEdit.create(self, PLanguageIndex, Dm.DB.Handle);
  ViewForm.Caption:=  cnConsts.cn_InsertBtn_Caption[PLanguageIndex];

  // загружаю кукисы
  LgotaCookiesLoad := LoadCookies;
  if LgotaCookiesLoad.IsIt
   then
    begin
     ViewForm.DatePrikaz.Date  := LgotaCookiesLoad.ORDER_DATE;
     ViewForm.NomPrikaz.Text   := LgotaCookiesLoad.ORDER_NUM;
     ViewForm.TypeLg_Edit.Text := LgotaCookiesLoad.NameTypeLgot;
     ViewForm.ID_TYPE_LGOT     := LgotaCookiesLoad.ID_TYPE_LGOT;

     if  LgotaCookiesLoad.Percent = 0
      then   // процент ноль
       begin
        ViewForm.PercentEdit.Value :=  LgotaCookiesLoad.Summa ;
        ViewForm.Summa_RadioButton.Checked := true;
       end
      else
       begin
        ViewForm.PercentEdit.Value := LgotaCookiesLoad.Percent;
        ViewForm.Percent_RadioButton.Checked := true;
       end;
     ViewForm.Date_Beg.Date   := LgotaCookiesLoad.Beg_Date;
     ViewForm.Date_End.Date   := LgotaCookiesLoad.End_Date;
     ViewForm.Osnovanie_Edit.Text := LgotaCookiesLoad.OSNOVANIE;
    end
   else ViewForm.ID_TYPE_LGOT := -1;

  if ViewForm.ShowModal = mrOk then
   begin
    LgotsView.DataController.RecordCount := LgotsView.DataController.RecordCount + 1;
    LgotsView.DataController.Values[LgotsView.DataController.RecordCount - 1, 0] := ViewForm.Date_Beg.Date;
    LgotsView.DataController.Values[LgotsView.DataController.RecordCount - 1, 1] := ViewForm.Date_End.Date;
    if ViewForm.Percent_RadioButton.Checked then
     begin
      LgotsView.DataController.Values[LgotsView.DataController.RecordCount - 1, 2] := ViewForm.PercentEdit.Value;
      LgotsView.DataController.Values[LgotsView.DataController.RecordCount - 1, 3] := 0;
     end
     else
     begin
      LgotsView.DataController.Values[LgotsView.DataController.RecordCount - 1, 2] := 0;
      LgotsView.DataController.Values[LgotsView.DataController.RecordCount - 1, 3] := ViewForm.PercentEdit.Value;
     end;
    LgotsView.DataController.Values[LgotsView.DataController.RecordCount - 1, 4] := ViewForm.ID_TYPE_LGOT ; // id_type_lgot
    LgotsView.DataController.Values[LgotsView.DataController.RecordCount - 1, 5] := ViewForm.DatePrikaz.Date;
    LgotsView.DataController.Values[LgotsView.DataController.RecordCount - 1, 6] := ViewForm.NomPrikaz.Text;
    LgotsView.DataController.Values[LgotsView.DataController.RecordCount - 1, 7] := ViewForm.Osnovanie_Edit.Text;
    LgotsView.DataController.Values[LgotsView.DataController.RecordCount - 1, 9] := ViewForm.TypeLg_Edit.Text;

    // сохраняю кукисы
    LgotaCookiesSave.Beg_Date       := ViewForm.Date_Beg.Date;
    LgotaCookiesSave.End_Date       := ViewForm.Date_End.Date;
    if ViewForm.Percent_RadioButton.Checked then
     begin
      LgotaCookiesSave.Percent     := ViewForm.PercentEdit.Value;
      LgotaCookiesSave.Summa       := 0;
     end
     else
      begin
       LgotaCookiesSave.Percent   := 0;
       LgotaCookiesSave.Summa     := ViewForm.PercentEdit.Value;
      end;
    LgotaCookiesSave.ID_TYPE_LGOT   := ViewForm.ID_TYPE_LGOT;
    LgotaCookiesSave.ORDER_DATE     := ViewForm.DatePrikaz.Date;
    LgotaCookiesSave.ORDER_NUM      := ViewForm.NomPrikaz.Text;
    LgotaCookiesSave.OSNOVANIE      := ViewForm.Osnovanie_Edit.Text;
    LgotaCookiesSave.NameTypeLgot   := ViewForm.TypeLg_Edit.Text;
    SaveCookies(LgotaCookiesSave);

    LgotsView.DataController.FocusedRecordIndex:=  LgotsView.DataController.RecordCount - 1;
   end;

 ViewForm.Free;
end;

procedure TfrmLgots.DeleteButtonClick(Sender: TObject);
var i: Smallint;
begin
if LgotsView.DataController.RecordCount = 0 then exit;
 i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
 if ((i = 7) or (i= 2)) then exit;

LgotsView.DataController.DeleteFocused;
end;


procedure TfrmLgots.EditButtonClick(Sender: TObject);
var  ViewForm: TfrmLgots_AddEdit;
begin
if LgotsView.DataController.RecordCount = 0 then exit;
ViewForm:= TfrmLgots_AddEdit.create(self, PLanguageIndex, Dm.DB.Handle);
ViewForm.Caption:=  cnConsts.cn_EditBtn_Caption[PLanguageIndex];

ViewForm.Date_Beg.Date:=  LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 0];
ViewForm.Date_End.Date:=  LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 1];
if  LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 2] = 0 then   // процент ноль
  begin
  ViewForm.PercentEdit.Value :=  LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 3];
  ViewForm.Summa_RadioButton.Checked := true;
  end
 else
 begin
  ViewForm.PercentEdit.Value :=  LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 2];
  ViewForm.Percent_RadioButton.Checked := true;
 end;
ViewForm.DatePrikaz.Date:=        LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 5];
ViewForm.NomPrikaz.Text:=         LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 6];
ViewForm.Osnovanie_Edit.Text:=    LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 7];
if LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 4] <> null then
ViewForm.ID_TYPE_LGOT :=          LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 4];
if LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 9] <> null then
ViewForm.TypeLg_Edit.Text :=      LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 9];

if ViewForm.ShowModal = mrOk then
 begin
    LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 0] := ViewForm.Date_Beg.Date;
    LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 1] := ViewForm.Date_End.Date;
    if ViewForm.Percent_RadioButton.Checked then
    begin
      LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 2] := ViewForm.PercentEdit.Value;
      LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 3] := 0;
    end
     else
    begin
      LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 2] := 0;
      LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 3] := ViewForm.PercentEdit.Value;
    end;
    LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 4] := ViewForm.ID_TYPE_LGOT ; // id_type_lgot
    LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 5] := ViewForm.DatePrikaz.Date;
    LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 6] := ViewForm.NomPrikaz.Text;
    LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 7] := ViewForm.Osnovanie_Edit.Text;
    LgotsView.DataController.Values[LgotsView.DataController.FocusedRecordIndex, 9] := ViewForm.TypeLg_Edit.Text;
 end;
 ViewForm.Free;

end;

procedure TfrmLgots.FormShow(Sender: TObject);
begin
if LgotsView.DataController.RecordCount > 0 then
   LgotsView.DataController.FocusedRecordIndex := 0;
end;

procedure TfrmLgots.SaveButtonClick(Sender: TObject);
var i: integer;
CN_ORDERTYPE_LGOTA : int64;
begin
  if cn_CheckCrossPeriods(LgotsView, 0, 1, 2, 3, true)
   then showmessage(pchar(cnConsts_Messages.cn_PercentPeriods_Cross[PLanguageIndex]));

  if cn_CheckCrossPeriods(LgotsView, 0, 1, 2, 3, false)
   then showmessage(pchar(cnConsts_Messages.cn_SummaPeriods_Cross[PLanguageIndex]));

  Dm.ReadDataSet.Close;
  Dm.ReadDataSet.SelectSQL.Clear;
  Dm.ReadDataSet.SelectSQL.Text := 'select CN_ORDERTYPE_LGOTA from CN_PUB_SYS_DATA_GET_ALL';
  Dm.ReadDataSet.Open;
  CN_ORDERTYPE_LGOTA := Dm.ReadDataSet['CN_ORDERTYPE_LGOTA'];
  Dm.ReadDataSet.Close;

  // изменение льгот
  Screen.Cursor := crHourGlass;
  if LgotsView.DataController.RecordCount > 0 then
   begin
    With DM.StProc do
     begin
      Transaction.StartTransaction;
      for i := 0 to Length(Entry_Lg_Ids)-1 do
       begin
        StoredProcName := 'CN_DT_LGOT_DELETE';
        Prepare;
        ParamByName('ID_LGOT').AsInt64 := Entry_Lg_Ids[i];
        ExecProc;
       end;

      // удаляю все приказы
      StoredProcName := 'CN_DT_ORDERS_DEL_BY_TYPE';
      Prepare;
      ParamByName('ID_ORDER').AsInt64 := CN_ORDERTYPE_LGOTA;
      ParamByName('ID_STUD').AsInt64 := ID_STUD;
      ExecProc;

      for i := 0 to LgotsView.DataController.RecordCount - 1 do
       begin
        StoredProcName := 'CN_DT_LGOT_INSERT';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64 :=   ID_DOG_ROOT;
        ParamByName('ID_STUD').AsInt64 :=       ID_STUD;
        ParamByName('ID_TYPE_LGOT').AsInt64 := LgotsView.DataController.Values[i, 4];
        ParamByName('PERSENT').AsCurrency :=   LgotsView.DataController.Values[i, 2];
        ParamByName('SUMMA').AsCurrency :=     LgotsView.DataController.Values[i, 3];
        ParamByName('DATE_BEG').AsDate :=      LgotsView.DataController.Values[i, 0];
        ParamByName('DATE_END').AsDate :=      LgotsView.DataController.Values[i, 1];
        ParamByName('ORDER_DATE').AsDate :=    LgotsView.DataController.Values[i, 5];
        ParamByName('ORDER_NUM').AsString :=   LgotsView.DataController.Values[i, 6];
        if LgotsView.DataController.Values[i, 7] <> null then
        ParamByName('OSNOVANIE').AsString :=   LgotsView.DataController.Values[i, 7];
        ExecProc;

        // добавляю все приказы по льготам
        StoredProcName := 'CN_DT_ORDERS_INSERT';
        Prepare;
        ParamByName('ID_ORDER').AsInt64       := CN_ORDERTYPE_LGOTA;
        ParamByName('ID_STUD').AsInt64        := ID_STUD;
        ParamByName('DATE_ORDER').AsDate      := LgotsView.DataController.Values[i, 5];
        ParamByName('NUM_ORDER').AsString     := LgotsView.DataController.Values[i, 6];
        ParamByName('COMMENTS').AsString      := 'автоматичне додавання наказу при роботі з пільгами';
        ExecProc;

    // -----------логирование добавления------------------------------------
           Dm.ReadDataSet.Close;
           Dm.ReadDataSet.SelectSQL.Clear;
           Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_Lg' + '''' + ')';
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
   except
   Transaction.Rollback;
   close;
   Screen.Cursor := crDefault;
   end;
 end;
end
 else
  begin
  With DM.StProc do
  begin
   Transaction.StartTransaction;
   for i := 0 to Length(Entry_Lg_Ids)-1 do begin
    StoredProcName := 'CN_DT_LGOT_DELETE';
    Prepare;
    ParamByName('ID_LGOT').AsInt64 := Entry_Lg_Ids[i];
    ExecProc;

        // удаляю все приказы
    StoredProcName := 'CN_DT_ORDERS_DEL_BY_TYPE';
    Prepare;
    ParamByName('ID_ORDER').AsInt64 := CN_ORDERTYPE_LGOTA;
    ParamByName('ID_STUD').AsInt64 := ID_STUD;
    ExecProc;

   end;

    // -----------логирование добавления------------------------------------
           Dm.ReadDataSet.Close;
           Dm.ReadDataSet.SelectSQL.Clear;
           Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_Lg' + '''' + ')';
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
   except
   Transaction.Rollback;
   close;
   Screen.Cursor := crDefault;
   end;
 end;
end;
Screen.Cursor := crDefault;
Close;
end;

end.
