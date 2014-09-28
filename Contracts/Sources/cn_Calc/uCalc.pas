unit uCalc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, Placemnt,
  cxGridTableView, ImgList, dxBarExtItems, dxBar, cxContainer, cxCheckBox,
  cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxGroupBox, dxStatusBar,
  cn_common_funcs, cn_Common_Types, DM_Calc, ActnList, IBase,
  cn_Common_Messages, cnConsts, cnConsts_Messages;

type
  TfrmCalc = class(TForm)
    StatusBar: TdxStatusBar;
    Param_GroupBox: TcxGroupBox;
    Grid_calc_param: TcxGrid;
    TableView_calc_param: TcxGridDBTableView;
    Grid_calc_paramLevel: TcxGridLevel;
    Faculty_DockControl: TdxBarDockControl;
    Date_GroupBox: TcxGroupBox;
    Grid_calc_data: TcxGrid;
    TableView_calc_data: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    Spec_DockControl: TdxBarDockControl;
    cxSplitter1: TcxSplitter;
    dxBarDockControl1: TdxBarDockControl;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    AddButton_Date: TdxBarLargeButton;
    DeleteButton_Date: TdxBarLargeButton;
    RefreshButton_Date: TdxBarLargeButton;
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
    CnFormStorage: TFormStorage;
    facul_column: TcxGridDBColumn;
    spec_column: TcxGridDBColumn;
    form_stud_column: TcxGridDBColumn;
    kat_stud_column: TcxGridDBColumn;
    nac_column: TcxGridDBColumn;
    kurs_column: TcxGridDBColumn;
    ActionList1: TActionList;
    refresh_act: TAction;
    add_act: TAction;
    edit_act: TAction;
    del_act: TAction;
    Date_beg_column: TcxGridDBColumn;
    date_end_column: TcxGridDBColumn;
    date_pay_column: TcxGridDBColumn;
    add_data_act: TAction;
    edit_data_act: TAction;
    del_data_act: TAction;
    exit_act: TAction;
    refresh_data_act: TAction;
    EditButton_Date: TdxBarLargeButton;
    procedure FormClose(Sender: TObject;  var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure refresh_actExecute(Sender: TObject);
    procedure add_actExecute(Sender: TObject);
    procedure edit_actExecute(Sender: TObject);
    procedure del_actExecute(Sender: TObject);
    procedure TableView_calc_paramCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure refresh_data_actExecute(Sender: TObject);
    procedure add_data_actExecute(Sender: TObject);
    procedure edit_data_actExecute(Sender: TObject);
    procedure del_data_actExecute(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM:TDM_Calc;
    DB_Handle:TISC_DB_HANDLE;
    procedure FormIniLanguage;
  public
    res:Variant;
    Is_admin:Boolean;
    constructor  Create(AParameter:TcnSimpleParams);reintroduce;
  end;

var
  frmCalc: TfrmCalc;

implementation

uses uFilter_AE, FIBQuery, uDate_AE;
{$R *.dfm}
constructor TfrmCalc.Create(AParameter:TcnSimpleParams);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AParameter.Owner);

  DM:=TDM_Calc.Create(Self);
  DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_CALC_PARAM_SEL';
  DM.DB.Handle:=AParameter.DB_Handle;
  DB_Handle:=AParameter.DB_Handle;
  DM.DataSet.Open;
  TableView_calc_param.DataController.DataSource := DM.DataSource;

  if DM.DataSet.RecordCount<>0 then
   Begin
    DM.ReadDataSet.SQLs.SelectSQL.Text:='Select * from Cn_dt_Calc_data_sel(:Id_Dt_Calc_param)';
    DM.ReadDataSet.ParamByName('ID_DT_CALC_PARAM').AsInt64:=DM.DataSet['ID_DT_CALC_PARAM'];
    DM.ReadDataSet.Open;
   End;

  TableView_calc_data.DataController.DataSource := DM.DataSourceRead;
  // инициализация строковых констант
  FormIniLanguage();
  Is_admin:=AParameter.is_admin;
  Screen.Cursor:=crDefault;
  CnFormStorage.RestoreFormPlacement;
end;

procedure TfrmCalc.FormIniLanguage;
begin
  PLanguageIndex   := cn_Common_Funcs.cnLanguageIndex();

  //кэпшн формы
  Caption:=                      'Графік начислень';

  //названия кнопок
  AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
  EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
  DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
  RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
  SelectButton.Caption :=        cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
  ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

  AddButton_date.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
  EditButton_date.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
  DeleteButton_date.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
  RefreshButton_date.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];

  //статусбар
  StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
  StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
  StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
  StatusBar.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
  StatusBar.Panels[4].Text:=  cnConsts.cn_EnterBtn_ShortCut[PLanguageIndex]   + cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
  StatusBar.Panels[5].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

