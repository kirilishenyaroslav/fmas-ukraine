{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpTipDocFormEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uResources, Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxMaskEdit, cxDropDownEdit, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxCheckBox, cxSpinEdit, cxButtonEdit, uSpMatOtv, ibase;

type
  TTipDocEditForm = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    GroupBox1: TGroupBox;
    cxTipd: TcxTextEdit;
    Label1: TLabel;
    cxName: TcxTextEdit;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    cxToCombo: TcxComboBox;
    cxFromCombo: TcxComboBox;
    Label3: TLabel;
    Label4: TLabel;
    cxCheckKolDoc: TcxCheckBox;
    cxKodD: TcxTextEdit;
    Label5: TLabel;
    cxCheckNalInvoice: TcxCheckBox;
    cxPrefix: TcxTextEdit;
    Label6: TLabel;
    Label7: TLabel;
    cxNumDocLen: TcxSpinEdit;
    cxCheckWorkPos: TcxCheckBox;
    cxOperInv: TcxComboBox;
    Label8: TLabel;
    Label9: TLabel;
    cxOperMna: TcxComboBox;
    cxPosMode: TcxComboBox;
    Label10: TLabel;
    cxReport: TcxComboBox;
    Label12: TLabel;
    lbl1: TLabel;
    cxAvtoMoIn: TcxButtonEdit;
    cxAvtoMOOut: TcxButtonEdit;
    lbl2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxTipdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxTipdExit(Sender: TObject);
    procedure cxFromComboPropertiesChange(Sender: TObject);
    procedure cxAvtoMoInPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxAvtoMOOutPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    DBHANDLE:TISC_DB_HANDLE;
    lIsExit: boolean;
    lIsOsn: integer;
    ID_MO_IN, ID_MO_OUT:Integer;
    { Public declarations }
  end;

var
  TipDocEditForm: TTipDocEditForm;

implementation

{$R *.dfm}

procedure TTipDocEditForm.FormCreate(Sender: TObject);
begin
 OkButton.Caption:=MAT_BUTTON_OK_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
 lIsExit:=false;
end;

procedure TTipDocEditForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
 lok: boolean;
 nt, nf: integer;
 kod: integer;
begin
 if lIsExit then
  Action:=caFree
 else
 begin
  lok:=true;
  if trim(cxName.Text)='' then
  begin
   ShowMessage('Необхідно вказати назву!');
   lok:=false;
   cxName.SetFocus;
  end;
  if lok and (trim(cxTipd.Text)='') then
  begin
   ShowMessage('Необхідно вказати скорочену назву!');
   lok:=false;
   cxTipd.SetFocus;
  end;
  nt:=cxToCombo.ItemIndex;
  nf:=cxFromCombo.ItemIndex;
  if lIsOsn=0 then
  begin
   if ((nt=1) and (nf=1)) or ((nt=2) and (nf=2)) then
   begin
    ShowMessage('Не вірно задані параметри типу документа!');
    lok:=false
   end;
  end;
  if not TryStrToInt(cxKodD.Text, kod) then
  begin
   lok:=false;
   ShowMessage('Код документа повинен бути з цифр!');
  end;
  if not lok then
   Action:=caNone;
  end;
end;

procedure TTipDocEditForm.CancelButtonClick(Sender: TObject);
begin
 lIsExit:=true;
end;

procedure TTipDocEditForm.FormShow(Sender: TObject);
begin
 if lIsOsn=1 then
 begin
  GroupBox2.Visible:=false;
  Label3.Visible:=false;
  Label4.Visible:=false;
  cxToCombo.Visible:=false;
  cxFromCombo.Visible:=false;
  cxCheckKolDoc.Visible:=false;
 end
end;

procedure TTipDocEditForm.cxNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=VK_Return then
  cxTipd.SetFocus;
end;

procedure TTipDocEditForm.cxTipdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=VK_Return then
  OkButton.SetFocus;
end;

procedure TTipDocEditForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then
  Key:=VK_TAB;
 if Key=VK_ESCAPE	then
  CancelButton.SetFocus;
 if (Key=VK_F10) or ((Key=VK_END) and (Shift=[ssCtrl])) then
  OkButton.SetFocus;
end;

procedure TTipDocEditForm.cxTipdExit(Sender: TObject);
begin
 cxTipd.Text:=AnsiUpperCase(cxTipd.Text);
end;

procedure TTipDocEditForm.cxFromComboPropertiesChange(Sender: TObject);
begin
 if cxFromCombo.ItemIndex<>2 then
  cxPosMode.Enabled:=false
 else
  cxPosMode.Enabled:=true;
end;

procedure TTipDocEditForm.cxAvtoMoInPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
begin
  Res:=uSpMatOtv.GetMatOtv(self, self.DBHANDLE, 0, 0);
  if  VarType(Res) <> varEmpty
   then begin
    ID_MO_IN:=Res[0];
    cxAvtoMoIn.Text := Res[1] + ' / ' + Res[2];
  end;

end;

procedure TTipDocEditForm.cxAvtoMOOutPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
begin
  Res:=uSpMatOtv.GetMatOtv(self, self.DBHANDLE, 0, 0);
  if  VarType(Res) <> varEmpty
   then begin
    ID_MO_OUT:=Res[0];
    cxAvtoMOOut.Text := Res[1] + ' / ' + Res[2];
  end;

end;

end.
