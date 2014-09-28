unit AddAvanceVedomost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MainAvanceVedomost, ExtCtrls, cxMemo, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, ComCtrls,
  ToolWin, ActnList, cxClasses, cxStyles, cxGridTableView, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxSplitter,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridDBTableView,
  cxGrid, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel,
  cxGridBandedTableView, cxGridDBBandedTableView, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxCurrencyEdit, cxButtonEdit,
  FIBQuery, pFIBQuery, pFIBStoredProc, RxMemDS;

type
  AAA = (addV, EditV, ShowV);
  TfmAddAvanceVedomost = class(TForm)
    cxDateEdit1: TcxDateEdit;
    cxTextEdit1: TcxTextEdit;
    cxMemo1: TcxMemo;
    cxTextEdit2: TcxTextEdit;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
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
    ActionList1: TActionList;
    AAdd: TAction;
    AEdit: TAction;
    ADel: TAction;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxSplitter1: TcxSplitter;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ASave: TAction;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid2DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    DSMain: TpFIBDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DSRight: TpFIBDataSet;
    DB: TpFIBDatabase;
    Tr: TpFIBTransaction;
    DSMainID_SESSION: TFIBBCDField;
    DSMainID_VEDOMOST: TFIBBCDField;
    DSMainNOMER_VED: TFIBStringField;
    DSMainDATE_VED: TFIBDateField;
    DSMainSUMMA: TFIBBCDField;
    cxGrid2DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    sch: TcxButtonEdit;
    cxTextEdit3: TcxTextEdit;
    DSRightID_DT_PROV_VEDOMOST: TFIBBCDField;
    DSRightID_DT_VEDOMOST: TFIBBCDField;
    DSRightID_MAN: TFIBBCDField;
    DSRightID_SCH: TFIBBCDField;
    DSRightID_SMETA: TFIBBCDField;
    DSRightID_RAZD: TFIBBCDField;
    DSRightID_STATE: TFIBBCDField;
    DSRightID_KEKV: TFIBBCDField;
    DSRightID_DOG: TFIBBCDField;
    DSRightKOD_DOG: TFIBBCDField;
    DSRightSUMA: TFIBBCDField;
    DSRightID_SP_BANKCARD: TFIBBCDField;
    DSRightFIO: TFIBStringField;
    DSRightSCH_NUMBER: TFIBStringField;
    DSRightSCH_TYTLE: TFIBStringField;
    DSRightSMETA_KOD: TFIBIntegerField;
    DSRightSMETA_TYTLE: TFIBStringField;
    DSRightRAZD_NUM: TFIBIntegerField;
    DSRightRAZD_TYTLE: TFIBStringField;
    DSRightSTATE_KOD: TFIBIntegerField;
    DSRightSTATE_TYTLE: TFIBStringField;
    DSRightKEKV_KOD: TFIBIntegerField;
    DSRightKEKV_TYTLE: TFIBStringField;
    DSRightNUM_DOG: TFIBStringField;
    DSRightDATE_DOG: TFIBDateField;
    DSRightNAME_CUST: TFIBStringField;
    DSRightREG_DOG: TFIBStringField;
    DSRightLIC_BANKCARD: TFIBStringField;
    DSRightCOMENT_NANKCARD: TFIBStringField;
    DSRightSCH_NUMBER_KOR: TFIBStringField;
    DSRightSCH_TITLE_KOR: TFIBStringField;
    TWr: TpFIBTransaction;
    StoredPr: TpFIBStoredProc;
    Class_DataSet: TpFIBDataSet;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    cxLabel15: TcxLabel;
    cxTextEdit4: TcxTextEdit;
    cxLabel16: TcxLabel;
    cxTextEdit5: TcxTextEdit;
    cxLabel17: TcxLabel;
    cxTextEdit6: TcxTextEdit;
    cxLabel18: TcxLabel;
    cxTextEdit7: TcxTextEdit;
    TabSheet3: TTabSheet;
    cxMemo2: TcxMemo;
    TabSheet4: TTabSheet;
    cxGrid4: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView2DBColumn1: TcxGridDBColumn;
    cxGridDBTableView2DBColumn2: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxSplitter2: TcxSplitter;
    DataSetError: TpFIBDataSet;
    DataSourceError: TDataSource;
    RxError: TRxMemoryData;
    procedure cxButton2Click(Sender: TObject);
    procedure Refresh_left;
    procedure Refresh_right;
    procedure SaveList(id_session_v, id_session_list : int64);
    procedure ADelExecute(Sender: TObject);
    procedure schPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure selectSch(flag : boolean);
    procedure AAddExecute(Sender: TObject);
    procedure ASaveExecute(Sender: TObject);
    procedure DeleteAll(id_ses :int64);
  private
    id_session, id_sch_kor, id_session_list, id_session_zapis : int64;
  public
    myform : TfmMainAvanceVedomost;
    mm     : AAA;
    constructor Create(AOwner : TComponent; mform : TfmMainAvanceVedomost; m : AAA); reintroduce; overload;
  end;

