unit uSP_Staj_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, cxButtons, ExtCtrls, ActnList;

type
  TfmStajEdit = class(TForm)
    lbl1: TLabel;
    pnl1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxTextEdit1: TcxTextEdit;
    KeyList: TActionList;
    AddAction: TAction;
    CancelAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    EnterAction: TAction;
    OkAction: TAction;
    procedure OkActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmStajEdit: TfmStajEdit;

implementation

{$R *.dfm}

procedure TfmStajEdit.OkActionExecute(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfmStajEdit.CancelActionExecute(Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

procedure TfmStajEdit.FormCreate(Sender: TObject);
begin
//cxTextEdit1.Focused;
end;

procedure TfmStajEdit.FormActivate(Sender: TObject);
begin
cxTextEdit1.SetFocus ;
end;

end.
