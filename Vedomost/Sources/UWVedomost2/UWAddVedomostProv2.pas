unit UWAddVedomostProv2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxMRUEdit, cxControls,
  cxContainer, cxEdit, cxLabel, cxButtonEdit, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxGraphics, dxStatusBar, UWAddVedomost2, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, ActnList, Menus, AArray,
  FIBQuery, pFIBQuery, pFIBStoredProc, cxCalendar;

type
  TfmUWAddVedomostProv2 = class(TForm)
    cxLabelSch: TcxLabel;
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
    PopupMenu1: TPopupMenu;
    cxBEditRazd: TcxTextEdit;
    cxBEditState: TcxTextEdit;
    St: TpFIBStoredProc;
    DS: TpFIBDataSet;
    cxLabel7: TcxLabel;
    cxTextOrder: TcxTextEdit;
    cxLabel9: TcxLabel;
    cxDateOrder: TcxDateEdit;
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
    procedure cxBEditSmetaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Select_budg;
    procedure Select_Razd;
    procedure Select_State;
    procedure Select_Kekz;
    procedure cxBEditRazdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxBEditStateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxBEditKekvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxBEditSmetaExit(Sender: TObject);
    procedure cxBEditRazdExit(Sender: TObject);
    procedure cxBEditStateExit(Sender: TObject);
    procedure cxBEditKekvExit(Sender: TObject);
    procedure cxBEditSmetaKeyPress(Sender: TObject; var Key: Char);
    procedure cxBEditRazdKeyPress(Sender: TObject; var Key: Char);
    procedure cxBEditStateKeyPress(Sender: TObject; var Key: Char);
    procedure cxBEditKekvKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditSummaExit(Sender: TObject);
  private
    myform : TfmUWAddVedomost2;
    regim, index_lang : smallint;
    fio, name_card, old_kod_smet, new_razd, old_razd, date_beg_str : string;
    id_type_viplat, id_razd, id_smeta, id_state, id_kekv, id_people, id_card, id_dog, kod_dog, id_bank_dog : int64;
    date_beg, date_end : tdate;
  public
    constructor C1 (AO : TComponent; mform : TfmUWAddVedomost2; reg : smallint); reintroduce; overload;
  end;

function VedomProv (AO : TComponent; mform : TfmUWAddVedomost2; reg : smallint) : boolean;

implementation
uses GlobalSPR,
     UWLoaderUnit,
     DogLoaderUnit,
     DateUtils,
     Registry,
     UWResourcesUnit,
     Un_lo_file_Alex,
     Un_R_file_Alex,
     Un_func_file_Alex;

{$R *.dfm}

function VedomProv (AO : TComponent; mform : TfmUWAddVedomost2; reg : smallint) : boolean;
var
    T : TfmUWAddVedomostProv2;
    ResSM, ResKekv, ResP : variant;
    InputParam : TAArray;
begin
    T := TfmUWAddVedomostProv2.C1(AO, mform, reg);
    T.old_razd := '';
    if reg = 1 then
    begin
        resP := Un_lo_file_Alex.NEW_GMEx(nil, T.DB.Handle, False, true);
        if VarArrayDimCount(resP) > 0 then
        begin
//        if (resP[0]<>null){ and (res[1]<>null) }then
//        begin
            try T.id_card := resP[11][0]; except begin showmessage('У цієї людини не існує банківської картки'); Result := false; exit; end; end;
            T.id_people            := resP[0];
            T.id_bank_dog          := resP[11][0];
            T.cxBEditPeople.Text   := resP[1];//укр
