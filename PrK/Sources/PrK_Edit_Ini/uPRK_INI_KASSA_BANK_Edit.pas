unit uPRK_INI_KASSA_BANK_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList;

type
  TFormPRK_INI_KASSA_BANK_Edit = class(TForm)
    cxLabelProcent: TcxLabel;
    cxTextEditProcent: TcxTextEdit;
    cxButtonSRS: TcxButton;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    procedure cxTextEditProcentKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonSRSClick(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
  private 
  public
    id_smeta    :Int64;
    id_razd     :Int64;
    id_state    :Int64;
  end;

var
  FormPRK_INI_KASSA_BANK_Edit: TFormPRK_INI_KASSA_BANK_Edit;

implementation
uses GlobalSPR,uPRK_INI_KASSA_BANK;
{$R *.dfm}

procedure TFormPRK_INI_KASSA_BANK_Edit.cxTextEditProcentKeyPress(
  Sender: TObject; var Key: Char);
begin
   if cxTextEditProcent.Text = '0,00' then cxTextEditProcent.Text := '';
   if cxTextEditProcent.Text = '0.00' then cxTextEditProcent.Text := '';
    if (Key = '.') or (Key=',') then Key := DecimalSeparator;
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
    then
        Key := Chr(0)
    else
      if  (Key = DecimalSeparator) and
          (Pos(DecimalSeparator, cxTextEditProcent.Text) > 0)
      then
          Key := Chr(0)
      else
        if ((Length(cxTextEditProcent.Text) - Pos(DecimalSeparator, cxTextEditProcent.Text) > 3) and (Pos(DecimalSeparator,cxTextEditProcent.Text) <> 0))
            and (Ord(Key) <> 8)
            and (Ord(Key) <> VK_DELETE)
            and ((Ord(Key) > 48) or (Ord(Key) < 57))
        then
            Key := Chr(0);
end;

procedure TFormPRK_INI_KASSA_BANK_Edit.cxButtonSRSClick(Sender: TObject);
var
   res :Variant;
begin
   res := GlobalSPR.GetSmets(self, TFormPRK_INI_KASSA_BANK(self.Owner).DataBasePrK.Handle, Date, psmRazdSt);
      if VarArrayDimCount(res) > 0 then
          begin
          if res[0] <> 0 then
              begin
                  id_smeta    := res[0];
                  id_razd     := res[1];
                  id_state    := res[2];
                  cxButtonSRS.Caption := VarToStr(res[9])+'/'+VarToStr(res[7])+'/'+VarToStr(res[8]);
              end;
          end;
end;

procedure TFormPRK_INI_KASSA_BANK_Edit.ActionOKExecute(Sender: TObject);
begin
   if (id_smeta=-1) or  (id_razd=-1) or  (id_state=-1)
    then begin
       ShowMessage('Отрицательный id');
       cxButtonSRS.Click;
       exit;
    end;

   if cxTextEditProcent.Text='' then
    begin
       ShowMessage('Нужно выставить проценты');
       cxTextEditProcent.SetFocus;
       exit;
    end;

    ModalResult:=mrOK;
end;

procedure TFormPRK_INI_KASSA_BANK_Edit.ActionCanselExecute(
  Sender: TObject);
begin
  close;
end;

end.
