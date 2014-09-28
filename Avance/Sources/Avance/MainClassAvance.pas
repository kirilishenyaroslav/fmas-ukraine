unit MainClassAvance;

interface

uses Classes, pFIBDatabase, pFIBStoredProc, pFIBDataSet;

Type
  TMainClassAvance = class(TComponent)
    Class_Database:        TpFIBDatabase;
    Class_Transaction_R:   TpFIBTransaction;
    Class_Transaction_Wr:  TpFIBTransaction;
    Class_StoredProc:      TpFIBStoredProc;
    Class_DataSet:         TpFIBDataSet;
  private
    Owner : TComponent;
  public
    id_user : int64;
    constructor Create(AOwner: TComponent; id: int64; DB: TpFIBDatabase); reintroduce; overload;
    destructor Destroy; override;
    function ShowForm(SpEdit : Boolean):VAriant;
    function ShowSpEditForm : VAriant;

//    procedure AddAo(id_ao : Int64; summa : double; number : string; debet : smallInt; date : string; note : string; id_man, id_doc, id_j4_sp_jo : int64);
//    function AddRasp(id_raz : Variant; summa : double; number : string; debet : word; date : string; note : string; id_man, id_doc, id_j4_sp_jo : int64):int64;
//    function AddProv(id_raz : Variant; summa : double; number : string; debet : word; date : string; note : string; id_man, id_doc, id_j4_sp_jo : int64):int64;

    procedure DeleteAo(id : int64);
    function ChangeAo(id_ao : int64; id_raz: Variant; summa: double; number: string; debet: word; date, note: string; id_man,
                      id_doc, id_j4_sp_jo: int64): int64;

    procedure CopyVetka(All : string; id_copy, move_linkto : int64; LEVEL : INTEGER);
    procedure MoveVetka(All : string; id, moveto_linkto : int64; LEVEL : INTEGER);
    procedure MoveTovar(All_kod : string; id_tovar, linkto : int64);
  end;


