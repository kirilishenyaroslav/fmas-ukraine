unit KassaSdachaDeneg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, KassaDocMainForm, ImgList, dxBar,
  dxBarExtItems, Placemnt, Menus, dxsbar, dxStatusBar, cxTextEdit,
  cxCurrencyEdit, cxImage, ActnList, RxMemDS, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, cxCheckBox, ExtCtrls, cxContainer, cxLabel,
  frxClass, frxDBSet;

type
  TfmKassaSdachaDeneg = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarStatic1: TdxBarStatic;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    dxBarLargeButton12: TdxBarLargeButton;
    dxBarLargeButton13: TdxBarLargeButton;
    ImageList: TImageList;
    dxStatusBar1: TdxStatusBar;
    dxSideBarPopupMenu1: TdxSideBarPopupMenu;
    n1: TMenuItem;
    n2: TMenuItem;
    ActionDelete1: TMenuItem;
    ActionPrint1: TMenuItem;
    ActionRefresh1: TMenuItem;
    ActionExit1: TMenuItem;
    ActionShow1: TMenuItem;
    ActionProverkaOtv1: TMenuItem;
    FormStorage1: TFormStorage;
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
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    ActionList1: TActionList;
    ActionTake: TAction;
    ActionClose: TAction;
    RxMemoryDataSaveAll: TRxMemoryData;
    pFIBDatabase1: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    DataSource: TDataSource;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    pFIBDataSet1: TpFIBDataSet;
    Panel1: TPanel;
    cxTextEdit1: TcxTextEdit;
    cxLabel1: TcxLabel;
    dxBarLargeButton14: TdxBarLargeButton;
    ActionPrint: TAction;
    frxDBDatasetPrint: TfrxDBDataset;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    ReportPrint: TfrxReport;
    procedure LoadCaption;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionTakeExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure CellSelect;
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionPrintExecute(Sender: TObject);
  private
    
  public
    m : TfmKassaDocMainForm;
  end;

function Show_Ostatok(A : TComponent; var R : TAllRec; mm : TfmKassaDocMainForm):boolean;

implementation
uses Un_R_file_Alex;

{$R *.dfm}

function Show_Ostatok(A : TComponent; var R : TAllRec; mm : TfmKassaDocMainForm):boolean;
var
    T      : TfmKassaSdachaDeneg;
    id_sys : int64;
    i, lenMassiv : integer;
begin
    T                                  := TfmKassaSdachaDeneg.Create(A);
    T.m                                := mm;
    T.pFIBDatabase1                    := T.m.Database;
    T.pFIBDatabase1.DefaultTransaction := T.pFIBTransaction1;
    T.pFIBTransaction1.DefaultDatabase := T.pFIBDatabase1;

    T.DataSet.Database                 := T.pFIBDatabase1;
    T.DataSet.Transaction              := T.pFIBTransaction1;
    T.pFIBDataSet1.Database            := T.pFIBDatabase1;
    T.pFIBDataSet1.Transaction         := T.pFIBTransaction1;

    T.pFIBTransaction1.StartTransaction;

    T.pFIBDataSet1.Close;
    T.pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from J4_SP_JO';
    T.pFIBDataSet1.Open;
    id_sys := StrToInt64(T.pFIBDataSet1.FieldByName('ID_J4_SP_JO').AsString);
    T.pFIBDataSet1.Close;
    T.DataSet.Close;
