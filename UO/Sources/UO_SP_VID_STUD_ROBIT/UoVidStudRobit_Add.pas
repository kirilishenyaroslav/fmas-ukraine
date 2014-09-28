unit UoVidStudRobit_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, cxMaskEdit,
  cxSpinEdit, cxButtonEdit, AArray, ibase, ib_externals, DB, FIBDataSet,
  pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, UoVidStudRobit_Main, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxDBData, dxBar, dxBarExtItems,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls, cxMemo;

type
  TfmUoVidStudRobit_Add = class(TForm)
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
    Action1: TAction;
    Tr: TpFIBTransaction;
    cxLabel1: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    cxLabel3: TcxLabel;
    DSave: TpFIBDataSet;
    DSlocal: TpFIBDataSet;
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure LoadCaption;
  private
//    index_lang : smallint;
    myform : TfmUoVidStudRobit_Main;
    regim : integer;
    id_robit : int64;
  public
    constructor Create(aOwner: TComponent; D : TpfibDataBase; reg : integer; mform : TfmUoVidStudRobit_Main); reintroduce; overload;

  end;

implementation
uses  Registry;

{$R *.dfm}

constructor TfmUoVidStudRobit_Add.Create(aOwner: TComponent;
  D: TpfibDataBase; reg: integer; mform: TfmUoVidStudRobit_Main);
begin
    inherited Create(aOwner);
    myform := mform;
    regim  := reg;
    DB     := D;

    TWr.DefaultDatabase := DB;
    Tr.DefaultDatabase  := DB;

    DSlocal.Database    := DB;
    DSlocal.Transaction := Tr;

    DSave.Database      := DB;
    DSave.Transaction   := TWr;

    Tr.StartTransaction;

    LoadCaption;
    if reg = 1 then
    begin
        DSlocal.Close;
        DSlocal.SQLs.SelectSQL.Text := 'select * from UW_CREATE_ID('''+'UO_GEN_SP_VID_STUD_ROBIT'+''')';
        DSlocal.Open;
        id_robit := StrtoInt64(DSlocal.FBN('RET_VALUE').AsString);
        DSlocal.Close;
        DSlocal.SQLs.SelectSQL.Text := 'select * from UO_SP_VID_STUD_ROBIT_SEL_MAX';
        DSlocal.Open;
        cxTextEdit2.Text            := IntToStr(DSlocal.FBN('MAX_KOD').AsInteger+1);
        cxTextEdit3.Text            := IntToStr(DSlocal.FBN('MAX_NPP').AsInteger+1);
        DSlocal.Close;
    end;
    if (reg = 2) or (reg = 3) then
    begin
        id_robit                    := StrToint64(myform.DS.fbn('ID_SP_VID_STUD_ROBIT').AsString);
        TWr.StartTransaction;
        DSave.Close;
        DSave.SQLs.SelectSQL.Text   := 'select * from UO_SP_VID_STUD_ROBIT_SEL_DATA('+IntToStr(id_robit)+')';
        DSave.open;
        cxTextEditFullName.Text     := DSave.fbn('NAME').AsString;
        cxTextEdit1.Text            := DSave.fbn('SHORT_NAME').AsString;
        cxTextEdit2.Text            := DSave.fbn('KOD').AsString;
        cxTextEdit3.Text            := DSave.fbn('NPP').AsString;
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
    end;
//
end;

procedure TfmUoVidStudRobit_Add.ActionOKExecute(Sender: TObject);
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

    if regim = 1 then
    begin
        St.Database         := DB;
        St.Transaction      := TWr;
        try
            TWr.StartTransaction;
            St.StoredProcName := 'UO_SP_VID_STUD_ROBIT_INS';
            St.ParamByName('ID_SP_VID_STUD_ROBIT').AsInt64   := id_robit;
            St.ParamByName('NAME').AsString                  := cxTextEditFullName.text;
            St.ParamByName('SHORT_NAME').AsString            := cxTextEdit1.text;
            St.ParamByName('KOD').AsInteger                  := StrToInt(cxTextEdit2.text);
            St.ParamByName('NPP').AsInteger                  := StrToInt(cxTextEdit3.text);
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
            St.StoredProcName := 'UO_SP_VID_STUD_ROBIT_UPD';
            St.ParamByName('ID_SP_VID_STUD_ROBIT').AsInt64   := id_robit;
            St.ParamByName('NAME').AsString                  := cxTextEditFullName.text;
            St.ParamByName('SHORT_NAME').AsString            := cxTextEdit1.text;
            St.ParamByName('KOD').AsInteger                  := StrToInt(cxTextEdit2.text);
            St.ParamByName('NPP').AsInteger                  := StrToInt(cxTextEdit3.text);
            St.ExecProc;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
            exit;
        end end;
    end;
    myform.DS.CloseOpen(false);
    if not myform.DS.Locate('ID_SP_VID_STUD_ROBIT', id_robit, []) then myform.DS.Last;
    Close;
end;

procedure TfmUoVidStudRobit_Add.ActionCanselExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmUoVidStudRobit_Add.Action1Execute(Sender: TObject);
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

procedure TfmUoVidStudRobit_Add.LoadCaption;
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

end.
