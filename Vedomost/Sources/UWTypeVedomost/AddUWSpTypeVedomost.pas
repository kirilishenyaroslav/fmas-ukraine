unit AddUWSpTypeVedomost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UwMainSpTypeVedomost, cxLookAndFeelPainters, StdCtrls, cxButtons,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxCheckBox,
  cxLabel, ActnList, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TfmAddUWSpTypeVedomost = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    D: TpFIBDatabase;
    DS: TpFIBDataSet;
    TrW: TpFIBTransaction;
    cxTextEdit1: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxCheckBoxDbf: TcxCheckBox;
    cxCheckBoxDog: TcxCheckBox;
    cxButtonEdit1: TcxButtonEdit;
    cxLabel2: TcxLabel;
    ActionList1: TActionList;
    AAdd: TAction;
    StorP: TpFIBStoredProc;
    SelectLang: TAction;
    procedure cxButton1Click(Sender: TObject);
    procedure AAddExecute(Sender: TObject);
    procedure SelectLangExecute(Sender: TObject);
    procedure LoadCaption;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    myform : TfmUwMainSpTypeVedomost;
    reg : smallint;
    index_lang : smallint;
    id_shablon : int64;
  public
    constructor Create(Ao : TComponent; mform : TfmUwMainSpTypeVedomost; AddChange : smallint); reintroduce; overload;
  end;


implementation
uses Registry,
     UWResourcesUnit,
     UWSelectPrintShablon;
{$R *.dfm}

{ TfmAddUWSpTypeVedomost }

constructor TfmAddUWSpTypeVedomost.Create(Ao : TComponent; mform : TfmUwMainSpTypeVedomost; AddChange : smallint);
begin
    inherited Create(Ao);
    myform               := mform;
    reg                  := AddChange;
    D                    := myform.DB;
    TrW.DefaultDatabase  := D;
    D.DefaultTransaction := TrW;
    id_shablon           := -1;
    if reg = 1 then cxButtonEdit1PropertiesButtonClick(self, 0);
    if reg = 2 then
    begin
        if myform.DS.fbn('MAKE_DBF').AsInteger = 1 then cxCheckBoxDbf.Checked := true;
        if myform.DS.fbn('SELECT_DOGOVOR').AsInteger = 1 then cxCheckBoxDog.Checked := true;
        cxTextEdit1.text    := myform.DS.fbn('NAME').AsString;
        id_shablon          := StrToInt64(myform.DS.fbn('ID_PRINT_SHABLON').AsString);
        cxButtonEdit1.Text  := myform.DS.fbn('name_shablon').AsString;
    end;
    LoadCaption;
end;

procedure TfmAddUWSpTypeVedomost.cxButton1Click(Sender: TObject);
begin
    Close;
end;

procedure TfmAddUWSpTypeVedomost.AAddExecute(Sender: TObject);
var
    dbf_f, dog_f : smallint;
//    id : int64;
begin
    if cxTextEdit1.Text = '' then
    begin
        showmessage(UWResourcesUnit.VEDOMOST_TYPE_VEDOM_ADD_NO_NAME[index_lang]);
        cxTextEdit1.SetFocus;
        exit;
    end;
    if cxCheckBoxDbf.Checked then dbf_f := 1 else dbf_f := 0;
    if cxCheckBoxDog.Checked then dog_f := 1 else dog_f := 0;
    if reg = 1 then
    begin
        TrW.DefaultDatabase := D;
        DS.Database         := D;
        DS.Transaction      := TrW;
        TrW.StartTransaction;
        try
            DS.Close;
            DS.SQLs.SelectSQL.Text := 'select * from UW_SP_TYPE_VEDOMOST_INSERT('''+cxTextEdit1.Text+''', '+IntToStr(dbf_f)+', '+IntToStr(dog_f)+', '+IntToStr(0)+')';
            Ds.Open;
            myform.id_located := StrToInt64(DS.fbn('R_ID_SP_TYPE_VEDOMOST').AsString);
            DS.Close;
            TrW.Commit;
        except on E:Exception do begin
            TrW.Rollback;
            ShowMessage(E.Message);
            exit;
        end;
        end;
        myform.ARefreshExecute(nil);
        cxButton1Click(Sender);
    end;
    if reg = 2 then
    begin
        TrW.DefaultDatabase  := D;
        StorP.Database       := D;
        StorP.Transaction    := TrW;
        TrW.StartTransaction;
        try
            StorP.StoredProcName := 'UW_SP_TYPE_VEDOMOST_UPDATE';
            StorP.Prepare;
            StorP.ParamByName('ID_SP_TYPE_VEDOMOST').AsInt64  := StrToInt64(myform.DS.fbn('ID_SP_TYPE_VEDOMOST').AsString);
            StorP.ParamByName('NAME').AsString                := cxTextEdit1.Text;
            StorP.ParamByName('MAKE_DBF').AsInteger           := dbf_f;
            StorP.ParamByName('SELECT_DOGOVOR').AsInteger     := dog_f;
            StorP.ParamByName('ID_PRINT_SHABLON').AsInt64     := -1;
            StorP.ExecProc;
            myform.id_located := StrToInt64(myform.DS.fbn('ID_SP_TYPE_VEDOMOST').AsString);
            TrW.Commit;
        except on E:Exception do begin
            TrW.Rollback;
            ShowMessage(E.Message);
            exit;
        end;
        end;
        myform.ARefreshExecute(nil);
        cxButton1Click(Sender);
    end;

end;

procedure TfmAddUWSpTypeVedomost.SelectLangExecute(Sender: TObject);
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

procedure TfmAddUWSpTypeVedomost.LoadCaption;
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

    AAdd.Caption                         := UWResourcesUnit.MY_CONST_BUTTON_OK[index_lang];
    cxButton1.Caption                    := UWResourcesUnit.MY_CONST_BUTTON_CANCEL[index_lang];

    Caption                              := UWResourcesUnit.VEDOMOST_TYPE_VEDOM_CAPTION_ADD[index_lang];
    cxLabel1.Caption                     := UWResourcesUnit.SPBANKCARD_DOG_SHORTNAME[index_lang];
    cxLabel2.Caption                     := UWResourcesUnit.VEDOMOST_TYPE_VEDOM_ADD_CAP_SH[index_lang];
    cxCheckBoxDbf.Properties.Caption     := UWResourcesUnit.VEDOMOST_TYPE_VEDOM_MAKE_DBF[index_lang];
    cxCheckBoxDog.Properties.Caption     := UWResourcesUnit.VEDOMOST_TYPE_VEDOM_SEL_DOG[index_lang];


end;

procedure TfmAddUWSpTypeVedomost.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    s : string;
begin
    s := '';
    if ShowSelectPrintShablon(Self, D, id_shablon, s) then
    begin
        cxButtonEdit1.Text := s;
    end;
end;

end.
