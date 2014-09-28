unit Subdivision_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase,TiCommonStyles, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  TiCommonProc, Subdivision_Add, cxTextEdit, cxCurrencyEdit, StdCtrls,
  Buttons,SubDivisionAddBudgetForm;

type
  TSubdivisionMainForm = class(TForm)
    SubdivisionGridDBTableView: TcxGridDBTableView;
    SubdivisionGridLevel: TcxGridLevel;
    SubdivisionGrid: TcxGrid;
    dxBarManager1: TdxBarManager;
    SelectButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SubdivisionGridDBTableViewDB_NameSubdivision: TcxGridDBColumn;
    InsertButton: TdxBarLargeButton;
    UpdateButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    Panel1: TPanel;
    GroupBox6: TGroupBox;
    Bevel2: TBevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn_smeta: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel4: TPanel;
    ToolButton_add: TSpeedButton;
    ToolButton_del: TSpeedButton;
    SpeedButton_red: TSpeedButton;
    Panel2: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    procedure ExitButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SubdivisionGridDBTableViewDblClick(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure SubdivisionGridDBTableViewKeyPress(Sender: TObject;
      var Key: Char);
    procedure ToolButton_addClick(Sender: TObject);
    procedure ToolButton_delClick(Sender: TObject);
    procedure SpeedButton_redClick(Sender: TObject);
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
  SubdivisionMainForm: TSubdivisionMainForm;

implementation

uses Subdivision_DM;

{$R *.dfm}
constructor TSubdivisionMainForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);

begin
  inherited Create(AOwner);
  PDb_Handle           := Db_Handle;
  SubdivisionDM        := TSubdivisionDM.Create(AOwner,Db_Handle);
//******************************************************************************
  pLanguageIndex       := LanguageIndex;
  Caption              := GetConst('Subdivision',tcForm);
  SelectButton.Caption := GetConst('Select',tcButton);
  ExitButton.Caption   := GetConst('Exit',tcButton);
//******************************************************************************
  pStylesDM            := TStyleDM.Create(Self);
  SubdivisionGridDBTableView.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
  SubdivisionGridDBTableView.DataController.DataSource := SubdivisionDM.SubdivisionDSource;
//******************************************************************************
  {Label21.Caption := '';
  Label22.Caption := '';
  Label23.Caption := '';
  Label26.Caption := ''; }
  SubdivisionDM.SubdivisionDSet.Close;
  SubdivisionDM.BudgetDSet.Close;
  SubdivisionDM.SubdivisionDSet.SelectSQL.Text := 'select * from TI_SP_SUBDIVISION_SEL';
  SubdivisionDM.BudgetDSet.SelectSQL.Text      := 'select * from TI_SUBDIVISION_BUDGET_SEL where id_subdivision = :id_subdivision';
  SubdivisionDM.SubdivisionDSet.Open;
  SubdivisionDM.BudgetDSet.Open;
//******************************************************************************
  SubdivisionDM.BudgetDSet.AfterScroll := smetAfterScroll;
  smetAfterScroll(SubdivisionDM.BudgetDSet);
end;

procedure TSubdivisionMainForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TSubdivisionMainForm.SelectButtonClick(Sender: TObject);
begin
  PRes:=VarArrayCreate([0,3], varVariant);
  PRes[0]:=SubdivisionDM.SubdivisionDSet['id_subdivision'];
  PRes[1]:=SubdivisionDM.SubdivisionDSet['name_subdivision'];
  ModalResult:=mrYes;
end;

procedure TSubdivisionMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   SubdivisionDM.Free;
end;

procedure TSubdivisionMainForm.SubdivisionGridDBTableViewDblClick(
  Sender: TObject);
begin
  SelectButton.Click;
end;

procedure TSubdivisionMainForm.InsertButtonClick(Sender: TObject);
var
  ViewForm : TSubdivisionAddForm;
  id_subdivision:Integer;