end;

procedure TfrmCalc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CnFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild
   then action:=caFree
   else
    begin
     DM.Free;
    end;
end;

procedure TfrmCalc.FormShow(Sender: TObject);
begin
  if FormStyle = fsMDIChild then  SelectButton.Visible:=ivNever;
  Grid_calc_data.SetFocus;
end;

procedure TfrmCalc.refresh_actExecute(Sender: TObject);
begin
  DM.DataSet.Close;
  DM.DataSet.Open;
end;

procedure TfrmCalc.add_actExecute(Sender: TObject);
var
  View:TfrmFilter_AE;
  id_param:integer;
begin
  View:=TfrmFilter_AE.Create(self);
  View.Db_Handle:=DM.DB.Handle;
  View.ShowModal;
  if View.ModalResult=mrok then
   Begin
     DM.WriteTransaction.StartTransaction;
     DM.StProc.StoredProcName:='CN_DT_CALC_PARAM_INS';
     DM.StProc.Prepare;
     if VIEW.id_facul<>-1 then DM.StProc.ParamByName('id_facul').AsInt64:=VIEW.id_facul
                          else DM.StProc.ParamByName('id_facul').AsVariant:=null;

     if VIEW.id_spec<>-1 then DM.StProc.ParamByName('id_spec').AsInt64:=VIEW.id_spec
                          else DM.StProc.ParamByName('id_spec').AsVariant:=null;

     if VIEW.id_form_stud<>-1 then DM.StProc.ParamByName('id_form_stud').AsInt64:=VIEW.id_form_stud
                          else DM.StProc.ParamByName('id_form_stud').AsVariant:=null;

     if VIEW.id_kat_stud<>-1 then DM.StProc.ParamByName('id_kat_stud').AsInt64:=VIEW.id_kat_stud
                          else DM.StProc.ParamByName('id_kat_stud').AsVariant:=null;

     if VIEW.id_nac<>-1 then DM.StProc.ParamByName('id_nac').AsInt64:=VIEW.id_nac
                          else DM.StProc.ParamByName('id_nac').AsVariant:=null;

     DM.StProc.ParamByName('kurs').AsInt64:=VIEW.kurs;
     DM.StProc.ExecProc;
     id_param:=DM.StProc.FldByName['id_dt_calc_param'].AsInt64;
     try
       DM.WriteTransaction.Commit;
      except
       DM.WriteTransaction.Rollback;
     End;
    refresh_actExecute(self);
    DM.DataSet.Locate('ID_DT_CALC_PARAM',id_param,[]);
    refresh_data_actExecute(self);
   end;
  View.Free;
end;

procedure TfrmCalc.edit_actExecute(Sender: TObject);
var
  View:TfrmFilter_AE;
  id_param:integer;
