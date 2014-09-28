unit MemorialPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, cxLookAndFeelPainters, StdCtrls,
  cxButtons, ExtCtrls, cxCheckBox, cxSpinEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxControls, cxContainer, cxEdit, cxLabel, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, RxMemDS, FIBDataSet,
  pFIBDataSet, ActnList, FIBQuery, pFIBQuery, frxClass, frxDBSet, frxDesgn,
  Placemnt;

type
  TfmMemorialPrint = class(TForm)
    DBase: TpFIBDatabase;
    Tr: TpFIBTransaction;
    cxLabel1: TcxLabel;
    cxComboBoxMonth: TcxComboBox;
    cxLabel2: TcxLabel;
    cxSpinEditYear: TcxSpinEdit;
    cxCheckBoxShow: TcxCheckBox;
    cxButtonPrint: TcxButton;
    cxButtonClose: TcxButton;
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
    DataSource1: TDataSource;
    cxButton1: TcxButton;
    DS: TpFIBDataSet;
    RXLeft: TRxMemoryData;
    TWr: TpFIBTransaction;
    pFIBDataSet1: TpFIBDataSet;
    DataSource3: TDataSource;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid3DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid3DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid3DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid3DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid3DBTableView1DBColumn6: TcxGridDBColumn;
    ActionList1: TActionList;
    Aprint: TAction;
    APereform: TAction;
    DSPer: TpFIBDataSet;
    TWrite: TpFIBTransaction;
    Query: TpFIBQuery;
    DSDebet: TpFIBDataSet;
    frDBDebet: TfrxDBDataset;
    DSDebetNAME_PRED: TFIBStringField;
    DSDebetSALDO_BEGIN: TFIBBCDField;
    DSDebetSALDO_END: TFIBBCDField;
    DSDebetFLAG_SPRAVKA: TFIBIntegerField;
    DSDebetNAME_DATE: TFIBStringField;
    DSDebetSCH_KOD: TFIBStringField;
    DSDebetSUMMA_COLUMN: TFIBBCDField;
    DSDebetDATE_DOC: TFIBDateField;
    DSDebetOBOROT: TFIBBCDField;
    DSDebetSUMMA_ALL: TFIBBCDField;
    DSDebetNAME_SCH: TFIBStringField;
    DSKredit: TpFIBDataSet;
    frDBKrredit: TfrxDBDataset;
    DSKreditNAME_PRED: TFIBStringField;
    DSKreditSALDO_BEGIN: TFIBBCDField;
    DSKreditSALDO_END: TFIBBCDField;
    DSKreditFLAG_SPRAVKA: TFIBIntegerField;
    DSKreditNAME_DATE: TFIBStringField;
    DSKreditSCH_KOD: TFIBStringField;
    DSKreditSUMMA_COLUMN: TFIBBCDField;
    DSKreditDATE_DOC: TFIBDateField;
    DSKreditOBOROT: TFIBBCDField;
    DSKreditSUMMA_ALL: TFIBBCDField;
    DSKreditNAME_SCH: TFIBStringField;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    DSProverka: TpFIBDataSet;
    DSDebetCOUNT_D: TFIBIntegerField;
    DSDebetCOUNT_K: TFIBIntegerField;
    DSDebetSUMMA_INTO_MBOOK: TFIBBCDField;
    DSDebetOKPO: TFIBStringField;
    frxDesigner1: TfrxDesigner;
    DSDebetOBOROT_MO: TFIBBCDField;
    DSDebetSUMMA_ALL_MO: TFIBBCDField;
    DSDebetCALC_OBOR_IN_DB: TFIBIntegerField;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    frxReport1: TfrxReport;
    FormStorage1: TFormStorage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure RXLeftAfterScroll(DataSet: TDataSet);
    procedure cxGrid1DBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid3DBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AprintExecute(Sender: TObject);
    procedure APereformExecute(Sender: TObject);
    procedure ShowPereform;
    procedure deltable;
    procedure FormCreate(Sender: TObject);
  private
    flag_show_right : boolean;
    id_session, id_user_ : int64;
  public
    constructor Create(AOwner : Tcomponent; db : Tpfibdatabase; id_user : int64); reintroduce; overload;
  end;

