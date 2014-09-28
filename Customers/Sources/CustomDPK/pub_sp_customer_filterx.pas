unit pub_sp_customer_filterx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxControls, cxContainer, cxEdit, cxCheckBox, StdCtrls,
  cxButtons, cxDropDownEdit, cxCalendar, ActnList, cxMRUEdit,
  ComCtrls, cxLabel, ib_externals;

type
  TfrmCustomerFilter = class(TForm)
    Panel1: TPanel;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    ClearButton: TcxButton;
    GroupBox2: TGroupBox;
    mfoCheck: TcxCheckBox;
    typeAccCheck: TcxCheckBox;
    accCheck: TcxCheckBox;
    FilterProductGroup: TGroupBox;
    CustCheck: TcxCheckBox;
    edrpouCheck: TcxCheckBox;
    fizLicoCheck: TcxCheckBox;
    GroupBox1: TGroupBox;
    CheckCustNNSDate: TcxCheckBox;
    CheckCustNNSNum: TcxCheckBox;
    FilterCustomerNNSDate: TcxDateEdit;
    CheckCustPDV: TcxCheckBox;
    CheckCustPNP: TcxCheckBox;
    CheckCustPodNum: TcxCheckBox;
    FIlterCustomerNNSNum: TcxComboBox;
    FilterCustPodNum: TcxComboBox;
    CustEdit: TcxTextEdit;
    edrpouEdit: TcxTextEdit;
    mfoEdit: TcxTextEdit;
    accEdit: TcxTextEdit;
    typeAccEdit: TcxTextEdit;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    cbDnDzId: TcxCheckBox;
    edDnDzID: TcxTextEdit;
    cxComboBox1: TcxComboBox;
    cxLabel1: TcxLabel;
    depEdit: TcxButtonEdit;
    depCheck: TcxCheckBox;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure CustCheckClick(Sender: TObject);
    procedure edrpouCheckClick(Sender: TObject);
    procedure accEditClick(Sender: TObject);
    procedure CheckCustNNSNumClick(Sender: TObject);
    procedure CheckCustNNSDateClick(Sender: TObject);
    procedure mfoCheckClick(Sender: TObject);
    procedure typeAccCheckClick(Sender: TObject);
    procedure accCheckClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbDnDzIdClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure depCheckClick(Sender: TObject);
    procedure depEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  public
    flt_id_department : integer;
    DBHandle : PVOID;
  end;

implementation
uses sp_customer_form, Registry, DogLoaderUnit, LangUnit, uCommonSp;
{$R *.dfm}

procedure TfrmCustomerFilter.OKButtonClick(Sender: TObject);
begin
 (owner as TFsp_customer).CustLocateEdit.Text := '';
 (owner as TFsp_customer).EdrpouLocateEdit.Text := '';
{ if CustCheck.Checked and (CustEdit.Text='') then CustCheck.Checked:=false;
 if edrpoutCheck.Checked and (edrpouEdit.Text='') then edrpoutCheck.Checked:=false;
 if CheckCustNNSNum.Checked and (FIlterCustomerNNSNum.Text='') then CheckCustNNSNum.Checked:=false;
 if mfoCheck.Checked and (mfoEdit.Text='')  then mfoCheck.Checked:=false;
 if typeAccCheck.Checked and (typeAccEdit.Text='')
        then begin
           typeAccCheck.Checked:=false;
           typeAccCheck.OnClick(self);
        end;

        if accCheck.Checked and (accEdit.Text='')
        then begin
           accCheck.Checked:=false;
           accCheck.OnClick(self);
        end;

        if CheckCustPodNum.Checked and (FilterCustPodNum.Text='')
        then begin
           CheckCustPodNum.Checked:=false;
           CheckCustPodNum.OnClick(self);
        end;
//      else UConfigAppx.SetLookupListValues(FilterCustPodNum);
 }
 ModalResult := mrOK;
end;

procedure TfrmCustomerFilter.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmCustomerFilter.CustCheckClick(Sender: TObject);
begin
 CustEdit.Enabled := CustCheck.Checked;
 if CustEdit.Enabled then CustEdit.SetFocus;
end;

procedure TfrmCustomerFilter.edrpouCheckClick(Sender: TObject);
begin
 edrpouEdit.Enabled := edrpouCheck.Checked;
 if edrpouEdit.Enabled then edrpouEdit.SetFocus; 
end;

procedure TfrmCustomerFilter.accEditClick(Sender: TObject);
begin
     if accCheck.Checked
     then begin
          accEdit.Enabled:=true;
          accEdit.Style.Color:=clMoneyGreen;
          if self.Showing then accEdit.SetFocus;
     end
     else begin
          accEdit.Enabled:=false;
          accEdit.Style.Color:=clMenu;
     end;

end;

procedure TfrmCustomerFilter.CheckCustNNSNumClick(Sender: TObject);
begin
     if CheckCustNNSNum.Checked
     then begin
          FIlterCustomerNNSNum.Enabled:=true;
          FIlterCustomerNNSNum.Style.Color:=clMoneyGreen;
          if self.Showing then FIlterCustomerNNSNum.SetFocus;
     end
     else begin
          FIlterCustomerNNSNum.Enabled:=false;
          FIlterCustomerNNSNum.Style.Color:=clMenu;
     end;

end;