//            T.id_people          := resP[1];
            T.id_card            := resP[11][12];
            T.fio                := VarToStr(resP[1]);
            T.name_card          := ' ';
            if mform.rxMDProv.IsEmpty then
            begin
                InputParam                                      := TAArray.Create;
                InputParam['Name_Bpl'].AsString                 := 'UWspTypeViplat.bpl';
                InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(T.DB.Handle);
                InputParam['Input']['aFrmStyle'].AsVariant      := fsNormal;
                UWLoaderUnit.ShowAllUwBpl(nil, InputParam);
                T.id_type_viplat          := InputParam['OutPut']['ID_SP_TYPE_VIPLAT'].AsInt64;
                if T.id_type_viplat <> -1 then
                begin
                    T.cxBEditSch.Text := InputParam['OutPut']['NAME_TYPE'].AsString;
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
                                T.old_razd          := resSM[7];
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
                T.id_type_viplat       := mform.rxMDProv.FieldByName('id_sch').value;
                T.id_smeta             := mform.rxMDProv.FieldByName('id_smeta').value;
                T.id_razd              := mform.rxMDProv.FieldByName('id_razd').value;
                T.id_state             := mform.rxMDProv.FieldByName('id_state').value;
                T.id_kekv              := mform.rxMDProv.FieldByName('id_kekv').value;
//                T.cxTextEditSumma.Text := mform.rxMDProv.FieldByName('summa').AsString;
                T.cxTextEditSumma.Text := '0,00';

//                T.id_dog               := mform.rxMDProv.FieldByName('id_dog').value;
//                T.kod_dog              := mform.rxMDProv.FieldByName('kod_dog').value;
                T.cxBEditSmeta.Text    := mform.rxMDProv.FieldByName('kod_smeta').value;
                T.cxBEditRazd.text     := mform.rxMDProv.FieldByName('kod_razd').value;
                T.old_razd             := mform.rxMDProv.FieldByName('kod_razd').value;
                T.cxBEditState.Text    := mform.rxMDProv.FieldByName('kod_state').value;
                T.cxBEditKekv.Text     := mform.rxMDProv.FieldByName('kod_kekv').value;
                T.cxBEditSch.text      := mform.rxMDProv.FieldByName('kod_sch').value;
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
        T.cxBEditRazd.TabOrder     := 7;
        T.cxBEditState.TabOrder    := 8;
        T.cxBEditKekv.TabOrder     := 9;
    end;

    if reg = 2 then
    begin
        T.id_people            := mform.rxMDProv.FieldByName('id_man').value;
        T.id_bank_dog          := mform.rxMDProv.FieldByName('id_bank_dog').value;
        T.id_type_viplat       := mform.rxMDProv.FieldByName('id_sch').value;
        T.id_smeta             := mform.rxMDProv.FieldByName('id_smeta').value;
        T.id_razd              := mform.rxMDProv.FieldByName('id_razd').value;
        T.id_state             := mform.rxMDProv.FieldByName('id_state').value;
        T.id_kekv              := mform.rxMDProv.FieldByName('id_kekv').value;
        T.cxTextEditSumma.Text := mform.rxMDProv.FieldByName('summa').AsString;
//        T.id_dog               := mform.rxMDProv.FieldByName('id_dog').value;
//        T.kod_dog              := mform.rxMDProv.FieldByName('kod_dog').value;
        T.cxBEditSmeta.Text    := mform.rxMDProv.FieldByName('kod_smeta').value;
        T.cxBEditRazd.text     := mform.rxMDProv.FieldByName('kod_razd').value;
        T.old_razd             := mform.rxMDProv.FieldByName('kod_razd').value;
        T.cxBEditState.Text    := mform.rxMDProv.FieldByName('kod_state').value;
        T.cxBEditKekv.Text     := mform.rxMDProv.FieldByName('kod_kekv').value;
        T.cxBEditSch.text      := mform.rxMDProv.FieldByName('kod_sch').AsString;
        T.cxLabel1.text        := mform.rxMDProv.FieldByName('tytle_smeta').value;
        T.Label3.Text          := mform.rxMDProv.FieldByName('tytle_razd').value;
        T.Label4.Text          := mform.rxMDProv.FieldByName('tytle_state').value;
        T.cxLabel8.Text        := mform.rxMDProv.FieldByName('tytle_kekv').value;
        T.fio                  := mform.rxMDProv.FieldByName('fio').value;
        T.id_card              := mform.rxMDProv.FieldByName('id_bankcard').value;
        T.name_card            := mform.rxMDProv.FieldByName('name_bankcard').value;
        T.cxTextOrder.Text     := mform.rxMDProv.FieldByName('NumOrder').value;
        T.cxDateOrder.Date     := mform.rxMDProv.FieldByName('DateOrder').value;
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

