unit uDoWorkBSO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, ActnList, cxButtons;

type
  TBSOForm = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    cxSeriya: TcxTextEdit;
    cxNumBeg: TcxTextEdit;
    cxNumEnd: TcxTextEdit;
    cxKolDoc: TcxTextEdit;
    cxKolNum: TcxTextEdit;
    cxButton1: TcxButton;
    actlst1: TActionList;
    actSave: TAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BSOForm: TBSOForm;

implementation

{$R *.dfm}

end.
