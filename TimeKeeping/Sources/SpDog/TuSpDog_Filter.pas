unit TuSpDog_Filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxDropDownEdit, cxCalendar,
  ActnList, StdCtrls, cxButtons, cxCheckBox, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls, cxGroupBox, ExtCtrls;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    cxGroupBox3: TcxGroupBox;
    EditMan: TcxButtonEdit;
    CheckBoxMan: TcxCheckBox;
    cxGroupBox5: TcxGroupBox;
    CheckBoxWorkMode: TcxCheckBox;
    EditWorkMode: TcxButtonEdit;
    Panel2: TPanel;
    ButtonYes: TcxButton;
    ButtonCancel: TcxButton;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    GroupBoxPeriod: TcxGroupBox;
    CheckBoPeriod: TcxCheckBox;
    EditDateEnd: TcxDateEdit;
    cxLabel4: TcxLabel;
    EditDateBeg: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    CheckBoxTemplet: TcxCheckBox;
    EditTemplet: TcxButtonEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

end.