constructor TfmUWAddVedomostProv2.C1(AO: TComponent; mform: TfmUWAddVedomost2; reg: smallint);
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

    DS.Database            := DB;
    DS.Transaction         := Tr;

    Tr.StartTransaction;

    LoadCaption;
    cxTextOrder.Text       := ' ';
    cxDateOrder.Date       := date;

    if MonthOf(myform.cxDateEdit1.Date) < 10
        then date_beg_str := '01.'+'0'+ IntToStr(MonthOf(myform.cxDateEdit1.Date)) + '.'+ IntToStr(YearOf(myform.cxDateEdit1.Date))
        else date_beg_str := '01.'+ IntToStr(MonthOf(myform.cxDateEdit1.Date)) + '.' + IntToStr(YearOf(myform.cxDateEdit1.Date));
    date_beg := strtodate(date_beg_str);
    date_end := IncMonth(StrToDate(date_beg_str),1);
    date_end := IncDay(date_end,-1);

end;

procedure TfmUWAddVedomostProv2.cxTextEditSummaKeyPress(Sender: TObject;
  var Key: Char);
begin
//    if Ord(Key) = VK_TAB then exit;
    if Ord(Key) = VK_RETURN then begin cxButton2.SetFocus; exit; end;
    if Ord(Key) <> VK_TAB then
    begin
        cxTextEditSumma.ClearSelection;
    end;
 
    if Key = '.' then Key := DecimalSeparator;

    if (Key = '-') {and (Length(cxTextEditSumma.Text)>0)}
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

procedure TfmUWAddVedomostProv2.cxButton1Click(Sender: TObject);
begin
    Close;
end;

procedure TfmUWAddVedomostProv2.ATakeExecute(Sender: TObject);
var
    s : Currency;
begin
    if id_people <= 0 then
    begin
        showmessage(UWResourcesUnit.VEDOMOST_PROV_DONT_PEOPL[index_lang]);
        cxBEditPeople.SetFocus;
        Exit;
    end;
    if id_type_viplat <= 0 then
    begin
        showmessage(UWResourcesUnit.V2_TYPE_NAME_NOT_TAKE[index_lang]);
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
    if cxTextOrder.Text = ' ' then  cxTextOrder.Text := '-';
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
        myform.rxMDProv.FieldByName('id_bank_dog').value   := id_bank_dog;
        myform.rxMDProv.FieldByName('id_sch').value        := id_type_viplat;
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
        myform.rxMDProv.FieldByName('tytle_smeta').value   := cxLabel1.text;
        myform.rxMDProv.FieldByName('tytle_razd').value    := Label3.Text;
        myform.rxMDProv.FieldByName('tytle_state').value   := Label4.Text;
        myform.rxMDProv.FieldByName('tytle_kekv').value    := cxLabel8.Text;
        myform.rxMDProv.FieldByName('fio').value           := fio;
        myform.rxMDProv.FieldByName('id_bankcard').value   := id_card;
        myform.rxMDProv.FieldByName('name_bankcard').value := name_card;
        myform.rxMDProv.FieldByName('NumOrder').value      := cxTextOrder.Text;
        myform.rxMDProv.FieldByName('DateOrder').value     := cxDateOrder.Date;
        myform.rxMDProv.Post;
        myform.flag_no_show := true;
    end;
    if regim = 2 then
    begin
        myform.flag_no_show := false;
        myform.rxMDProv.Open;
        myform.rxMDProv.Edit;
        myform.rxMDProv.FieldByName('id_man').value        := id_people;
        myform.rxMDProv.FieldByName('id_bank_dog').value   := id_bank_dog;
        myform.rxMDProv.FieldByName('id_sch').value        := id_type_viplat;
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
        myform.rxMDProv.FieldByName('tytle_smeta').value   := cxLabel1.text;
        myform.rxMDProv.FieldByName('tytle_razd').value    := Label3.Text;
        myform.rxMDProv.FieldByName('tytle_state').value   := Label4.Text;
        myform.rxMDProv.FieldByName('tytle_kekv').value    := cxLabel8.Text;
        myform.rxMDProv.FieldByName('fio').value           := fio;
        myform.rxMDProv.FieldByName('id_bankcard').value   := id_card;
        myform.rxMDProv.FieldByName('name_bankcard').value := name_card;
        myform.rxMDProv.FieldByName('NumOrder').value      := cxTextOrder.Text;
        myform.rxMDProv.FieldByName('DateOrder').value     := cxDateOrder.Date;
        myform.rxMDProv.Post;
        myform.flag_no_show := true;
    end;
    ModalResult := mrOk;
    Close;
