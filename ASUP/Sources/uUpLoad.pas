unit uUpLoad;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Halcn6db, DB, cxShellDlgs, cxShellBrowserDialog, uFControl,
    uLabeledFControl, uSpravControl, uBoolControl, StdCtrls,
    cxLookAndFeelPainters, cxButtons, PersonalCommon, FIBDataSet, pFIBDataSet;

type
    TTables = record
        SelectName: string;
        TableName: string;
        FieldsName: TStringList;
    end;

type
    TUpLoadForm = class(TForm)
        qFSC_Path: TqFSpravControl;
        cxSBD_Path: TcxShellBrowserDialog;
        HDS_NewTable: THalcyonDataSet;
        CHDS_NewTable: TCreateHalcyonDataSet;
        GroupBox1: TGroupBox;
        qFBC_EducOrg: TqFBoolControl;
        qFBC_Dep: TqFBoolControl;
        qFBC_AReg: TqFBoolControl;
        qFBC_ZReg: TqFBoolControl;
        qFBC_SReg: TqFBoolControl;
        qFBC_TPlace: TqFBoolControl;
        qFBC_TStreet: TqFBoolControl;
        qFBC_Place: TqFBoolControl;
        qFBC_Street: TqFBoolControl;
        qFBC_Post: TqFBoolControl;
        GroupBox2: TGroupBox;
        qFBC_Man: TqFBoolControl;
        qFBC_ManPost: TqFBoolControl;
        qFBC_Adress: TqFBoolControl;
        cxB_Ok: TcxButton;
        cxB_Cancel: TcxButton;
        qFBC_TypeP: TqFBoolControl;
        qFBC_Nat: TqFBoolControl;
        qFBC_inval: TqFBoolControl;
        qFBC_fstat: TqFBoolControl;
        qFBC_Pens: TqFBoolControl;
        qFBC_Children: TqFBoolControl;
        procedure cxB_OkClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure qFSC_PathOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure cxB_CancelClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
    private
    { Private declarations }
    public
        EOrg, Dep, AReg, SReg, ZReg, TPl, TSt, Pl, St, Post, TPost, Man, ManP, Adr, Nat, Mar, Inv, Pens, Child: TTables;
    { Public declarations }
    end;

var
    UpLoadForm: TUpLoadForm;

implementation

uses Buffer, qFTools;

{$R *.dfm}

