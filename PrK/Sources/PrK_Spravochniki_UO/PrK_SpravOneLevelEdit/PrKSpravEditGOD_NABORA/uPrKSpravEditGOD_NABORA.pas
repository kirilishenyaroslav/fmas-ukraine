unit uPrKSpravEditGOD_NABORA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlassSpravEdit, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  uPRK_SP_GOD_NABORA, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TFormPrKSpravEditGOD_NABORA = class(TFormPrKKlassSpravEdit)
    cxLabelDateBeg: TcxLabel;
    cxLabelDateEnd: TcxLabel;
    cxDateEditDateEnd: TcxDateEdit;
    cxDateEditDateBeg: TcxDateEdit;
    procedure ActionOKExecute(Sender: TObject);
  private
    DataPrKSpravEdit :TDataPrKSpravGodNabora;
    procedure inicCaption;override;
  public
     constructor Create(aOwner: TComponent; aDataPrKSprav :TDataPrKSpravGodNabora;
                        aAllDataKods: variant;aAllDataNpps: variant);overload;
  end;

var
  FormPrKSpravEditGOD_NABORA: TFormPrKSpravEditGOD_NABORA;

implementation
uses  uConstants;
{$R *.dfm}

{ TFormPrKSpravEditGOD_NABORA }

constructor TFormPrKSpravEditGOD_NABORA.Create(aOwner: TComponent;
  aDataPrKSprav: TDataPrKSpravGodNabora; aAllDataKods,
  aAllDataNpps: variant);
begin
  inherited Create(aOwner,aDataPrKSprav,aAllDataKods,aAllDataNpps);
  DataPrKSpravEdit:= aDataPrKSprav;
  cxDateEditDateBeg.Date := DataPrKSpravEdit.DateBeg;
  cxDateEditDateEnd.Date := DataPrKSpravEdit.DateEnd;
end;

procedure TFormPrKSpravEditGOD_NABORA.inicCaption;
begin
  inherited;
  cxLabelDateBeg.Caption:=nLabelDateBeg[IndLangEdit];
  cxLabelDateEnd.Caption:=nLabelDateEnd[IndLangEdit];
end;

procedure TFormPrKSpravEditGOD_NABORA.ActionOKExecute(Sender: TObject);
begin
  if trim(cxDateEditDateBeg.Text)='' then
     begin
       ShowMessage(nMsgEmptyDateBeg[IndLangEdit]);
       cxDateEditDateBeg.SetFocus;
       exit;
     end;

  if trim(cxDateEditDateEnd.Text)='' then
     begin
       ShowMessage(nMsgEmptyDateEnd[IndLangEdit]);
       cxDateEditDateEnd.SetFocus;
       exit;
     end;

  DataPrKSpravEdit.DateBeg:=cxDateEditDateBeg.Date;
  DataPrKSpravEdit.DateEnd:=cxDateEditDateEnd.Date;
  inherited;
end;

end.
