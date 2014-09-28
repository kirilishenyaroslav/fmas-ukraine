unit FilterUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, cxCheckBox, cxTL, cxDropDownEdit,
  cxTextEdit, cxLookAndFeelPainters, StdCtrls, cxButtons, ComCtrls,
  cxHeader, cxLike, cxContainer, cxMaskEdit, cxCalendar, cxCurrencyEdit,
  Registry, LoadDogManedger, DogLoaderUnit, cxButtonEdit, IBase, GlobalSPR;

type
  TDateInfo = record
   Label1, Label2 : TLabel;
   Date1, Date2 : TcxDateEdit;
   index : integer;
  end;
  TSumInfo = record
   Label1, Label2 : TLabel;
   Sum1, Sum2 : TcxCurrencyEdit;
   index : integer;
  end;

  TFilterForm = class(TForm)
    Panel1: TPanel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
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
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1TableView1Column2: TcxGridColumn;
    cxGrid1TableView1Column3: TcxGridColumn;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxGrid1TableView1Column4: TcxGridColumn;
    Bevel1: TBevel;
    cxButton4: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
  private
   DBHWND : TISC_DB_HANDLE;
   RTrans, WTrans : TISC_TR_HANDLE;
    DBTableView : TcxGridDBTableView;
//    RusNames : array of string;
    Labels : array of TLabel;
    Edits  : array of TcxCustomTextEdit;
    Dates  : array of TDateInfo;
    Checks : array of TcxCheckBox;
    Sums   : array of TSumInfo;
    id_customer : integer;
    procedure SaveInfo;
    procedure LoadInfo;
    procedure onEditBtnClick(Sender: TObject; AButtonIndex: Integer);
  end;


function ShowFilter(AOwner : TForm; const Capt : string; DBTableView : TcxGridDBTableView; const Fields : array of string; DBhandle : TISC_DB_HANDLE; RTransaction : TISC_TR_HANDLE; WTransaction : TISC_TR_HANDLE) : HWND; stdcall;
exports ShowFilter;

implementation
uses cxVariants;

{$R *.dfm}

const
 COND_BEGINS  = 'Починається з';
 COND_CONTAIN = 'Містить';
 COND_EQUAL   = 'Рівняється';

procedure TFilterForm.SaveInfo;
var
 r : TRegistry;
 i : integer;
