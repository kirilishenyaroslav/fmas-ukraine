unit SheetToBankSort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxContainer, cxEdit, cxLabel, cxControls, cxGroupBox,
  StdCtrls, cxButtons, Unit_ZGlobal_Consts, cxCheckBox, ZProc, ActnList,
  cxRadioGroup, cxButtonEdit, IBase, PackageLoad, ZTypes, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, ZMessages;

type
  TFSort = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    RadioGroupOrder: TcxRadioGroup;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    GroupBank: TcxGroupBox;
    BankEdit: TcxButtonEdit;
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    cxGroupBox1: TcxGroupBox;
    EditDate: TcxDateEdit;
    CheckBoxDate: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure BankEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
  private
    PDb_Handle:TISC_DB_HANDLE;
    PLanguageIndex:Byte;
  public
    pNameBank:string;
    PId_Type_Payment:integer;
    id_reestr:integer;
    constructor Create(AOwner:TComponent;ADb_handle:TISC_DB_HANDLE);reintroduce;
    property Bank:Integer read PId_Type_Payment;
    property BankName:string read pNameBank;
    procedure SetSession(AID_Session:Integer);
  end;

implementation

{$R *.dfm}

constructor TFSort.Create(AOwner:TComponent;ADb_handle:TISC_DB_HANDLE);
begin
     inherited Create(AOwner);
     PDb_Handle:=ADb_handle;
     DB.Handle:= ADb_handle;

end;

procedure TFSort.FormCreate(Sender: TObject);
begin
     PLanguageIndex:=LanguageIndex;
     Caption:=Options_Text[PLanguageIndex];
     YesBtn.Caption      := PrintBtn_Caption[PLanguageIndex];
     CancelBtn.Caption   := ExitBtn_Caption[PLanguageIndex];
     YesBtn.Hint         := YesBtn.Caption;
     CancelBtn.Hint      := CancelBtn.Caption;
     GroupBank.Caption   := LabelBank_Caption[PLanguageIndex];
     RadioGroupOrder.Caption := Order_Text[PLanguageIndex];
     RadioGroupOrder.Properties.Items[0].Caption:= Tn_Text[PLanguageIndex];
     RadioGroupOrder.Properties.Items[1].Caption:= FIO_Text[PLanguageIndex];
     CheckBoxDate.properties.caption:=   ReestrDate_beg_Caption[PLanguageIndex];

end;

procedure TFSort.ActionYesExecute(Sender: TObject);
begin

if BankEdit.Text<>'' then
begin
   With StProc do
  begin
    Transaction.StartTransaction;
    StoredProcName:='UV_REE_VED_SELECT_U_BY_DATE_PR';
    Prepare;
    ParamByName('ID').asinteger:=Id_reestr;
    if EditDate.enabled then
      ParamByName('LAST_DATE_PRINT').asDate:=EditDate.Date
    else
      ParamByName('LAST_DATE_PRINT').asvariant:=null;
    ExecProc;
    Transaction.Commit;
  end;
  ModalResult:=mrYes;
end
else

 BankEdit.SetFocus;


end;

procedure TFSort.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFSort.BankEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var viplata:Variant;
begin
Viplata := LoadViplata(Self,PDb_Handle,zfsModal);
if VarArrayDimCount(viplata)>0 then
 begin
   PId_Type_Payment:=viplata[0];
   BankEdit.Text := VarToStr(viplata[1]);
   pNameBank := VarToStr(viplata[1]);
 end;
end;

procedure TFSort.SetSession(AID_Session:Integer);
begin
try
 DB.Handle:=PDb_Handle;
 StProc.Transaction.StartTransaction;
 StProc.StoredProcName:='UV_PRINTED_TO_BANK_S_BY_ID';
 StProc.Prepare;
 StProc.ParamByName('ID_SESSION').AsInteger := AID_Session;
 StProc.ExecProc;
 BankEdit.Text := StProc.ParamByName('NAME_TYPE_PAYMENT').AsString;
 PId_Type_Payment:=StProc.ParamByName('ID_TYPE_PAYMENT').AsInteger;
 StProc.Transaction.Commit;
 if DB.Connected then DB.Close;
 GroupBank.Enabled:=False;
except
 on e:exception do
  begin
   ZShowMessage(Error_Caption[PLanguageIndex],e.message,mtError,[mbOk]);
   StProc.Transaction.Rollback;
  end;
 end;
end;

procedure TFSort.FormShow(Sender: TObject);
begin
  With StProc do
  begin
    Transaction.StartTransaction;
    StoredProcName:='UV_REE_VED_SELECT_BY_ID';
    Prepare;
    ParamByName('ID').asinteger:=Id_reestr;
    ExecProc;
    if  ParamByName('LAST_DATE_PRINT').AsVariant <> null then
    begin
      EditDate.Date:=ParamByName('LAST_DATE_PRINT').asdate;
      CheckBoxDate.Checked:=true;
      EditDate.Enabled:=true;
    end
    else
      EditDate.Date:=Date;
    Transaction.Commit;
  end;

end;

procedure TFSort.cxCheckBox1PropertiesChange(Sender: TObject);
begin
EditDate.enabled:= not EditDate.enabled
end;

end.
