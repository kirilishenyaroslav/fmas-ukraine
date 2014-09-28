unit UWAddVedomostProv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxMRUEdit, cxControls,
  cxContainer, cxEdit, cxLabel, cxButtonEdit, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxGraphics, dxStatusBar, UWAddVedomost, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, ActnList;

type
  TfmUWAddVedomostProv = class(TForm)
    cxLabelSch: TcxLabel;
    cxLabel7: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabel1: TcxTextEdit;
    cxLabel10: TcxLabel;
    Label3: TcxTextEdit;
    cxLabel11: TcxLabel;
    Label4: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxLabel8: TcxTextEdit;
    cxLabel6: TcxLabel;
    cxTextEditSumma: TcxTextEdit;
    cxBEditSch: TcxButtonEdit;
    cxBEditSmeta: TcxButtonEdit;
    cxBEditRazd: TcxButtonEdit;
    cxBEditState: TcxButtonEdit;
    cxBEditKekv: TcxButtonEdit;
    cxBEditPeople: TcxButtonEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxBEditDog: TcxButtonEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    dxStatusBar1: TdxStatusBar;
    DB: TpFIBDatabase;
    DataSetDef: TpFIBDataSet;
    Tr: TpFIBTransaction;
    ActionList1: TActionList;
    ATake: TAction;
    TrW: TpFIBTransaction;
    SelectLang: TAction;
    procedure cxTextEditSummaKeyPress(Sender: TObject; var Key: Char);
    procedure cxButton1Click(Sender: TObject);
    procedure ATakeExecute(Sender: TObject);
    procedure cxBEditPeoplePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxBEditSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxBEditSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxBEditKekvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxBEditDogPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure LoadCaption;
    procedure SelectLangExecute(Sender: TObject);
  private
    myform : TfmUWAddVedomost;
    regim, index_lang : smallint;
    fio, name_card : string;
    id_sch, id_razd, id_smeta, id_state, id_kekv, id_people, id_card, id_dog, kod_dog : int64;

  public
    constructor C1 (AO : TComponent; mform : TfmUWAddVedomost; reg : smallint); reintroduce; overload;
  end;

function VedomProv (AO : TComponent; mform : TfmUWAddVedomost; reg : smallint) : boolean;

implementation
uses GlobalSPR,
     UWLoaderUnit,
     DogLoaderUnit,
     DateUtils,
     Registry,
     UWResourcesUnit;

{$R *.dfm}

function VedomProv (AO : TComponent; mform : TfmUWAddVedomost; reg : smallint) : boolean;
var
    T : TfmUWAddVedomostProv;
    Res, ResSM, ResKekv, ResP : variant;
