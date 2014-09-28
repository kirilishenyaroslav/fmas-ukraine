unit sp_customer_FORM_ADD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask,
  BaseTypes, ExtCtrls, FIBQuery, pFIBQuery, pFIBStoredProc,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxCheckBox, cxDropDownEdit, cxCalendar, cxLookAndFeelPainters, cxButtons,
  Resources_unitb,GlobalSPR, Variants, uCommonSp,TiCommonProc,FIBDatabase, IBase,
  DB, FIBDataSet, pFIBDataSet;

type
  TFsp_customer_ADD = class(TForm)
    LabelTitle: TLabel;
    LabelClass: TLabel;
    nalogGroup: TGroupBox;
    LabelNDSNOMER: TLabel;
    LabelNDS_DATE: TLabel;
    LabelShortTitle: TLabel;
    pFIBStoredProc1: TpFIBStoredProc;
    LabelBranch: TLabel;
    InstanceEdit: TcxButtonEdit;
    BranchEdit: TcxButtonEdit;
    NameEdit: TcxTextEdit;
    ShortNameEdit: TcxTextEdit;
    nnsEdit: TcxTextEdit;
    DatennsEdit: TcxDateEdit;
    OKButton1: TcxButton;
    CancelButton: TcxButton;
    cxButton1: TcxButton;
    Bevel1: TBevel;
    FizLicoCheck: TcxCheckBox;
    PlatNdsCheck: TcxCheckBox;
    Label1: TLabel;
    NameUkrEdit: TcxTextEdit;
    DepCheck: TcxCheckBox;
    DepEdit: TcxButtonEdit;
    GroupBox1: TGroupBox;
    edrpouEdit: TcxTextEdit;
    LabelEDRPOU: TLabel;
    nalogEdit: TcxTextEdit;
    LabelNALOGNOMER: TLabel;
    Label2: TLabel;
    DnDzIDEdit: TcxTextEdit;
    Label3: TLabel;
    AdrEdit: TcxButtonEdit;
    Label4: TLabel;
    CntLabel: TLabel;
    NameFullEdit: TcxTextEdit;
    Label5: TLabel;
    Label6: TLabel;
    AdrFullEdit: TcxTextEdit;
    pFIBDataSet1: TpFIBDataSet;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InstanceEditButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure CatEditKeyPress(Sender: TObject; var Key: Char);
    procedure BranchEditKeyPress(Sender: TObject; var Key: Char);
    procedure DatennsEditKeyPress(Sender: TObject; var Key: Char);
    procedure nnsEditKeyPress(Sender: TObject; var Key: Char);
    procedure edrpouEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nnsEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NalogEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BranchEditButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ShortNameEditKeyPress(Sender: TObject; var Key: Char);
    procedure cxButton1Click(Sender: TObject);
    procedure DepEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure DepCheckClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AdrEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure NameEditPropertiesChange(Sender: TObject);
    procedure NameEditExit(Sender: TObject);
  public
    Action  : TSpravAction;
    id_type_property   : integer;
    id_higher_instance : integer;
    id_branch          : integer;
    id_cat_customer    : integer;
    id_adress          : integer;
    id_department      : variant;
    isFirst            : boolean;
    SkipChecks         : boolean;
    DB_Handle:TISC_DB_HANDLE;
    function CheckNulls : boolean;
    procedure DisableControls;
  end;

implementation
uses sys_options, sp_customer_form,
     cxCustomData, sp_customer_FORM_DUPLICATES,
     dogLoaderUnit, LangUnit;

{$R *.DFM}

procedure TFsp_customer_ADD.DisableControls;
begin
 NameEdit.Properties.ReadOnly := true;
 ShortNameEdit.Properties.ReadOnly := true;
 InstanceEdit.Properties.OnButtonClick := Nil;
 BranchEdit.Properties.OnButtonClick := Nil;
 FizLicoCheck.Properties.ReadOnly := true;
 PlatNdsCheck.Properties.ReadOnly := true;
 nnsEdit.Properties.ReadOnly := true;
 edrpouEdit.Properties.ReadOnly := true;
 nalogEdit.Properties.ReadOnly := true;
 DatennsEdit.Properties.ReadOnly := true;
end;

function TFsp_customer_ADD.CheckNulls : boolean;
begin
 Result := false;
 if NameEdit.Text = '' then begin
  MessageBox(handle,PChar(CUSTOMER_TITLE_ERROR),PChar(CUSTOMER_MESSAGE_WARNING), MB_OK or MB_ICONWARNING);
  Result := true;
  exit;
 end;

 if EdrpouEdit.Text = '' then begin
  MessageBox(handle,PChar(CUSTOMER_EDRPOU_ERROR),PChar(CUSTOMER_MESSAGE_WARNING), MB_OK or MB_ICONWARNING);
  Result := true;
  exit;
 end;

{ if DatennsEdit.Text = '' then
 begin
  MessageBox(handle,PChar('”кажить дату номеру податкового св≥дченн€'),PChar(CUSTOMER_MESSAGE_WARNING), MB_OK or MB_ICONWARNING);
  Result := true;
  exit;
 end;}


