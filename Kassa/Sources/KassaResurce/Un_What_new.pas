unit Un_What_new;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo, ActnList;

type
  TfmUn_What_new = class(TForm)
    cxMemo1: TcxMemo;
    ActionList1: TActionList;
    Action1: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure Show_What_New(S : TComponent; systema : integer);

implementation
uses Un_R_file_Alex;

{$R *.dfm}

procedure Show_What_New(S : TComponent; systema : integer);
var
    T : TfmUn_What_new;
begin
    T := TfmUn_What_new.Create(s);
    T.FormStyle := fsMDIChild;
    try
    case systema of
        1  : T.cxMemo1.Lines.LoadFromFile('JO1_Whats_New.txt');
        2  : T.cxMemo1.Lines.LoadFromFile('JO2_Whats_New.txt');
        4  : T.cxMemo1.Lines.LoadFromFile('JO4_Whats_New.txt');
        33 : T.cxMemo1.Lines.LoadFromFile('UW_Whats_New.txt');
        34 : T.cxMemo1.Lines.LoadFromFile('ClBank_whats new.txt');
    end;
    except
        T.cxMemo1.Text := '';
    end;
    T.Show;
end;
procedure TfmUn_What_new.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := CaFree;
end;

procedure TfmUn_What_new.Action1Execute(Sender: TObject);
begin
    Close;
end;

procedure TfmUn_What_new.FormCreate(Sender: TObject);
begin
    Caption := Un_R_file_Alex.MY_WHAT_NEW;
end;

end.
