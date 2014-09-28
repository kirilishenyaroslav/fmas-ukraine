unit UKrDbConfigureForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxRadioGroup, Placemnt, cxDropDownEdit, cxCalendar;

type
  TfrmGetConfInfo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    ShowSmGr: TcxCheckBox;
    ShowSm: TcxCheckBox;
    ShowRz: TcxCheckBox;
    ShowSt: TcxCheckBox;
    ShowKv: TcxCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    edTypeSmGrInfo: TcxRadioGroup;
    edTypeSmInfo: TcxRadioGroup;
    edTypeRzInfo: TcxRadioGroup;
    edTypeStInfo: TcxRadioGroup;
    edTypeKvInfo: TcxRadioGroup;
    cxButton2: TcxButton;
    ShowProgram: TcxCheckBox;
    edProgramInfo: TcxRadioGroup;
    FormStorage1: TFormStorage;
    cxDateEdit1: TcxDateEdit;
    ShowSch: TcxCheckBox;
    edTypeSchInfo: TcxRadioGroup;
    ShowSchFilter: TcxCheckBox;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DateBeg:TDateTime;
    constructor Create(AOwner:TComponent;DateBeg:TDateTime);overload;
  end;

implementation

uses GlobalSpr,Resources_unitb,BaseTypes,DateUtils,UKrDbMainResults;
{$R *.dfm}

constructor TfrmGetConfInfo.Create(AOwner: TComponent; DateBeg:TDateTime);
begin
     inherited Create(AOwner);
     self.DateBeg:=DateBeg;
     cxDateEdit1.Date:=DateBeg;
end;

procedure TfrmGetConfInfo.cxButton1Click(Sender: TObject);
begin
     TfrmMainResults(self.Owner).Panel2.Caption:='Аналіз заборгованності на активно-пасивних рахунках на'+DateToStr(cxDateEdit1.Date);
     ModalResult:=mrYes;
end;

procedure TfrmGetConfInfo.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.
