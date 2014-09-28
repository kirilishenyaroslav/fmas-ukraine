unit cn_History_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxCalendar, cxCheckBox, cxInplaceContainer, cxDBTL, cxControls, cxTLData,
  cxClasses, cxLookAndFeelPainters, cxButtons, ibase, DM, cxMaskEdit, cnConsts,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, Menus,
  cxGridTableView, ImgList, dxBar, dxBarExtItems, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxGridCustomView, cxGrid,
  dxStatusBar, cn_Common_Types, cn_Common_Loader,cn_Periods, cxCurrencyEdit,
  Contract_Add_Edit, cxGroupBox,cxButtonEdit, cxRadioGroup,
  cn_Common_Messages,cnConsts_Messages ,cn_ContractsLis;

type
  TfrmHistory = class(TForm)
    CancelButton: TcxButton;
    Grid: TcxGrid;
    grdHistory: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
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
    PopupMenu1: TPopupMenu;
    AddPop: TMenuItem;
    EditPop: TMenuItem;
    DeletePop: TMenuItem;
    RefreshPop: TMenuItem;
    ExitPop: TMenuItem;
    clmn_Fio: TcxGridDBColumn;
    clmn_NumDog: TcxGridDBColumn;
    clmn_DATE_DOG: TcxGridDBColumn;
    clmn_DATE_BEG: TcxGridDBColumn;
    clmn_DATE_END: TcxGridDBColumn;
    clmn_DATE_DISS: TcxGridDBColumn;
    clmn_USE_BEG: TcxGridDBColumn;
    lrgbtnLog: TdxBarLargeButton;
    lrgbtnRastReason: TdxBarLargeButton;
    lrgbtnPeriods: TdxBarLargeButton;
    btnViewDetails: TdxBarLargeButton;
    btnSeparate: TdxBarLargeButton;
    btnUnion: TdxBarLargeButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure lrgbtnLogClick(Sender: TObject);
    procedure lrgbtnRastReasonClick(Sender: TObject);
    procedure lrgbtnPeriodsClick(Sender: TObject);
    procedure grdHistoryDblClick(Sender: TObject);
    procedure btnViewDetailsClick(Sender: TObject);
    procedure btnSeparateClick(Sender: TObject);
    procedure btnUnionClick(Sender: TObject);
  private
    DM:TDM_Contracts;
    LngIndex: Byte;
    procedure FormIniLanguage(Lang : byte);
  public
    ID_User: Int64;
    User_Name : string;
    num_dog : string;
    LModalResult : Integer;
    is_admin:Boolean;
    constructor Create(AOwner:TComponent; LanguageIndex : byte; DB_Handle:TISC_DB_HANDLE; ID_DOG_ROOT : int64;is_admin:Boolean);reintroduce;
  end;


implementation


