unit SpravkaSelectSch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, SpravkaAddChangeProv, Un_R_file_Alex;

type
  TfmSpravkaSelectSch = class(TForm)
    cxComboBox1: TcxComboBox;
    cxLabel1: TcxLabel;
    cxButtonTake: TcxButton;
    cxButtonClose: TcxButton;
    procedure cxButtonTakeClick(Sender: TObject);
  private
    Ind : array of Int64;
  public
    { Public declarations }
  end;

function ShowSelectSch_Spravka(m : TfmAddChangeProvSpravka; var id : int64) : boolean;

implementation

{$R *.dfm}

function ShowSelectSch_Spravka(m : TfmAddChangeProvSpravka; var id : int64) : boolean;
var
    T : TfmSpravkaSelectSch;
    i : integer;
begin
    T := TfmSpravkaSelectSch.Create(nil);
    T.cxButtonTake.Caption  := Un_R_file_Alex.MY_ACTION_OK;
    T.cxButtonClose.Caption := Un_R_file_Alex.MY_BUTTON_CLOSE;
    T.Caption               := Un_R_file_Alex.J4_FORM_SELECT_SCH;
    T.cxLabel1.Caption      := Un_R_file_Alex.J4_SELECT_SCH;
    SetLength(T.Ind, Length(m.ind));
    T.cxComboBox1.Properties.Items.Clear;
    for i := 0 to Length(m.ind)-1 do
    begin
        T.Ind[i] := m.Ind[i];
        T.cxComboBox1.Properties.Items.Insert(i, m.cxComboBoxSch.Text + '   ' + m.cxLabel2.Text);
    end;
    T.cxComboBox1.ItemIndex := 0;
    if T.ShowModal = mrOk then
    begin
        id := T.Ind[T.cxComboBox1.ItemIndex];
        result := true;
    end else
    begin
        result := false;
    end;
end;


procedure TfmSpravkaSelectSch.cxButtonTakeClick(Sender: TObject);
begin
    ModalResult := mrOK;
end;

end.
