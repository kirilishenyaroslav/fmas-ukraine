unit UEditSaldo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalc, StdCtrls, cxButtons,
  ExtCtrls, ActnList;

type
  TfrmEditSaldo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    DB_VALUE: TcxCalcEdit;
    KR_VALUE: TcxCalcEdit;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    MAIN_DB_VALUE: TcxCalcEdit;
    Label4: TLabel;
    MAIN_KR_VALUE: TcxCalcEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    ActionList1: TActionList;
    Enter: TAction;
    Esc: TAction;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EnterExecute(Sender: TObject);
    procedure EscExecute(Sender: TObject);
  private
    { Private declarations }
  public
    sch_str:string;
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TfrmEditSaldo.cxButton1Click(Sender: TObject);
begin
  ModalResult:=mrYes;
end;

procedure TfrmEditSaldo.cxButton2Click(Sender: TObject);
begin
  ModalResult:=mrNo;
end;

procedure TfrmEditSaldo.FormShow(Sender: TObject);
begin
  Caption:=Caption+' '+ sch_str;
end;

procedure TfrmEditSaldo.EnterExecute(Sender: TObject);
begin
  ModalResult:=mrYes;
end;

procedure TfrmEditSaldo.EscExecute(Sender: TObject);
begin
  ModalResult:=mrNo;
end;

end.
