unit UWspTypeViplatAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, cxMaskEdit,
  cxSpinEdit, cxButtonEdit, AArray, ibase, ib_externals, DB, FIBDataSet,
  pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, UWspTypeViplatMain;

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
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure LoadCaption;
  private
    index_lang : smallint;
    myform : TfmUWspTypeViplatMain;
    regim : integer;
  public
    constructor Create(aOwner: TComponent; D : TpfibDataBase; reg : integer; mform : TfmUWspTypeViplatMain); reintroduce; overload;

  end;

implementation
uses  Registry,
      UWResourcesUnit;

{$R *.dfm}

constructor TfmUWspTypeViplatAdd.Create(aOwner: TComponent;
  D: TpfibDataBase; reg: integer; mform: TfmUWspTypeViplatMain);
begin
    inherited Create(aOwner);
    myform := mform;
    regim  := reg;
    DB     := D;
    TWr.DefaultDatabase := DB; 
    LoadCaption;
    if (reg = 2) or (reg = 3) then
    begin
        cxTextEditFullName.Text := myform.DataSet_uo__sp_type.fbn('NAME_TYPE').AsString;
    end;
    if reg = 3 then
    begin
        ActionOK.Enabled            := false;
        cxTextEditFullName.Enabled  := false;
    end;
//
end;

procedure TfmUWspTypeViplatAdd.ActionOKExecute(Sender: TObject);
var
    s : string;
    id : int64;
begin
    if trim(cxTextEditFullName.Text)='' then
    begin
        s := UWResourcesUnit.V2_TYPE_NOT_NAME[index_lang];
        ShowMessage(s);
        cxTextEditFullName.SetFocus;
        exit;
    end;
    if regim = 1 then
    begin
         DS.Database    := DB;
         DS.Transaction := TWr;
         TWr.StartTransaction;
         try
             DS.Close;
             DS.SQLs.SelectSQL.Text := 'select * from UW_SP_TYPE_VIPLAT_INS('''+cxTextEditFullName.Text+''')';
             DS.Open;
             id := StrToint64(DS.fbn('ID_SP_TYPE_VIPLAT').AsString);
             DS.Close;
             TWr.Commit;
         except on E:Exception do begin
             TWr.Rollback;
             ShowMessage(E.Message);
             exit;
         end;
         end;
         myform.ActionObnovExecute(Sender);
         myform.DataSet_uo__sp_type.Locate('ID_SP_TYPE_VIPLAT', id, []);
    end;
    if regim = 2 then
    begin
        St.Database         := DB;
        St.Transaction      := TWr;
        try
            TWr.StartTransaction;
            St.StoredProcName := 'UW_SP_TYPE_VIPLAT_UPD';
            St.ParamByName('ID_SP_TYPE_VIPLAT').AsInt64  := StrToInt64(myform.DataSet_uo__sp_type.fbn('ID_SP_TYPE_VIPLAT').AsString);
            St.ParamByName('NAME_TYPE').AsString         := cxTextEditFullName.text;
            St.ExecProc;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
            exit;
        end end;
        myform.ActionObnovExecute(Sender);

    end;
    Close;
end;

procedure TfmUWspTypeViplatAdd.ActionCanselExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmUWspTypeViplatAdd.Action1Execute(Sender: TObject);
var
    reg : TRegistry;
begin
    reg := TRegistry.Create;
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
end;

procedure TfmUWspTypeViplatAdd.LoadCaption;
var
    reg : TRegistry;
begin
    reg := TRegistry.Create;
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

    Caption                     := UWResourcesUnit.V2_TYPE_CAPTION[index_lang];
    cxLabelFullName.Caption     := UWResourcesUnit.V2_TYPE_NAME_TYPE[index_lang];
    cxButtonOK.Caption          := UWResourcesUnit.MY_CONST_BUTTON_OK[index_lang];
    cxButtonCansel.Caption      := UWResourcesUnit.MY_CONST_BUTTON_CANCEL[index_lang];


end;

end.
