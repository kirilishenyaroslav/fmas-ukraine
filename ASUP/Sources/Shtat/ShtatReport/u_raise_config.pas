unit u_raise_config;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxControls, cxContainer, cxListBox, cxDBEdit, cxStyles,
    cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
    cxDBData, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
    ExtCtrls, RxMemDS, cxDropDownEdit, StdCtrls, Buttons, FIBDataSet,
    pFIBDataSet;

type
    TRaise_config = class(TForm)
        Panel1: TPanel;
        Panel2: TPanel;
        Panel3: TPanel;
        cxG_NadbDBTableView1: TcxGridDBTableView;
        cxG_NadbLevel1: TcxGridLevel;
        cxG_Nadb: TcxGrid;
        cxLabel1: TcxLabel;
        cxLabel2: TcxLabel;
        cxG_Dopl: TcxGrid;
        cxGridDBTableView1: TcxGridDBTableView;
        cxGridLevel1: TcxGridLevel;
        RxMD_Nadb: TRxMemoryData;
        RxMD_Dopl: TRxMemoryData;
        cxStyleRepository1: TcxStyleRepository;
        cxStyle1: TcxStyle;
        cxStyle2: TcxStyle;
        cxStyle3: TcxStyle;
        cxStyle4: TcxStyle;
        cxStyle5: TcxStyle;
        cxStyle6: TcxStyle;
        cxStyle7: TcxStyle;
        cxStyle8: TcxStyle;
        cxStyle9: TcxStyle;
        cxStyle10: TcxStyle;
        cxStyle11: TcxStyle;
        cxStyle12: TcxStyle;
        cxStyle13: TcxStyle;
        cxStyle14: TcxStyle;
        cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
        DS_Nadb: TDataSource;
        DS_Dopl: TDataSource;
        cxG_Nadb_Name_Column: TcxGridDBColumn;
        cxG_Nadb_Group_Column: TcxGridDBColumn;
        cxGridDB_Name_Column: TcxGridDBColumn;
        cxGridDB_Group_Column: TcxGridDBColumn;
        cxGridDB_Id_Column: TcxGridDBColumn;
        cxG_NadbDB_Id_column: TcxGridDBColumn;
        RxMD_NadbName: TStringField;
        RxMD_Nadbid_raise: TIntegerField;
        RxMD_Doplname: TStringField;
        RxMD_Doplid_raise: TIntegerField;
        BBOk: TBitBtn;
        pFIBDS_SelectRaises: TpFIBDataSet;
        RxMD_Nadbgroup: TStringField;
        RxMD_Doplgroup: TStringField;
        procedure FormShow(Sender: TObject);
        procedure BBOkClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private

    { Private declarations }
    public
        id_sr: integer;
        procedure SaveIntoRegistry;
    { Public declarations }
    end;

var
    Raise_config: TRaise_config;
    IdGroup11, IdGroup12, IdGroup13, IdGroup14,
        IdGroup21, IdGroup22, IdGroup23: string;


const
    Raises1 = 'select * from ASUP_DT_SHTAT_RAISE_GROUP1(:id_sr)';
    Raises2 = 'select * from ASUP_DT_SHTAT_RAISE_GROUP2(:id_sr)';

implementation

uses Registry;

{$R *.dfm}

procedure TRaise_config.SaveIntoRegistry;
var
    reg: TRegistry;
    key, ownerName: string;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;

        if Owner <> nil then ownerName := Owner.Name
        else ownerName := '<unknown owner>';

        key := '\Software\ASUP\Klug Soft\' +
            ExtractFileName(Application.ExeName) + '\' + ownerName + '\' + Name;

        if reg.OpenKey(key, True) then
        begin
            RxMD_Nadb.First;
            while not RxMD_Nadb.Eof do
            begin
                reg.WriteString('raise' + IntToStr(RxMD_Nadb['id_raise']), RxMD_Nadb['group']);
                RxMD_Nadb.Next;
            end;

            RxMD_Dopl.First;
            while not RxMD_Dopl.Eof do
            begin
                reg.WriteString('raise' + IntToStr(RxMD_Dopl['id_raise']), RxMD_Dopl['group']);
                RxMD_Dopl.Next;
            end;
            reg.CloseKey;
        end;

    finally
        reg.Free;
    end;
end;


procedure TRaise_config.FormShow(Sender: TObject);
var
    reg: TRegistry;
    key, ownerName: string;

    procedure MoveData(Ds1: TDataSet; Ds2: TDataSet);
    var Val: string;
    begin
        Ds1.Open;
//    Ds2.Close;
        Ds2.Open;
        Ds2.Edit;
        Ds2.ClearFields;
        Ds1.First;
        while not Ds1.Eof do
        begin
            Ds2.Append;
            Ds2['name'] := Ds1['Raise_name'];
            Ds2['id_raise'] := Ds1['id_raise'];
            Ds2['group'] := 'Інші';
            if reg.OpenKey(key, False) then
            begin
                Val := reg.ReadString('raise' + IntToStr(Ds1['id_raise']));
                reg.CloseKey;
                if Val <> '' then Ds2['group'] := Val;
            end;
            Ds2.Post;
            Ds1.Next;
        end;
        Ds1.Close;
    end;

begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;

        if Owner <> nil then ownerName := Owner.Name
        else ownerName := '<unknown owner>';

        key := '\Software\ASUP\Klug Soft\' +
            ExtractFileName(Application.ExeName) + '\' + ownerName + '\' + Name;

        pFIBDS_SelectRaises.SelectSQL.Text := Raises1;
        pFIBDS_SelectRaises.ParamByName('id_sr').AsInteger := id_sr;
        MoveData(pFIBDS_SelectRaises, RxMD_Nadb);

        pFIBDS_SelectRaises.SelectSQL.Text := Raises2;
        pFIBDS_SelectRaises.ParamByName('id_sr').AsInteger := id_sr;
        MoveData(pFIBDS_SelectRaises, RxMD_Dopl);

    except;
    end;
    reg.Free;
end;

procedure TRaise_config.BBOkClick(Sender: TObject);
begin
    IdGroup11 := ''; IdGroup12 := ''; IdGroup13 := ''; IdGroup14 := '';
    IdGroup21 := ''; IdGroup22 := ''; IdGroup23 := '';

    RxMD_Nadb.First;
    while not RxMD_Nadb.Eof do
    begin
        if RxMD_Nadb['group'] = 'За скл., напр.' then
            IdGroup11 := IdGroup11 + IntToStr(RxMD_Nadb['id_raise']) + ', ';

        if RxMD_Nadb['group'] = 'За почесні, спорт. звання' then
            IdGroup12 := IdGroup12 + IntToStr(RxMD_Nadb['id_raise']) + ', ';

        if RxMD_Nadb['group'] = 'Інші' then
            IdGroup13 := IdGroup13 + IntToStr(RxMD_Nadb['id_raise']) + ', ';

        if RxMD_Nadb['group'] = 'За вислугу років' then
            IdGroup14 := IdGroup14 + IntToStr(RxMD_Nadb['id_raise']) + ', ';
        RxMD_Nadb.Next;
    end;

    RxMD_Dopl.First;
    while not RxMD_Dopl.Eof do
    begin
        if RxMD_Dopl['group'] = 'За вчене звання' then
            IdGroup21 := IdGroup21 + IntToStr(RxMD_Dopl['id_raise']) + ', ';

        if RxMD_Dopl['group'] = 'За наук. ступінь' then
            IdGroup22 := IdGroup22 + IntToStr(RxMD_Dopl['id_raise']) + ', ';

        if RxMD_Dopl['group'] = 'Інші' then
            IdGroup23 := IdGroup23 + IntToStr(RxMD_Dopl['id_raise']) + ', ';

        RxMD_Dopl.Next;
    end;

    if IdGroup11 = '' then IdGroup11 := 'CAST(0 AS NUMERIC(14,2)) as Nadb11, '
    else IdGroup11 := '(select sum(p.summa) from dt_shtatras_tmp_2 p' +
        ' where p.id_str=r.id_str and p.id_session_tmp=r.id_session' +
            ' and p.id_raise in (' + Copy(IdGroup11, 1, Length(IdGroup11) - 2) + ')) as Nadb11, ';

    if IdGroup12 = '' then IdGroup12 := 'CAST(0 AS NUMERIC(14,2)) as Nadb12,'
    else IdGroup12 := '(select sum(p.summa) from dt_shtatras_tmp_2 p' +
        ' where p.id_str=r.id_str and p.id_session_tmp=r.id_session' +
            ' and p.id_raise in (' + Copy(IdGroup12, 1, Length(IdGroup12) - 2) + ')) as Nadb12, ';

    if IdGroup13 = '' then IdGroup13 := 'CAST(0 AS NUMERIC(14,2)) as Nadb13, '
    else IdGroup13 := '(select sum(p.summa) from dt_shtatras_tmp_2 p' +
        ' where p.id_str=r.id_str and p.id_session_tmp=r.id_session' +
            ' and p.id_raise in (' + Copy(IdGroup13, 1, Length(IdGroup13) - 2) + ')) as Nadb13, ';

    if IdGroup14 = '' then IdGroup14 := 'CAST(0 AS NUMERIC(14,2)) as Nadb14, '
    else IdGroup14 := '(select sum(p.summa) from dt_shtatras_tmp_2 p' +
        ' where p.id_str=r.id_str and p.id_session_tmp=r.id_session' +
            ' and p.id_raise in (' + Copy(IdGroup14, 1, Length(IdGroup14) - 2) + ')) as Nadb14, ';

    if IdGroup21 = '' then IdGroup21 := 'CAST(0 AS NUMERIC(14,2)) as Dopl11, '
    else IdGroup21 := '(select sum(p.summa) from dt_shtatras_tmp_2 p' +
        ' where p.id_str=r.id_str and p.id_session_tmp=r.id_session' +
            ' and p.id_raise in (' + Copy(IdGroup21, 1, Length(IdGroup21) - 2) + ')) as Dopl11, ';

    if IdGroup22 = '' then IdGroup22 := 'CAST(0 AS NUMERIC(14,2)) as Dopl12, '
    else IdGroup22 := '(select sum(p.summa) from dt_shtatras_tmp_2 p' +
        ' where p.id_str=r.id_str and p.id_session_tmp=r.id_session' +
            ' and p.id_raise in (' + Copy(IdGroup22, 1, Length(IdGroup22) - 2) + ')) as Dopl12, ';

    if IdGroup23 = '' then IdGroup23 := 'CAST(0 AS NUMERIC(14,2)) as Dopl13 '
    else IdGroup23 := '(select sum(p.summa) from dt_shtatras_tmp_2 p' +
        ' where p.id_str=r.id_str and p.id_session_tmp=r.id_session' +
            ' and p.id_raise in (' + Copy(IdGroup23, 1, Length(IdGroup23) - 2) + ')) as Dopl13 ';

    ModalResult := mrOk;
end;

procedure TRaise_config.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    SaveIntoRegistry;
end;

end.

