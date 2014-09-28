unit test;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cn_Common_Types, ibase;

type
  TForm1 = class(TForm)
  private
    constructor Create(AOwner : TComponent;Db:TISC_DB_HANDLE);overload;
    { Private declarations }
  public

    { Public declarations }
  end;

function ReportsLogClear(AParameter:TcnSimpleParams):Variant;stdcall;
exports ReportsLogClear;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function ReportsLogClear(AParameter:TcnSimpleParams):Variant;stdcall;
Var
 View:TForm1;
begin

  View:=TForm1.Create(AParameter.Owner,AParameter.Db_Handle);
  if not Assigned(AParameter.Db_Handle) then ShowMessage('Error in MainViewReports')
  Else ShowMessage(' A L L  G O O D ');

end;

Constructor TForm1.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
begin
  Inherited Create(AOwner);
  
End;
end.
