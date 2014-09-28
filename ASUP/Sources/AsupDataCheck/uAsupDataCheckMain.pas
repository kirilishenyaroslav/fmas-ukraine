unit uAsupDataCheckMain;

interface

uses IBase, IBDatabase, uCommonDB, uIBXCommonDB, uTableCommon, WorkModeCentral;

procedure AsupDataCheckInit(Handle: Pointer);
procedure AsupDataCheckDone;

var
    DB: TIBDatabase;
    DefaultTransaction: TIBTransaction;
    ReadTransaction: TIBTransaction;
    WriteTransaction: TIBTransaction;
    Curr_DB: TDBCenter;
    WorkModeCentralActivated: Boolean;

implementation

procedure AsupDataCheckInit(Handle: Pointer);
begin
    DB := TIBDatabase.Create(nil);
    DB.SetHandle(Handle);

    DefaultTransaction := TIBTransaction.Create(nil);
    DefaultTransaction.DefaultDatabase := DB;
    DB.DefaultTransaction := DefaultTransaction;

    DefaultTransaction := TIBTransaction.Create(nil);
    DefaultTransaction.DefaultDatabase := DB;

    ReadTransaction := TIBTransaction.Create(nil);
    ReadTransaction.DefaultDatabase := DB;

    WriteTransaction := TIBTransaction.Create(nil);
    WriteTransaction.DefaultDatabase := DB;

    Curr_DB := IBXCreateDBCenter(Handle);

    if TableReadTransaction = nil then
        uTableCommon.TableReadTransaction := ReadTransaction;

    if TableWriteTransaction = nil then
        uTableCommon.TableWriteTransaction := WriteTransaction;

                // загрузить режимы работы, календарь, типы выходов
    if WorkModeCenter = nil then
    begin
        WorkModeCentralActivated := True;
        WorkModeCenter := TWorkModeCenter.Create(ReadTransaction);
        WorkModeCenter.ReLoad;
    end;

    if Calendar = nil then
    begin
        Calendar := TCalendar.Create(ReadTransaction);
        Calendar.ReLoad;
    end;

    if AllVihods = nil then
    begin
         AllVihods := TAllVihods.Create(ReadTransaction);
         AllVihods.ReLoad;
    end;

end;

procedure AsupDataCheckDone;
begin
    Curr_DB.Free;
    WriteTransaction.Free;
    ReadTransaction.Free;
    DefaultTransaction.Free;
    DB.Free;

    if WorkModeCentralActivated then
    begin
         WorkModeCenter.Free;
         Calendar.Free;
         AllVihods.Free;
    end;
end;

end.