implementation
uses GlobalSPR,
     UWLoaderUnit,
     kernel,
     Un_R_file_Alex;
{$R *.dfm}

{ TfmAddAvanceVedomost }

constructor TfmAddAvanceVedomost.Create(AOwner : TComponent;
  mform : TfmMainAvanceVedomost; m : AAA);
begin
    inherited Create (AOwner);

    myform                := mform;
    mm                    := m;
    DB                    := mform.D;
    Tr.DefaultDatabase    := DB;
    DB.DefaultTransaction := Tr;

    DSRight.Database      := DB;
    DSRight.Transaction   := Tr;

    DSMain.Database       := DB;
    DSMain.Transaction    := Tr;

    TR.StartTransaction;

    id_sch_kor            := myform.id_sch;
    sch.Text              := myform.sch_kod;
    cxTextEdit3.Text      := myform.sch_title;

    cxDateEdit1.Date      := Date;
    cxSplitter2.CloseSplitter;

    id_session_list := DB.Gen_Id('J4_TEMP_VEDOMOST_LIST', 1);

    id_session := myform.id_ses_ved;

    SaveList(id_session, id_session_list);

    selectSch(false);

    DSRight.SQLs.SelectSQL.Text := 'select * from J4_TEMP_VEDOMOST_LIST_RIGHT(?ID_VEDOMOST, '+IntToStr(id_sch_kor)+', '''+DateToStr(cxDateEdit1.Date)+''')';

    DSMain.Close;
    DSMain.SQLs.SelectSQL.Text := 'select * from J4_TEMP_VEDOMOST_LIST_SELECT('+IntToStr(id_session_list)+')';
    DSMain.Open;
end;

procedure TfmAddAvanceVedomost.cxButton2Click(Sender: TObject);
begin
    TWr.DefaultDatabase  := DB;
    StoredPr.Database    := DB;
    StoredPr.Transaction := TWr;
    TWr.StartTransaction;

    try
        StoredPr.StoredProcName := 'J4_TEMP_VEDOMOST_LIST';
        StoredPr.Prepare;
        StoredPr.ParamByName('D_ID_SESSION').AsInt64 := id_session_list;
        StoredPr.ExecProc;

        TWr.Commit;
    except
        TWr.Rollback;
    end;
    Close;
end;

procedure TfmAddAvanceVedomost.Refresh_left;
begin
    DSMain.Close;
    DSRight.Close;
    DSRight.SQLs.SelectSQL.Text := 'select * from J4_TEMP_VEDOMOST_LIST_RIGHT(?ID_VEDOMOST, '+IntToStr(id_sch_kor)+', '''+DateToStr(cxDateEdit1.Date)+''')';

    DSMain.SQLs.SelectSQL.Text := 'select * from J4_TEMP_VEDOMOST_LIST_SELECT('+IntToStr(id_session_list)+')';
    DSMain.Open;
end;

procedure TfmAddAvanceVedomost.Refresh_right;
begin
    DSRight.Close;
    DSRight.SQLs.SelectSQL.Text := 'select * from J4_TEMP_VEDOMOST_LIST_RIGHT(?ID_VEDOMOST, '+IntToStr(id_sch_kor)+', '''+DateToStr(cxDateEdit1.Date)+''')';
    DSRight.Open;
end;

procedure TfmAddAvanceVedomost.SaveList(id_session_v,
  id_session_list: int64);
begin
    TWr.DefaultDatabase  := DB;
    StoredPr.Database    := DB;
    StoredPr.Transaction := TWr;
    TWr.StartTransaction;

    try
        StoredPr.StoredProcName := 'J4_TEMP_VEDOMOST_LIST_INSERT';
        StoredPr.Prepare;
        StoredPr.ParamByName('D_ID_SESSION_VED').AsInt64 := id_session_v;
        StoredPr.ParamByName('D_ID_SESSION_LIST').AsInt64 := id_session_list;
        StoredPr.ExecProc;

        StoredPr.StoredProcName := 'UW_TEMP_SP_DELETE';
        StoredPr.Prepare;
        StoredPr.ParamByName('D_ID_SESSION').AsInt64 := id_session_v;
        StoredPr.ExecProc;

        TWr.Commit;
    except on E:Exception do
        begin
            TWr.Rollback;
            showmessage(E.Message);
            exit;
        end
    end;

//    Refresh_left;
end;

procedure TfmAddAvanceVedomost.ADelExecute(Sender: TObject);
begin
    if not DSMain.IsEmpty then
    begin
        if MessageBox(Handle, Pchar('Ви дійсно бажаєте видалити відомість № '+DSMain.FieldByName('NOMER_VED').AsString + ' від ' + DSMain.FieldByName('DATE_VED').AsString + '?'), Pchar('Увага!'), MB_YESNO + MB_DEFBUTTON2)=mrYes then
        begin
            TWr.DefaultDatabase  := DB;
            StoredPr.Database    := DB;
            StoredPr.Transaction := TWr;
            TWr.StartTransaction;

            try
                StoredPr.StoredProcName := 'J4_TEMP_VEDOMOST_LIST_D_VED';
                StoredPr.Prepare;
                StoredPr.ParamByName('D_ID_SESSION').AsInt64  := id_session_list;
                StoredPr.ParamByName('D_ID_VEDOMOST').AsInt64 := StrToint64(DSMain.fbn('ID_VEDOMOST').AsString);
                StoredPr.ExecProc;

                TWr.Commit;
            except on E:Exception do
                begin
                    TWr.Rollback;
                    showmessage(E.Message);
                    exit;
                end
            end;

            Refresh_left;
        end;
    end;
end;

procedure TfmAddAvanceVedomost.schPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
    selectSch(true);
end;

procedure TfmAddAvanceVedomost.selectSch(flag: boolean);
var
    res : variant;
begin
    res := GlobalSPR.GetSch(self, DB.Handle, fsNormal, cxDateEdit1.Date, 1, 0, id_sch_kor);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
            id_sch_kor        := res[0][0];
            sch.Text          := res[0][3];
            cxTextEdit3.Text  := res[0][1];
        end;
        if flag then
        begin
            Refresh_left;
        end;
    end;
end;

procedure TfmAddAvanceVedomost.AAddExecute(Sender: TObject);
var
    id_ses : int64;
begin
    id_ses := UWLoaderUnit.LoadSelectVedomostOutput(Self, DB, myform.id_users, -1, myform.cxDateEdit1.Date, myform.cxDateEdit2.Date);
    if id_ses > 0 then
    begin
        SaveList(id_ses, id_session_list);
        Refresh_left;
    end;
end;

procedure TfmAddAvanceVedomost.ASaveExecute(Sender: TObject);
var
    id_all_doc, id_ao : int64;
    i : integer;
    STRU : KERNEL_MODE_STRUCTURE;
    errorList : TstringList;
    DoResult, flag : boolean;
    mes : string;
begin

    cxTextEdit2.Text    := StringReplace(cxTextEdit2.Text, '''', '''''', [rfReplaceAll]);
    cxMemo1.Text        := StringReplace(cxMemo1.Text, '''', '''''', [rfReplaceAll]);

    flag := false;
    mes := '';
    //проверка на корректность данных
    if cxTextEdit1.Text ='' then
    begin
        mes := 'нет номера';
        cxTextEdit1.SetFocus;
        flag := true;
        cxTextEdit1.style.Color := clred;
    end else
        cxTextEdit1.style.Color := $00E7FFFF;

    if cxTextEdit2.Text ='' then
    begin
        mes := 'нет ФИО';
        cxTextEdit2.SetFocus;
        flag := true;
        cxTextEdit2.style.Color := clred;
    end else
        cxTextEdit2.style.Color := $00E7FFFF;

    if cxMemo1.Text = '' then
    begin
        if not flag then
        begin
            mes := '';
            cxMemo1.SetFocus;
        end;
        cxMemo1.style.Color := clred;
        FLAG := TRUE;
    end ELSE
        cxMemo1.style.Color := $00E7FFFF;

    if flag then
    begin
        showmessage(mes);
        exit;
    end;

    id_session_zapis := DB.Gen_Id('KERNEL_GEN_ID_SESSION', 1);

    if MM = addV then
    begin


        StoredPr.Database          := DB;
        DataSetError.Database      := DB;
        StoredPr.Transaction       := TWr;
        Class_DataSet.Database     := DB;
        Class_DataSet.Transaction  := TWr;
        DataSetError.Transaction   := TWr;
        TWr.StartTransaction;
        try
            Class_DataSet.Close;
            Class_DataSet.SQLs.SelectSQL.Text:='select * from J4_INSERT_ALL_DOC_VEDOM('''+cxTextEdit2.Text+''', '''+cxMemo1.Text+''', ''' + StringReplace(cxGrid1DBBandedTableView1.DataController.Summary.FooterSummaryValues[0],',','.',[]) + ''', '+IntTostr(id_session_zapis)+', '''+cxDateEdit1.Text+''', '''+cxTextEdit1.text+''', '+IntToStr(40005)+', '''+GetComputerNetName+''', '+IntToStr(0)+', '+inttostr(0)+')';
            Class_DataSet.Open;
            id_all_doc := TFIBBCDField(Class_DataSet.FieldByName('R_ID')).AsInt64;
            Class_DataSet.Close;

            StoredPr.StoredProcName:='J4_INSERT_ALL_PROV_VEDOM';
            StoredPr.Prepare;
            StoredPr.ParamByName('D_KEY_SESSION').AsInt64  := id_session_zapis;
            StoredPr.ParamByName('D_TODAY').AsDate         := cxDateEdit1.Date;
            StoredPr.ParamByName('D_ID_SESSION').AsInt64   := id_session_list;
            StoredPr.ParamByName('D_ID_KOR_SCH').AsInt64   := id_sch_kor;
            StoredPr.ExecProc;

            TWr.Commit;

            StoredPr.Database            := DB;
            DataSetError.Database        := DB;
            StoredPr.Transaction         := TWr;
            Class_DataSet.Database       := DB;
            Class_DataSet.Transaction    := TWr;
            TWr.StartTransaction;

            Class_DataSet.Close;
            Class_DataSet.SQLs.SelectSQL.Text := 'select * from J4_DT_VEDOMOST_INSERT(''' + cxTextEdit1.Text+''', ''' + cxDateEdit1.Text + ''', ''' + StringReplace(cxGrid1DBBandedTableView1.DataController.Summary.FooterSummaryValues[0], ',', '.', []) + ''', '''+cxMemo1.Text+''', '+IntToStr(myform.id_system)+', ' + IntToStr(myform.id_users) + ', ' + IntToStr(id_all_doc) +')';
//            cxMemo2.Text := Class_DataSet.SQLs.SelectSQL.Text;

            Class_DataSet.Open;
            if Class_DataSet.FieldByName('FLAG').AsInteger = 0 then
            begin
                TWr.Rollback;
                Showmessage('Такой номер есть');
                Exit;
            end;
            id_ao := StrToInt64(Class_DataSet.FieldByName('ID_J4_DT_VEDOMOST').AsString);
            Class_DataSet.Close;

            StoredPr.StoredProcName:='J4_DT_VEDOMOST_V_INSERT';
            StoredPr.Prepare;
            StoredPr.ParamByName('D_PK_ID').AsInt64       := id_all_doc;
            StoredPr.ParamByName('D_ID_SESSION').AsInt64  := id_session_list;
            StoredPr.ParamByName('D_DOC').AsInt64         := id_ao;
            StoredPr.ExecProc;

            STRU.DBHANDLE      := DB.Handle;
            STRU.TRHANDLE      := TWr.Handle;
            STRU.KERNEL_ACTION := 1;
            STRU.KEY_SESSION   := id_session_zapis;
            STRU.WORKDATE      := cxDateEdit1.Date;
            STRU.ID_USER       := myform.id_users;
            DoResult           := false;
            try
                DoResult := Kernel.KernelDo(@STRU);
            except on E:Exception do
                begin
                    ShowMessage(Un_R_file_Alex.MY_ERROR_KERNELL+E.Message);
//                            DecimalSeparator := ',';
{                            if delete_buff = 1 then
                            begin
                                 DelBuffer(id_session);
                            end;}
                    TWr.Rollback;
                end;
            end;
            if DoResult then
            begin
//                        DecimalSeparator := ',';
{                        if delete_buff = 1 then
                        begin
                            DelBuffer(id_session_zapis);
                        end;}

                StoredPr.StoredProcName := 'J4_TEMP_VEDOMOST_LIST_D_ALL';
                StoredPr.Prepare;
                StoredPr.ParamByName('D_ID_SESSION').AsInt64  := id_session_list;
                StoredPr.ExecProc;

                TWr.Commit;
                myform.ARefreshExecute(sender);
                myform.DS.Locate('DSID_J4_DT_VEDOMOST', id_ao, []);
                close;
            end
            else begin
//                        PageControl1.ActivePage := TabSheet1;
                        PageControl2.ActivePage := TabSheet4;
                        cxSplitter2.OpenSplitter;
                        cxMemo2.Lines.Clear;
                        cxMemo2.Lines.Insert(0, Un_R_file_Alex.MY_DOC_ERROR_KERNELL);
                        ErrorList := Kernel.GetDocErrorsList(@STRU);
                        if ErrorList<>nil then for i:=0 to  ErrorList.Count-1 do cxMemo2.Lines.Insert(0, Un_R_file_Alex.MY_MESSAGE_ERROR +' '+ErrorList.Strings[i]);

                        DataSetError.Close;
                        DataSetError.SelectSQL.Text :='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION)+')';
                        DataSetError.Open;
                        DataSetError.First;
                        RxError.EmptyTable;
                        while not DataSetError.Eof do
                        begin
                            RxError.Open;
                            RxError.Insert;
                            RxError.FieldByName('Rxkod').Value  := DataSetError['ID_ERROR'];
                            RxError.FieldByName('RxName').Value := DataSetError['ERROR_MESSAGE'];
                            RxError.Post;
                            DataSetError.Next;
                        end;
                        DecimalSeparator := ',';
                        //Class_Transaction_Wr.Commit;
{                        if delete_buff = 1 then
                        begin
                            DelBuffer(id_session_zapis);
                        end;}
                        TWr.Rollback;
                        exit;     
            end;
        except on E:Exception do begin
//            DecimalSeparator := ',';
{            if delete_buff = 1 then
            begin
                DelBuffer(id_session_zapis);
            end;}
            TWr.Rollback;
            ShowMessage(E.Message);
            exit;
        end
        end;

    end;
end;

procedure TfmAddAvanceVedomost.DeleteAll(id_ses: int64);
begin
//
end;

end.
