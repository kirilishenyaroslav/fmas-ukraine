unit uo_kontingent_1_potok_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ActnList, uo_kontingent_1_potok, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet;

type
  Tfmuo_kontingent_1_potok_add = class(TForm)
    cxButtonEdit1: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxButtonEdit2: TcxButtonEdit;
    cxLabel3: TcxLabel;
    cxButtonEdit3: TcxButtonEdit;
    cxTextEdit1: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ActionList1: TActionList;
    Action1: TAction;
    DB: TpFIBDatabase;
    Tr: TpFIBTransaction;
    TWr: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    Stored: TpFIBStoredProc;
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton2Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    myform : Tfmuo_kontingent_1_potok;
    reg    : smallint;
    id_zakaz, ID_SP_SPEC, id_group : int64;
  public
    constructor Create(aOwner: TComponent; mform : Tfmuo_kontingent_1_potok; r : smallint); reintroduce; overload;
  end;


implementation
uses uPrK_Loader,
     uPrK_Resources,
     cn_Common_Loader,
     cn_Common_Types,
     uCommonSp;
{$R *.dfm}

{ Tfmuo_kontingent_1_potok_add }

constructor Tfmuo_kontingent_1_potok_add.Create(aOwner: TComponent;
  mform: Tfmuo_kontingent_1_potok; r: smallint);
begin
    inherited Create(aOwner);
    reg    := r;
    myform := mform;

    DB                      := myform.db;
    Tr.DefaultDatabase      := DB;
    TWr.DefaultDatabase     := DB;
    DB.DefaultTransaction   := Tr;

    Tr.StartTransaction;

    if r = 1 then
    begin
        ID_SP_SPEC          := myform.id_spec;
        cxButtonEdit1.Text  := myform.name_spec;
    end;
    if r = 2 then
    begin
        id_zakaz            := StrToInt64(myform.DS.fbn('ID_SP_DERG_ZAKAZ').AsString);
        ID_SP_SPEC          := StrToInt64(myform.DS.fbn('ID_SP_SPEC').AsString);
        id_group            := StrToInt64(myform.DS.fbn('ID_SP_DEPARTMENT_GR').AsString);
        cxButtonEdit1.Text  := myform.DS.fbn('FULL_NAME_SPEC').AsString;
        cxButtonEdit2.Text  := myform.DS.fbn('NAME_GROUP').AsString;
        cxButtonEdit3.Text  := myform.DS.fbn('NAME_ZAKAZ').AsString;
        cxTextEdit1.Text    := myform.DS.fbn('KOLVO').AsString;
    end;
    id_group := 100;
end;

procedure Tfmuo_kontingent_1_potok_add.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then
        Key := Chr(0)
end;

procedure Tfmuo_kontingent_1_potok_add.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    AParameter : TcnSimpleParams;
    Res : variant;
begin
    AParameter                := TcnSimpleParams.Create;
    AParameter.Owner          := self;
    AParameter.Db_Handle      := DB.Handle;
    AParameter.Formstyle      := fsNormal;
    AParameter.WaitPakageOwner:= self;

    AParameter.DontShowGroups := True;
    Res := RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FacultySpecGroup.bpl', 'ShowSPFacSpecGroup');
    AParameter.Free;
    if VarArrayDimCount(res) > 0 then
    begin
        if ((Res[0]<>Null) and (Res[1]<>Null))  then
        begin
            ID_SP_SPEC          := Res[1];   // id_spec;
            cxButtonEdit1.Text  := VarToStr(Res[3])+'/'+VarToStr(Res[4]);
        end;
    end;
end;

procedure Tfmuo_kontingent_1_potok_add.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    sp : TSprav;
begin
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle']     := Integer(DB.Handle);
            FieldValues['ShowStyle']    := 0;
            FieldValues['Select']       := 1;
            FieldValues['Actual_Date']  := date;
            FieldValues['Id_Property']  := 77;

            Post;
        end;
        sp.Show;
//        if sp.Output['CorrFilter']=1 then
        sp.Free;

    end;
end;

procedure Tfmuo_kontingent_1_potok_add.cxButtonEdit3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self, DB.Handle, PrK_SP_DERG_ZAKAZ, fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
        id_zakaz           := res[0];
        cxButtonEdit3.Text := VarToStr(res[1]) + '(' + VarToStr(res[2]) + ')';

    end
end;

procedure Tfmuo_kontingent_1_potok_add.cxButton2Click(Sender: TObject);
begin
    Close;
end;

