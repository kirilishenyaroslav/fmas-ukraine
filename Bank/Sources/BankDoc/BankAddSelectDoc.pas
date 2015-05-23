unit BankAddSelectDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet, pFIBDataSet,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, FIBDatabase, pFIBDatabase,
  BankDocMainForm, ActnList, Un_R_file_Alex, cxCurrencyEdit, cxTextEdit,
  ImgList, dxBar, dxBarExtItems, cxContainer, cxLabel, ExtCtrls, cxCheckBox,
  cxGridBandedTableView, cxGridDBBandedTableView, cxImage, FIBQuery,
  pFIBQuery, pFIBStoredProc, cxMemo, Placemnt, Gauges;

type
  TfmBankAddSelectDoc = class(TForm)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DataSetSelectDoc: TpFIBDataSet;
    DataSource1: TDataSource;
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
    ActionClose: TAction;
    ActionTake: TAction;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    ImageList1: TImageList;
    Panel1: TPanel;
    cxLabel14: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel17: TcxLabel;
    cxLabel23: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    Panel2: TPanel;
    cxCheckBox1: TcxCheckBox;
    cxLabel1: TcxLabel;
    dxBarLargeButton6: TdxBarLargeButton;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    ActionAdd: TAction;
    ActionChange: TAction;
    ActionDel: TAction;
    ActionRefresh: TAction;
    ActionView: TAction;
    cxGrid1DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn8: TcxGridDBBandedColumn;
    dxBarLargeButton7: TdxBarLargeButton;
    ActionDelPl: TAction;
    dxBarLargeButton8: TdxBarLargeButton;
    ActionOtmDel: TAction;
    Class_StoredProc: TpFIBStoredProc;
    TransactionWr: TpFIBTransaction;
    ImageList2: TImageList;
    cxGrid1DBBandedTableView1DBBandedColumn9: TcxGridDBBandedColumn;
    cxCheckBox2: TcxCheckBox;
    cxLabel24: TcxMemo;
    cxTextEdit1: TcxTextEdit;
    cxLabel2: TcxLabel;
    ActionCtrlF: TAction;
    ActionShow_info: TAction;
    Action1: TAction;
    dxBarLargeButton9: TdxBarLargeButton;
    ActionClon: TAction;
    FormStorage1: TFormStorage;
    dxBarPopupMenu2: TdxBarPopupMenu;
    dxBarLargeButton10: TdxBarLargeButton;
    ActionAllDel: TAction;
    Panel3: TPanel;
    ProgressBar: TGauge;
    cxLabel26: TcxLabel;
    cxLabel28: TcxLabel;
    cxLabel27: TcxLabel;
    cxLabel29: TcxLabel;
    cxGrid1DBBandedTableView1DBBandedColumn10: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn11: TcxGridDBBandedColumn;
    pFIBDataSet1: TpFIBDataSet;
    procedure LoadCaption;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionTakeExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure DataSetSelectDocAfterScroll(DataSet: TDataSet);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure ActionDelPlExecute(Sender: TObject);
    procedure ActionOtmDelExecute(Sender: TObject);
    procedure cxGrid1DBBandedTableView1DBBandedColumn9CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxCheckBox2Click(Sender: TObject);
    procedure ActionCtrlFExecute(Sender: TObject);
    procedure cxTextEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBBandedTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure ActionShow_infoExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure ActionClonExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionAllDelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    m : TfmBankDocMainForm;
    id : int64;
    show_komissiya : integer;
  public
    is_valuta   : Integer;
    id_valuta   : Integer;
    name_valuta : string;
  end;

function Show_Select_Doc(n : TfmBankDocMainForm; db : TpFIBDatabase; Tr : TpFIBTransaction; ID_RAS, ID_DAY : INT64; var PR : INTEGER; VAR id_DOC, ID_ALL_DOC, id_account_customer : int64; var date_vip, date_doc : TDate; var num_doc, sum_doc, note, id_currency, summa_valuta, name_cust, mfo_cust, name_bank, ras_cust : string; VAR ID_CUSTOM, is_add_CL : int64; var num_doc_kazn : string; var kazna : integer; is_valuta_in : Integer;id_valuta_in : Integer; name_valuta_in : string):boolean;