{$R *.dfm}
constructor TfrmHistory.Create(AOwner:TComponent; LanguageIndex : byte; DB_Handle:TISC_DB_HANDLE; ID_DOG_ROOT : int64; is_admin:boolean);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AOwner);
  Self.is_admin:=is_admin;
 DM:=TDM_Contracts.Create(Self);
 DM.DB.Handle:=DB_Handle;
 DM.DataSet.SQLs.SelectSQL.clear;
 DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_DOG_ROOT_HISTORY_SELECT(' +
                                    inttostr(ID_DOG_ROOT) + ')';

 DM.DataSet.Open;
 grdHistory.DataController.DataSource := DM.DataSource;
 LngIndex := LanguageIndex;

 FormIniLanguage(LanguageIndex);

Screen.Cursor:=crDefault;
end;

procedure TfrmHistory.FormIniLanguage(Lang : byte);
begin
Caption:=        cnConsts.cn_History[Lang];
 // Грид
 clmn_Fio.Caption:=                  cnConsts.cn_grid_FIO_Column[Lang];
 clmn_DATE_DOG.Caption:=             cnConsts.cn_grid_Date_Dog_Column[Lang];
 clmn_NumDog.Caption:=               cnConsts.cn_grid_Num_Dog_Column[Lang];
 clmn_DATE_BEG.Caption:=             cnConsts.cn_grid_Date_Beg[Lang];
 clmn_DATE_END.Caption:=             cnConsts.cn_grid_Date_End[Lang];
 clmn_DATE_DISS.Caption:=            cnConsts.cn_DateDiss[Lang];
 clmn_USE_BEG.Caption:=               cnConsts.cn_Stamp[Lang];

 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[Lang];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[Lang];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[Lang];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[Lang];
 SelectButton.Caption :=        cnConsts.cn_SelectBtn_Caption[Lang];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[Lang];
 lrgbtnLog.Caption :=           cnConsts.cn_Log[Lang];
 lrgbtnRastReason.Caption :=    cnConsts.cn_Pri4inaRastorg[Lang];
 lrgbtnPeriods.Caption:=        cnConsts.cn_Periods_GroupBox[Lang];
 btnViewDetails.Caption :=      cnConsts.cn_ViewShort_Caption[Lang];
 btnSeparate.Caption :=         cnConsts.cn_btnSeparate[Lang];
 btnUnion.Caption :=            cnConsts.cn_btnUnion[Lang];
 end;

procedure TfrmHistory.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmHistory.ExitButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmHistory.lrgbtnLogClick(Sender: TObject);
var AParameter : TcnSimpleParamsEx;
begin
if grdHistory.DataController.RecordCount = 0 then exit;
 AParameter:= TcnSimpleParamsEx.Create;
 AParameter.Owner:=self;
 AParameter.Db_Handle:= DM.DB.Handle;
 AParameter.Formstyle:=fsNormal;
 AParameter.cnParamsToPakage.ID_DOG_ROOT:= DM.Dataset['ID_DOG_ROOT'];
 AParameter.cnParamsToPakage.ID_DOG:=      DM.Dataset['ID_DOG_LAST'];
 AParameter.cnParamsToPakage.ID_STUD:=     DM.Dataset['ID_STUD'];
 AParameter.WaitPakageOwner:= self;
 RunFunctionFromPackage(AParameter, 'Contracts\cn_Log.bpl','ShowLog');
 AParameter.Free;
 Screen.Cursor := crDefault;
end;

procedure TfrmHistory.lrgbtnRastReasonClick(Sender: TObject);
var InParameter : TcnSimpleParamsEx;
   locate: Integer;
begin
if grdHistory.DataController.RecordCount = 0 then exit;
if DM.DataSet['ISDISSDOG'] = 1 then
begin
 locate:= DM.DataSet.RecNo;
 InParameter:= TcnSimpleParamsEx.Create;
 InParameter.Owner:=self;
 InParameter.Db_Handle:= DM.DB.Handle;
 InParameter.Formstyle:=fsNormal;
// InParameter.AMode := View;
 InParameter.AMode := Edit;
 InParameter.cnParamsToPakage.ID_DOG_ROOT := DM.Dataset['ID_DOG_ROOT'];
 InParameter.cnParamsToPakage.ID_DOG      := DM.Dataset['ID_DOG_LAST'];
 InParameter.cnParamsToPakage.ID_STUD     := DM.Dataset['ID_STUD'];
 InParameter.cnParamsToPakage.FIO := DM.DataSet['FIO'];
 InParameter.WaitPakageOwner:= self;
 RunFunctionFromPackage(InParameter, 'Contracts\cn_dt_DissInfo.bpl','ShowDTDissInfo');
 InParameter.Free;
 Screen.Cursor := crDefault;
 DM.DataSet.CloseOpen(true);
 DM.DataSet.RecNo := locate;
end;
end;

procedure TfrmHistory.lrgbtnPeriodsClick(Sender: TObject);
var
ViewForm : TfrmPeriods;
ID_DOG_ROOT_Convert,ID_DOG_Convert: Int64;
i: Integer;
begin
 // информация по периодам оплат
 ViewForm := TfrmPeriods.Create(self);
 ID_DOG_ROOT_Convert:= DM.Dataset['ID_DOG_ROOT'];
 ID_DOG_Convert:= DM.Dataset['ID_DOG_LAST'];

ViewForm.Grid_payTableView.Columns[0].Caption:=     cnConsts.cn_grid_Date_Beg[LngIndex];
ViewForm.Grid_payTableView.Columns[1].Caption:=     cnConsts.cn_grid_Date_End[LngIndex];
ViewForm.Grid_payTableView.Columns[2].Caption:=     cnConsts.cn_Date_Opl_Column[LngIndex];
ViewForm.Grid_payTableView.Columns[3].Caption:=     cnConsts.cn_Summa_Column[LngIndex];
ViewForm.num_year.Caption:=                         cnConsts.cn_AcademYear[LngIndex];
ViewForm.Caption := lrgbtnPeriods.Caption;

 DM.ReadDataSet.SelectSQL.Clear;
 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_STAGE_OPL_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ') order by DATE_BEG';
 DM.ReadDataSet.Open;
 DM.ReadDataSet.FetchAll;
 DM.ReadDataSet.First;
 for i:=0 to DM.ReadDataSet.RecordCount-1 do
  begin
   ViewForm.Grid_payTableView.DataController.RecordCount := ViewForm.Grid_payTableView.DataController.RecordCount + 1;
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 0]  := DM.ReadDataSet['DATE_BEG'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 1]  := DM.ReadDataSet['DATE_END'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['DATE_PAY'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 3]  := DM.ReadDataSet['SUMMA'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 4]  := DM.ReadDataSet['ID_PAYER'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 5]  := DM.ReadDataSet['ID_MAN'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 6]  := DM.ReadDataSet['NUM_YEAR'];
   DM.ReadDataSet.Next;
  end;
 DM.ReadDataSet.Close;

 ViewForm.ShowModal;
end;

procedure TfrmHistory.grdHistoryDblClick(Sender: TObject);
begin
lrgbtnPeriodsClick(Sender);
end;

procedure EnableFormComponents(IsEnable: Boolean; Form : TForm);
var i: Integer;
begin
 for i:=0 to Form.ComponentCount-1 do
  begin
//     if (Form.Components[i].ClassType=TcxGroupBox) then
//     (Form.Components[i] as TcxGroupBox).Enabled :=IsEnable;
     if (Form.Components[i].ClassType=TdxBarButton ) then
     (Form.Components[i] as TdxBarButton).Enabled :=IsEnable;
     if (Form.Components[i].ClassType=TcxButton) then
     (Form.Components[i] as TcxButton).Enabled :=IsEnable;
     if (Form.Components[i].ClassType=TcxTextEdit) then
     (Form.Components[i] as TcxTextEdit).Properties.ReadOnly := not IsEnable;
     if (Form.Components[i].ClassType=TcxDateEdit) then
     (Form.Components[i] as TcxDateEdit).Properties.ReadOnly := not IsEnable;
     if (Form.Components[i].ClassType=TcxButtonEdit) then
     (Form.Components[i] as TcxButtonEdit).Enabled :=IsEnable;
     if (Form.Components[i].ClassType=TcxRadioButton) then
     (Form.Components[i] as TcxRadioButton).Enabled :=IsEnable;
  end;
end;

procedure TfrmHistory.btnViewDetailsClick(Sender: TObject);
var ViewForm :Tfrm_Contracts_AE;
 ID_RATE_ACCOUNT_Convert, ID_DOG_ROOT_Convert, ID_DOG_Convert: Int64;
 i: Integer;
begin
 ViewForm := Tfrm_Contracts_AE.Create(Self, LngIndex, DM.DB.Handle, 0, is_admin);
 EnableFormComponents(False, ViewForm);
 ViewForm.CancelButton.Enabled := True;
 ViewForm.ComboPayersFilter.Enabled:= False;

  ViewForm.Num_Dog_Edit.Text             :=  DM.Dataset['NUM_DOG'];
  ViewForm.Date_Zakl_DateEdit.Date       :=  strtodate(DM.Dataset['DATE_DOG']);
  if DM.Dataset['DATE_BEG'] <> null then
  ViewForm.Date_Beg_DateEdit.Date        :=  strtodate(DM.Dataset['DATE_BEG']);
  if DM.Dataset['DATE_END'] <> null then
  ViewForm.Date_End_DateEdit.Date        :=  strtodate(DM.Dataset['DATE_END']);


   ViewForm.Base_Dog_RadioButton.Visible := False;
   ViewForm.Addit_Dog_RadioButton.Visible := False;

 DM.ReadDataSet.Close;
 DM.ReadDataSet.SelectSQL.Clear;
 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_TYPEDOG_PARAMS_BY_ID(' + IntToStr(DM.Dataset['ID_TYPE_DOG']) + ')';
 DM.ReadDataSet.Open;
   if DM.ReadDataSet['CODENAME'] <> null then
   ViewForm.TypeDogEdit.Text := DM.ReadDataSet['CODENAME'];
   if DM.ReadDataSet['NAME'] <> null then
   //ViewForm.NameTypeDogLabel.Caption := DM.ReadDataSet['NAME'];
   ViewForm.ID_TYPE_DOG := DM.Dataset['ID_TYPE_DOG'];
 DM.ReadDataSet.Close;

  // rate_account
 if DM.DataSet['ID_INT_ACCOUNT']<> null then
 begin
 DM.ReadDataSet.SelectSQL.Clear;
 ID_RATE_ACCOUNT_Convert := DM.DataSet['ID_INT_ACCOUNT'];
 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_RATEACC_BY_ID(' + IntToStr(ID_RATE_ACCOUNT_Convert) + ')';
 DM.ReadDataSet.Open;
 ViewForm.Accounts.Text  := DM.ReadDataSet['RATE_ACCOUNT'];
 ViewForm.ID_INT_Account := DM.DataSet['ID_INT_ACCOUNT'];
 //ViewForm.Account_Label.Caption :=DM.ReadDataSet['NAME_MFO'];
 DM.ReadDataSet.Close;
 end;

 // работает DM.ReadDataSet - забиваем гриды информацией
// информация по студенту
 DM.ReadDataSet.SelectSQL.Clear;
 ID_DOG_ROOT_Convert := DM.DataSet['ID_DOG_ROOT'];
 ID_DOG_Convert      := DM.DataSet['ID_DOG_LAST'];
 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_ALL_STUDINFO_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ')';
 DM.ReadDataSet.Open;
 DM.ReadDataSet.FetchAll;
 DM.ReadDataSet.First;
 for i:=0 to DM.ReadDataSet.RecordCount-1 do
  begin
   ViewForm.Grid_fioTableView.DataController.RecordCount := ViewForm.Grid_fioTableView.DataController.RecordCount + 1;
   ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 0]  := DM.ReadDataSet['FIO_PEOPLE'];
{ид_ман}
   ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 17] := DM.ReadDataSet['ID_MAN'];
   if DM.ReadDataSet['ID_MAN_PARENT'] <> null then
    begin
     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 20] := DM.ReadDataSet['ID_MAN_PARENT'];
     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 21]  := DM.ReadDataSet['FIO_PORUCHITEL'];
    end;
{дата_начала}        ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 1] :=  DM.ReadDataSet['DATE_BEG'];
{дата_конца}         ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 2] :=  DM.ReadDataSet['DATE_END'];
{факультет}          ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 3] :=  DM.ReadDataSet['NAME_FACUL'];
{специальность}      ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 4] :=  DM.ReadDataSet['NAME_SPEC'];
{группа}             ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 5] :=  DM.ReadDataSet['NAME_GROUP'];
{форма_обучения}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 6] :=  DM.ReadDataSet['NAME_FORM_STUD'];
{категория_обучения} ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 7] :=  DM.ReadDataSet['NAME_KAT_STUD'];
{национальность}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 8] :=  DM.ReadDataSet['NAME_NAZIONAL'];
{курс}               ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 9] :=  DM.ReadDataSet['KURS'];
{сумма}              ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 10] := DM.ReadDataSet['SUMMA_INF'];