//    T.DataSet.SQLs.SelectSQL.Text := 'select * from KASSA_SELECT_OST_PO_KASSE('''+mm.cxComboBoxDay.Text+''', '+IntToStr(mm.id_kassa)+') where r_level='+IntToStr(4)+'';
//    T.DataSet.SQLs.SelectSQL.Text     := 'SELECT * FROM J4_SELECT_OBOROTI_FIO_NEW_ALG('''+T.m.cxComboBoxDay.Text+''', '+IntToStr(id_sys)+') where FIO <> '+QuotedStr('1')+' and R_LEVEL='+IntToStr(3)+' and DEBET_VIH <> '+IntToStr(0)+' and KREDIT_VIH <> '+IntToStr(0)+'';
    T.DataSet.SQLs.SelectSQL.Text     := 'SELECT * FROM J4_SELECT_OSTATKI_TO_KASSA('''+T.m.cxComboBoxDay.Text+''', '+IntToStr(id_sys)+')';
    T.DataSet.Open;
    T.DataSet.FetchAll;
    T.DataSet.First;
    i := 1;
    while not T.DataSet.Eof do
    begin
        T.RxMemoryDataSaveAll.Open;
        T.RxMemoryDataSaveAll.Insert;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value                        := T.DataSet.FieldByName('KREDIT_VIH').AsCurrency;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                         := StrToInt64(T.DataSet.FieldByName('R_ID_SM').AsString);
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value                       := StrToInt64(T.DataSet.FieldByName('R_ID_RAZ').AsString);
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                         := StrToInt64(T.DataSet.FieldByName('R_ID_ST').AsString);
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value                       := StrToInt64(T.DataSet.FieldByName('R_ID_KEKV').AsString);
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                        := StrToInt64(T.DataSet.FieldByName('ID_DOG').AsString);
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                       := StrToInt64(T.DataSet.FieldByName('KOD_DOG').AsString);
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value      := null;//T.DataSet.FieldByName('').AsString;
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value       := null;//T.DataSet.FieldByName('').AsString;
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value      := null;//T.DataSet.FieldByName('').AsString;
        T.RxMemoryDataSaveAll.FieldByName('id').Value                                    := i;
        inc(i);
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := T.DataSet.FieldByName('TYTLE_SMETA').AsString;
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := T.DataSet.FieldByName('TYTLE_RAZD').AsString;
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := T.DataSet.FieldByName('TYTLE_STATE').AsString;
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := T.DataSet.FieldByName('TYTLE_KEKV').AsString;
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := T.DataSet.FieldByName('KOD_SMETA').AsString + '\' + T.DataSet.FieldByName('KOD_RAZD').AsString + '\' + T.DataSet.FieldByName('KOD_STATE').AsString + '\' + T.DataSet.FieldByName('KOD_KEKV').AsString;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                        := StrToInt64(T.DataSet.FieldByName('R_ID_MAN').AsString);
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value                           := T.DataSet.FieldByName('R_FIO').AsString;
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := T.DataSet.FieldByName('TYTLE_SCH_KOR').AsString;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value              := StrToInt64(T.DataSet.FieldByName('R_ID_SCH_KOR').AsString);
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                := T.DataSet.FieldByName('KOD_SCH_KOR').AsString;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value                   := 0;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value                      := 0;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                      := T.DataSet.FieldByName('KOD_STATE').AsString;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                      := T.DataSet.FieldByName('KOD_RAZD').AsString;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value                     := T.DataSet.FieldByName('KOD_SMETA').AsString;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                      := T.DataSet.FieldByName('KOD_KEKV').AsString;
        T.RxMemoryDataSaveAll.FieldByName('check').Value                                 := 0;
        T.RxMemoryDataSaveAll.FieldByName('tab_num').Value                               := T.DataSet.FieldByName('TAB_NUM').AsInteger;
        T.RxMemoryDataSaveAll.FieldByName('Name_dog').Value                              := T.DataSet.FieldByName('NAME_DOG').AsString;
        T.RxMemoryDataSaveAll.FieldByName('DATE_OST').Value                              := T.DataSet.FieldByName('DATE_OST').AsDateTime;
        T.RxMemoryDataSaveAll.Post;
        T.DataSet.Next;
    end;
    T.LoadCaption;
    if T.ShowModal=mrOk then
    begin
        lenMassiv := 0;
        T.RxMemoryDataSaveAll.First;
        while not T.RxMemoryDataSaveAll.Eof do
        begin
            if T.RxMemoryDataSaveAll.FieldByName('check').Value = 1 then
                 lenMassiv := lenMassiv + 1;
            T.RxMemoryDataSaveAll.Next;
        end;
        SetLength(R.prov, lenMassiv);
        R.result               := 1;
        i := 0;
        T.RxMemoryDataSaveAll.First;
        while not T.RxMemoryDataSaveAll.Eof do
        begin
            if T.RxMemoryDataSaveAll.FieldByName('check').Value = 1 then
            begin
                R.prov[i].summa_all       := StrToCurr(T.cxTextEdit1.Text);
                R.prov[i].summa_prov      := T.RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
                R.prov[i].id_sch_osnov    := 0;
                R.prov[i].id_sch_kor      := T.RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
                R.prov[i].kod_sch_osnov   := '';
                R.prov[i].kod_sch_kor     := T.RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value;
                R.prov[i].tytle_sch_ocnov := '';
                R.prov[i].tytle_sch_kor   := T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value;
                R.prov[i].id_smeta        := T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value;
                R.prov[i].id_razd         := T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value;
                R.prov[i].id_state        := T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value;
                R.prov[i].id_kekv         := T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value;
                R.prov[i].kod_smeta       := T.RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value;
                R.prov[i].kod_razd        := T.RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value;
                R.prov[i].kod_state       := T.RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value;
                R.prov[i].kod_kekv        := T.RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value;
                R.prov[i].tytle_smeta     := T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value;
                R.prov[i].tytle_razd      := T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value;
                R.prov[i].tytle_state     := T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value;
                R.prov[i].tytle_kekv      := T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value;
                R.prov[i].id_man          := T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value;
                R.prov[i].name_fio        := T.RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value;
                R.prov[i].id_dog          := T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
                R.prov[i].kod_dog         := T.RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                R.prov[i].num_dog         := '';
                try R.prov[i].name_cust   := T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value; except R.prov[i].name_cust       := ''; end; 
                R.prov[i].type_dog        := '';
                R.prov[i].reg_dog         := '';
                R.prov[i].id_payer        := 0;
                R.prov[i].id_ras_nativ    := 0;
                R.prov[i].id_ras          := 0;
                R.prov[i].id_cust         := 0;
                R.prov[i].date_zavod      := T.RxMemoryDataSaveAll.FieldByName('DATE_OST').Value;
                inc(i);
            end;
            T.RxMemoryDataSaveAll.Next;
        end;
        Result := true;
    end else
    begin
        R.result := 0;
        Result := false;
    end;
    T.Free;
end;

{ TfmKassaSdachaDeneg }

procedure TfmKassaSdachaDeneg.LoadCaption;
begin
    Caption               := Un_R_file_Alex.KASSA_SHABLON_SUMMA_CAPTION;
//    cxLabel1.caption      := Un_R_file_Alex.KASSA_SHABLON_SUMMA_LAB;
//    cxLabel2.caption      := Un_R_file_Alex.KASSA_INPUT_SUMMA_ALL;

    ActionClose.Caption := Un_R_file_Alex.MY_BUTTON_CANCEL_CONST;
    ActionTake.Caption  := Un_R_file_Alex.MY_BUTTON_OK_CONST;
    ActionPrint.Caption := Un_R_file_Alex.MY_BUTTON_PRINT;

//    Caption                              := Un_R_file_Alex.KASSA_VEDOMOST_CAPTION;
    cxLabel1.Caption                     := Un_R_file_Alex.KASSA_ALL_SUMMA;
    cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_DOC_FIO;
    cxGrid1DBTableView1DBColumn2.Caption := Un_R_file_Alex.TAB_NUM;
    cxGrid1DBTableView1DBColumn3.Caption := Un_R_file_Alex.J4_DANNIE_PO_PRIKAZU;
    cxGrid1DBTableView1DBColumn4.Caption := Un_R_file_Alex.KASSA_SUMMA;
    cxGrid1DBTableView1DBColumn5.Caption := '';
    cxGrid1DBTableView1DBColumn6.Caption := Un_R_file_Alex.J4_DATE_OST;


end;
                                                         
procedure TfmKassaSdachaDeneg.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmKassaSdachaDeneg.ActionTakeExecute(Sender: TObject);
begin
    RxMemoryDataSaveAll.First;
    while not RxMemoryDataSaveAll.Eof do
    begin
        if RxMemoryDataSaveAll.FieldByName('check').AsInteger = 1 then
        begin
            ModalResult := mrOK;
            exit;
        end;
        RxMemoryDataSaveAll.Next;
    end;
    showmessage(Un_R_file_Alex.KASSA_DONT_SELECT_ANYONE_CELL);
end;

procedure TfmKassaSdachaDeneg.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    CellSelect;
end;

procedure TfmKassaSdachaDeneg.CellSelect;
var
    i : integer;
    s : Currency;
begin
    if not RxMemoryDataSaveAll.IsEmpty then
    begin
        if RxMemoryDataSaveAll.FieldByName('check').AsInteger = 1
            then
            begin
                RxMemoryDataSaveAll.Edit;
                RxMemoryDataSaveAll.FieldByName('check').AsInteger := 0;
                RxMemoryDataSaveAll.Post;
            end
            else
            begin
                RxMemoryDataSaveAll.Edit;
                RxMemoryDataSaveAll.FieldByName('check').AsInteger := 1;
                RxMemoryDataSaveAll.Post;
            end;
        i := RxMemoryDataSaveAll.FieldByName('id').AsInteger;
        RxMemoryDataSaveAll.First;
        s := 0;
        while not RxMemoryDataSaveAll.Eof do
        begin
            if RxMemoryDataSaveAll.FieldByName('check').AsInteger = 1 then
                s := s + RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsFloat;
            RxMemoryDataSaveAll.Next;
        end;
        cxTextEdit1.Text := CurrToStr(s);
        RxMemoryDataSaveAll.Locate('id', i, []);
    end;
end;

procedure TfmKassaSdachaDeneg.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key = VK_SPACE then
        CellSelect;
end;

procedure TfmKassaSdachaDeneg.ActionPrintExecute(Sender: TObject);
var
    id_lang : integer;
begin
    pFIBDataSet1.Close;
    pFIBDataSet1.Sqls.selectSql.Text := 'SELECT * FROM PUB_SYS_DATA';
    pFIBDataSet1.Open;
    id_lang := pFIBDataSet1.FieldByName('ID_LANGUAGE').AsInteger;
    pFIBDataSet1.Close;
    if id_lang = 1 then ReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10016.fr3');
    if id_lang = 0 then ReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10016_ukr.fr3');
//    ReportPrint.Variables['Vedom']      := QuotedStr(DataSetMain.FieldByName('FIO').AsString);//QuotedStr(DataSetKorSch.fieldByname('KOD_KOR_SCH').AsString);
//        frxReport2.Variables['sm_rz_st_k'] := QuotedStr(DataSetKorSch.fieldByname('NAME_SM_RZ_ST').AsString);
    ReportPrint.PrepareReport;
    ReportPrint.ShowReport(true);

end;

end.