begin
 r := TRegistry.Create;
 r.RootKey := HKEY_CURRENT_USER;
 r.OpenKey(REG_KEY+'Filter\'+Owner.name, true);
 for i := 0 to Length(Edits) - 1 do r.WriteString('Edit_'+IntToStr(i), Edits[i].Text);
 for i := 0 to Length(Dates) - 1 do begin
  r.WriteString('Date1_'+IntToStr(i), Dates[i].Date1.Text);
  r.WriteString('Date2_'+IntToStr(i), Dates[i].Date1.Text);
 end;
 for i := 0 to Length(Checks) - 1 do if Checks[i].Checked then r.WriteString('Check_'+IntToStr(i), '1') else r.WriteString('Check_'+IntToStr(i), '1');
 for i := 0 to Length(Sums) - 1 do begin
  r.WriteString('Sum1_'+IntToStr(i), Sums[i].Sum1.Text);
  r.WriteString('Sum2_'+IntToStr(i), Sums[i].Sum2.Text);
 end;
 r.Free;
end;

procedure TFilterForm.LoadInfo;
var
 r : TRegistry;
 i : integer;
 s : string;
begin
 r := TRegistry.Create;
 r.RootKey := HKEY_CURRENT_USER;
 r.OpenKey(REG_KEY+'Filter\'+Owner.name, true);
 for i := 0 to Length(Edits) - 1 do Edits[i].Text := r.ReadString('Edit_'+IntToStr(i));
 for i := 0 to Length(Dates) - 1 do begin
  s := r.ReadString('Date1_'+IntToStr(i));
  if s <> '' then Dates[i].Date1.Date := StrToDate(s);
  s := r.ReadString('Date2_'+IntToStr(i));
  if s <> '' then Dates[i].Date2.Date := StrToDate(s);
 end;
 for i := 0 to Length(Checks) - 1 do Checks[i].Checked := r.ReadString('Check_'+IntToStr(i)) = '1';
 for i := 0 to Length(Sums) - 1 do begin
  Sums[i].Sum1.Text := r.ReadString('Sum1_'+IntToStr(i));
  Sums[i].Sum2.Text := r.ReadString('Sum2_'+IntToStr(i));
 end;
 r.Free;
end;


function ShowFilter(AOwner : TForm; const Capt : string; DBTableView : TcxGridDBTableView; const Fields : array of string; DBhandle : TISC_DB_HANDLE; RTransaction : TISC_TR_HANDLE; WTransaction : TISC_TR_HANDLE) : HWND;
var
 frm   : TFilterForm;
 i, j  : integer;
 first : boolean;
begin
 frm := TFilterForm.Create(AOwner);
 frm.DBHWND := DBhandle;
 frm.RTrans := RTransaction;
 frm.WTrans := WTransaction;
 frm.id_customer := -1;
 Result := frm.Handle;
 frm.Height := Length(Fields) * 18 + 100;
 frm.Caption := Capt;
 frm.DBTableView := DBTableView;
 first := true;
 for i := 0 to Length(Fields) - 1 do begin
  for j := 0 to DBTableView.ColumnCount - 1 do if DBTableView.Columns[j].DataBinding.FieldName = Fields[i] then begin
{   frm.cxGrid1TableView1.DataController.RecordCount := frm.cxGrid1TableView1.DataController.RecordCount + 1;
   frm.cxGrid1TableView1.DataController.Values[frm.cxGrid1TableView1.DataController.RecordCount - 1, 0] := DBTableView.Columns[j].Caption;
   frm.cxGrid1TableView1.DataController.Values[frm.cxGrid1TableView1.DataController.RecordCount - 1, 1] := COND_CONTAIN;
   frm.cxGrid1TableView1.DataController.Values[frm.cxGrid1TableView1.DataController.RecordCount - 1, 2] := '';
   frm.cxGrid1TableView1.DataController.Values[frm.cxGrid1TableView1.DataController.RecordCount - 1, 3] := Fields[i];}
   SetLength(frm.Labels, Length(frm.Labels) + 1);
   frm.Labels[Length(frm.Labels) - 1] := TLabel.Create(frm);
   frm.Labels[Length(frm.Labels) - 1].Parent := frm;
   frm.Labels[Length(frm.Labels) - 1].Left := 16;
   frm.Labels[Length(frm.Labels) - 1].Top := 16 + (Length(frm.Labels) - 1) * 36;
   frm.Labels[Length(frm.Labels) - 1].Caption := DBTableView.Columns[j].Caption;
   if DBTableView.Columns[j].PropertiesClass = TcxDateEditProperties then begin
     SetLength(frm.Dates, Length(frm.Dates) + 1);
     frm.Dates[Length(frm.Dates) - 1].index := j;
     //Label1
     frm.Dates[Length(frm.Dates) - 1].Label1 := TLabel.Create(frm);
     frm.Dates[Length(frm.Dates) - 1].Label1.Parent := frm;
     frm.Dates[Length(frm.Dates) - 1].Label1.Left := 18;
     frm.Dates[Length(frm.Dates) - 1].Label1.Top  := frm.Labels[Length(frm.Labels) - 1].Top + 18;
     frm.Dates[Length(frm.Dates) - 1].Label1.Caption := 'З';
     //Label2
     frm.Dates[Length(frm.Dates) - 1].Label2 := TLabel.Create(frm);
     frm.Dates[Length(frm.Dates) - 1].Label2.Parent := frm;
     frm.Dates[Length(frm.Dates) - 1].Label2.Left := frm.Width div 2 - 4;
     frm.Dates[Length(frm.Dates) - 1].Label2.Top  := frm.Labels[Length(frm.Labels) - 1].Top + 18;
     frm.Dates[Length(frm.Dates) - 1].Label2.Caption := 'По';
     //Edit1
     frm.Dates[Length(frm.Dates) - 1].Date1 := TcxDateEdit.Create(frm);
     frm.Dates[Length(frm.Dates) - 1].Date1.Parent := frm;
     frm.Dates[Length(frm.Dates) - 1].Date1.Left := 28;
     frm.Dates[Length(frm.Dates) - 1].Date1.Top  := frm.Labels[Length(frm.Labels) - 1].Top + 14;
     frm.Dates[Length(frm.Dates) - 1].Date1.Width := frm.Width div 2 - 32 - 4;
     frm.Dates[Length(frm.Dates) - 1].Date1.Style.Color := clMoneyGreen;
     //Edit2
     frm.Dates[Length(frm.Dates) - 1].Date2 := TcxDateEdit.Create(frm);
     frm.Dates[Length(frm.Dates) - 1].Date2.Parent := frm;
     frm.Dates[Length(frm.Dates) - 1].Date2.Left := frm.Width div 2 + 12;
     frm.Dates[Length(frm.Dates) - 1].Date2.Top  := frm.Labels[Length(frm.Labels) - 1].Top + 14;
     frm.Dates[Length(frm.Dates) - 1].Date2.Width := frm.Width div 2 - 32 - 4;
     frm.Dates[Length(frm.Dates) - 1].Date2.Style.Color := clMoneyGreen;
     if first then frm.Dates[Length(frm.Dates) - 1].Date1.SetFocus;
   end else if DBTableView.Columns[j].PropertiesClass = TcxCheckBoxProperties then begin
     SetLength(frm.Checks, Length(frm.Checks) + 1);
     frm.Checks[Length(frm.Checks) - 1] := TcxCheckBox.Create(frm);
     frm.Checks[Length(frm.Checks) - 1].Parent := frm;
     frm.Checks[Length(frm.Checks) - 1].Left := frm.Labels[Length(frm.Labels) - 1].Left + frm.Labels[Length(frm.Labels) - 1].Width + 2;
     frm.Checks[Length(frm.Checks) - 1].Top := frm.Labels[Length(frm.Labels) - 1].Top - 4;
     frm.Checks[Length(frm.Checks) - 1].Properties.Caption := '';
     frm.Checks[Length(frm.Checks) - 1].Tag := j;
     if first then frm.Checks[Length(frm.Checks) - 1].SetFocus;
   end else if DBTableView.Columns[j].PropertiesClass = TcxCurrencyEditProperties then begin
     SetLength(frm.sums, Length(frm.sums) + 1);
     frm.sums[Length(frm.sums) - 1].index := j;
     //Label1
     frm.sums[Length(frm.sums) - 1].Label1 := TLabel.Create(frm);
     frm.sums[Length(frm.sums) - 1].Label1.Parent := frm;
     frm.sums[Length(frm.sums) - 1].Label1.Left := 18;
     frm.sums[Length(frm.sums) - 1].Label1.Top  := frm.Labels[Length(frm.Labels) - 1].Top + 18;
     frm.sums[Length(frm.sums) - 1].Label1.Caption := '>';
     //Label2
     frm.sums[Length(frm.sums) - 1].Label2 := TLabel.Create(frm);
     frm.sums[Length(frm.sums) - 1].Label2.Parent := frm;
     frm.sums[Length(frm.sums) - 1].Label2.Left := frm.Width div 2+2;
     frm.sums[Length(frm.sums) - 1].Label2.Top  := frm.Labels[Length(frm.Labels) - 1].Top + 18;
     frm.sums[Length(frm.sums) - 1].Label2.Caption := '<';
     //Sum1
     frm.sums[Length(frm.sums) - 1].Sum1 := TcxCurrencyEdit.Create(frm);
     frm.sums[Length(frm.sums) - 1].Sum1.Parent := frm;
     frm.sums[Length(frm.sums) - 1].Sum1.Left := 28;
     frm.sums[Length(frm.sums) - 1].Sum1.Top  := frm.Labels[Length(frm.Labels) - 1].Top + 14;
     frm.sums[Length(frm.sums) - 1].Sum1.Width := frm.Width div 2 - 32 - 4;
     frm.sums[Length(frm.sums) - 1].Sum1.Style.Color := clMoneyGreen;
     frm.sums[Length(frm.sums) - 1].Sum1.Properties.DisplayFormat := '0.00';
     //Sum2
     frm.sums[Length(frm.sums) - 1].Sum2 := TcxCurrencyEdit.Create(frm);
     frm.sums[Length(frm.sums) - 1].Sum2.Parent := frm;
     frm.sums[Length(frm.sums) - 1].Sum2.Left := frm.Width div 2 + 12;
     frm.sums[Length(frm.sums) - 1].Sum2.Top  := frm.Labels[Length(frm.Labels) - 1].Top + 14;
     frm.sums[Length(frm.sums) - 1].Sum2.Width := frm.Width div 2 - 32 - 4;
     frm.sums[Length(frm.sums) - 1].Sum2.Style.Color := clMoneyGreen;
     frm.sums[Length(frm.sums) - 1].Sum2.Properties.DisplayFormat := '0.00';
     if first then frm.sums[Length(frm.sums) - 1].Sum1.SetFocus;
   end else begin
     SetLength(frm.Edits, Length(frm.Edits) + 1);
     if DBTableView.Columns[j].Tag = 1 then begin
      frm.Edits[Length(frm.Edits) - 1] := TcxButtonEdit.Create(frm);
      TcxButtonEdit(frm.Edits[Length(frm.Edits) - 1]).Properties.OnButtonClick := frm.onEditBtnClick;
      TcxButtonEdit(frm.Edits[Length(frm.Edits) - 1]).ShowHint := false;
      TcxButtonEdit(frm.Edits[Length(frm.Edits) - 1]).Hint := 'customers';
     end else frm.Edits[Length(frm.Edits) - 1] := TcxTextEdit.Create(frm);
     frm.Edits[Length(frm.Edits) - 1].Parent := frm;
     frm.Edits[Length(frm.Edits) - 1].Left := 16;
     frm.Edits[Length(frm.Edits) - 1].Top := frm.Labels[Length(frm.Labels) - 1].Top + 14;
     frm.Edits[Length(frm.Edits) - 1].Width := frm.Width - 40;
     frm.Edits[Length(frm.Edits) - 1].Tag := j;
     TcxTextEdit(frm.Edits[Length(frm.Edits) - 1]).Style.Color := clMoneyGreen;
     if first then frm.Edits[Length(frm.Edits) - 1].SetFocus;
   end;
   first := false;
   break;
  end;
 end;
 frm.Height := (Length(frm.Labels) + 1) * 36 + frm.panel1.Height + 16;
 //Load default values
 frm.LoadInfo;
end;

procedure TFilterForm.FormCreate(Sender: TObject);
var
 r : TRegistry;
begin
 cxGrid1TableView1.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView1.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
 TcxComboBoxProperties(cxGrid1TableView1.Items[1].Properties).Items.Add(COND_BEGINS);
 TcxComboBoxProperties(cxGrid1TableView1.Items[1].Properties).Items.Add(COND_CONTAIN);
 TcxComboBoxProperties(cxGrid1TableView1.Items[1].Properties).Items.Add(COND_EQUAL);
 cxGrid1TableView1.Items[2].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView1.Items[3].DataBinding.ValueTypeClass := TcxStringValueType;
end;

procedure TFilterForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
 i : integer;
begin
 for i := 0 to Length(Labels) - 1 do Labels[i].Free;
 for i := 0 to Length(Edits) - 1 do Edits[i].Free;
 for i := 0 to Length(Checks) - 1 do Checks[i].Free;
 for i := 0 to Length(Dates) - 1 do begin
  Dates[i].Label1.Free;
  Dates[i].Label2.Free;
  Dates[i].Date1.Free;
  Dates[i].Date2.Free;
 end;
 for i := 0 to Length(sums) - 1 do begin
  sums[i].Label1.Free;
  sums[i].Label2.Free;
  sums[i].Sum1.Free;
  sums[i].Sum2.Free;
 end;
 Labels := Nil;
 Edits  := Nil;
 Dates  := Nil;
 Checks := Nil;
 Sums   := Nil;
 Action := caFree;
end;

procedure TFilterForm.cxButton2Click(Sender: TObject);
begin
 Close;
end;

procedure TFilterForm.cxButton1Click(Sender: TObject);
var
 i : integer;
begin
 DBTableView.DataController.Filter.Clear;
 if Length(Edits) <> 0 then for i := 0 to Length(Edits) - 1 do if Edits[i].Text <> '' then begin
  DBTableView.DataController.Filter.AddItem(Nil, DBTableView.Columns[Edits[i].Tag], foLike, '%' + Edits[i].Text + '%', '%' + Edits[i].Text + '%');
 end;

 if Length(Checks) <> 0 then for i := 0 to Length(Checks) - 1 do
  if Checks[i].Checked then DBTableView.DataController.Filter.AddItem(Nil, DBTableView.Columns[Checks[i].Tag], foEqual, 1, '1')
                       else DBTableView.DataController.Filter.AddItem(Nil, DBTableView.Columns[Checks[i].Tag], foEqual, 0, '0');

 if Length(Dates) <> 0 then for i := 0 to Length(Dates) - 1 do begin
  if (Dates[i].Date1.Text <> '') and (Dates[i].Date2.Text <> '') then begin
   DBTableView.DataController.Filter.AddItem(Nil, DBTableView.Columns[Dates[i].index], foBetween, VarBetweenArrayCreate(Dates[i].Date1.Date, Dates[i].Date2.Date), Dates[i].Date1.Text + ' and ' + Dates[i].Date2.Text);
  end else if (Dates[i].Date1.Text <> '') then begin
   DBTableView.DataController.Filter.AddItem(Nil, DBTableView.Columns[Dates[i].index], foGreater, Dates[i].Date1.Date, Dates[i].Date1.Text);
  end else if (Dates[i].Date2.Text <> '') then begin
   DBTableView.DataController.Filter.AddItem(Nil, DBTableView.Columns[Dates[i].index], foLess, Dates[i].Date2.Date, Dates[i].Date2.Text);
  end;
 end;

 if Length(Sums) <> 0 then for i := 0 to Length(Sums) - 1 do begin
  if (Sums[i].Sum1.Text <> '') and (Sums[i].Sum2.Text <> '') then begin
   DBTableView.DataController.Filter.AddItem(Nil, DBTableView.Columns[Sums[i].index], foBetween, VarBetweenArrayCreate(Sums[i].Sum1.Text, Sums[i].Sum2.Text), Sums[i].Sum1.Text + ' and ' + Sums[i].Sum2.Text);
  end else if (Sums[i].Sum1.Text <> '') then begin
   DBTableView.DataController.Filter.AddItem(Nil, DBTableView.Columns[Sums[i].index], foGreater, Sums[i].Sum1.Text, Sums[i].Sum1.Text);
  end else if (Sums[i].Sum2.Text <> '') then begin
   DBTableView.DataController.Filter.AddItem(Nil, DBTableView.Columns[Sums[i].index], foLess, Sums[i].Sum2.Text, Sums[i].Sum2.Text);
  end;
 end;
 { for i := 0 to cxGrid1TableView1.DataController.RecordCount - 1 do if cxGrid1TableView1.DataController.Values[i, 2] <> '' then begin
  for j := 0 to DBTableView.ColumnCount - 1 do if DBTableView.Columns[j].DataBinding.FieldName = cxGrid1TableView1.DataController.Values[i, 3] then begin
   if cxGrid1TableView1.DataController.Values[i, 1] = COND_BEGINS then DBTableView.DataController.Filter.AddItem(Nil, DBTableView.Columns[j], foLike, cxGrid1TableView1.DataController.Values[i, 2] + '%', cxGrid1TableView1.DataController.Values[i, 2]);
   if cxGrid1TableView1.DataController.Values[i, 1] = COND_CONTAIN then DBTableView.DataController.Filter.AddItem(Nil, DBTableView.Columns[j], foLike, '%' + cxGrid1TableView1.DataController.Values[i, 2] + '%', cxGrid1TableView1.DataController.Values[i, 2]);
   if cxGrid1TableView1.DataController.Values[i, 1] = COND_EQUAL then DBTableView.DataController.Filter.AddItem(Nil, DBTableView.Columns[j], foEqual, cxGrid1TableView1.DataController.Values[i, 2], cxGrid1TableView1.DataController.Values[i, 2]);
  end;
 end;}
 SaveInfo;
 DBTableView.DataController.Filter.Active := true;
 Close;
end;

procedure TFilterForm.cxButton3Click(Sender: TObject);
var
 i : integer;
begin
 if Length(Edits) <> 0 then for i := 0 to Length(Edits) - 1 do Edits[i].Text := '';
 if Length(Dates) <> 0 then for i := 0 to Length(Dates) - 1 do begin
  Dates[i].Date1.Text := '';
  Dates[i].Date2.Text := '';
 end;
 if Length(Sums) <> 0 then for i := 0 to Length(Sums) - 1 do begin
  Sums[i].Sum1.Text := '';
  Sums[i].Sum2.Text := '';
 end;
{ for i := 0 to cxGrid1TableView1.DataController.RecordCount - 1 do begin
  cxGrid1TableView1.DataController.Values[i, 1] := COND_BEGINS;
  cxGrid1TableView1.DataController.Values[i, 2] := '';
 end;}
end;

procedure TFilterForm.onEditBtnClick(Sender: TObject; AButtonIndex: Integer);
var
 res : Variant;
begin
 if TcxButtonEdit(Sender).hint = 'customers' then begin
  res := ShowCustomersSprav(Self, DBHWND, fsNormal, now, csmCustomers, id_customer, -1);
  if VarArrayDimCount(res) > 0 then begin
   id_customer := res[0];
   TcxButtonEdit(Sender).Text := Res[2];
  end;
 end; 
end;

procedure TFilterForm.cxButton4Click(Sender: TObject);
begin
 DBTableView.DataController.Filter.Active := false;
 DBTableView.DataController.Filter.Clear;
 Close;
end;

end.