begin
  ViewForm := TSubdivisionAddForm.Create(Self,SubdivisionDM.DB.Handle);
  ViewForm.NameSubdivisionTextEdit.Text   := '';
  ViewForm.Caption                 := GetConst('SubdivisionAdd',tcForm);
  ViewForm.ShowModal;
  if (ViewForm.ModalResult=mrOk) then
    begin
      SubdivisionDM.WriteTransaction.StartTransaction;
      SubdivisionDM.pFIBStoredProc.StoredProcName := 'TI_SP_SUBDIVISION_INS';
      SubdivisionDM.pFIBStoredProc.ParamByName('name_subdivision').Value := ViewForm.NameSubdivisionTextEdit.Text;
      SubdivisionDM.pFIBStoredProc.ExecProc;
      SubdivisionDM.WriteTransaction.Commit;
      id_subdivision := SubdivisionDM.pFIBStoredProc.ParamByName('id_subdivision_').AsInteger;
      SubdivisionDM.SubdivisionDSet.Close;
      SubdivisionDM.SubdivisionDSet.Open;
      SubdivisionDM.SubdivisionDSet.Locate('id_subdivision',IntToStr(id_subdivision),[]);
    end;

end;

procedure TSubdivisionMainForm.UpdateButtonClick(Sender: TObject);
var
  ViewForm : TSubdivisionAddForm;
  id_subdivision:Integer;
begin
  id_subdivision := SubdivisionDM.SubdivisionDSet['id_subdivision'];
  ViewForm := TSubdivisionAddForm.Create(Self,SubdivisionDM.DB.Handle);
  ViewForm.NameSubdivisionTextEdit.Text := SubdivisionDM.SubdivisionDSet['name_subdivision'];
  ViewForm.Caption                      := GetConst('SubdivisionUpd',tcForm);
  ViewForm.ShowModal;
  if (ViewForm.ModalResult=mrOk) then
    begin
      SubdivisionDM.WriteTransaction.StartTransaction;
      SubdivisionDM.pFIBStoredProc.StoredProcName := 'TI_SP_SUBDIVISION_UPD';
      SubdivisionDM.pFIBStoredProc.ParamByName('id_subdivision').Value   := id_subdivision;
      SubdivisionDM.pFIBStoredProc.ParamByName('name_subdivision').Value := ViewForm.NameSubdivisionTextEdit.Text;
      SubdivisionDM.pFIBStoredProc.ExecProc;
      SubdivisionDM.WriteTransaction.Commit;
      SubdivisionDM.SubdivisionDSet.Close;
      SubdivisionDM.SubdivisionDSet.Open;
      SubdivisionDM.SubdivisionDSet.Locate('id_subdivision',IntToStr(id_subdivision),[]);
    end;
end;

