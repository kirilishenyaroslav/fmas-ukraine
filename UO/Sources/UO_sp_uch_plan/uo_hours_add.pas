unit uo_hours_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, cxLabel, StdCtrls, cxButtons,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxMaskEdit, cxButtonEdit,
  ImgList, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, uo_sp_uchplan_add, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, cxSplitter, FIBDataSet, pFIBDataSet,
  dxStatusBar, cxCalc;

type
  Tfmuo_hours_add = class(TForm)
    ActionList1: TActionList;
    ATake: TAction;
    TExit: TAction;
    ImageList1: TImageList;
    DB: TpFIBDatabase;
    TWr: TpFIBTransaction;
    SP: TpFIBStoredProc;
    T: TpFIBTransaction;
    cxSplitter1: TcxSplitter;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    DS: TpFIBDataSet;
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
    Panel2: TPanel;
    cxLabel4: TcxLabel;
    cxButtonEdit3: TcxButtonEdit;
    cxLabel3: TcxLabel;
    cxButtonEdit2: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxButtonEdit1: TcxButtonEdit;
    cxLabel2: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    dxStatusBarSP: TdxStatusBar;
    DSID_SP_SEMESTR: TFIBBCDField;
    DSID_SP_TYPE_DISC_LESSON: TFIBBCDField;
    DSID_SPUCH_PL_HOURS: TFIBBCDField;
    DSVAL_HOURS: TFIBBCDField;
    DSSHORT_NAME_TYPE: TFIBStringField;
    DSNAME_TYPE: TFIBStringField;
    DSTRIVALIST: TFIBSmallIntField;
    DSID_SP_KURS: TFIBBCDField;
    DSKOD_SEM: TFIBIntegerField;
    DSSHORT_NAME_SEM: TFIBStringField;
    DSNAME_SEM: TFIBStringField;
    DSKOD_KURS: TFIBIntegerField;
    DSNAME_KURS: TFIBStringField;
    DSSHORT_NAME_KURS: TFIBStringField;
    DSKOD_TYPE: TFIBIntegerField;
    cxLabel5: TcxLabel;
    DSselect: TpFIBDataSet;
    cxTextEdit2: TcxTextEdit;
    cxLabel6: TcxLabel;
    procedure TExitExecute(Sender: TObject);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ATakeExecute(Sender: TObject);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    myform : Tfmuo_sp_uchplan_add;
    r_id_type, r_id_sem, r_id_disc : int64;
  public
    id_session, id_uch : int64;
    constructor Create(AO : TComponent; mform : Tfmuo_sp_uchplan_add); reintroduce; overload;
  end;
function show_hours(AO : TComponent; mform : Tfmuo_sp_uchplan_add; var id_type, id_sem, id_disc : int64; var triv : integer; s1, s2, s3 : string) : boolean;

implementation
uses AArray,
     uUO_Loader,
     uo_dics,
     yo_sem;

{$R *.dfm}

function show_hours(AO : TComponent; mform : Tfmuo_sp_uchplan_add; var id_type, id_sem, id_disc : int64; var triv : integer; s1, s2, s3 : string) : boolean;
var
    T : Tfmuo_hours_add;
begin
    T := Tfmuo_hours_add.Create(AO, mform);
    T.r_id_sem           := id_sem;
    T.r_id_disc          := id_disc;
    T.cxTextEdit1.Text   := IntToStr(triv);
    T.r_id_type          := id_type;
    T.cxButtonEdit1.Text := s3;
    T.cxButtonEdit2.Text := s2;
    T.cxButtonEdit3.Text := s1;
    T.id_session         := mform.id_session;
    T.id_uch             := mform.id;

    T.DS.Close;
    T.DS.SQLs.SelectSQL.Text := 'select * from UO_TEMP_PERELIK('+IntToSTr(T.id_session)+', '+IntToSTr(id_disc)+', '+IntToStr(1)+')';
    T.DS.Open;

    T.dxStatusBarSP.Panels[0].Text          := 'F10 - Зберегти';
    T.dxStatusBarSP.Panels[1].Text          := 'Shift+Enter - Визвати довідник';
    T.dxStatusBarSP.Panels[2].Text          := 'Esc - Вийти';

    T.cxButton1.Caption                     := 'F10 - Зберегти';
    T.cxButton2.Caption                     := 'Esc - Вийти';


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
        id_sem      := T.r_id_sem;
        id_type     := T.r_id_type;
        id_disc     := T.r_id_disc;
        triv        := StrToInt(T.cxTextEdit1.Text);
        Result      := true;
    end else
        Result := false;
    T.Free;

end;


constructor Tfmuo_hours_add.Create(AO: TComponent; mform: Tfmuo_sp_uchplan_add);
begin
    inherited Create(AO);
    myform                  := mform;
    DB                      := myform.DB;
    T.DefaultDatabase       := DB;
    TWr.DefaultDatabase     := DB;
    DB.DefaultTransaction   := T;

    DS.DataBase             := DB;
    DS.Transaction          := T;

    DSselect.DataBase       := DB;
    DSselect.Transaction    := T;

    T.StartTransaction;
end;


procedure Tfmuo_hours_add.TExitExecute(Sender: TObject);
begin
    Close;
end;

procedure Tfmuo_hours_add.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then
        Key := Chr(0)
end;

