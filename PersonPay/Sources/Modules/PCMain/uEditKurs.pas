unit uEditKurs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxCurrencyEdit, cxControls,
  cxContainer, cxEdit, cxLabel, ActnList, cxButtonEdit, uSpValyuta, DB,
  FIBDataSet, pFIBDataSet, cxSpinEdit, cxTimeEdit;

type
  TEditKursForm = class(TForm)
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
    cxAddVal: TcxButtonEdit;
    ds: TpFIBDataSet;
    cxLabel1: TcxLabel;
    cxTimeEdit: TcxTimeEdit;
    procedure actOKExecute(Sender: TObject);
    procedure actNoExecute(Sender: TObject);
    procedure cxAddValPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    id_add_val:Integer;
  end;

var
  EditKursForm: TEditKursForm;

implementation

{$R *.dfm}
uses uSpVal;
procedure TEditKursForm.actOKExecute(Sender: TObject);
begin
 if cxKurs.Text='' then begin showmessage('¬вед≥ть курс');  cxKurs.SetFocus; Exit; end;
 if ((cxAddVal.Visible = True) and (cxAddVal.Text = ''))  then begin showmessage('¬вед≥ть валюту');  cxAddVal.SetFocus; Exit; end;
ModalResult:=mrOk;
end;

procedure TEditKursForm.actNoExecute(Sender: TObject);
begin
Close;
end;

procedure TEditKursForm.cxAddValPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var f:TSpValForm;
begin
  f:=TSpValForm.Create(Self);
  ds.CloseOpen(false);
//  f.ds1.Open;
  f.ShowModal;
  if f.ModalResult=mrOk then
  begin
  cxAddVal.Text:=ds.FieldValues['VALUTE_TITLE'];
  id_add_val:=ds.FieldValues['ID_VALUTE'];
  end;
  f.Free;
end;

procedure TEditKursForm.FormShow(Sender: TObject);
begin
id_add_val:=0;
end;

end.
