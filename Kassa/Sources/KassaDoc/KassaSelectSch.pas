unit KassaSelectSch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, AddChangeProv, Un_R_file_Alex;

type
  TfmAvanceSelectSch = class(TForm)
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

function ShowSelectSch_Kassa(m : TfmAddChangeProv; var id : int64) : boolean;

implementation

{$R *.dfm}

function ShowSelectSch_Kassa(m : TfmAddChangeProv; var id : int64) : boolean;
var
    T : TfmAvanceSelectSch;
begin
    T := TfmAvanceSelectSch.Create(nil);
    T.cxButtonTake.Caption  := Un_R_file_Alex.MY_ACTION_OK;
    T.cxButtonClose.Caption := Un_R_file_Alex.MY_BUTTON_CLOSE;
    T.Caption               := Un_R_file_Alex.J4_FORM_SELECT_SCH;
    T.cxLabel1.Caption      := Un_R_file_Alex.J4_SELECT_SCH;
    SetLength(T.Ind, m.DataSetSchKorespond.RecordCount);
    m.DataSetSchKorespond.First;

    T.cxComboBox1.Properties.Items.Clear;
    while not m.DataSetSchKorespond.Eof do
    begin
        T.Ind[m.DataSetSchKorespond.RecNo - 1] := m.DataSetSchKorespond['ID_SCH'];
        T.cxComboBox1.Properties.Items.Insert(m.DataSetSchKorespond.RecNo - 1, m.DataSetSchKorespond['SCH_NUM'] + '   ' + m.DataSetSchKorespond['SCH_TITLE']);
        m.DataSetSchKorespond.Next;
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


procedure TfmAvanceSelectSch.cxButtonTakeClick(Sender: TObject);
begin
    ModalResult := mrOK;
end;

end.