function ShowMemorialBank (AOwner : Tcomponent; db : Tpfibdatabase; id_user : int64) : integer; stdcall;
    exports ShowMemorialBank;


implementation

uses DateUtils,
     Un_Progress_form,
     GlobalSPR,
     Un_R_file_Alex;

{$R *.dfm}

function ShowMemorialBank (AOwner : Tcomponent; db : Tpfibdatabase; id_user : int64) : integer; stdcall;
var
    T  : TfmMemorialPrint;
begin
    T := TfmMemorialPrint.Create(AOwner, db, id_user);
    T.FormStyle := fsMDIChild;
    T.Show;
    Result := -1;
end;

constructor TfmMemorialPrint.Create(AOwner: Tcomponent; db: Tpfibdatabase;
  id_user: int64);
begin
    inherited Create(AOwner);

    id_user_                 := id_user;
    flag_show_right          := false;
    DBase                    := DB;
    Tr.DefaultDatabase       := DBase;
    TWr.DefaultDatabase      := DBase;
    TWrite.DefaultDatabase   := DBase;

    DBase.DefaultTransaction := Tr;

    DS.Database              := DBase;
    DS.Transaction           := Tr;

    DSProverka.Database      := DBase;
    DSProverka.Transaction   := Tr;

    DSDebet.Database         := DBase;
    DSDebet.Transaction      := TWrite;

    DSKredit.Database        := DBase;
    DSKredit.Transaction     := TWrite;

    Query.Database           := DBase;
    Query.Transaction        := TWrite;

    pFIBDataSet1.Database    := DBase;
    pFIBDataSet1.Transaction := TWr;
    TWr.StartTransaction;

    Tr.StartTransaction;

    id_session := -1;

    DS.Close;
    DS.Sqls.SelectSQL.Text := 'select * from bank_ini';
    DS.Open;

    cxComboBoxMonth.ItemIndex := MonthOf(IncDay(date, -DS.fbn('BANK_DAY_SHOW_LAST').AsInteger))-1;
    cxSpinEditYear.Value := YearOf(IncDay(date, -DS.fbn('BANK_DAY_SHOW_LAST').AsInteger));

    cxGrid3.Enabled := false;
    cxGrid3DBTableView1.Styles.Background := cxStyleBorder;
    flag_show_right := true;

    Caption                              := Un_R_file_Alex.BANK_MO_CAPTION[1];
    cxLabel1.Caption                     := Un_R_file_Alex.BANK_MO_TAKE_MONT[1];
    cxLabel2.Caption                     := Un_R_file_Alex.BANK_MO_TAKE_YEAR[1];
    cxButton1.Caption                    := Un_R_file_Alex.BANK_MO_TAKE_PEREFORM[1];
    cxButtonPrint.Caption                := Un_R_file_Alex.BANK_MO_PRINT[1];
    cxButtonClose.Caption                := Un_R_file_Alex.BANK_MO_EXIT[1];
    cxCheckBoxShow.Properties.Caption    := Un_R_file_Alex.BANK_MO_PRINT_M[1];

    cxGridDBTableView1DBColumn1.Caption  := '';
    cxGridDBTableView1DBColumn2.Caption  := Un_R_file_Alex.BANK_MO_REG_SHORT[1];
    cxGridDBTableView1DBColumn3.Caption  := Un_R_file_Alex.BANK_MO_SCH_KOD[1];
    cxGridDBTableView1DBColumn4.Caption  := Un_R_file_Alex.BANK_MO_SCH_TITLE[1];

    cxGrid3DBTableView1DBColumn1.Caption := Un_R_file_Alex.BANK_MO_MO[1];
    cxGrid3DBTableView1DBColumn2.Caption := Un_R_file_Alex.BANK_MO_RAS[1];
    cxGrid3DBTableView1DBColumn3.Caption := Un_R_file_Alex.BANK_MO_NAME_FINANCE[1];
    cxGrid3DBTableView1DBColumn4.Caption := Un_R_file_Alex.BANK_MO_BUKVA[1];
    cxGrid3DBTableView1DBColumn5.Caption := Un_R_file_Alex.BANK_MO_KOD_REG[1];
    cxGrid3DBTableView1DBColumn6.Caption := Un_R_file_Alex.BANK_MO_PROGRAMM[1];