begin
    T := TfmUWAddVedomostProv.C1(AO, mform, reg);
    if reg = 1 then
    begin
        ResP := UWLoaderUnit.LoadUVSpBankCardTakePoDog(nil, mform.id_user, T.Db, true, mform.id_bank);
        if VarArrayDimCount(ResP) > 0 then
        begin
            T.id_people          := resP[1];
            T.id_card            := resP[0];
            T.fio                := VarToStr(resP[2]);
            T.name_card          := VarToStr(resP[3]);
            T.cxBEditPeople.Text := VarToStr(resP[2]) + '  ' + VarToStr(resP[3]);
            if mform.rxMDProv.IsEmpty then
            begin
                Res := GetSch(nil, T.DB.Handle, fsNormal, mform.cxDateEdit1.Date, 1, 0, 0);
                if VarArrayDimCount(Res) > 0 then
                begin
                    T.id_sch          := res[0][0];
                    T.cxBEditSch.Text := res[0][3];
                    T.cxLabel7.Text   := res[0][1];
                    T.DataSetDef.Close;
                    T.DataSetDef.sqls.selectSql.Text := 'SELECT * FROM MBOOK_INI_DATA';
                    T.DataSetDef.Open;
                    if T.DataSetDef.FBN('USE_DEFAULT_VALUES').AsInteger = 0 then
                    begin
                        ResSM := GlobalSPR.GetSmets(nil, T.DB.Handle, mform.cxDateEdit1.Date, psmRazdSt);
                        if VarArrayDimCount(ResSM) > 0 then
                        begin
                            if ResSM[0] <> 0 then
                            begin
                                T.id_smeta          := resSM[0];
                                T.id_razd           := resSM[1];
                                T.id_state          := resSM[2];
                                T.cxBEditSmeta.Text := resSM[9];
                                T.cxLabel1.Text     := resSM[6];
                                T.cxBEditRazd.Text  := resSM[7];
                                T.Label3.Text       := resSM[4];
                                T.cxBEditState.text := resSM[8];
                                T.Label4.Text       := resSM[5];
                            end;
                        end else
                        begin
                            T.ModalResult := mrNone;
                        end;
                    end else
                    begin
                        T.id_smeta   := StrToInt64(T.DataSetDef.FBN('DEFAULT_SMETA').AsString);
                        T.id_razd    := StrToInt64(T.DataSetDef.FBN('DEFAULT_RAZD').AsString);
                        T.id_state   := StrToInt64(T.DataSetDef.FBN('DEFAULT_ST').AsString);
                    end;
                    if T.DataSetDef.FBN('USE_DEFAULT_KEKV').AsInteger = 0 then
                    begin
                        ResKekv := GlobalSPR.GetKEKVSpr(nil, T.DB.Handle, fsNormal, mform.cxDateEdit1.Date, 1);
                        if VarArrayDimCount(resKekv) > 0 then
                        begin
                            if (ResKekv[0][0]<>null) and (ResKekv[0][1]<>null) then
                            begin
                                T.id_kekv           := ResKekv[0][0];
                                T.cxBEditKekv.Text  := resKEKV[0][2];
                                T.cxLabel8.Text     := resKekv[0][1];
                            end;
                        end else
                        begin
                            T.ModalResult := mrNone;
                        end;
                    end else
                    begin
                        T.id_kekv := StrToInt64(T.DataSetDef.FBN('DEFAULT_KEKV').AsString);
                    end;
                end else T.ModalResult := mrNone;
            end else
            begin
                T.id_sch               := mform.rxMDProv.FieldByName('id_sch').value;
                T.id_smeta             := mform.rxMDProv.FieldByName('id_smeta').value;
                T.id_razd              := mform.rxMDProv.FieldByName('id_razd').value;
                T.id_state             := mform.rxMDProv.FieldByName('id_state').value;
                T.id_kekv              := mform.rxMDProv.FieldByName('id_kekv').value;
                T.cxTextEditSumma.Text := mform.rxMDProv.FieldByName('summa').AsString;
                T.id_dog               := mform.rxMDProv.FieldByName('id_dog').value;
                T.kod_dog              := mform.rxMDProv.FieldByName('kod_dog').value;
                T.cxBEditSmeta.Text    := mform.rxMDProv.FieldByName('kod_smeta').value;
                T.cxBEditRazd.text     := mform.rxMDProv.FieldByName('kod_razd').value;
                T.cxBEditState.Text    := mform.rxMDProv.FieldByName('kod_state').value;
                T.cxBEditKekv.Text     := mform.rxMDProv.FieldByName('kod_kekv').value;
                T.cxBEditSch.text      := mform.rxMDProv.FieldByName('kod_sch').value;
                T.cxLabel7.Text        := mform.rxMDProv.FieldByName('tytle_sch').value;
                T.cxLabel1.text        := mform.rxMDProv.FieldByName('tytle_smeta').value;
                T.Label3.Text          := mform.rxMDProv.FieldByName('tytle_razd').value;
                T.Label4.Text          := mform.rxMDProv.FieldByName('tytle_state').value;
                T.cxLabel8.Text        := mform.rxMDProv.FieldByName('tytle_kekv').value;
            end;
        end else  T.ModalResult    := mrNone;
        T.cxTextEditSumma.TabOrder := 0;
        T.cxBEditDog.TabOrder      := 1;
        T.cxButton2.TabOrder       := 2;
        T.cxButton1.TabOrder       := 3;
        T.cxBEditPeople.TabOrder   := 4;
        T.cxBEditSch.TabOrder      := 5;
        T.cxBEditSmeta.TabOrder    := 6;
        T.cxBEditKekv.TabOrder     := 7;
    end;

    if reg = 2 then
    begin
        T.id_people            := mform.rxMDProv.FieldByName('id_man').value;
        T.id_sch               := mform.rxMDProv.FieldByName('id_sch').value;
        T.id_smeta             := mform.rxMDProv.FieldByName('id_smeta').value;
        T.id_razd              := mform.rxMDProv.FieldByName('id_razd').value;
        T.id_state             := mform.rxMDProv.FieldByName('id_state').value;
        T.id_kekv              := mform.rxMDProv.FieldByName('id_kekv').value;
        T.cxTextEditSumma.Text := mform.rxMDProv.FieldByName('summa').AsString;
        T.id_dog               := mform.rxMDProv.FieldByName('id_dog').value;
        T.kod_dog              := mform.rxMDProv.FieldByName('kod_dog').value;
        T.cxBEditSmeta.Text    := mform.rxMDProv.FieldByName('kod_smeta').value;
        T.cxBEditRazd.text     := mform.rxMDProv.FieldByName('kod_razd').value;
        T.cxBEditState.Text    := mform.rxMDProv.FieldByName('kod_state').value;
        T.cxBEditKekv.Text     := mform.rxMDProv.FieldByName('kod_kekv').value;
        T.cxBEditSch.text      := mform.rxMDProv.FieldByName('kod_sch').value;
        T.cxLabel7.Text        := mform.rxMDProv.FieldByName('tytle_sch').value;
        T.cxLabel1.text        := mform.rxMDProv.FieldByName('tytle_smeta').value;
        T.Label3.Text          := mform.rxMDProv.FieldByName('tytle_razd').value;
        T.Label4.Text          := mform.rxMDProv.FieldByName('tytle_state').value;
        T.cxLabel8.Text        := mform.rxMDProv.FieldByName('tytle_kekv').value;
        T.fio                  := mform.rxMDProv.FieldByName('fio').value;
        T.id_card              := mform.rxMDProv.FieldByName('id_bankcard').value;
        T.name_card            := mform.rxMDProv.FieldByName('name_bankcard').value;
        T.cxBEditPeople.Text   := T.fio + '  ' + T.name_card;
    end;

    if reg = 3 then
    begin
        T.ATake.Visible := false;
    end;
    
    if T.ShowModal=mrOk then
    begin
        Result := true;

    end else
    begin
        Result := false;

    end;
    T.Free;
