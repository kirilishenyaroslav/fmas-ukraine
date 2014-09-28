unit uFreeFundsSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, Buttons, ExtCtrls, cxGridTableView,
  ActnList, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, uCommonSp, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, iBase, dxBar, dxBarExtItems,
  UpStyleContainer;

type
  TUPFunds = class(TSprav)
  private
  public
    constructor Create;
    procedure Show; override;
  end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

type
  TfmFreeFundsSelect = class(TForm)
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    ActionList1: TActionList;
    SelectAction: TAction;
    QuitAction: TAction;
    RefreshAction: TAction;
    ShowId: TAction;
    TableViewSMETA_FULL_TITLE: TcxGridDBColumn;
    TableViewKOL_STAVOK: TcxGridDBColumn;
    TableViewKOL_VACANT_STAVOK: TcxGridDBColumn;
    TableViewOKLAD: TcxGridDBColumn;
    TableViewKOEFF_PPS: TcxGridDBColumn;
    TableViewSMETA_PPS_FULL_TITLE: TcxGridDBColumn;
    TableViewSR_NAME: TcxGridDBColumn;
    TableViewID_SR: TcxGridDBColumn;
    TableViewSMETA_TITLE: TcxGridDBColumn;
    TableViewSMETA_KOD: TcxGridDBColumn;
    TableViewOKLAD_PPS: TcxGridDBColumn;
    TableViewSMETA_PPS_TITLE: TcxGridDBColumn;
    TableViewSMETA_PPS_KOD: TcxGridDBColumn;
    TableViewID_SMETA: TcxGridDBColumn;
    TableViewID_SMETA_PPS: TcxGridDBColumn;
    TableViewID_WORK_COND: TcxGridDBColumn;
    TableViewNAME_WORK_COND: TcxGridDBColumn;
    TableViewID_WORK_MODE: TcxGridDBColumn;
    TableViewNAME_WORK_MODE: TcxGridDBColumn;
    GetFreeFunds: TpFIBDataSet;
    GetFreeFundsSMETA_FULL_TITLE: TFIBStringField;
    GetFreeFundsKOL_STAVOK: TFIBFloatField;
    GetFreeFundsKOL_VACANT_STAVOK: TFIBFloatField;
    GetFreeFundsOKLAD: TFIBFloatField;
    GetFreeFundsKOEFF_PPS: TFIBFloatField;
    GetFreeFundsSMETA_PPS_FULL_TITLE: TFIBStringField;
    GetFreeFundsSR_NAME: TFIBStringField;
    GetFreeFundsID_SR: TFIBIntegerField;
    GetFreeFundsSMETA_TITLE: TFIBStringField;
    GetFreeFundsSMETA_KOD: TFIBIntegerField;
    GetFreeFundsOKLAD_PPS: TFIBFloatField;
    GetFreeFundsSMETA_PPS_TITLE: TFIBStringField;
    GetFreeFundsSMETA_PPS_KOD: TFIBIntegerField;
    GetFreeFundsID_SMETA: TFIBIntegerField;
    GetFreeFundsID_SMETA_PPS: TFIBIntegerField;
    GetFreeFundsID_WORK_COND: TFIBIntegerField;
    GetFreeFundsNAME_WORK_COND: TFIBStringField;
    GetFreeFundsID_WORK_MODE: TFIBIntegerField;
    GetFreeFundsNAME_WORK_MODE: TFIBStringField;
    FreeFundsSource: TDataSource;
    ReadTransaction: TpFIBTransaction;
    DB: TpFIBDatabase;
    dxBarDockControl1: TdxBarDockControl;
    dxBarManager1: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    SelectBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    procedure TableViewDblClick(Sender: TObject);
    procedure TableViewKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RefreshBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
  private
    pStylesDM:TStyleContainer;
  public
    constructor Create(AOwner:TForm;DBHandle:TISC_DB_HANDLE;
                       Id_post_salary,ID_department,Id_type_post:variant;
                       Act_date:TDate;Id_level:variant);reintroduce;
  end;

var
  fmFreeFundsSelect: TfmFreeFundsSelect;

implementation

{$R *.dfm}

constructor TfmFreeFundsSelect.Create(AOwner:TForm;DBHandle:TISC_DB_HANDLE;
                       Id_post_salary,ID_department,Id_type_post:variant;
                       Act_date:TDate;Id_level:variant);
