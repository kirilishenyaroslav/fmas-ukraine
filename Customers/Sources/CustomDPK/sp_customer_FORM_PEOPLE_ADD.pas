unit sp_customer_FORM_PEOPLE_ADD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxMemo,
  cxLookAndFeelPainters, cxButtons, GlobalSPR, Variants;

type
  Tfsp_customer_form_people_add = class(TForm)
    GroupBox1: TGroupBox;
    LabelPOST: TLabel;
    LabelFIRSTNAME: TLabel;
    labelNAME: TLabel;
    LabelLAST_NAME: TLabel;
    LabelPRIM: TLabel;
    TypeMenEdit: TcxButtonEdit;
    FamiliaEdit: TcxTextEdit;
    ImyaEdit: TcxTextEdit;
    OtchestvoEdit: TcxTextEdit;
    NotesMemo: TcxMemo;
    Button1: TcxButton;
    Button2: TcxButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TypeMenEditButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    id_type_men : integer;
  end;


implementation

uses BaseTypes,Resources_unitb, sp_customer_FORM;
{$R *.DFM}

procedure Tfsp_customer_form_people_add.Button2Click(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure Tfsp_customer_form_people_add.Button1Click(Sender: TObject);
begin
 if TypeMenEdit.Text = '' then begin
  MessageBox(handle,PChar(CUSTOMER_POST_ERROR),PChar(CUSTOMER_MESSAGE_WARNING), MB_OK or MB_ICONWARNING);
  exit;
 end;
 if (FamiliaEdit.Text = '') and (ImyaEdit.Text = '') and (OtchestvoEdit.Text = '') then begin
  MessageBox(handle,PChar(CUSTOMER_POST_ERROR),PChar(CUSTOMER_MESSAGE_WARNING), MB_OK or MB_ICONWARNING);
  exit;
 end;
 ModalResult := mrOK;
end;

procedure Tfsp_customer_form_people_add.TypeMenEditButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetIniTypeMen(self.Owner,TFsp_customer(self.Owner).WorkDatabase.Handle,fsnormal,TFsp_customer(self.Owner).ActualDate);
    if VarArrayDimCount(id)>0
    then begin
     if id[0]<>NULL
     then begin
      id_type_men := id[0];
      TypeMenEdit.Text := id[1];
     end;
   end;
end;

procedure Tfsp_customer_form_people_add.FormCreate(Sender: TObject);
begin
{     LabelPOST.Caption:=CUSTOMER_LabelPOST_CONST;
     labelNAME.Caption:=CUSTOMER_labelNAME_CONST;
     LabelFIRSTNAME.Caption:=CUSTOMER_LabelFIRSTNAME_CONST;
     LabelLAST_NAME.Caption:=CUSTOMER_LabelLAST_NAME_CONST;
     LabelPRIM.Caption:=CUSTOMER_LabelPRIM_CONST;
     Button1.Caption:=CUSTOMER_OK_BUT_CONST;
     Button2.Caption:=CUSTOMER_CANCEL_BUT_CONST;}
end;

end.
