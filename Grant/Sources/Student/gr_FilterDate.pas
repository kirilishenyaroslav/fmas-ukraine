unit gr_FilterDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, gr_uCommonProc, IBase, dates, cxLabel;

type
  TFFilterDate = class(TForm)
    EditDateBeg: TcxDateEdit;
    EditDateEnd: TcxDateEdit;
    Panel1: TPanel;
    ButtonYes: TcxButton;
    ButtonCancel: TcxButton;
    Actions: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    ActionEnter: TAction;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionEnterExecute(Sender: TObject);
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFilterDate: TFFilterDate;

implementation

{$R *.dfm}

procedure TFFilterDate.ActionYesExecute(Sender: TObject);
begin
  if EditDateBeg.Date>EditDateEnd.Date then
  begin
    showmessage('ƒата початку б≥льше дати к≥нц€!');
    exit;
  end;
 ModalResult:=mrOk;
end;

procedure TFFilterDate.ActionCancelExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFFilterDate.ActionEnterExecute(Sender: TObject);
begin
  if ButtonYes.Focused then
    begin
      ActionYesExecute(Sender);
      exit;
    end;
  keybd_event(VK_TAB,0,0,0);
end;

constructor TFFilterDate.Create(AOwner: TComponent;Db_Handle:TISC_DB_HANDLE);
begin
  inherited create(AOwner);
  EditDateBeg.Date:= ConvertKodToDate(grKodSetup(Db_Handle));
  EditDateEND.Date:= ConvertKodToDate(grKodSetup(Db_Handle)+1)-1;
end;

end.
