unit fmUP_AcceptForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCommonSp, DB, RxMemDS, FIBDatabase, pFIBDatabase, IBase,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxLabel, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxCheckBox, FIBDataSet, pFIBDataSet, frxClass, frxDBSet,
  ActnList, Registry, FIBQuery, pFIBQuery, pFIBStoredProc, dxStatusBar,
  ExtCtrls, cxRadioGroup, frxExportRTF, frxExportXLS, frxExportHTML,
  frxExportTXT, frxExportXML, frxExportPDF;

type
    TUP_PrintOrder = class(TSprav)
    public
        constructor Create;
        procedure Show; override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

type
  TUP_AcceptForm = class(TForm)
    RxMemoryData1: TRxMemoryData;
    DB: TpFIBDatabase;
    cxTextEdit1: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxCheckBox1: TcxCheckBox;
    DSOrder: TpFIBDataSet;
    Tr: TpFIBTransaction;
    frxDBOrder: TfrxDBDataset;
    ActionList1: TActionList;
    APrintOrder: TAction;
    APrintOrderV: TAction;
    AExit: TAction;
    DSOrderNUM_ORDER: TFIBStringField;
    DSOrderDATE_PROJECT: TFIBDateField;
    DSOrderHASH_CODE: TFIBStringField;
    DSOrderHEADER_TEXT: TMemoField;
    DSOrderSIGNATURE_TEXT: TMemoField;
    DSOrderHEADER_FIO: TFIBStringField;
    DSOrderHEADER_POST: TFIBStringField;
    DSOrderBODY: TMemoField;
    DSOrderDATE_ORDER: TFIBDateField;
    DSOrderPRINT_NAME: TFIBStringField;
    DSOrderNAME_PRED: TFIBStringField;
    DSOrderCITY: TFIBStringField;
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
    DSOrderNUM_PROJECT: TFIBStringField;
    rx1: TRxMemoryData;
    DS: TpFIBDataSet;
    DataSource1: TDataSource;
    frxDBDV: TfrxDBDataset;
    DSV: TpFIBDataSet;
    DSBottom: TpFIBDataSet;
    frxDBDBottom: TfrxDBDataset;
    DSBottomL_SIGNER_FIO: TFIBStringField;
    DSBottomL_SIGNER_POST: TFIBStringField;
    DSBottomL_TYPE_PRINT_NAME: TFIBStringField;
    DSBottomR_SIGNER_FIO: TFIBStringField;
    DSBottomR_SIGNER_POST: TFIBStringField;
    DSBottomR_TYPE_PRINT_NAME: TFIBStringField;
    DSBottomC_SIGNER_FIO: TFIBStringField;
    DSBottomC_SIGNER_POST: TFIBStringField;
    DSBottomC_TYPE_PRINT_NAME: TFIBStringField;
    DSBottomPRINT_NUM: TFIBIntegerField;
    Stored: TpFIBStoredProc;
    TW: TpFIBTransaction;
    dxStatusBar1: TdxStatusBar;
    APereformirPrint: TAction;
    DSItems: TpFIBDataSet;
    DSSelShablon: TpFIBDataSet;
    DSOrderID_LEVEL: TFIBBCDField;
    AShowId: TAction;
    DSVn: TpFIBDataSet;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    RX: TRxMemoryData;
    DataSource2: TDataSource;
    Panel2: TPanel;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    DSOrderDAY_O: TFIBStringField;
    DSOrderMONTH_O: TFIBStringField;
    DSOrderYEAR_O: TFIBStringField;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    RTFExport: TfrxRTFExport;
    HTMLExport: TfrxHTMLExport;
    XLSExport: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
    frxXMLExport1: TfrxXMLExport;
    frxTXTExport1: TfrxTXTExport;
    cxButton4: TcxButton;
    frxR_Order: TfrxReport;
    frxReport_V: TfrxReport;
    DSVBODY: TMemoField;
    DSVNUM_PUNKT: TFIBIntegerField;
    DSVNAME_PUNKT: TMemoField;
    DSVNAME_POST: TFIBStringField;
    DSVNUM_ORDER: TFIBStringField;
    DSVPRINT_NAME: TFIBStringField;
    DSVDATE_ORDER: TFIBDateField;
    DSVHEADER_POST: TFIBStringField;
    DSVHEADER_FIO: TFIBStringField;
    DSVFIRM_NAME: TFIBStringField;
    DSVCITY: TFIBStringField;
    DSVFIO_INS: TFIBStringField;
    DSVDAY_O: TFIBStringField;
    DSVMONTH_O: TFIBStringField;
    DSVYEAR_O: TFIBStringField;
    DSVNAME_DEPARTMENT: TFIBStringField;
    constructor Create(AOwner : TComponent; {hd : integer; }id_ord : int64); reintroduce;
    procedure APrintOrderExecute(Sender: TObject);
    procedure AExitExecute(Sender: TObject);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure CellSelect;
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure APrintOrderVExecute(Sender: TObject);
    procedure PrintOrder(pereformirivat : integer);
    procedure APereformirPrintExecute(Sender: TObject);
    procedure AShowIdExecute(Sender: TObject);
    procedure cxRadioButton2Click(Sender: TObject);
    procedure cxRadioButton1Click(Sender: TObject);
    procedure CellSelect2;
    procedure cxGrid2DBTableView1DblClick(Sender: TObject);
    procedure cxGrid2DBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ZapisPunkt(id_item : int64);
  private
    id_order : int64;
    flag_show : boolean;
  public
  end;

