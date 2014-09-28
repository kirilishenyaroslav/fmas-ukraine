unit Test1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FIBDatabase, pFIBDatabase, uCommonSp, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TForm1 = class(TForm)
    Button1: TButton;
    D: TpFIBDatabase;
    T: TpFIBTransaction;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses shellapi;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
    sp : TSprav;
    param : string;
begin
{    try
    sp :=  GetSprav('UP\UP_OrderPrint');
    if sp <> nil
     then begin
       with sp.Input do
       begin
         Append;
         FieldValues['DBHandle'] := Integer(D.Handle);
         FieldValues['id_order'] := 1;
         Post;
       end;
       sp.Show;
       sp.Free;
    end
    else ShowMessage('Что-то!');
    except on e:Exception do
        MessageDlg('Ошибка: ' + e.Message, mtError, [mbOk], 0);
    end;}
    param := '348799';
    ShellExecute(0, 'open', PAnsiChar(ExtractFilePath(Application.ExeName) + 'PrintOrder.exe'), pAnsiChar(param), PAnsiChar(ExtractFilePath(Application.ExeName)), sw_show);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    D.DefaultTransaction := T;
    T.DefaultDatabase    := D;
    D.Open;
//    T.StartTransaction;
end;

end.
