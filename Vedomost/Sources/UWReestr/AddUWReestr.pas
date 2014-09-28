unit AddUWReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MainUWReestr, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxContainer, cxTextEdit, cxLookAndFeelPainters, StdCtrls, cxButtons,
  RxMemDS, dxStatusBar, ImgList, cxCurrencyEdit, ToolWin, ComCtrls,
  ActnList, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, cxLabel;

type
  TfmAddUWReestr = class(TForm)
    cxTextEdit1: TcxTextEdit;
    cxDateEdit1: TcxDateEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    RxVed: TRxMemoryData;
    DataSource1: TDataSource;
    dxStatusBar1: TdxStatusBar;
    StyleRepository: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    ImageList1: TImageList;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ActionList1: TActionList;
    AAddVed: TAction;
    ADelVed: TAction;
    AZapis: TAction;
    DataB: TpFIBDatabase;
    DSProv: TpFIBDataSet;
    Tr: TpFIBTransaction;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    DataSource2: TDataSource;
    DSProvID_DT_PROV_VEDOMOST: TFIBBCDField;
    DSProvID_DT_VEDOMOST: TFIBBCDField;
    DSProvID_MAN: TFIBBCDField;
    DSProvID_SCH: TFIBBCDField;
    DSProvID_SMETA: TFIBBCDField;
    DSProvID_RAZD: TFIBBCDField;
    DSProvID_STATE: TFIBBCDField;
    DSProvID_KEKV: TFIBBCDField;
    DSProvID_DOG: TFIBBCDField;
    DSProvKOD_DOG: TFIBBCDField;
    DSProvSUMA: TFIBBCDField;
    DSProvID_SP_BANKCARD: TFIBBCDField;
    DSProvFIO: TFIBStringField;
    DSProvSCH_NUMBER: TFIBStringField;
    DSProvSCH_TYTLE: TFIBStringField;
    DSProvSMETA_KOD: TFIBIntegerField;
    DSProvSMETA_TYTLE: TFIBStringField;
    DSProvRAZD_NUM: TFIBIntegerField;
    DSProvRAZD_TYTLE: TFIBStringField;
    DSProvSTATE_KOD: TFIBIntegerField;
    DSProvSTATE_TYTLE: TFIBStringField;
    DSProvKEKV_KOD: TFIBIntegerField;
    DSProvKEKV_TYTLE: TFIBStringField;
    DSProvNUM_DOG: TFIBStringField;
    DSProvDATE_DOG: TFIBDateField;
    DSProvNAME_CUST: TFIBStringField;
    DSProvREG_DOG: TFIBStringField;
    DSProvLIC_BANKCARD: TFIBStringField;
    DSProvCOMENT_NANKCARD: TFIBStringField;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridDBTableView1DBColumn6: TcxGridDBColumn;
    TrW: TpFIBTransaction;
    SProc: TpFIBStoredProc;
    DSUpdateVedom: TpFIBDataSet;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    Selectlang: TAction;
    procedure cxButton1Click(Sender: TObject);
    procedure AAddVedExecute(Sender: TObject);
    procedure RxVedAfterScroll(DataSet: TDataSet);
    procedure ADelVedExecute(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function UpdateVedomost(id_reestr : int64) : boolean;
    procedure AZapisExecute(Sender: TObject);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure SelectlangExecute(Sender: TObject);
    procedure LoadCaption;
  private
    showProv : boolean;
    index_lang : smallint;
  public
    myform : TfmMainUWReestr;
    id_t_ved, id_dog_bankcard, id_rees : int64;
    reg_r : smallint;
    constructor Create(AOwner: TComponent; mform : TfmMainUWReestr; RVed : Variant; id_type_v : int64; reg_reestr : smallint; id_dog : int64); reintroduce; overload;
  end;

implementation
uses UWLoaderUnit,
     Registry,
     UWResourcesUnit;
{$R *.dfm}

{ TfmAddUWReestr }

constructor TfmAddUWReestr.Create(AOwner: TComponent;
  mform: TfmMainUWReestr; RVed: Variant; id_type_v : int64; reg_reestr : smallint; id_dog : int64);
var
    count_rec, i : integer;
    id_v : int64;
begin
    inherited Create(AOwner);

    showProv                  := false;
    id_t_ved                  := id_type_v;
    myform                    := mform;
    reg_r                     := reg_reestr;
    id_dog_bankcard           := id_dog;

    cxDateEdit1.date          := date;
    DataB                     := mform.DB;
    Tr.DefaultDatabase        := DataB;
    DataB.DefaultTransaction  := Tr;

    DSProv.database           := DataB;
    DSProv.Transaction        := Tr;

    Tr.StartTransaction;

    if reg_r = 1 then
    begin
        count_rec := VarArrayHighBound(RVed, 1)-VarArrayLowBound(RVed, 1);
        for i := 0 to count_rec do
        begin
            RxVed.Open;
            RxVed.Insert;
            RxVed.FieldByName('id_ved').Value         := RVed[i][0];
            RxVed.FieldByName('id').Value             := i;
            RxVed.FieldByName('num_ved').Value        := RVed[i][1];
            RxVed.FieldByName('date_ved').Value       := RVed[i][2];
            RxVed.FieldByName('name_ved').Value       := RVed[i][4];
            RxVed.FieldByName('id_sp_type_ved').Value := RVed[i][3];
            RxVed.FieldByName('s').Value              := RVed[i][5];
            RxVed.Post;
        end;
    end;
    if reg_r = 2 then
    begin
        cxTextEdit1.Text := myform.DSReestr.fbn('NUMBER_REESTR').AsString;
        cxDateEdit1.Date := myform.DSReestr.fbn('DATE_REESTR').AsDateTime;
        id_rees          := StrToInt64(myform.DSReestr.fbn('ID_DT_UW_REESTR').AsString);
        myform.DSVed.First;
        i := 0;
        while not myform.DSVed.Eof do
        begin
            RxVed.Open;
            RxVed.Insert;
            RxVed.FieldByName('id_ved').Value         := strToint64(myform.DSVed.fbn('ID_DT_VEDOM').AsString);
            RxVed.FieldByName('id').Value             := i+i;
            RxVed.FieldByName('num_ved').Value        := myform.DSVed.fbn('NUMBER_VEDOM').AsString;
            RxVed.FieldByName('date_ved').Value       := myform.DSVed.fbn('DATE_VEDOM').AsDateTime;
            RxVed.FieldByName('name_ved').Value       := '';//myform.DSVed.fbn('').AsString;
            RxVed.FieldByName('id_sp_type_ved').Value := strToint64(myform.DSVed.fbn('ID_SP_TYPE_VEDOM').AsString);
            RxVed.FieldByName('s').Value              := myform.DSVed.fbn('SUM_VEDOMOST').AsCurrency;
            RxVed.Post;
//            ID_DOG
            myform.DSVed.Next;
        end;

    end;

    id_v := RxVed.FieldByName('id_ved').value;
    DSProv.Close;
    DSProv.sqls.SelectSql.Text := 'Select * from UW_DT_PROV_VEDOMOST_SELECT('+IntToStr(id_v)+')';
    DSProv.open;

    LoadCaption;
    showProv := true;
end;

procedure TfmAddUWReestr.cxButton1Click(Sender: TObject);
begin
    Close;
end;

procedure TfmAddUWReestr.AAddVedExecute(Sender: TObject);
var
    R : Variant;
    count_rec, i : integer;
    ved_exist : boolean;
begin
    showProv := false;
    R := UWLoaderUnit.LoadVedomostSelectPoDog(Self, DataB, myform.id_user, id_t_ved, id_dog_bankcard);
    if VarArrayDimCount(R) > 0 then
    begin
        count_rec := VarArrayHighBound(R, 1)-VarArrayLowBound(R, 1);
        for i := 0 to count_rec do
        begin
            ved_exist := false;
            RxVed.First;
            while not RxVed.Eof do
            begin
                if RxVed.FieldByName('id_ved').AsString = VartoStr(R[i][0]) then
                begin
                    ved_exist := true;
                    Break;
                end;
                RxVed.Next;
            end;
            if not ved_exist then
            begin
                RxVed.Open;
                RxVed.Insert;
                RxVed.FieldByName('id_ved').Value         := R[i][0];
                RxVed.FieldByName('id').Value             := i;
                RxVed.FieldByName('num_ved').Value        := R[i][1];
                RxVed.FieldByName('date_ved').Value       := R[i][2];
                RxVed.FieldByName('name_ved').Value       := R[i][4];
                RxVed.FieldByName('id_sp_type_ved').Value := R[i][3];
                RxVed.FieldByName('s').Value              := R[i][5];
                RxVed.Post;
            end;
        end;
    end;
    showProv := true;
end;

procedure TfmAddUWReestr.RxVedAfterScroll(DataSet: TDataSet);
var
    id_v : int64;
begin
    if showProv then
    begin
        id_v := RxVed.FieldByName('id_ved').value;
        DSProv.Close;
        DSProv.sqls.SelectSql.Text := 'Select * from UW_DT_PROV_VEDOMOST_SELECT('+IntToStr(id_v)+')';
        DSProv.open;
    end;
end;

procedure TfmAddUWReestr.ADelVedExecute(Sender: TObject);
var
    i, j : integer;
    s : string;
begin
    showProv := false;
    if not RxVed.IsEmpty then
    begin
        s := UWResourcesUnit.MY_CONST_MESSAGE_WARNING[index_lang];
        if MessageBox(Handle, PChar(UWResourcesUnit.VEDOMOST_DELETE[index_lang] + '¹ ' + RxVed.FieldByName('num_ved').AsString+ '?'), Pchar(s), MB_YESNO)=mrYes then
        begin
            j := RxVed.FieldByName('id').AsInteger;
            cxGrid1DBTableView1.Controller.GoToPrev(false);
            i := RxVed.FieldByName('id').AsInteger;
            RxVed.Locate('id', j, [] );
            RxVed.Delete;
            RxVed.Locate('id', i, [] );
            if RxVed.IsEmpty then DSProv.Close;
        end;
    end;
    showProv := true;
end;

procedure TfmAddUWReestr.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = VK_DELETE then ADelVedExecute(Sender);
end;

procedure TfmAddUWReestr.AZapisExecute(Sender: TObject);
var
    id_reest : int64;
begin
    showProv := false;
    if RxVed.IsEmpty then
    begin
        Showmessage(UWResourcesUnit.VEDOMOST_REESTR_DONT_ZAPIS_E_V[index_lang]);
        Exit;
    end;

    id_reest                    := -1;
    TrW.DefaultDatabase         := DataB;
    SProc.Database              := DataB;
    SProc.Transaction           := TrW;

    DSUpdateVedom.Database      := DataB;
    DSUpdateVedom.Transaction   := TrW;

    TrW.StartTransaction;
    try
        if reg_r = 1 then
        begin
            DSUpdateVedom.Close;
            DSUpdateVedom.SQLs.SelectSQL.Text := 'select * from UW_DT_REESTR_INSERT('''+DateToStr(cxDateEdit1.Date)+''', '''+cxTextEdit1.Text+''', '+IntToStr(-1)+', '+IntToStr(id_dog_bankcard)+', '+IntToStr(myform.id_user)+')';
            DSUpdateVedom.Open;
            id_reest := strToInt64(DSUpdateVedom.FieldByName('ID_DT_UW_REESTR').AsString);
            DSUpdateVedom.Close;

            if not UpdateVedomost(id_reest) then
            begin
                exit;
            end;
        end;
        if reg_r = 2 then
        begin
            DSUpdateVedom.Close;
            DSUpdateVedom.SQLs.SelectSQL.Text := 'select * from UW_DT_REESTR_DELETE('+InttoStr(id_rees)+', '+IntToStr(myform.id_user)+')';
            DSUpdateVedom.Open;
            if DSUpdateVedom.fbn('RES_VALUE').AsInteger = 0 then
            begin
                DSUpdateVedom.Close;
                DSUpdateVedom.SQLs.SelectSQL.Text := 'select * from UW_DT_REESTR_INSERT('''+DateToStr(cxDateEdit1.Date)+''', '''+cxTextEdit1.Text+''', '+IntToStr(-1)+', '+IntToStr(id_dog_bankcard)+', '+IntToStr(myform.id_user)+')';
                DSUpdateVedom.Open;
                id_reest := strToInt64(DSUpdateVedom.FieldByName('ID_DT_UW_REESTR').AsString);
                DSUpdateVedom.Close;

                if not UpdateVedomost(id_reest) then
                begin
                    exit;
                end;
            end else
            begin
                TrW.Rollback;
                showmessage(UWResourcesUnit.VEDOMOST_REESTR_DONT_UPDATE[index_lang]);
                Exit;
            end;
        end;
        TrW.Commit;
    except on E:Exception do begin
        TrW.Rollback;
        ShowMessage(E.Message);
    end;
    end;
    myform.ARefreshExecute(self);
    myform.DSReestr.Locate('ID_DT_UW_REESTR', id_reest, []);

    showProv := true;
    close;
end;

Function TfmAddUWReestr.UpdateVedomost(id_reestr : int64) : boolean;
var
    id_vee : int64;
begin
    RxVed.First;
    while not RxVed.Eof do
    begin
        id_vee := RxVed.FieldByname('id_ved').Value;
        DSUpdateVedom.Close;
        DSUpdateVedom.SQLs.SelectSQL.Text := 'select * from UW_DT_VEDOMOST_UPDATE_REESTR('+IntToStr(id_vee)+', '+IntToStr(id_reestr)+', '+IntToStr(myform.id_user)+')';
        DSUpdateVedom.Open;
        if DSUpdateVedom.FieldByName('RES_VALUE').AsInteger = 1 then
        begin
            TrW.Rollback;
            ShowMessage(UWResourcesUnit.VEDOMOST_EDIT_NOMBER[index_lang] + ' ' + RxVed.FieldByName('num_ved').AsString + UWResourcesUnit.VEDOMOST_REESTR_INTO_BUH[index_lang]);
            Result := false;
            exit;
        end;
        if DSUpdateVedom.FieldByName('RES_VALUE').AsInteger = 2 then
        begin
            TrW.Rollback;
            ShowMessage(UWResourcesUnit.VEDOMOST_EDIT_NOMBER[index_lang] + ' ' + RxVed.FieldByName('num_ved').AsString + UWResourcesUnit.VEDOMOST_REESTR_INTO_OTHER_R[index_lang]);
            Result := false;
            exit;
        end;

        RxVed.Next;
    end;
    Result := true;
end;

procedure TfmAddUWReestr.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> VK_DELETE)
    then
        Key := Chr(0);
end;

procedure TfmAddUWReestr.SelectlangExecute(Sender: TObject);
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

procedure TfmAddUWReestr.LoadCaption;
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

    Caption                              := UWResourcesUnit.VEDOMOST_REESTR_N[index_lang];
    cxLabel1.Caption                     := UWResourcesUnit.VEDOMOST_REESTR_N[index_lang];
    cxLabel2.Caption                     := UWResourcesUnit.VEDOMOST_REESTR_VID[index_lang];
    dxStatusBar1.Panels[0].Text          := 'Ins-'    + UWResourcesUnit.MY_CONST_ADD[index_lang];
    dxStatusBar1.Panels[1].Text          := 'Del-'    + UWResourcesUnit.MY_CONST_DELETE[index_lang];
    dxStatusBar1.Panels[2].Text          := 'F10-'    + UWResourcesUnit.MY_CONST_BUTTON_OK[index_lang];
    dxStatusBar1.Panels[3].Text          := 'Esc-'    + UWResourcesUnit.MY_CONST_BUTTON_CANCEL[index_lang];

    ToolButton1.Hint                     := 'Ins-'    + UWResourcesUnit.MY_CONST_ADD[index_lang];
    ToolButton2.Hint                     := 'Del-'    + UWResourcesUnit.MY_CONST_DELETE[index_lang];
    cxButton2.Hint                       := 'F10-'    + UWResourcesUnit.MY_CONST_BUTTON_OK[index_lang];
    cxButton1.Hint                       := 'Esc-'    + UWResourcesUnit.MY_CONST_BUTTON_CANCEL[index_lang];
    ToolButton1.Caption                  := UWResourcesUnit.MY_CONST_ADD[index_lang];
    ToolButton2.Caption                  := UWResourcesUnit.MY_CONST_DELETE[index_lang];
    cxButton2.Caption                    := UWResourcesUnit.MY_CONST_BUTTON_OK[index_lang];
    cxButton1.Caption                    := UWResourcesUnit.MY_CONST_BUTTON_CANCEL[index_lang];
    cxGrid1DBTableView1DBColumn1.Caption := UWResourcesUnit.VEDOMOST_NOMBER_VEDOM[index_lang];
    cxGrid1DBTableView1DBColumn2.Caption := UWResourcesUnit.SPBANKCARD_DOG_DATE[index_lang];
    cxGrid1DBTableView1DBColumn4.Caption := UWResourcesUnit.MY_CONST_SUMMA[index_lang];

    cxGridDBTableView1DBColumn1.Caption  := UWResourcesUnit.MY_CONST_FIO[index_lang];
    cxGridDBTableView1DBColumn2.Caption  := UWResourcesUnit.MY_CONST_SMETA[index_lang];
    cxGridDBTableView1DBColumn3.Caption  := UWResourcesUnit.MY_CONST_RAZD[index_lang];
    cxGridDBTableView1DBColumn4.Caption  := UWResourcesUnit.MY_CONST_STATE[index_lang];
    cxGridDBTableView1DBColumn5.Caption  := UWResourcesUnit.MY_CONST_KEKV[index_lang];
    cxGridDBTableView1DBColumn6.Caption  := UWResourcesUnit.MY_CONST_SUMMA[index_lang];

end;

end.