var
//    GLOBAL_HANDLE : integer;
    id_ord        : int64;

implementation
uses //AccMgmt,
     NagScreenUnit,
     shellapi,
     IB_externals,
     IniFiles,
     uPwdDeCrypt;

{$R *.dfm}

function CreateSprav: TSprav;
begin
    Result := TUP_PrintOrder.Create;
end;


{ TUP_AcceptForm }

constructor TUP_PrintOrder.Create;
begin
    inherited Create;
//    Input.FieldDefs.Add('id_order', ftInteger);

//    PrepareMemoryDatasets;
end;

procedure TUP_PrintOrder.Show;
var
//    hnd: Integer;
    T : TUP_AcceptForm;
//    id : int64;
begin
//    hnd := Input['DBHandle'];
//    id  := Input['id_order'];

    T := TUP_AcceptForm.Create(Application.MainForm, {GLOBAL_HANDLE, }id_ord);

//    T.DB.Handle := PVoid(GLOBAL_HANDLE);
//    T.id_order

    T.ShowModal;
    T.Free;
end;

constructor TUP_AcceptForm.Create(AOwner: TComponent; {hd : integer; }id_ord : int64);
var
    reg : TRegistry;
    error : integer;
    i, l : integer;

    inif : TIniFile;

begin
    inherited Create(AOwner);
    id_order              := id_ord;

    try
        inif            := TIniFile.Create(ExtractFilePath(Application.ExeName) + '.\config.ini');
        DB.DatabaseName := inif.ReadString('CONNECTION', 'Server', '') + ':' + inif.ReadString('CONNECTION','Path', '');
		DB.DBParams.Add('user_name=' + inif.ReadString('Connection','User',''));
		DB.DBParams.Add('password=' + PwdDeCrypt(inif.ReadString('Connection', 'Password_Crypted', '')));
        inif.Free;
        DB.Open;
    except
    begin
        showmessage('�������! ���������� �� �������������!');
        close;
    end;
    end;