end;

procedure TfmMemorialPrint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    deltable;
    if FormStyle = fsMDIChild then Action := CaFree;
    FormStorage1.SaveFormPlacement;
end;

procedure TfmMemorialPrint.cxButtonCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TfmMemorialPrint.RXLeftAfterScroll(DataSet: TDataSet);
var
    id : int64;
begin
    if flag_show_right then
    begin
        if not RXLeft.IsEmpty then
        begin
            try pFIBDataSet1.Post except end;
            id := RXLeft.FieldByName('id_sch').value;
            pFIBDataSet1.Close;
//            pFIBDataSet1.SQLs.SelectSQL.Text := 'select ID_PKV, PKV_TITLE, PKV_KOD, ID_TYPE_FINANCE, TYPE_FINANCE_NAME, TYPE_FINANCE_CODE, MO_CHAR, PRINT_MO, PRINT_RAS_SCH from BANK_TEMP_MO where ID_SESSION='+IntToStr(id_session)+' and ID_SCH= '+IntToStr(id)+'';
            pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from BANK_TEMP_MO where ID_SESSION='+IntToStr(id_session)+' and ID_SCH= '+IntToStr(id)+'';
            pFIBDataSet1.Open;
            if RXLeft.FieldByName('print').asInteger = 1
                then begin
                    cxGrid3.Enabled := true;
                    cxGrid3DBTableView1.Styles.Background := cxStyleYellow;
                end
                else begin
                    cxGrid3.Enabled := false;
                    cxGrid3DBTableView1.Styles.Background := cxStyleBorder;
                end;
        end;
    end;
end;

procedure TfmMemorialPrint.cxGrid1DBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if not RXLeft.IsEmpty then
        if Key = vk_space then
        begin
            RXLeft.Open;
            RXLeft.Edit;
            if RXLeft.FieldByName('print').AsInteger = 1
                then RXLeft.FieldByName('print').Value := 0
                else begin
                    RXLeft.FieldByName('print').Value := 1;
                    RXLeft.Post;
                    cxGridDBTableView1.Controller.GoToNext(false);
                    exit;
                end;
            RXLeft.Post;
        end
end;

procedure TfmMemorialPrint.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    if not RXLeft.IsEmpty then
    begin
        RXLeft.Open;
        RXLeft.Edit;
        if RXLeft.FieldByName('print').AsInteger = 1
            then RXLeft.FieldByName('print').Value := 0
            else RXLeft.FieldByName('print').Value := 1;
        RXLeft.Post;
    end
end;

procedure TfmMemorialPrint.cxGrid3DBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = VK_RETURN then pFIBDataSet1.Post;
end;

procedure TfmMemorialPrint.AprintExecute(Sender: TObject);
var
    id : int64;
    d1, d2 : string;
    i1, i2, i3, i4 : int64;
