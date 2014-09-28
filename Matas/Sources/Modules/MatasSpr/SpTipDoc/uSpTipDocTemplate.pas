{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpTipDocTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxMaskEdit, cxButtonEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, uResources, uMatasVars,
  cxCheckBox;

type
  TSpTipDocTemplForm = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxName: TcxTextEdit;
    cxFile: TcxButtonEdit;
    Label1: TLabel;
    Label2: TLabel;
    OpenFileDialog: TOpenDialog;
    cxDefTemplate: TcxCheckBox;
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxFilePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SpTipDocTemplForm: TSpTipDocTemplForm;

implementation

{$R *.dfm}

procedure TSpTipDocTemplForm.OkButtonClick(Sender: TObject);
begin
 if (cxName.Text='') or (cxFile.Text='') then ModalResult:=mrNone
  else ModalResult:=mrOk;
end;

procedure TSpTipDocTemplForm.FormCreate(Sender: TObject);
begin
 OkButton.Caption:=MAT_BUTTON_OK_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
 OpenFileDialog.InitialDir:=ExtractFilePath(Application.ExeName)+ _PATH_REPORTS;
end;

procedure TSpTipDocTemplForm.cxFilePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
 OpenFileDialog.Execute;
 cxFile.Text:=ExtractFileName(OpenFileDialog.FileName);
end;

end.
