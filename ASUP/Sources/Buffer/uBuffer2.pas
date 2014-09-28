unit uBuffer2;

interface

uses Buffer, Controls, IBDatabase, IBQuery, Halcn6Db, SysUtils;

type
    BufList = array of String;

    TBufferTransaction2 = class
    private
        Buffers: BufList;
        IB_Buffers: BufList;
        First_PBKey, Last_PBKey: Integer;

        WorkTransaction: TIBTransaction;

        BufferTransaction: TIBTransaction;

        BufferQuery: TIBQuery;
        DeleteQuery: TIBQuery;
        LockQuery: TIBQuery;
        Id_Transaction: Integer;

        DBFWritten: Boolean;
        RecordAdded: Boolean;
    public
        constructor Create(In_Buffers, In_IB_Buffers: String;
            fWorkTransaction: TIBTransaction);

        procedure WriteRange(In_First_PBKey, In_Last_PBKey: Integer);
        procedure RollbackOnError;

        procedure AddRange(In_First_PBKey, In_Last_PBKey: Integer);
        procedure Write;
        procedure ClearDBF;

        procedure Clear;

        destructor Destroy; override;
    end;

implementation

uses NagScreenUnit;

procedure TBufferTransaction2.WriteRange(In_First_PBKey, In_Last_PBKey: Integer);
var
    NagScreen: TNagScreen;
begin
    NagScreen := TNagScreen.Create(nil);
    NagScreen.Show;
    NagScreen.SetStatusText('Занесення iнформацii про вiдкат...');
    try
        AddRange(In_First_PBKey, In_Last_PBKey);
    finally
        NagScreen.Free;
    end;

    Write;
    Clear;
end;

procedure TBufferTransaction2.RollbackOnError;
begin
    if DBFWritten then
        try
            ClearDBF;
        except
        end;
    if RecordAdded then
        try
            Clear;
        except
        end;
end;

procedure TBufferTransaction2.ClearDBF;
var
    buf_num: Integer;
    ID_PBKey: Integer;
begin
    for buf_num:=0 to High(Buffers) do
    begin
            // открываем нужный dbf
        BufferTable.Close;
        BufferTable.TableName := Buffers[buf_num];
        BufferTable.Open;
        for Id_PBKey:=First_PBKey to Last_PBKey do
        begin
            if BufferTable.Locate('Id_PBKey', Id_PBKey, []) then
                BufferTable.Delete;
        end;
        BufferTable.Close;
    end;
end;

procedure TBufferTransaction2.Write;
var
    buf_num: Integer;
begin
    DBFWritten := True;
    for buf_num:=0 to High(Buffers) do
        ExportRange(WorkTransaction, First_PBKey, Last_PBKey, Buffers[buf_num], IB_Buffers[buf_num]);
end;

constructor TBufferTransaction2.Create(In_Buffers, In_IB_Buffers: String;
    fWorkTransaction: TIBTransaction);
var
    p1, p2, ind: Integer;