begin
    flag_show_right := false;
    if not RXLeft.IsEmpty then
    begin
        try pFIBDataSet1.Post except end;
        if cxComboBoxMonth.ItemIndex < 9
            then d1 := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
            else d1 := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
        d2 := DateToStr(IncDay(IncMonth(StrToDate(d1),1), -1));

        RXLeft.First;
        while not RXLeft.Eof do
        begin
            if RXLeft.FieldByName('print').AsInteger = 1 then
            begin
                id := RXLeft.FieldByName('id_sch').value;
                DSProverka.Close;
                DSProverka.SQLs.SelectSQL.Text := 'select * from BANK_MO_PROVERKA('+intToStr(id)+', '''+d1+''')';
                DSProverka.Open;
                if DSProverka.FBN('R_RESULT').AsInteger = 1 then
                begin
                    showmessage('—чет ' +RXLeft.FieldByName('kod_sch').AsString + Un_R_file_Alex.BANK_MO_MES1[1]+cxComboBoxMonth.Text+' '+cxSpinEditYear.Text+'.'+#13+Un_R_file_Alex.BANK_MO_MES2[1]);
                    exit;
                end;
                DSProverka.Close;
                DS.Close;
                DS.SQLs.SelectSQL.Text := 'select * from BANK_TEMP_MO, PUB_SP_REG_UCH where BANK_TEMP_MO.id_reg=PUB_SP_REG_UCH.id_reg and ID_SESSION='+IntToStr(id_session)+' and ID_SCH= '+IntToStr(id)+'';
                DS.Open;
                DS.First;
                while not DS.Eof do
                begin
                    if DS.FBN('PRINT_MO').AsInteger = 1 then
                    begin
                        TWrite.StartTransaction;
                        i1 := StrToint64(DS.fbn('ID_PKV').AsString);
                        i2 := StrToint64(DS.fbn('ID_TYPE_FINANCE').AsString);
                        i3 := RXLeft.FieldByName('ID_SCH').value;
                        i4 := RXLeft.FieldByName('ID_RAS').value;
                        DSDebet.Close;
                        DSDebet.SQLs.SelectSQL.Text := 'select * from BANK_MO('''+d1+''', '''+d2+''', '+IntToStr(i1)+', '+IntToStr(i2)+', '+IntToStr(i3)+', '+IntToStr(i4)+')';
                        DSDebet.Open;
                        DSDebet.FetchAll;

                        DSKredit.Close;
                        DSKredit.SQLs.SelectSQL.Text := 'select * from BANK_MO1('''+d1+''', '''+d2+''', '+IntToStr(i1)+', '+IntToStr(i2)+', '+IntToStr(i3)+', '+IntToStr(i4)+')';
                        DSKredit.Open;
                        DSKredit.FetchAll;

                        frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_20013_ukr.fr3');

                        frxReport1.Variables['comp']       := QuotedStr(GetComputerNetName);
                        frxReport1.Variables['id_user']    := QuotedStr(IntToStr(id_user_));

                        frxReport1.Variables['name_prog']  := QuotedStr(DS.FBN('PKV_KOD').AsString);
                        frxReport1.Variables['title_prog'] := QuotedStr(DS.FBN('PKV_TITLE').AsString);

                        frxReport1.Variables['kod_ord']    := QuotedStr(DS.FBN('REG_Kod').AsString);
                        frxReport1.Variables['reg_title']  := QuotedStr(DS.FBN('REG_TITLE').AsString);
                        frxReport1.Variables['buk_ord']    := QuotedStr(DS.FBN('MO_CHAR').AsString);

                        frxReport1.Variables['mon_year']   := Quotedstr(cxComboBoxMonth.Text + ' ' + cxSpinEditYear.Text);

                        frxReport1.PrepareReport(true);

                        if not cxCheckBoxShow.Checked then
                        begin

                            frxReport1.PrintOptions.ShowDialog := False;
                            frxReport1.Print;
                        end
                        else frxReport1.ShowReport(true);
                        //frxReport1.Designreport;
                        TWrite.Rollback;
                    end;

//                    if DS.FBN('PRINT_RAS_SCH').AsInteger = 1 then
                    DS.Next;
                end;
            end;
            RXLeft.Next;
        end;
    end;
    flag_show_right := true;
end;

procedure TfmMemorialPrint.APereformExecute(Sender: TObject);
var
    d1, d2 : string;
    T : TfmUn_Progress_form;
begin
    T := TfmUn_Progress_form.Create(nil, wait_, Un_R_file_Alex.WAIT_FORM_D);
    T.Show;
    T.Repaint;
    DSPer.Database    := DBase;
    DSPer.Transaction := TWrite;
    TWrite.StartTransaction;
    if id_session > 0 then
    begin
        deltable;
    end;
    if cxComboBoxMonth.ItemIndex < 9
        then d1 := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
        else d1 := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
    d2 := DateToStr(IncDay(IncMonth(StrToDate(d1),1), -1));

    DSPer.Close;
    DSPer.SQLs.SelectSQL.Text := 'select * from BANK_MO_ZAP_GRID('''+d1+''', '''+d2+''')';
    DSPer.Open;
    id_session  := StrToint64(DSPer.fbn('R_ID_SESSION').AsString);
    DSPer.Close;
    TWrite.Commit;
    ShowPereform;
    T.Free;
end;

procedure TfmMemorialPrint.ShowPereform;
begin
    flag_show_right := false;
    try
    DS.Close;
    DS.Sqls.SelectSQL.Text := 'select distinct ID_SCH, KOD_SCH, TITLE_SCH, ID_RAS, KOD_RAS, REG_SHORT  from BANK_TEMP_MO where ID_SESSION='+IntToStr(id_session)+'';
    DS.Open;
    DS.First;
    RXLeft.EmptyTable;
    while not DS.Eof do
    begin
        RXLeft.Open;
        RXLeft.Insert;
        RXLeft.FieldByName('print').Value     := 0;
        RXLeft.FieldByName('kod_sch').Value   := DS.fbn('KOD_SCH').asString;
        RXLeft.FieldByName('id_sch').Value    := strToInt64(DS.fbn('ID_SCH').asString);
        RXLeft.FieldByName('id_ras').Value    := strToInt64(DS.fbn('ID_RAS').asString);
        RXLeft.FieldByName('title_sch').Value := DS.fbn('TITLE_SCH').asString;
        RXLeft.FieldByName('kod_ras').Value   := DS.fbn('KOD_RAS').asString;
        RXLeft.FieldByName('Reg_short').Value := DS.fbn('REG_SHORT').asString;
        RXLeft.Post;
        DS.Next;
    end;

    RXLeft.First;

    pFIBDataSet1.SQLs.UpdateSQL.Text  := 'UPDATE BANK_TEMP_MO SET PRINT_MO = ?PRINT_MO, PRINT_RAS_SCH = ?PRINT_RAS_SCH WHERE ID_SESSION = ?OLD_ID_SESSION and ID_SCH = ?OLD_ID_SCH and ID_RAS = ?OLD_ID_RAS and ID_PKV = ?OLD_ID_PKV and ID_TYPE_FINANCE = ?OLD_ID_TYPE_FINANCE';
//    pFIBDataSet1.SQLs.RefreshSQL.Text := 'SELECT BAN.ID_SESSION, BAN.ID_SCH, BAN.KOD_SCH, BAN.TITLE_SCH, BAN.ID_RAS, BAN.KOD_RAS, BAN.ID_PKV, BAN.PKV_TITLE, BAN.PKV_KOD, BAN.ID_TYPE_FINANCE, BAN.TYPE_FINANCE_NAME, BAN.TYPE_FINANCE_CODE, BAN.MO_CHAR, BAN.PRINT_MO, BAN.PRINT_RAS_SCH FROM BANK_TEMP_MO BAN WHERE (BAN.ID_SESSION = ?OLD_ID_SESSION and BAN.ID_SCH = ?OLD_ID_SCH and BAN.ID_RAS = ?OLD_ID_RAS and BAN.ID_PKV = ?OLD_ID_PKV and BAN.ID_TYPE_FINANCE = ?OLD_ID_TYPE_FINANCE';
    pFIBDataSet1.Close;
    pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from BANK_TEMP_MO where ID_SESSION='+IntToStr(id_session)+' and ID_SCH= '''+RXLeft.FieldByName('id_sch').AsString+''' ';
    pFIBDataSet1.Open;
    except
        pFIBDataSet1.Close;
    end;
    flag_show_right := true;
end;

procedure TfmMemorialPrint.deltable;
begin
    TWrite.StartTransaction;

    Query.close;
    Query.SQL.Clear;
    Query.SQL.Text := 'delete from BANK_TEMP_MO where id_session='+IntToStr(id_session)+'';

    try
        Query.ExecQuery;
        TWrite.Commit;
    except
        TWrite.Rollback;
    end;
end;


procedure TfmMemorialPrint.FormCreate(Sender: TObject);
begin
    FormStorage1.RestoreFormPlacement;
end;

end.
