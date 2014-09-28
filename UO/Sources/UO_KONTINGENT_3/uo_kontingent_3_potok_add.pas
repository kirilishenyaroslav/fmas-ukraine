unit uo_kontingent_3_potok_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ActnList, uo_kontingent_3_potok, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet;

type
  Tfmuo_kontingent_3_potok_add = class(TForm)
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
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton2Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    myform : Tfmuo_kontingent_3_potok;
    reg    : smallint;
    id_zakaz, ID_SP_SPEC, id_group, id_spesial, id_kaf : int64;
  public
    constructor Create(aOwner: TComponent; mform : Tfmuo_kontingent_3_potok; r : smallint); reintroduce; overload;
  end;

implementation
uses uPrK_Loader,
     uPrK_Resources,
     cn_Common_Loader,
     cn_Common_Types,
     AArray,
     uUO_Loader,
     uCommonSp;
{$R *.dfm}

{ Tfmuo_kontingent_3_potok_add }

constructor Tfmuo_kontingent_3_potok_add.Create(aOwner: TComponent;
  mform: Tfmuo_kontingent_3_potok; r: smallint);
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
//        cxButtonEdit1.Text  := myform.name_spec;
    end;
    if r = 2 then
    begin
        id_zakaz            := StrToInt64(myform.DS.fbn('ID_SP_DERG_ZAKAZ').AsString);
        id_spesial          := StrToInt64(myform.DS.fbn('ID_SP_SPECIALIZATION').AsString);
        id_kaf              := StrToInt64(myform.DS.fbn('ID_SP_KAF').AsString);
        ID_SP_SPEC          := myform.id_spec;
//         id_group            := StrToInt64(myform.DS.fbn('ID_SP_DEPARTMENT_GR').AsString);
        cxButtonEdit1.Text  := myform.DS.fbn('NAME_SL').AsString;
        cxButtonEdit2.Text  := myform.DS.fbn('NAME_KAF').AsString;
        cxButtonEdit3.Text  := myform.DS.fbn('NAME_ZAKAZ').AsString;
        cxTextEdit1.Text    := myform.DS.fbn('KOLVO').AsString;
    end;
//    id_group := 100;
end;

procedure Tfmuo_kontingent_3_potok_add.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then
        Key := Chr(0)
end;

procedure Tfmuo_kontingent_3_potok_add.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UO_SP_SPECIALIZATION.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(DB.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant      := fsNormal;
//    InputParam['Input']['ID_USER'].AsInt64          := ID_USER_GLOBAL;
    uUO_Loader.ShowAllUOBpl(self, InputParam);

    id_spesial         := InputParam['output']['ID_SP_SPECIALIZATION'].AsInt64;
    cxButtonEdit1.Text := InputParam['output']['NAME'].AsString;
    // viewArray(Self.Inputparam);
end;

procedure Tfmuo_kontingent_3_potok_add.cxButtonEdit3PropertiesButtonClick(
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

procedure Tfmuo_kontingent_3_potok_add.cxButton2Click(Sender: TObject);
begin
    Close;
end;

procedure Tfmuo_kontingent_3_potok_add.cxButton1Click(Sender: TObject);
begin
    Action1Execute(Sender);
end;

procedure Tfmuo_kontingent_3_potok_add.Action1Execute(Sender: TObject);
var
    id, id_god, id_fak, id_form, id_kat, id_kurs : int64;
begin
    if id_spesial <= 0 then
    begin
        showmessage('Виберіть спеціалізацію!');
        cxButtonEdit1.SetFocus;
        exit;
    end;
    if id_kaf <= 0 then
    begin
        showmessage('Виберіть кафедру!');
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
        showmessage('Введіть кількість!');
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
            DataSet.Close;
            DataSet.SQLs.SelectSQL.Text := 'select * from UO_DT_KONTINGENT_3_INSERT('+InttoStr(id_god)+', '+InttoStr(id_fak)+', '+InttoStr(id_form)+', '+InttoStr(id_kat)+', '+InttoStr(id_kurs)+', '+InttoStr(ID_SP_Spec)+', '+IntToStr(id_spesial)+', '+IntToStr(id_kaf)+', '+IntToStr(id_zakaz)+', '''+cxTextEdit1.Text+''')';
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
            id_god   := myform.id_god;
            id_fak   := myform.id_fak;
            id_form  := myform.id_form;
            id_kat   := myform.id_kat;
            id_kurs  := myform.id_kurs;
            id       := StrToInt64(myform.ds.fbn('ID_DT_KONTINGENT').AsString);
            Stored.StoredProcName := 'UO_DT_KONTINGENT_3_UPDATE';
            Stored.ParamByName('ID_DT_KONTINGENT_SPC').AsInt64     := id;
            Stored.ParamByName('ID_SP_GOD_NABORA').AsInt64         := id_god;
            Stored.ParamByName('ID_SP_DEPARTMENT_FAK').AsInt64     := id_fak;
            Stored.ParamByName('ID_SP_FORM_STUD').AsInt64          := id_form;
            Stored.ParamByName('ID_SP_KAT_STUD').AsInt64           := id_kat;
            Stored.ParamByName('ID_SP_KURS').AsInt64               := id_kurs;
            Stored.ParamByName('ID_SP_DEPARTMENT_KAF').AsInt64     := id_kaf;
            Stored.ParamByName('ID_SP_SPEC').AsInt64               := ID_SP_SPEC;
            Stored.ParamByName('ID_SP_DERG_ZAKAZ').AsInt64         := id_zakaz;
            Stored.ParamByName('KOLVO').AsInteger                  := StrToInt(cxTextEdit1.Text);
            Stored.ParamByName('ID_SP_SPECIALIZATION').AsInt64     := id_spesial;
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

procedure Tfmuo_kontingent_3_potok_add.cxButtonEdit2PropertiesButtonClick(
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
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            id_kaf              := sp.Output['Id_Department'];
            cxButtonEdit2.Text  := sp.Output['Name_Full'];
        end;
        sp.Free;
    end;
end;

end.
