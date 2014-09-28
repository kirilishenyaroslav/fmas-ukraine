unit uWhatsNew;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, ComCtrls, ActnList, PersonalCommon, DB,
    FIBDataSet, pFIBDataSet;

type
    TfmWhatsNew = class(TForm)
        OkButton: TBitBtn;
        WhatsNewEdit: TRichEdit;
        ActionList: TActionList;
        OkAction: TAction;
        InputQuery: TpFIBDataSet;
        InputQueryIS_VUZ: TFIBStringField;
        procedure OkActionExecute(Sender: TObject);
        procedure FormCreate(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    fmWhatsNew: TfmWhatsNew;

implementation

{$R *.dfm}

procedure TfmWhatsNew.OkActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmWhatsNew.FormCreate(Sender: TObject);
var
    txt_name: string;
begin
    InputQuery.Transaction := FIBReadTransaction;
    InputQuery.Open;

    if InputQueryIS_VUZ.Value = 'T' then
        txt_name := 'asup_whats_new_vuz.txt'
    else
        txt_name := 'asup_whats_new.txt';

    WhatsNewEdit.Lines.LoadFromFile(ProgramPath + txt_name);
end;

end.