//    Db.Handle             := TISC_DB_Handle(hd);
    Db.DefaultTransaction := Tr;
    Tr.DefaultDatabase    := Db;

    TW.DefaultDatabase    := Db;

    DSOrder.Database      := Db;
    DSOrder.Transaction   := Tr;

    DS.Database           := Db;
    DS.Transaction        := Tr;

    DSBottom.Database     := Db;
    DSBottom.Transaction  := Tr;

    DSItems.Database      := Db;
    DSItems.Transaction   := Tr;

    DSVn.Database         := Db;
    DSVn.Transaction      := Tr;

    Tr.StartTransaction;

    flag_show   := false;

    DSVn.Close;
    DSVn.Sqls.SelectSql.Text := 'select * from UP_DT_PRINT_ORDER_MASS_SEL_TYPE('+IntToStr(id_order)+')';
    DSVn.Open;
    DSVn.FetchAll;
    if DSVn.Recordcount > 0 then
    begin
//        cxGrid1.Enabled := true;
        DSVn.First;
        while not DSVn.Eof do
        begin
            rx.Open;
            rx.Insert;
            rx.FieldByName('MODULE').Value        := DSVn.FBN('MODULE').AsString;
            rx.FieldByName('ID_ORDER_TYPE').Value := StrToInt64(DSVn.FBN('ID_ORDER_TYPE').AsString);
            rx.FieldByName('ID_REPORT').Value     := StrToInt64(DSVn.FBN('ID_REPORT').AsString);
            rx.FieldByName('REPORT_TITLE').Value  := DSVn.FBN('REPORT_TITLE').AsString;
            rx.FieldByName('Print').AsInteger     := 1;
            rx.Post;
            DSVn.Next;
        end;


    end else
    begin
        cxGrid2.visible := false;
        panel2.Visible  := false;
        cxGrid2.Enabled := false;
    end;


    DS.Close;
    DS.Sqls.SelectSql.Text := 'select * from UP_DT_ORDER_PRINT_SEL_TYPE('+IntToStr(id_order)+') order by NUM_ITEM, NUM_SUB_ITEM asc';
    DS.Open;
    DS.FetchAll;
    l := DS.RecordCount;
    DS.Last;
    for i := 1 to l do
    begin
        rx1.Open;
        rx1.Insert;
        rx1.FieldByName('name').Value           := DS.FBN('TYPE_N').AsString;
        rx1.FieldByName('num').Value            := DS.FBN('NUM_ITEM').AsString;
        rx1.FieldByName('num_sub').Value        := DS.FBN('NUM_SUB_ITEM').AsString;
        rx1.FieldByName('id_items').Value       := StrToInt64(DS.FBN('id_item').AsString);
        rx1.FieldByName('pereform_body').Value  := DS.FBN('PEREFORMIRIVAT_BODY').AsInteger;
        rx1.FieldByName('type').Value           := StrToInt64(DS.FBN('id_type').AsString);
        if StrToInt64(DS.FBN('id_type').AsString) <> 7
            then rx1.FieldByName('print').Value          := 1
            else rx1.FieldByName('print').Value          := 0;
        rx1.Post;
        DS.Prior;
    end;

    dxStatusBar1.Panels[0].Text             := 'Space - ������� �����';
    dxStatusBar1.Panels[1].Text             := 'Esc - �������';

        reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\1234005656759837\tnof\u\', False) then
        begin
            cxTextEdit1.Text := reg.ReadString('f');
        end else
        begin
            cxTextEdit1.Text := '12';
        end;
    finally
        reg.Free;
    end;

    try
        error := -1;
//        error := fibCheckPermission('/ROOT/Up_order_system/pereform_prikaz', 'DONE');
        if error = 0 then
        begin
            cxButton4.Visible := true;
        end;
//            MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar('!!!'), 16);
    finally
    begin
//        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar('!!!'), 16);
        cxButton4.Visible := false;
    end;
    end;


end;

procedure TUP_AcceptForm.APrintOrderExecute(Sender: TObject);
begin
    PrintOrder(0);
end;

procedure TUP_AcceptForm.AExitExecute(Sender: TObject);
var
    reg : TRegistry;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\1234005656759837\tnof\u\',true) then
        begin
            reg.writeString('f', cxTextEdit1.Text);
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;

    Close;
end;

procedure TUP_AcceptForm.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if Ord(Key) <> VK_DELETE then
        if Ord(Key) <> VK_BACK then
            if (key > '9') or (key < '0') then key := Chr(0);

