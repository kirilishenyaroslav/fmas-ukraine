{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль просмотра остатков и оборотов                  }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uViewOstIstfinFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxControls, cxContainer, cxEdit, cxCheckBox;

type
  TOstIstFinFilterForm = class(TForm)
    cxSmFilter: TcxCheckBox;
    BEBut: TcxButtonEdit;
    cxRSFilter: TcxCheckBox;
    BEStatRoz: TcxButtonEdit;
    cxKekvFilter: TcxCheckBox;
    BEKek: TcxButtonEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxLookupSch: TcxButtonEdit;
    LabelSch: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OstIstFinFilterForm: TOstIstFinFilterForm;

implementation

{$R *.dfm}

end.
