unit PrihodRashod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList, Un_R_file_Alex,
  cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, ToolWin, ComCtrls,
  cxSplitter;

type
  TfmPrihodRashod = class(TForm)
    cxButtonPrihod: TcxButton;
    cxButtonRashod: TcxButton;
    ActionList1: TActionList;
    ActionClose: TAction;
    cxLabel1: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure ActionCloseExecute(Sender: TObject);
    procedure cxButtonPrihodClick(Sender: TObject);
    procedure cxButtonRashodClick(Sender: TObject);
    procedure cxButtonPrihodKeyPress(Sender: TObject; var Key: Char);
  private
    prihod : smallint;
    writing : string;
    i : integer;
    procedure LoadCaptions;
  public
    barcode_show : string;
    //wtiting : integer;
  end;

function Show_fmPrihod(barstr, shablon_barcode : string; var i : smallint): boolean;

implementation

{$R *.dfm}

function Show_fmPrihod(barstr, shablon_barcode : string; var i : smallint): boolean;
var
    T: TfmPrihodRashod;
begin
    T := TfmPrihodRashod.Create(nil);
    T.LoadCaptions;

    T.cxLabel2.Caption := barstr;
    T.cxLabel5.Caption := shablon_barcode;

    if (barstr='') then T.Height := T.Height-T.Panel1.Height;

    if T.ShowModal=mrOk then
    begin
        i := T.prihod;
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
    prihod := 1;
    if (i=0) then ModalResult := mrOk else
    begin
        writing := '';
        i := 0;
    end;
end;

procedure TfmPrihodRashod.cxButtonRashodClick(Sender: TObject);
begin
    prihod := 0;
    if (i=0) then ModalResult := mrOk else
    begin
        writing := '';
        i := 0;
    end;
end;

procedure TfmPrihodRashod.LoadCaptions;
begin
    Caption := Un_R_file_Alex.KASSA_SELECT_SHOBLON_CAPTION;
    cxButtonPrihod.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_PRIH_;
    cxButtonRashod.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_RASH_;
    cxLabel1.caption       := Un_R_file_Alex.KASSA_SELECT_SHOBLON_LABEL;
    cxLabel3.caption       := Un_R_file_Alex.KASSA_BARCODE;
    cxLabel4.caption       := Un_R_file_Alex.KASSA_SELECT_SHABLON_NAME;
end;

procedure TfmPrihodRashod.cxButtonPrihodKeyPress(Sender: TObject;
  var Key: Char);
begin
    writing := '';
    i := 0;

    if ((Ord(Key) < 48) or (Ord(Key) > 57)) and (Ord(Key) <> 13)and (Ord(Key) <> 8) then
          Key := Chr(0) else
    if (Ord(Key) <> 13) and  ((Ord(Key) > 48) or (Ord(Key) < 57)) then
    begin
        writing := writing+key;
        i := i+1;
    end;

end;

end.
