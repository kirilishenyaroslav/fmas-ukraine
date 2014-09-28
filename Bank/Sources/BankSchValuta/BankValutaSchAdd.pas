unit BankValutaSchAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxCurrencyEdit, cxControls,
  cxContainer, cxEdit, cxLabel, ActnList, cxButtonEdit, DB,
  FIBDataSet, pFIBDataSet, BankValutaSchDM,GlobalSpr;

type
  TBankValutaSchAddForm = class(TForm)
    cxName: TcxLabel;
    cxLabel2: TcxLabel;
    cxOk: TcxButton;
    cxClose: TcxButton;
    actlst1: TActionList;
    actOK: TAction;
    actNo: TAction;
    cxLabelTitleValuta: TcxLabel;
    BankSchetEdit: TcxButtonEdit;
    procedure actOKExecute(Sender: TObject);
    procedure actNoExecute(Sender: TObject);
    procedure BankSchetEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    id_add_val : Integer;
    id_sch     : Int64;
  end;

var
  BankValutaSchAddForm: TBankValutaSchAddForm;

implementation

{$R *.dfm}

procedure TBankValutaSchAddForm.actOKExecute(Sender: TObject);
begin
  if BankSchetEdit.Text='' then
  begin
   showmessage('Введіть балансовий рахунок');
   BankSchetEdit.SetFocus;
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

procedure TBankValutaSchAddForm.actNoExecute(Sender: TObject);
begin
Close;
end;

procedure TBankValutaSchAddForm.BankSchetEditPropertiesButtonClick(
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

end.