implementation
uses Un_lo_file_Alex,
     Accmgmt,
     Registry;
{$R *.dfm}

function Show_Select_Doc(n : TfmBankDocMainForm; db : TpFIBDatabase; Tr : TpFIBTransaction; ID_RAS, ID_DAY : INT64; var PR : INTEGER; VAR id_DOC, ID_ALL_DOC, id_account_customer : int64; var date_vip, date_doc : TDate; var num_doc, sum_doc, note, id_currency, summa_valuta, name_cust, mfo_cust, name_bank, ras_cust : string; VAR ID_CUSTOM, is_add_CL : int64; var num_doc_kazn : string; var kazna : integer;is_valuta_in : integer; id_valuta_in : Integer; name_valuta_in : string):boolean;
var
    T : TfmBankAddSelectDoc;
    prihod, error, index_m : integer;
    reg : TRegistry;
begin
    T := TfmBankAddSelectDoc.Create(nil);
    T.m := n;
    T.show_komissiya := 0;
    T.cxCheckBox2.Visible := true;

    t.is_valuta   := is_valuta_in;
    t.id_valuta   := id_valuta_in;
    t.name_valuta := name_valuta_in;

    if (is_valuta_in = 1 )then
     begin
       t.cxGrid1DBBandedTableView1DBBandedColumn10.Visible := True;
       t.cxGrid1DBBandedTableView1DBBandedColumn11.Visible := True;
     end
    else
     begin
       t.cxGrid1DBBandedTableView1DBBandedColumn10.Visible := False;
       t.cxGrid1DBBandedTableView1DBBandedColumn11.Visible := False;
     end;


    error := Accmgmt.fibCheckPermission('/ROOT/Bank','Belong');
    if error <> 0 then
    begin
         T.cxCheckBox2.Visible := false;
    end;
    T.DataSetSelectDoc.Database     := DB;
    T.DataSetSelectDoc.Transaction  := Tr;
    T.Class_StoredProc.Database     := DB;
    T.TransactionWr.defaultDatabase := DB;
    T.Class_StoredProc.Transaction  := T.TransactionWr;
    T.DataSetSelectDoc.Close;
    T.DataSetSelectDoc.SQLs.SelectSQL.Text := 'SELECT DISTINCT * FROM BANK_SELECT_ALL_DOC_FROM_DAY_NE('''+T.m.cxLabel12.Caption+''', '+IntToStr(ID_RAS)+', '+IntToStr(1)+', '+IntToStr(T.show_komissiya)+')';
    T.DataSetSelectDoc.Open;
    T.DataSetSelectDoc.FetchAll;
    T.LoadCaption;
    if T.DataSetSelectDoc.RecordCount > 0 then
        if T.DataSetSelectDoc.FieldByName('IS_ERROR').AsInteger = 1 then
        begin
            reg := TRegistry.Create;
            try
                reg.RootKey := HKEY_CURRENT_USER;
                if  reg.OpenKey('\Software\12300006759837\show\mesnepr\', False) then
                begin
                    index_m := StrToInt(reg.ReadString('index'));
                end else
                    index_m := -1;
            finally
                reg.Free;
            end;

           // if index_m = -1 then
          //  MessageBox(T.Handle, PChar(Un_R_file_Alex.BANK_ERROR_VIBOR_PL_FROM_LENA), PChar(Un_R_file_Alex.MY_MESSAGE_HINT), MB_ICONWARNING);
        end;
    T.id := ID_RAS;

    if T.ShowModal=mrOk then
    begin
        is_add_CL           := T.DataSetSelectDoc['ADD_HAND'];
        id_DOC              := T.DataSetSelectDoc['ID_DOC'];
        ID_ALL_DOC          := 0;
        id_account_customer := T.DataSetSelectDoc['ID_ACCOUNT_CUSTOMER'];
        date_vip            := T.DataSetSelectDoc['DATE_VIP'];
        date_doc            := T.DataSetSelectDoc['DATE_DOC'];
        num_doc             := T.DataSetSelectDoc['NUMBER_DOC'];
        sum_doc             := T.DataSetSelectDoc['SUMMA_DOC'];
        note                := T.DataSetSelectDoc['OSNOVANIE'];
//        id_currency         := T.DataSetSelectDoc['ID_CURRENCY'];
//        summa_c             := T.DataSetSelectDoc['SUMMA_C'];
        id_currency         := '';

        if (T.DataSetSelectDoc['SUMMA_VALUTA'] = null ) then
        begin
          summa_valuta := '0,00';
        end
        else
        begin
          summa_valuta := T.DataSetSelectDoc['SUMMA_VALUTA'];
        end;

        name_cust           := T.DataSetSelectDoc['NAME_CUST'];
        ID_CUSTOM           := T.DataSetSelectDoc['ID_CUSTOMER'];
        mfo_cust            := T.DataSetSelectDoc['MFO_CUST'];
        name_bank           := T.DataSetSelectDoc['NAME_MFO_CUST'];
        ras_cust            := T.DataSetSelectDoc['NAME_RAS_CUST'];
        num_doc_kazn        := T.DataSetSelectDoc.fbn('NUM_DOC_KAZN').AsString;
        kazna               := T.DataSetSelectDoc.fbn('KAZNACH').Asinteger;
        if T.DataSetSelectDoc['TYPE_DOC'] = 1
            then pr := 1
            else pr := 0;
        Result  := true;
    end
    else
        Result  := false;
    T.Free
end;


{ TfmBankAddSelectDoc }

procedure TfmBankAddSelectDoc.LoadCaption;
begin
    cxLabel1.Caption               := m.cxLabel12.Caption;
    Caption := Un_R_file_Alex.BANK_SELECT_DOC_CAPTION + cxLabel1.Caption;

    cxLabel13.Caption              := Un_R_file_Alex.bank_rekv_cust;
    cxLabel15.Caption              := Un_R_file_Alex.BANK_NAZVANIE;
    cxLabel17.Caption              := Un_R_file_Alex.BANK_R_S;
    cxLabel19.Caption              := Un_R_file_Alex.BANK_MFO;
    cxLabel21.Caption              := Un_R_file_Alex.BANK_BANK;
    cxLabel23.Caption              := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;

    cxCheckBox1.Properties.Caption := Un_R_file_Alex.BANK_SHOW_OBRABOTANIE;
    ActionAdd.Caption              := Un_R_file_Alex.MY_ACTION_ADD_CONST;
    ActionChange.Caption           := Un_R_file_Alex.MY_ACTION_UPDATE_CONST;
    ActionClose.Caption            := Un_R_file_Alex.MY_ACTION_CLOSE_CONST;
    ActionDel.Caption              := Un_R_file_Alex.MY_ACTION_DELETE_CONST;
    ActionTake.Caption             := Un_R_file_Alex.MY_ACTION_CHOOSE_CONST;
    ActionRefresh.Caption          := Un_R_file_Alex.MY_ACTION_REFRESH_CONST;
    ActionClon.Caption             := Un_R_file_Alex.BANK_CLON;

    cxGrid1DBBandedTableView1.Bands.Items[0].Caption  := Un_R_file_Alex.BANK_REK_DOCUMENT;
    cxGrid1DBBandedTableView1.Bands.Items[1].Caption  := Un_R_file_Alex.KASSA_SUMMA;
    cxGrid1DBBandedTableView1DBBandedColumn1.Caption  := Un_R_file_Alex.BANK_NUM_DOCUMENT;
    cxGrid1DBBandedTableView1DBBandedColumn2.Caption  := Un_R_file_Alex.BANK_DATE_DOCUMENT;
    cxGrid1DBBandedTableView1DBBandedColumn3.Caption  := Un_R_file_Alex.BANK_NAME_CUSTMERA;
    cxGrid1DBBandedTableView1DBBandedColumn4.Caption  := Un_R_file_Alex.KASSA_DOC_PRIHOD;
    cxGrid1DBBandedTableView1DBBandedColumn5.Caption  := Un_R_file_Alex.KASSA_DOC_RASHOD;

    ActionDelPl.Caption            := Un_R_file_Alex.BANK_ADD_TO_DEL_PL;
    ActionOtmDel.Caption           := Un_R_file_Alex.BANK_DEL_TO_DEL_PL;
    ActionAllDel.Caption           := Un_R_file_Alex.BANK_BUTTON_DEL_ALL_NEOBROB;
    cxLabel2.Caption               := Un_R_file_Alex.BANK_QUCKLY_FIND;
end;

procedure TfmBankAddSelectDoc.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmBankAddSelectDoc.ActionTakeExecute(Sender: TObject);
begin
    IF (DataSetSelectDoc['OBRABOTAN'] = 0) then
    ModalResult := mrOK;
end;

procedure TfmBankAddSelectDoc.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    ActionTakeExecute(Sender);
end;

procedure TfmBankAddSelectDoc.DataSetSelectDocAfterScroll(
  DataSet: TDataSet);
begin
    if DataSetSelectDoc['OKPO_CUST'] <> null      then cxLabel14.Caption := DataSetSelectDoc['OKPO_CUST']      else cxLabel14.Caption := '';
    if DataSetSelectDoc['FULL_NAME_CUST'] <> null then cxLabel16.Caption := DataSetSelectDoc['FULL_NAME_CUST'] else cxLabel16.Caption := '';
    if DataSetSelectDoc['NAME_RAS_CUST'] <> null  then cxLabel18.Caption := DataSetSelectDoc['NAME_RAS_CUST']  else cxLabel18.Caption := '';
    if DataSetSelectDoc['MFO_CUST'] <> null       then cxLabel20.Caption := DataSetSelectDoc['MFO_CUST']       else cxLabel20.Caption := '';
    if DataSetSelectDoc['NAME_MFO_CUST'] <> null  then cxLabel22.Caption := DataSetSelectDoc['NAME_MFO_CUST']  else cxLabel22.Caption := '';
    if DataSetSelectDoc['OSNOVANIE'] <> null      then cxLabel24.Text    := DataSetSelectDoc['OSNOVANIE']      else cxLabel24.Text    := '';
end;

procedure TfmBankAddSelectDoc.cxCheckBox1Click(Sender: TObject);
begin
    IF cxCheckBox1.Checked then
    begin
        DataSetSelectDoc.Close;
        DataSetSelectDoc.SQLs.SelectSQL.Text := 'SELECT DISTINCT * FROM BANK_SELECT_ALL_DOC_FROM_DAY_NE('''+cxLabel1.Caption+''', '+IntToStr(ID)+', null, '+IntToStr(show_komissiya)+')';
        DataSetSelectDoc.Open;
    end else
    begin
        DataSetSelectDoc.Close;
        DataSetSelectDoc.SQLs.SelectSQL.Text := 'SELECT DISTINCT * FROM BANK_SELECT_ALL_DOC_FROM_DAY_NE('''+cxLabel1.Caption+''', '+IntToStr(ID)+', '+IntToStr(1)+', '+IntToStr(show_komissiya)+')';
        DataSetSelectDoc.Open;
    end;
end;

procedure TfmBankAddSelectDoc.ActionAddExecute(Sender: TObject);
begin
//    if DataSetSelectDoc['ADD_HAND'] = 1 then
    begin
        Un_lo_file_Alex.LAddDocClBank(self, m.Database.Handle, fsNormal, id, StrToDate(m.cxLabel12.Caption), id_valuta, name_valuta);
        ActionRefreshExecute(Sender);
    end;
end;

procedure TfmBankAddSelectDoc.ActionChangeExecute(Sender: TObject);
var
    id : int64;
begin
    if DataSetSelectDoc['ADD_HAND'] = 1 then
    begin
        id := TFIBBCDField(DataSetSelectDoc.FieldByName('ID_DOC')).AsInt64;
        Un_lo_file_Alex.LEditDocClBank(self, m.Database.Handle, fsNormal, id, id_valuta, name_valuta);
        ActionRefreshExecute(Sender);
        DataSetSelectDoc.Locate('ID_DOC', id, []);
    end;
end;

procedure TfmBankAddSelectDoc.ActionDelExecute(Sender: TObject);
begin
    if DataSetSelectDoc['ADD_HAND'] = 1 then
    begin
        if MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_DELETE_DOC +' № '+DataSetSelectDoc.FieldByName('NUMBER_DOC').AsString), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO + MB_DEFBUTTON2)=mrYes then
        begin
            Un_lo_file_Alex.LDelDocClBank(self, m.Database.Handle, fsNormal, StrToInt64(DataSetSelectDoc.FieldByName('ID_DOC').AsString));
            ActionRefreshExecute(Sender);
        end;
    end;
end;

procedure TfmBankAddSelectDoc.ActionRefreshExecute(Sender: TObject);
begin
    IF cxCheckBox1.Checked then
    begin
        DataSetSelectDoc.Close;
        DataSetSelectDoc.SQLs.SelectSQL.Text := 'SELECT distinct * FROM BANK_SELECT_ALL_DOC_FROM_DAY_NE('''+cxLabel1.Caption+''', '+IntToStr(ID)+', null, '+IntToStr(show_komissiya)+')';
        DataSetSelectDoc.Open;
    end else
    begin
        DataSetSelectDoc.Close;
        DataSetSelectDoc.SQLs.SelectSQL.Text := 'SELECT DISTINCT * FROM BANK_SELECT_ALL_DOC_FROM_DAY_NE('''+cxLabel1.Caption+''', '+IntToStr(ID)+', '+IntToStr(1)+', '+IntToStr(show_komissiya)+')';
        DataSetSelectDoc.Open;
    end;
end;

procedure TfmBankAddSelectDoc.ActionViewExecute(Sender: TObject);
begin
    Un_lo_file_Alex.LViewDocClBank(self, m.Database.Handle, fsNormal, DataSetSelectDoc.FieldByName('ID_DOC').AsVariant);
end;

procedure TfmBankAddSelectDoc.ActionDelPlExecute(Sender: TObject);
begin
    if DataSetSelectDoc.FieldByName('ADD_HAND').AsInteger = 2 then
    begin
        TransactionWr.StartTransaction;
        Class_StoredProc.StoredProcName:='BANK_UPDATE_PL';
        Class_StoredProc.Prepare;
        Class_StoredProc.ParamByName('ID_KEY').AsInt64    := TFIBBCDField(DataSetSelectDoc.FieldByName('ID_DOC')).AsInt64;;;
        Class_StoredProc.ParamByName('PARAM').AsInt64     := 2;
        Class_StoredProc.ExecProc;
        TransactionWr.Commit;
        ActionRefreshExecute(Sender);
    end
end;

procedure TfmBankAddSelectDoc.ActionOtmDelExecute(Sender: TObject);
begin
    if (DataSetSelectDoc.FieldByName('ADD_HAND').AsInteger = 2) and (DataSetSelectDoc.FieldByName('OBRABOTAN').AsInteger = 2) then
    begin
        TransactionWr.StartTransaction;
        Class_StoredProc.StoredProcName:='BANK_UPDATE_PL';
        Class_StoredProc.Prepare;
        Class_StoredProc.ParamByName('ID_KEY').AsInt64    := TFIBBCDField(DataSetSelectDoc.FieldByName('ID_DOC')).AsInt64;
        Class_StoredProc.ParamByName('PARAM').AsInt64     := 0;
        Class_StoredProc.ExecProc;
        TransactionWr.Commit;
        ActionRefreshExecute(Sender);
    end;
end;

procedure TfmBankAddSelectDoc.cxGrid1DBBandedTableView1DBBandedColumn9CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect : TRect;
begin
{  Arect:=AViewInfo.Bounds;
  if (AViewInfo.GridRecord.Values[6] = 1) and (AViewInfo.GridRecord.Values[5] = 0) then
  begin
      ACanvas.Canvas.Font.Color := RGB(150,50,50);//clRed; выбран и добавлен системой
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;
  if (AViewInfo.GridRecord.Values[6] = 1) and (AViewInfo.GridRecord.Values[5] = 1) then
  begin
      ACanvas.Canvas.Font.Color := RGB(107,69,105); //выбранный и добавлен руками
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;
  if (AViewInfo.GridRecord.Values[6] = 0) and (AViewInfo.GridRecord.Values[5] = 1) then
  begin
      ACanvas.Canvas.Font.Color := rgb(184,48,181);// (60, 210, 173) ;// (185,244,188);//RGB(43,180,35); .. невыбран и добавлен рыкуми
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;
  ACanvas.Canvas.Font.Color := clBlack;
  ACanvas.Canvas.FillRect(Arect);}
    if (AViewInfo.GridRecord.Values[6] = 1) and (AViewInfo.GridRecord.Values[5] = 0) then
    begin            //clRed; выбран и добавлен системой
        ACanvas.FillRect(AViewInfo.Bounds);
        ACanvas.DrawImage(ImageList2,AViewInfo.Bounds.Left + Trunc((AViewInfo.Bounds.Right - AViewInfo.Bounds.Left) / 3),
                          AviewInfo.Bounds.Top, 2);
        ADone := True;
        exit;
    end;
    if (AViewInfo.GridRecord.Values[6] = 1) and (AViewInfo.GridRecord.Values[5] = 1) then
    begin           //выбранный и добавлен руками
        ACanvas.FillRect(AViewInfo.Bounds);
        ACanvas.DrawImage(ImageList2,AViewInfo.Bounds.Left + Trunc((AViewInfo.Bounds.Right - AViewInfo.Bounds.Left) / 3),
                          AviewInfo.Bounds.Top, 1);
        ADone := True;
        exit;
    end;
    if (AViewInfo.GridRecord.Values[6] = 0) and (AViewInfo.GridRecord.Values[5] = 1) then
    begin            //RGB(43,180,35); .. невыбран и добавлен руками
        ACanvas.FillRect(AViewInfo.Bounds);
        ACanvas.DrawImage(ImageList2,AViewInfo.Bounds.Left + Trunc((AViewInfo.Bounds.Right - AViewInfo.Bounds.Left) / 3),
                          AviewInfo.Bounds.Top, 3);
        ADone := True;
        exit;
    end;
    ACanvas.FillRect(AViewInfo.Bounds);
    ACanvas.DrawImage(ImageList2,AViewInfo.Bounds.Left + Trunc((AViewInfo.Bounds.Right - AViewInfo.Bounds.Left) / 3),
                      AviewInfo.Bounds.Top, 4);
    ADone := True;
end;

procedure TfmBankAddSelectDoc.cxCheckBox2Click(Sender: TObject);
begin
    if cxCheckBox2.Checked then
    begin
        show_komissiya := 1;
    end else
    begin
        show_komissiya := 0;
    end;
end;

procedure TfmBankAddSelectDoc.ActionCtrlFExecute(Sender: TObject);
begin
    cxTextEdit1.SetFocus;
end;

procedure TfmBankAddSelectDoc.cxTextEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
    t : boolean;
    s: string;
begin
    if Key = VK_RETURN then
    begin
        t := true;
        t := DataSetSelectDoc.Locate('FULL_NAME_CUST', cxTextEdit1.Text, [loPartialKey]);
        if not t then
        begin
            s := AnsiUpperCase(cxTextEdit1.Text);
            if DataSetSelectDoc.Locate('FULL_NAME_CUST', s, [loPartialKey]) then cxGrid1.setFocus;
        end else cxGrid1.setFocus;
    end;
end;

procedure TfmBankAddSelectDoc.cxGrid1DBBandedTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key = VK_RETURN then
        ActionTakeExecute(Sender);
end;

procedure TfmBankAddSelectDoc.ActionShow_infoExecute(Sender: TObject);
begin
    showmessage('id_doc - ' + DataSetSelectDoc.FieldByName('ID_DOC').AsString);
end;

procedure TfmBankAddSelectDoc.Action1Execute(Sender: TObject);
var
    reg : TRegistry;
    index_m : integer;
begin

    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12300006759837\show\mesnepr\', False) then
        begin
            index_m := StrToInt(reg.ReadString('index'));
        end else
            index_m := -1;
    finally
        reg.Free;
    end;


    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12300006759837\show\mesnepr\',true) then
        begin
            if index_m = -1
                then reg.writeString('index', '1')
                else reg.writeString('index', '-1');
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;
end;

procedure TfmBankAddSelectDoc.ActionClonExecute(Sender: TObject);
var
    id : int64;
    idCloneDoc:Integer;
    isLocate:Boolean;
begin
    id := TFIBBCDField(DataSetSelectDoc.FieldByName('ID_DOC')).AsInt64;
    idCloneDoc:=0;
    if DataSetSelectDoc['ADD_HAND'] = 1 then
    begin
        //idCloneDoc =0 если не клонировали
        //idCloneDoc <> 0 если клонировали
        idCloneDoc:=Un_lo_file_Alex.LClonDocClBank(self, m.Database.Handle, fsNormal, id);
        ActionRefreshExecute(Sender);
        //если клонировали - нужно спозиционироваться на клонированную запись
        if (idCloneDoc<>0) then
        begin
          isLocate:= DataSetSelectDoc.Locate('ID_DOC', idCloneDoc, []);
          //если запись не найдена локейтом (например, поменяли реквизиты расчетного счета)
          //нужно остаться на той же записи 
          if isLocate=False then DataSetSelectDoc.Locate('ID_DOC', id, []);
        end
        else
        begin
          DataSetSelectDoc.Locate('ID_DOC', id, []);
        end;  
    end;
end;

procedure TfmBankAddSelectDoc.FormCreate(Sender: TObject);
begin
     FormStorage1.RestoreFormPlacement;
     

end;

procedure TfmBankAddSelectDoc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FormStorage1.SaveFormPlacement;
end;

procedure TfmBankAddSelectDoc.ActionAllDelExecute(Sender: TObject);
var
     j, pos : integer;
begin
     DataSetSelectDoc.Close;
     DataSetSelectDoc.SQLs.SelectSQL.Text := 'SELECT distinct * FROM BANK_SELECT_ALL_DOC_FROM_DAY_NE('''+m.cxLabel12.Caption+''', '+IntToStr(ID)+', '+IntToStr(1)+', '+IntToStr(show_komissiya)+')';
     DataSetSelectDoc.Open;

     DataSetSelectDoc.FetchAll;

     if not DataSetSelectDoc.IsEmpty then
     begin
        if MessageBox(Handle, Pchar(Un_R_file_Alex.BANK_ZA_VIP+' '+cxLabel1.Caption+Un_R_file_Alex.BANK_NEOBR_DOCOV+inttostr(DataSetSelectDoc.RecordCount)+'.'+Un_R_file_Alex.BANK_DEL_ALL_NeOBROB), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO)=mrYes then
        begin
             DataSetSelectDoc.first;
             j :=0;

             ProgressBar.MaxValue:=DataSetSelectDoc.RecordCount;
             pos:=0;
             cxLabel29.Caption :=inttostr(DataSetSelectDoc.RecordCount);
             cxLabel26.Caption := Un_R_file_Alex.BANK_DEL_PL;
             cxLabel28.Caption := Un_R_file_Alex.BANK_FROM;
             Panel3.Update;
             cxLabel29.Update;
             Panel3.Visible:=true;

             while  not DataSetSelectDoc.eof do
             begin
                 j := j+1;
                 cxLabel27.Caption :=inttostr(j);
                 Panel3.Update;
                 if DataSetSelectDoc['ADD_HAND'] = 1 then
                 begin
                     Un_lo_file_Alex.LDelDocClBank(self, m.Database.Handle, fsNormal, StrToInt64(DataSetSelectDoc.FieldByName('ID_DOC').AsString));
                 end;
                    DataSetSelectDoc.Next;
                pos:=j;
                ProgressBar.Progress:=pos;
             end;

        end;
     end;

     ActionRefreshExecute(Sender);
     pos:=0;
     Panel3.Update;
     Panel3.Visible:=false;
     ProgressBar.Progress:=0;
end;

procedure TfmBankAddSelectDoc.FormShow(Sender: TObject);
begin
  pFIBDataSet1.Close;
  pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from BANK_INI';
  pFIBDataSet1.Open;
  if (pFIBDataSet1.FieldByName('ORDER_FOR_NEOBRAB').AsInteger = 1) then
  begin
    pFIBDataSet1.Close;
    cxGrid1DBBandedTableView1DBBandedColumn2.SortOrder:=soNone;
    cxGrid1DBBandedTableView1DBBandedColumn4.SortOrder:=soAscending;
    cxGrid1DBBandedTableView1DBBandedColumn5.SortOrder:=soAscending;
    cxGrid1DBBandedTableView1.DataController.FocusedRowIndex := 0;
  end;
end;

end.
