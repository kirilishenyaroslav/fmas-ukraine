unit SelectFromVedomost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
  ActnList, cxClasses, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxContainer,
  cxCheckBox, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, Un_r_file_Alex,
  ImgList;

type
  Tfm_SelectFromVedomost = class(TForm)
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
    ActionShowmes: TAction;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    DataSource: TDataSource;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    DS: TpFIBDataSet;
    DBase: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    DSID_PROV_VEDOMOST2: TFIBBCDField;
    DSID_MAN: TFIBBCDField;
    DSSUMMA_PROV: TFIBBCDField;
    DSNUM_VEDOMOST: TFIBIntegerField;
    DSDATE_VEDOMOST: TFIBDateField;
    DSID_SM: TFIBBCDField;
    DSID_RAZD: TFIBBCDField;
    DSID_ST: TFIBBCDField;
    DSID_KEKV: TFIBBCDField;
    DSSMETA_KOD: TFIBIntegerField;
    DSRAZD_NUM: TFIBIntegerField;
    DSKEKV_KOD: TFIBIntegerField;
    DSFIO_MAN: TFIBStringField;
    DSSTAT_KOD: TFIBIntegerField;
    DSTITLE_SMETA: TFIBStringField;
    DSTITLE_RZ: TFIBStringField;
    DSTITLE_STATE: TFIBStringField;
    DSTITLE_KEKV: TFIBStringField;
    DSTIN: TFIBStringField;
    DSBIRTHDAY: TFIBDateField;
    DSID_J4_DT: TFIBBCDField;
    Panel1: TPanel;
    cxCheckBox1: TcxCheckBox;
    cxDateEdit1: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxDateEdit2: TcxDateEdit;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    ImageList: TImageList;
    DSTN: TFIBIntegerField;
    DSKOD_SCH: TFIBStringField;
    DSTITLE_SCH: TFIBStringField;
    DSID_OSN_SCH: TFIBBCDField;
    DSSCH_OSN_TITLE: TFIBStringField;
    DSSCH_OSN_NUM: TFIBStringField;
    DSID_KOR_SCH: TFIBBCDField;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    DSID_ALL_PROV: TFIBBCDField;
    DSSELECT_ALL: TFIBSmallIntField;
    DSNUM_DOC: TFIBStringField;
    cxLabel18: TcxLabel;
    cxLabel19: TcxLabel;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    DSID_J4_DT_D: TFIBBCDField;
    DSID_ALL_PROV_D: TFIBBCDField;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    DSNUM_DOC_D: TFIBStringField;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionTakeExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure DSAfterScroll(DataSet: TDataSet);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    pr :smallint;
    procedure LoadCaptions;
    procedure Refresh;
  public
    id_sys : int64;
  end;

function Select_From_Vedomost(db : TpFIBDatabase; tran : TpFIBTransaction; prihod_in :smallint; var id_prov_vedom, id_sm, id_st, id_razd, id_kekv, id_man, id_osn_sch, id_system, id_kor_sch : int64; var sum : double; var smeta_kod, st_kod, raz_kod, kekv_kod, title_sm, title_raz, title_st, title_kod, fio_man :string; var birthday: Tdate;var tin, kod_sch, title_sch, sch_osn_num, sch_osn_title : string; var tn : integer; var sel_all : smallint) : boolean;

implementation

{$R *.dfm}
function Select_From_Vedomost(db : TpFIBDatabase; tran : TpFIBTransaction; prihod_in :smallint; var id_prov_vedom, id_sm, id_st, id_razd, id_kekv, id_man, id_osn_sch, id_system, id_kor_sch  : int64; var sum : double; var smeta_kod, st_kod, raz_kod, kekv_kod, title_sm, title_raz, title_st, title_kod, fio_man :string ;var birthday: Tdate;var tin, kod_sch, title_sch, sch_osn_num, sch_osn_title : string; var tn : integer; var sel_all : smallint) : boolean;
var
    T : Tfm_SelectFromVedomost;