end;

constructor TfmUWAddVedomostProv.C1(AO: TComponent; mform: TfmUWAddVedomost; reg: smallint);
begin
    inherited Create(AO);
    myform                 := mform;
    regim                  := reg;
    Db                     := myform.Database;
    Tr.DefaultDatabase     := Db;
    TrW.DefaultDatabase    := Db;
    DB.DefaultTransaction  := TR;

    DataSetDef.Database    := DB;
    DataSetDef.Transaction := Tr;

    Tr.StartTransaction;

    LoadCaption;
end;

procedure TfmUWAddVedomostProv.cxTextEditSummaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Ord(Key) = VK_TAB then exit;
    if Ord(Key) <> VK_TAB then
    begin
        cxTextEditSumma.ClearSelection;
    end;
 
    if Key = '.' then Key := DecimalSeparator;

    if (Key = '-') and (Length(cxTextEditSumma.Text)>0)
    then Key := Chr(0);

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
        and (Key <> '-')
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator, cxTextEditSumma.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditSumma.Text) - Pos(DecimalSeparator, cxTextEditSumma.Text) > 1) and (Pos(DecimalSeparator,cxTextEditSumma.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
end;

procedure TfmUWAddVedomostProv.cxButton1Click(Sender: TObject);
begin
    Close;
end;

procedure TfmUWAddVedomostProv.ATakeExecute(Sender: TObject);
var
    s : Currency;
begin
    if id_people <= 0 then
    begin
        showmessage(UWResourcesUnit.VEDOMOST_PROV_DONT_PEOPL[index_lang]);
        cxBEditPeople.SetFocus;
        Exit;
    end;
    if id_sch <= 0 then
    begin
        showmessage(UWResourcesUnit.VEDOMOST_PROV_DONT_SCH[index_lang]);
        cxBEditSch.SetFocus;
        Exit;
    end;
    if id_smeta <= 0 then
    begin
        showmessage(UWResourcesUnit.VEDOMOST_PROV_DONT_SMETA[index_lang]);
        cxBEditSmeta.SetFocus;
        Exit;
    end;
    if id_razd <= 0 then
    begin
        showmessage(UWResourcesUnit.VEDOMOST_PROV_DONT_RAZD[index_lang]);
        cxBEditSmeta.SetFocus;
        Exit;
    end;
    if id_state <= 0 then
    begin
        showmessage(UWResourcesUnit.VEDOMOST_PROV_DONT_STATE[index_lang]);
        cxBEditSmeta.SetFocus;
        Exit;
    end;
    if id_kekv <= 0 then
    begin
        showmessage(UWResourcesUnit.VEDOMOST_PROV_DONT_KEKV[index_lang]);
        cxBEditKekv.SetFocus;
        Exit;
    end;
    s := StrToCurr(cxTextEditSumma.Text);
    if s = 0 then
    begin
        showmessage(UWResourcesUnit.VEDOMOST_PROV_DONT_SUMMA[index_lang]);
        cxTextEditSumma.SetFocus;
        Exit;
    end;

{    if id_dog <= 0 then
    begin
        showmessage(UWResourcesUnit.VEDOMOST_PROV_DONT_DOGOVOR[index_lang]);
        cxBEditDog.SetFocus;
        Exit;
    end;
 }
    if regim = 1 then
    begin
        myform.flag_no_show := false;
        myform.rxMDProv.Open;
        myform.rxMDProv.Insert;
        myform.rxMDProv.FieldByName('id').value            := myform.rxMDProv.recordCount + 1;
        myform.rxMDProv.FieldByName('id_man').value        := id_people;
        myform.rxMDProv.FieldByName('id_sch').value        := id_sch;
        myform.rxMDProv.FieldByName('id_smeta').value      := id_smeta;
        myform.rxMDProv.FieldByName('id_razd').value       := id_razd;
        myform.rxMDProv.FieldByName('id_state').value      := id_state;
        myform.rxMDProv.FieldByName('id_kekv').value       := id_kekv;
        myform.rxMDProv.FieldByName('summa').value         := StrToCurr(cxTextEditSumma.Text);
        myform.rxMDProv.FieldByName('id_prov').value       := DB.Gen_Id('GEN_UW_DT_PROV_VEDOMOST', 1);
        myform.rxMDProv.FieldByName('id_dog').value        := id_dog;
        myform.rxMDProv.FieldByName('kod_dog').value       := kod_dog;
        myform.rxMDProv.FieldByName('kod_smeta').value     := cxBEditSmeta.Text;
        myform.rxMDProv.FieldByName('kod_razd').value      := cxBEditRazd.text;
        myform.rxMDProv.FieldByName('kod_state').value     := cxBEditState.Text;
        myform.rxMDProv.FieldByName('kod_kekv').value      := cxBEditKekv.Text;
        myform.rxMDProv.FieldByName('kod_sch').value       := cxBEditSch.text;
        myform.rxMDProv.FieldByName('tytle_sch').value     := cxLabel7.Text;
        myform.rxMDProv.FieldByName('tytle_smeta').value   := cxLabel1.text;
        myform.rxMDProv.FieldByName('tytle_razd').value    := Label3.Text;
        myform.rxMDProv.FieldByName('tytle_state').value   := Label4.Text;
        myform.rxMDProv.FieldByName('tytle_kekv').value    := cxLabel8.Text;
        myform.rxMDProv.FieldByName('fio').value           := fio;
        myform.rxMDProv.FieldByName('id_bankcard').value   := id_card;
        myform.rxMDProv.FieldByName('name_bankcard').value := name_card;
        myform.rxMDProv.Post;
        myform.flag_no_show := true;
    end;
    if regim = 2 then
    begin
        myform.flag_no_show := false;
        myform.rxMDProv.Open;
        myform.rxMDProv.Edit;
        myform.rxMDProv.FieldByName('id_man').value        := id_people;
        myform.rxMDProv.FieldByName('id_sch').value        := id_sch;
        myform.rxMDProv.FieldByName('id_smeta').value      := id_smeta;
        myform.rxMDProv.FieldByName('id_razd').value       := id_razd;
        myform.rxMDProv.FieldByName('id_state').value      := id_state;
        myform.rxMDProv.FieldByName('id_kekv').value       := id_kekv;
        myform.rxMDProv.FieldByName('summa').value         := StrToCurr(cxTextEditSumma.Text);
        myform.rxMDProv.FieldByName('id_dog').value        := id_dog;
        myform.rxMDProv.FieldByName('kod_dog').value       := kod_dog;
        myform.rxMDProv.FieldByName('kod_smeta').value     := cxBEditSmeta.Text;
        myform.rxMDProv.FieldByName('kod_razd').value      := cxBEditRazd.text;
        myform.rxMDProv.FieldByName('kod_state').value     := cxBEditState.Text;
        myform.rxMDProv.FieldByName('kod_kekv').value      := cxBEditKekv.Text;
        myform.rxMDProv.FieldByName('kod_sch').value       := cxBEditSch.text;
        myform.rxMDProv.FieldByName('tytle_sch').value     := cxLabel7.Text;
        myform.rxMDProv.FieldByName('tytle_smeta').value   := cxLabel1.text;
        myform.rxMDProv.FieldByName('tytle_razd').value    := Label3.Text;
        myform.rxMDProv.FieldByName('tytle_state').value   := Label4.Text;
        myform.rxMDProv.FieldByName('tytle_kekv').value    := cxLabel8.Text;
        myform.rxMDProv.FieldByName('fio').value           := fio;
        myform.rxMDProv.FieldByName('id_bankcard').value   := id_card;
        myform.rxMDProv.FieldByName('name_bankcard').value := name_card;
        myform.rxMDProv.Post;
        myform.flag_no_show := true;
    end;
    ModalResult := mrOk;
    Close;
end;

procedure TfmUWAddVedomostProv.cxBEditPeoplePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    ResP : Variant;
begin
    ResP := UWLoaderUnit.LoadUVSpBankCardTake(nil, myform.id_user, Db, true);
    if VarArrayDimCount(ResP) > 0 then
    begin
        id_people          := resP[1];
        id_card            := resP[0];
        fio                := VarToStr(resP[2]);
        name_card          := VarToStr(resP[3]);
        cxBEditPeople.Text := VarToStr(resP[2]) + '  ' + VarToStr(resP[3]);
    end;
end;

procedure TfmUWAddVedomostProv.cxBEditSchPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    Res : variant;
begin
    Res := GetSch(nil, DB.Handle, fsNormal, myform.cxDateEdit1.Date, 1, 0, 0);
    if VarArrayDimCount(Res) > 0 then
    begin
        id_sch          := res[0][0];
        cxBEditSch.Text := res[0][3];
        cxLabel7.Text   := res[0][1];
    end;
end;

procedure TfmUWAddVedomostProv.cxBEditSmetaPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    ResSM : Variant;
begin
    ResSM := GlobalSPR.GetSmets(nil, DB.Handle, myform.cxDateEdit1.Date, psmRazdSt);
    if VarArrayDimCount(ResSM) > 0 then
    begin
        if ResSM[0] <> 0 then
        begin
            id_smeta          := resSM[0];
            id_razd           := resSM[1];
            id_state          := resSM[2];
            cxBEditSmeta.Text := resSM[9];
            cxLabel1.Text     := resSM[6];
            cxBEditRazd.Text  := resSM[7];
            Label3.Text       := resSM[4];
            cxBEditState.text := resSM[8];
            Label4.Text       := resSM[5];
        end;
    end;
end;

procedure TfmUWAddVedomostProv.cxBEditKekvPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    ResKekv : Variant;
begin
    ResKekv := GlobalSPR.GetKEKVSpr(nil, DB.Handle, fsNormal, myform.cxDateEdit1.Date, 1);
    if VarArrayDimCount(resKekv) > 0 then
    begin
        if (ResKekv[0][0]<>null) and (ResKekv[0][1]<>null) then
        begin
            id_kekv           := ResKekv[0][0];
            cxBEditKekv.Text  := resKEKV[0][2];
            cxLabel8.Text     := resKekv[0][1];
        end;
    end;
end;

procedure TfmUWAddVedomostProv.cxBEditDogPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    inputDog : TDogInput;
    res   : TDogResult;
begin
    LoadSysData(Tr);
    inputDog                        := SYS_DEFAULT_DOG_INPUT;
    inputDog.Owner                  := self;
    inputDog.DBHandle               := DB.Handle;
    inputDog.WriteTrans             := TrW.Handle;
    inputDog.ReadTrans              := Tr.Handle;
    inputDog.Summa                  := 1;
    inputDog.FormStyle              := fsNormal;
    inputDog.id_Group               := 1399;
    inputDog.id_group_add           := 2599;
    inputDog.filter.bShowFilterForm := true;
    inputDog.filter.DateBeg         := IncDay(myform.cxDateEdit1.Date, -730);
    inputDog.filter.DateEnd         := myform.cxDateEdit1.Date;
    inputDog.filter.bUseFilter      := true;
    inputDog.filter.bDate           := true;
    SYS_ID_USER                     := myform.id_user;
    inputDog.isZayav                := false;
    inputDog.arndGetPay             := 1;
    inputDog.shablon_data.bUse      := true;
    inputDog.shablon_data.num       := 'á\í';
    inputDog.shablon_data.date_dog  := myform.cxDateEdit1.Date;
    inputDog.shablon_data.note      := '';
    inputDog.shablon_data.summa     := 1;
    inputDog.shablon_data.id_rate_account    := 0;
    inputDog.shablon_data.id_rate_acc_native := 0;

    res                  := ShowDogMain(inputDog);
    if res.ModalResult = 1 then
    begin
        id_dog  := res.id_dog;
        kod_dog := res.kod_dog;
{                    name_cust   := VarToStr(res.name_customer);
                    date_dog    := VarToStr(res.d_dog);
                    num_dog     := VarToStr(res.n_dog);
                    r_dog       := VarToStr(res.regest_num);
                    t_dog       := VarToStr(res.name_tip_dog);
                    mm.id_rate  := res.id_rate_acc;
                    mm.id_rate_n   := res.id_rate_acc_nat;
                    mm.id_customer := res.id_customer;
                    id_ra       := res.id_rate_acc_nat;
                    id_r_c      := res.id_rate_acc;
                    id_c        := res.id_customer;
 }
        cxBEditDog.Text :={ Un_R_file_Alex.BANK_TYPE_DOGOVOR+' : ' + }VarToStr(res.name_tip_dog)+'; ¹  '+VarToStr(res.n_dog)+' '+ {Un_R_file_Alex.KASSA_DOC_ORDER_FROM +} ' ' +VarToStr(res.d_dog) + ' ( '+ {Un_R_file_Alex.KASSA_REG_NUM +} VarToStr(res.regest_num)+' ); ' + {Un_R_file_Alex.BANK_NAME_CUSTMERA +} ' : ' + VarToStr(res.name_customer);
    end;
end;

procedure TfmUWAddVedomostProv.LoadCaption;
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

    Caption                              := UWResourcesUnit.VEDOMOST_PROV_CAPTION[index_lang];

    ATake.Caption                        := UWResourcesUnit.MY_CONST_BUTTON_OK[index_lang];
    ATake.Hint                           := 'F10-'        + UWResourcesUnit.MY_CONST_BUTTON_OK[index_lang];
    cxButton1.Caption                    := UWResourcesUnit.MY_CONST_CLOSE[index_lang];
    dxStatusBar1.Panels[0].Text          := 'F10-'        + UWResourcesUnit.MY_CONST_BUTTON_OK[index_lang];
    dxStatusBar1.Panels[1].Text          := 'Esc-'        + UWResourcesUnit.MY_CONST_CLOSE[index_lang];
    dxStatusBar1.Panels[2].Text          := 'Ctrl+Enter-' + UWResourcesUnit.MY_CONST_CHOOSE_SP[index_lang];
    cxLabel2.Caption                     := UWResourcesUnit.SPBANKCARD[index_lang];
    cxLabelSch.Caption                   := UWResourcesUnit.MY_CONST_SCH[index_lang];
    cxLabel4.Caption                     := UWResourcesUnit.MY_CONST_SMETA[index_lang];
    cxLabel10.Caption                    := UWResourcesUnit.MY_CONST_RAZD[index_lang];
    cxLabel11.Caption                    := UWResourcesUnit.MY_CONST_STATE[index_lang];
    cxLabel5.Caption                     := UWResourcesUnit.MY_CONST_KEKV[index_lang];
    cxLabel6.Caption                     := UWResourcesUnit.MY_CONST_SUMMA[index_lang];
    cxLabel3.Caption                     := UWResourcesUnit.MY_CONST_DOGOVOR[index_lang];

end;

procedure TfmUWAddVedomostProv.SelectLangExecute(Sender: TObject);
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

end.
