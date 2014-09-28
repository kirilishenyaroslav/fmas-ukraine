unit SettingProv_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase,TiCommonStyles, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  TiCommonProc, SettingProv_Add, cxTextEdit, cxCurrencyEdit, StdCtrls,
  Buttons;

type
  TSettingProvMainForm = class(TForm)
    SettingGridDBTableView: TcxGridDBTableView;
    SettingGridLevel: TcxGridLevel;
    SettingGrid: TcxGrid;
    dxBarManager1: TdxBarManager;
    SelectButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SettingGridDBTableViewDB_NameSubdivision: TcxGridDBColumn;
    InsertButton: TdxBarLargeButton;
    UpdateButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    Panel1: TPanel;
    SettingGridDBTableViewDBColumn1: TcxGridDBColumn;
    SettingGridDBTableViewDBColumn2: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SettingGridDBTableViewDblClick(Sender: TObject);
    procedure ToolButton_delClick(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
  private
    PRes               :Variant;
    pLanguageIndex     :Byte;
    pStylesDM          :TStyleDM;
    PDb_Handle         :TISC_DB_HANDLE;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
    procedure smetAfterScroll(DataSet: TDataSet);
    property Res:Variant read PRes;
  end;

var
  SettingProvMainForm: TSettingProvMainForm;

implementation

uses SettingProv_DM;

{$R *.dfm}
constructor TSettingProvMainForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);

begin
  inherited Create(AOwner);
  PDb_Handle           := Db_Handle;
  SettingProvDM        := TSettingProvDM.Create(AOwner,Db_Handle);
//******************************************************************************
  pLanguageIndex       := LanguageIndex;
  Caption              := 'Налаштування проводок до бухгалтерії';
  SelectButton.Caption := GetConst('Select',tcButton);
  ExitButton.Caption   := GetConst('Exit',tcButton);
//******************************************************************************
  pStylesDM            := TStyleDM.Create(Self);
  SettingGridDBTableView.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
  SettingGridDBTableView.DataController.DataSource := SettingProvDM.SettingDSource;
//******************************************************************************
  {Label21.Caption := '';
  Label22.Caption := '';
  Label23.Caption := '';
  Label26.Caption := ''; }
  SettingProvDM.SettingDSet.Close;
  SettingProvDM.SettingDSet.SelectSQL.Text := 'select * from TI_SETTING_SELECT_DOG_SEL';
  SettingProvDM.SettingDSet.Open;
//******************************************************************************

end;

procedure TSettingProvMainForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TSettingProvMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   SettingProvDM.Free;
end;

procedure TSettingProvMainForm.SettingGridDBTableViewDblClick(
  Sender: TObject);
begin
  SelectButton.Click;
end;

procedure TSettingProvMainForm.smetAfterScroll(DataSet: TDataSet);
begin
end;