end;

procedure TFsp_customer_ADD.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TFsp_customer_ADD.OKButton1Click(Sender: TObject);
var
 frm : TfrmSP_CUST_DUPL;
 res : integer;
 id : int64;
begin
 if DnDzIDEdit.text = '' then DnDzIDEdit.Text := '0';
 if SkipChecks then begin
  ModalResult := mrOk;
  exit;
 end;
 if CheckNulls then exit;
 if Length(NameEdit.Text) > 38 then
 begin
   if MessageDlg('”вага!', ' оличество символов больше 38. ' + #13 + 'ƒанный контрагент на платеже будет отображатьс€ не полностью.' + #13 + 'ѕродолжить?', mtConfirmation, [mbYes, mbNo]) = mrNo then Exit;
 end;
 if ShortNameEdit.Text = '' then ShortNameEdit.Text := NameEdit.Text;
 if Length(ShortNameEdit.Text) > 40 then ShortNameEdit.Text := Copy(ShortNameEdit.Text, 1, 39);
 frm := TfrmSP_CUST_DUPL.Create(owner);
 frm.Action := Action;

// TFsp_customer(Owner).CustDataSet.FieldByName('ID_CUSTOMER')
 id := -99;
 if TFsp_customer(Owner).CustDataSet.recordCount <> 0 then id := TFsp_customer(Owner).CustDataSet['ID_CUSTOMER'];
 if Action = saAdd then frm.pFIBDataSet1.SelectSQL.Text := 'SELECT * FROM PROC_PUB_SP_CUSTOMER_FIND_DUB(''' + edrpouEdit.Text + ''', -1)'
                   else frm.pFIBDataSet1.SelectSQL.Text := 'SELECT * FROM PROC_PUB_SP_CUSTOMER_FIND_DUB(''' + edrpouEdit.Text + ''', ' + IntToStr(id) + ')';
 frm.pFIBDataSet1.Open;
 if frm.pFIBDataSet1.RecordCount <> 0 then begin
  res := frm.ShowModal;
  if res = mrCancel then begin
   frm.pFIBDataSet1.Close;
   frm.Free;
   exit;
  end;
  if res = mrOk then begin
   TFsp_customer(Owner).LocateCustomer(frm.pFIBDataSet1['ID_CUSTOMER']);
   frm.pFIBDataSet1.Close;
   frm.Free;
   Close;
   exit;
  end;
 end;
 frm.pFIBDataSet1.Close;
 frm.Free;
 ModalResult := mrOK;
end;


procedure TFsp_customer_ADD.FormCreate(Sender: TObject);
begin
 LangPackApply(Self);
 DepEdit.Enabled := false;
 isFirst := true;

// DatennsEdit.Date := now;
{ LabelTitle.Caption:=CUSTOMER_TITLE;
 LabelShortTitle.Caption:=CUSTOMER_SHORTTITLE;
 FizLicoCheck.Properties.Caption:=CUSTOMER_FISOS_FLAG;
 LabelClass.Caption:=CUSTOMER_CLASS_CONST;
 LabelBranch.Caption:=CUSTOMER_BRANCH_CONST;
// nalogGroup.Caption:=CUSTOMER_NALOG_CONST;
 PlatNdsCheck.Properties.Caption:=CUSTOMER_PlatNdsCheck_CONST;
 LabelNDSNOMER.Caption:=CUSTOMER_LabelNDSNOMER_CONST;
 LabelNDS_DATE.Caption:=CUSTOMER_LabelNDS_DATE_CONST;
 LabelEDRPOU.Caption:=CUSTOMER_LabelEDRPOU_CONST;
 LabelNALOGNOMER.Caption:=CUSTOMER_LabelNALOGNOMER_CONST;
 OKButton1.Caption:=CUSTOMER_OK_BUT_CONST;
 CancelButton.Caption:=CUSTOMER_CANCEL_BUT_CONST;}
end;


procedure TFsp_customer_ADD.InstanceEditButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetIsts(self.Owner,TFsp_customer(self.Owner).WorkDatabase.Handle,fsnormal,TFsp_customer(self.Owner).ActualDate);
    if VarArrayDimCount(id)>0
    then begin
     if id[0]<>NULL
     then begin
            id_higher_instance := id[0];
            InstanceEdit.Text  := id[1];
     end;
   end;
end;

procedure TFsp_customer_ADD.FormShow(Sender: TObject);
begin
 if Action = saAdd then begin
  id_type_property   := -1;
  id_higher_instance := -1;
  id_branch          := -1;
  id_cat_customer    := -1;
  Self.id_adress     := -1;
  id_department      := -1;
  
 end;
 if not NameEdit.Enabled then CancelButton.SetFocus
                    else NameEdit.SetFocus;
end;

procedure TFsp_customer_ADD.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then ShortNameEdit.SetFocus;
end;

procedure TFsp_customer_ADD.CatEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  InstanceEdit.SetFocus;
 end;
end;

procedure TFsp_customer_ADD.BranchEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  edrpouEdit.SetFocus;
 end;
end;

procedure TFsp_customer_ADD.DatennsEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  nnsEdit.SetFocus;
 end;
end;

procedure TFsp_customer_ADD.nnsEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 CheckInteger(Key);
end;

procedure TFsp_customer_ADD.edrpouEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = 13 then nalogEdit.SetFocus;
end;

procedure TFsp_customer_ADD.nnsEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then DatennsEdit.SetFocus;
end;

procedure TFsp_customer_ADD.NalogEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = 13 then OKButton1.SetFocus;
end;

procedure TFsp_customer_ADD.BranchEditButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetBranches(self.Owner,TFsp_customer(self.Owner).WorkDatabase.Handle,fsnormal,TFsp_customer(self.Owner).ActualDate);
    if VarArrayDimCount(id)>0
    then begin
     if id[0]<>NULL
     then begin
            id_branch := id[0];
            BranchEdit.Text := id[1];
     end;
   end;


end;

procedure TFsp_customer_ADD.ShortNameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then FizLicoCheck.SetFocus;
end;


procedure TFsp_customer_ADD.cxButton1Click(Sender: TObject);
//var
//  id:variant;
begin
{    id:=GlobalSPR.GetAdresses(self.Owner,TFsp_customer(self.Owner).WorkDatabase.Handle,fsnormal,TFsp_customer(self.Owner).ActualDate,SHOWONLYADRESS,WORK_SELECT,id_address);
    if VarArrayDimCount(id)>0
    then begin
     if id[0]<>NULL
     then begin
          id_address:=id[0];
     end;
   end;}
end;

procedure TFsp_customer_ADD.DepEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(TFsp_customer(self.Owner).WorkDatabase.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единична€ выборка
            FieldValues['Select'] := 1;

            //FieldValues['Root_Department'] := 2612;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
        // показать справочник и проанализировать результат (выбор одного подр.)
    sp.Show;
    if sp.Output = nil then
        ShowMessage('Departments: Output is NIL!!!')
    else
    if not sp.Output.IsEmpty then
    begin
//        Label1.Caption := IntToStr(sp.Output['Id_Department']) + ' ' +
//            sp.Output['Name_Short'];
        id_department := sp.Output['Id_Department'];
        DepEdit.Text := sp.Output['Name_FULL'];
    end else         DepCheck.Checked := False;

    sp.Free;
end;

procedure TFsp_customer_ADD.DepCheckClick(Sender: TObject);
begin
 if DepCheck.Checked then begin
  DepEdit.Enabled := true;
  if Visible then if DepEdit.Text = '' then DepEditPropertiesButtonClick(Self, 0);
 end else begin
  DepEdit.Enabled := false;
 end;
end;

procedure TFsp_customer_ADD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not DepCheck.Checked then id_department := null;
end;

procedure TFsp_customer_ADD.AdrEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    sp: TSprav;
    i : Integer;
begin
    // создать справочник (указать правильный путь)
    sp := GetSprav('Adresses.bpl');
    if sp <> nil then
    begin
    // заполнить входные параметры
        with sp.Input do
        begin
          Append;
          FieldValues['DBHandle'] := Integer(TFsp_customer(Self.Owner).WorkDatabase.Handle);
          if id_adress <> -1 then FieldValues['Id_Adress'] := id_adress else FieldValues['Id_Adress'] := null;
          FieldValues['Select'] := 1; // 0-просмотр, 1-выбор, 2-мультивыбор;
          FieldValues['ShowStyle'] := 4; // 0-модально, 1-MdiChild, 2 - форма добавлени€ адреса проживани€ без истории, 3 - форма добавлени€ места рождени€;
          Post;
        end;
    // показать справочник и проанализировать результат
    sp.Show;

    if( sp.Output <> nil ) and not sp.Output.IsEmpty then
       begin
         // идентификатор адреса, если он был добавлен
         id_adress := sp.Output['Id_Adress'];

         // в этом поле строкова€ форма адреса
         AdrEdit.Text := sp.Output['Name_Adr'];
          if(DB_Handle <>nil) then
          begin
           pFIBDataSet1.Database := TFsp_customer(Self.Owner).WorkDatabase;
           pFIBDataSet1.Transaction := TFsp_customer(Self.Owner).ReadTransaction;
           pFIBDataSet1.Close;
           pFIBDataSet1.SelectSQL.Text := 'select * from TI_GET_FULL_ADR(:id)';
           pFIBDataSet1.ParamByName('id').AsInt64 := id_adress;
           pFIBDataSet1.Open;
           AdrFullEdit.Text := pFIBDataSet1['FULL_NAME'];
          end;
        end;
    sp.Free;
   end;
end;

procedure TFsp_customer_ADD.NameEditPropertiesChange(Sender: TObject);
begin
 CntLabel.Caption := IntToStr(Length(NameEdit.Text));
end;

procedure TFsp_customer_ADD.NameEditExit(Sender: TObject);
begin
if(NameFullEdit.Text='') then
if(DB_Handle <>nil) then
NameFullEdit.Text:= GetFullName(DB_Handle, NameEdit.Text);
end;

end.