procedure TfrmCustomerFilter.CheckCustNNSDateClick(Sender: TObject);
begin
     if CheckCustNNSDate.Checked
     then begin
          FilterCustomerNNSDate.Enabled:=true;
          FilterCustomerNNSDate.Style.Color:=clMoneyGreen;
          if self.Showing then FilterCustomerNNSDate.SetFocus;
     end
     else begin
          FilterCustomerNNSDate.Enabled:=false;
          FilterCustomerNNSDate.Style.Color:=clMenu;
     end;
end;

procedure TfrmCustomerFilter.mfoCheckClick(Sender: TObject);
begin
 mfoEdit.Enabled := mfoCheck.Checked;
 if mfoEdit.Enabled then mfoEdit.SetFocus;
end;

procedure TfrmCustomerFilter.typeAccCheckClick(Sender: TObject);
begin
 typeAccEdit.Enabled := typeAccCheck.Checked;
 if typeAccEdit.Enabled then typeAccEdit.SetFocus;
end;

procedure TfrmCustomerFilter.accCheckClick(Sender: TObject);
begin
 accEdit.Enabled := accCheck.Checked;
 if accEdit.Enabled then accEdit.SetFocus;
end;

procedure TfrmCustomerFilter.ClearButtonClick(Sender: TObject);
begin
 flt_id_department := -1;
 depCheck.Checked := false;
 depEdit.Text := '';
 cbDnDzId.Checked := False;
 CustCheck.Checked:=false;
 edrpouCheck.Checked:=false;
 CheckCustNNSDate.Checked:=false;
 CheckCustNNSNum.Checked:=false;
 mfoCheck.Checked:=false;
 typeAccCheck.Checked:=false;
 accCheck.Checked:=false;
 fizLicoCheck.Checked:=false;
 CheckCustPDV.Checked:=false;
 CheckCustPNP.Checked:=false;
 CheckCustPodNum.Checked:=false;
 (owner as TFsp_customer).CustLocateEdit.Text := '';
 (owner as TFsp_customer).EdrpouLocateEdit.Text := '';
{ CustCheck.OnClick(self);
 edrpoutCheck.OnClick(self);
 CheckCustNNSDate.OnClick(self);
 CheckCustNNSNum.OnClick(self);
 mfoCheck.OnClick(self);
 typeAccCheck.OnClick(self);
 accCheck.OnClick(self);
 CheckCustPodNum.OnClick(self);}
end;

procedure TfrmCustomerFilter.FormCreate(Sender: TObject);
var
 reg : TRegistry;
 i : Integer;
begin
 LangPackApply(Self);
 reg := TRegistry.Create;
 reg.OpenKey(REG_KEY + 'Customers', true);
 try
  i := reg.ReadInteger('FilterFocusOn');
 except
  i := 0;
 end;
 reg.Free;
 cxComboBox1.ItemIndex := i;
end;

procedure TfrmCustomerFilter.Action1Execute(Sender: TObject);
begin
 OKButtonClick(Self);
end;

procedure TfrmCustomerFilter.Action2Execute(Sender: TObject);
begin
  OKButtonClick(Self);
end;

procedure TfrmCustomerFilter.FormShow(Sender: TObject);
begin
 if SYS_USE_DEP_IN_CUST = 0 then
 begin
   depEdit.Visible := false;
   depcheck.Checked := false;
   depCheck.Visible := false;
 end;
 case cxComboBox1.ItemIndex of
  0: begin
       CustCheck.Checked := True;
       CustEdit.SetFocus;
     end;
  1: begin
       edrpouCheck.Checked := True;
       edrpouEdit.SetFocus;
     end;
  2: begin
       mfoCheck.Checked := True;
       mfoEdit.SetFocus;
     end;
  3: begin
       accCheck.Checked := True;
       accEdit.SetFocus;
     end;
  4: begin
       cbDnDzId.Checked := True;
       edDnDzID.SetFocus;
     end;
  end;
 if SYS_USE_DEP_IN_CUST = 0 then
 begin
   depcheck.Checked := false;
 end;  
// accCheck.Checked := True;
// accEdit.SetFocus;
end;

procedure TfrmCustomerFilter.cbDnDzIdClick(Sender: TObject);
begin
 edDnDzID.Enabled := cbDnDzId.Checked;
 if edDnDzID.Enabled then edDnDzID.SetFocus;
end;

procedure TfrmCustomerFilter.FormDestroy(Sender: TObject);
var
 reg : TRegistry;
begin 
 reg := TRegistry.Create;
 reg.OpenKey(REG_KEY + 'Customers', true);
 try
  reg.WriteInteger('FilterFocusOn', cxComboBox1.ItemIndex);
 except
 end;
 reg.Free;
end;

procedure TfrmCustomerFilter.depCheckClick(Sender: TObject);
begin
 if depCheck.Tag = 1 then exit;
 depEdit.Enabled := depCheck.Checked;
 if depEdit.Enabled and depEdit.Visible then depEdit.SetFocus;
end;

procedure TfrmCustomerFilter.depEditPropertiesButtonClick(Sender: TObject;
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
            FieldValues['DBHandle'] := Integer(DBHandle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;

            //FieldValues['Root_Department'] := 2612;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
        // показать справочник и проанализировать результат (выбор одного подр.)
    sp.Show;
    if sp.Output = nil then ShowMessage('BUG: Output is NIL!!!')
                       else if not sp.Output.IsEmpty then
                            begin
                              flt_id_department := sp.Output['Id_Department'];
                              DepEdit.Text := sp.Output['Name_FULL'];
                            end;  
    sp.Free;
end;

end.

