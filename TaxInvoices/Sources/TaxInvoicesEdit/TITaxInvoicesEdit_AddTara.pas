unit TITaxInvoicesEdit_AddTara;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxLookAndFeelPainters, cxButtons,
  cxTextEdit, cxButtonEdit, cxControls, cxContainer, cxEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Ibase,TiCommonProc,TICommonLoader,TiMessages,
  cxCurrencyEdit,Registry,TITaxinvoicesEdit_DM;

type TTITaxInvoicesAddTara=record
  id_tara   : Integer;
  Name_tara : string;
end;

type
  TTaxInvoicesEditAddTaraForm = class(TForm)
    Panel1: TPanel;
    TaraGroupBox: TGroupBox;
    TaraLabel: TLabel;
    SummaLabel: TLabel;
    YesButton: TcxButton;
    CancelButton: TcxButton;
    SummaCurrencyEdit: TcxCurrencyEdit;
    TaraButtonEdit: TcxButtonEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure YesButtonClick(Sender: TObject);
  private
    PRes           : Variant;
    PDb_Handle     : TISC_DB_HANDLE;
    PParameter     : TTITaxInvoicesAddTara;
    TaxInvoicesEditDM: TTaxInvoicesEditDM;
  public
    procedure ReadReg;
    procedure WriteReg;
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;AddParametr:TTITaxInvoicesAddTara);reintroduce;
    property Parameter:TTITaxInvoicesAddTara read PParameter;
    property Res:Variant read PRes;

  end;

var
  TaxInvoicesEditAddTaraForm: TTaxInvoicesEditAddTaraForm;

implementation



{$R *.dfm}
constructor TTaxInvoicesEditAddTaraForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;AddParametr:TTITaxInvoicesAddTara);
begin
  inherited Create(AOwner);
  PDb_Handle := Db_Handle;
  TaxInvoicesEditDM     := TTaxInvoicesEditDM.Create(AOwner,Db_Handle);
  PParameter := AddParametr;
end;

procedure TTaxInvoicesEditAddTaraForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TTaxInvoicesEditAddTaraForm.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  MortgageTara:Variant;
begin
  Parameter           := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesEditDM.DB.Handle;
  Parameter.Owner     := self;
  MortgageTara        := DoFunctionFromPackage(Parameter,MortgageTara_Const);
  Parameter.Destroy;

  If VarArrayDimCount(MortgageTara)>0 then
  begin
    TaraButtonEdit.Text  := MortgageTara[1];
    PParameter.id_tara   := MortgageTara[0];
    PParameter.Name_tara := MortgageTara[1];
  end;
end;

procedure TTaxInvoicesEditAddTaraForm.ReadReg;
var
  reg : TRegistry;
begin
  try
   begin
     reg := TRegistry.Create;
     reg.RootKey := HKEY_CURRENT_USER;
     if reg.OpenKey('\Software\TaxInvoices\VidNaklTaraIns\',False) then
     begin
       TaraButtonEdit.Text  := reg.ReadString('name_tare');
       PParameter.id_tara   := StrToInt(reg.ReadString('id_tare'));
       PParameter.Name_tara := reg.ReadString('name_tare');
     end
     else
     begin
       TaraButtonEdit.Text := '';
     end;
   end
  finally
    reg.Free;
  end;
end;

procedure TTaxInvoicesEditAddTaraForm.WriteReg;
var
  reg : TRegistry;
begin
  reg := TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if (reg.OpenKey('\Software\TaxInvoices\VidNaklTaraIns\',True)) then
   begin
     reg.WriteString('id_tare',IntToStr(PParameter.id_tara));
     reg.WriteString('name_tare',PParameter.Name_tara);
   end;
  finally
   reg.Free;
  end;
end;

procedure TTaxInvoicesEditAddTaraForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WriteReg;
end;

procedure TTaxInvoicesEditAddTaraForm.YesButtonClick(Sender: TObject);
begin
  if (TaraButtonEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть поле!',mtWarning,[mbOK]);
   TaraButtonEdit.SetFocus;
   Exit;
  end;

  if (SummaCurrencyEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть поле!',mtWarning,[mbOK]);
   SummaCurrencyEdit.SetFocus;
   Exit;
  end;

  ModalResult := mrOk;
end;

end.