{ид_факультета}      ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 11] := DM.ReadDataSet['ID_FACUL'];
{ид_спец}            ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 12] := DM.ReadDataSet['ID_SPEC'];
{ид_группы}          ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 13] := DM.ReadDataSet['ID_GROUP'];
{ид_формыобуч}       ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 14] := DM.ReadDataSet['ID_FORM_STUD'];
{ид_категоробуч}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 15] := DM.ReadDataSet['ID_KAT_STUD'];
{ид_национал}        ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 16] := DM.ReadDataSet['ID_NATIONAL'];
{ид_студ}            ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 18] := DM.ReadDataSet['ID_STUD'];
{SUM_ENTRY_REST}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 19] := DM.ReadDataSet['SUM_ENTRY_REST'];
  DM.ReadDataSet.Next;
  end;
 DM.ReadDataSet.Close;

  // информация по плательщикам
 DM.ReadDataSet.SelectSQL.Clear;
 ID_DOG_ROOT_Convert := DM.DataSet['ID_DOG_ROOT'];
 ID_DOG_Convert      := DM.DataSet['ID_DOG_LAST'];
 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_PAYER_STAGE_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ')';
 DM.ReadDataSet.Open;
 DM.ReadDataSet.FetchAll;
 DM.ReadDataSet.First;
 for i:=0 to DM.ReadDataSet.RecordCount-1 do
  begin
   ViewForm.Grid_payersTableView.DataController.RecordCount := ViewForm.Grid_payersTableView.DataController.RecordCount + 1;
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 0]  := DM.ReadDataSet['FIO_PAYER'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 1]  := DM.ReadDataSet['NAME_STAGE'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 3]  := DM.ReadDataSet['ID_TYPE_PAYER'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 4]  := DM.ReadDataSet['ID_TYPE_STAGE'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 5]  := DM.ReadDataSet['ISPERCENT'];
   if DM.ReadDataSet['ISPERCENT'] =1 then
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['PERSENT']
   else
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['SUMMA'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 6]  := DM.ReadDataSet['ID_PAYER'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 7]  := DM.ReadDataSet['ID_RATE_ACCOUNT'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 8]  := DM.ReadDataSet['MFO'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 9]  := DM.ReadDataSet['RATE_ACCOUNT'];
   if DM.ReadDataSet['ID_CUST_MEN']<> null then
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 10]  := DM.ReadDataSet['ID_CUST_MEN'];
   DM.ReadDataSet.Next;
  end;
 DM.ReadDataSet.Close;

 // информация по сметам
 DM.ReadDataSet.SelectSQL.Clear;
 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_DOG_SMET_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ')';
 DM.ReadDataSet.Open;
 DM.ReadDataSet.FetchAll;
 DM.ReadDataSet.First;
 for i:=0 to DM.ReadDataSet.RecordCount-1 do
  begin
   ViewForm.Grid_istochnikiTableView.DataController.RecordCount := ViewForm.Grid_istochnikiTableView.DataController.RecordCount + 1;
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 0]  := DM.ReadDataSet['KOD_SM'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 1]  := DM.ReadDataSet['KOD_RAZD'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['KOD_ST'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 3]  := DM.ReadDataSet['KOD_KEKV'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 4]  := DM.ReadDataSet['PERSENT'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 5]  := DM.ReadDataSet['ID_SMET'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 6]  := DM.ReadDataSet['ID_RAZD'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 7]  := DM.ReadDataSet['ID_STAT'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 8]  := DM.ReadDataSet['ID_KEKV'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 9]  := DM.ReadDataSet['ID_MAN'];
   DM.ReadDataSet.Next;
  end;
 DM.ReadDataSet.Close;

 // информация по периодам оплат
 DM.ReadDataSet.SelectSQL.Clear;
 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_STAGE_OPL_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ') order by DATE_BEG';
 DM.ReadDataSet.Open;
 DM.ReadDataSet.FetchAll;
 DM.ReadDataSet.First;
 for i:=0 to DM.ReadDataSet.RecordCount-1 do
  begin
   ViewForm.Grid_payTableView.DataController.RecordCount := ViewForm.Grid_payTableView.DataController.RecordCount + 1;
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 0]  := DM.ReadDataSet['DATE_BEG'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 1]  := DM.ReadDataSet['DATE_END'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['DATE_PAY'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 3]  := DM.ReadDataSet['SUMMA'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 4]  := DM.ReadDataSet['ID_PAYER'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 5]  := DM.ReadDataSet['ID_MAN'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 6]  := DM.ReadDataSet['NUM_YEAR'];
   DM.ReadDataSet.Next;
  end;
 DM.ReadDataSet.Close;

 ViewForm.ShowModal;
end;

procedure TfrmHistory.btnSeparateClick(Sender: TObject);
var i: Integer;
    DMl: TDM_Contracts;
    ID_DOG_ROOT_NEW,ID_STUD_GEN : Int64;
begin
 i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[LngIndex], cnConsts_Messages.cn_warning_Execute[LngIndex], mtConfirmation, [mbYes, mbNo]);
 if ((i = 7) or (i= 2)) then exit;

 DMl:=TDM_Contracts.Create(Self);
 DMl.DB.Handle:=DM.DB.Handle;

   With DMl.StProc do
  try
           StoredProcName := 'CN_DT_DOG_ROOT_SEPARATE';
           Transaction.StartTransaction;
           Prepare;
           ParamByName('ID_DOG_ROOT').AsInt64     := DM.Dataset['ID_DOG_ROOT'];
           ParamByName('ID_DOG').AsInt64          := DM.Dataset['ID_DOG_LAST'];
           ParamByName('ID_STUD').AsInt64         := DM.Dataset['ID_STUD'];
           ExecProc;
            ID_DOG_ROOT_NEW:=ParamByName('ID_DOG_ROOT_NEW').AsInt64;
            ID_STUD_GEN:=ParamByName('ID_STUD_GEN').AsInt64;
                  // -----------логирование восстановления ------------------------------------
           Dm.ReadDataSet.Close;
           Dm.ReadDataSet.SelectSQL.Clear;
           Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_Separate' + '''' + ')';
           Dm.ReadDataSet.Open;

           StoredProcName := 'CN_ACTION_HISTORY_INSERT';
           Prepare;
           ParamByName('ID_DOG_ROOT').AsInt64     := DM.Dataset['ID_DOG_ROOT'];
           ParamByName('ID_DOG').AsInt64          := DM.DataSet['ID_DOG_LAST'];
           ParamByName('ID_STUD').AsInt64         := DM.Dataset['ID_STUD'];
           ParamByName('ID_USER').AsInt64         := ID_User;
           ParamByName('USER_NAME').AsString      := User_Name;
           ParamByName('ID_ACTION').AsInt64       := Dm.ReadDataSet['ID_ACTION'];
           ExecProc;
           StoredProcName := 'CN_ACTION_HISTORY_INSERT';
           Prepare;
           ParamByName('ID_DOG_ROOT').AsInt64     := ID_DOG_ROOT_NEW;
           ParamByName('ID_DOG').AsInt64          := DM.DataSet['ID_DOG_LAST'];
           ParamByName('ID_STUD').AsInt64         := ID_STUD_GEN;
           ParamByName('ID_USER').AsInt64         := ID_User;
           ParamByName('USER_NAME').AsString      := User_Name;
           ParamByName('ID_ACTION').AsInt64       := Dm.ReadDataSet['ID_ACTION'];
           ExecProc;

           Dm.ReadDataSet.Close;
           Transaction.Commit;     // коммит общей транзакции
           Dm.DataSet.CloseOpen(true);
      except
          Transaction.Rollback;
          DMl.Free;
          Dm.ReadDataSet.Close;
          raise;
       end;

end;

procedure TfrmHistory.btnUnionClick(Sender: TObject);
var ViewForm : TfrmContractsReestr;
var i: Integer;
    DMl: TDM_Contracts;
    id_dog_root_as_int,
    id_dog_as_int,
    id_stud_as_int,
    id_dog_root_new_as_int,
    id_dog_new_as_int,
    id_stud_new_as_int : Int64;
begin
 i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[LngIndex], cnConsts_Messages.cn_warning_Execute[LngIndex], mtConfirmation, [mbYes, mbNo]);
 if ((i = 7) or (i= 2)) then exit;

 DMl:=TDM_Contracts.Create(Self);
 DMl.DB.Handle:=DM.DB.Handle;

ViewForm := TfrmContractsReestr.Create(Self, DM.DB.Handle, LngIndex);
 if ViewForm.ShowModal = mrok then
  begin

   With DMl.StProc do
  try
           StoredProcName := 'CN_DT_DOG_ROOT_UNION';
           Transaction.StartTransaction;
           Prepare;
            id_dog_root_as_int := DM.Dataset['ID_DOG_ROOT'];
            id_dog_as_int      := DM.Dataset['ID_DOG_LAST'];
            id_stud_as_int     := DM.Dataset['ID_STUD'];
           ParamByName('ID_DOG_ROOT_OLD').AsInt64     := id_dog_root_as_int;
           ParamByName('ID_DOG_OLD').AsInt64          := id_dog_as_int;
           ParamByName('ID_STUD_OLD').AsInt64         := id_stud_as_int;
            id_dog_root_new_as_int := Res[0];
            id_dog_new_as_int      := Res[1];
            id_stud_new_as_int     := Res[2];
           ParamByName('ID_DOG_ROOT_NEW').AsInt64     := id_dog_root_new_as_int;
           ParamByName('ID_DOG_NEW').AsInt64          := id_dog_new_as_int;
           ParamByName('ID_STUD_NEW').AsInt64         := id_stud_new_as_int;
           ParamByName('DATE_BEG').AsDate             := Res[3];
           ExecProc;

           DMl.ReadDataSet.Close;
           DMl.ReadDataSet.SelectSQL.Clear;
           DMl.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_Union' + '''' + ')';
           DMl.ReadDataSet.Open;
           StoredProcName := 'CN_ACTION_HISTORY_INSERT';
           Prepare;
           ParamByName('ID_DOG_ROOT').AsInt64     := id_dog_root_as_int;
           ParamByName('ID_DOG').AsInt64          := id_dog_as_int;
           ParamByName('ID_STUD').AsInt64         := id_stud_as_int;
           ParamByName('ID_USER').AsInt64         := ID_User;
           ParamByName('USER_NAME').AsString      := User_Name;
           ParamByName('ID_ACTION').AsInt64       := DMl.ReadDataSet['ID_ACTION'];
           ExecProc;
           DMl.ReadDataSet.Close;

           // -----------логирование ------------------------------------
           // -----------логирование расторжения------------------------------------
           DMl.ReadDataSet.Close;
           DMl.ReadDataSet.SelectSQL.Clear;
           DMl.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_Rastorg' + '''' + ')';
           DMl.ReadDataSet.Open;
           StoredProcName := 'CN_ACTION_HISTORY_INSERT';
           Prepare;
           ParamByName('ID_DOG_ROOT').AsInt64     := id_dog_root_as_int;
           ParamByName('ID_DOG').AsInt64          := id_dog_as_int;
           ParamByName('ID_STUD').AsInt64         := id_stud_as_int;
           ParamByName('ID_USER').AsInt64         := ID_User;
           ParamByName('USER_NAME').AsString      := User_Name;
           ParamByName('ID_ACTION').AsInt64       := DMl.ReadDataSet['ID_ACTION'];
           ExecProc;
           DMl.ReadDataSet.Close;


           // -----------логирование переоформления------------------------------------
           DMl.ReadDataSet.Close;
           DMl.ReadDataSet.SelectSQL.Clear;
           DMl.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_Pereoform' + '''' + ')';
           DMl.ReadDataSet.Open;
           StoredProcName := 'CN_ACTION_HISTORY_INSERT';
           Prepare;
           ParamByName('ID_DOG_ROOT').AsInt64     := id_dog_root_as_int;
           ParamByName('ID_DOG').AsInt64          := id_dog_new_as_int;
           ParamByName('ID_STUD').AsInt64         := id_stud_as_int;
           ParamByName('ID_USER').AsInt64         := ID_User;
           ParamByName('USER_NAME').AsString      := User_Name;
           ParamByName('ID_ACTION').AsInt64       := DMl.ReadDataSet['ID_ACTION'];
           ExecProc;
           DMl.ReadDataSet.Close;

           DMl.ReadDataSet.Close;
           DMl.ReadDataSet.SelectSQL.Clear;
           DMl.ReadDataSet.SelectSQL.Text := 'select * from CN_ACTION_GET_ID_BY_NAME(' + '''' + 'cn_Union' + '''' + ')';
           DMl.ReadDataSet.Open;
           StoredProcName := 'CN_ACTION_HISTORY_INSERT';
           Prepare;
           ParamByName('ID_DOG_ROOT').AsInt64     := id_dog_root_as_int;
           ParamByName('ID_DOG').AsInt64          := id_dog_new_as_int;
           ParamByName('ID_STUD').AsInt64         := id_stud_as_int;
           ParamByName('ID_USER').AsInt64         := ID_User;
           ParamByName('USER_NAME').AsString      := User_Name;
           ParamByName('ID_ACTION').AsInt64       := DMl.ReadDataSet['ID_ACTION'];
           ExecProc;
           DMl.ReadDataSet.Close;

           Transaction.Commit;     // коммит общей транзакции
           Dm.DataSet.CloseOpen(true);
           LModalResult := 2225600;
           num_dog := grdHistory.DataController.Values[0,1];
      except
          Transaction.Rollback;
          DMl.Free;
          Dm.ReadDataSet.Close;
          raise;
       end;
   end;    
end;

end.
