unit UWMainVedomost2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, ComCtrls, ToolWin, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxSplitter, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  cxTextEdit, cxCurrencyEdit, ExtCtrls, cxDropDownEdit, cxCalendar,
  cxContainer, cxMaskEdit, cxLabel, dxStatusBar, FIBQuery, pFIBQuery,
  pFIBStoredProc, frxClass, frxDBSet, ibase, ib_externals, AArray,
  cxButtonEdit, cxCheckBox, Menus,UWSelectTypeVedom, frxExportXLS,
  frxExportPDF, frxExportRTF;

type
  TfmUWMainVedomost2 = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    AAdd: TAction;
    AEdit: TAction;
    ADel: TAction;
    ARefresh: TAction;
    AExit: TAction;
    ATake: TAction;
    ToolButton6: TToolButton;
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
    DataSetVedomost: TpFIBDataSet;
    DataSetProv: TpFIBDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Panel1: TPanel;
    cxDateEditBeg: TcxDateEdit;
    cxDateEditEnd: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    DSInstall: TpFIBDataSet;
    ToolButton7: TToolButton;
    APrintVed: TAction;
    dxStatusBar1: TdxStatusBar;
    TrW: TpFIBTransaction;
    SP: TpFIBStoredProc;
    Selectlang: TAction;
    DSDel: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    frxDBDataset1: TfrxDBDataset;
    DB: TpFIBDatabase;
    DSCombo: TpFIBDataSet;
    DS: TpFIBDataSet;
    Panel2: TPanel;
    cxSplitter1: TcxSplitter;
    Panel3: TPanel;
    Panel4: TPanel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxSplitter2: TcxSplitter;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    ToolButton8: TToolButton;
    AZayavka: TAction;
    DS_dog: TpFIBDataSet;
    DataSource3: TDataSource;
    cxGridDBTableView2DBColumn1: TcxGridDBColumn;
    cxGridDBTableView2DBColumn2: TcxGridDBColumn;
    TWrite: TpFIBTransaction;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridDBTableView1DBColumn6: TcxGridDBColumn;
    cxGridDBTableView1DBColumn7: TcxGridDBColumn;
    cxGridDBTableView2DBColumn3: TcxGridDBColumn;
    cxGridDBTableView2DBColumn4: TcxGridDBColumn;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    Panel5: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxLabel5: TcxLabel;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    ToolButton11: TToolButton;
    ADelZayavka: TAction;
    Action1: TAction;
    cxGridDBTableView2DBColumn5: TcxGridDBColumn;
    cxGridDBTableView2DBColumn6: TcxGridDBColumn;
    cxCheckBox1: TcxCheckBox;
    cxButtonEdit1: TcxButtonEdit;
    frxReport1: TfrxReport;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    frxDSReestr: TfrxDBDataset;
    frxReport2: TfrxReport;
    SProc: TpFIBStoredProc;
    TransW: TpFIBTransaction;
    DSetTypeVed: TpFIBDataSet;
    DSet: TpFIBDataSet;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    N3: TMenuItem;
    DSetPrintReestAvOtchVed: TpFIBDataSet;
    frxDBDsetPrintReestAvOtchVed: TfrxDBDataset;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    cxGridDBTableView2DBColumn7: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    cxGridDBTableView2DBColumn8: TcxGridDBColumn;
    procedure AExitExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ARefreshExecute(Sender: TObject);
    procedure AAddExecute(Sender: TObject);
    procedure ADelExecute(Sender: TObject);
    procedure LoadCaption;
    procedure SelectlangExecute(Sender: TObject);
    procedure AEditExecute(Sender: TObject);
    procedure ATakeExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure AZayavkaExecute(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure DataSetVedomostAfterScroll(DataSet: TDataSet);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ADelZayavkaExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure cxGridDBTableView2DblClick(Sender: TObject);
    procedure cxGridDBTableView2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure APrintVedExecute(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure cxGridDBTableView2CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxDateEditBegKeyPress(Sender: TObject; var Key: Char);
    procedure cxDateEditEndKeyPress(Sender: TObject; var Key: Char);
  private
    index_lang : integer;
//    ResValue : Variant;
//    Ind1 : array of Int64;
//    make_edit : boolean;
  public
    date_inst : integer;
    id_type_v, id_dog_bankcard, id_user_, id_people : int64;
    id_type_vedom_for_edit : Integer;
    constructor Create(AOwner: TComponent; aParam : TAArray); reintroduce; overload;
  end;

procedure ShowAllUwBpl (aOwner: TComponent; aParam : TAArray); stdcall;
  exports ShowAllUwBpl;

implementation

uses DateUtils,
     UWAddVedomost2,
     UWResourcesUnit,
     Registry,
     UWLoaderUnit,
     GlobalSPR,
     DogLoaderUnit,
     UWShowPeople,
     Un_lo_file_Alex,
     AccMgmt;

{$R *.dfm}

procedure ShowAllUwBpl(aOwner: TComponent; aParam : TAArray);
var
    T : TfmUWMainVedomost2;
    error : integer;
begin
    T := TfmUWMainVedomost2.Create(aOwner, aParam);

    try T.id_user_ := aParam['Input']['id_user'].AsVariant except T.id_user_ := -1; end;

    if T.id_user_ <= 0 then
    begin
        showmessage('Несанкціонований вхід у систему!!! Вікно буде закрито. Зверніться до сстемного адміністратору або до розробників системи!');
        T.Free;
        exit;
    end;

    error := fibCheckPermission('/ROOT/Vedomost','Belong');
    if error <> 0 then
    begin
        MessageBox(T.Handle, PChar('Ви не маєте права заходити сюди!'), PChar('Увага'), 16);
        exit;
    end;

    T.FormStyle := aParam['Input']['aFrmStyle'].AsVariant;
    case T.FormStyle of
       fsNormal : begin
                      T.ShowModal;
//                      T.ActionVibrat.Enabled            := true;
//                      T.dxBarLargeButtonVibrat.Visible  := ivAlways;
                  end;
       fsMDIChild : begin
//                        T.ActionVibrat.Enabled              := false;
//                        T.dxBarLargeButtonVibrat.Visible    := ivNever;
                    end;
    else
        T.Free;
    end;
end;

constructor TfmUWMainVedomost2.Create(AOwner: TComponent; aParam : TAArray);
var
    DBHANDLE : TISC_DB_HANDLE;
//    ResultArray   : TAArray;
begin
    DBHANDLE := PVoid(aParam['Input']['aDBHANDLE'].asInteger);
    inherited Create(aOwner);
    try id_user_                := aParam['Input']['id_user'].AsVariant except id_user_ := -1; end;
//    ResultArray                 := aParam;
    DB.Handle                   := DBHANDLE;
    LoadCaption;

    Transaction.DefaultDatabase := DB;
    TWrite.DefaultDatabase      := DB;

    dB.DefaultTransaction       := Transaction;

    DataSetVedomost.Database    := db;
    DataSetVedomost.Transaction := Transaction;

    DataSetProv.Database        := dB;
    DataSetProv.Transaction     := Transaction;

    DSInstall.Database          := dB;
    DSInstall.Transaction       := Transaction;

    DSCombo.Database            := dB;
    DSCombo.Transaction         := Transaction;

    DS.Database                 := dB;
    DS.Transaction              := Transaction;

    DS_dog.Database             := dB;
    DS_dog.Transaction          := Transaction;
    TrW.DefaultDatabase         := db;
    SProc.Database              := db;
    SProc.Transaction           := TrW;

    Transaction.StartTransaction;

    id_people := -1;

    DSInstall.Close;
    DSInstall.sqls.selectSql.Text := 'Select * from UW_INSTALL';
    DSInstall.Open;
    date_inst := DSInstall.fbn('DATE_SHOW_LAST').AsInteger;
    DSInstall.Close;

    cxDateEditBeg.Date := IncDay(date, -date_inst);
    cxDateEditBeg.Date := StrToDate('01'+copy(cxDateEditBeg.text, 3, 8));
    cxDateEditEnd.Date := date;

    DataSetProv.SQLs.SelectSQL.Text := 'select * from UW_DT_PROV_VEDOMOST2_SEL(?ID_VEDOMOST2)';
    DS_dog.SQLs.SelectSQL.Text := 'select * from UW2_SELECT_DOG_VEDOMOST_GRID(?ID_VEDOMOST2)';

    
    DataSetVedomost.Close;
    DataSetVedomost.SQLs.SelectSQL.Text := 'select * from UW_DT_VEDOMOST2_SEL('''+DateToStr(cxDateEditBeg.Date)+''', '''+DateToStr(cxDateEditEnd.Date)+''', '+IntToStr(0)+', '+IntToStr(0)+')';
    DataSetVedomost.Open;
    //if   DataSetVedomost.FBN('EXISTS_ZAYAVKA').AsInteger<>1 then exit;
    cxGrid1DBTableView1.DataController.DataSource := DataSource1;
    cxGridDBTableView1.DataController.DataSource  := DataSource2;
    cxGridDBTableView2.DataController.DataSource  := DataSource3;
end;

procedure TfmUWMainVedomost2.AExitExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmUWMainVedomost2.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
    j : integer;
begin
    for j := 0 to Db.ActiveTransactionCount do
    begin
        if Db.Transactions[j].Active then
        begin
            try
                Db.Transactions[j].Active := false;
            finally
            end;
        end;
    end;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmUWMainVedomost2.ARefreshExecute(Sender: TObject);
var
    id_refr : int64;
//    i : integer;
begin
    cxGrid1.SetFocus;
    id_refr := -1;
    if not DataSetVedomost.IsEmpty then
    begin
        id_refr := StrToInt64(DataSetVedomost.fbn('ID_VEDOMOST2').AsString);
    end;
    DataSetVedomost.Close;
    if not cxCheckBox1.Checked
        then DataSetVedomost.SQLs.SelectSQL.Text := 'select * from UW_DT_VEDOMOST2_SEL('''+DateToStr(cxDateEditBeg.Date)+''', '''+DateToStr(cxDateEditEnd.Date)+''', '+IntToStr(0)+', '+IntToStr(0)+')'
        else DataSetVedomost.SQLs.SelectSQL.Text := 'select * from UW_DT_VEDOMOST2_SEL('''+DateToStr(cxDateEditBeg.Date)+''', '''+DateToStr(cxDateEditEnd.Date)+''', '+IntToStr(1)+', '+IntToStr(id_people)+')';
    DataSetVedomost.Open;
    DataSetVedomost.FetchAll;
    DataSetVedomost.First;
    while not DataSetVedomost.Eof do
    begin
        if id_refr = StrToInt64(DataSetVedomost.fbn('ID_VEDOMOST2').AsString) then exit;
        DataSetVedomost.Next;
    end;
end;

procedure TfmUWMainVedomost2.AAddExecute(Sender: TObject);
var
    T : TfmUWAddVedomost2;
    error : integer;
    viewform : TfmSelectTypeVedom;
begin

  error := fibCheckPermission('/ROOT/Vedomost','Add');
  if error <> 0 then
  begin
    MessageBox(Handle, PChar('Ви не маєте права робити це!'), PChar('Увага'), 16);
    exit;
  end;

  //проверка на настройки ввода ведомостей через авансовые отчеты
  DSet.Database := db;
  DSet.Transaction := Transaction;
  dset.close;
  dset.SelectSQL.Text := 'select * from J4_INI';
  dset.open;
  //--------------------------------------------------------------

  if dset['J4_IS_SELECT_TYPE_VVOD_VEDOM'] = 1 then
  begin
    viewform := TfmSelectTypeVedom.Create(Self);
    viewform.Database := DB;
    viewform.Trans.DefaultDatabase := viewform.Database;
    viewform.DSetTypeVed.Transaction := viewform.Trans;
    viewform.DSetTypeVed.Close;
    viewform.DSetTypeVed.SelectSQL.Text := 'select * from UW_SP_TYPE_VED_FOR_INS_VEDOM';
    viewform.DSetTypeVed.Open;
    viewform.ShowModal;
    if viewform.ModalResult = mrok then
    begin
      T := TfmUWAddVedomost2.Create(self, self, 1);
      T.TabSheetFromAvanceOtchet.Visible := True;
      t.id_type_vedom := StrToInt64(viewform.DSetTypeVed.FieldByName('ID_TYPE_VEDOMOST').AsString);
      t.id_type_viplat := StrToInt64(viewform.DSetTypeVed.FieldByName('id_type_viplat').AsString);
      t.LabelTypeVed.Caption := viewform.DSetTypeVed['NAME_TYPE_VEDOMOST'];
      t.KEY_SESSION := DataSetVedomost.Database.Gen_Id('GEN_UW_KEY_SESSION', 1);

      if (t.id_type_vedom = 1)then
      begin
        t.PageControlVedomost.ActivePage := t.TabSheetRuchnoiRegim;
      end
      else
      begin
        t.PageControlVedomost.ActivePage := t.TabSheetFromAvanceOtchet;
      end;

      T.ShowModal;
      T.Free;
    end;

    DataSetVedomost.Close;
    DataSetVedomost.Open;
  end
  else
  begin
    //отбираем данные ручного режима
    dset.close;
    dset.SelectSQL.Text := 'select * from UW_SP_TYPE_VED_FOR_INS_VEDOM where ID_TYPE_VEDOMOST = 1';
    dset.open;

    T := TfmUWAddVedomost2.Create(self, self, 1);
    t.id_type_vedom := StrToInt64(dset.FieldByName('ID_TYPE_VEDOMOST').AsString);
    t.id_type_viplat := StrToInt64(dset.FieldByName('id_type_viplat').AsString);
    t.LabelTypeVed.Caption := dset['NAME_TYPE_VEDOMOST'];
    t.KEY_SESSION := DataSetVedomost.Database.Gen_Id('GEN_UW_KEY_SESSION', 1);
    t.PageControlVedomost.ActivePage := t.TabSheetRuchnoiRegim;
    T.TabSheetFromAvanceOtchet.Visible := False;
    T.ShowModal;

    T.Free;

    DataSetVedomost.Close;
    DataSetVedomost.Open;
  end;  





    {viewform := TfmSelectTypeVedom.Create(Self);
    viewform.Database := DB;
    viewform.Trans.DefaultDatabase := viewform.Database;
    viewform.DSetTypeVed.Transaction := viewform.Trans;
    viewform.DSetTypeVed.Close;
    viewform.DSetTypeVed.SelectSQL.Text := 'select * from UW_SP_TYPE_VED_FOR_INS_VEDOM';
    viewform.DSetTypeVed.Open;
    viewform.ShowModal;
    if viewform.ModalResult = mrok then
    begin
      T := TfmUWAddVedomost2.Create(self, self, 1);
      t.id_type_vedom := StrToInt64(viewform.DSetTypeVed.FieldByName('ID_TYPE_VEDOMOST').AsString);
      t.id_type_viplat := StrToInt64(viewform.DSetTypeVed.FieldByName('id_type_viplat').AsString);
      t.LabelTypeVed.Caption := viewform.DSetTypeVed['NAME_TYPE_VEDOMOST'];
      t.KEY_SESSION := DataSetVedomost.Database.Gen_Id('GEN_UW_KEY_SESSION', 1);
      T.ShowModal;
      T.Free;
    end;

    DataSetVedomost.Close;
    DataSetVedomost.Open;}

end;

procedure TfmUWMainVedomost2.ADelExecute(Sender: TObject);
var
    i, j : int64;
    s : string;
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Vedomost','Del');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar('Ви не маєте права робити це!'), PChar('Увага'), 16);
        exit;
    end;
    if not DataSetVedomost.IsEmpty then
    begin
        if DataSetVedomost.FBN('EXISTS_ZAYAVKA').AsInteger > 0 then exit;
        i := -1;
        s := UWResourcesUnit.MY_CONST_MESSAGE_WARNING[index_lang];
        if MessageBox(Handle, Pchar(UWResourcesUnit.VEDOMOST_DELETE[index_lang] + '№ ' + DataSetVedomost.fbn('NOMBER_VEDOMOST2').AsString ), Pchar(s), MB_YESNO + MB_DEFBUTTON2) = mrYes then
        begin
            try
                j := StrToInt64(DataSetVedomost.FieldByName('ID_VEDOMOST2').AsString);
                cxGrid1DBTableView1.Controller.GoToPrev(false);
                i := StrToInt64(DataSetVedomost.FieldByName('ID_VEDOMOST2').AsString);
                DataSetVedomost.locate('ID_VEDOMOST2', j, []);

                TrW.DefaultDatabase := DB;
                SP.Database         := DB;
                SP.Transaction      := TrW;
                try
                    TrW.StartTransaction;
                    SP.StoredProcName := 'UW_DT_VEDOMOST2_DEL';
                    SP.ParamByName('ID_VEDOMOST2').AsInt64   := j;
                    SP.ExecProc;
                    TrW.Commit;
                except on E:Exception do begin
                    TrW.Rollback;
                    ShowMessage(E.Message);
                    exit;
                end end;

            except on E:Exception do begin
                TrW.Rollback;
                ShowMessage(E.Message);
            end;
            end;
            ARefreshExecute(Sender);
            DataSetVedomost.Locate('ID_VEDOMOST2', i, []);
        end;
    end;
end;

procedure TfmUWMainVedomost2.LoadCaption;
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

    Caption                              := UWResourcesUnit.VEDOMOST_CAPTION[index_lang];
    AAdd.Caption                         := UWResourcesUnit.MY_CONST_ADD[index_lang];
    AEdit.Caption                        := UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    ADel.Caption                         := UWResourcesUnit.MY_CONST_DELETE[index_lang];
    ARefresh.Caption                     := UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    AExit.Caption                        := UWResourcesUnit.MY_CONST_CLOSE[index_lang];
    ATake.Caption                        := UWResourcesUnit.MY_CONST_CHOOSE[index_lang];
    APrintVed.Caption                    := UWResourcesUnit.MY_CONST_THE_PRINT[index_lang];
    ADelZayavka.Caption                  := UWResourcesUnit.V2_VEDOMOST_DEL_ZAYAVKA[index_lang];

    AZayavka.Caption                     := UWResourcesUnit.V2_VEDOMOST_ZAYAVKA[index_lang];

    AAdd.Hint                            := 'Ins-'    + UWResourcesUnit.MY_CONST_ADD[index_lang];
    AEdit.Hint                           := 'F2-'     + UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    ADel.Hint                            := 'Del-'    + UWResourcesUnit.MY_CONST_DELETE[index_lang];
    ARefresh.Hint                        := 'F5-'     + UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    AExit.Hint                           := 'Esc-'    + UWResourcesUnit.MY_CONST_CLOSE[index_lang];
    ATake.Hint                           := 'Enter-'  + UWResourcesUnit.MY_CONST_CHOOSE[index_lang];
    APrintVed.Hint                       := 'Ctrl+P-' + UWResourcesUnit.MY_CONST_THE_PRINT[index_lang];
    AZayavka.Hint                        := UWResourcesUnit.V2_VEDOMOST_ZAYAVKA_[index_lang];
    ADelZayavka.Hint                     := UWResourcesUnit.V2_VEDOMOST_DEL_ZAYAVKA[index_lang];

    cxGrid1DBTableView1DBColumn1.Caption := UWResourcesUnit.MY_CONST_NOMER[index_lang];
    cxGrid1DBTableView1DBColumn2.Caption := UWResourcesUnit.MY_CONST_DATE[index_lang];
    cxGrid1DBTableView1DBColumn3.Caption := UWResourcesUnit.MY_CONST_SUMMA[index_lang];
    cxGrid1DBTableView1DBColumn4.Caption := UWResourcesUnit.V2_VEDOMOST_EXISTS_BANK[index_lang];
    cxGridDBTableView1DBColumn1.Caption  := UWResourcesUnit.MY_CONST_FIO[index_lang];
    cxGridDBTableView1DBColumn2.Caption  := UWResourcesUnit.MY_CONST_SUMMA[index_lang];

    dxStatusBar1.Panels[0].Text          := 'Ins-'    + UWResourcesUnit.MY_CONST_ADD[index_lang];
    dxStatusBar1.Panels[1].Text          := 'F2-'     + UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    dxStatusBar1.Panels[2].Text          := 'Del-'    + UWResourcesUnit.MY_CONST_DELETE[index_lang];
    dxStatusBar1.Panels[3].Text          := 'F5-'     + UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    dxStatusBar1.Panels[4].Text          := 'Ctrl+P-' + UWResourcesUnit.MY_CONST_THE_PRINT[index_lang];
    dxStatusBar1.Panels[5].Text          := 'Esc-'    + UWResourcesUnit.MY_CONST_CLOSE[index_lang];
    dxStatusBar1.Panels[6].Text          := 'Enter-'  + UWResourcesUnit.MY_CONST_CHOOSE[index_lang];

    cxLabel1.Caption                     := UWResourcesUnit.VEDOMOST_OTOBRAJAT[index_lang];
    cxLabel2.Caption                     := UWResourcesUnit.MY_CONST_PO[index_lang];
    cxLabel3.Caption                     := UWResourcesUnit.V2_VEDOMOST_CAP_PEOPLE_LIST[index_lang];
    cxLabel4.Caption                     := UWResourcesUnit.V2_VEDOMOST_CAP_DOGOVOR_LIST[index_lang];

    cxGridDBTableView2DBColumn1.Caption  := UWResourcesUnit.V2_VEDOMOST_DOG_BANK[index_lang];
    cxGridDBTableView2DBColumn2.Caption  := UWResourcesUnit.V2_VEDOMOST_DOG_REGNU[index_lang];

    ToolButton10.Caption                 := UWResourcesUnit.V2_VEDOMOST_PANEL_GROUP[index_lang];

    cxGridDBTableView1DBColumn3.Caption  := UWResourcesUnit.MY_CONST_SMETA_S[index_lang];
    cxGridDBTableView1DBColumn4.Caption  := UWResourcesUnit.MY_CONST_RAZD_S[index_lang];
    cxGridDBTableView1DBColumn5.Caption  := UWResourcesUnit.MY_CONST_STATE_S[index_lang];
    cxGridDBTableView1DBColumn6.Caption  := UWResourcesUnit.MY_CONST_KEKV_S[index_lang];

    cxGridDBTableView1DBColumn7.Caption  := UWResourcesUnit.V2_VEDOMOST_DOG_BANK[index_lang];

    cxGridDBTableView2DBColumn3.Caption  := UWResourcesUnit.V2_VEDOMOST_S_ZAYAVKI[index_lang];
    cxGridDBTableView2DBColumn4.Caption  := UWResourcesUnit.V2_VEDOMOST_S_OPLATI[index_lang];

    cxGridDBTableView2DBColumn5.Caption  := UWResourcesUnit.V2_VEDOMOST_KOD_PKV[index_lang];
    cxGridDBTableView2DBColumn6.Caption  := UWResourcesUnit.V2_VEDOMOST_TYPE_FIN[index_lang];

    cxCheckBox1.Properties.Caption       := UWResourcesUnit.V2_VEDOMOST_FILTER_PEOPLE[index_lang];
end;

procedure TfmUWMainVedomost2.SelectlangExecute(Sender: TObject);
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

procedure TfmUWMainVedomost2.AEditExecute(Sender: TObject);
var
    T : TfmUWAddVedomost2;
    error : integer;
    id : Int64;
begin
    id := StrToInt64(DataSetVedomost.fbn('ID_VEDOMOST2').AsString);
    error := fibCheckPermission('/ROOT/Vedomost','Edit');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar('Ви не маєте права робити це!'), PChar('Увага'), 16);
        exit;
    end;
    if DataSetVedomost.IsEmpty then exit;
    if DataSetVedomost.FBN('EXISTS_ZAYAVKA').AsInteger > 0 then exit;
    id_type_vedom_for_edit := StrToInt64(DataSetVedomost.FieldByName('ID_TYPE_VEDOMOST').AsString);
    T := TfmUWAddVedomost2.Create(self, self, 2);


    //изменение в ведомости через авансовые счета
    if (id_type_vedom_for_edit = 2) then
    begin
      t.KEY_SESSION := DataSetVedomost.Database.Gen_Id('GEN_UW_KEY_SESSION', 1);
      T.TabSheetFromAvanceOtchet.Visible := True;
      // вставка в темповую таблицу
      TrW.StartTransaction;
      SProc.StoredProcName := 'UW_INS_TO_VED_TMP_FOR_EDIT';
      SProc.ParamByName('KEY_SESSION').AsInt64 := t.KEY_SESSION;
      SProc.ParamByName('ID_VEDOMOST2').AsInt64 := StrToInt64(DataSetVedomost.fbn('ID_VEDOMOST2').AsString);
      SProc.ExecProc;
      TrW.Commit;
      t.DSetAvOtch.Close;
      t.DSetBudget.Close;
      t.DSetAvOtch.SelectSQL.Text             := 'select * from UW_ADD_VEDOMOST_TMP_SEL(2) where KEY_SESSION = :key';
      t.DSetAvOtch.ParamByName('key').AsInt64 := t.KEY_SESSION;
      //t.DSetBudget.SQLs.SelectSQL.Text        := 'Select * from J4_SELECT_ALL_PROV(:ID_DT_DOC)';
      t.DSetBudget.SQLs.SelectSQL.Text        := 'Select * from UW_ADD_VEDOMOST_BUDGET_TMP_SEL where ID_AO = :ID_AO and key_session = :key';
      t.DSetBudget.ParamByName('key').AsInt64 := t.KEY_SESSION;
      t.DSetAvOtch.Open;
      t.DSetBudget.Open;
      t.PageControlVedomost.ActivePage := t.TabSheetFromAvanceOtchet;
    end
    else
    begin
      T.TabSheetFromAvanceOtchet.Visible := False;
    end;  
    T.ShowModal;
    T.Free;
    ToolButton4.Click;
    DataSetVedomost.Locate('ID_VEDOMOST2',IntToStr(id),[]);
end;

procedure TfmUWMainVedomost2.ATakeExecute(Sender: TObject);
{var
    count_multy, i : integer;
    id_loc : int64;
}begin
{    if not DataSetVedomost.isEmpty then
    begin
        count_multy := cxGrid1DBTableView1.DataController.GetSelectedCount;
        ResValue    := VarArrayCreate([0, count_multy-1], varVariant);
        for i := 0 to count_multy-1 do
        begin
            id_loc := cxGrid1DBTableView1.DataController.GetRecordId(cxGrid1DBTableView1.Controller.SelectedRecords[i].RecordIndex);
            DataSetVedomost.Locate('ID_DT_VEDOMOST', id_loc, []);
            ResValue[i] := VarArrayOf([DataSetVedomost.FieldByName('ID_DT_VEDOMOST').AsString,
                                       DataSetVedomost.FieldByName('NOMER').AsString,
                                       DataSetVedomost.FieldByName('DATE_VEDOMOST').AsDateTime,
                                       DataSetVedomost.FieldByName('ID_SP_TY_VEDOMOST').AsString,
                                       DataSetVedomost.FieldByName('NAME_VEDOMOST').AsString,
                                       DataSetVedomost.FieldByName('SUM_VEDOMOST').AsCurrency
                                       ]);
        end;
        Close;
    end;}
end;

procedure TfmUWMainVedomost2.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    ATakeExecute(Sender);
end;

procedure TfmUWMainVedomost2.AZayavkaExecute(Sender: TObject);
var
    i, o : TAArray;
    id_dog, id_v, id_g, id_pkv, id_type_f : int64;
    k, error : integer;
begin
    error := fibCheckPermission('/ROOT/Vedomost','DONE');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar('Ви не маєте права робити це!'), PChar('Увага'), 16);
        exit;
    end;
    if DataSetVedomost.IsEmpty then Exit;
    if DataSetVedomost.FBN('EXISTS_ZAYAVKA').AsInteger > 0 then exit;
    //ShowMessage(IntToStr(DataSetVedomost.FBN('EXISTS_ZAYAVKA').AsInteger));
    id_v := StrToInt64(DataSetVedomost.fbn('ID_VEDOMOST2').AsString);

    TrW.DefaultDatabase := DB;
    SP.Database         := DB;
    SP.Transaction      := TrW;
    try
        TrW.StartTransaction;
        SP.StoredProcName := 'UW2_UPDATE_PROV_PRK_TYPE_FIN';
        SP.ParamByName('ID_DT_VEDOMOST2').AsInt64   := id_v;
        SP.ExecProc;
        TrW.Commit;
    except on E:Exception do begin
        TrW.Rollback;
        ShowMessage(E.Message);
        exit;
    end end;
    DS.Close;
    DS.SQLs.SelectSQL.Text := 'select * from UW2_SELECT_DOG_VEDOMOST('+IntToStr(id_v)+')';
    DS.Open;
    DS.First;

    while not DS.Eof do
    begin
        if DS.fbn('ID_RATE_ACC_NATIVE').IsNull then
        begin
            showmessage('Заявка не може бути сформованною! Помилка в данних: ''Не знайден регистраційний рахунок!''');
            exit;
        end;
        if DS.fbn('ID_PKV').IsNull then
        begin
            showmessage('Заявка не може бути сформованною! Помилка в данних: ''Не знайдена програма!''');
            exit;
        end;
        if DS.fbn('ID_BANK_DOGOVOR').IsNull then
        begin
            showmessage('Заявка не може бути сформованною! Помилка в данних: ''Не знайден банківський договір!''');
            exit;
        end;
        if DS.fbn('ID_TYPE_DOG').IsNull then
        begin
            showmessage('Заявка не може бути сформованною! Помилка в данних: ''Не знайден тип договору!''');
            exit;
        end;
        if DS.fbn('ID_CUSTOMER').IsNull then
        begin
            showmessage('Заявка не може бути сформованною! Помилка в данних: ''Не знайден контрагент!''');
            exit;
        end;
        if DS.fbn('ID_TYPE_FINANCE').IsNull then
        begin
            showmessage('Заявка не може бути сформованною! Помилка в данних: ''Не знайден тип финансування!''');
            exit;
        end;
        DS.Next;
    end;

    DS.First;

    while not DS.Eof do
    begin
        if not DS.fbn('ID_RATE_ACCOUNT').IsNull then
        begin 
            i := TAArray.Create;
            o := TAArray.Create;
            i['Database'].AsObject            := DB;
            i['Transaction'].AsObject         := TWrite;
            i['d_id_rate_account'].AsInt64    := StrToInt64(DS.fbn('ID_RATE_ACCOUNT').AsString);
            i['d_id_rate_acc_native'].AsInt64 := StrToInt64(DS.fbn('ID_RATE_ACC_NATIVE').AsString);
            i['d_id_customer'].AsInt64        := StrToInt64(DS.fbn('id_customer').AsString);
            i['d_name_customer'].AsString     := DS.fbn('name_customer').AsString;
            i['d_id_tip_dog'].AsInt64         := StrToInt64(DS.fbn('ID_TYPE_DOG').AsString);
            i['d_id_user'].AsInt64            := id_user_;
            i['d_dog_note'].AsString          := DataSetVedomost.fbn('COMMENT2').AsString;
            id_g                              := StrToInt64(DS.fbn('ID_BANK_DOGOVOR').AsString);
            id_pkv                            := StrToInt64(DS.fbn('ID_PKV').AsString);
            id_type_f                         := StrToInt64(DS.fbn('ID_TYPE_FINANCE').AsString);

            DSCombo.Close;
            DSCombo.SQlS.SelectSql.Text := 'select * from UW2_SELECT_DOG_VEDOMOST_PR('+IntToStr(id_v)+', '+IntToStr(id_g)+', '+IntToStr(id_pkv)+', '+IntToStr(id_type_f)+')';
            DSCombo.Open;
            DSCombo.FetchAll;
            DSCombo.First;
            i['SMET']['COUNT'].AsInteger      := DSCombo.RecordCount; 
            k := 0;
            DSCombo.First;  
            while not DSCombo.Eof do  
            begin
                i['SMET'][k]['d_id_smeta'].AsInt64      := strToint64(DSCombo.fbn('ID_SMETA').AsString);
                i['SMET'][k]['d_id_stat'].AsInt64       := strToint64(DSCombo.fbn('ID_STATE').AsString);
                i['SMET'][k]['d_razd'].AsInt64          := strToint64(DSCombo.fbn('ID_RAZD').AsString);
                i['SMET'][k]['d_summa_sm'].AsCurrency   := DSCombo.fbn('SUMMA').AsCurrency;
                i['SMET'][k]['d_id_people'].AsInt64     := strToint64(DSCombo.fbn('ID_MAN').AsString);
                i['SMET'][k]['d_id_kekv'].AsInt64       := strToint64(DSCombo.fbn('ID_KEKZ').AsString);
                i['SMET'][k]['ID_DOG_BANKCARD'].AsInt64 := strToint64(DSCombo.fbn('ID_REAL_BANK_DOG').AsString);
                inc(k);
                DSCombo.Next;
            end;
            dog_add_dogovor_ext(i, o);
            if o['Result'].AsVariant = false then
            begin
                ShowMessage(o['Message'].AsString);
                Exit;
            end;
            id_dog := o['ID_DOG'].asInt64;
            i.Free;
            o.Free;

            TrW.DefaultDatabase := DB;
            SP.Database         := DB;
            SP.Transaction      := TrW;
            try
                TrW.StartTransaction;
                SP.StoredProcName := 'UW2_UPDATE_PROV';
                SP.ParamByName('ID_DT_VEDOMOCT2').AsInt64   := id_v;
                SP.ParamByName('ID_BANK_DOG').AsInt64       := id_g;
                SP.ParamByName('ID_DOG').AsInt64            := id_dog;
                SP.ParamByName('ID_PKV').AsInt64            := id_pkv;
                SP.ParamByName('ID_TYPE_FINANCE').AsInt64   := id_type_f;
                SP.ExecProc;
                TrW.Commit;
            except on E:Exception do begin
                TrW.Rollback;
                ShowMessage(E.Message);
                exit;
            end end;
        end else
        begin
            Showmessage('Не знайдено р/р, заявка не була зформована!');
        end;
        DS.Next;
    end;
    showmessage(UWResourcesUnit.V2_VEDOMOST_ZAYAVKA_D[index_lang]);
    ARefreshExecute(Sender);
end;

procedure TfmUWMainVedomost2.ToolButton10Click(Sender: TObject);
begin
    cxGrid1DBTableView1.OptionsView.GroupByBox := not cxGrid1DBTableView1.OptionsView.GroupByBox;
    cxGridDBTableView1.OptionsView.GroupByBox  := not cxGridDBTableView1.OptionsView.GroupByBox;
    cxGridDBTableView2.OptionsView.GroupByBox  := not cxGridDBTableView2.OptionsView.GroupByBox;
end;

procedure TfmUWMainVedomost2.DataSetVedomostAfterScroll(DataSet: TDataSet);
begin
    if not DataSetVedomost.IsEmpty then
    begin
        cxLabel5.Caption := UWResourcesUnit.V2_VEDOMOST_COMMENT[index_lang] + DataSetVedomost.fbn('COMMENT2').AsString;
        if DataSetVedomost.fbn('EXISTS_ZAYAVKA').AsInteger = 1 then
        begin
            ToolButton2.Enabled   := false;
            ToolButton3.Enabled   := false;
            ToolButton8.Enabled   := false;
            ToolButton11.Enabled  := true;
        end else
        begin
            ToolButton2.Enabled   := true;
            ToolButton3.Enabled   := true;
            ToolButton8.Enabled   := true;
            ToolButton11.Enabled  := false;
        end;
    end;
end;

procedure TfmUWMainVedomost2.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;

  //платежки все проплачены
  if (AViewInfo.GridRecord.Values[cxGrid1DBTableView1DBColumn7.Index] = 1) then
  begin
      ACanvas.Canvas.Font.Color := RGB(60,170,60);//зеленый;
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;
  //платежки частично проплачены
  if (AViewInfo.GridRecord.Values[cxGrid1DBTableView1DBColumn7.Index] = 2) then
  begin
      ACanvas.Canvas.Font.Color := RGB(0,0,255);//синий;
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;
  //платежки не проплачены
  if (AViewInfo.GridRecord.Values[cxGrid1DBTableView1DBColumn7.Index] = 3) then
  begin
      ACanvas.Canvas.Font.Color := RGB(255,38,0);//красный;
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;
  {if (not AViewInfo.GridRecord.Focused) then
  begin
      ACanvas.Canvas.Font.Color := clBlack;
      ACanvas.Canvas.FillRect(Arect);
  end;  }
end;

procedure TfmUWMainVedomost2.ADelZayavkaExecute(Sender: TObject);
var
    i, o : TAArray;
    id_v, id_g, id_type_f, id_pkv : int64;
    error : integer;
    s : string;
begin
    error := fibCheckPermission('/ROOT/Vedomost','UNDONE');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar('Ви не маєте права робити це!'), PChar('Увага'), 16);
        exit;
    end;
    if DataSetVedomost.IsEmpty then Exit;
    if DataSetVedomost.FBN('EXISTS_ZAYAVKA').AsInteger <> 1 then exit;
    s := UWResourcesUnit.MY_CONST_MESSAGE_WARNING[index_lang];
    if DS_dog.FBN('SUM_PAY').AsFloat  <> 0 then
    begin
        MessageBox(Handle, PChar('Ви не можете разформувати заявку, бо деяка сумма вже сплачена!'), PChar('Увага'), 16);
        Exit;
    end;
    if MessageBox(Handle, Pchar('Ви дійсно бажаєте розформувати заявки?'), Pchar(s), MB_YESNO + MB_DEFBUTTON2) = mrNo then
    begin
        exit;
    end;
    id_v := StrToInt64(DataSetVedomost.fbn('ID_VEDOMOST2').AsString);
    DS.Close;
    DS.SQLs.SelectSQL.Text := 'select * from UW2_SELECT_DOG_VEDOMOST('+IntToStr(id_v)+')';
    DS.Open;
    DS.First;
    while not DS.Eof do
    begin
        i := TAArray.Create;
        o := TAArray.Create;
        i['Database'].AsObject            := DB;
        i['Transaction'].AsObject         := TWrite;
        i['id_dog'].AsInt64               := StrToInt64(DS.fbn('ID_DOG').AsString);
        i['d_id_user'].AsInt64            := id_user_;
        id_g   := StrToInt64(DS.fbn('ID_BANK_DOGOVOR').AsString);
        id_pkv     := StrToInt64(DS.fbn('ID_PKV').AsString);
        id_type_f  := StrToInt64(DS.fbn('ID_TYPE_FINANCE').AsString);

        
        dog_close_dogovor_ext(i, o);
        if o['Result'].AsVariant = 0 then
        begin
            ShowMessage(o['Message'].AsString);
            Exit;
        end;
        i.Free;
        o.Free;

        TrW.DefaultDatabase := DB;
        SP.Database         := DB;
        SP.Transaction      := TrW;
        try
            TrW.StartTransaction;
            SP.StoredProcName := 'UW2_UPDATE_PROV';
            SP.ParamByName('ID_DT_VEDOMOCT2').AsInt64   := id_v;
            SP.ParamByName('ID_BANK_DOG').AsInt64       := id_g;
            SP.ParamByName('ID_DOG').AsInt64            := -1;
            SP.ParamByName('ID_PKV').AsInt64            := id_pkv;
            SP.ParamByName('ID_TYPE_FINANCE').AsInt64   := id_type_f;
            SP.ExecProc;
            TrW.Commit;
        except on E:Exception do begin
            TrW.Rollback;
            ShowMessage(E.Message);
            exit;
        end end;

        DS.Next;
    end;
    showmessage(UWResourcesUnit.V2_VEDOMOST_DEL_ZAYAVKA_[index_lang]);
    ARefreshExecute(Sender);
