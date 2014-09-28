unit uSpMatOtvSearchForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, uSpMatOtvCommon, uResources;

type
  TSearchForm = class(TForm)
    SearchRadioGroup: TRadioGroup;
    BottomPanel: TPanel;
    PibLabel: TLabel;
    Search_Next: TCheckBox;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    SearchEdit: TcxTextEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SearchEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SearchForm: TSearchForm;

implementation

{$R *.dfm}

procedure TSearchForm.OkButtonClick(Sender: TObject);
begin
    if SearchEdit.Text = ''
    then begin
     MessageDlg(MAT_STR_NEED_TEXT, mtError,[mbOk],0);
     ModalResult := mrNone;
    end;
end;

procedure TSearchForm.FormShow(Sender: TObject);
begin
    SearchEdit.SetFocus;
end;

procedure TSearchForm.SearchEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then OkButton.Click;
    if Key = VK_ESCAPE then Close;
end;

procedure TSearchForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then Close;
end;

procedure TSearchForm.FormCreate(Sender: TObject);
begin
 Caption := MAT_SP_MO_FORM_FIND_NAME;
 SearchRadioGroup.Caption := MAT_SP_MO_FORM_FIND_GROUP;
 PibLabel.Caption := MAT_SP_MO_FORM_FIND_TEXT;
 Search_Next.Caption := MAT_SP_MO_FORM_FIND_NEXT;
 OkButton.Caption := MAT_BUTTON_OK_CONST;
 CancelButton.Caption := MAT_BUTTON_CANCEL_CONST;
end;

end.
