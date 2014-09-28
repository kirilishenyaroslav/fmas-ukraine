unit BankValutaAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxCurrencyEdit, cxControls,
  cxContainer, cxEdit, cxLabel, ActnList, cxButtonEdit, DB,
  FIBDataSet, pFIBDataSet;

type
  TBankValutaAddForm = class(TForm)
    cxName: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxOk: TcxButton;
    cxClose: TcxButton;
    actlst1: TActionList;
    actOK: TAction;
    actNo: TAction;
    ds: TpFIBDataSet;
    TitleValuteTextEdit: TcxTextEdit;
    CodeValuteTextEdit: TcxTextEdit;
    SpecialSignTextEdit: TcxTextEdit;
    procedure actOKExecute(Sender: TObject);
    procedure actNoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    id_add_val:Integer;
  end;

var
  BankValutaAddForm: TBankValutaAddForm;

implementation

{$R *.dfm}

procedure TBankValutaAddForm.actOKExecute(Sender: TObject);
begin
  if TitleValuteTextEdit.Text='' then
  begin
   showmessage('¬вед≥ть назву валюти');
   TitleValuteTextEdit.SetFocus;
   Exit;
  end;

 if CodeValuteTextEdit.Text='' then
  begin
   showmessage('¬вед≥ть код валюти');
   CodeValuteTextEdit.SetFocus;
   Exit;
  end;
  ModalResult:=mrOk;
end;

procedure TBankValutaAddForm.actNoExecute(Sender: TObject);
begin
Close;
end;

end.