begin
  if TableView_calc_param.DataController.RecordCount=0 then Exit;
  View:=TfrmFilter_AE.Create(self);
  View.Db_Handle:=DM.DB.Handle;

  if DM.DataSet['id_facul']<>null then View.id_facul:=DM.DataSet['id_facul'] else View.id_facul:=-1;
  if DM.DataSet['Facul_name']<>null then View.FacultyText.Text:=DM.DataSet['Facul_name'];

  if DM.DataSet['id_spec']<>null then View.id_spec:=DM.DataSet['id_spec'] else View.id_spec:=-1;
  if DM.DataSet['Spec_Name']<>null then View.SpecialityText.Text:=DM.DataSet['Spec_Name'];

  if DM.DataSet['id_form_stud']<>null then View.id_form_stud:=DM.DataSet['id_form_stud'] else View.id_form_stud:=-1;
  if DM.DataSet['Form_Stud_name']<>null then View.FormStudText.Text:=DM.DataSet['Form_Stud_name'];

  if DM.DataSet['id_kat_stud']<>null then View.id_kat_stud:=DM.DataSet['id_kat_stud'] else View.id_kat_stud:=-1;
  if DM.DataSet['Kat_Stud_Name']<>null then View.KatText.Text:=DM.DataSet['Kat_Stud_Name'];

  if DM.DataSet['id_nac']<>null then View.id_nac:=DM.DataSet['id_nac'] else View.id_nac:=-1;
  if DM.DataSet['Nac_name']<>null then View.NacText.Text:=DM.DataSet['Nac_name'];

  View.kurs:=DM.DataSet['kurs'];
  View.ShowModal;
  if View.ModalResult=mrok then
   Begin
     DM.WriteTransaction.StartTransaction;
     DM.StProc.StoredProcName:='CN_DT_CALC_PARAM_UPD';
     DM.StProc.Prepare;
     DM.StProc.ParamByName('id_dt_calc_param').AsInt64:=DM.DataSet['id_dt_calc_param'];
     if VIEW.id_facul<>-1 then DM.StProc.ParamByName('id_facul').AsInt64:=VIEW.id_facul
                          else DM.StProc.ParamByName('id_facul').AsVariant:=null;

     if VIEW.id_spec<>-1 then DM.StProc.ParamByName('id_spec').AsInt64:=VIEW.id_spec
                         else DM.StProc.ParamByName('id_spec').AsVariant:=null;

     if VIEW.id_form_stud<>-1 then DM.StProc.ParamByName('id_form_stud').AsInt64:=VIEW.id_form_stud
                              else DM.StProc.ParamByName('id_form_stud').AsVariant:=null;

     if VIEW.id_kat_stud<>-1 then DM.StProc.ParamByName('id_kat_stud').AsInt64:=VIEW.id_kat_stud
                             else DM.StProc.ParamByName('id_kat_stud').AsVariant:=null;

     if VIEW.id_nac<>-1 then DM.StProc.ParamByName('id_nac').AsInt64:=VIEW.id_nac
                        else DM.StProc.ParamByName('id_nac').AsVariant:=null;
                        
     DM.StProc.ParamByName('kurs').AsInt64:=VIEW.kurs;
     DM.StProc.ExecProc;
     try
       DM.WriteTransaction.Commit;
      except
       DM.WriteTransaction.Rollback;
     End;
    refresh_actExecute(self);
    DM.DataSet.Locate('ID_DT_CALC_PARAM',id_param,[]); 
   end;
  View.Free;
end;

procedure TfrmCalc.del_actExecute(Sender: TObject);
var
  i:byte;
  id:Int64;
begin
  if TableView_calc_param.DataController.RecordCount = 0 then exit;

  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  DM.WriteTransaction.StartTransaction;
  DM.StProc.StoredProcName:='CN_DT_CALC_PARAM_DEL';
  DM.StProc.Prepare;
  ID:=DM.DataSet['id_dt_calc_param'];
  DM.StProc.ParamByName('id_dt_calc_param').AsInt64:=DM.DataSet['id_dt_calc_param'];
  DM.StProc.ExecProc;
  try
   DM.WriteTransaction.Commit;
   except
    DM.WriteTransaction.Rollback;
  End;
  refresh_actExecute(self);
  DM.DataSet.LocateNext('ID_DT_CALC_PARAM',id,[]);
  refresh_actExecute(self);
end;

procedure TfrmCalc.TableView_calc_paramCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  refresh_data_actExecute(self);
end;

procedure TfrmCalc.refresh_data_actExecute(Sender: TObject);
begin
  if DM.DataSet.RecordCount=0 then Exit;
  DM.ReadDataSet.Close;
  DM.ReadDataSet.SQLs.SelectSQL.Text:='Select * from Cn_dt_Calc_data_sel(:Id_Dt_Calc_param)';
  DM.ReadDataSet.ParamByName('ID_DT_CALC_PARAM').AsInt64:=DM.DataSet['ID_DT_CALC_PARAM'];
  DM.ReadDataSet.Open;
