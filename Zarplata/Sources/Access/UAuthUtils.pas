unit UAuthUtils;

interface

uses pFIBDatabase, pFIBDataSet, ibase, Forms, Windows, Controls, SysUtils, uMD5, UAUsersMngr;

function IsZSuperUser(id_user:Int64;DBHandle:TISC_DB_HANDLE):Boolean; stdcall;
exports IsZSuperUser;

implementation

uses USUPass;

function IsZSuperUser(id_user:Int64;DBHandle:TISC_DB_HANDLE):Boolean; stdcall;
var DB:TpFIBDatabase;
    Tr:TpFIBTransaction;
    DS:TpFIBDataSet;
    super_user_flag:Boolean;
    hash_str:string;
begin
    super_user_flag:=False;

    DB:=TpFIBDatabase.Create(nil);
    DB.SQLDialect:=3;

    Tr:=TpFIBTransaction.Create(nil);
    Tr.DefaultDatabase:=DB;
    DB.DefaultTransaction:=Tr;
    DB.DefaultUpdateTransaction:=Tr;

    DB.Handle:=DBHandle;

    DS:=TpFIBDataSet.Create(nil);
    DS.Database:=DB;
    DS.Transaction:=Tr;

    Tr.StartTransaction;

    DS.SelectSQL.Text:='SELECT * FROM Z_DO_AUTHENTIFICATION_SU ';
    DS.Open;

    with TfrmSuperUserPass.Create(Application.MainForm) do
    begin

         if ShowModal=mrYes
         then begin
                   if (DS.RecordCount>0)
                   then begin
                             hash_str:=uMD5.StrMD5(PassEdit.Text);
                             DS.FetchAll;
                             DS.First;
                             while not DS.Eof do
                             begin
                                  if DS['PASSWD_MD5_HASH']=hash_str
                                  then begin
                                             super_user_flag:=True;
                                             Break;
                                  end;
                                  DS.Next;
                             end;

                             if super_user_flag
                             then begin
                                       with UAUsersMngr.TfrmUsersMngr.Create(Application.MainForm,DBHandle) do
                                       begin
                                             ShowModal;
                                             Free;
                                             Result:=True;
                                       end;
                             end
                             else Result:=False;
                   end;
         end;
         Free;
    end;

    DS.Close;
    Tr.Rollback;

    DS.Free;
    Tr.Free;
    DB.Free;
end;


end.