begin
        // распихиваем строки по массивам
    ind := 0;
    while True do
    begin
        p1 := Pos(',', In_Buffers);
        p2 := Pos(',', In_IB_Buffers);
        if ( ( p1 = 0 ) and ( p2 <> 0 )  ) or ( ( p1 <> 0 ) and  (p2 = 0 ) )
            then raise Exception.Create('TBufferTransaction2.Create bug in strings!');

                // дошли по последнего буфера
        if ( p1 = 0 ) then
        begin
            SetLength(Buffers, ind+1);
            SetLength(IB_Buffers, ind+1);
            Buffers[ind] := Trim(In_Buffers);
            IB_Buffers[ind] := Trim(In_IB_Buffers);
            inc(ind);
            break;
        end
        else
        begin
            SetLength(Buffers, ind+1);
            SetLength(IB_Buffers, ind+1);
            Buffers[ind] := Trim(Copy(In_Buffers, 1, p1-1));
            IB_Buffers[ind] := Trim(Copy(In_IB_Buffers, 1, p2-1));
            In_Buffers := Copy(In_Buffers, p1+1, Length(In_Buffers));
            In_IB_Buffers := Copy(In_IB_Buffers, p2+1, Length(In_IB_Buffers));
            inc(ind);
        end;
    end;

    WorkTransaction := fWorkTransaction;
        // создаем нужные объекты
    BufferTransaction := TIBTransaction.Create(WorkTransaction.DefaultDatabase);
    BufferTransaction.DefaultDatabase := WorkTransaction.DefaultDatabase;

    LockQuery := TIBQuery.Create(WorkTransaction);
    LockQuery.Database := WorkTransaction.DefaultDatabase;
    LockQuery.Transaction := WorkTransaction;

    BufferQuery := TIBQuery.Create(BufferTransaction);
    BufferQuery.Database := BufferTransaction.DefaultDatabase;
    BufferQuery.Transaction := BufferTransaction;

    DeleteQuery := TIBQuery.Create(fWorkTransaction);
    DeleteQuery.Database := fWorkTransaction.DefaultDatabase;
    DeleteQuery.Transaction := fWorkTransaction;

      // Получаем идентификатор ДБФ-транзакции
    BufferTransaction.StartTransaction;
    try
        with BufferQuery do
        begin
            Close;
            SQL.Text := 'SELECT ID_TRANSACTION FROM GET_ID_TRANSACTION';
            Open;
            Id_Transaction := BufferQuery['Id_Transaction'];
            BufferTransaction.Commit;
        end;
    except on e: Exception do
        begin
            BufferTransaction.Rollback;
            raise e;
        end;
    end;

    RecordAdded := False;
    DBFWritten := False;
end;

destructor TBufferTransaction2.Destroy;
begin
    BufferQuery.Free;
    DeleteQuery.Free;
    LockQuery.Free;
    BufferTransaction.Free;
    inherited Destroy;
end;

procedure TBufferTransaction2.AddRange(In_First_PBKey, In_Last_PBKey: Integer);
var
    buf_num: Integer;
begin
    First_PBKey := In_First_PBKey;
    Last_PBKey := In_Last_PBKey;

    BufferTransaction.StartTransaction;
    BufferQuery.Close;
    BufferQuery.SQL.Text := 'EXECUTE PROCEDURE Buffer_Add_Range_2' +
        '(:BUFFER_NAME, :IB_BUFFER_NAME, :First_PBKey, :Last_PBKey, :ID_TRANSACTION, :Id_System)';

    try
        for buf_num:=0 to High(Buffers) do
            begin
                BufferQuery.Close;
                BufferQuery.ParamByName('First_PBKey').AsInteger := First_PBKey;
                BufferQuery.ParamByName('Last_PBKey').AsInteger := Last_PBKey;
                BufferQuery.ParamByName('Buffer_Name').AsString := Buffers[buf_num];
                BufferQuery.ParamByName('IB_Buffer_Name').AsString := IB_Buffers[buf_num];
                BufferQuery.ParamByName('Id_Transaction').AsInteger := Id_Transaction;
                BufferQuery.ParamByName('Id_System').AsInteger := Buffer_Id_System;
                BufferQuery.ExecSQL;
            end;
            BufferTransaction.Commit;

            // заблокировать записи, чтобы кто-то другой при старте их не стер
            LockQuery.SQL.Text := 'SELECT * FROM Buff_Tran WHERE Id_Transaction = '
              + IntToStr(Id_Transaction) + ' WITH LOCK';
            LockQuery.Open;
            RecordAdded := True;

        except on e: Exception do
        begin
            BufferTransaction.Rollback;
            raise e;
        end;
    end;
end;


procedure TBufferTransaction2.Clear;
begin
//    BufferTransaction.StartTransaction;
//    try
        DeleteQuery.SQL.Text := 'DELETE FROM Buff_Tran WHERE Id_Transaction = '
            + IntToStr(Id_Transaction);
        DeleteQuery.ExecSQL;
//        BufferTransaction.Commit;
//    except on e: Exception do
//        begin
//            BufferTransaction.Rollback;
//            raise e;
//        end;
//    end;
end;

end.