end;

procedure TfrmCalc.add_data_actExecute(Sender: TObject);
var
  View:TfrmDate_AE;
  id:integer;
begin
  if DM.DataSet.RecordCount=0 then Exit;
  View:=TfrmDate_AE.Create(self);
  View.ShowModal;
  if View.ModalResult=mrok then
   Begin
     DM.WriteTransaction.StartTransaction;
     DM.StProc.StoredProcName:='CN_DT_CALC_DATA_INS';
     DM.StProc.Prepare;
     DM.StProc.ParamByName('id_dt_calc_param').AsInt64:=DM.DataSet['id_dt_calc_param'];
     DM.StProc.ParamByName('DATE_BEG').AsDate:=VIEW.Date_beg_Edit.EditValue;
     DM.StProc.ParamByName('DATE_END').AsDate:=VIEW.Date_End_Edit.EditValue;
     DM.StProc.ParamByName('DATE_PAY').AsDate:=VIEW.Date_Pay_Edit.EditValue;
     DM.StProc.ExecProc;
     id:=DM.StProc.FldByName['id_dt_calc_data'].AsInt64;
     try
       DM.WriteTransaction.Commit;
      except
       DM.WriteTransaction.Rollback;
     End;
    refresh_data_actExecute(self);
    DM.ReadDataSet.Locate('ID_DT_CALC_DATA',id,[]); 
   end;
  View.Free;
end;

procedure TfrmCalc.edit_data_actExecute(Sender: TObject);
var
  View:TfrmDate_AE;
  id:integer;
begin
  if DM.DataSet.RecordCount=0 then Exit;
  if TableView_calc_data.DataController.RecordCount=0 then Exit;
  View:=TfrmDate_AE.Create(self);
  VIEW.Date_beg_Edit.EditValue:=DM.ReadDataSet['DATE_BEG'];
  VIEW.Date_End_Edit.EditValue:=DM.ReadDataSet['DATE_END'];
  VIEW.Date_Pay_Edit.EditValue:=DM.ReadDataSet['DATE_PAY'];
  View.ShowModal;
  if View.ModalResult=mrok then
   Begin
     DM.WriteTransaction.StartTransaction;
     DM.StProc.StoredProcName:='CN_DT_CALC_DATA_UPD';
     DM.StProc.Prepare;
     DM.StProc.ParamByName('id_dt_calc_data').AsInt64:=DM.ReadDataSet['id_dt_calc_data'];
     DM.StProc.ParamByName('id_dt_calc_param').AsInt64:=DM.DataSet['id_dt_calc_param'];
     DM.StProc.ParamByName('DATE_BEG').AsDate:=VIEW.Date_beg_Edit.EditValue;
     DM.StProc.ParamByName('DATE_END').AsDate:=VIEW.Date_End_Edit.EditValue;
     DM.StProc.ParamByName('DATE_PAY').AsDate:=VIEW.Date_Pay_Edit.EditValue;
     DM.StProc.ExecProc;
     try
       DM.WriteTransaction.Commit;
      except
       DM.WriteTransaction.Rollback;
     End;
    refresh_data_actExecute(self);
    DM.ReadDataSet.Locate('id_dt_calc_data',id,[]); 
   end;
  View.Free;
end;

procedure TfrmCalc.del_data_actExecute(Sender: TObject);
var
  i:byte;
  id:Int64;
begin
  if TableView_calc_data.DataController.RecordCount = 0 then exit;

  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  DM.WriteTransaction.StartTransaction;
  DM.StProc.StoredProcName:='CN_DT_CALC_DATA_DEL';
  DM.StProc.Prepare;
  ID:=DM.ReadDataSet['id_dt_calc_data'];
  DM.StProc.ParamByName('id_dt_calc_data').AsInt64:=DM.ReadDataSet['id_dt_calc_data'];
  DM.StProc.ExecProc;
  try
   DM.WriteTransaction.Commit;
   except
    DM.WriteTransaction.Rollback;
  End;
  refresh_data_actExecute(self);
  DM.ReadDataSet.LocateNext('ID_DT_CALC_data',id,[]);
end;

procedure TfrmCalc.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

end.
