unit BankBalSchValAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxCurrencyEdit, cxControls,
  cxContainer, cxEdit, cxLabel, ActnList, cxButtonEdit, DB,
  FIBDataSet, pFIBDataSet, BankValutaSchDM,GlobalSpr,Un_lo_file_Alex;

type
  TBalSchValAddForm = class(TForm)
    cxName: TcxLabel;
    cxLabel2: TcxLabel;
    cxOk: TcxButton;
    cxClose: TcxButton;
    actlst1: TActionList;
    actOK: TAction;
    actNo: TAction;
    BankSchetEdit: TcxButtonEdit;
    ValutaButtonEdit: TcxButtonEdit;
    procedure actOKExecute(Sender: TObject);
    procedure actNoExecute(Sender: TObject);
    procedure BankSchetEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ValutaButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    id_add_val:Integer;
    id_sch : Int64;
    id_valute : Int64;
  end;

var
  BalSchValAddForm: TBalSchValAddForm;

implementation

{$R *.dfm}

procedure TBalSchValAddForm.actOKExecute(Sender: TObject);
begin
  if BankSchetEdit.Text='' then
  begin
   showmessage('Введіть балансовий рахунок');
   BankSchetEdit.SetFocus;
   Exit;
  end;

  if ValutaButtonEdit.Text='' then
  begin
   showmessage('Введіть валюту');
   ValutaButtonEdit.SetFocus;
   Exit;
  end;

  BankValutaSch_DM.TransWrite.StartTransaction;
  BankValutaSch_DM.StoredProc.StoredProcName                := 'BANK_BAL_SCH_VALUTE_PROVERKA';
  BankValutaSch_DM.StoredProc.ParamByName('id_sch').AsInt64 := id_sch;
  BankValutaSch_DM.StoredProc.ExecProc;
  BankValutaSch_DM.TransWrite.Commit;

  if (BankValutaSch_DM.StoredProc.ParamByName('out').Value = 1) then
  begin
    ShowMessage('З цим балансовим рахунком вже є настроювання!');
    BankSchetEdit.SetFocus;
    Exit;
  end;

  ModalResult:=mrOk;
end;

procedure TBalSchValAddForm.actNoExecute(Sender: TObject);
begin
  Close;
end;

procedure TBalSchValAddForm.BankSchetEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 schet :variant;
begin
  schet := GlobalSpr.GetSch(self, BankValutaSch_DM.DB.Handle, fsStayOnTop, Now, DEFAULT_ROOT_ID, 4, 0);
  if VarArrayDimCount(schet)=1 then
  begin
    id_sch    := schet[0][0];
    BankSchetEdit.Text   := schet[0][3] +' '+ schet[0][1];
    {sch_type   := schet[0][2];
    sch_number := schet[0][3];
    sch_system := schet[0][4]; }
  end;
end;

procedure TBalSchValAddForm.ValutaButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TBankSimpleParam;
  Valuta:Variant;
begin
  Parameter := TBankSimpleParam.Create;
  Parameter.DB_Handle := BankValutaSch_DM.DB.Handle;
  Parameter.Owner := self;
  Parameter.formstyle := fsNormal;
  Valuta := RunFunctionFromPackage(Parameter,'\Bank\BankValuta.bpl','View_BankValuta');
  Parameter.Free;

  If VarArrayDimCount(Valuta)>0 then
  begin
    ValutaButtonEdit.Text := Valuta[1];
    id_valute             := Valuta[0];
  end;
end;

end.