end;

procedure TfmUWMainVedomost2.Action1Execute(Sender: TObject);
begin
    if not DataSetVedomost.IsEmpty then
    begin
        showmessage(DataSetVedomost.fbn('ID_VEDOMOST2').AsString);
    end;
end;

procedure TfmUWMainVedomost2.cxGridDBTableView2DblClick(Sender: TObject);
Var
    id_v, id_d : int64;
begin
    if not DS_dog.IsEmpty then
    begin
        id_v := StrToInt64(DataSetVedomost.fbn('ID_VEDOMOST2').AsString);
        id_d := StrToInt64(DS_dog.fbn('ID_DOG').AsString);
        ShowUWPeopleZayav(Self, DB, id_v, id_d);
    end;
end;

procedure TfmUWMainVedomost2.cxGridDBTableView2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
Var
    id_v, id_d : int64;
begin
    if key = VK_RETURN then
    begin
        if not DS_dog.IsEmpty then
        begin
            id_v := StrToInt64(DataSetVedomost.fbn('ID_VEDOMOST2').AsString);
            id_d := StrToInt64(DS_dog.fbn('ID_DOG').AsString);
            ShowUWPeopleZayav(Self, DB, id_v, id_d);
        end;
    end;
end;

procedure TfmUWMainVedomost2.cxCheckBox1Click(Sender: TObject);
begin
    if cxCheckBox1.Checked then
    begin
        cxButtonEdit1.Enabled := true;
    end else
    begin
        cxButtonEdit1.Enabled := false;
    end;
