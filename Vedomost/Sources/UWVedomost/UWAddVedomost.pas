unit UWAddVedomost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxButtonEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxControls, cxContainer, cxEdit, cxTextEdit, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ComCtrls, ToolWin, ActnList,
  ImgList, dxStatusBar, RxMemDS, cxCurrencyEdit, UWMainVedomost;

type
  TfmUWAddVedomost = class(TForm)
    cxTextEdit1: TcxTextEdit;
    cxDateEdit1: TcxDateEdit;
    cxButtonEdit1: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    Database: TpFIBDatabase;
    DSAddVedom: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    SProc: TpFIBStoredProc;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
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
    ActionList1: TActionList;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    AExit: TAction;
    AAddVedomost: TAction;
    SelectLang: TAction;
    dxStatusBar1: TdxStatusBar;
    rxMDProv: TRxMemoryData;
    DataSource1: TDataSource;
    TrW: TpFIBTransaction;
    DS: TpFIBDataSet;
    cxLabel4: TcxLabel;
    cxButtonEdit2: TcxButtonEdit;
    procedure AExitExecute(Sender: TObject);
    procedure cxGrid1DBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure LoadCaption;
    procedure SelectLangExecute(Sender: TObject);
    procedure AAddVedomostExecute(Sender: TObject);
    function AddVedomost : int64;
    procedure AddProv(id_ved : int64);
    procedure DelProv(id_vedom : int64);
    procedure ChangeVedomost(id_vedom : int64);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    regim, index_lang : smallint;
  public
    myform : TfmUWMainVedomost;
    id_user, id_sp_type, id_bank : int64;
    flag_no_show : boolean;
    constructor Create(AOwner: TComponent; dbase : Tpfibdatabase; sp_type_ved, id_bank_dog : int64; mform : TfmUWMainVedomost; reg : smallint; s_type_n, name_bank_d : string); reintroduce; overload;
  end;


implementation
uses UWAddVedomostProv,
     UWResourcesUnit,
     Registry,
     UWLoaderUnit;

{$R *.dfm}

{ TfmUWAddVedomost }