function AvanceShow(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Integer;stdcall;

function EditSpAutoKod(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Integer;stdcall;
function SpEditSpAutoKod(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Variant;stdcall;

exports AvanceShow, EditSpAutoKod, SpEditSpAutoKod;

implementation

uses mainAvanceOtchet, Dialogs, SysUtils, Forms, Variants;

function AvanceShow(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Integer;
{var
T: TfmAvanceOtchet;
begin
    Result := -1;
    T:=TfmAvanceOtchet.create(Aowner, nil,  DBHandle, Show);
    T.FormStyle := fsMDIChild;
    T.Show;
end;
}
var
    T : TMainClassAvance;
begin
    T := TMainClassAvance.Create(AOwner, id_user, DBHandle);
    T.ShowForm(false);
    Result := -1;
end;


function EditSpAutoKod(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Integer;
var
    T : TMainClassAvance;
begin
    T := TMainClassAvance.Create(AOwner, id_user, DBHandle);
    T.ShowForm(true);
    T.Free;
    Result := -1;
end;

function SpEditSpAutoKod(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Variant;
var
    T : TMainClassAvance;
begin
    T := TMainClassAvance.Create(AOwner, id_user, DBHandle);
    Result := T.ShowSpEditForm;
    T.Free;
end;

function TMainClassAvance.ShowSpEditForm : VAriant;
{var
    T : TfmAvanceOtchet;}
begin
      {  T := TfmAvanceOtchet.Create(Owner, Self, Class_Database.Handle, Class_Transaction_R.Handle, Class_Transaction_Wr.Handle, SpEdit);
       // T.is_modal := true;
        T.ShowModal;
        ShowSpEditForm := T.ResValue;
        T.Free;}
end;

procedure TMainClassAvance.CopyVetka(All : string; id_copy, move_linkto: int64; LEVEL : INTEGER);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='SP_AUTOKOD_COPY_VETKA';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_ID').AsInt64        := id_copy;
    Class_StoredProc.ParamByName('D_ALL_KOD').AsString  := All;
    Class_StoredProc.ParamByName('D_MOVETO_ID').AsInt64 := move_linkto;
    Class_StoredProc.ParamByName('D_LEVEL').AsIntEGER    := LEVEL;
    try
        Class_StoredProc.ExecProc;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
end;

constructor TMainClassAvance.Create(AOwner: TComponent; id: int64; DB: TpFIBDatabase);
begin
    inherited Create(AOwner);
    Owner := AOwner;

    Class_Database:=DB;
    Class_Transaction_R                  := TpFIBTransaction.Create(Aowner);
    Class_Transaction_Wr                 := TpFIBTransaction.Create(Aowner);
    Class_StoredProc                     := TpFIBStoredProc.Create(Aowner);
    Class_DataSet                        := TpFIBDataSet.Create(Aowner);

    Class_Transaction_R.DefaultDatabase  := Class_Database;
    Class_Transaction_Wr.DefaultDatabase := Class_Database;
    Class_Database.DefaultTransaction    := Class_Transaction_R;
    Class_StoredProc.Database            := Class_Database;
    Class_DataSet.Database               := Class_Database;

    id_user := id;
end;

procedure TMainClassAvance.DeleteAo(id: int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='J4_DT_AO_DELETE';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_ID_AO').AsInt64:=ID;
    try
        Class_StoredProc.ExecProc;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
end;

destructor TMainClassAvance.Destroy;
begin
    inherited;
end;

procedure TMainClassAvance.MoveVetka(All : string; id, moveto_linkto: int64; LEVEL : INTEGER);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName := 'SP_AUTOKOD_MOVETO_VETKA';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_ID').AsInt64            := id;
    Class_StoredProc.ParamByName('D_LINKTO_MOVETO').AsInt64 := moveto_linkto;
    Class_StoredProc.ParamByName('D_LEVEL').AsInt64         := LEVEL;
    Class_StoredProc.ParamByName('D_ALL_KOD').AsString       := All;
    try
        Class_StoredProc.ExecProc;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end
    end;

end;

function TMainClassAvance.ShowForm(SpEdit : Boolean): Variant;
var
    T : TfmAvanceOtchet;
begin
    if SpEdit=true then
    begin
{        T := TfmAvanceOtchet.Create(Owner, Self, Class_Database.Handle, Class_Transaction_R.Handle, Class_Transaction_Wr.Handle, Edit);
        T.FormStyle := fsMDIChild;
        T.Show;
    }end
    else
    begin
        T := TfmAvanceOtchet.Create(Owner, Self, Class_Database, Show);
        T.FormStyle := fsMDIChild;
        T.show;
     //   ShowForm:=T.ResValue;
    end;
end;

procedure TMainClassAvance.MoveTovar(All_kod: string; id_tovar, linkto: int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName := 'SP_AUTO_KOD_MOVETO_TOVAR';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_ID').AsInt64            := id_tovar;
    Class_StoredProc.ParamByName('D_LINKTO').AsInt64        := linkto;
    Class_StoredProc.ParamByName('D_ALL_KOD').AsString      := All_kod;
    try
        Class_StoredProc.ExecProc;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end
    end;
end;

function TMainClassAvance.ChangeAo(id_ao : int64; id_raz: Variant; summa: double; number: string; debet: word; date, note: string; id_man,
  id_doc, id_j4_sp_jo: int64): int64;
var
    i : integer;
    deb : string;
begin
    if debet = 0 then deb := 'Дебет' else deb := 'Кредіт';
    Class_DataSet.Database    := Class_Database;
    Class_DataSet.Transaction := Class_Transaction_Wr;
    Class_DataSet.Transaction.StartTransaction;
    Class_StoredProc.Database := Class_Database;
    Class_StoredProc.Transaction := Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_DataSet.Close;
    try
        DecimalSeparator := '.';
        Class_DataSet.SQLs.SelectSQL.Text:='select ID_AO from J4_DT_AO_CHANGE(''' + deb + ''', '''+ note + ''', ' +floatToStr(summa) + ', ''' + date + ''', ''' + number + ''', '+IntToStr(id_man)+', '+IntToStr(id_doc)+', '+IntToStr(id_j4_sp_jo)+', '+IntToStr(id_ao)+')';
        Class_DataSet.Open;
        Result := Class_DataSet.FieldByName('ID_AO').AsVariant;
        Class_DataSet.Close;
//        Class_StoredProc.StoredProcName:='PUB_SP_GOST_PROP_DELETE';
//        Class_StoredProc.Prepare;
//        Class_StoredProc.ParamByName('D_ID_PUB').AsInt64:=Result;
        for i:=0 to VarArrayHighBound(id_raz,1)-1 do
        begin
            Class_StoredProc.StoredProcName:='J4_DT_AO_RASPREDELENIE_CHANGE';
            Class_StoredProc.Prepare;
            Class_StoredProc.ParamByName('D_OLD_ID').AsInt64  := id_ao;
            Class_StoredProc.ParamByName('D_N_PP').AsInteger  := id_RAZ[i][2];
            Class_StoredProc.ParamByName('D_SUMMA').AsDouble  := id_RAZ[i][1];
            Class_StoredProc.ParamByName('D_ID_RASP').AsInt64 := id_RAZ[i][0];
            Class_StoredProc.ParamByName('D_ID_AO').AsInt64   := Result;
            Class_StoredProc.ExecProc;
        end;
        except on E:Exception do begin
            Class_Transaction_Wr.Rollback;
            ShowMessage(E.Message);
            Result := 0;
            exit;
        end end;
    DecimalSeparator := ',';
    Class_Transaction_Wr.Commit;
end;


end.
