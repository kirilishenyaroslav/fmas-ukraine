unit USetFilterSetings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, cxButtons;

type
  TfmFiltring = class(TForm)
    Labelfilter: TLabel;
    cxButtonSet: TcxButton;
    cxButtonClose: TcxButton;
    TextEditWhatFind: TcxTextEdit;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonSetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    old_set   : string;
    flag_find : integer;
  public
    ResultArray : Variant;
  end;
  function func_Filter(Old: String; sho : Integer) : variant;

var
  fmFiltring: TfmFiltring;

implementation

{$R *.dfm}

function func_Filter(Old: String; sho : Integer) : variant;
var
    fmfind : TfmFiltring;
begin
    fmfind := TfmFiltring.Create(nil);

    fmfind.Caption               := 'Пошук';
    fmfind.Labelfilter.Caption   := 'Шукати:';
    fmfind.cxButtonSet.Caption   := 'Вiдiбрати';
    fmfind.cxButtonClose.Caption := 'Вiдмiнити';

    fmfind.TextEditWhatFind.Text := Old;
    fmfind.old_set               := Old;
    fmfind.flag_find             := sho;

    fmfind.ShowModal;
    func_Filter := fmfind.ResultArray;
    fmfind.Free;
end;

procedure TfmFiltring.cxButtonCloseClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);

    ResultArray[0]  := old_set;
    ResultArray[1]  := flag_find;
    Close;
end;

procedure TfmFiltring.cxButtonSetClick(Sender: TObject);
var
   str : string;
begin
    str := TextEditWhatFind.Text;
    if (str <> '') then
    begin
        str := str[1];
        if (str >= 'а') and (str <= 'я') then
        begin
            flag_find := 1;
            old_set   := AnsiUpperCase(TextEditWhatFind.Text) + '%';
        end;
        if (str >= 'А') and (str <= 'Я') then
        begin
            flag_find := 1;
            old_set   := TextEditWhatFind.Text + '%';
        end;
        if (str >= '0') and (str <= '9') then
        begin
            flag_find := 2;
            old_set   := TextEditWhatFind.Text + '%';
        end;
    end else
    begin
        flag_find := 0;
        old_set   := '';
    end;

    ResultArray := VarArrayCreate([0,1], varVariant);

    ResultArray[0]  := old_set;
    ResultArray[1]  := flag_find;
    Close;
end;

procedure TfmFiltring.FormCreate(Sender: TObject);
var
    Layout: array[0.. KL_NAMELENGTH] of char;
begin
    LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);
end;

end.
