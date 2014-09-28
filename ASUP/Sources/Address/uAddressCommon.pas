unit uAddressCommon;

interface

uses
    IBDatabase, IBQuery, Controls, Variants, SysUtils,
    FIBDatabase, pFIBDatabase, ComCtrls, Dialogs, ibase, DB, IBExternals,
    pFIBDataset;

var
    FIBDatabase: TpFIBDatabase;
    FIBWriteTransaction: TpFIBTransaction;
    FIBReadTransaction: TpFIBTransaction;

    AdrWriteTransaction: TpFIBTransaction;
    AdrReadTransaction: TpFIBTransaction;

    Database: TIBDatabase;
    ReadTransaction: TIBTransaction;
    WriteTransaction: TIBTransaction;
    DefaultTransaction: TIBTransaction;

    ServersDS: TpFIBDataset;
    ServersSource: TDataSource;

    Version: Integer;

    Current_Server: Integer;

    Servers_Count: Integer;

procedure AddressInit(Handle: TISC_DB_Handle; ver: Integer);
procedure AddressDone;

function EditAddress(Id_Adress: Variant; var AdrString, addrb: String): Variant;

implementation

uses AdressUnit, Forms, SpCommon;

procedure AddressInit(Handle: TISC_DB_Handle; ver: Integer);
begin
    Version := ver;

    FIBDatabase := TpFIBDatabase.Create(nil);
    FIBDatabase.SQLDialect := 3;
    FIBDatabase.Handle := Handle;
    FIBDatabase.Connected := True;

    FIBWriteTransaction := TpFIBTransaction.Create(FIBDatabase);
    FIBWriteTransaction.DefaultDatabase := FIBDatabase;

    FIBReadTransaction := TpFIBTransaction.Create(FIBDatabase);
    FIBReadTransaction.DefaultDatabase := FIBDatabase;
    FIBReadTransaction.TRParams.Clear;
    FIBReadTransaction.TRParams.Add('read_committed');


    AdrReadTransaction := TpFIBTransaction.Create(FIBDatabase);
    AdrReadTransaction.DefaultDatabase := FIBDatabase;
    AdrReadTransaction.TRParams.Clear;
    AdrReadTransaction.TRParams.Add('read_committed');

    AdrWriteTransaction := TpFIBTransaction.Create(FIBDatabase);
    AdrWriteTransaction.DefaultDatabase := FIBDatabase;
    AdrWriteTransaction.TRParams.Clear;
    AdrWriteTransaction.TRParams.Add('read_committed');

    Database := TIBDatabase.Create(nil);
    Database.SetHandle(IBExternals.PVOid(Handle));
    Database.Connected := True;

    DefaultTransaction := TIBTransaction.Create(Database);
    Database.DefaultTransaction := DefaultTransaction;
    DefaultTransaction.DefaultDatabase := Database;

    ReadTransaction := TIBTransaction.Create(Database);
    ReadTransaction.DefaultDatabase := Database;
    ReadTransaction.Params.Clear;
    ReadTransaction.Params.Add('read_committed');

    WriteTransaction := TIBTransaction.Create(Database);
    WriteTransaction.DefaultDatabase := Database;
    WriteTransaction.Params.Clear;
    WriteTransaction.Params.Add('read_committed');

    ServersDS := TpFIBDataset.Create(Application.MainForm);
    ServersDS.Database := FIBDatabase;
    ServersDS.Transaction := AdrReadTransaction;

    ServersDS.SelectSQL.Text := 'SELECT Id_Server FROM Sys_Options';
    ServersDS.Open;
    ServersDS.First;
    Current_Server := ServersDS['Id_Server'];
    ServersDS.Close;

    ServersDS.SelectSQL.Text := 'SELECT Id_Server, Name_Server FROM Exch_Ini_Servers';
    ServersDS.Open;
    ServersDS.FetchAll;
    Servers_Count := ServersDS.RecordCount;

    ServersSource := TDataSource.Create(Application.MainForm);
    ServersSource.DataSet := ServersDS;
end;

procedure AddressDone;
begin
    WriteTransaction.Free;
    ReadTransaction.Free;
    Database.Free;

    AdrReadTransaction.Free;
    AdrWriteTransaction.Free;

    FIBReadTransaction.Free;
    FIBWriteTransaction.Free;
    FIBDatabase.Free;

    ServersDS.Free;
    ServersSource.Free;
end;

function EditAddress(Id_Adress: Variant; var AdrString, addrb: String): Variant;
var
    Form: TAdressForm;
begin
    Form := TAdressForm.Create(Application.MainForm);

    if VarIsNull(Id_Adress) or ( Id_Adress = 0) then
    begin
        form.Prepare(emNew, addrb);
        if form.ShowModal = mrOk then
        begin
            Result := form.Id_Address;
            AdrString := form.AdrString;
        end
        else Result := Null;
        form.Free;
    end
    else
    begin
        form.Id_Address := Id_Adress;
        form.Prepare(emModify, addrb);

        if form.ShowModal = mrOk then
        begin
            Result := form.Id_Address;
            AdrString:= form.AdrString;
        end
        else Result := Null;

        form.Free;
    end;
end;



end.