end;

procedure TfmUWMainVedomost2.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : Variant;
begin
    res := Un_lo_file_Alex.mY_getManEx(self, DB.Handle, False, false, id_people);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null){ and (res[1]<>null) }then
        begin
            id_people           := res[0];
            cxButtonEdit1.Text  := res[1];//єъЁ
        end;
    end;
end;

procedure TfmUWMainVedomost2.N1Click(Sender: TObject);
var
    error : integer;
//    id_type_vedom : int64;
begin
    error := fibCheckPermission('/ROOT/Vedomost','Print');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar('Ви не маєте права робити це!'), PChar('Увага'), 16);
        exit;
    end;
    if DataSetVedomost.IsEmpty then exit;
{    id_type_vedom := StrToint64(DataSetVedomost.fbn('ID_SP_TY_VEDOMOST').AsString);
    DS.Close;
    DS.SQLs.SelectSQL.Text := 'select * from UW_PRINT_SSHABLON_SELECT('+IntToStr(id_type_vedom)+')';
    DS.Open;
    }
    frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Vedomost\Vedomost_1020001.fr3');
{    frxReport1.Variables['podpis2']  := QuotedStr(DS.fbn('NAME_PODPIS2').AsString);
    frxReport1.Variables['podpis1']  := QuotedStr(DS.fbn('NAME_PODPIS1').AsString);
    frxReport1.Variables['dolj1']    := QuotedStr(DS.fbn('DOLJNOST1').AsString);
    frxReport1.Variables['dolj2']    := QuotedStr(DS.fbn('DOLJNOST2').AsString);
    frxReport1.Variables['title_s']  := QuotedStr(DS.fbn('TITLE_SHABLON').AsString);
    frxReport1.Variables['name_s']   := QuotedStr(DS.fbn('NAME_SHABLON').AsString);
    frxReport1.Variables['name_pr']  := QuotedStr(DS.fbn('NAME_PRED').AsString);
 }
    frxReport1.Variables['num_ved']  := QuotedStr(DataSetVedomost.fbn('NOMBER_VEDOMOST2').AsString);
    frxReport1.Variables['date_ved'] := QuotedStr(DataSetVedomost.fbn('DATE_VEDOMOST2').AsString);

    frxReport1.Variables['comp']     := QuotedStr(GetComputerNetName);
    frxReport1.Variables['id_user']  := QuotedStr(IntToStr(id_user_));


    frxReport1.PrepareReport(true);
    frxReport1.ShowReport(true);
