{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkNalogInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uMatasUtils, uMatasVars, uResources, cxLookAndFeelPainters,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, cxButtons;

type
  TDocWorkNalogInvoiceForm = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Label2: TLabel;
    cxNumDoc: TcxTextEdit;
    Label3: TLabel;
    cxDateDoc: TcxDateEdit;
    Label19: TLabel;
    cxFio: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DocWorkNalogInvoiceForm: TDocWorkNalogInvoiceForm;

implementation

{$R *.dfm}

procedure TDocWorkNalogInvoiceForm.FormCreate(Sender: TObject);
begin
 Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_DOCWORK+' :: '+'Дані про податкову накладну';
  OkButton.Caption:=MAT_BUTTON_OK_CONST;
  CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
end;

end.