end;

procedure TUP_AcceptForm.cxCheckBox1Click(Sender: TObject);
begin
    if rx1.IsEmpty then exit;
    if cxCheckBox1.Checked then
    begin
        rx1.First;
        while not rx1.Eof do
        begin
            rx1.Open;
            rx1.Edit;
            if rx1.FieldByName('type').Value <> 7
                then rx1.FieldByName('print').Value := 1;

            rx1.Post;
            rx1.Next;
        end;
        cxCheckBox1.Properties.Caption := '����� �� ������';
    end else
    begin
        rx1.First;
        while not rx1.Eof do
        begin
            rx1.Open;
            rx1.Edit;
            rx1.FieldByName('print').Value := 0;
            rx1.Post;
            rx1.Next;
        end;
        cxCheckBox1.Properties.Caption := '������� �� ������';
    end;
end;

procedure TUP_AcceptForm.CellSelect;
begin
    if not rx1.IsEmpty then
    begin
        if rx1.FieldByName('Print').AsInteger = 1
            then
            begin
                rx1.Edit;
                rx1.FieldByName('Print').AsInteger := 0;
                rx1.Post;
            end
            else
            begin
                rx1.Edit;
                if rx1.FieldByName('type').Value <> 7
                    then rx1.FieldByName('Print').AsInteger := 1
                    else showmessage('��� ����� �� ������� ����������� � ������ � ������!');
                rx1.Post;
            end;
    end;
end;

procedure TUP_AcceptForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    CellSelect;
end;

procedure TUP_AcceptForm.cxGrid1DBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key = VK_SPACE then
        CellSelect;
end;

procedure TUP_AcceptForm.APrintOrderVExecute(Sender: TObject);
var
    id_session : int64;
begin
    if cxTextEdit1.Text = '' then
    begin
        cxTextEdit1.SetFocus;
        Showmessage('������ ����� ��� �����!');
        exit;
    end;
    id_session := DB.Gen_Id('GEN_UP_TEMP_DT_ORDERS_PRINT', 1);

    Stored.Database    := DB;
    Stored.Transaction := TW;

    DSV.Database       := DB;
    DSV.Transaction    := TW;

    TW.StartTransaction;

    try
        rx1.First;
        while not rx1.Eof do
        begin
            if rx1.FieldByName('print').AsInteger = 1 then
            begin
                Stored.StoredProcName := 'UP_TEMP_DT_ORDER_PRINT_INSERT';
                Stored.Prepare;
                Stored.ParamByName('ID_SESSION').AsInt64 := id_session;
                Stored.ParamByName('ID_ORDER').AsInt64   := id_order;
                Stored.ParamByName('ID_ITEMS').AsInt64   := rx1.FieldByName('id_items').value;
                Stored.ExecProc;

                if rx1.FieldByName('pereform_body').AsInteger=1 then
                    ZapisPunkt(rx1.FieldByName('id_items').value);
            end;
            rx1.Next;
        end;

        DSV.Close;
        DSV.SQLs.SelectSQL.Text := 'select * from UP_DT_ORDERS_PRINT_ORDER_V('+IntToStr(id_order)+', '+IntToStr(id_session)+')';
        DSV.Open;
        DSV.FetchAll;

        DSBottom.Close;
        DSBottom.SQLs.SelectSQL.Text := 'select * from UP_DT_ORDERS_PRINT_ORDER_BOTTOM('+IntToStr(id_order)+')';
        DSBottom.Open;

        frxReport_V.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\UP\UP_OrderPrint_V.fr3');
        frxReport_V.Variables['font_doc'] := QuotedStr(cxTextEdit1.Text);
        frxReport_V.PrepareReport(True);
        frxReport_V.ShowReport(True);

        Stored.StoredProcName := 'UP_TEMP_DT_ORDER_PRINT_DELETE';
        Stored.Prepare;
        Stored.ParamByName('ID_SESSION').AsInt64 := id_session;
        Stored.ExecProc;
        TW.Rollback;
    except on E:Exception do
    begin
        TW.Rollback;
        ShowMessage(E.Message);        
    end;
    end;

