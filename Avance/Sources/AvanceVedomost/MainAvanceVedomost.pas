unit MainAvanceVedomost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ComCtrls, ToolWin, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ActnList, ImgList,
  cxSplitter, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, ExtCtrls,
  cxLabel, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  FIBQuery, pFIBQuery, pFIBStoredProc, cxCurrencyEdit;

type
  TfmMainAvanceVedomost = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
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
    ImageList: TImageList;
    ActionList1: TActionList;
    AAdd: TAction;
    AEdit: TAction;
    ADel: TAction;
    ARefresh: TAction;
    AExit: TAction;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    DS: TpFIBDataSet;
    TR: TpFIBTransaction;
    D: TpFIBDatabase;
    DSRight: TpFIBDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxSplitter1: TcxSplitter;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn4: TcxGridDBColumn;
    DSID_J4_DT_VEDOMOST: TFIBBCDField;
    DSNUMBER: TFIBStringField;
    DSDATE_V: TFIBDateField;
    DSSUMMA_V: TFIBBCDField;
    DSNOTE: TFIBStringField;
    DSID_J4_SP_JO: TFIBBCDField;
    DSID_USER: TFIBBCDField;
    DSID_ALL_DOC: TFIBBCDField;
    DSNAME: TFIBStringField;
    DTemp: TpFIBDataSet;
    Panel1: TPanel;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    DSRightID_J4_DT_VEDOMOST_V: TFIBBCDField;
    DSRightID_J4_DT_VEDOMOST: TFIBBCDField;
    DSRightID_VEDOMOST: TFIBBCDField;
    DSRightNOMER: TFIBStringField;
    DSRightDATE_VEDOMOST: TFIBDateField;
    DSRightNAME: TFIBStringField;
    DSRightSUMMA: TFIBBCDField;
    TWr: TpFIBTransaction;
    pFIBStoredProc1: TpFIBStoredProc;
    procedure AExitExecute(Sender: TObject);
    procedure ARefreshExecute(Sender: TObject);
    procedure ADelExecute(Sender: TObject);
    procedure AAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    id_users, id_sch, id_ses_ved, id_system : int64;
    count_day : integer;
    sch_kod, sch_title : string;
    constructor Create(AOwner : TComponent; DB : TpFIBDatabase; id_user : int64); reintroduce; overload;
  end;

function AvanceVedomost(AOwner : TComponent; id_user : int64; DB : TpFIBDatabase) : Integer; stdcall;
    exports AvanceVedomost;

implementation
uses DateUtils,
     UWLoaderUnit,
     AddAvanceVedomost;
{$R *.dfm}


function AvanceVedomost(AOwner : TComponent; id_user : int64; DB : TpFIBDatabase) : Integer; stdcall;
var
    T : TfmMainAvanceVedomost;
begin
    T := TfmMainAvanceVedomost.Create(AOwner, DB, id_user);
    T.ShowModal;
    T.Free;
    Result := -1;
end;

{ TfmMainAvanceVedomost }

constructor TfmMainAvanceVedomost.Create(AOwner: TComponent;
  DB: TpFIBDatabase; id_user: int64);
begin
    inherited Create (AOwner);
    id_users := id_user;


    D                    := DB;
    Tr.DefaultDatabase   := D;
    TWr.DefaultDatabase  := D;
    D.DefaultTransaction := Tr;

    DS.Database          := D;
    DS.Transaction       := Tr;

    DSRight.Database     := D;
    DSRight.Transaction  := Tr;

    DTemp.Database       := D;
    DTemp.Transaction    := Tr;

    Tr.StartTransaction;

    DTemp.Close;
    DTemp.SQLs.SelectSQL.Text := 'select * from J4_INI';
    DTemp.Open;

    count_day := DTemp.fbn('J4_DAY_SHOW_LAST').AsInteger;

    cxDateEdit1.Date := IncDay(date, -count_day);
    cxDateEdit2.Date := Date;

    DTemp.Close;

    DSRight.SelectSQL.Text := 'select * from J4_DT_VEDOMOST_V_SELECT(?ID_J4_DT_VEDOMOST)';

    DS.Close;
    DS.SQLs.SelectSQL.Text := 'select * from J4_DT_VEDOMOST_SELECT('''+DateToStr(incDay(date, -count_day))+''', '''+DateToStr(date)+''')';
    DS.Open;

end;

procedure TfmMainAvanceVedomost.AExitExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmMainAvanceVedomost.ARefreshExecute(Sender: TObject);
var
    id : int64;
begin
    if not DS.IsEmpty
        then id := StrToInt64(DS.fbn('ID_J4_DT_VEDOMOST').AsString)
        else id := -1;
    DS.Close;
    DS.SQLs.SelectSQL.Text := 'select * from J4_DT_VEDOMOST_SELECT('''+DateToStr(incDay(cxDateEdit1.date, -count_day))+''', '''+DateToStr(cxDateEdit2.date)+''')';
    DS.Open;
    DS.Locate('ID_J4_DT_VEDOMOST', id, []);
end;

procedure TfmMainAvanceVedomost.ADelExecute(Sender: TObject);
begin
//
end;

procedure TfmMainAvanceVedomost.AAddExecute(Sender: TObject);
var
    id_ses : int64;
    T : TfmAddAvanceVedomost;
begin
    id_ses := UWLoaderUnit.LoadSelectVedomostOutput(Self, D, id_users, -1, cxDateEdit1.Date, cxDateEdit2.Date);
    if id_ses > 0 then
    begin
        id_ses_ved := id_ses;
        T          := TfmAddAvanceVedomost.Create(Self, self, addV);
        T.ShowModal;
        T.Free;
    end;
end;

end.