procedure Tfmuo_hours_add.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UO_SP_TYPE_DISC_LESSON.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(DB.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant      := fsNormal;
    uUO_Loader.ShowAllUOBpl(self, InputParam);
    r_id_type          := InputParam['OutPut']['ID_SP_TYPE_DISC_LESSON'].AsInt64;
    if r_id_type <> -1 then
    begin
        cxButtonEdit1.Text := InputParam['OutPut']['NAME'].AsString + '(' + InputParam['OutPut']['SHORT_NAME'].AsString + ')';
        if InputParam['OutPut']['NORM_HOURS'].AsInteger > 0 then cxTextEdit1.Text := InputParam['OutPut']['NORM_HOURS'].AsString;
    end;
    InputParam.Free;

end;

procedure Tfmuo_hours_add.ATakeExecute(Sender: TObject);
begin
    if cxTextEdit1.Text = '' then
    begin
        showmessage('Ви не внесли години');
        exit;
    end;
    if r_id_type <=0 then
    begin
        showmessage('Ви не вибрали типи занять');
        cxButtonEdit1.SetFocus;
        exit;
    end;
    if r_id_disc <=0 then
    begin
        showmessage('Ви не вибрали дисциплину');
        cxButtonEdit3.SetFocus;
        exit;
    end;
    if r_id_sem <=0 then
    begin
        showmessage('Ви не вибрали семестр');
        cxButtonEdit2.SetFocus;
        exit;
    end;
    if StrToFloat(cxTextEdit1.Text)<=0 then
    begin
        showmessage('Ви не ввели години');
        cxTextEdit1.SetFocus;
        exit;
    end;
    ModalResult := mrOk;
{    if j = 1 then
    begin
        SP.Transaction  := TWr;
        try
            TWr.StartTransaction;
            SP.StoredProcName := 'UO_TEMP_HOURS_SEM_INSERT';
            SP.ParamByName('ID_SESSION').AsInt64              := myform.id_session;
            SP.ParamByName('ID_SP_PL_PERELIC').AsInt64        := myform.id_perelic;
            SP.ParamByName('ID_SP_TYPE_DISC_LESSON').AsInt64  := r_id_type;
            SP.ParamByName('VAL_HOURS').AsInteger             := StrToInt(cxTextEdit1.Text);
            SP.ParamByName('TRIVALIST').AsInteger             := myform.trivalist;
            SP.ParamByName('ID_SP_UCH_PLAN').AsInt64          := myform.id_uch_plan;
            SP.ParamByName('ID_SP_KURS').AsInt64              := myform.id_kur;
            SP.ParamByName('ID_SP_SEMESTR').AsInt64           := myform.id_semestr;
            SP.ExecProc;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
            exit;
        end end;

    end;
    if j = 2 then
    begin
        SP.Transaction  := TWr;
        try
            TWr.StartTransaction;
            SP.StoredProcName := 'UO_TEMP_UCH_PL_UPDATE';
            SP.ParamByName('D_ID_SESSION').AsInt64   := myform.id_session;
            SP.ParamByName('D_ID_TYPE').AsInt64      := r_id_type;
            SP.ParamByName('D_VAL_HOURS').AsInteger  := StrToInt(cxTextEdit1.Text);
            SP.ParamByName('D_ID_PL_HOURS').AsInt64  := id;
            SP.ExecProc;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
            exit;
        end end;
    end;
    myform.ARefreshExecute(nil);
    close;   }
end;

procedure Tfmuo_hours_add.cxButtonEdit3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    name : string;
begin
    if Select_disc(Self, DB, r_id_disc, name, id_session, id_uch, 1) then
    begin
        cxButtonEdit3.Text := name;
        DS.Close;
        DS.SQLs.SelectSQL.Text := 'select * from UO_TEMP_PERELIK('+IntToSTr(id_session)+', '+IntToSTr(r_id_disc)+', '+IntToStr(1)+')';
        DS.Open;
        if not DS.IsEmpty then
        begin
            cxGrid1DBTableView1.DataController.GotoFirst;
            while not cxGrid1DBTableView1.DataController.IsEOF do
            begin
                cxGrid1DBTableView1.Controller.FocusedRecord.Expand(true);
                cxGrid1DBTableView1.DataController.GotoNext;
            end;
            cxGrid1DBTableView1.Controller.FocusedRecord.Expand(true);
        end;
        DSselect.Close;
        DSselect.SQLs.SelectSQL.Text := 'select T.NORM_HOURS from UO_TEMP_UCH_PL_PERELIK p, UO_SP_DISC D, UO_SP_TYPE_DISC T WHERE p.ID_SP_DISC=D.ID_SP_DISC AND T.ID_SP_TYPE_DISC=D.ID_SP_TYPE_DISC AND p.ID_SP_UCH_PL_PERELIK='+IntToSTr(r_id_disc)+'';
        DSselect.Open;

        if DSselect.fbn('NORM_HOURS').AsInteger > 0 then
        begin
            cxTextEdit1.Text := DSselect.fbn('NORM_HOURS').AsString;
        end;
        DSselect.Close;

    end;
end;

procedure Tfmuo_hours_add.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    name : string;
begin
    if sel_sem(Self, r_id_sem, name, id_session, id_uch, DB) then
    begin
        cxButtonEdit2.Text := name;
    end;
end;

end.