begin
    T := Tfm_SelectFromVedomost.Create(nil);
    T.LoadCaptions;
    T.cxDateEdit1.Date        := IncMonth(date, -1);
    T.cxDateEdit2.Date        := date;
    T.DS.Database := db;
    T.DS.Transaction := tran;
    T.DS.Transaction.StartTransaction;
    T.id_sys        := id_system;
    T.pr            := prihod_in;
    T.Refresh;
    if T.ShowModal=mrOk then
    begin
        id_prov_vedom := StrToInt64(T.DS.FieldByName('ID_PROV_VEDOMOST2').AsString);
        id_sm         := StrToInt64(T.DS.FieldByName('ID_SM').AsString);
        id_st         := StrToInt64(T.DS.FieldByName('ID_ST').AsString);
        id_razd       := StrToInt64(T.DS.FieldByName('ID_RAZD').AsString);
        id_kekv       := StrToInt64(T.DS.FieldByName('ID_KEKV').AsString);
        id_man        := StrToInt64(T.DS.FieldByName('ID_MAN').AsString);

        if (T.DS['ID_OSN_SCH']<>null) then
            id_osn_sch    := StrToInt64(T.DS.FieldByName('ID_OSN_SCH').AsString)
        else
            id_osn_sch    := 0;
        id_kor_sch    := StrToInt64(T.DS.FieldByName('ID_KOR_SCH').AsString);
        sum           := T.DS.FieldByName('SUMMA_PROV').AsCurrency;
        smeta_kod     := T.DS.FieldByName('SMETA_KOD').AsString;
        st_kod        := T.DS.FieldByName('STAT_KOD').AsString;
        raz_kod       := T.DS.FieldByName('RAZD_NUM').AsString;
        kekv_kod      := T.DS.FieldByName('KEKV_KOD').AsString;
        title_sm      := T.DS.FieldByName('TITLE_SMETA').AsString;
        title_raz     := T.DS.FieldByName('TITLE_RZ').AsString;
        title_st      := T.DS.FieldByName('TITLE_STATE').AsString;
        title_kod     := T.DS.FieldByName('TITLE_KEKV').AsString;
        fio_man       := T.DS.FieldByName('FIO_MAN').AsString;
        birthday      := T.DS.FieldByName('BIRTHDAY').AsDateTime;
        tin           := T.DS.FieldByName('TIN').AsString;
        tn            := T.DS.FieldByName('TN').AsInteger;
        kod_sch       := T.DS.FieldByName('KOD_SCH').AsString;
        title_sch     := T.DS.FieldByName('TITLE_SCH').AsString;
        if (T.DS['SCH_OSN_NUM']<>null) then
            sch_osn_num   := T.DS.FieldByName('SCH_OSN_NUM').AsString
        else
            sch_osn_num    := '';
        if (T.DS['SCH_OSN_TITLE']<>null) then
            sch_osn_title := T.DS.FieldByName('SCH_OSN_TITLE').AsString
        else
            sch_osn_title    := '';
        Result := true;

    end
    else Result := false;
    T.Free
end;

procedure Tfm_SelectFromVedomost.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure Tfm_SelectFromVedomost.LoadCaptions;
begin
    Caption                              := Un_r_file_Alex.J4_CHOOSE_PROV_FROM_VED;
    cxGrid1DBTableView1DBColumn1.Caption := Un_r_file_Alex.KASSA_DOC_FIO;
    cxGrid1DBTableView1DBColumn2.Caption := Un_r_file_Alex.KASSA_SUMMA;
    cxGrid1DBTableView1DBColumn3.Caption := Un_r_file_Alex.J4_NUM_VEDOMOST;
    cxGrid1DBTableView1DBColumn4.Caption := Un_r_file_Alex.J4_DATE_VEDOMOST;
    cxLabel3.Caption                     := Un_r_file_Alex.KASSA_SMETA;
    cxLabel5.Caption                     := Un_r_file_Alex.KASSA_RAZD;
    cxLabel7.Caption                     := Un_r_file_Alex.KASSA_STAT;
    cxLabel9.Caption                     := Un_r_file_Alex.KASSA_KEKV;
    cxLabel15.Caption                    := Un_r_file_Alex.J4_FOND;
    cxLabel18.Caption                    := Un_r_file_Alex.J4_NUM_DOC_K;
    cxLabel20.Caption                   := Un_r_file_Alex.J4_NUM_DOC_D;
    cxCheckBox1.Properties.Caption       := Un_r_file_Alex.J4_SHOW_ALL_PEOPLE;

