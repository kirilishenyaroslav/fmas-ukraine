unit FilterNeobrabot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxGroupBox, cxLabel, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls,
  cxRadioGroup, cxLookAndFeelPainters, cxButtons;

type
  TfmFilterNeobrabot = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxDateEdit1: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxDateEdit2: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGroupBox2: TcxGroupBox;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    cxRadioButton3: TcxRadioButton;
    cxLabel3: TcxLabel;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ShowFilterBankNeobr(var d1, d2 : TDate; var pr : integer) : boolean;

implementation
uses Un_R_file_Alex;
{$R *.dfm}

function ShowFilterBankNeobr(var d1, d2 : TDate; var pr : integer) : boolean;
var
    T : TfmFilterNeobrabot;
begin
    T  := TfmFilterNeobrabot.Create(nil);
    T.cxDateEdit1.Date := d1;
    T.cxDateEdit2.Date := d2;
    T.Caption                := Un_R_file_Alex.BANK_NEOBR_FILTER_CAPTION;
    T.cxLabel1.Caption       := Un_R_file_Alex.BANK_NEOBR_LABLE1;
    T.cxLabel2.Caption       := Un_R_file_Alex.KASSA_FIND_CAP_2;
    T.cxLabel3.Caption       := Un_R_file_Alex.KASSA_FIND_CAP_3;
    T.cxRadioButton1.Caption := Un_R_file_Alex.BANK_RAD1;
    T.cxRadioButton2.Caption := Un_R_file_Alex.BANK_RAD2;
    T.cxRadioButton3.Caption := Un_R_file_Alex.BANK_RAD3;
    T.cxButton1.Caption      := Un_R_file_Alex.MY_BUTTON_FILTER + ' (Enter)';
    T.cxButton2.Caption      := Un_R_file_Alex.MY_EXIT;
    if T.Showmodal = mrOk then
    begin
        d1 := StrToDate(T.cxDateEdit1.Text);
        d2 := StrToDate(T.cxDateEdit2.Text);
        if T.cxRadioButton1.Checked then pr := 0;
        if T.cxRadioButton2.Checked then pr := 1;
        if T.cxRadioButton3.Checked then pr := 2;
        Result := true;
    end else
    begin
        Result := false;
    end;
    T.Free;

end;

procedure TfmFilterNeobrabot.cxButton2Click(Sender: TObject);
begin
    Close;
end;

procedure TfmFilterNeobrabot.cxButton1Click(Sender: TObject);
var
    d1 : TDateTime;
begin
    try
        if (TryStrToDate(cxDateEdit1.Text, d1)) and (TryStrToDate(cxDateEdit2.Text, d1)) then
        begin
            ModalResult := mrOk;
        end;
    except
    begin
        showmessage(Un_R_file_Alex.BANK_ERROR_DATE);
        exit;
    end;
    end;
end;

end.
