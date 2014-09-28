{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Картотека МНА и МБП                                   }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uMnaPereocForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxCurrencyEdit, StdCtrls, cxButtons, cxCheckBox, cxMaskEdit,
  cxButtonEdit;

type
  TMnaPereocForm = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    cxCoefPereoc: TcxCurrencyEdit;
    cxSch: TcxButtonEdit;
    cxSchPlace: TcxCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MnaPereocForm: TMnaPereocForm;

implementation

{$R *.dfm}

end.
