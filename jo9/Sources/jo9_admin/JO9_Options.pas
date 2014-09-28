unit JO9_Options;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, ComCtrls, cxMemo, cxCheckBox,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxGridBandedTableView,
  TagTypes, FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, IBase, pFIBStoredProc, cxContainer, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxDropDownEdit, cxCalendar, cxCurrencyEdit, report_settings;

type
  TJO9_Options_Form = class(TForm)
    MainPanel: TPanel;
    PageControl: TPageControl;
    RepTabSheet: TTabSheet;
    RepGrid: TcxGrid;
    RepTableView: TcxGridTableView;
    is_Active_Column: TcxGridColumn;
    id_Report_Column: TcxGridColumn;
    Name_Report_Column: TcxGridColumn;
    is_Active_Old_Column: TcxGridColumn;
    RepGridLevel: TcxGridLevel;
    TabSheet1: TTabSheet;
    Shape5: TShape;
    Label1: TLabel;
    Shape1: TShape;
    Label7: TLabel;
    Undef_Cust_Edit: TcxButtonEdit;
    Show_Mng_Panel: TcxCheckBox;
    Not_Dif_Bdg: TcxCheckBox;
    Wizard_Form_Sh: TcxCheckBox;
    Use_Sec_Prov: TcxCheckBox;
    TabSheet2: TTabSheet;
    Shape6: TShape;
    Shape4: TShape;
    Shape3: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Name_Sys_Edit: TcxTextEdit;
    Sys_BegDateEdit: TcxDateEdit;
    GroupDocView: TcxButtonEdit;
    GroupDocAdd: TcxButtonEdit;
    RepPanel: TPanel;
    Shape2: TShape;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    StyleRepository: TcxStyleRepository;
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
    GridTableViewStyleSheet: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheet: TcxGridBandedTableViewStyleSheet;
    Database: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    Query: TpFIBQuery;
    StoredProc: TpFIBStoredProc;
    ShowMonthEdit: TcxCurrencyEdit;
    MainBookEdit: TcxCurrencyEdit;
    cxButton1: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ShowMonthEditKeyPress(Sender: TObject; var Key: Char);
    procedure Undef_Cust_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormResize(Sender: TObject);
    procedure GroupDocViewPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure GroupDocAddPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ApplyButtonClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure RepTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    { Private declarations }
  public
    id_Undef_Cust        : variant;
    id_Main_Book_Reg_Uch : variant;

    id_Group_Doc_View : variant;
    id_Group_Doc_Add  : variant;

    procedure InitConnection(DBhandle: TISC_DB_HANDLE; RTransaction: TISC_TR_HANDLE);

    procedure SelectReports;
    procedure SelectData;
    procedure SaveOptions;
  end;

function DoShowOptions(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         INFO : Pjo9_SYS_INFO; fs : TFormStyle) : boolean; stdcall;

exports  DoShowOptions;

var
  JO9_Options_Form: TJO9_Options_Form;
  SYS_INFO         : Pjo9_SYS_INFO;

implementation

uses DogLoaderUnit, LoadDogManedger, tagLibUnit, Rep_Setting_akt_sverki;

{$R *.dfm}

function DoShowOptions(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         INFO : Pjo9_SYS_INFO; fs : TFormStyle) : boolean; stdcall;
var
 f : TJO9_Options_Form;
begin
 SYS_INFO := INFO;

 if fs = fsNormal then begin
  JO9_Options_Form := TJO9_Options_Form.Create(AOwner);

  JO9_Options_Form.InitConnection(DBHandle, RTrans);
  JO9_Options_Form.FormStyle := fs;

  GetFormParams(JO9_Options_Form);
  JO9_Options_Form.ShowModal;
  SetFormParams(JO9_Options_Form);
 end
 else begin
  f := TJO9_Options_Form.Create(AOwner);

  f.InitConnection(DBHandle, RTrans);
  f.FormStyle := fs;

  GetFormParams(f);
  if fs = fsNormal then f.ShowModal
  else f.Show;
 end;

 Result := True;
end;

procedure TJO9_Options_Form.FormCreate(Sender: TObject);
begin
 is_Active_Column.DataBinding.ValueTypeClass     := TcxIntegerValueType;
 is_Active_Old_Column.DataBinding.ValueTypeClass := TcxIntegerValueType;

 id_Report_Column.DataBinding.ValueTypeClass     := TcxIntegerValueType;
 Name_Report_Column.DataBinding.ValueTypeClass   := TcxStringValueType;

 PageControl.ActivePageIndex := 0;
end;

procedure TJO9_Options_Form.InitConnection(DBhandle: TISC_DB_HANDLE;
  RTransaction: TISC_TR_HANDLE);