end;

procedure TUP_AcceptForm.PrintOrder(pereformirivat: integer);
var
    HandlePack : HModule;

    func1 : function(DB : TISC_DB_HANDLE; id_order : int64):integer; stdcall;
    NagScreen     : TNagScreen;

begin
    if cxTextEdit1.Text = '' then
    begin
        cxTextEdit1.SetFocus;
        Showmessage('������ ����� ��� �����!');
        exit;
    end;
    if cxRadioButton1.Checked then
    begin
        NagScreen     := TNagScreen.Create(Application.MainForm);
        NagScreen.Show;
        NagScreen.SetStatusText('�������! ��� ������� ����� ��� ����');

        DSItems.Close;
        DSItems.SQLs.SelectSQL.Text := 'select * from UP_DT_ORDER_PRINT_SEL_TYPE_PR('+IntToStr(id_order)+')';
        DSItems.Open;
        DSItems.First;
        while not DSItems.Eof do
        begin
            if (DSItems.fbn('BODY').IsNull) or (pereformirivat = 1) or (strToInt64(DSItems.fbn('id_order_type').AsString)=7) then
            begin
                ZapisPunkt(strToInt64(DSItems.fbn('ID_ITEM').AsString));
            end;
            DSItems.Next;
        end;

        if pereformirivat = 1 then
        begin
            NagScreen.Free;
            showmessage('����� ������������!');
            exit;
        end;

        DSOrder.Close;
        DSOrder.SQLs.SelectSQL.Text := 'select * from UP_DT_ORDERS_PRINT_ORDER('+IntToStr(id_order)+')';
        DSOrder.Open;

        DSBottom.Close;
        DSBottom.SQLs.SelectSQL.Text := 'select * from UP_DT_ORDERS_PRINT_ORDER_BOTTOM('+IntToStr(id_order)+')';
        DSBottom.Open;

        frxR_Order.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\UP\UP_OrderPrint.fr3');
        frxR_Order.Variables['font_doc']  := StrToInt(cxTextEdit1.Text);
        if DSOrder.fbn('ID_LEVEL').IsNull
            then frxR_Order.Variables['chernetka'] := quotedStr(IntToStr(1))
            else frxR_Order.Variables['chernetka'] := quotedStr(IntToStr(0));

        NagScreen.Free;
        frxR_Order.PrepareReport(True);
        frxR_Order.ShowReport(True);
    end;
    if cxRadioButton2.Checked then
    begin
        rx.First;
        while not rx.Eof do
        begin
            if rx.FieldByName('print').AsInteger = 1 then
            begin
//                GetExtReport(DB.Handle, id_order);      func1 : function(DB : TISC_DB_HANDLE, id_order : int64):integer; stdcall;


                HandlePack := GetModuleHandle(PChar(rx.FieldByName('MODULE').AsString));
                if HandlePack<32
                then begin
                    HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+'\UP\'+rx.FieldByName('MODULE').AsString);
                end;

                if HandlePack > 0 then
                begin
                    @func1 := GetProcAddress(HandlePack, PChar('GetExtReport'));
                    if @func1 <> nil
                        then func1(DB.Handle, id_order);
                end
                else begin
                    MessageBox(handle, PChar('������� ��� ����� � ��������� SpOperationSys.bpl'), PChar('�����!'),MB_OK and MB_ICONWARNING);
                end;

            end;
            rx.Next;
        end;

    end;
end;

procedure TUP_AcceptForm.APereformirPrintExecute(Sender: TObject);
begin
    flag_show := true;
    PrintOrder(1);
    flag_show := false;
end;

procedure TUP_AcceptForm.AShowIdExecute(Sender: TObject);
begin
    Showmessage(IntToStr(id_order));
end;

