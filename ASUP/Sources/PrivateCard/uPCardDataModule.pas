unit uPCardDataModule;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  Dialogs, AccMgmt;
type
  TdmPCard = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    PCardModules: TpFIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPCard: TdmPCard;
  AdminMode: Boolean;

function CheckAccess(Path:string;Action:String;DisplayMessage:Boolean=False):Integer;
procedure ShowInfo(DataSet: TDataSet);

implementation

{$R *.dfm}

function CheckAccess(Path:string;Action:String;DisplayMessage:Boolean=False):Integer;
var
    i:Integer;
begin
    i:=0;

    if (not AdminMode) then
    begin
        i:=fibCheckPermission(Path,Action);
            if i<>0 then begin
                if DisplayMessage then
                  MessageDlg(AcMgmtErrMsg(i),mtError,[mbOk],0);
            end;
    end;

    CheckAccess:=i;
end;

procedure ShowInfo(DataSet: TDataSet);
var text: string;
    i:integer;
begin
  text:='';
  for i:=1 to DataSet.Fields.Count do
   text:=text+DataSet.Fields[i-1].FieldName+' : '+DataSet.Fields[i-1].DisplayText+#13;
  ShowMessage(text);
end;

end.
