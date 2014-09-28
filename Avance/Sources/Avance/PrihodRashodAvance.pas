unit PrihodRashodAvance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList,
  cxControls, cxContainer, cxEdit, cxLabel, Un_R_file_Alex;

type
  TfmPrihodRashod = class(TForm)
    cxButtonPrihod: TcxButton;
    cxButtonRashod: TcxButton;
    ActionList1: TActionList;
    ActionClose: TAction;
    cxLabel1: TcxLabel;
    procedure ActionCloseExecute(Sender: TObject);
    procedure cxButtonPrihodClick(Sender: TObject);
    procedure cxButtonRashodClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    prihod : smallint;
    procedure LoadCaptions;
  public
    { Public declarations }
  end;

function Show_fmPrihod(var i : smallint): boolean;

implementation

{$R *.dfm}

function Show_fmPrihod(var i : smallint): boolean;
var
    T: TfmPrihodRashod;
begin
    T := TfmPrihodRashod.Create(nil);
    T.LoadCaptions;
    if T.ShowModal = mrOk then
    begin
        i      := T.prihod;
        Result := true;
    end
    else
        Result := false;
    T.Free
end;

procedure TfmPrihodRashod.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmPrihodRashod.cxButtonPrihodClick(Sender: TObject);
begin
    prihod      := 1;
    ModalResult := mrOk;
end;

procedure TfmPrihodRashod.cxButtonRashodClick(Sender: TObject);
begin
    prihod      := 0;
    ModalResult := mrOk;
end;

procedure TfmPrihodRashod.LoadCaptions;
begin
    Caption                := Un_R_file_Alex.KASSA_SELECT_SHOBLON_CAPTION;
    cxButtonPrihod.Caption := Un_R_file_Alex.J4_SELECT_DOC_DEB;
    cxButtonRashod.Caption := Un_R_file_Alex.J4_SELECT_DOC_AVANCE;
    cxLabel1.caption       := Un_R_file_Alex.KASSA_SELECT_SHOBLON_LABEL;
end;

procedure TfmPrihodRashod.cxButton1Click(Sender: TObject);
begin
    prihod      := 2;
    ModalResult := mrOk;
end;

end.
