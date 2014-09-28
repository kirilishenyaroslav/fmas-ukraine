unit UMainPrint;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, Ibase, uFControl, uLabeledFControl,
    uSpravControl, FIBDatabase, pFIBDatabase, cxControls, cxContainer,
    cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxPropertiesStore,
    frxClass, frxDBSet, DB, FIBDataSet, pFIBDataSet, cxCheckBox,
    pFibStoredProc, cxMemo, uCharControl, uIntControl, cxLabel, Registry,
    ActnList, NagScreenUnit;

type
    TfrmGraphicprint = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        WorkDatabase: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        AgreeFIO: TcxButtonEdit;
        ConformFIO: TcxButtonEdit;
        lbl1: TLabel;
        Label1: TLabel;
        AgreePost: TcxTextEdit;
        ConformPost: TcxTextEdit;
        cxPropertiesStore1: TcxPropertiesStore;
        ResultDBDataset: TfrxDBDataset;
        ResultsDS: TpFIBDataSet;
        cxCheckBox1: TcxCheckBox;
        DBDBottom: TfrxDBDataset;
        BottomDataSet: TpFIBDataSet;
        Intro: TcxMemo;
        SpeedButton3: TSpeedButton;
        Label8: TLabel;
        Label2: TLabel;
        cxLabel1: TcxLabel;
        SizeFont: TcxTextEdit;
        ActionList1: TActionList;
        Pereform: TAction;
        CheckBoxPrint: TCheckBox;
        AgreePost2: TcxTextEdit;
        AgreeFIO2: TcxButtonEdit;
        Label3: TLabel;
        CheckBoxPrintPodpis: TCheckBox;
        ReportPrint: TfrxReport;
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        procedure SpeedButton3Click(Sender: TObject);
        procedure SizeFontKeyPress(Sender: TObject; var Key: Char);
        procedure PereformExecute(Sender: TObject);
        procedure AgrreFIO2PropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        procedure FormCreate(Sender: TObject);
    private
    { Private declarations }
        id_order_in: Int64;
        PrintName: string;
        OrderNum: string;
        OrderDate: string;
        HashCode: string;
        NagScreen: TNagScreen;
    public
    { Public declarations }
        constructor Create(AOwner: TComponent; DbHandle: TISC_DB_HANDLE; id_order: Int64); reintroduce;
        procedure ZapisPunkt(id_item: int64);
    end;

procedure GetExtReport(DBHandle: TISC_DB_HANDLE; id_order: Int64); stdcall;
exports GetExtReport;

implementation

uses uUnivSprav, RxMemDS, BaseTypes;

{$R *.dfm}

procedure GetExtReport(DBHandle: TISC_DB_HANDLE; id_order: Int64);
begin
    with TfrmGraphicprint.Create(Application.MainForm, DBHandle, id_order) do
    begin
        ShowModal;
        Free;
    end;
end;

procedure TfrmGraphicprint.ZapisPunkt(id_item: int64);
var
    id_ses: int64;
    s, shablon: string;
    HandlePack: HModule;
    func: function(hConnection: TISC_DB_HANDLE; id_session, id_item: Int64): string; stdcall;
    Stored: TpFibStoredProc;
    DSSelShablon: TpFIBDataSet;

begin
    Stored := TpFibStoredProc.Create(self);
    Stored.Database := WorkDatabase;
    Stored.Transaction := WriteTransaction;

    DSSelShablon := TpFIBDataSet.Create(self);
    DSSelShablon.Database := WorkDatabase;
    DSSelShablon.Transaction := WriteTransaction;

    id_ses := -1;
    s := '';
    WriteTransaction.StartTransaction;
    try
        DSSelShablon.Close;
        DSSelShablon.SQLs.SelectSQL.Text := 'Select * from UP_DT_ORDER_PRINT_SEL_PARAM(' + IntToStr(id_item) + ')';
        DSSelShablon.Open;
        id_ses := StrToInt64(DSSelShablon.fbn('R_ID_SESSION').AsString);
        if (DSSelShablon.fbn('R_BPL_NAME').isNull)
            then shablon := ''
        else shablon := DSSelShablon.fbn('R_BPL_NAME').AsString;
        DSSelShablon.Close;
        WriteTransaction.Commit;
    except on E: Exception do
        begin
