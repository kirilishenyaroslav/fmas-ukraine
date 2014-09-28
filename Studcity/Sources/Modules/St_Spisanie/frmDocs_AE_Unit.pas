unit frmDocs_AE_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxGroupBox, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar, cxContainer, cxEdit,
  cxTextEdit, st_ConstUnit;

type
  TfrmDocs_AE = class(TForm)
    cxGroupBox1: TcxGroupBox;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    Num_Doc_Edit: TcxTextEdit;
    Date_Doc_Edit: TcxDateEdit;
    Num_Doc_Label: TLabel;
    Date_Doc_Label: TLabel;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Num_Doc_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Date_Doc_EditKeyPress(Sender: TObject; var Key: Char);
  private
   procedure FormIniLanguage();
  public
    PLanguageIndex :byte;
  end;

var
  frmDocs_AE: TfrmDocs_AE;

implementation

{$R *.dfm}

procedure TfrmDocs_AE.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 NUM_DOC_Label.Caption       :=   st_ConstUnit.st_NumDoc_Pay[PLanguageIndex];
 DATE_DOC_Label.Caption      :=   st_ConstUnit.st_DateDoc_Pay[PLanguageIndex];
 OKButton.Caption            :=   st_ConstUnit.st_Accept[PLanguageIndex];
 CancelButton.Caption        :=   st_ConstUnit.st_Cancel[PLanguageIndex];
end;

procedure TfrmDocs_AE.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmDocs_AE.OKButtonClick(Sender: TObject);
begin
if Num_Doc_Edit.Text = '' then
 begin
  MessageBox(Handle,PChar(st_ConstUnit.st_ErrorData[PLanguageIndex]),PChar(st_ConstUnit.st_ErrorData[PLanguageIndex]),MB_OK or MB_ICONERROR);
  Num_Doc_Edit.SetFocus;
  exit;
 end;
if Date_Doc_Edit.Text = '' then
 begin
  MessageBox(Handle,PChar(st_ConstUnit.st_ErrorData[PLanguageIndex]),PChar(st_ConstUnit.st_ErrorData[PLanguageIndex]),MB_OK or MB_ICONERROR);
  Date_Doc_Edit.SetFocus;
  exit;
 end;
 ModalResult := MrOk;
end;

procedure TfrmDocs_AE.FormShow(Sender: TObject);
begin
FormIniLanguage();
end;

procedure TfrmDocs_AE.Num_Doc_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then Date_Doc_Edit.SetFocus;
end;

procedure TfrmDocs_AE.Date_Doc_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then OKButton.SetFocus;
end;

end.