constructor TfmUWAddVedomost.Create(AOwner: TComponent; dbase : Tpfibdatabase; sp_type_ved, id_bank_dog : int64; mform : TfmUWMainVedomost; reg : smallint; s_type_n, name_bank_d : string);
begin
    inherited Create(AOwner);
    id_user                     := mform.id_user_;
    regim                       := reg;
    myform                      := mform;
    id_bank                     := id_bank_dog;
    id_sp_type                  := sp_type_ved;

    Database                    := dbase;
    Transaction.DefaultDatabase := Database;
    TrW.DefaultDatabase         := Database;
    Database.DefaultTransaction := Transaction;

    DS.Database                 := dbase;
    DS.Transaction              := Transaction;

    Transaction.StartTransaction;

    if reg = 1 then
    begin
        cxDateEdit1.Date := date;
        cxButtonEdit1.Text := s_type_n;
    end;
    if (reg = 2) or (reg = 3) then
    begin
        cxButtonEdit1.Enabled := false;
        DS.Close;
        DS.SQLs.SelectSQL.Text := 'select * from UW_DT_VEDOMOST_SELECT_ONE('''+mform.DataSetVedomost.fbn('ID_DT_VEDOMOST').AsString+''')';
        DS.Open;
        id_bank          := StrToint64(DS.fbn('ID_BANK').AsString);
        cxTextEdit1.Text := DS.FBN('NOMER').AsString;
        cxDateEdit1.Date := DS.FBN('DATE_VEDOMOST').AsDateTime;
        DS.Close;
        DS.SQLs.SelectSQL.Text := 'select * from UW_DT_PROV_VEDOMOST_SELECT('''+mform.DataSetVedomost.fbn('ID_DT_VEDOMOST').AsString+''')';
        DS.Open;
        DS.First;
        while not DS.Eof do
        begin
            rxMDProv.Open;
            rxMDProv.Edit;
            rxMDProv.FieldByName('id_prov').value       := strToInt64(DS.fbn('ID_DT_PROV_VEDOMOST').AsString);
            rxMDProv.FieldByName('id').value            := DS.RecNo;
            rxMDProv.FieldByName('id_man').value        := strToInt64(DS.fbn('ID_MAN').AsString);
            rxMDProv.FieldByName('id_sch').value        := strToInt64(DS.fbn('ID_SCH').AsString);
            rxMDProv.FieldByName('id_smeta').value      := strToInt64(DS.fbn('ID_SMETA').AsString);
            rxMDProv.FieldByName('id_razd').value       := strToInt64(DS.fbn('ID_RAZD').AsString);
            rxMDProv.FieldByName('id_state').value      := strToInt64(DS.fbn('ID_STATE').AsString);
            rxMDProv.FieldByName('id_kekv').value       := strToInt64(DS.fbn('ID_KEKV').AsString);
            rxMDProv.FieldByName('summa').value         := DS.FBN('SUMA').AsCurrency;
            rxMDProv.FieldByName('id_dog').value        := strToInt64(DS.fbn('ID_DOG').AsString);
            rxMDProv.FieldByName('kod_dog').value       := strToInt64(DS.fbn('KOD_DOG').AsString);
            rxMDProv.FieldByName('kod_smeta').value     := DS.fbn('SMETA_KOD').AsString;
            rxMDProv.FieldByName('kod_razd').value      := DS.fbn('RAZD_NUM').AsString;
            rxMDProv.FieldByName('kod_state').value     := DS.fbn('STATE_KOD').AsString;
            rxMDProv.FieldByName('kod_kekv').value      := DS.fbn('KEKV_KOD').AsString;
            rxMDProv.FieldByName('kod_sch').value       := DS.fbn('SCH_NUMBER').AsString;
            rxMDProv.FieldByName('tytle_sch').value     := DS.fbn('SCH_TYTLE').AsString;
            rxMDProv.FieldByName('tytle_smeta').value   := DS.fbn('SMETA_TYTLE').AsString;
            rxMDProv.FieldByName('tytle_razd').value    := DS.fbn('RAZD_TYTLE').AsString;
            rxMDProv.FieldByName('tytle_state').value   := DS.fbn('STATE_TYTLE').AsString;
            rxMDProv.FieldByName('tytle_kekv').value    := DS.fbn('KEKV_TYTLE').AsString;
            rxMDProv.FieldByName('fio').value           := DS.fbn('FIO').AsString;
            rxMDProv.FieldByName('id_bankcard').value   := strToInt64(DS.fbn('ID_SP_BANKCARD').AsString);
            rxMDProv.FieldByName('name_bankcard').value := DS.fbn('LIC_BANKCARD').AsString;
            rxMDProv.Post;
            DS.Next;
        end;
        DS.Close;

    end;

    if reg = 3 then
    begin
        cxDateEdit1.Enabled   := false;
        cxButtonEdit1.Enabled := false;
        cxTextEdit1.Enabled   := false;
        AAddVedomost.Visible  := false;

    end;

    LoadCaption;
end;

procedure TfmUWAddVedomost.AExitExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmUWAddVedomost.cxGrid1DBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = VK_INSERT then ToolButton1Click(Sender);
    if key = VK_F2     then ToolButton2Click(Sender);
    if key = VK_DELETE then ToolButton3Click(Sender);
end;

procedure TfmUWAddVedomost.ToolButton1Click(Sender: TObject);
begin
    if VedomProv(self, self, 1) then
    begin

    end;
end;

procedure TfmUWAddVedomost.ToolButton2Click(Sender: TObject);
begin
    if not rxMDProv.IsEmpty then
    begin
        VedomProv(self, self, 2);
    end;
end;

procedure TfmUWAddVedomost.ToolButton3Click(Sender: TObject);
var
    s : string;
    i, j : integer;
begin
    if (not rxMDProv.IsEmpty) and (regim <> 3) then
    begin
        s := UWResourcesUnit.MY_CONST_MESSAGE_WARNING[index_lang];
        if MessageBox(Handle, Pchar(UWResourcesUnit.MY_CONST_DELETE_PROV[index_lang] + rxMDProv.FieldByName('kod_sch').AsString+'/' + rxMDProv.FieldByName('kod_smeta').AsString+'/'+ rxMDProv.FieldByName('kod_razd').AsString+'/'+ rxMDProv.FieldByName('kod_state').AsString+'/'+ rxMDProv.FieldByName('kod_kekv').AsString+' - '+ rxMDProv.FieldByName('summa').AsString), Pchar(s), MB_YESNO + MB_DEFBUTTON2) = mrYes then
        begin
                j := rxMDProv.FieldByName('id').AsInteger;
                cxGrid1DBTableView1.Controller.GoToPrev(false);
                i := rxMDProv.FieldByName('id').AsInteger;
                rxMDProv.Locate('id', j, [] );
                rxMDProv.Delete;
                rxMDProv.Locate('id', i, [] );
        end;
    end;
end;

procedure TfmUWAddVedomost.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
        if ((Ord(Key) < 48) and (Ord(Key) > 57)) then Key := Chr(0);
end;

procedure TfmUWAddVedomost.LoadCaption;
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

    Caption                              := UWResourcesUnit.VEDOMOST_EDIT_CAPTION[index_lang];
    ToolButton1.Caption                  := UWResourcesUnit.MY_CONST_ADD[index_lang];
    ToolButton2.Caption                  := UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    ToolButton3.Caption                  := UWResourcesUnit.MY_CONST_DELETE[index_lang];
    cxLabel1.Caption                     := UWResourcesUnit.VEDOMOST_EDIT_NOMBER[index_lang];
    cxLabel2.Caption                     := UWResourcesUnit.VEDOMOST_EDIT_VID[index_lang];
    cxLabel3.Caption                     := UWResourcesUnit.VEDOMOST_EDIT_PO_TYPE[index_lang];
    cxButton1.Caption                    := UWResourcesUnit.MY_CONST_BUTTON_CANCEL[index_lang];
    AAddVedomost.Caption                 := UWResourcesUnit.MY_CONST_BUTTON_OK[index_lang];
    cxGrid1DBTableView1DBColumn1.Caption := UWResourcesUnit.MY_CONST_FIO[index_lang];
    cxGrid1DBTableView1DBColumn2.Caption := UWResourcesUnit.MY_CONST_SCH[index_lang];
    cxGrid1DBTableView1DBColumn3.Caption := UWResourcesUnit.MY_CONST_SMETA[index_lang];
    cxGrid1DBTableView1DBColumn4.Caption := UWResourcesUnit.MY_CONST_RAZD[index_lang];
    cxGrid1DBTableView1DBColumn5.Caption := UWResourcesUnit.MY_CONST_STATE[index_lang];
    cxGrid1DBTableView1DBColumn6.Caption := UWResourcesUnit.MY_CONST_KEKV[index_lang];
    cxGrid1DBTableView1DBColumn7.Caption := UWResourcesUnit.MY_CONST_SUMMA[index_lang];

    dxStatusBar1.Panels[0].Text          := 'Ins- ' + UWResourcesUnit.MY_CONST_ADD[index_lang];
    dxStatusBar1.Panels[1].Text          := 'F2- '  + UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    dxStatusBar1.Panels[2].Text          := 'Del- ' + UWResourcesUnit.MY_CONST_DELETE[index_lang];
    dxStatusBar1.Panels[3].Text          := 'F10- ' + UWResourcesUnit.MY_CONST_BUTTON_OK[index_lang];
    dxStatusBar1.Panels[4].Text          := 'Esc- ' + UWResourcesUnit.MY_CONST_BUTTON_CANCEL[index_lang];

    cxLabel4.Caption                     := UWResourcesUnit.SPBANKCARD_ADD_SELECT_DOG[index_lang];
    
end;

procedure TfmUWAddVedomost.SelectLangExecute(Sender: TObject);
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

procedure TfmUWAddVedomost.AAddVedomostExecute(Sender: TObject);
var
    id_vedomost : int64;
begin
    id_vedomost            := -1;
    DSAddVedom.Database    := Database;
    DSAddVedom.Transaction := TrW;

    SProc.Database         := Database;
    SProc.Transaction      := TrW;

    TrW.StartTransaction;

    try
        if regim = 1 then
        begin
            id_vedomost := AddVedomost;
            AddProv(id_vedomost);
        end;
        if regim = 2 then
        begin
            id_vedomost := StrToInt64(myform.DataSetVedomost.fbn('ID_DT_VEDOMOST').AsString);
            ChangeVedomost(id_vedomost);
            DelProv(id_vedomost);
            AddProv(id_vedomost);
        end;

        TrW.Commit;
    except on E:Exception do begin
        TrW.Rollback;
        ShowMessage(E.Message);
        exit;
    end;
    end;
    myform.ARefreshExecute(nil);
    myform.DataSetVedomost.Locate('ID_DT_VEDOMOST', id_vedomost, []);
    Close;
end;

function TfmUWAddVedomost.AddVedomost : int64;
begin
    DSAddVedom.close;
    DSAddVedom.SQLs.SelectSQL.Text := 'select * from UW_DT_VEDOMOST_INSERT('''+cxTextEdit1.Text+''', '''+DateToStr(cxDateEdit1.Date)+ ''', '+IntToStr(id_sp_type)+', '+IntToStr(0)+', null, '+IntToStr(id_bank)+', '+IntToStr(-1)+', '+IntToStr(id_user)+')';
    DSAddVedom.Open;
    Result := StrToInt64(DSAddVedom.FBN('R_ID_DT_VEDOMOST').AsString);
    DSAddVedom.close;
end;

procedure TfmUWAddVedomost.AddProv(id_ved: int64);
begin
    flag_no_show := false;
    rxMDProv.First;
    while not rxMDProv.eof do
    begin
        SProc.StoredProcName := 'UW_DT_PROV_VEDOMOST_INSERT';
        SProc.Prepare;
        SProc.ParamByName('ID_DT_PROV_VEDOMOST').AsInt64  := rxMDProv.FieldByName('id_prov').Value;
        SProc.ParamByName('ID_DT_VEDOMOST').AsInt64       := id_ved;
        SProc.ParamByName('ID_MAN').AsInt64               := rxMDProv.FieldByName('id_man').Value;
        SProc.ParamByName('ID_SCH').AsInt64               := rxMDProv.FieldByName('id_sch').Value;
        SProc.ParamByName('ID_SMETA').AsInt64             := rxMDProv.FieldByName('id_smeta').Value;
        SProc.ParamByName('ID_RAZD').AsInt64              := rxMDProv.FieldByName('id_razd').Value;
        SProc.ParamByName('ID_STATE').AsInt64             := rxMDProv.FieldByName('id_state').Value;
        SProc.ParamByName('ID_KEKV').AsInt64              := rxMDProv.FieldByName('id_kekv').Value;
        SProc.ParamByName('ID_DOG').AsInt64               := rxMDProv.FieldByName('id_dog').Value;
        SProc.ParamByName('KOD_DOG').AsInt64              := rxMDProv.FieldByName('kod_dog').Value;
        SProc.ParamByName('SUMA').AsCurrency              := rxMDProv.FieldByName('summa').Value;
        SProc.ParamByName('ID_SP_BANKCARD').AsInt64       := rxMDProv.FieldByName('id_bankcard').Value;
        SProc.ParamByName('ID_USER').AsInt64              := id_user;
        SProc.ExecProc;
        rxMDProv.Next;
    end;
    flag_no_show := true;
end;

procedure TfmUWAddVedomost.DelProv(id_vedom: int64);
begin
        SProc.StoredProcName := 'UW_DT_PROV_VEDOMOST_DELETE';
        SProc.Prepare;
        SProc.ParamByName('ID_DT_VEDOMOST').AsInt64  := id_vedom;
        SProc.ParamByName('D_ID_USER').AsInt64       := id_user;
        SProc.ExecProc;
end;

procedure TfmUWAddVedomost.ChangeVedomost(id_vedom: int64);
begin
        SProc.StoredProcName := 'UW_DT_VEDOMOST_UPDATE';
        SProc.Prepare;
        SProc.ParamByName('ID_DT_VEDOMOST').AsInt64   := id_vedom;
        SProc.ParamByName('NOMER').AsString           := cxTextEdit1.Text;
        SProc.ParamByName('DATE_VEDOMOST').AsDateTime := cxDateEdit1.Date;
        SProc.ParamByName('ID_BANK').AsInt64          := id_bank;
        SProc.ParamByName('ID_USER').AsInt64          := id_user;
        SProc.ExecProc;
end;

procedure TfmUWAddVedomost.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    R : Variant;
begin
    if myform.cxComboBox1.ItemIndex > 0 then
    begin
        R := UWLoaderUnit.LoadSelectVedomostTypeVd(Self, Database, id_user, true, true);
        if VarArrayDimCount(R) > 0 then
        begin
            id_sp_type          := R[0];
            cxButtonEdit1.Text  := R[1];
        end;
    end;
end;

procedure TfmUWAddVedomost.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    R : variant;
begin
    if rxMDProv.IsEmpty then
    begin
        R := UWLoaderUnit.LoadUVSpBankCardTakeDog(Self, myform.id_user_, DataBase, true, true);
        if VarArrayDimCount(R) > 0 then
        begin
            id_bank            := R[0];
            cxButtonEdit2.Text := R[3];
        end;
    end;
end;

end.
