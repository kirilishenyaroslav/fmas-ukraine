{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpKomissiaWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uResources, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TSpKomissiaWorkForm = class(TForm)
    Label1: TLabel;
    cxNameEdit: TcxTextEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Label21: TLabel;
    cxNumPrikazKomissia: TcxTextEdit;
    Label22: TLabel;
    cxDatePrikazKomissia: TcxDateEdit;
    Label19: TLabel;
    cxDirKomissia: TcxTextEdit;
    Label20: TLabel;
    cxKomissia: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SpKomissiaWorkForm: TSpKomissiaWorkForm;

implementation

{$R *.dfm}

procedure TSpKomissiaWorkForm.FormCreate(Sender: TObject);
begin
 OkButton.Caption:=MAT_BUTTON_OK_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
 Label1.Caption:=MAT_STR_COL_NAME;
end;

procedure TSpKomissiaWorkForm.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_RETURN then
  Key:=VK_TAB;
 if Key=VK_ESCAPE	then
  CancelButton.SetFocus;
 if (Key=VK_F10) or ((Key=VK_END) and (Shift=[ssCtrl])) then
  OkButton.SetFocus;
end;

end.