//    DS.Close;
end;

procedure TfmUWMainVedomost2.N2Click(Sender: TObject);
var
    error : integer;
//    id_type_vedom : int64;
begin
    error := fibCheckPermission('/ROOT/Vedomost','Print');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar('Ви не маєте права робити це!'), PChar('Увага'), 16);
        exit;
    end;
    if DataSetVedomost.IsEmpty then exit;
{    id_type_vedom := StrToint64(DataSetVedomost.fbn('ID_SP_TY_VEDOMOST').AsString);
    DS.Close;
    DS.SQLs.SelectSQL.Text := 'select * from UW_PRINT_SSHABLON_SELECT('+IntToStr(id_type_vedom)+')';
    DS.Open;
    }
    frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Vedomost\Vedomost_1000006.fr3');

    frxReport2.Variables['num_ved']  := QuotedStr(DataSetVedomost.fbn('NOMBER_VEDOMOST2').AsString);
    frxReport2.Variables['date_ved'] := QuotedStr(DataSetVedomost.fbn('DATE_VEDOMOST2').AsString);

    frxReport2.Variables['comp']     := QuotedStr(GetComputerNetName);
    frxReport2.Variables['id_user']  := QuotedStr(IntToStr(id_user_));


    frxReport2.PrepareReport(true);
    frxReport2.ShowReport(true);

