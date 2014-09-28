unit DomainUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, RxMemDS, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls,WindowsUsers, StdCtrls;

type
  TfrmDomainUsers = class(TForm)
    Panel1: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    DomainUsersMemoryData: TRxMemoryData;
    UserDataSource: TDataSource;
    DomainUsersMemoryDataid_user: TIntegerField;
    DomainUsersMemoryDatalogin: TStringField;
    DomainUsersMemoryDatafull_name: TStringField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    Result_id:integer;
    Result_login:string;
    Result_name :string;
    { Public declarations }
  end;

var
  frmDomainUsers: TfrmDomainUsers;

implementation

{$R *.dfm}

procedure TfrmDomainUsers.FormCreate(Sender: TObject);
var UserList:TList;
    i:Integer;

begin
  DomainUsersMemoryData.Open;
  UserList:=WindowsUsers.Get_domain_users_names;
  for i:=0 to UserList.Count-1 do
  begin
    DomainUsersMemoryData.Insert;
    DomainUsersMemoryData.FieldByName('LOGIN').Value:=string(PNetDisplayUser(UserList.Items[i])^.usri1_name);
    DomainUsersMemoryData.FieldByName('FULL_NAME').Value:=string(PNetDisplayUser(UserList.Items[i])^.usri1_full_name);
    DomainUsersMemoryData.FieldByName('ID_USER').Value:=IntToStr(PNetDisplayUser(UserList.Items[i])^.usri1_user_id);
    DomainUsersMemoryData.Post;
  end;
end;

procedure TfrmDomainUsers.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    if DomainUsersMemoryData.RecordCount>0
    then begin
        Result_login:=DomainUsersMemoryData.FieldByName('LOGIN').Value;
        Result_name :=DomainUsersMemoryData.FieldByName('FULL_NAME').Value;
        Result_id   :=DomainUsersMemoryData.FieldByName('ID_USER').Value;
        ModalResult:=mrYes;
    end;
end;

procedure TfrmDomainUsers.Button2Click(Sender: TObject);
begin
 ModalResult:=mrNo;
end;

end.