procedure TSubdivisionMainForm.DeleteButtonClick(Sender: TObject);
begin
  if SubdivisionDM.SubdivisionDSet['id_subdivision'] = 1 then Exit;
  if MessageDlg('Ви дійсно бажаєте вилучити запис? ', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin
   try
    SubdivisionDM.WriteTransaction.StartTransaction;
    SubdivisionDM.pFIBStoredProc.StoredProcName:='TI_SP_SUBDIVISION_DEL';
    SubdivisionDM.pFIBStoredProc.ParamByName('id_subdivision').Value:=SubdivisionDM.SubdivisionDSet['id_subdivision'];
    SubdivisionDM.pFIBStoredProc.ExecProc;
    SubdivisionDM.WriteTransaction.Commit;
    SubdivisionDM.SubdivisionDSet.Close;
    SubdivisionDM.SubdivisionDSet.Open;
   except on E:Exception do
    begin
     MessageDlg('не можна видалити цей запис', mtError, [mbOK], 0);
     SubdivisionDM.WriteTransaction.Rollback;
    end;
   end;
  end;
end;

procedure TSubdivisionMainForm.SubdivisionGridDBTableViewKeyPress(
  Sender: TObject; var Key: Char);
begin
   if (SubdivisionGridDBTableView.OptionsBehavior.IncSearchItem<>SubdivisionGridDBTableViewDB_NameSubdivision)then
   begin
    SubdivisionGridDBTableView.Controller.IncSearchingText   := '';
    SubdivisionGridDBTableView.OptionsBehavior.IncSearchItem := SubdivisionGridDBTableViewDB_NameSubdivision;
   end;
end;

procedure TSubdivisionMainForm.ToolButton_addClick(Sender: TObject);
var
  Add             : Variant;
  i               : Integer;
  namesubdivision : string;
  id_subdivision_budget : Integer;
begin
  namesubdivision := SubdivisionDM.SubdivisionDSet['name_subdivision'];
  Add := SubDivisionAddBudgetForm.AddKosht(self,SubdivisionDM.DB.Handle,-1,1,0,0,0,0,0,date,namesubdivision);
  if VarArrayDimCount(Add) > 0 then
  begin
    i := 0;
    SubdivisionDM.WriteTransaction.StartTransaction;
    SubdivisionDM.pFIBStoredProc.StoredProcName := 'TI_SUBDIVISION_BUDGET_INS';
    SubdivisionDM.pFIBStoredProc.ParamByName('id_subdivision').Value := SubdivisionDM.SubdivisionDSet['id_subdivision'];
    SubdivisionDM.pFIBStoredProc.ParamByName('id_smet').Value   := Add[i][7];
    SubdivisionDM.pFIBStoredProc.ParamByName('id_razd').Value   := Add[i][8];
    SubdivisionDM.pFIBStoredProc.ParamByName('id_stat').Value   := Add[i][9];
    SubdivisionDM.pFIBStoredProc.ParamByName('name_smet').Value := Add[i][0];
    SubdivisionDM.pFIBStoredProc.ParamByName('name_razd').Value := Add[i][1];
    SubdivisionDM.pFIBStoredProc.ParamByName('name_stat').Value := Add[i][2];
    SubdivisionDM.pFIBStoredProc.ParamByName('kod_smety').Value := Add[i][4];
    SubdivisionDM.pFIBStoredProc.ParamByName('n_razd').Value    := Add[i][5];
    SubdivisionDM.pFIBStoredProc.ParamByName('n_stat').Value    := Add[i][6];
    SubdivisionDM.pFIBStoredProc.ParamByName('id_kekv').Value   := Add[i][10];
    SubdivisionDM.pFIBStoredProc.ParamByName('kod_kekv').Value  := Add[i][11];
    SubdivisionDM.pFIBStoredProc.ParamByName('name_kekv').Value := Add[i][12];
    SubdivisionDM.pFIBStoredProc.ExecProc;
    SubdivisionDM.WriteTransaction.Commit;
    id_subdivision_budget := SubdivisionDM.pFIBStoredProc.ParamByName('id_subdivision_budget_').AsInteger;
    SubdivisionDM.BudgetDSet.Close;
    SubdivisionDM.BudgetDSet.Open;
    SubdivisionDM.BudgetDSet.Locate('id_subdivision_budget',IntToStr(id_subdivision_budget),[]);
  end;
end;

procedure TSubdivisionMainForm.smetAfterScroll(DataSet: TDataSet);
begin
  Label21.Caption  := SubdivisionDM.BudgetDSet.FieldByName('name_smet').AsString;
  Label22.Caption  := SubdivisionDM.BudgetDSet.FieldByName('name_razd').AsString;
  Label23.Caption  := SubdivisionDM.BudgetDSet.FieldByName('name_stat').AsString;
  Label26.Caption  := SubdivisionDM.BudgetDSet.FieldByName('name_kekv').AsString;
  Label21.Hint     := SubdivisionDM.BudgetDSet.FieldByName('name_smet').AsString;
  Label21.ShowHint := true;
  Label22.Hint     := SubdivisionDM.BudgetDSet.FieldByName('name_razd').AsString;
  Label22.ShowHint := true;
  Label23.Hint     := SubdivisionDM.BudgetDSet.FieldByName('name_stat').AsString;
  Label23.ShowHint := true;
  Label26.Hint     := SubdivisionDM.BudgetDSet.FieldByName('name_kekv').AsString;
  Label26.ShowHint := true;
end;

procedure TSubdivisionMainForm.ToolButton_delClick(Sender: TObject);
begin
  if MessageDlg('Ви дійсно бажаєте вилучити запис? ', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin
   try
    SubdivisionDM.WriteTransaction.StartTransaction;
    SubdivisionDM.pFIBStoredProc.StoredProcName:='TI_SUBDIVISION_BUDGET_DEL';
    SubdivisionDM.pFIBStoredProc.ParamByName('id_subdivision_budget').Value:=SubdivisionDM.BudgetDSet['id_subdivision_budget'];
    SubdivisionDM.pFIBStoredProc.ExecProc;
    SubdivisionDM.WriteTransaction.Commit;
    SubdivisionDM.BudgetDSet.Close;
    SubdivisionDM.BudgetDSet.Open;
   except on E:Exception do
    begin
     MessageDlg('не можна видалити цей запис', mtError, [mbOK], 0);
     SubdivisionDM.WriteTransaction.Rollback;
    end;
   end;
  end;
end;

procedure TSubdivisionMainForm.SpeedButton_redClick(Sender: TObject);
var
  Add: Variant;
    i: Integer;
  id_subdivision_budget : Integer;
begin
  id_subdivision_budget := SubdivisionDM.BudgetDSet['id_subdivision_budget'];

  if SubdivisionDM.BudgetDSet.RecordCount = 0 then Exit;

  Add := SubDivisionAddBudgetForm.AddKosht(self,SubdivisionDM.DB.Handle,-1,2,
                                   SubdivisionDM.BudgetDSet.FieldByName('id_smet').AsInteger,
                                   SubdivisionDM.BudgetDSet.FieldByName('id_razd').AsInteger,
                                   SubdivisionDM.BudgetDSet.FieldByName('id_stat').AsInteger,
                                   SubdivisionDM.BudgetDSet.FieldByName('id_kekv').AsInteger,
                                   0,date,SubdivisionDM.SubdivisionDSet['name_subdivision']);
  if VarArrayDimCount(Add) > 0 then
  begin
    i := 0;
    SubdivisionDM.WriteTransaction.StartTransaction;
    SubdivisionDM.pFIBStoredProc.StoredProcName := 'TI_SUBDIVISION_BUDGET_UPD';
    SubdivisionDM.pFIBStoredProc.ParamByName('id_subdivision').Value := SubdivisionDM.SubdivisionDSet['id_subdivision'];
    SubdivisionDM.pFIBStoredProc.ParamByName('id_smet').Value   := Add[i][7];
    SubdivisionDM.pFIBStoredProc.ParamByName('id_razd').Value   := Add[i][8];
    SubdivisionDM.pFIBStoredProc.ParamByName('id_stat').Value   := Add[i][9];
    SubdivisionDM.pFIBStoredProc.ParamByName('name_smet').Value := Add[i][0];
    SubdivisionDM.pFIBStoredProc.ParamByName('name_razd').Value := Add[i][1];
    SubdivisionDM.pFIBStoredProc.ParamByName('name_stat').Value := Add[i][2];
    SubdivisionDM.pFIBStoredProc.ParamByName('kod_smety').Value := Add[i][4];
    SubdivisionDM.pFIBStoredProc.ParamByName('n_razd').Value    := Add[i][5];
    SubdivisionDM.pFIBStoredProc.ParamByName('n_stat').Value    := Add[i][6];
    SubdivisionDM.pFIBStoredProc.ParamByName('id_kekv').Value   := Add[i][10];
    SubdivisionDM.pFIBStoredProc.ParamByName('kod_kekv').Value  := Add[i][11];
    SubdivisionDM.pFIBStoredProc.ParamByName('name_kekv').Value := Add[i][12];
    SubdivisionDM.pFIBStoredProc.ParamByName('id_subdivision_budget').Value := id_subdivision_budget;
    SubdivisionDM.pFIBStoredProc.ExecProc;
    SubdivisionDM.WriteTransaction.Commit;
    SubdivisionDM.BudgetDSet.Close;
    SubdivisionDM.BudgetDSet.Open;
    SubdivisionDM.BudgetDSet.Locate('id_subdivision_budget',IntToStr(id_subdivision_budget),[]);
  end;

end;

end.
