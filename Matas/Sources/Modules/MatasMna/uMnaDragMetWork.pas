{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Картотека МНА и МБП                                   }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uMnaDragMetWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, DB, FIBDataSet, pFIBDataSet, StdCtrls,
  cxButtons, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit;

type
  TMnaDragMetWorkForm = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    SpDragMetDataSet: TpFIBDataSet;
    SpDragMetDataSource: TDataSource;
    cxKolDragMet: TcxCurrencyEdit;
    cxDragMet: TcxLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MnaDragMetWorkForm: TMnaDragMetWorkForm;

implementation

{$R *.dfm}
uses uMatasMnaMain;

procedure TMnaDragMetWorkForm.FormCreate(Sender: TObject);
begin
 SpDragMetDataSet.CloseOpen(false);
end;

end.
