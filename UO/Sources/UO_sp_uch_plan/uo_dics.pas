unit uo_dics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, uo_hours_add, FIBDatabase,
  pFIBDatabase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxStatusBar, cxSplitter, ActnList, cxCalc,
  cxContainer, cxLabel, ExtCtrls;

type
  Tfmuo_dics = class(TForm)
    DS: TpFIBDataSet;
    Tr: TpFIBTransaction;
    DB: TpFIBDatabase;
    DataSource1: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    DSID_SP_CIKL_PDG: TFIBBCDField;
    DSNAME_CIKL: TFIBStringField;
    DSSHORT_NAME_CIKL: TFIBStringField;
    DSKOD_CIKL: TFIBIntegerField;
    DSNAME_DISC: TFIBStringField;
    DSSHORT_NAME_DISC: TFIBStringField;
    DSKOD_DISC: TFIBIntegerField;
    DSID_SP_TYPE_DISC: TFIBBCDField;
    DSNAME_TYPE: TFIBStringField;
    DSKOD_TYPE: TFIBIntegerField;
    DSSHORT_NAME_TYPE: TFIBStringField;
    DSID_SP_DISC: TFIBBCDField;
    DSID_SP_UCH_PL_PERELIK: TFIBBCDField;
    dxStatusBarSP: TdxStatusBar;
    cxSplitter1: TcxSplitter;
    ActionList1: TActionList;
    Action1: TAction;
    DSS: TpFIBDataSet;
    DataSource2: TDataSource;
    Action2: TAction;
    DSSID_SP_SEMESTR: TFIBBCDField;
    DSSID_SP_TYPE_DISC_LESSON: TFIBBCDField;
    DSSID_SPUCH_PL_HOURS: TFIBBCDField;
    DSSVAL_HOURS: TFIBBCDField;
    DSSSHORT_NAME_TYPE: TFIBStringField;
    DSSNAME_TYPE: TFIBStringField;
    DSSTRIVALIST: TFIBSmallIntField;
    DSSID_SP_KURS: TFIBBCDField;
    DSSKOD_SEM: TFIBIntegerField;
    DSSSHORT_NAME_SEM: TFIBStringField;
    DSSNAME_SEM: TFIBStringField;
    DSSKOD_KURS: TFIBIntegerField;
    DSSNAME_KURS: TFIBStringField;
    DSSSHORT_NAME_KURS: TFIBStringField;
    DSSKOD_TYPE: TFIBIntegerField;
    Panel1: TPanel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    cxLabel1: TcxLabel;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    DSID_SP_SPECIALIZATION: TFIBBCDField;
    DSSHORT_NAME_SPECIALIZATION: TFIBStringField;
    DSNAME_SPECIALIZATION: TFIBStringField;
    cxGrid2DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn7: TcxGridDBColumn;
    DSSVAL_KONT: TFIBFloatField;
    DSSVAL_GROUP: TFIBFloatField;
    DSSVAL_PERCENT: TFIBFloatField;
    procedure SelectDisc;
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
  private
//    myform : Tfmuo_hours_add;
    regim : smallint;
  public
    { Public declarations }
  end;

function Select_disc(AO : TComponent; D : TpfibDataBase; var id_disc : int64; var s : string; id_ses, id_uch : int64; reg : smallint) : boolean;

implementation

{$R *.dfm}
function Select_disc(AO : TComponent; D : TpfibDataBase; var id_disc : int64; var s : string; id_ses, id_uch : int64; reg : smallint) : boolean;
var
    T : Tfmuo_dics;
begin
    T                        := Tfmuo_dics.Create(AO);
    T.regim                  := reg;   
//    T.myform                 := mform;
    T.DB                     := D;
    T.Tr.DefaultDatabase     := T.DB;
    T.DB.DefaultTransaction  := T.Tr;

    T.DS.Database            := T.DB;
    T.DS.Transaction         := T.Tr;

    T.DSs.Database            := T.DB;
    T.DSs.Transaction         := T.Tr;

    T.Tr.StartTransaction;

    T.Caption                := 'Вікно вибору дисципліни';

    T.cxGrid1DBTableView1DBColumn1.Caption := 'Назва циклу';
    T.cxGrid1DBTableView1DBColumn2.Caption := 'Назва дисципліни';
    T.cxGrid1DBTableView1DBColumn3.Caption := 'Скорочена назва дисципліни';
    T.cxGrid1DBTableView1DBColumn4.Caption := 'Код дисципліни';

    T.cxGrid2DBTableView1DBColumn1.Caption := 'Семестр';
    T.cxGrid2DBTableView1DBColumn2.Caption := 'Курс';
    T.cxGrid2DBTableView1DBColumn4.Caption := 'Кіл-ть годин';

    T.dxStatusBarSP.Panels[0].Text         := 'Enter - Вибрати';
    T.dxStatusBarSP.Panels[1].Text         := 'Esc - Вийти';

    if T.regim = 1 then
    begin
        T.cxGrid2DBTableView1DBColumn3.Caption := 'Тип заннять';
    end else
    begin
        T.cxGrid2DBTableView1DBColumn3.Caption := 'Тип контролю';
        T.cxGrid2DBTableView1DBColumn5.Visible := true;
        T.cxGrid2DBTableView1DBColumn6.Visible := true;
        T.cxGrid2DBTableView1DBColumn7.Visible := true;
        T.cxGrid2DBTableView1DBColumn4.Visible := false;

    end;
    T.DSs.SQLs.SelectSQL.Text := 'select * from UO_TEMP_PERELIK('+IntToSTr(id_ses)+', ?ID_SP_UCH_PL_PERELIK, '+IntToSTr(reg)+')';

    T.DS.Close;
    T.DS.SQLs.SelectSQL.Text := 'select * from UO_TEMP_UCH_PL_PERELIK_SEL_L('+IntToSTr(id_ses)+', '+IntToSTr(id_uch)+')';
    T.DS.Open;

    if not T.DS.IsEmpty then
    begin
        T.cxGrid1DBTableView1.DataController.GotoFirst;
        while not T.cxGrid1DBTableView1.DataController.IsEOF do
        begin
            T.cxGrid1DBTableView1.Controller.FocusedRecord.Expand(true);
            T.cxGrid1DBTableView1.DataController.GotoNext;
        end;
        T.cxGrid1DBTableView1.Controller.FocusedRecord.Expand(true);
    end;

    if T.ShowModal = mrOk then
    begin
        id_disc     := StrToInt64(T.DS.fbn('ID_SP_UCH_PL_PERELIK').AsString);
        s           := T.DS.fbn('NAME_DISC').AsString;
        Result      := true;
    end else
        Result := false;
    T.Free;

end;

{ Tfmuo_dics }

procedure Tfmuo_dics.SelectDisc;
begin
    if not DS.IsEmpty then
    begin
        ModalResult := mrOK;
    end;
end;

procedure Tfmuo_dics.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    SelectDisc;
end;

procedure Tfmuo_dics.Action1Execute(Sender: TObject);
begin
    SelectDisc;
end;

procedure Tfmuo_dics.Action2Execute(Sender: TObject);
begin
    Close;
end;

end.