end;

procedure TfmUWMainVedomost2.APrintVedExecute(Sender: TObject);
begin
//
end;

procedure TfmUWMainVedomost2.N3Click(Sender: TObject);
var
  error : integer;
begin
  error := fibCheckPermission('/ROOT/Vedomost','Print');
  if error <> 0 then
  begin
    MessageBox(Handle, PChar('Ви не маєте права робити це!'), PChar('Увага'), 16);
    exit;
  end;

  if DataSetVedomost.IsEmpty then exit;

  DSetPrintReestAvOtchVed.Close;
  DSetPrintReestAvOtchVed.SQLs.SelectSQL.Text := 'select * from UW_SEL_R_AV_OTCH_VED_FOR_PRINT(:id_vedomost)';
  DSetPrintReestAvOtchVed.ParamByName('id_vedomost').AsInt64 := StrToInt64(DataSetVedomost.fieldbyname('ID_VEDOMOST2').AsString);
  DSetPrintReestAvOtchVed.Open;

  //через ручной ввод
  if (DataSetVedomost['ID_TYPE_VEDOMOST'] = 1) then
  frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Vedomost\Vedomost_ReestrVedRuchnoi.fr3');

  //через авансовые отчеты
  if (DataSetVedomost['ID_TYPE_VEDOMOST'] = 2) then
  begin
    //проверка на настройки ввода ведомостей через авансовые отчеты  (печать приказа)
    DSet.Database := db;
    DSet.Transaction := Transaction;
    dset.close;
    dset.SelectSQL.Text := 'select * from J4_INI';
    dset.open;
    if (dset['J4_IS_PRINT_NAKAZ_IN_VEDOM_AV_O'] = 1)then
    begin
      frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Vedomost\Vedomost_ReestrVedAvOtchNakaz.fr3');
    end
    else
    begin
      frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Vedomost\Vedomost_ReestrVedAvOtch.fr3');
    end;    
  end;

  frxReport2.Variables['num_ved']  := QuotedStr(DataSetVedomost.fbn('NOMBER_VEDOMOST2').AsString);
  frxReport2.Variables['date_ved'] := QuotedStr(DataSetVedomost.fbn('DATE_VEDOMOST2').AsString);

  frxReport2.Variables['comp']     := QuotedStr(GetComputerNetName);
  frxReport2.Variables['id_user']  := QuotedStr(IntToStr(id_user_));
  //frxReport2.designreport;
  frxReport2.PrepareReport(true);
  frxReport2.ShowReport(true);

end;



procedure TfmUWMainVedomost2.cxGridDBTableView2CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  
  if (AViewInfo.GridRecord.Values[cxGridDBTableView2DBColumn7.Index] = 0)  then
  begin
      //платежка не проплачена
      ACanvas.Canvas.Font.Color := RGB(255,38,0);//красная;
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;

  if (AViewInfo.GridRecord.Values[cxGridDBTableView2DBColumn7.Index] = 1)  then
  begin
    //платежка проплачена
      ACanvas.Canvas.Font.Color := RGB(60,170,60);//зеленая;
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;
end;

procedure TfmUWMainVedomost2.cxDateEditBegKeyPress(Sender: TObject;
  var Key: Char);
begin
  cxDateEditBeg.SetFocus;
end;

procedure TfmUWMainVedomost2.cxDateEditEndKeyPress(Sender: TObject;
  var Key: Char);
begin
  cxDateEditEnd.SetFocus;
end;

end.