procedure TSettingProvMainForm.ToolButton_delClick(Sender: TObject);
begin
  if MessageDlg('Ви дійсно бажаєте вилучити запис? ', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin
   try
    SettingProvDM.WriteTransaction.StartTransaction;
    SettingProvDM.pFIBStoredProc.StoredProcName:='TI_SUBDIVISION_BUDGET_DEL';
    SettingProvDM.pFIBStoredProc.ParamByName('id_subdivision_budget').Value:=SettingProvDM.BudgetDSet['id_subdivision_budget'];
    SettingProvDM.pFIBStoredProc.ExecProc;
    SettingProvDM.WriteTransaction.Commit;
    SettingProvDM.BudgetDSet.Close;
    SettingProvDM.BudgetDSet.Open;
   except on E:Exception do
    begin
     MessageDlg('не можна видалити цей запис', mtError, [mbOK], 0);
     SettingProvDM.WriteTransaction.Rollback;
    end;
   end;
  end;
end;

procedure TSettingProvMainForm.InsertButtonClick(Sender: TObject);
var
  ViewForm : TSettingProvAddForm;
  ID_SETTING_SELECT_DOG:Integer;
begin
  ViewForm := TSettingProvAddForm.Create(Self,SettingProvDM.DB.Handle);
  ViewForm.SchetPDVButtonEdit.Text := '';
  ViewForm.SchetButtonEdit.Text    := '';
  ViewForm.DogButtonEdit.Text      := '';
  ViewForm.Caption                 := 'Додати налаштування';
  ViewForm.ShowModal;
  if (ViewForm.ModalResult=mrOk) then
    begin
      SettingProvDM.WriteTransaction.StartTransaction;
      SettingProvDM.pFIBStoredProc.StoredProcName := 'TI_SETTING_SELECT_DOG_INS';
      SettingProvDM.pFIBStoredProc.ParamByName('ID_DOG').AsInt64   := ViewForm.id_dog;
      SettingProvDM.pFIBStoredProc.ParamByName('KOD_DOG').AsInt64  := ViewForm.kod_dog;
      SettingProvDM.pFIBStoredProc.ParamByName('ID_SCHET').AsInt64 := ViewForm.id_sch_nds;
      SettingProvDM.pFIBStoredProc.ParamByName('ID_FOND').AsInt64  := ViewForm.id_sch;
      SettingProvDM.pFIBStoredProc.ExecProc;
      SettingProvDM.WriteTransaction.Commit;

      ID_SETTING_SELECT_DOG := SettingProvDM.pFIBStoredProc.ParamByName('ID_SETTING_SELECT_DOG_').AsInteger;
      SettingProvDM.SettingDSet.Close;
      SettingProvDM.SettingDSet.Open;
      SettingProvDM.SettingDSet.Locate('ID_SETTING_SELECT_DOG',IntToStr(ID_SETTING_SELECT_DOG),[]);
    end;

end;

procedure TSettingProvMainForm.UpdateButtonClick(Sender: TObject);
var
  ViewForm : TSettingProvAddForm;
  ID_SETTING_SELECT_DOG:Integer;
begin
  ID_SETTING_SELECT_DOG := SettingProvDM.SettingDSet['ID_SETTING_SELECT_DOG'];
  ViewForm := TSettingProvAddForm.Create(Self,SettingProvDM.DB.Handle);
  ViewForm.SchetPDVButtonEdit.Text := SettingProvDM.SettingDSet['NUM_SCH_NDS'];
  ViewForm.SchetButtonEdit.Text    := SettingProvDM.SettingDSet['NUM_SCH'];
  ViewForm.DogButtonEdit.Text      := SettingProvDM.SettingDSet['REG_NUM_DOG'];
  ViewForm.Caption                 := 'Змінити налаштування';
  ViewForm.ShowModal;
  if (ViewForm.ModalResult=mrOk) then
    begin
      SettingProvDM.WriteTransaction.StartTransaction;
      SettingProvDM.pFIBStoredProc.StoredProcName := 'TI_SETTING_SELECT_DOG_UPD';
      SettingProvDM.pFIBStoredProc.ParamByName('ID_SETTING_SELECT_DOG').Value   := ID_SETTING_SELECT_DOG;
      SettingProvDM.pFIBStoredProc.ParamByName('ID_DOG').AsInt64   := ViewForm.id_dog;
      SettingProvDM.pFIBStoredProc.ParamByName('KOD_DOG').AsInt64  := ViewForm.kod_dog;
      SettingProvDM.pFIBStoredProc.ParamByName('ID_SCHET').AsInt64 := ViewForm.id_sch_nds;
      SettingProvDM.pFIBStoredProc.ParamByName('ID_FOND').AsInt64  := ViewForm.id_sch;
      SettingProvDM.pFIBStoredProc.ExecProc;
      SettingProvDM.WriteTransaction.Commit;
      SettingProvDM.SettingDSet.Close;
      SettingProvDM.SettingDSet.Open;
      SettingProvDM.SettingDSet.Locate('ID_SETTING_SELECT_DOG',IntToStr(ID_SETTING_SELECT_DOG),[]);
    end;
end;

procedure TSettingProvMainForm.DeleteButtonClick(Sender: TObject);
begin
  if SettingProvDM.SettingDSet['id_fond'] = -1 then Exit;
  if MessageDlg('Ви дійсно бажаєте вилучити запис? ', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin
   try
    SettingProvDM.WriteTransaction.StartTransaction;
    SettingProvDM.pFIBStoredProc.StoredProcName:='TI_SETTING_SELECT_DOG_DEL';
    SettingProvDM.pFIBStoredProc.ParamByName('id_setting_select_dog').Value:=SettingProvDM.SettingDSet['id_setting_select_dog'];
    SettingProvDM.pFIBStoredProc.ExecProc;
    SettingProvDM.WriteTransaction.Commit;
    SettingProvDM.SettingDSet.Close;
    SettingProvDM.SettingDSet.Open;
   except on E:Exception do
    begin
     MessageDlg('не можна видалити цей запис', mtError, [mbOK], 0);
     SettingProvDM.WriteTransaction.Rollback;
    end;
   end;
  end;
end;

end.
