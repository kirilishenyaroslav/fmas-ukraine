unit uAddNewPRIK_ZACH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList, DB,
  FIBDataSet, pFIBDataSet, cxLabel, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxRadioGroup, cxControls,
  cxGroupBox,AArray;

type
  TFormAddNewPRIK_ZACH = class(TForm)
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    cxGroupBoxCelNabor: TcxGroupBox;
    cxRadioButtonAllCn: TcxRadioButton;
    cxRadioButtonBezCn: TcxRadioButton;
    cxRadioButtonSCn: TcxRadioButton;
    cxDateEditDateZarah: TcxDateEdit;
    cxDateEditDatePrikaz: TcxDateEdit;
    cxLabelDateZarah: TcxLabel;
    cxLabelDatePrikaz: TcxLabel;
    DataSetDateZarah: TpFIBDataSet;
    cxTextEditNomer: TcxTextEdit;
    cxLabelNomer: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
  private
    DataPZ   :TAArray;
    LangEdit :Integer;
    procedure inicCaption;
    function  GetDateZarah :TDate;
  public
    constructor Create(aOwner: TComponent;aDataPZ :TAArray);overload;
  end;

var
  FormAddNewPRIK_ZACH: TFormAddNewPRIK_ZACH;

implementation
uses
    uPrK_Resources,uConstants,uPrK_PROT_ZACH;
{$R *.dfm}

{ TFormAddNewPRIK_ZACH }

constructor TFormAddNewPRIK_ZACH.Create(aOwner: TComponent;
  aDataPZ: TAArray);
begin
  DataPZ    :=aDataPZ;
  LangEdit  :=SelectLanguage;
  inherited Create(aOwner);
end;

procedure TFormAddNewPRIK_ZACH.inicCaption;
begin
   cxGroupBoxCelNabor.Caption:=ncxGroupBoxPlanSelNabor[LangEdit];

   cxRadioButtonAllCn.Caption:=ncxRadioButtonAll[LangEdit];
   cxRadioButtonBezCn.Caption:=ncxRadioButtonBezCn[LangEdit];
   cxRadioButtonSCn.Caption  :=ncxRadioButtonSCn[LangEdit];

   cxLabelNomer.Caption      :=nLabelNomer[LangEdit];
   cxLabelDateZarah.Caption  :=nLabelDateZarah[LangEdit];
   cxLabelDatePrikaz.Caption :=nLabelDatePrikaz[LangEdit];

   ActionOK.Caption         :=nActiont_OK[LangEdit];
   ActionCansel.Caption     :=nActiont_Cansel[LangEdit];
   ActionOK.Hint            :=nHintActiont_OK[LangEdit];
   ActionCansel.Hint        :=nHintActiont_Cansel[LangEdit];
end;

procedure TFormAddNewPRIK_ZACH.FormCreate(Sender: TObject);
begin
  inicCaption;
  
  case DataPZ['IS_CEL_NABOR'].AsInteger of
      -1: begin
           cxRadioButtonAllCn.Checked :=true;
          end;
       0: begin
           cxRadioButtonBezCn.Checked :=true;
          end;
       1: begin
           cxRadioButtonSCn.Checked   :=true;
          end;
  end;

  if  DataPZ['Input']['Rejim'].AsVariant=AddPrK
      then  cxDateEditDateZarah.Date := GetDateZarah
      else  cxDateEditDateZarah.Date := DataPZ['DATE_ZARAX'].AsVariant;

  cxDateEditDatePrikaz.Date := DataPZ['DATE_PRIKAZ'].AsVariant;
  cxTextEditNomer.Text      := DataPZ['NOMER'].AsString;
end;

function TFormAddNewPRIK_ZACH.GetDateZarah: TDate;
begin
    DataSetDateZarah.Active                         :=false;
    DataSetDateZarah.Database                       := TFormPrK_PROT_ZACH(self.Owner).DataBasePrk;
    DataSetDateZarah.Transaction                    := TFormPrK_PROT_ZACH(self.Owner).TransactionReadPrK;
    DataSetDateZarah.SelectSQL.Clear;
    DataSetDateZarah.SQLs.SelectSQL.Text            := 'select * from PRK_DT_PRIK_ZACH_DAT_ZARAX_SEL(:ID_DT_PROT_ZACH)';
    DataSetDateZarah.ParamByName('ID_DT_PROT_ZACH').AsInt64 := TFormPrK_PROT_ZACH(self.Owner).DataSetPrKPZ.FieldValues['ID_DT_PROT_ZACH'];
    DataSetDateZarah.CloseOpen(false);
    Result := DataSetDateZarah.FieldValues['DATE_ZARAX'];
end;

procedure TFormAddNewPRIK_ZACH.ActionCanselExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TFormAddNewPRIK_ZACH.ActionOKExecute(Sender: TObject);
begin
   if cxRadioButtonAllCn.Checked =true
      then     DataPZ['IS_CEL_NABOR'].AsInteger:=-1;
   if cxRadioButtonBezCn.Checked =true
      then     DataPZ['IS_CEL_NABOR'].AsInteger:=0;
   if cxRadioButtonSCn.Checked =true
      then     DataPZ['IS_CEL_NABOR'].AsInteger:=1;

   if trim(cxDateEditDateZarah.Text)='' then
   begin
     ShowMessage(nMsgEmptyDATE[LangEdit]);
     cxDateEditDateZarah.SetFocus;
     exit;
   end;

   if trim(cxDateEditDatePrikaz.Text)='' then
   begin
     ShowMessage(nMsgEmptyDATE[LangEdit]);
     cxDateEditDatePrikaz.SetFocus;
     exit;
   end;

   if trim(cxTextEditNomer.Text)='' then
   begin
     ShowMessage(nMsgEmptyNomer[LangEdit]);
     cxTextEditNomer.SetFocus;
     exit;
   end;

  DataPZ['DATE_ZARAX'].AsVariant  :=cxDateEditDateZarah.Date;
  DataPZ['DATE_PRIKAZ'].AsVariant :=cxDateEditDatePrikaz.Date;
  DataPZ['NOMER'].AsString        :=cxTextEditNomer.Text;
  ModalResult:=mrOk;
end;

end.
