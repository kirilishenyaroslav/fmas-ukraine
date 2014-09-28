unit uPrK_SP_EKZ_RASP_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlass_VL_Edit, cxLookAndFeelPainters, ActnList, cxControls,
  cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, ExtCtrls, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TFormPrK_SP_EKZ_RASP_Edit = class(TFormPrKKlass_VL_Edit)
    cxLabelEKZ_DATE: TcxLabel;
    cxDateEditEKZ_DATE: TcxDateEdit;
    cxLabelNamePredm: TcxLabel;
    cxTextEditNamePredm: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
  private
    procedure inicCaption;override;
  public
    { Public declarations }
  end;

var
  FormPrK_SP_EKZ_RASP_Edit: TFormPrK_SP_EKZ_RASP_Edit;

implementation

uses AArray,uConstants;

{$R *.dfm}

procedure TFormPrK_SP_EKZ_RASP_Edit.FormCreate(Sender: TObject);
begin
  inherited;
  cxTextEditNamePredm.Text       :=DataVL['NAME_PREDM'].AsString;
  if DataVL['EKZ_DATE'].AsVariant<> null
   then cxDateEditEKZ_DATE.Date        :=DataVL['EKZ_DATE'].AsVariant;
end;

procedure TFormPrK_SP_EKZ_RASP_Edit.inicCaption;
begin
  inherited;
  cxLabelNamePredm.Caption  :=nLabelPredm[VLLangEdit];
  cxLabelEKZ_DATE.Caption   :=nLabelEKZ_DATE[VLLangEdit];
end;

procedure TFormPrK_SP_EKZ_RASP_Edit.ActionOKExecute(Sender: TObject);
begin
  if trim(cxDateEditEKZ_DATE.Text)='' then
   begin
     ShowMessage(nMsgEmptyEKZ_DATE[VLLangEdit]);
     cxDateEditEKZ_DATE.SetFocus;
     exit;
   end;

   DataVL['EKZ_DATE'].AsVariant :=cxDateEditEKZ_DATE.Date;

   ModalResult:=mrOk;
end;

end.
