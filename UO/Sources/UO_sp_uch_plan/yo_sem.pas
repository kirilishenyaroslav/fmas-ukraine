unit yo_sem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, uo_hours_add, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, dxStatusBar, cxSplitter, ActnList, cxCalc;

type
  Tfmyo_sem = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    DS: TpFIBDataSet;
    D: TpFIBDatabase;
    Tr: TpFIBTransaction;
    DataSource1: TDataSource;
    DSID_SP_UCH_PL_SEM: TFIBBCDField;
    DSTRIVALIST: TFIBSmallIntField;
    DSID_SP_UCH_PLAN: TFIBBCDField;
    DSID_SP_KURS: TFIBBCDField;
    DSID_SP_SEMESTR: TFIBBCDField;
    DSKOD_KURS: TFIBIntegerField;
    DSNAME_KURS: TFIBStringField;
    DSSHORT_NAME_KURS: TFIBStringField;
    DSSHORT_NAME_SEM: TFIBStringField;
    DSNAME_SEM: TFIBStringField;
    DSKOD_SEM: TFIBSmallIntField;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    dxStatusBarSP: TdxStatusBar;
    ActionList1: TActionList;
    Action1: TAction;
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure SelectSem;
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function sel_sem(ao : TComponent; var id_disc : int64; var s1 : string; id_ses, id_uch : int64; db : TpfibDataBase) : boolean;

implementation

{$R *.dfm}

function sel_sem(ao : Tcomponent; var id_disc : int64; var s1 : string; id_ses, id_uch : int64; db : TpfibDataBase) : boolean;
var
    T : Tfmyo_sem;
begin
    T                      := Tfmyo_sem.Create(Ao);
    T.D                    := DB;
    T.Tr.DefaultDatabase   := T.D;
    T.D.DefaultTransaction := T.Tr;

    T.DS.Database          := T.D;
    T.DS.Transaction       := T.Tr;

    T.Tr.StartTransaction;

    T.Caption                              := 'Вікно вибору семестра';

    T.cxGrid1DBTableView1DBColumn1.Caption := 'Назва семестру';
    T.cxGrid1DBTableView1DBColumn2.Caption := 'Скорочена назва сем.';
    T.cxGrid1DBTableView1DBColumn3.Caption := 'Код семестру';
    T.cxGrid1DBTableView1DBColumn4.Caption := 'Скорочена назва курсу';

    T.dxStatusBarSP.Panels[0].Text         := 'Enter - Вибрати';
    T.dxStatusBarSP.Panels[1].Text         := 'Esc - Вийти';

    T.DS.Close;
    T.DS.SQLs.SelectSQL.Text := 'select * from UO_TEMP_HOURS_SEM_SELECT('+IntToStr(id_ses)+', '+IntToStr(id_uch)+')';
    T.DS.Open;

    if T.ShowModal = mrOk then
    begin
        id_disc := StrToInt64(T.DS.fbn('ID_SP_UCH_PL_SEM').AsString);
        s1      := T.DS.fbn('NAME_SEM').AsString;
        Result  := true;
    end
    else
        Result := false;
    T.Free;
end;

procedure Tfmyo_sem.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    SelectSem;
end;

procedure Tfmyo_sem.SelectSem;
begin
    if not DS.isEmpty then
    begin
        ModalResult := mrOK;
    end;
end;

procedure Tfmyo_sem.Action1Execute(Sender: TObject);
begin
    SelectSem;
end;

end.
