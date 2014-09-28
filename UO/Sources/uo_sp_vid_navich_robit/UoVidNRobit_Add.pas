unit UoVidNRobit_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, cxMaskEdit,
  cxSpinEdit, cxButtonEdit, AArray, ibase, ib_externals, DB, FIBDataSet,
  pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, UoVidNRobit_Main, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxDBData, dxBar, dxBarExtItems,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls, cxMemo;

type
  TfmUWspTypeViplatAdd = class(TForm)
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxLabelFullName: TcxLabel;
    cxTextEditFullName: TcxTextEdit;
    DB: TpFIBDatabase;
    TWr: TpFIBTransaction;
    St: TpFIBStoredProc;
    DS: TpFIBDataSet;
    Action1: TAction;
    Panel1: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxBarDockControl1: TdxBarDockControl;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    Tr: TpFIBTransaction;
    DataSource1: TDataSource;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    cxLabel3: TcxLabel;
    DSlocal: TpFIBDataSet;
    cxMemo1: TcxMemo;
    cxLabel4: TcxLabel;
    DSave: TpFIBDataSet;
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure LoadCaption;
    procedure refresh;
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
//    index_lang : smallint;
    myform : TfmUoVidNRobit_Main;
    regim : integer;
    id_session, id_robit : int64;
  public
    constructor Create(aOwner: TComponent; D : TpfibDataBase; reg : integer; mform : TfmUoVidNRobit_Main); reintroduce; overload;

  end;

implementation
uses  Registry,
      UoVidNRobit_Add_Norm{,
      UWResourcesUnit};

{$R *.dfm}

constructor TfmUWspTypeViplatAdd.Create(aOwner: TComponent;
  D: TpfibDataBase; reg: integer; mform: TfmUoVidNRobit_Main);