procedure TUP_AcceptForm.cxRadioButton2Click(Sender: TObject);
begin
    if cxRadioButton2.Checked then
    begin
        cxGrid1.Enabled := false;
        cxGrid2.Enabled := true;
    end else
    begin
        cxGrid1.Enabled := true;
        cxGrid2.Enabled := false;
    end;
end;

procedure TUP_AcceptForm.cxRadioButton1Click(Sender: TObject);
begin
    if cxRadioButton1.Checked then
    begin
        cxGrid1.Enabled := true;
        cxGrid2.Enabled := false;
    end else
    begin
        cxGrid1.Enabled := false;
        cxGrid2.Enabled := true;
    end;

end;

procedure TUP_AcceptForm.CellSelect2;
begin
    if not rx.IsEmpty then
    begin
        if rx.FieldByName('Print').AsInteger = 1
            then
            begin
                rx.Edit;
                rx.FieldByName('Print').AsInteger := 0;
                rx.Post;
            end
            else
            begin
                rx.Edit;
                rx.FieldByName('Print').AsInteger := 1;
                rx.Post;
            end;
    end;
end;

procedure TUP_AcceptForm.cxGrid2DBTableView1DblClick(Sender: TObject);
begin
    CellSelect2;
end;

procedure TUP_AcceptForm.cxGrid2DBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key = VK_SPACE then
        CellSelect2;
end;

procedure TUP_AcceptForm.ZapisPunkt(id_item : int64);
var
    id_ses : int64;
    s, shablon : string;
    HandlePack : HModule;
    func : function(hConnection: TISC_DB_HANDLE; id_session, id_item : Int64): String; stdcall;

begin
     Stored.Database           := DB;
     Stored.Transaction        := TW;

     DSSelShablon.Database     := DB;
     DSSelShablon.Transaction  := TW;

     id_ses := -1;
     s      := '';

     TW.StartTransaction;
     try
         DSSelShablon.Close;
         DSSelShablon.SQLs.SelectSQL.Text := 'Select * from UP_DT_ORDER_PRINT_SEL_PARAM('+IntToStr(id_item)+')';
         DSSelShablon.Open;
         id_ses  := StrToInt64(DSSelShablon.fbn('R_ID_SESSION').AsString);
         if (DSSelShablon.fbn('R_BPL_NAME').isNull)
             then shablon := ''
             else shablon := DSSelShablon.fbn('R_BPL_NAME').AsString;
         DSSelShablon.Close;
         TW.Commit;
     except on E:Exception do
     begin
         TW.Rollback;
         NagScreen.Free;
         ShowMessage(E.Message);
     end;
     end;
     if (shablon <> '') then
     begin
         HandlePack := GetModuleHandle(PCHar(shablon));
         if HandlePack<32 then
         begin
             HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + '\UP\' + shablon);
         end;

         if HandlePack > 0 then
         begin
             @func := GetProcAddress(HandlePack,PChar('GetTemplateString'));
             if @func<>nil
                 then s := func(DB.Handle, id_ses, id_item)
                 else begin
                     NagScreen.Free;
                     MessageBox(Handle, PChar('������ - '+shablon), PChar('Error'), MB_OK and MB_ICONWARNING);
                     EXIT;
                 end;
         end;

         TW.StartTransaction;
         try
             Stored.StoredProcName := 'UP_DT_ORDER_PRINT_UPDATE_ITEM_B';
             Stored.Prepare;
             Stored.ParamByName('D_BODY').Value         := s;
             Stored.ParamByName('D_ID_ITEMS').AsInt64   := id_item;
             Stored.ExecProc;

             Stored.StoredProcName := 'UP_DT_ORDER_ITEM_BODY_DELETE';
             Stored.Prepare;
             Stored.ParamByName('D_ID_SESSION').AsInt64 := id_ses;
             Stored.ExecProc;
             TW.Commit;
         except on E:Exception do
         begin
             TW.Rollback;
             NagScreen.Free;
             ShowMessage(E.Message);
         end;
         end;
     end;
end;

end.