end;

procedure Tfm_SelectFromVedomost.Refresh;
var
    index : integer;
begin
    if (cxCheckBox1.Checked)
        then index := 1
        else index := 0;

    DS.Close;
    DS.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SELECT_PROV_FROM_VEDOMOST(''' + DateToStr(cxDateEdit1.Date) + ''', ''' + DateToStr(cxDateEdit2.Date) + ''', '+IntToStr(index)+ ', '+IntToStr(id_sys)+ ', '+IntToStr(pr)+')';
    DS.Open;
end;

procedure Tfm_SelectFromVedomost.ActionTakeExecute(Sender: TObject);
begin
    if DS.RecordCount = 0 then
    begin
        ShowMessage('За данний період не знайдено жодного запису!');
        exit;
    end;
    if (inttostr(DS.FieldByName('SELECT_ALL').AsInteger)='0') then
    begin
        ShowMessage(Un_r_file_Alex.J4_USED_RECORD+ DS.FieldByName('NUM_DOC').asString);
        exit;
    end;
    ModalResult := mrOk;
end;

procedure Tfm_SelectFromVedomost.cxButton1Click(Sender: TObject);
begin
    Refresh;
end;

procedure Tfm_SelectFromVedomost.DSAfterScroll(DataSet: TDataSet);
begin
    cxLabel4.Caption   := '';
    cxLabel6.Caption   := '';
    cxLabel8.Caption   := '';
    cxLabel10.Caption  := '';
    cxLabel11.Caption  := '';
    cxLabel12.Caption  := '';
    cxLabel13.Caption  := '';
    cxLabel14.Caption  := '';
    cxLabel16.Caption  := '';
    cxLabel17.Caption  := '';
    cxLabel19.Caption  := '';
    begin
        if not DS.IsEmpty then
        begin
            cxLabel4.caption   := DS.FieldByName('SMETA_KOD').asString;
            cxLabel6.caption   := DS.FieldByName('RAZD_NUM').asString;
            cxLabel8.caption   := DS.FieldByName('STAT_KOD').asString;
            cxLabel10.caption  := DS.FieldByName('KEKV_KOD').asString;
            cxLabel11.caption  := DS.FieldByName('TITLE_SMETA').asString;
            cxLabel12.caption  := DS.FieldByName('TITLE_RZ').asString;
            cxLabel13.caption  := DS.FieldByName('TITLE_STATE').asString;
            cxLabel14.caption  := DS.FieldByName('TITLE_KEKV').asString;
            cxLabel16.Caption  := DS.FieldByName('KOD_SCH').asString;
            cxLabel17.Caption  := DS.FieldByName('TITLE_SCH').asString;
            cxLabel19.Caption  := DS.FieldByName('NUM_DOC').asString;
            cxLabel21.Caption  := DS.FieldByName('NUM_DOC_D').asString;
        end;
    end;
end;

procedure Tfm_SelectFromVedomost.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    Arect : TRect;
begin
   Arect:=AViewInfo.Bounds;
   if (AViewInfo.GridRecord.Values[4]=0) and (not AViewInfo.GridRecord.Focused) then
   begin //уже выбранные люди
       ACanvas.Canvas.Font.Color := RGB(0,0,255);//синий;
       ACanvas.Canvas.FillRect(Arect);
       exit;
   end;
end;

end.