begin
  inherited Create(AOwner);

  DB.Handle := DBHandle;
  GetFreeFunds.ParamByName('ID_POST_SALARY').AsVariant := Id_post_salary;
  GetFreeFunds.ParamByName('ID_DEPARTMENT').AsVariant := ID_department;
  GetFreeFunds.ParamByName('ID_TYPE_POST').AsVariant := Id_type_post;
  GetFreeFunds.ParamByName('ID_LEVEL').AsVariant := Id_level;
  GetFreeFunds.ParamByName('ACT_DATE').AsDate := Act_date;
{  ShowMessage(GetFreeFunds.SQLs.SelectSQL.Text+#13+
              'ID_POST_SALARY = '+VarToStrDef(GetFreeFunds.ParamByName('ID_POST_SALARY').AsVariant,'NULL')+#13+
              'ID_DEPARTMENT = '+VarToStrDef(GetFreeFunds.ParamByName('ID_DEPARTMENT').AsVariant,'NULL')+#13+
              'ID_TYPE_POST = '+VarToStrDef(GetFreeFunds.ParamByName('ID_TYPE_POST').AsVariant,'NULL')+#13+
              'ID_LEVEL = '+VarToStrDef(GetFreeFunds.ParamByName('ID_LEVEL').AsVariant,'NULL')+#13+
              'ACT_DATE = '+VarToStrDef(GetFreeFunds.ParamByName('ACT_DATE').AsVariant,'NULL'));}
  GetFreeFunds.Open;

  pStylesDM := TStyleContainer.Create(self);
  TableView.Styles.StyleSheet := pStylesDM.TableViewSheet;
end;

constructor TUPFunds.Create;
begin
    inherited Create;
    // создание входных/выходных полей
    Input.FieldDefs.Add('Id_post_salary',ftVariant);
    Input.FieldDefs.Add('Id_department',ftVariant);
    Input.FieldDefs.Add('id_type_post',ftVariant);
    Input.FieldDefs.Add('Act_date',ftVariant);
    Input.FieldDefs.Add('Id_level',ftVariant);

    Output.FieldDefs.Add('Id_Smeta',ftVariant);
    Output.FieldDefs.Add('Smeta_Title',ftString,255);
    Output.FieldDefs.Add('Kol_Vacant_Stavok',ftFloat);
    Output.FieldDefs.Add('Koeff_Pps',ftFloat);
    Output.FieldDefs.Add('Id_Smeta_Pps',ftVariant);
    Output.FieldDefs.Add('Smeta_Pps_Title',ftString,255);

    // подготовить параметры
    PrepareMemoryDatasets;
end;

function CreateSprav: TSprav;
begin
  Result := TUPFunds.Create;
end;

procedure TUPFunds.Show;
var fm: TfmFreeFundsSelect;
begin

  fm := TfmFreeFundsSelect.Create(Application.MainForm,TISC_DB_Handle(Integer(Input['DBHandle'])),
                           Input['Id_post_salary'],Input['Id_department'],Input['id_type_post'],
                           Input['Act_date'],Input['Id_level']);

  if fm.ShowModal = mrOk then
     with fm do
     begin
       OutPut.Append;
       Output.FieldValues['Id_Smeta']           := fm.GetFreeFunds['ID_SMETA'];
       Output.FieldValues['Smeta_Title']        := fm.GetFreeFunds['SMETA_TITLE'];
       Output.FieldValues['Kol_Vacant_Stavok']  := fm.GetFreeFunds['KOL_VACANT_STAVOK'];
       Output.FieldValues['Koeff_Pps']          := fm.GetFreeFunds['KOEFF_PPS'];
       Output.FieldValues['Id_Smeta_Pps']       := fm.GetFreeFunds['ID_SMETA_PPS'];
       Output.FieldValues['Smeta_Pps_Title']    := fm.GetFreeFunds['SMETA_PPS_TITLE'];
       Output.Post;
     end;

  fm.Free;
end;

procedure TfmFreeFundsSelect.TableViewDblClick(Sender: TObject);
begin
  SelectBtn.Click;
end;

procedure TfmFreeFundsSelect.TableViewKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then SelectBtn.Click;
end;

procedure TfmFreeFundsSelect.RefreshBtnClick(Sender: TObject);
begin
  TableView.DataController.DataSet.Refresh;
end;

procedure TfmFreeFundsSelect.SelectBtnClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfmFreeFundsSelect.ExitBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