begin
 Database.Handle        := DBhandle;
 ReadTransaction.Handle := RTransaction;
end;

procedure TJO9_Options_Form.SelectReports;
begin
 RepTableView.DataController.RecordCount := 0;

 DataSet.SelectSQL.Text := 'select * from JO9_REPORTS';
 DataSet.Open;

 while not DataSet.Eof do begin
  with RepTableView.DataController do begin
   RecordCount := RecordCount + 1;

   Values[RecordCount - 1, 1] := DataSet.FieldByName('ID_REPORT').AsInteger;
   Values[RecordCount - 1, 2] := DataSet.FieldByName('NAME_REPORT').AsString;

   Query.SQL.Text := 'select * from JO9_REPORTS_SYS where ID_REPORT='
   + IntToStr(DataSet.FieldByName('ID_REPORT').AsInteger) + ' and KOD_SYS='
   + IntToStr(SYS_INFO^._id_Reg_Uch);

   Query.ExecQuery;
   if not Query.Eof then begin
    Values[RecordCount - 1, 0] := 1;
    Values[RecordCount - 1, 3] := 1;
   end
   else begin
    Values[RecordCount - 1, 0] := 0;
    Values[RecordCount - 1, 3] := 0;
   end;

   Query.Close;
  end;

  DataSet.Next;
 end;

 DataSet.Close;
end;

procedure TJO9_Options_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if not (fsModal in FormState) then SetFormParams(Self);

 Action := caFree;
end;

procedure TJO9_Options_Form.CancelButtonClick(Sender: TObject);
begin
 if fsModal in FormState then ModalResult := mrCancel
 else Close;
end;

procedure TJO9_Options_Form.FormShow(Sender: TObject);
begin
 SelectReports;
 SelectData;
end;