end;

procedure TfmUWAddVedomostProv2.cxBEditPeoplePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    ResP : Variant;
begin
{    ResP := UWLoaderUnit.LoadUVSpBankCardTake(nil, myform.id_user, Db, true);
    if VarArrayDimCount(ResP) > 0 then
    begin
        id_people          := resP[1];
        id_card            := resP[0];
        fio                := VarToStr(resP[2]);
        name_card          := VarToStr(resP[3]);
        cxBEditPeople.Text := VarToStr(resP[2]) + '  ' + VarToStr(resP[3]);
    end;}
    resP := Un_lo_file_Alex.NEW_GMEx(self, DB.Handle, False, true, id_people);
    if VarArrayDimCount(resP) > 0 then
    begin
        if (resP[0]<>null){ and (res[1]<>null) }then
        begin
            try id_card := resP[11][12]; except begin showmessage('У цієї людини не існує банківської картки'); exit; end; end;
            id_people            := resP[0];
            id_bank_dog          := resP[11][0];
            cxBEditPeople.Text   := resP[1];//укр
            fio                  := VarToStr(resP[1]);
            name_card            := ' ';
        end;
    end;
end;

procedure TfmUWAddVedomostProv2.cxBEditSchPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UWspTypeViplat.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(DB.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant      := fsNormal;
    UWLoaderUnit.ShowAllUwBpl(self, InputParam);
    id_type_viplat          := InputParam['OutPut']['ID_SP_TYPE_VIPLAT'].AsInt64;
    if id_type_viplat <> -1 then
    begin
        cxBEditSch.Text := InputParam['OutPut']['NAME_TYPE'].AsString;
    end;
    InputParam.Free;
end;

procedure TfmUWAddVedomostProv2.cxBEditSmetaPropertiesButtonClick(
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

procedure TfmUWAddVedomostProv2.cxBEditKekvPropertiesButtonClick(
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

procedure TfmUWAddVedomostProv2.cxBEditDogPropertiesButtonClick(
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
    inputDog.shablon_data.num       := 'б\н';
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
        cxBEditDog.Text :={ Un_R_file_Alex.BANK_TYPE_DOGOVOR+' : ' + }VarToStr(res.name_tip_dog)+'; №  '+VarToStr(res.n_dog)+' '+ {Un_R_file_Alex.KASSA_DOC_ORDER_FROM +} ' ' +VarToStr(res.d_dog) + ' ( '+ {Un_R_file_Alex.KASSA_REG_NUM +} VarToStr(res.regest_num)+' ); ' + {Un_R_file_Alex.BANK_NAME_CUSTMERA +} ' : ' + VarToStr(res.name_customer);
    end;
end;

procedure TfmUWAddVedomostProv2.LoadCaption;
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
    //cxLabel2.Caption                     := UWResourcesUnit.V2_VEDOMOST_DOGOVOR[index_lang];
    cxLabelSch.Caption                   := UWResourcesUnit.V2_TYPE_NAME_TAKE[index_lang];
    cxLabel4.Caption                     := UWResourcesUnit.MY_CONST_SMETA[index_lang];
    cxLabel10.Caption                    := UWResourcesUnit.MY_CONST_RAZD[index_lang];
    cxLabel11.Caption                    := UWResourcesUnit.MY_CONST_STATE[index_lang];
    cxLabel5.Caption                     := UWResourcesUnit.MY_CONST_KEKV[index_lang];
    cxLabel6.Caption                     := UWResourcesUnit.MY_CONST_SUMMA[index_lang];
    cxLabel3.Caption                     := UWResourcesUnit.MY_CONST_DOGOVOR[index_lang];

end;

procedure TfmUWAddVedomostProv2.SelectLangExecute(Sender: TObject);
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

procedure TfmUWAddVedomostProv2.cxBEditSmetaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = vk_return then
    begin
//        Select_budg;
        cxBEditRazd.SetFocus;
    end;
end;

procedure TfmUWAddVedomostProv2.Select_budg;
begin
    if  trim(cxBEditSmeta.Text) <> '' then
    begin
        TrW.DefaultDatabase                 := DB;
        St.Database                         := DB;
        St.Transaction                      := TrW;
        TrW.StartTransaction;
        St.StoredProcName                   := 'PUB_GET_NAME_BUDG_BY_KOD';
        St.Prepare;
        St.ParamByName('NUM_OBJECT').Value  := cxBEditSmeta.Text;
        St.ParamByName('ACTUAL_DATE').Value := myform.cxDateEdit1.Date;
        St.ParamByName('TYPE_OBJECT').Value := 1;
        try
            St.ExecProc;
            try cxLabel1.Text := St.FieldByName('TITLE_OBJECT').AsString; except end;
            try id_smeta      := StrToInt64(St.FieldByName('ID_OBJECT').AsString); except end;
            old_kod_smet  := cxBEditSmeta.Text;
        except  on e:Exception do
        begin
            ShowMessage(e.Message + #13 + 'Не існує такого бюджету');
            TrW.Rollback;
            Exit;
        end;
        end;
        TrW.Commit;
//        name_smet := St.FieldByName('TITLE_OBJECT').AsString;
    end;
end;

procedure TfmUWAddVedomostProv2.Select_Razd;
begin
    if Trim(cxBEditRazd.Text) <> '' then
    begin
 //если меняется раздел, то меняется и статья
        new_razd := cxBEditRazd.Text;
        if new_razd=old_razd then Exit else Select_State;
        TrW.DefaultDatabase                 := DB;
        St.Database                         := DB;
        St.Transaction                      := TrW;
        TrW.StartTransaction;
        St.StoredProcName                   := 'PUB_GET_NAME_BUDG_BY_KOD';
        St.Prepare;
        St.ParamByName('NUM_OBJECT').Value  := cxBEditRazd.Text;
        St.ParamByName('ACTUAL_DATE').Value := myform.cxDateEdit1.Date;
        St.ParamByName('TYPE_OBJECT').Value := 2;
        try
            St.ExecProc;
            try Label3.Text      := St.FieldByName('TITLE_OBJECT').AsString; except end;
            try id_razd          := StrToint64(St.FieldByName('ID_OBJECT').AsString); except end;
        except on e:Exception do
        begin
            ShowMessage(e.Message + #13 + 'Не існує такого розілу');
            TrW.Rollback;
            Exit;
        end;
        end;
        TrW.Commit;
//        name_razd        := St.FieldByName('TITLE_OBJECT').AsString;
//        nomer_razd       := cxBEditRazd.Text;
        old_razd         := cxBEditRazd.Text;
    end else
        showmessage('Введіть розділ!');
end;

procedure TfmUWAddVedomostProv2.cxBEditRazdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = vk_return then
    begin
//        Select_Razd;
        cxBEditState.SetFocus;
    end;
end;

procedure TfmUWAddVedomostProv2.Select_State;
var
    datestr : string;
begin
    if Trim(cxBEditState.Text) <> '' then
    begin
        if Trim(cxBEditRazd.Text)='' then begin
        ShowMessage('Виберіть розділ');
        cxBEditRazd.SetFocus;
        Exit;
    end;
    datestr := DateTostr(myform.cxDateEdit1.Date);
    DS.Close;
    DS.SQLs.SelectSQL.Text := 'select * from pub_get_name_st_by_kod('''+cxBEditRazd.Text+''', '''+cxBEditState.Text+''', '''+datestr+''')';
    DS.Open;
    try
        id_state    := StrToInt64(DS.FieldByName('ID_ST').AsString);
        Label4.Text := DS.FieldByName('TITLE_ST').AsString;
    except
    begin
        id_state    := -1;
        Label4.Text := '';
        showmessage('Не існує такої статті під розділом!');
//        cxBEditState.SetFocus;
    end;
    end;
    DS.Close;
//    nomer_stat := StrToInt(cxMaskEdit_n_stat.Text);
    end;
end;

procedure TfmUWAddVedomostProv2.cxBEditStateKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = vk_return then
    begin
//        Select_State;
        cxBEditKekv.SetFocus;
    end;
end;

procedure TfmUWAddVedomostProv2.cxBEditKekvKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = vk_return then
    begin
//        Select_Kekz;
        cxTextEditSumma.SetFocus;
    end;
end;

procedure TfmUWAddVedomostProv2.Select_Kekz;
begin
    if Trim(cxBEditKekv.Text) <> '' then
    begin
        TrW.DefaultDatabase                 := DB;
        St.Database                         := DB;
        St.Transaction                      := TrW;
        TrW.StartTransaction;
        St.StoredProcName                   := 'PUB_SPR_KEKV_INFO_EX2';
        St.Prepare;
        St.ParamByName('NUM_KEKV').Value    := cxBEditKekv.Text;
        St.ParamByName('ACTUAL_DATE').Value := myform.cxDateEdit1.Date;
        try
            St.ExecProc;
            try cxLabel8.Text := St.FieldByName('KEKV_TITLE').AsString; except end;
            try id_kekv       := St.FieldByName('ID_KEKV').AsInteger; except end;
        except  on e:Exception do
        begin
            ShowMessage(e.Message + #13 + 'Не існує такого КЕКЗу');
            TrW.Rollback;
            Exit;
          end;
        end;
        TrW.Commit;
//        kod_kekv      := StrToInt(cxMaskEdit_kekv.Text);
//        name_kekv     := pFIBStoredProc.FieldByName('KEKV_TITLE').AsString;
{        if Trim(cxButtonEdit_name_kekv.Text) = '' then
        begin
            cxButtonEdit_name_kekvPropertiesButtonClick(Self,-1);
        end;}
    end;
end;

procedure TfmUWAddVedomostProv2.cxBEditSmetaExit(Sender: TObject);
begin
    Select_budg;
end;

procedure TfmUWAddVedomostProv2.cxBEditRazdExit(Sender: TObject);
begin
    Select_Razd;
end;

procedure TfmUWAddVedomostProv2.cxBEditStateExit(Sender: TObject);
begin
    Select_State;
end;

procedure TfmUWAddVedomostProv2.cxBEditKekvExit(Sender: TObject);
begin
    Select_Kekz;
end;

procedure TfmUWAddVedomostProv2.cxBEditSmetaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    key := #0;
end;

procedure TfmUWAddVedomostProv2.cxBEditRazdKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    key := #0;
end;

procedure TfmUWAddVedomostProv2.cxBEditStateKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    key := #0;
end;

procedure TfmUWAddVedomostProv2.cxBEditKekvKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    key := #0;
end;

procedure TfmUWAddVedomostProv2.cxTextEditSummaExit(Sender: TObject);
var
    pr : integer;
begin
    pr := 1;
    cxTextEditSumma.Text := AddNol(cxTextEditSumma.Text, pr);
    if pr = -1 then
    begin
        ShowMessage(Un_R_file_Alex.MY_ERROR_SUMMA_LENGTH);
    end;
    if cxTextEditSumma.Text = '' then
        cxTextEditSumma.Text := '0,00';
end;

end.
