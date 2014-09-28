unit uPRK_PROT_DOPUSK_Change;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, cxTextEdit, cxLabel,
  cxControls, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  StdCtrls, cxButtons,AArray;

type
  TFormPrK_PROT_DOPUSK_Change = class(TForm)
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    cxDateEditDate: TcxDateEdit;
    cxLabelDate: TcxLabel;
    cxTextEditNomer: TcxTextEdit;
    cxLabelNomer: TcxLabel;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxDateEditDateBeg: TcxDateEdit;
    cxLabelDateBeg: TcxLabel;
    cxDateEditDateEnd: TcxDateEdit;
    cxLabelDateEnd: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure cxTextEditNomerKeyPress(Sender: TObject; var Key: Char);
  private
    DataPZ   :TAArray;
    LangEdit :Integer;
    procedure inicCaption;
  public
    constructor Create(aOwner: TComponent;aDataPZ :TAArray);overload;
  end;

var
  FormPrK_PROT_DOPUSK_Change: TFormPrK_PROT_DOPUSK_Change;

implementation
uses
    uPrK_Resources,uConstants,uPrK_PROT_DOPUSK;
{$R *.dfm}

{ TFormPrK_PROT_ZACH_Change }

constructor TFormPrK_PROT_DOPUSK_Change.Create(aOwner: TComponent;
  aDataPZ: TAArray);
begin
  DataPZ    :=aDataPZ;
  LangEdit  :=SelectLanguage;
  inherited Create(aOwner);
end;

procedure TFormPrK_PROT_DOPUSK_Change.inicCaption;
begin
   cxLabelNomer.Caption      :=nLabelNomer[LangEdit];
   cxLabelDate.Caption       :=nLabelDateForm[LangEdit];
   cxLabelDateBeg.Caption    :=nLabelDateBeg[LangEdit];
   cxLabelDateEnd.Caption    :=nLabelDateEnd[LangEdit];

   ActionOK.Caption         :=nActiont_OK[LangEdit];
   ActionCansel.Caption     :=nActiont_Cansel[LangEdit];
   ActionOK.Hint            :=nHintActiont_OK[LangEdit];
   ActionCansel.Hint        :=nHintActiont_Cansel[LangEdit];
end;

procedure TFormPrK_PROT_DOPUSK_Change.FormCreate(Sender: TObject);
begin
   inicCaption;
   cxDateEditDate.Date     := DataPZ['DATE_FORM'].AsVariant;
   cxDateEditDateBeg.Date  := DataPZ['DATE_BEG_PERIOD'].AsVariant;
   cxDateEditDateEnd.Date  := DataPZ['DATE_END_PERIOD'].AsVariant;
   cxTextEditNomer.Text := DataPZ['NOMER'].AsString;
end;

procedure TFormPrK_PROT_DOPUSK_Change.ActionCanselExecute(Sender: TObject);
begin
   close;
end;

procedure TFormPrK_PROT_DOPUSK_Change.ActionOKExecute(Sender: TObject);
begin
   if trim(cxTextEditNomer.Text)='' then
   begin
     ShowMessage(nMsgEmptyNomer[LangEdit]);
     cxTextEditNomer.SetFocus;
     exit;
   end;

   if trim(cxDateEditDate.Text)='' then
   begin
     ShowMessage(nMsgEmptyDATE[LangEdit]);
     cxDateEditDate.SetFocus;
     exit;
   end;

   if trim(cxDateEditDateBeg.Text)='' then
   begin
     ShowMessage(nMsgEmptyDATE[LangEdit]);
     cxDateEditDateBeg.SetFocus;
     exit;
   end;

   if trim(cxDateEditDateEnd.Text)='' then
   begin
     ShowMessage(nMsgEmptyDATE[LangEdit]);
     cxDateEditDateEnd.SetFocus;
     exit;
   end;

  DataPZ['DATE_FORM'].AsVariant       := cxDateEditDate.Date;
  DataPZ['DATE_BEG_PERIOD'].AsVariant := cxDateEditDateBeg.Date;
  DataPZ['DATE_END_PERIOD'].AsVariant := cxDateEditDateEnd.Date;
  DataPZ['NOMER'].AsString        :=cxTextEditNomer.Text;
  ModalResult:=mrOk;
end;

procedure TFormPrK_PROT_DOPUSK_Change.cxTextEditNomerKeyPress(
  Sender: TObject; var Key: Char);
begin
    if (Key = '.') or (Key=',') then Key := Chr(0);
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then     Key := Chr(0);
end;

end.