procedure Tfmuo_kontingent_1_potok_add.cxButton1Click(Sender: TObject);
begin
    Action1Execute(Sender);
end;

procedure Tfmuo_kontingent_1_potok_add.Action1Execute(Sender: TObject);
var
    id, id_god, id_fak, id_form, id_kat, id_kurs, id_potok : int64;
begin
    if ID_SP_SPEC <= 0 then
    begin
        showmessage('Виберіть спеціальність!');
        cxButtonEdit1.SetFocus;
        exit;
    end;
    if id_group <= 0 then
    begin
        showmessage('Виберіть групу!');
        cxButtonEdit2.SetFocus;
        exit;
    end;
    if id_zakaz <= 0 then
    begin
        showmessage('Виберіть Бюджет/договір!');
        cxButtonEdit3.SetFocus;
        exit;
    end;
    if cxTextEdit1.Text = '' then
    begin
        showmessage('Ведіть кількість!');
        cxTextEdit1.SetFocus;
        exit;
    end;

    id := -1;

    if reg = 1 then
    begin
        DataSet.Database    := DB;
        DataSet.Transaction := TWr;
        TWr.StartTransaction;

        try
            id_god   := myform.id_god;
            id_fak   := myform.id_fak;
            id_form  := myform.id_form;
            id_kat   := myform.id_kat;
            id_kurs  := myform.id_kurs;
            id_potok := myform.id_potok;
            DataSet.Close;
            DataSet.SQLs.SelectSQL.Text := 'select * from UO_DT_KONTINGENT_I('+InttoStr(id_god)+', '+InttoStr(id_fak)+', '+InttoStr(id_form)+', '+InttoStr(id_kat)+', '+InttoStr(id_kurs)+', '+IntToStr(id_potok)+', '+InttoStr(ID_SP_Spec)+', '+IntToStr(id_group)+', '+IntToStr(id_zakaz)+', '''+cxTextEdit1.Text+''')';
            DataSet.Open;
            if StrToInt64(DataSet.fbn('ID_DT_KONTINGENT').AsString) <= 0 then
            begin
                TWr.Rollback;
                showmessage('Помилка! Данні не збережені!');
                exit;
            end;
            id := StrToint64(DataSet.fbn('ID_DT_KONTINGENT').AsString);
            DataSet.Close;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
            exit;
        end;
        end;

    end;
    if reg = 2 then
    begin
        Stored.Database    := DB;
        Stored.Transaction := TWr;
        TWr.StartTransaction;

        try
            id_god   := StrToInt64(myform.ds.fbn('ID_SP_GOD_NABORA').AsString);
            id_fak   := StrToInt64(myform.ds.fbn('ID_SP_DEPARTMENT_FAK').AsString);
            id_form  := StrToInt64(myform.ds.fbn('ID_SP_FORM_STUD').AsString);
            id_kat   := StrToInt64(myform.ds.fbn('ID_SP_KAT_STUD').AsString);
            id_kurs  := StrToInt64(myform.ds.fbn('ID_SP_KURS').AsString);
            id_potok := myform.id_potok;
            id       := StrToInt64(myform.ds.fbn('ID_DT_KONTINGENT').AsString);
            Stored.StoredProcName := 'UO_DT_KONTINGENT_U';
            Stored.ParamByName('ID_DT_KONTINGENT').AsInt64         := id;
            Stored.ParamByName('ID_SP_GOD_NABORA').AsInt64         := id_god;
            Stored.ParamByName('ID_SP_DEPARTMENT_FAK').AsInt64     := id_fak;
            Stored.ParamByName('ID_SP_FORM_STUD').AsInt64          := id_form;
            Stored.ParamByName('ID_SP_KAT_STUD').AsInt64           := id_kat;
            Stored.ParamByName('ID_SP_KURS').AsInt64               := id_kurs;
            Stored.ParamByName('ID_SP_POTOK').AsInt64              := id_potok;
            Stored.ParamByName('ID_SP_SPEC').AsInt64               := ID_SP_SPEC;
            Stored.ParamByName('ID_SP_DEPARTMENT_GR').AsInt64      := id_group;
            Stored.ParamByName('ID_SP_DERG_ZAKAZ').AsInt64         := id_zakaz;
            Stored.ParamByName('D_ID_SPECIALIZATION').AsInteger    := StrToInt(cxTextEdit1.Text);
            Stored.ExecProc;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
        end end;
    end;

    myform.ActionRefreshExecute(nil);
    myform.DS.Locate('ID_DT_KONTINGENT', id, []);
    close;
end;

end.