begin
    inherited Create(aOwner);
    myform := mform;
    regim  := reg;
    DB     := D;

    id_session          := DB.Gen_Id('GEN_UO_TEMP_ROBIT_NORM', 1);

    TWr.DefaultDatabase := DB;
    Tr.DefaultDatabase  := DB;

    DSlocal.Database    := DB;
    DSlocal.Transaction := Tr;

    DS.Database         := DB;
    DS.Transaction      := Tr;

    DSave.Database      := DB;
    DSave.Transaction   := TWr;

    Tr.StartTransaction;

    LoadCaption;
    if reg = 1 then
    begin
        DSlocal.Close;
        DSlocal.SQLs.SelectSQL.Text := 'select * from UW_CREATE_ID('''+'GEN_UO_SP_VID_NAVICH_ROBIT'+''')';
        DSlocal.Open;
        id_robit := StrtoInt64(DSlocal.FBN('RET_VALUE').AsString);
        DSlocal.Close;
        DSlocal.SQLs.SelectSQL.Text := 'select * from UO_SP_VID_NAVCH_ROBIT_SEL_MAX';
        DSlocal.Open;
        cxTextEdit2.Text            := IntToStr(DSlocal.FBN('MAX_KOD').AsInteger+1);
        cxTextEdit3.Text            := IntToStr(DSlocal.FBN('MAX_NPP').AsInteger+1);
        DSlocal.Close;
    end;
    if (reg = 2) or (reg = 3) then
    begin
        id_robit                    := StrToint64(myform.DS.fbn('ID_SP_VID_NAVCH_ROBIT').AsString);
        TWr.StartTransaction;
        DSave.Close;
        DSave.SQLs.SelectSQL.Text   := 'select * from UO_SP_VID_NAVCH_ROBIT_SEL_DATA('+IntToStr(id_robit)+', '+IntToStr(id_session)+')';
        DSave.open;
        cxTextEditFullName.Text     := DSave.fbn('NAME').AsString;
        cxTextEdit1.Text            := DSave.fbn('SHORT_NAME').AsString;
        cxTextEdit2.Text            := DSave.fbn('KOD').AsString;
        cxTextEdit3.Text            := DSave.fbn('NPP').AsString;
        cxMemo1.Text                := DSave.fbn('NOTE').AsString;
        DSave.Close;
        TWr.Commit;
        refresh;
    end;
    if reg = 3 then
    begin
        ActionOK.Enabled            := false;
        cxTextEditFullName.Enabled  := false;
        cxTextEdit1.Enabled         := false;
        cxTextEdit2.Enabled         := false;
        cxTextEdit3.Enabled         := false;
        cxMemo1.Enabled             := false;
        dxBarLargeButton1.Enabled   := false;
        dxBarLargeButton2.Enabled   := false;
        dxBarLargeButton3.Enabled   := false;
    end;
//
end;

procedure TfmUWspTypeViplatAdd.ActionOKExecute(Sender: TObject);
var
    s  : string;
//    id : int64;
begin
    if trim(cxTextEditFullName.Text)='' then
    begin
        s := 'Ви не ввели назву вида робіт!';//UWResourcesUnit.V2_TYPE_NOT_NAME[index_lang];
        ShowMessage(s);
        cxTextEditFullName.SetFocus;
        exit;
    end;
    if trim(cxTextEdit1.Text)='' then
    begin
        s := 'Ви не ввели коротку назву вида робіт!';//UWResourcesUnit.V2_TYPE_NOT_NAME[index_lang];
        ShowMessage(s);
        cxTextEdit1.SetFocus;
        exit;
    end;
    if trim(cxTextEdit2.Text)='' then
    begin
        s := 'Ви не ввели код вида робіт!';//UWResourcesUnit.V2_TYPE_NOT_NAME[index_lang];
        ShowMessage(s);
        cxTextEdit2.SetFocus;
        exit;
    end;
    if trim(cxTextEdit3.Text)='' then
    begin
        s := 'Ви не ввели № п/п вида робіт!';//UWResourcesUnit.V2_TYPE_NOT_NAME[index_lang];
        ShowMessage(s);
        cxTextEdit3.SetFocus;
        exit;
    end;

    if DS.IsEmpty then
    begin
        ShowMessage('Ви не ввели жодного нормаитву часу виконання навчальних робіт!');
        cxGrid1.SetFocus;
        exit;
    end;

    if regim = 1 then
    begin
        St.Database         := DB;
        St.Transaction      := TWr;
        try
            TWr.StartTransaction;
            St.StoredProcName := 'UO_SP_VID_NAVCH_ROBIT_INS';
            St.ParamByName('ID_SP_VID_NAVCH_ROBIT').AsInt64  := id_robit;
            St.ParamByName('NAME').AsString                  := cxTextEditFullName.text;
            St.ParamByName('SHORT_NAME').AsString            := cxTextEdit1.text;
            St.ParamByName('KOD').AsInteger                  := StrToInt(cxTextEdit2.text);
            St.ParamByName('NPP').AsInteger                  := StrToInt(cxTextEdit3.text);
            St.ParamByName('NOTE').AsString                  := cxMemo1.text;
            St.ParamByName('ID_SESSION').AsInt64             := id_session;
            St.ExecProc;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
            exit;
        end end;
    end;
    if regim = 2 then
    begin
        St.Database         := DB;
        St.Transaction      := TWr;
        try
            TWr.StartTransaction;
            St.StoredProcName := 'UO_SP_VID_NAVCH_ROBIT_UPD';
            St.ParamByName('ID_SP_VID_NAVCH_ROBIT').AsInt64  := id_robit;
            St.ParamByName('NAME').AsString                  := cxTextEditFullName.text;
            St.ParamByName('SHORT_NAME').AsString            := cxTextEdit1.text;
            St.ParamByName('KOD').AsInteger                  := StrToInt(cxTextEdit2.text);
            St.ParamByName('NPP').AsInteger                  := StrToInt(cxTextEdit3.text);
            St.ParamByName('NOTE').AsString                  := cxMemo1.text;
            St.ParamByName('ID_SESSION').AsInt64             := id_session;
            St.ExecProc;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
            exit;
        end end;
    end;
    myform.DS.CloseOpen(false);
    if not myform.DS.Locate('ID_SP_VID_NAVCH_ROBIT', id_robit, []) then myform.DS.Last;
    Close;
end;

procedure TfmUWspTypeViplatAdd.ActionCanselExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmUWspTypeViplatAdd.Action1Execute(Sender: TObject);
//var
//    reg : TRegistry;
begin
{    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12303706759837\gnal\v\',true) then
        begin
            if index_lang + 1 > UWResourcesUnit.IndexLang
                then reg.writeString('index', '1')
                else reg.writeString('index', IntToStr(index_lang + 1));
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;

    LoadCaption;
}end;

procedure TfmUWspTypeViplatAdd.LoadCaption;
//var
//    reg : TRegistry;
begin
{    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12303706759837\gnal\v\', False) then
        begin
            index_lang := StrToInt(reg.ReadString('index'));
        end else
            index_lang := 1;
    finally
        reg.Free;
    end;
}
    Caption                     := 'Вікно редагування видів навчальних робіт';//UWResourcesUnit.V2_TYPE_CAPTION[index_lang];
//    cxLabelFullName.Caption     := UWResourcesUnit.V2_TYPE_NAME_TYPE[index_lang];
//    cxButtonOK.Caption          := UWResourcesUnit.MY_CONST_BUTTON_OK[index_lang];
//    cxButtonCansel.Caption      := UWResourcesUnit.MY_CONST_BUTTON_CANCEL[index_lang];
end;

procedure TfmUWspTypeViplatAdd.refresh;
begin
    DS.Close;
    DS.Sqls.SelectSql.Text := 'select * from UO_SP_VID_NAVCH_ROBIT_NORM_T_S('+IntToStr(id_robit)+', '+IntToStr(id_session)+')';
    DS.Open;
end;

procedure TfmUWspTypeViplatAdd.dxBarLargeButton1Click(Sender: TObject);
var
    id_obuch, id_kat, id_norm : int64;
    name_obuch, name_kat : string;
    max_k, max_g, max_p, min_k, min_g, min_p : double;
begin
    id_obuch    := -2;
    id_kat      := -2;
    name_obuch  := '';
    name_kat    := '';
    max_k       := 0;
    max_g       := 0;
    max_p       := 0;
    min_k       := 0;
    min_g       := 0;
    min_p       := 0;
    if SNormNavchRobit(DB, id_obuch, id_kat, name_obuch, name_kat, max_k, max_g, max_p, min_k, min_g, min_p) then
    begin
        DSlocal.Close;
        DSlocal.SQLs.SelectSQL.Text := 'select * from UW_CREATE_ID('''+'GEN_UO_SP_VID_NAVCH_ROBIT_NORM'+''')';
        DSlocal.Open;
        id_norm := StrtoInt64(DSlocal.FBN('RET_VALUE').AsString);
        DSlocal.Close;

        St.Database         := DB;
        St.Transaction      := TWr;
        try
            TWr.StartTransaction;
            St.StoredProcName := 'UO_SP_VID_NAVCH_ROBIT_NORM_T_I';
            St.ParamByName('ID_SESSION').AsInt64                    := id_session;
            St.ParamByName('ID_SP_VID_NAVCH_ROBIT_NORM').AsInt64    := id_norm;
            St.ParamByName('ID_SP_VID_NAVCH_ROBIT').AsInt64         := id_robit;
            St.ParamByName('ID_SP_FORM_OBUCH_KATEGORY').AsInt64     := id_obuch;
            St.ParamByName('ID_SP_TYPE_KAT_STUD').AsInt64           := id_kat;
            St.ParamByName('VAL_MAX_KONT').AsDouble                 := max_k;
            St.ParamByName('VAL_MIN_KONT').AsDouble                 := min_k;
            St.ParamByName('VAL_MAX_GROUP').AsDouble                := max_g;
            St.ParamByName('VAL_MIN_GROUP').AsDouble                := min_g;
            St.ParamByName('VAL_MAX_PERCENT').AsDouble              := max_p;
            St.ParamByName('VAL_MIN_PERCENT').AsDouble              := min_p;
            St.ExecProc;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
            exit;
        end end;
    
        refresh;
        DS.Locate('ID_SP_VID_NAVCH_ROBIT_NORM', id_norm, []);
    end;
end;

procedure TfmUWspTypeViplatAdd.dxBarLargeButton2Click(Sender: TObject);
var
    id_obuch, id_kat, id_norm : int64;
    name_obuch, name_kat : string;
    max_k, max_g, max_p, min_k, min_g, min_p : double;
begin
    if DS.IsEmpty then exit;
    id_norm     := StrToint64(DS.fbn('ID_SP_VID_NAVCH_ROBIT_NORM').AsString);
    id_obuch    := StrToint64(DS.fbn('ID_SP_FORM_OBUCH_KATEGORY').AsString);
    id_kat      := StrToint64(DS.fbn('ID_SP_TYPE_KAT_STUD').AsString);
    name_obuch  := DS.fbn('NAME_OBUCH_KATEGORY').AsString;
    name_kat    := DS.fbn('NAME_KAT_STUD').AsString;
    max_k       := DS.fbn('VAL_MAX_KONT').AsFloat;
    max_g       := DS.fbn('VAL_MAX_GROUP').AsFloat;
    max_p       := DS.fbn('VAL_MAX_PERCENT').AsFloat;
    min_k       := DS.fbn('VAL_MIN_KONT').AsFloat;
    min_g       := DS.fbn('VAL_MIN_GROUP').AsFloat;
    min_p       := DS.fbn('VAL_MIN_PERCENT').AsFloat;
    if SNormNavchRobit(DB, id_obuch, id_kat, name_obuch, name_kat, max_k, max_g, max_p, min_k, min_g, min_p) then
    begin
        St.Database         := DB;
        St.Transaction      := TWr;
        try
            TWr.StartTransaction;
            St.StoredProcName := 'UO_SP_VID_NAVCH_ROBIT_NORM_T_U';
            St.ParamByName('ID_SESSION').AsInt64                    := id_session;
            St.ParamByName('ID_SP_VID_NAVCH_ROBIT_NORM').AsInt64    := id_norm;
            St.ParamByName('ID_SP_VID_NAVCH_ROBIT').AsInt64         := id_robit;
            St.ParamByName('ID_SP_FORM_OBUCH_KATEGORY').AsInt64     := id_obuch;
            St.ParamByName('ID_SP_TYPE_KAT_STUD').AsInt64           := id_kat;
            St.ParamByName('VAL_MAX_KONT').AsDouble                 := max_k;
            St.ParamByName('VAL_MIN_KONT').AsDouble                 := min_k;
            St.ParamByName('VAL_MAX_GROUP').AsDouble                := max_g;
            St.ParamByName('VAL_MIN_GROUP').AsDouble                := min_g;
            St.ParamByName('VAL_MAX_PERCENT').AsDouble              := max_p;
            St.ParamByName('VAL_MIN_PERCENT').AsDouble              := min_p;
            St.ExecProc;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
            exit;
        end end;

        refresh;
        DS.Locate('ID_SP_VID_NAVCH_ROBIT_NORM', id_norm, []);

    end;

end;

procedure TfmUWspTypeViplatAdd.dxBarLargeButton3Click(Sender: TObject);
var
    s1, s2 : string;
    id_norm, id_del_p : int64;
begin
    if DS.IsEmpty then exit;

    s1 := 'Ви дійсно бажаєте видалити цей норматив';//UWResourcesUnit.V2_TYPE_DELETE[index_lang];
    s2 := 'Увага!';//UWResourcesUnit.MY_CONST_MESSAGE_WARNING[index_lang];
    if MessageBox(Handle, Pchar(s1 {+ ' ' + DS.FieldByName('NAME').AsString} + '?'), Pchar(s2), MB_YESNO + MB_DEFBUTTON2)=mrYes then
    begin
        id_norm     := StrToint64(DS.fbn('ID_SP_VID_NAVCH_ROBIT_NORM').AsString);
        cxGrid1DBTableView1.Controller.GoToNext(false);
        id_del_p    := StrToint64(DS.fbn('ID_SP_VID_NAVCH_ROBIT_NORM').AsString);
        try
            TWr.StartTransaction;
            St.StoredProcName := 'UO_SP_VID_NAVCH_ROBIT_NORM_T_D';
            St.ParamByName('ID_SESSION').AsInt64                    := id_session;
            St.ParamByName('ID').AsInt64                            := id_norm;
            St.ExecProc;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
            exit;
        end end;

        refresh;
        DS.Locate('ID_SP_VID_NAVCH_ROBIT_NORM', id_del_p, []);
    end;
end;

procedure TfmUWspTypeViplatAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        try
            TWr.StartTransaction;
            St.StoredProcName := 'UO_SP_VID_NAVCH_ROBIT_NORM_T_D_';
            St.ParamByName('ID_SESSION').AsInt64                    := id_session;
            St.ExecProc;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
        end end;
end;

end.