procedure TUpLoadForm.FormCreate(Sender: TObject);
begin
    EOrg.SelectName := 'ASUP_UPLOAD_EORG';
    EOrg.TableName := 'EORG';
    EOrg.FieldsName := TStringList.Create;
    EOrg.FieldsName.Add('id_org;N;10;0');
    EOrg.FieldsName.Add('name;C;255;0');

    Dep.SelectName := 'ASUP_UPLOAD_DEP';
    Dep.TableName := 'DEP';
    Dep.FieldsName := TStringList.Create;
    Dep.FieldsName.Add('id_dep;N;10;0');
    Dep.FieldsName.Add('id_par;N;10;0');
    Dep.FieldsName.Add('name;C;255;0');

    AReg.SelectName := 'ASUP_UPLOAD_REG(199)';
    AReg.TableName := 'AReg';
    AReg.FieldsName := TStringList.Create;
    AReg.FieldsName.Add('id_reg;N;10;0');
    AReg.FieldsName.Add('name;C;255;0');

    SReg.SelectName := 'ASUP_UPLOAD_REG(799)';
    SReg.TableName := 'SReg';
    SReg.FieldsName := TStringList.Create;
    SReg.FieldsName.Add('id_reg;N;10;0');
    SReg.FieldsName.Add('name;C;255;0');

    ZReg.SelectName := 'ASUP_UPLOAD_REG(699)';
    ZReg.TableName := 'ZReg';
    ZReg.FieldsName := TStringList.Create;
    ZReg.FieldsName.Add('id_reg;N;10;0');
    ZReg.FieldsName.Add('name;C;255;0');

    TPl.SelectName := 'ASUP_UPLOAD_PlaceT';
    TPl.TableName := 'PlaceT';
    TPl.FieldsName := TStringList.Create;
    TPl.FieldsName.Add('id_tpl;N;10;0');
    TPl.FieldsName.Add('name;C;255;0');

    TSt.SelectName := 'ASUP_UPLOAD_StreetT';
    TSt.TableName := 'StrT';
    TSt.FieldsName := TStringList.Create;
    TSt.FieldsName.Add('id_tstr;N;10;0');
    TSt.FieldsName.Add('name;C;255;0');

    Pl.SelectName := 'ASUP_UPLOAD_Place';
    Pl.TableName := 'Place';
    Pl.FieldsName := TStringList.Create;
    Pl.FieldsName.Add('id_place;N;10;0');
    Pl.FieldsName.Add('name;C;255;0');

    St.SelectName := 'ASUP_UPLOAD_Street';
    St.TableName := 'Street';
    St.FieldsName := TStringList.Create;
    St.FieldsName.Add('id_str;N;10;0');
    St.FieldsName.Add('name;C;255;0');

    Post.SelectName := 'ASUP_UPLOAD_Post';
    Post.TableName := 'Post';
    Post.FieldsName := TStringList.Create;
    Post.FieldsName.Add('id_post;N;10;0');
    Post.FieldsName.Add('name;C;255;0');
    Post.FieldsName.Add('sname;C;255;0');

    TPost.SelectName := 'ASUP_UPLOAD_TYPE_POST';
    TPost.TableName := 'TPost';
    TPost.FieldsName := TStringList.Create;
    TPost.FieldsName.Add('id_typep;N;10;0');
    TPost.FieldsName.Add('name;C;255;0');

    Man.SelectName := 'ASUP_UPLOAD_PEOPLE';
    Man.TableName := 'people';
    Man.FieldsName := TStringList.Create;
    Man.FieldsName.Add('id_man;N;10;0');
    Man.FieldsName.Add('stat;L;0;0');
    Man.FieldsName.Add('id_typep;N;10;0');
    Man.FieldsName.Add('FIO_RUS;C;255;0');
    Man.FieldsName.Add('FIO_UKR;C;255;0');
    Man.FieldsName.Add('TIN;C;10;0');
    Man.FieldsName.Add('id_sex;N;1;0');
    Man.FieldsName.Add('DBIRTH;D;0;0');
    Man.FieldsName.Add('ID_REG1;N;10;0');
    Man.FieldsName.Add('ID_REG2;N;10;0');
    Man.FieldsName.Add('ID_REG3;N;10;0');
    Man.FieldsName.Add('ID_ADR;N;10;0');
    Man.FieldsName.Add('ID_nat;N;10;0');
    Man.FieldsName.Add('ID_fstat;N;10;0');
    Man.FieldsName.Add('ID_inv;N;10;0');
    Man.FieldsName.Add('ID_pens;N;10;0');
    Man.FieldsName.Add('dbeg;D;0;0');
    Man.FieldsName.Add('ddism;D;0;0');

    ManP.SelectName := 'ASUP_UPLOAD_MAN_POST';
    ManP.TableName := 'Man_post';
    ManP.FieldsName := TStringList.Create;
    ManP.FieldsName.Add('id_man;N;10;0');
    ManP.FieldsName.Add('id_post;N;10;0');
    ManP.FieldsName.Add('is_main;L;0;0');
    ManP.FieldsName.Add('id_dep;N;10;0');
    ManP.FieldsName.Add('kol_st;N;9;4');
    ManP.FieldsName.Add('kol_h;N;9;4');

    Adr.SelectName := 'ASUP_UPLOAD_MAN_ADR';
    Adr.TableName := 'Man_Adr';
    Adr.FieldsName := TStringList.Create;
    Adr.FieldsName.Add('id_adr;N;10;0');
    Adr.FieldsName.Add('ID_PLACE;N;10;0');
    Adr.FieldsName.Add('ID_TPL;N;10;0');
    Adr.FieldsName.Add('ID_STR;N;10;0');
    Adr.FieldsName.Add('ID_TSTR;N;10;0');
    Adr.FieldsName.Add('HOUSE;C;10;0');
    Adr.FieldsName.Add('KORPUS;C;10;0');
    Adr.FieldsName.Add('FLAT;C;10;0');
    Adr.FieldsName.Add('TELH;C;255;0');
    Adr.FieldsName.Add('TELW;C;255;0');
    Adr.FieldsName.Add('ZIP;C;10;0');
    Adr.FieldsName.Add('REGION;C;255;0');
    Adr.FieldsName.Add('DISTR;C;255;0');

    Mar.SelectName := 'ASUP_UPLOAD_MAR_STAT';
    Mar.TableName := 'Mar_stat';
    Mar.FieldsName := TStringList.Create;
    Mar.FieldsName.Add('id_fstat;N;10;0');
    Mar.FieldsName.Add('name_fst;C;255;0');

    Nat.SelectName := 'ASUP_UPLOAD_NATIONALITY';
    Nat.TableName := 'National';
    Nat.FieldsName := TStringList.Create;
    Nat.FieldsName.Add('id_nat;N;10;0');
    Nat.FieldsName.Add('name_nat;C;255;0');

    Inv.SelectName := 'ASUP_UPLOAD_INVAL';
    Inv.TableName := 'Inval';
    Inv.FieldsName := TStringList.Create;
    Inv.FieldsName.Add('id_inv;N;10;0');
    Inv.FieldsName.Add('name_inv;C;255;0');

    Pens.SelectName := 'ASUP_UPLOAD_PENSION';
    Pens.TableName := 'PensVid';
    Pens.FieldsName := TStringList.Create;
    Pens.FieldsName.Add('id_pens;N;10;0');
    Pens.FieldsName.Add('name;C;255;0');

    Child.SelectName := 'ASUP_UPLOAD_CHILDREN';
    Child.TableName := 'Children';
    Child.FieldsName := TStringList.Create;
    Child.FieldsName.Add('ID_MAN;N;10;0');
    Child.FieldsName.Add('ID_SEX;N;10;0');
    Child.FieldsName.Add('FIO;C;255;0');
    Child.FieldsName.Add('DBIRTH;D;0;0');
