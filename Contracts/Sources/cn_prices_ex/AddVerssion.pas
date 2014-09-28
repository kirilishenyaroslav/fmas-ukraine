unit AddVerssion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, ExtCtrls, cxCheckBox, cnConsts_Messages, cnConsts,
  ActnList, cn_Common_Messages;

type
  TfrmAddVerssion = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    EditNameVerssion: TcxTextEdit;
    Ok_Button: TcxButton;
    Cancel_Button: TcxButton;
    LPriceVerssionName: TcxLabel;
    chbActual: TcxCheckBox;
    ActionList1: TActionList;
    act_ok: TAction;
    cancel: TAction;
    procedure FormCreate(Sender: TObject);
    constructor Create( AOwner:TComponent; LangIndex: Integer);overload;
    procedure act_okExecute(Sender: TObject);
    procedure cancelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
    PLanguageIndex: Integer;
  end;

var
  frmAddVerssion: TfrmAddVerssion;

implementation

{$R *.dfm}

constructor TfrmAddVerssion.Create( AOwner:TComponent; LangIndex: Integer);
begin
    inherited Create(AOwner);
    PLanguageIndex:=LangIndex;
end;

procedure TfrmAddVerssion.FormCreate(Sender: TObject);
begin
    Ok_Button.Caption           := cn_Accept[PLanguageIndex];
    Ok_Button.Hint              := cn_Accept[PLanguageIndex];
    Cancel_Button.Caption       := cn_cancel[PLanguageIndex];
    Cancel_Button.Hint          := cn_cancel[PLanguageIndex];
    LPriceVerssionName.Caption  := cnConsts.cn_grid_ADDVerName[PLanguageIndex];
    chbActual.Properties.Caption:= cnConsts.cn_grid_Actual[PLanguageIndex];
end;

procedure TfrmAddVerssion.FormShow(Sender: TObject);
begin
    EditNameVerssion.SetFocus;
end;

procedure TfrmAddVerssion.act_okExecute(Sender: TObject);
begin
    if EditNameVerssion.Text<>'' then ModalResult:=mrOk
    else cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_Some_Need[PLanguageIndex], mtConfirmation, [mbOK]);
end;

procedure TfrmAddVerssion.cancelExecute(Sender: TObject);
begin
    Close;
end;

end.
