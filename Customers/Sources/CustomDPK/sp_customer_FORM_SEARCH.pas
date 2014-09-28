unit sp_customer_FORM_SEARCH;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, FIBQuery,Resources_unit,
  pFIBQuery, Db, FIBDataSet, pFIBDataSet, Menus, Buttons,
  Grids, BaseTypes, DBGrids, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxControls, cxGridCustomView, cxGridLevel,
  cxGrid, cxCheckBox, cxDBData, cxGridDBTableView, cxButtonEdit;

type
  TFSp_customer_search = class(TForm)
    Panel1: TPanel;
    DataSource1: TDataSource;
    DataSet1: TpFIBDataSet;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    NameCheckV: TCheckBox;
    TypePropCheckV: TCheckBox;
    HigherInstCheckV: TCheckBox;
    BranchCheckV: TCheckBox;
    Panel2: TPanel;
    Label1: TLabel;
    NameCheck: TCheckBox;
    NameEdit: TEdit;
    Label5: TLabel;
    TypePropCheck: TCheckBox;
    TypePropEdit: TEdit;
    Label6: TLabel;
    HigherInstCheck: TCheckBox;
    HigherInstEdit: TEdit;
    Label4: TLabel;
    BranchCheck: TCheckBox;
    BranchEdit: TEdit;
    edrpouCheck: TCheckBox;
    Label2: TLabel;
    edrpouEdit: TEdit;
    AccountEdit: TEdit;
    Label3: TLabel;
    AccountCheck: TCheckBox;
    Label7: TLabel;
    nnsEdit: TEdit;
    nnsCheck: TCheckBox;
    Label8: TLabel;
    NalogNomEdit: TEdit;
    NalogNomCheck: TCheckBox;
    Panel3: TPanel;
    SearchButton: TSpeedButton;
    edrpouCheckV: TCheckBox;
    AccountCheckV: TCheckBox;
    NNSCheckV: TCheckBox;
    NalogNomCheckV: TCheckBox;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1TableView1Column2: TcxGridColumn;
    cxGrid1TableView1Column3: TcxGridColumn;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1ID_CUSTOMER: TcxGridDBColumn;
    cxGrid2DBTableView1NAME_CUSTOMER: TcxGridDBColumn;
    cxGrid2DBTableView1KOD_EDRPOU: TcxGridDBColumn;
    SpeedButton1: TSpeedButton;
    cxStyleRepository1: TcxStyleRepository;
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
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    procedure ExitButtonClick(Sender: TObject);
    procedure NameCheckClick(Sender: TObject);
    procedure TypePropCheckClick(Sender: TObject);
    procedure HigherInstCheckClick(Sender: TObject);
    procedure BranchCheckClick(Sender: TObject);
    procedure edrpouCheckClick(Sender: TObject);
    procedure AccountCheckClick(Sender: TObject);
    procedure nnsCheckClick(Sender: TObject);
    procedure NalogNomCheckClick(Sender: TObject);
    procedure SearchBttonClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FindIndices;
    procedure N1Click(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cxGrid1TableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGrid1TableView1Column2PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure SpeedButton1Click(Sender: TObject);
  public
    ResultIndices : array of integer;
  end;


implementation
uses SYS_OPTIONS;
{$R *.DFM}

procedure TFSp_customer_search.ExitButtonClick(Sender: TObject);
begin
 DataSet1.Active := false;
 ModalResult := mrCancel;
end;

procedure TFSp_customer_search.NameCheckClick(Sender: TObject);
begin
 NameEdit.Enabled := NameCheck.Checked;
 if NameEdit.Enabled then begin
  NameEdit.Color := SYS_ENABLED_COLOR;
  NameEdit.SetFocus;
 end else NameEdit.Color := SYS_DISABLED_COLOR;
end;

procedure TFSp_customer_search.TypePropCheckClick(Sender: TObject);
begin
 TypePropEdit.Enabled := TypePropCheck.Checked;
 if TypePropEdit.Enabled then begin
  TypePropEdit.Color := SYS_ENABLED_COLOR;
  TypePropEdit.SetFocus;
 end else TypePropEdit.Color := SYS_DISABLED_COLOR;
end;

procedure TFSp_customer_search.HigherInstCheckClick(Sender: TObject);
begin
 HigherInstEdit.Enabled := HigherInstCheck.Checked;
 if HigherInstEdit.Enabled then begin
  HigherInstEdit.Color := SYS_ENABLED_COLOR;
  HigherInstEdit.SetFocus;
 end else HigherInstEdit.Color := SYS_DISABLED_COLOR;
end;

procedure TFSp_customer_search.BranchCheckClick(Sender: TObject);
begin
 BranchEdit.Enabled := BranchCheck.Checked;
 if BranchEdit.Enabled then begin
  BranchEdit.Color := SYS_ENABLED_COLOR;
  BranchEdit.SetFocus;
 end else BranchEdit.Color := SYS_DISABLED_COLOR;
end;

procedure TFSp_customer_search.edrpouCheckClick(Sender: TObject);
begin
 edrpouEdit.Enabled := edrpouCheck.Checked;
 if edrpouEdit.Enabled then begin
  edrpouEdit.Color := SYS_ENABLED_COLOR;
  edrpouEdit.SetFocus;
 end else edrpouEdit.Color := SYS_DISABLED_COLOR;
end;

procedure TFSp_customer_search.AccountCheckClick(Sender: TObject);
begin
 AccountEdit.Enabled := AccountCheck.Checked;
 if AccountEdit.Enabled then begin
  AccountEdit.Color := SYS_ENABLED_COLOR;
  AccountEdit.SetFocus;
 end else AccountEdit.Color := SYS_DISABLED_COLOR;
end;

procedure TFSp_customer_search.nnsCheckClick(Sender: TObject);
begin
 nnsEdit.Enabled := nnsCheck.Checked;
 if nnsEdit.Enabled then begin
  nnsEdit.Color := SYS_ENABLED_COLOR;
  nnsEdit.SetFocus;
 end else nnsEdit.Color := SYS_DISABLED_COLOR;
end;

procedure TFSp_customer_search.NalogNomCheckClick(Sender: TObject);
begin
 NalogNomEdit.Enabled := NalogNomCheck.Checked;
 if NalogNomEdit.Enabled then begin
  NalogNomEdit.Color := SYS_ENABLED_COLOR;
  NalogNomEdit.SetFocus;
 end else NalogNomEdit.Color := SYS_DISABLED_COLOR;
end;

procedure TFSp_customer_search.SearchBttonClick(Sender: TObject);
const
 WHAT = 'SP_CUSTOMER.NAME_CUSTOMER, SP_CUSTOMER.KOD_EDRPOU, SP_CUSTOMER.ID_CUSTOMER';
var
 add_string : string;
 first : boolean;
 FROM  : string;
begin
 cxGrid1TableView1.DataController.PostEditingData;
 NameEdit.Text := cxGrid1TableView1.DataController.DisplayTexts[0, 1];
 HigherInstEdit.Text := cxGrid1TableView1.DataController.DisplayTexts[1, 1];
 BranchEdit.Text := cxGrid1TableView1.DataController.DisplayTexts[2, 1];
 EdrpouEdit.Text := cxGrid1TableView1.DataController.DisplayTexts[3, 1];
 AccountEdit.Text := cxGrid1TableView1.DataController.DisplayTexts[4, 1];
 nnsEdit.Text := cxGrid1TableView1.DataController.DisplayTexts[5, 1];
 nalogNomEdit.Text := cxGrid1TableView1.DataController.DisplayTexts[6, 1];

 NameCheckV.Checked := cxGrid1TableView1.DataController.Values[0, 2] = 'True';
 HigherInstCheckV.Checked := cxGrid1TableView1.DataController.Values[1, 2] = 'True';
 BranchCheckV.Checked := cxGrid1TableView1.DataController.Values[2, 2] = 'True';
 edrpouCheckV.Checked := cxGrid1TableView1.DataController.Values[3, 2] = 'True';
 AccountCheckV.Checked := cxGrid1TableView1.DataController.Values[4, 2] = 'True';
 NNSCheckV.Checked := cxGrid1TableView1.DataController.Values[5, 2] = 'True';
 NalogNomCheckV.Checked := cxGrid1TableView1.DataController.Values[6, 2] = 'True';


 NameCheck.Checked := NameEdit.Text <> '';
 HigherInstcheck.Checked := HigherInstEdit.Text <> '';
 Branchcheck.Checked := BranchEdit.Text <> '';
 Edrpoucheck.Checked := EdrpouEdit.Text <> '';
 Accountcheck.Checked := AccountEdit.Text <> '';
 nnscheck.Checked := nnsEdit.Text <> '';
 nalogNomcheck.Checked := nalogNomEdit.Text <> '';

 first := true;
 FROM := 'SP_CUSTOMER';
 add_string := 'WHERE (';
 DataSet1.Active := false;
 if not (NameCheck.Checked or TypePropCheck.Checked or HigherInstcheck.Checked or
         BranchCheck.Checked or edrpouCheck.Checked or AccountCheck.Checked or
         nnsCheck.Checked or NalogNomCheck.Checked or (cxGrid1TableView1.DataController.DisplayTexts[7, 1] <> '')) then exit;
 if NameCheck.Checked then begin
  first := false;
//  NAME
  if NameCheckV.Checked then add_string := add_string + 'UPPER(NAME_CUSTOMER COLLATE PXW_CYRL) LIKE ''%' + AnsiUpperCase(NameEdit.Text) + '%'')'
                        else add_string := add_string + 'UPPER(NAME_CUSTOMER COLLATE PXW_CYRL) LIKE ''' + AnsiUpperCase(NameEdit.Text) + '%'')'
 end;
 if EDRPOUCheck.Checked then begin
  if not first then add_string := add_string + ' AND (';
  first := false;
  if edrpouCheckV.checked then add_string := add_string + 'KOD_EDRPOU LIKE ''%' + edrpouEdit.Text + '%'')'
                          else add_string := add_string + 'KOD_EDRPOU LIKE ''' + edrpouEdit.Text + '%'')';
 end;

 if NalogNomCheck.Checked then begin
  if not first then add_string := add_string + ' AND (';
  first := false;
  if NalogNomCheckV.checked then add_string := add_string + 'NALOG_NOM LIKE ''%' + NalogNomEdit.Text + '%'')'
                          else add_string := add_string + 'NALOG_NOM LIKE ''' + NalogNomEdit.Text + '%'')';
 end;

 if NNSCheck.Checked then begin
  if not first then add_string := add_string + ' AND (';
  first := false;
  if NNSCheckV.checked then add_string := add_string + 'NALOG_NOM LIKE ''%' + NNSEdit.Text + '%'')'
                          else add_string := add_string + 'NALOG_NOM LIKE ''' + NNSEdit.Text + '%'')';
 end;

 if AccountCheck.Checked then begin
  if not first then add_string := add_string + ' AND (';
  first := false;
  if AccountCheckV.Checked then add_string := add_string + 'sp_customer.id_customer = sp_cust_rate_acc.id_customer) and (UPPER(sp_cust_rate_acc.rate_account COLLATE PXW_CYRL) like ''%' + AnsiUpperCase(AccountEdit.Text) + '%'')'
                           else add_string := add_string + 'sp_customer.id_customer = sp_cust_rate_acc.id_customer) and (UPPER(sp_cust_rate_acc.rate_account COLLATE PXW_CYRL) like ''' + AnsiUpperCase(AccountEdit.Text) + '%'')';
  FROM := FROM + ', SP_CUST_RATE_ACC';
 end;


 if HigherInstCheck.Checked then begin
  if not first then add_string := add_string + ' AND (';
  first := false;
  if HigherInstCheckV.Checked then add_string := add_string + 'SP_CUSTOMER.ID_HIGHER_INSTANCE = SP_IST.ID_IST) and (UPPER(SP_IST.NAME_IST COLLATE PXW_CYRL) like ''%' + AnsiUpperCase(HigherInstEdit.Text) + '%'')'
                            else add_string := add_string + 'SP_CUSTOMER.ID_HIGHER_INSTANCE = SP_IST.ID_IST) and (UPPER(SP_IST.NAME_IST COLLATE PXW_CYRL) like ''' + AnsiUpperCase(HigherInstEdit.Text) + '%'')';
  FROM := FROM + ', SP_IST';
 end;

 if BranchCheck.Checked then begin
  if not first then add_string := add_string + ' AND (';
  first := false;
  if BranchCheckV.Checked then add_string := add_string + 'SP_CUSTOMER.ID_BRANCH = SP_BRANCH.ID_BRANCH) and (UPPER(SP_BRANCH.NAME_BRANCH COLLATE PXW_CYRL) like ''%' + AnsiUpperCase(BranchEdit.Text) + '%'')'
                            else add_string := add_string + 'SP_CUSTOMER.ID_BRANCH = SP_BRANCH.ID_BRANCH) and (UPPER(SP_BRANCH.NAME_BRANCH COLLATE PXW_CYRL) like ''' + AnsiUpperCase(BranchEdit.Text) + '%'')';
  FROM := FROM + ', SP_BRANCH';
 end;

 if cxGrid1TableView1.DataController.DisplayTexts[7, 1] <> '' then begin
  if not first then add_string := add_string + ' AND (';
  first := false;
  if cxGrid1TableView1.DataController.Values[7, 2] = 'True' then add_string := add_string + 'SP_CUST_MEN.ID_CUSTOMER = SP_CUSTOMER.ID_CUSTOMER) AND (SP_CUST_MEN.ID_TYPE_MEN = INI_TYPE_MEN.ID_TYPE_MEN) AND (INI_TYPE_MEN.IS_CHIEF = 1)' + ' AND ((UPPER(SP_CUST_MEN.FAMILIA COLLATE PXW_CYRL) || '' '' || UPPER(SP_CUST_MEN.IMYA COLLATE PXW_CYRL) || '' '' || UPPER(SP_CUST_MEN.OTCHESTVO COLLATE PXW_CYRL)) like ''%' + AnsiUpperCase(cxGrid1TableView1.DataController.DisplayTexts[7, 1]) + '%'')'
                            else add_string := add_string + 'SP_CUST_MEN.ID_CUSTOMER = SP_CUSTOMER.ID_CUSTOMER) AND (SP_CUST_MEN.ID_TYPE_MEN = INI_TYPE_MEN.ID_TYPE_MEN) AND (INI_TYPE_MEN.IS_CHIEF = 1)' + ' AND ((UPPER(SP_CUST_MEN.FAMILIA COLLATE PXW_CYRL) || '' '' || UPPER(SP_CUST_MEN.IMYA COLLATE PXW_CYRL) || '' '' || UPPER(SP_CUST_MEN.OTCHESTVO COLLATE PXW_CYRL)) like ''' + AnsiUpperCase(cxGrid1TableView1.DataController.DisplayTexts[7, 1]) + '%'')';
  FROM := FROM + ', SP_CUST_MEN, INI_TYPE_MEN';
 end;

 add_string := add_string + ' AND (SP_CUSTOMER.USE_END = ''' + DateTimeToStr(SYS_MAX_TIMESTAMP) + ''')';

 DataSet1.SQLs.SelectSQL.Text := 'select ' + WHAT + ' from ' + FROM + ' ' + add_string;
 DataSet1.Active := true;
end;

procedure TFSp_customer_search.DBGrid1DblClick(Sender: TObject);
begin
 FindIndices;
 ModalResult := mrOk;
end;

procedure TFSp_customer_search.FindIndices;
begin
//
end;

procedure TFSp_customer_search.N1Click(Sender: TObject);
begin
 DBGrid1DblClick(Sender);
end;

procedure TFSp_customer_search.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = '''' then Key := #0;
end;

procedure TFSp_customer_search.FormShow(Sender: TObject);
begin
 NameEdit.Color       := SYS_DISABLED_COLOR;
 TypePropEdit.Color   := SYS_DISABLED_COLOR;
 HigherInstEdit.Color := SYS_DISABLED_COLOR;
 BranchEdit.Color     := SYS_DISABLED_COLOR;
 edrpouEdit.Color     := SYS_DISABLED_COLOR;
 AccountEdit.Color    := SYS_DISABLED_COLOR;
 nnsEdit.Color        := SYS_DISABLED_COLOR;
 NalogNomEdit.Color   := SYS_DISABLED_COLOR;

 cxGrid1TableView1.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView1.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView1.Items[2].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView1.DataController.RecordCount := 8;
 cxGrid1TableView1.DataController.Values[0,0] := CUSTOMER_TITLE;
 cxGrid1TableView1.DataController.Values[1,0] := CUSTOMER_CLASS_CONST;
 cxGrid1TableView1.DataController.Values[2,0] := CUSTOMER_BRANCH_CONST;
 cxGrid1TableView1.DataController.Values[3,0] := CUSTOMER_LabelEDRPOU_CONST;
 cxGrid1TableView1.DataController.Values[4,0] := CUSTOMER_ACC_CONST;
 cxGrid1TableView1.DataController.Values[5,0] := CUSTOMER_NALOGSVNOMER;
 cxGrid1TableView1.DataController.Values[6,0] := CUSTOMER_LabelNALOGNOMER_CONST;
 cxGrid1TableView1.DataController.Values[7,0] := CUSTOMER_BOSS_CONST;

 cxGrid1TableView1.DataController.Values[0,1] := '';
 cxGrid1TableView1.DataController.Values[1,1] := '';
 cxGrid1TableView1.DataController.Values[2,1] := '';
 cxGrid1TableView1.DataController.Values[3,1] := '';
 cxGrid1TableView1.DataController.Values[4,1] := '';
 cxGrid1TableView1.DataController.Values[5,1] := '';
 cxGrid1TableView1.DataController.Values[6,1] := '';
 cxGrid1TableView1.DataController.Values[7,1] := '';

 cxGrid1TableView1.DataController.Values[0,2] := 'False';
 cxGrid1TableView1.DataController.Values[1,2] := 'False';
 cxGrid1TableView1.DataController.Values[2,2] := 'False';
 cxGrid1TableView1.DataController.Values[3,2] := 'False';
 cxGrid1TableView1.DataController.Values[4,2] := 'False';
 cxGrid1TableView1.DataController.Values[5,2] := 'False';
 cxGrid1TableView1.DataController.Values[6,2] := 'False';
 cxGrid1TableView1.DataController.Values[7,2] := 'False';

end;

procedure TFSp_customer_search.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 if ACol = 2 then CanSelect := false;
end;

procedure TFSp_customer_search.cxGrid1TableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 if AFocusedRecord.Index in [1, 2] then (cxGrid1TableView1Column2.Properties as TcxButtonEditProperties).Buttons.Items[0].Visible := true
 else (cxGrid1TableView1Column2.Properties as TcxButtonEditProperties).Buttons.Items[0].Visible := false;
end;

procedure TFSp_customer_search.cxGrid1TableView1Column2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
//
end;

procedure TFSp_customer_search.SpeedButton1Click(Sender: TObject);
var
 i : integer;
begin
 for i := 0 to cxGrid1TableView1.DataController.RecordCount - 1 do begin
  cxGrid1TableView1.DataController.Values[i, 1] := '';
  cxGrid1TableView1.DataController.Values[i, 2] := 'False';
 end;
end;

end.
