unit AddPaperSignerUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, SpFormUnit, PersonalCommon, SpCommon;

type
    TAddPaperSignerForm = class(TForm)
        CancelButton: TBitBtn;
        OkButton: TBitBtn;
        Label3: TLabel;
        FIoEdit: TEdit;
        Label1: TLabel;
        PostEdit: TEdit;
        SelectButton: TButton;
        procedure OkButtonClick(Sender: TObject);
        procedure SelectButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    AddPaperSignerForm: TAddPaperSignerForm;

implementation

{$R *.dfm}

procedure TAddPaperSignerForm.OkButtonClick(Sender: TObject);
begin
    if (FioEdit.Text = '')
        then begin
        MessageDlg('Потрібно заповнити П.І.Б. підписуючого!', mtError, [mbOk], 0);
        FioEdit.SetFocus;
        exit;
    end;

    if (PostEdit.Text = '')
        then begin
        MessageDlg('Потрібно заповнити посаду підписуючого!', mtError, [mbOk], 0);
        PostEdit.SetFocus;
        exit;
    end;

    ModalResult := mrOk;
end;

procedure TAddPaperSignerForm.SelectButtonClick(Sender: TObject);
var
    Form: TSpForm;
    Params: TSpParams;
begin
    Form := TSpForm.Create(self);
    Params := TSpParams.Create;

    Params.Table := 'ORDER_PAPER_SIGNERS_SELECT';
    Params.IdField := 'ID_ORDER';
    Params.SpFields := 'FIO, POST';
    Params.Title := 'Використовані раніше підписуючі друкованої версії наказу';
    Params.ColumnNames := 'П.І.Б, Посада';
    Params.ReadOnly := True;
    Params.SpMode := [spfSelect];

    Form.Init(Params);

    if Form.ShowModal = mrOk
        then begin
        FioEdit.Text := Form.ResultQuery['FIO'];
        PostEdit.Text := Form.ResultQuery['POST'];
    end;

    Form.Free;
    Params.Free;
end;

end.
