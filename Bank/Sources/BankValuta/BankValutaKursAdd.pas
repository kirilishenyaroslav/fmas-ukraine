unit BankValutaKursAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxCurrencyEdit, cxControls,
  cxContainer, cxEdit, cxLabel, ActnList, cxButtonEdit, DB,
  FIBDataSet, pFIBDataSet;

type
  TBankValutaKursAddForm = class(TForm)
    cxName: TcxLabel;
    cxLabel2: TcxLabel;
    cxKurs: TcxCurrencyEdit;
    cxLabel3: TcxLabel;
    cxDateEdit: TcxDateEdit;
    cxOk: TcxButton;
    cxClose: TcxButton;
    actlst1: TActionList;
    actOK: TAction;
    actNo: TAction;
    ds: TpFIBDataSet;
    cxLabelValuta: TcxLabel;
    procedure actOKExecute(Sender: TObject);
    procedure actNoExecute(Sender: TObject);
    procedure cxOkClick(Sender: TObject);
    procedure cxCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    id_add_val:Integer;
    is_upd : Integer;
    date_old : tdate;
  end;

var
  BankValutaKursAddForm: TBankValutaKursAddForm;

implementation

uses BankValutaDM;

{$R *.dfm}

procedure TBankValutaKursAddForm.actOKExecute(Sender: TObject);
begin
  if cxKurs.Text='' then
  begin
   showmessage('Введіть курс');
   cxKurs.SetFocus;
   Exit;
  end;

 if cxDateedit.Text='' then
  begin
   showmessage('Введіть дату встановлення');
   cxDateedit.SetFocus;
   Exit;
  end;

  if (date_old <> cxDateEdit.Date) then
    begin
      BankValuta_DM.TransWrite.StartTransaction;
      BankValuta_DM.StoredProc.StoredProcName                 := 'PUB_DT_VALUTE_KURS_PROVERKA';
      BankValuta_DM.StoredProc.ParamByName('id_valute').Value := BankValuta_DM.ValutaDSet['id_valute'];
      BankValuta_DM.StoredProc.ParamByName('DATE_KURS').Value := cxDateEdit.Date;
      BankValuta_DM.StoredProc.ExecProc;
      BankValuta_DM.TransWrite.Commit;

      if (BankValuta_DM.StoredProc.ParamByName('out').Value = 1) then
      begin
        ShowMessage('По цій валюті на цю дату вже встановлен курс!');
        cxDateedit.SetFocus;
        Exit;
      end;
    end;

  ModalResult:=mrOk;
end;

procedure TBankValutaKursAddForm.actNoExecute(Sender: TObject);
begin
  Close;
end;

procedure TBankValutaKursAddForm.cxOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TBankValutaKursAddForm.cxCloseClick(Sender: TObject);
begin
  Close;
end;

end.