procedure TJO9_Options_Form.ShowMonthEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  GroupDocView.SetFocus;
  Key := #0;
  Exit;
 end;

 if not (Key in ['0'..'9', #8]) then begin
  Key := #0;
  Exit;
 end;
end;

procedure TJO9_Options_Form.Undef_Cust_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase']     := Integer(Database.Handle);
 i['FormStyle']    := fsNormal;
 i['bMultiSelect'] := false;
 i['id_session']   := -1;
 i['SelectMode']   := selCustomer;
 LoadSprav('Customer\CustPackage.bpl', Self, i, o);

 id_Undef_Cust        := o['id_Customer'];
 Undef_Cust_Edit.Text := o['Name_Customer'];

 i.Free;
 o.Free;
end;

procedure TJO9_Options_Form.SelectData;
begin
 //////// INI

 DataSet.SelectSQL.Text := 'select * from JO9_INI_SEL';
 DataSet.Open;

 if not DataSet.Eof then begin
  id_Undef_Cust          := DataSet.FieldByName('UNDEF_ID_CUST').AsVariant;
  Undef_Cust_Edit.Text   := DataSet.FieldByName('UNDEF_NAME_CUST').AsString;

  SHOW_MNG_PANEL.Checked   := DataSet.FieldByName('SHOW_MNG_PANEL').AsInteger = 1;
  NOT_DIF_BDG.Checked      := DataSet.FieldByName('NOT_DIF_BDG_FG').AsInteger = 1;
  WIZARD_FORM_SH.Checked   := DataSet.FieldByName('WIZARD_FORM_SH').AsInteger = 1;
  USE_SEC_PROV.Checked     := DataSet.FieldByName('USE_SECOND_PROVS').AsInteger = 1;

  ID_MAIN_BOOK_REG_UCH     := DataSet.FieldByName('MAIN_BOOK_REG_UCH').AsVariant;
  MainBookEdit.Text        := DataSet.FieldByName('MAIN_BOOK_REG_UCH').AsString;
 end;

 DataSet.Close;

 ///////// INST

 DataSet.SelectSQL.Text := 'select * from JO9_INST_SEL(' + IntToStr(SYS_INFO^._id_Reg_Uch) + ')';
 DataSet.Open;

 if not DataSet.Eof then begin
  Name_Sys_Edit.Text := DataSet.FieldByName('NAME_SYS').AsString;

  if not VarIsNull(DataSet.FieldByName('SYS_BEGIN').AsVariant) then Sys_BegDateEdit.Date := DataSet.FieldByName('SYS_BEGIN').AsDateTime;
  if not VarIsNull(DataSet.FieldByName('SHOW_MONTHS').AsVariant) then ShowMonthEdit.Text := DataSet.FieldByName('SHOW_MONTHS').AsString;

  id_Group_Doc_View := DataSet.FieldByName('ID_GROUP_DOG').AsVariant;
  id_Group_Doc_Add  := DataSet.FieldByName('ID_GROUP_DOG_ADD').AsVariant;

  GroupDocView.Text := DataSet.FieldByName('NAME_GROUP_DOC').AsString;
  GroupDocAdd.Text  := DataSet.FieldByName('NAME_GROUP_DOC_ADD').AsString;
 end;

 DataSet.Close;
end;

procedure TJO9_Options_Form.FormResize(Sender: TObject);
begin
 MainPanel.Left := (Width - MainPanel.Width - 7) div 2;
 MainPanel.Top  := (Height - MainPanel.Height - 32) div 2;
end;

procedure TJO9_Options_Form.GroupDocViewPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 f : variant;
begin
 f := null;

 f := WorkGroupDoc(Self, Database.Handle, fsNormal, 'tip_dog');

 if VarIsNull(f) then Exit;
 if VarArrayDimCount(f) <= 0 then Exit;

 if VarIsNull(f[0]) then Exit;
 if VarArrayDimCount(f[0]) <= 0 then Exit;

 id_Group_Doc_View := f[0][0];
 GroupDocView.Text := f[0][1];
end;

procedure TJO9_Options_Form.GroupDocAddPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 f : variant;
begin
 f := null;

 f := WorkGroupDoc(Self, Database.Handle, fsNormal, 'tip_dog');

 if VarIsNull(f) then Exit;
 if VarArrayDimCount(f) <= 0 then Exit;

 if VarIsNull(f[0]) then Exit;
 if VarArrayDimCount(f[0]) <= 0 then Exit;

 id_Group_Doc_Add := f[0][0];
 GroupDocAdd.Text := f[0][1];
end;

procedure TJO9_Options_Form.SaveOptions;
var
 ShowMngPanel,
 WizardFormSh,
 NotDifBdg,
 UseSecProv    : byte;
 i             : integer;
begin
 StoredProc.Transaction.StartTransaction;

 if Show_Mng_Panel.Checked then ShowMngPanel := 1 else ShowMngPanel := 0;
 if Wizard_Form_Sh.Checked then WizardFormSh := 1 else WizardFormSh := 0;
 if Not_Dif_Bdg.Checked    then NotDifBdg    := 1 else NotDifBdg    := 0;
 if Use_Sec_Prov.Checked   then UseSecProv   := 1 else UseSecProv   := 0;

 StoredProc.ExecProcedure('JO9_INI_MOD', [id_Undef_Cust, ShowMngPanel,
 WizardFormSh, NotDifBdg, UseSecProv, MainBookEdit.Value]);

 StoredProc.ExecProcedure('JO9_INST_MOD', [SYS_INFO._id_Reg_Uch, Name_Sys_Edit.Text,
 Sys_BegDateEdit.Date, ShowMonthEdit.Value, id_Group_Doc_View, id_Group_Doc_Add]);

 with RepTableView.DataController do begin
  for i := 0 to RecordCount - 1 do begin
   if Values[i, 0] <> Values[i, 3] then begin
    if Values[i, 0] = 0 then
     StoredProc.ExecProcedure('JO9_REPORTS_SYS_DEL', [Values[i, 1], SYS_INFO^._id_Reg_Uch])
    else
     StoredProc.ExecProcedure('JO9_REPORTS_SYS_ADD', [Values[i, 1], SYS_INFO^._id_Reg_Uch]);
   end;
  end;
 end;

 StoredProc.Transaction.Commit;

 ShowMessage('Зміни успішно збережено!' + #13 + #13 + 'Але вони набудуть сили з наступним запуском системи!');
end;

procedure TJO9_Options_Form.ApplyButtonClick(Sender: TObject);
begin
 SaveOptions;

 Close;
end;

procedure TJO9_Options_Form.cxButton1Click(Sender: TObject);
var
  Report_Settings_Form: TReport_Settings_Form;
  f:TSetPropAktForm;
begin
  if RepTableView.DataController.Values[RepTableView.DataController.FocusedRecordIndex,1]=15 then
  begin
    f:=TSetPropAktForm.Create(Self);
    f.pkod_sys:=SYS_INFO._kod_Sys;
    f.db.Handle:= Database.Handle;
    f.ShowModal;
    f.Free;
  end
  else
  begin
//  ShowMessage(SYS_INFO._kod_Sys);
  Report_Settings_Form:=TReport_Settings_Form.Create(self, Database.Handle, 14,SYS_INFO._kod_Sys);
  Report_Settings_Form.ShowModal;
  end;
end;

procedure TJO9_Options_Form.RepTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if((AFocusedRecord.Index=13)or (AFocusedRecord.Index=14)or (AFocusedRecord.Index=15)) then
    cxButton1.Enabled:=true
  else
    cxButton1.Enabled:=false;
end;

end.