//         ShowMessage(E.Message + #13 + ' сесія ' + IntToStr(id_item));
            WriteTransaction.Rollback;
            NagScreen.Free;
            ShowMessage(E.Message + #13 + ' сесія ' + IntToStr(id_item));
        end;
    end;
    if (shablon <> '') then
    begin
        HandlePack := GetModuleHandle(PCHar(shablon));
        if HandlePack < 32 then
        begin
            HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + '\UP\' + shablon);
        end;

        if HandlePack > 0 then
        begin
            @func := GetProcAddress(HandlePack, PChar('GetTemplateString'));
            if @func <> nil
                then s := func(WorkDatabase.Handle, id_ses, id_item)
            else begin
                NagScreen.Free;
                MessageBox(Handle, PChar('Помилка - ' + shablon), PChar('Error'), MB_OK and MB_ICONWARNING);
                EXIT;
            end;
        end;

        WriteTransaction.StartTransaction;
        try
            Stored.StoredProcName := 'UP_DT_ORDER_PRINT_UPDATE_ITEM_B';
            Stored.Prepare;
            Stored.ParamByName('D_BODY').Value := s;
            Stored.ParamByName('D_ID_ITEMS').AsInt64 := id_item;
            Stored.ExecProc;
            Stored.StoredProcName := 'UP_DT_ORDER_ITEM_BODY_DELETE';
            Stored.Prepare;
            Stored.ParamByName('D_ID_SESSION').AsInt64 := id_ses;
            Stored.ExecProc;
            WriteTransaction.Commit;
        except on E: Exception do
            begin
                WriteTransaction.Rollback;
                NagScreen.Free;
                ShowMessage(E.Message);
            end;
        end;
    end;
end;

procedure TfrmGraphicprint.OkButtonClick(Sender: TObject);
var
    UpdateSP: TpFibStoredProc;
    SelectSP: TpFIBDataSet;
    PrintName_A: string;
    {m : TfrxMemoView; }
    chern: variant;

begin
    NagScreen := TNagScreen.Create(Application.MainForm);
    NagScreen.Show;
    NagScreen.SetStatusText('Чекайте! Йде обробка даних для звіту');

    if SizeFont.Text = ''
        then
    begin
        agShowMessage('Введіть розмір шрифту на друку!');
        SizeFont.SetFocus;
        SizeFont.Style.Color := clRed;
        exit;
    end;

    OkButton.Enabled := False;
     //Помечаем приказа как связанный с графиком
    UpdateSP := TpFibStoredProc.Create(self);
    UpdateSP.Database := WorkDatabase;
    UpdateSP.Transaction := WriteTransaction;
    WriteTransaction.StartTransaction;
    UpdateSP.StoredProcName := 'UP_DT_ORDERS_UPD_UG';
    UpdateSP.Prepare;
    UpdateSP.ParamByName('ID_ORDER').AsInt64 := self.id_order_in;
    UpdateSP.ParamByName('USE_GRAPHIC').Value := 1;
    UpdateSP.ExecProc;
    WriteTransaction.Commit;
    UpdateSP.Close;
    UpdateSP.Free;

     //записываем все в таблицу
    UpdateSP := TpFibStoredProc.Create(self);
    UpdateSP.Database := WorkDatabase;
    UpdateSP.Transaction := WriteTransaction;
    WriteTransaction.StartTransaction;
    UpdateSP.StoredProcName := 'UP_DT_ORDER_GRAPHIC_INS';
    UpdateSP.Prepare;
    UpdateSP.ParamByName('ID_ORDER').AsInt64 := self.id_order_in;
    if ConformPost.Text <> '' then
        UpdateSP.ParamByName('VIZA').AsString := ConformPost.Text;
    if AgreePost.Text <> '' then
        UpdateSP.ParamByName('AGREE').AsString := AgreeFIO.Text;
    UpdateSP.ParamByName('VSTUP').AsString := Intro.Text;
    UpdateSP.ParamByName('AGREE_POST').AsString := AgreePost.Text;
    UpdateSP.ParamByName('VIZA_POST').AsString := ConformPost.Text;
    UpdateSP.ParamByName('AGREE2').AsString := AgreeFIO2.Text;
    UpdateSP.ParamByName('AGREE_POST2').AsString := AgreePost2.Text;
    UpdateSP.ExecProc;
    WriteTransaction.Commit;
    UpdateSP.Close;
    UpdateSP.Free;

     //получить id_level
    SelectSP := TpFibDataSet.Create(self);
    SelectSP.Database := WorkDatabase;
    SelectSP.Transaction := ReadTransaction;
    SelectSP.Close;
    SelectSP.SelectSQL.Text := 'SELECT ID_LEVEL FROM UP_DT_ORDERS O WHERE O.ID_ORDER=' + IntToStr(self.id_order_in) + ' ';
    SelectSP.Open;
    chern := SelectSP.FieldByName('ID_LEVEL').Value;
    SelectSP.Close;

    if CheckBoxPrint.Checked then
        PrintName_A := Intro.Text
    else PrintName_A := PrintName;
     //Идет формирование графика на основании данных по приказу
    if ResultsDS.Active then ResultsDS.Close;
    if BottomDataSet.Active then BottomDataSet.Close;

    if CheckBoxPrint.Checked
        then begin
        ResultsDS.Close;
        ResultsDS.SelectSQL.Text := 'SELECT DISTINCT * FROM UP_KER_GET_GRAPHIC_INFO(' + IntToStr(self.id_order_in) + ',0) ' +
            'ORDER BY PATH, FIO COLLATE WIN1251_UA, IS_POST_MAIN DESC, IS_OLD ASC, ' +
            'WORK_REASON DESC, POST_NAME ASC';
        ResultsDS.Open;

        ReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Reports\Up\HolidayGraphic.fr3', true);
             // ReportPrint.Variables['PRINT_NAME'] :=''''+PrintName_A+'''';
        ReportPrint.Variables['PRINT_NAME'] := QuotedStr(PrintName_A);
        ReportPrint.Variables['UPOST'] := '''' + AgreePost.Text + '''';
        ReportPrint.Variables['UFIO'] := '''' + AgreeFIO.Text + '''';
        ReportPrint.Variables['UPOST2'] := '''' + AgreePost2.Text + '''';
        ReportPrint.Variables['UFIO2'] := '''' + AgreeFIO2.Text + '''';
        ReportPrint.Variables['N_PR'] := '''' + OrderNum + '(' + HashCode + ')' + '''';
        ReportPrint.Variables['D_PR'] := '''' + OrderDate + '''';
        ReportPrint.Variables['ZPOST'] := '''' + ConformPost.Text + '''';
        ReportPrint.Variables['ZFIO'] := '''' + ConformFIO.Text + '''';
        ReportPrint.Variables['PRINT_PODPIS'] := CheckBoxPrintPodpis.Checked;
    end
    else begin
        ResultsDS.Close;
        ResultsDS.SelectSQL.Text := 'SELECT DISTINCT * FROM UP_KER_GET_GRAPHIC_INFO(' + IntToStr(self.id_order_in) + ',1) ' +
            'WHERE NOT HOLIDAY_PERIOD_STR IS NULL ' +
            'ORDER BY PATH ASC, FIO COLLATE WIN1251_UA ASC, IS_POST_MAIN DESC, ' +
            'WORK_REASON DESC, POST_NAME ASC';
        ResultsDS.Open;

        BottomDataSet.Close;
        BottomDataSet.SelectSQL.Text := 'SELECT * FROM  UP_DT_ORDERS_PRINT_ORDER_BOTTOM (' + IntToStr(self.id_order_in) + ')';
        BottomDataSet.Open;

        SelectSP.Close;
        SelectSP.SelectSQL.Text := 'SELECT * FROM INI_ASUP_CONSTS';
        SelectSP.Open;

        ReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Reports\Up\HolidayGraphicO.fr3', true);
        ReportPrint.Variables['ORGANIZATION'] := '''' + SelectSP.FieldByName('FIRM_NAME').AsString + '''';
        ReportPrint.Variables['CITY'] := '''' + SelectSP.FieldByName('CITY').AsString + '''';

        SelectSP.Close;

        ReportPrint.Variables['N_PR'] := '''' + OrderNum + '(' + HashCode + ')' + '''';
        ReportPrint.Variables['D_PR'] := '''' + OrderDate + '''';

        if VarIsNull(chern)
            then ReportPrint.Variables['CHERNETKA'] := 1
        else ReportPrint.Variables['CHERNETKA'] := 0;

        ReportPrint.Variables['PRINT_PODPIS'] := CheckBoxPrintPodpis.Checked;

              //ReportPrint.Variables['PRINT_NAME'] :=''''+PrintName_A+'''';
        ReportPrint.Variables['PRINT_NAME'] := QuotedStr(PrintName_A);
    end;

    ReportPrint.Variables['font_doc'] := StrToInt(SizeFont.Text);

    SelectSP.Close;
    SelectSP.SQLs.SelectSQL.Text := 'select * from UP_DT_ORDER_PRINT_SEL_TYPE_PR(' + IntToStr(self.id_order_in) + ')';
    SelectSP.Open;
    SelectSP.First;
    while not SelectSP.Eof do
    begin
        if (SelectSP.fbn('BODY').IsNull) or (strToInt64(SelectSP.fbn('id_order_type').AsString) = 7) then
        begin
            ZapisPunkt(strToInt64(SelectSP.fbn('ID_ITEM').AsString));
        end;
        SelectSP.Next;
    end;
    SelectSP.Close;
    SelectSP.Free;

    NagScreen.Free;

    ReportPrint.PrepareReport;
    ReportPrint.ShowReport;
    OkButton.Enabled := True;
end;

procedure TfrmGraphicprint.CancelButtonClick(Sender: TObject);
var
    UpdateSP: TpFibStoredProc;
    reg: TRegistry;
begin
     //записываем все в таблицу
          //записываем все в таблицу
    UpdateSP := TpFibStoredProc.Create(self);
    UpdateSP.Database := WorkDatabase;
    UpdateSP.Transaction := WriteTransaction;
    WriteTransaction.StartTransaction;
    UpdateSP.StoredProcName := 'UP_DT_ORDER_GRAPHIC_INS';
    UpdateSP.Prepare;
    UpdateSP.ParamByName('ID_ORDER').AsInt64 := self.id_order_in;
    if ConformPost.Text <> '' then
        UpdateSP.ParamByName('VIZA').AsString := ConformFIO.Text;
    if AgreePost.Text <> '' then
        UpdateSP.ParamByName('AGREE').AsString := AgreeFIO.Text;
    UpdateSP.ParamByName('VSTUP').AsString := Intro.Text;
    UpdateSP.ParamByName('AGREE_POST').AsString := AgreePost.Text;
    UpdateSP.ParamByName('VIZA_POST').AsString := ConformPost.Text;
    UpdateSP.ParamByName('AGREE2').AsString := AgreeFIO2.Text;
    UpdateSP.ParamByName('AGREE_POST2').AsString := AgreePost2.Text;
    UpdateSP.ExecProc;
    WriteTransaction.Commit;
    UpdateSP.Close;
    UpdateSP.Free;

    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\ASUP\HolidayGraphic\', true) then
        begin
            reg.writeString('f', SizeFont.Text);
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;

    ModalResult := mrNo;
end;

constructor TfrmGraphicprint.Create(AOwner: TComponent; DbHandle: TISC_DB_HANDLE; id_order: Int64);
var
    GetInfoDS: TpFIBDataSet;
    reg: TRegistry;
begin
    inherited Create(AOwner);
    WorkDatabase.handle := DbHandle;
    ReadTransaction.StartTransaction;
    self.id_order_in := id_order;

    GetInfoDS := TpFIBDataSet.Create(self);
    GetInfoDS.Database := WorkDatabase;
    GetInfoDS.Transaction := ReadTransaction;
    GetInfoDS.SelectSQL.Text := 'SELECT * FROM UP_DT_ORDER_GRAPHIC_SEL(' + IntToStr(self.id_order_in) + ')';
    GetInfoDS.Open;
    GetInfoDS.FetchAll;
    if (GetInfoDS.RecordCount > 0)
        then begin
               //PrintName:=GetInfoDS.FieldByName('PREAMBLE').AsString;
        OrderNum := GetInfoDS.FieldByName('NUM_PROJECT').AsString;
        OrderDate := GetInfoDS.FieldByName('DATE_PROJECT').AsString;
        HashCode := GetInfoDS.FieldByName('hash_code').AsString;
        if VarIsNull(GetInfoDS.FieldByName('VSTUP').AsVariant) then
        begin
            PrintName := '';
            Intro.Text := '';
        end
        else
        begin
            PrintName := GetInfoDS.FieldByName('PREAMBLE').AsString;
            Intro.Text := GetInfoDS.FieldByName('VSTUP').AsString;
        end;

        if VarIsNull(GetInfoDS.FieldByName('AGREE').AsVariant) then
            AgreeFIO.Text := ''
        else
            AgreeFIO.Text := GetInfoDS.FieldByName('AGREE').AsString;

        if VarIsNull(GetInfoDS.FieldByName('AGREE_POST').AsVariant) then
            AgreePost.Text := ''
        else
            AgreePost.Text := GetInfoDS.FieldByName('AGREE_POST').AsString;

        if VarIsNull(GetInfoDS.FieldByName('AGREE2').AsVariant) then
            AgreeFIO2.Text := ''
        else
            AgreeFIO2.Text := GetInfoDS.FieldByName('AGREE2').AsString;

        if VarIsNull(GetInfoDS.FieldByName('AGREE_POST2').AsVariant) then
            AgreePost2.Text := ''
        else
            AgreePost2.Text := GetInfoDS.FieldByName('AGREE_POST2').AsString;

        if VarIsNull(GetInfoDS.FieldByName('VIZA').AsVariant) then
            ConformFIO.Text := ''
        else
            ConformFIO.Text := GetInfoDS.FieldByName('VIZA').AsString;

        if VarIsNull(GetInfoDS.FieldByName('VIZA_POST').AsVariant) then
            ConformPost.Text := ''
        else
            ConformPost.Text := GetInfoDS.FieldByName('VIZA_POST').AsString;

    end;
    GetInfoDS.Close;
    GetInfoDS.Free;

    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\ASUP\HolidayGraphic\', False) then
        begin
            SizeFont.Text := reg.ReadString('f');
        end
    finally
        reg.Free;
    end;

end;

procedure TfrmGraphicprint.cxButtonEdit1PropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Узгоджує графік';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'up_get_text_shablon(6)';
    Params.Fields := 'text1,text2,id_shablon';
    Params.FieldsName := 'ПІП/б,Посада';
    Params.KeyField := 'ID_shablon';
    Params.ReturnFields := 'text1,text2';
    Params.DBHandle := Integer(WorkDatabase.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut)
        then begin
        AgreeFIO.Text := VarToStr(output['text1']);
        AgreePost.Text := VarToStr(output['text2'])
    end;
end;

procedure TfrmGraphicprint.cxButtonEdit2PropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Затверджує графік';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'up_get_text_shablon(6)';
    Params.Fields := 'text1,text2,id_shablon';
    Params.FieldsName := 'ПІП/б,Посада';
    Params.KeyField := 'ID_shablon';
    Params.ReturnFields := 'text1,text2';
    Params.DBHandle := Integer(WorkDatabase.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut)
        then begin
        ConformFIO.text := VarToStr(output['text1']);
        ConformPost.Text := VarToStr(output['text2'])
    end;
end;

procedure TfrmGraphicprint.SpeedButton3Click(Sender: TObject);
//var T:TfrmShablonText;
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Вступ до наказу';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'up_get_text_shablon(8)';
    Params.Fields := 'text1,id_shablon';
    Params.FieldsName := 'Текст вступу';
    Params.KeyField := 'ID_shablon';
    Params.ReturnFields := 'text1';
    Params.DBHandle := Integer(WorkDatabase.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut)
        then
    begin
        Intro.Text := VarToStr(output['text1']);
    end;
    { T:=TfrmShablonText.Create(Self,8,WorkDatabase.Handle);
     T.Caption:='Довідник вступів до наказу';
     if T.ShowModal=mrYes
     then begin
               Intro.Text:=T.shablon_text;
     end;
     T.Free;  }
end;

procedure TfrmGraphicprint.SizeFontKeyPress(Sender: TObject;
    var Key: Char);
begin
    if ((key <> #8) and ((key > '9') or (key < '0'))) then
        key := Chr(0);
end;

procedure TfrmGraphicprint.PereformExecute(Sender: TObject);
var
    SelectSP: TpFIBDataSet;
begin
    NagScreen := TNagScreen.Create(Application.MainForm);
    NagScreen.Show;
    NagScreen.SetStatusText('Чекайте! Йде обробка даних для звіту');

    SelectSP := TpFibDataSet.Create(self);
    SelectSP.Database := WorkDatabase;
    SelectSP.Transaction := ReadTransaction;
    SelectSP.Close;
    SelectSP.SQLs.SelectSQL.Text := 'select * from UP_DT_ORDER_PRINT_SEL_TYPE_PR(' + IntToStr(self.id_order_in) + ')';
    SelectSP.Open;
    SelectSP.First;
    while not SelectSP.Eof do
    begin
        if (SelectSP.fbn('BODY').IsNull) or (strToInt64(SelectSP.fbn('id_order_type').AsString) = 7) then
        begin
            ZapisPunkt(strToInt64(SelectSP.fbn('ID_ITEM').AsString));
        end;
        SelectSP.Next;
    end;
    SelectSP.Close;
    SelectSP.Free;
    NagScreen.Free;
    Showmessage('Наказ переформован!');
end;

procedure TfrmGraphicprint.AgrreFIO2PropertiesButtonClick(Sender: TObject;
    AButtonIndex: Integer);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Узгоджує графік';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'up_get_text_shablon(6)';
    Params.Fields := 'text1,text2,id_shablon';
    Params.FieldsName := 'ПІП/б,Посада';
    Params.KeyField := 'ID_shablon';
    Params.ReturnFields := 'text1,text2';
    Params.DBHandle := Integer(WorkDatabase.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut)
        then begin
        AgreeFIO2.Text := VarToStr(output['text1']);
        AgreePost2.Text := VarToStr(output['text2'])
    end;
end;

procedure TfrmGraphicprint.FormCreate(Sender: TObject);
var
    SelectSP: TpFIBDataSet;
begin
    SelectSP := TpFibDataSet.Create(self);
    SelectSP.Database := WorkDatabase;
    SelectSP.Transaction := ReadTransaction;
    SelectSP.Close;
    SelectSP.SelectSQL.Text := 'SELECT IS_PRINT_SIGN_GRAFIC_ORDER FROM UP_SYS_INI_CONSTS';
    SelectSP.Open;

    if (SelectSP.FieldByName('IS_PRINT_SIGN_GRAFIC_ORDER').AsInteger = 1) then
        CheckBoxPrintPodpis.Checked := true
    else CheckBoxPrintPodpis.Checked := false;

    SelectSP.Close;
end;

end.