end;

procedure TUpLoadForm.cxB_OkClick(Sender: TObject);
var
    First_PBKey, Last_PBKey, i: Integer;
    sql, Path: string;
    eval_bool, AllRight: Boolean;
    DontUseIndex, DontConvert, UseASCII: Boolean;

    procedure UpLoad(What: TTables);
    begin
        HDS_NewTable.Close;
        HDS_NewTable.TableName := What.TableName;
        CHDS_NewTable.CreateFields.Clear;
        CHDS_NewTable.CreateFields := What.FieldsName;
        if (CHDS_NewTable.Execute) then
        try
            HDS_NewTable.Close;
            Buffer.BufferTable.Close;
            Buffer.BufferTable.TableName := What.TableName;
            Buffer.BufferTable.Exclusive := True;
            Buffer.BufferTable.Open;
            Buffer.BufferTable.Zap;
            Buffer.BufferTable.Exclusive := False;
    //BufferTable.IndexFiles.Clear;
    //BufferTable.IndexFileInclude('zmoving.cdx');

// запись в dbf
            sql := 'select * from ' + What.SelectName;
            Buffer.MassWriteToDbf(What.TableName, What.SelectName, sql);

        except on e: Exception do
            begin
                ShowError(e);
                ModalResult := 0;
                Buffer.BufferTable.Close;
                DontWriteToDbf := eval_bool;
                Exit;
            end
        end
        else ShowMessage('Не вдалося створити ' + What.TableName);
        Buffer.BufferTable.Close;
    end;

begin
    if qFSC_Path.DisplayText <> '' then
    begin
        HDS_NewTable.DatabaseName := qFSC_Path.DisplayText;
     //Создаем таблицы
        DontUseIndex := Buffer.DontUseIndex;
        DontConvert := Buffer.DontConvert;
        UseASCII := Buffer.UseASCII;

        Buffer.DontUseIndex := True;
        Buffer.DontConvert := True;
        Buffer.UseASCII := False;
        Buffer.BufferTable.TranslateASCII := False;

        eval_bool := DontWriteToDbf;
        DontWriteToDbf := False;
        Path := Buffer.BufferTable.DatabaseName;
        Buffer.BufferTable.DatabaseName := qFSC_Path.DisplayText;

        if qFBC_EducOrg.Value then UpLoad(EOrg);

        if qFBC_Dep.Value then UpLoad(Dep);

        if qFBC_AReg.Value then UpLoad(AReg);

        if qFBC_ZReg.Value then UpLoad(ZReg);

        if qFBC_SReg.Value then UpLoad(SReg);

        if qFBC_TPlace.Value then UpLoad(TPl);

        if qFBC_TStreet.Value then UpLoad(TSt);

        if qFBC_Place.Value then UpLoad(Pl);

        if qFBC_Street.Value then UpLoad(St);

        if qFBC_TypeP.Value then UpLoad(TPost);

        if qFBC_Nat.Value then UpLoad(Nat);

        if qFBC_fstat.Value then UpLoad(Mar);

        if qFBC_inval.Value then UpLoad(Inv);

        if qFBC_Pens.Value then UpLoad(Pens);

        if qFBC_Post.Value then UpLoad(Post);

        if qFBC_Man.Value then UpLoad(Man);

        if qFBC_ManPost.Value then UpLoad(ManP);

        if qFBC_Adress.Value then UpLoad(Adr);

        if qFBC_Children.Value then UpLoad(Child);

        Buffer.BufferTable.DatabaseName := Path;
        DontWriteToDbf := eval_bool;
        Buffer.DontUseIndex := DontUseIndex;
        Buffer.DontConvert := DontConvert;
        Buffer.UseASCII := UseASCII;
        Buffer.BufferTable.TranslateASCII := UseASCII;
        ShowMessage('Вигрузка завершена!');
    end
    else
    begin
        Exit;
    end;
end;

procedure TUpLoadForm.qFSC_PathOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    if cxSBD_Path.Execute then
        DisplayText := cxSBD_Path.Path;
end;

procedure TUpLoadForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    qFAutoSaveIntoRegistry(Self, nil);
end;

procedure TUpLoadForm.cxB_CancelClick(Sender: TObject);
begin
    Close;
end;

procedure TUpLoadForm.FormShow(Sender: TObject);
begin
    qFAutoLoadFromRegistry(Self, nil);

    if not (VarIsNull(qFSC_Path.DisplayText) or (qFSC_Path.DisplayText = ''))
        then cxSBD_Path.Path := qFSC_Path.DisplayText;
end;

end.
