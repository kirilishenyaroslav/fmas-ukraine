unit fuck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, ImgList, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, Ibase, GlobalSPR, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, cxContainer, cxTextEdit, cxDBEdit, Resources_unitb,
  ActnList, Placemnt, dxStatusBar, findsmeta, cxCheckBox, RxMemDS;



type
  Tpub_spr_smet = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ViewButton: TToolButton;
    SmallImages: TImageList;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Splitter2: TSplitter;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    cxStyleRepository1: TcxStyleRepository;
    SmetSyle: TcxStyle;
    GroupStyle: TcxStyle;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    SearchDataSet: TpFIBDataSet;
    GroupsDataSet: TpFIBDataSet;
    GroupsDataSource: TDataSource;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton1: TToolButton;
    ColStyle: TcxStyle;
    Panel4: TPanel;
    Panel5: TPanel;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid4DBTableView1: TcxGridDBTableView;
    cxGrid4Level1: TcxGridLevel;
    cxGrid4: TcxGrid;
    RazdDataSet: TpFIBDataSet;
    StDataSet: TpFIBDataSet;
    RazdDataSource: TDataSource;
    StDataSource: TDataSource;
    cxGrid3DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid3DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid4DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid4DBTableView1DBColumn2: TcxGridDBColumn;
    ActionList1: TActionList;
    Action1: TAction;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    //FormStorage1: TFormStorage;
    //ToolButton1: TToolButton;
    //SearchDataSet: TpFIBDataSet;
    //Action3: TAction;
    //dxStatusBar1: TdxStatusBar;
    smview: TcxGridDBTableView;
    smViewDBColumn1: TcxGridDBColumn;
    smViewDBColumn2: TcxGridDBColumn;
    Action3: TAction;
    dxStatusBar1: TdxStatusBar;
    Action2: TAction;
    Action4: TAction;
    SmetaDataSet: TpFIBDataSet;
    DataSource1: TDataSource;
    RxMemoryData1: TRxMemoryData;
    smviewDBColumn3: TcxGridDBColumn;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1Resize(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure SmViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGrid3DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGrid3Enter(Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure SmViewDblClick(Sender: TObject);
    procedure SmViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid3DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid4DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid3DBTableView1DblClick(Sender: TObject);
    procedure cxGrid4DBTableView1DblClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure SmetaDataSetCalcFields(DataSet: TDataSet);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
  private
    { Private declarations }
    p_id_sm:integer;
    p_id_rz:integer;
    p_id_st:integer;
    p_need:boolean;
  public
    { Public declarations }
    T: TfrmGetPosForm;
    CurMode:TPublicSmetaMode;
    ActualDate:TdateTime;
    ActualDate_str:string;
    ResultValue:Variant;
    ResultDataSet:TDataSet;
    function CheckChValues:Boolean;
    constructor Create(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;ActualDate:TDateTime;Mode:TPublicSmetaMode;id_session:Integer=0); overload;
    constructor Create(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;ActualDate:TDateTime;Mode:TPublicSmetaMode;Id_sm,id_rz,id_st:Integer); overload;
  end;

  function GetSmets(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;ActualDate:TDateTime;Mode:TPublicSmetaMode):Variant;stdcall;
  function GetSmetsEx(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;ActualDate:TDateTime;Mode:TPublicSmetaMode;Id_sm,id_rz,id_st:Integer):Variant;stdcall;
  function GetPackVersion:Integer;stdcall;
  function GetSmetsMulty(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;ActualDate:TDateTime;Mode:TPublicSmetaMode;id_session:integer):TDataSet;stdcall;

  exports  GetSmets, GetSmetsEx, GetPackVersion,GetSmetsMulty;

implementation

uses VarUtils;


{$R *.dfm}

function GetPackVersion:Integer;
begin
     GetPackVersion:=1;
end;

function GetSmets(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;ActualDate:TDateTime;Mode:TPublicSmetaMode):Variant;
var T:Tpub_spr_smet;
    Res:Variant;
begin
     T:=Tpub_spr_smet.Create(AOwner,DBHANDLE,ActualDate,Mode);
     T.ShowModal;
     Res:=T.ResultValue;
     T.Free;
     GetSmets:=Res;
end;

function GetSmetsMulty(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;ActualDate:TDateTime;Mode:TPublicSmetaMode;id_session:integer):TDataSet;
var T:Tpub_spr_smet;
    Res:TDataSet;
begin
     T:=Tpub_spr_smet.Create(AOwner,DBHANDLE,ActualDate,Mode,id_session);
     T.ShowModal;
     Res:=T.ResultDataSet;
     T.Free;
     GetSmetsMulty:=Res;
end;

function GetSmetsEx(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;ActualDate:TDateTime;Mode:TPublicSmetaMode;Id_sm,id_rz,id_st:Integer):Variant;
var T:Tpub_spr_smet;
    Res:Variant;
begin
     T:=Tpub_spr_smet.Create(AOwner,DBHANDLE,ActualDate,Mode,id_sm, id_rz,id_st);
     T.ShowModal;
     Res:=T.ResultValue;
     T.Free;
     GetSmetsEx:=Res;
end;


constructor Tpub_spr_smet.Create(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; ActualDate: TDateTime; Mode: TPublicSmetaMode;id_session:Integer);
begin
      inherited Create(AOwner);


      self.p_need:=false;
      Self.WorkDatabase.Handle:=DBHAndle;
      self.ActualDate:=ActualDate;
      DateTimeToString(ActualDate_str,'dd.mm.yyyy',self.ActualDate);
      CurMode:=Mode;
      case Mode of
          psmGroup    :begin
                             self.Caption:='Бюджети, які функціонують на '+ActualDate_str;
                             Panel1.Visible:=false;
                             cxGrid1.Visible:=true;
                             cxGrid2.Visible:=false;
                             cxGrid1.Align:=alClient;
                             GroupsDataSet.SQLs.SelectSQL.Text:='   SELECT DISTINCT G.*                 '+
                                                                '   FROM PUB_SMETA_GROUP G, BU_SMET_PLUS_PERIODS P, PUB_SPR_SMETA S '+
                                                                '   WHERE    G.ID_GROUP=S.ID_GROUP  '+
                                                                '        AND S.ID_SMETA=P.ID_SMETA  '+
                                                                '        AND P.DATE_BEG<='+''''+ActualDate_str+''''+
                                                                '        AND P.DATE_END> '+''''+ActualDate_str+'''';
                             GroupsDataSet.Open;
                             GroupsDataSet.FetchAll;
                       end;
 psmSmetWithoutPeriod :begin
                             self.Caption:='Бюджети';
                             Panel1.Visible:=false;
                             cxGrid1.Visible:=false;
                             cxGrid2.Visible:=true;
                             cxGrid2.Align:=alClient;
                             SmetaDataSet.SQLs.SelectSQL.Text:= '   SELECT S.ID_SMETA, S.SMETA_TITLE, S.SMETA_KOD '+
                                                                '     FROM PUB_SPR_SMETA S '+
                                                                '    ORDER BY S.SMETA_KOD   ';
                             SmetaDataSet.Open;
                             SmetaDataSet.FetchAll;
                             RxMemoryData1.LoadFromDataSet(SmetaDataSet,0,lmCopy)
                       end;
          psmSmet     :begin
                             self.Caption:='Бюджети, які функціонують на '+ActualDate_str;
                             Panel1.Visible:=false;
                             cxGrid1.Visible:=false;
                             cxGrid2.Visible:=true;
                             cxGrid2.Align:=alClient;
                             SmetaDataSet.SQLs.SelectSQL.Text:= '   SELECT S.ID_SMETA, S.SMETA_TITLE, S.SMETA_KOD, P.ID_PLAN   '+
                                                                '   FROM BU_SMET_PLUS_PERIODS P, PUB_SPR_SMETA S '+
                                                                '   WHERE  S.ID_SMETA=P.ID_SMETA '+
                                                                '        AND P.DATE_BEG<='+''''+ActualDate_str+''''+
                                                                '        AND P.DATE_END> '+''''+ActualDate_str+''''+
                                                                '   ORDER BY S.SMETA_KOD                           ';
                             SmetaDataSet.Open;
                             SmetaDataSet.FetchAll;
                       end;
          psmSmetMulty:
                       begin
                             smviewDBColumn3.Visible:=True;
                             self.Caption:='Бюджети, які функціонують на '+ActualDate_str;
                             Panel1.Visible:=false;
                             cxGrid1.Visible:=false;
                             cxGrid2.Visible:=true;
                             cxGrid2.Align:=alClient;
                             ToolButton2.Visible:=true;
                             ToolButton5.Visible:=true;
                             ToolButton6.Visible:=true;
                             SmetaDataSet.SQLs.SelectSQL.Text:= '   SELECT DISTINCT S.ID_SMETA, S.SMETA_TITLE, S.SMETA_KOD, P.ID_PLAN   '+
                                                                '   FROM BU_SMET_PLUS_PERIODS P, PUB_SPR_SMETA S inner join Z_SVOD_ACCOUNT A on A.ID_SMETA=S.ID_SMETA'+
                                                                '   WHERE  S.ID_SMETA=P.ID_SMETA '+
                                                                '        AND P.DATE_BEG<='+''''+ActualDate_str+''''+
                                                                '        AND P.DATE_END> '+''''+ActualDate_str+''''+
                                                                '        and A.id_session='+inttostr(id_session)+
                                                                '   ORDER BY S.SMETA_KOD                           ';
                             SmetaDataSet.Open;
                             SmetaDataSet.FetchAll;
                             RxMemoryData1:=TRxMemoryData.Create(Application);
                             RxMemoryData1.Close;
                             RxMemoryData1.FieldDefs.Clear;
                             RxMemoryData1.FieldDefs.Add('SELCHECK',ftString,1,True);
                             RxMemoryData1.FieldDefs.Add('ID_SMETA',ftString,16,True);
                             RxMemoryData1.FieldDefs.Add('SMETA_TITLE',ftString,180,True);
                             RxMemoryData1.FieldDefs.Add('SMETA_KOD',ftString,10,True);
                             RxMemoryData1.Open;
                             RxMemoryData1.LoadFromDataSet(SmetaDataSet,0,lmAppend);
                             RxMemoryData1.first;
                             while (not RxMemoryData1.eof)  do
                             begin
                              RxMemoryData1.Edit;
                              RxMemoryData1.FieldByName('SELCHECK').Value:='T';
                              RxMemoryData1.post;
                              RxMemoryData1.Next;
                             end;
                             RxMemoryData1.Edit;
                             RxMemoryData1['SELCHECK']:='T';
                             RxMemoryData1.post;
                             RxMemoryData1.first;
                             DataSource1.DataSet:=RxMemoryData1;
                       end;
          psmRazdSt  : begin
                             self.Caption:='Бюджети, які функціонують на '+ActualDate_str;
                             cxGrid2.Visible:=true;
                             cxGrid2.Width:=cxGrid1.Width;
                             Splitter2.Left:=cxGrid1.Width+1;
                             cxGrid1.Visible:=false;
                             Panel1.Visible:=true;
                             SmetaDataSet.SQLs.SelectSQL.Text:= '   SELECT S.ID_SMETA, S.SMETA_TITLE, S.SMETA_KOD, P.ID_PLAN   '+
                                                                '   FROM BU_SMET_PLUS_PERIODS P, PUB_SPR_SMETA S '+
                                                                '   WHERE  S.ID_SMETA=P.ID_SMETA '+
                                                                '        AND P.DATE_BEG<='+''''+ActualDate_str+''''+
                                                                '        AND P.DATE_END> '+''''+ActualDate_str+''''+
                                                                '   ORDER BY S.SMETA_KOD                           ';                                                            ;
                             SmetaDataSet.Open;
                             SmetaDataSet.FetchAll;
                             //Panel6.Visible:=true;

                             if (SmetaDataSet.RecordCount>0)
                             then begin
                                        if RazdDataSet.Active then RazdDataSet.Close;
                                        RazdDataSet.SQLs.SelectSQL.Text:=' SELECT R.ID_RAZD_ST, R.RAZD_ST_NUM, R.RAZD_ST_TITLE       '+
                                                                        ' FROM  PUB_SPR_RAZD_ST R, BU_SMET_STRUCTURE S  '+
                                                                        ' WHERE  S.ID_PLAN='+SmetaDataSet.FieldByName('ID_PLAN').AsString+
                                                                        '    AND S.ID_PLAN_OBJ=R.ID_RAZD_ST        '+
                                                                        '    AND R.IS_RAZDEL=1                     '+
                                                                        '    AND R.ENABLE=1                        '+
                                                                        '    ORDER BY  R.RAZD_ST_NUM     ';
                                        RazdDataSet.Open;
                                        RazdDataSet.FetchAll;

                                        if RazdDataSet.RecordCount>0
                                        then begin
                                                    if StDataSet.Active then StDataSet.Close;
                                                    StDataSet.SQLs.SelectSQL.Text:=' SELECT R.ID_RAZD_ST, R.RAZD_ST_NUM, R.RAZD_ST_TITLE       '+
                                                                                   ' FROM  PUB_SPR_RAZD_ST R'+
                                                                                   ' WHERE  R.LINKTO='+RazdDataSet.FieldByName('ID_RAZD_ST').AsString+
                                                                                   '    AND R.IS_RAZDEL=0 '+
                                                                                   '    AND ENABLE=1      '+
                                                                                   '    ORDER BY  R.RAZD_ST_NUM     ';
                                                    StDataSet.Open;
                                                    StDataSet.FetchAll;
                                        end;
                           end;
                       end;
      end;


   SmView.RestoreFromRegistry('Software\Budgeting\PublicSmeta',false,false, [],'SmView');

   if psmSmetMulty=mode then  smviewDBColumn3.Visible:=True
   else smviewDBColumn3.Visible:=False;
end;

procedure Tpub_spr_smet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      SmView.StoreToRegistry('Software\Budgeting\PublicSmeta',true,[],'SmView');
      Action:=caFree;
end;

procedure Tpub_spr_smet.cxGrid1Resize(Sender: TObject);
begin
      cxGrid1DBTableView1.Columns[0].Width:=cxGrid1.Width-10;
end;

procedure Tpub_spr_smet.ToolButton3Click(Sender: TObject);
begin
      case CurMode of
          psmGroup   : begin
                         GroupsDataSet.Close;
                         GroupsDataSet.SQLs.SelectSQL.Text:='   SELECT DISTINCT G.*                 '+
                                                            '   FROM PUB_SMETA_GROUP G, BU_SMET_PLUS_PERIODS P, PUB_SPR_SMETA S '+
                                                            '   WHERE    G.ID_GROUP=S.ID_GROUP  '+
                                                            '        AND S.ID_SMETA=P.ID_SMETA  '+
                                                            '        AND P.DATE_BEG<='+''''+ActualDate_str+''''+
                                                            '        AND P.DATE_END> '+''''+ActualDate_str+'''';
                         GroupsDataSet.Open;
                         GroupsDataSet.FetchAll;
                       end;
          psmSmet    : begin
                         SmetaDataSet.Close;
                         SmetaDataSet.SQLs.SelectSQL.Text:= '   SELECT S.ID_SMETA, S.SMETA_TITLE, S.SMETA_KOD, P.ID_PLAN   '+
                                                            '   FROM BU_SMET_PLUS_PERIODS P, PUB_SPR_SMETA S '+
                                                            '   WHERE  S.ID_SMETA=P.ID_SMETA '+
                                                            '        AND P.DATE_BEG<='+''''+ActualDate_str+''''+
                                                            '        AND P.DATE_END> '+''''+ActualDate_str+''''+
                                                            '   ORDER BY S.SMETA_KOD                           ';
                         SmetaDataSet.Open;
                         SmetaDataSet.FetchAll;
                       end;
          psmSmetMulty: begin
                         SmetaDataSet.Close;
                         SmetaDataSet.SQLs.SelectSQL.Text:= '   SELECT S.ID_SMETA, S.SMETA_TITLE, S.SMETA_KOD, P.ID_PLAN   '+
                                                            '   FROM BU_SMET_PLUS_PERIODS P, PUB_SPR_SMETA S '+
                                                            '   WHERE  S.ID_SMETA=P.ID_SMETA '+
                                                            '        AND P.DATE_BEG<='+''''+ActualDate_str+''''+
                                                            '        AND P.DATE_END> '+''''+ActualDate_str+''''+
                                                            '   ORDER BY S.SMETA_KOD                           ';
                         SmetaDataSet.Open;
                         SmetaDataSet.FetchAll;

                         RxMemoryData1:=TRxMemoryData.Create(Application);
                         RxMemoryData1.Close;
                         RxMemoryData1.FieldDefs.Clear;
                         RxMemoryData1.FieldDefs.Add('SELCHECK',ftString,1,True);
                         RxMemoryData1.FieldDefs.Add('ID_SMETA',ftString,16,True);
                         RxMemoryData1.FieldDefs.Add('SMETA_TITLE',ftString,180,True);
                         RxMemoryData1.FieldDefs.Add('SMETA_KOD',ftString,10,True);
                         RxMemoryData1.Open;
                         RxMemoryData1.LoadFromDataSet(SmetaDataSet,0,lmAppend);
                         RxMemoryData1.first;
                         while (not RxMemoryData1.eof)  do
                         begin
                          RxMemoryData1.Edit;
                          RxMemoryData1.FieldByName('SELCHECK').Value:='T';
                          RxMemoryData1.post;
                          RxMemoryData1.Next;
                         end;
                         RxMemoryData1.Edit;
                         RxMemoryData1['SELCHECK']:='T';
                         RxMemoryData1.post;
                         RxMemoryData1.first;




                       end;
          psmRazdSt  : begin
                         SmetaDataSet.Close;
                         SmetaDataSet.SQLs.SelectSQL.Text:= '   SELECT S.ID_SMETA, S.SMETA_TITLE, S.SMETA_KOD, P.ID_PLAN   '+
                                                            '   FROM BU_SMET_PLUS_PERIODS P, PUB_SPR_SMETA S '+
                                                            '   WHERE  S.ID_SMETA=P.ID_SMETA '+
                                                            '        AND P.DATE_BEG<='+''''+ActualDate_str+''''+
                                                            '        AND P.DATE_END> '+''''+ActualDate_str+''''+
                                                            '   ORDER BY S.SMETA_KOD                           ';
                         SmetaDataSet.Open;
                         SmetaDataSet.FetchAll;


                         if (SmetaDataSet.RecordCount>0)
                         then begin
                                    if RazdDataSet.Active then RazdDataSet.Close;
                                    RazdDataSet.SQLs.SelectSQL.Text:=' SELECT R.ID_RAZD_ST, R.RAZD_ST_NUM, R.RAZD_ST_TITLE       '+
                                                                    ' FROM  PUB_SPR_RAZD_ST R, BU_SMET_STRUCTURE S  '+
                                                                    ' WHERE  S.ID_PLAN='+SmetaDataSet.FieldByName('ID_PLAN').AsString+
                                                                    '    AND S.ID_PLAN_OBJ=R.ID_RAZD_ST        '+
                                                                    '    AND R.IS_RAZDEL=1 '+
                                                                    '    AND R.ENABLE=1    '+
                                                                    '    ORDER BY  R.RAZD_ST_NUM     ';
                                    RazdDataSet.Open;
                                    RazdDataSet.FetchAll;

                                    if RazdDataSet.RecordCount>0
                                    then begin
                                                if StDataSet.Active then StDataSet.Close;
                                                StDataSet.SQLs.SelectSQL.Text:=' SELECT R.ID_RAZD_ST, R.RAZD_ST_NUM, R.RAZD_ST_TITLE       '+
                                                                               ' FROM  PUB_SPR_RAZD_ST R'+
                                                                               ' WHERE  R.LINKTO='+RazdDataSet.FieldByName('ID_RAZD_ST').AsString+
                                                                               '    AND R.IS_RAZDEL=0 '+
                                                                               '    AND R.ENABLE=1    '+
                                                                               '    ORDER BY  R.RAZD_ST_NUM     ';
                                                StDataSet.Open;
                                                StDataSet.FetchAll;
                                    end;
                       end;
                       end;
      end;

end;

procedure Tpub_spr_smet.SmViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var id:int64;
begin
      case CurMode of
          psmGroup,psmSmet
                      : begin
                         //Ничего не делаем
                       end;
          psmRazdSt
                      : begin
                           //Отбираем разделы
                           RazdDataSet.Close;
                           if SmView.DataController.DataSource.DataSet.FieldByName('ID_PLAN').Value<>null
                           then begin
                                 if cxGrid2.IsFocused
                                 then begin
                                     if SmetaDataSet.RecordCount>0
                                     then begin
                                           id:=StrToInt64(SmView.DataController.DataSource.DataSet.FieldByName('ID_PLAN').AsString);
                                           RazdDataSet.SQLs.SelectSQL.Text:=' SELECT R.ID_RAZD_ST, R.RAZD_ST_NUM, R.RAZD_ST_TITLE       '+
                                                                            ' FROM  PUB_SPR_RAZD_ST R, BU_SMET_STRUCTURE S  '+
                                                                            ' WHERE  S.ID_PLAN='+IntToStr(id)+
                                                                            '    AND S.ID_PLAN_OBJ=R.ID_RAZD_ST        '+
                                                                            '    AND R.IS_RAZDEL=1 '+
                                                                            '    AND R.ENABLE=1    '+
                                                                            '    ORDER BY  R.RAZD_ST_NUM     ';
                                           RazdDataSet.Open;
                                           RazdDataSet.FetchAll;
                                     end;
                                 end;
                          end;
                       end;
      end;

end;

procedure Tpub_spr_smet.cxGrid3DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var id:int64;
begin
      case CurMode of
          psmGroup,psmSmet
                      : begin
                         //Ничего не делаем
                       end;
          psmRazdSt
                      : begin
                           //Отбираем разделы
                           if  cxGrid3DBTableView1.DataController.DataSource.DataSet.FieldByName('ID_RAZD_ST').Value<>NULL
                           then begin
                               StDataSet.Close;
                               if cxGrid3.IsFocused
                               then begin
                                    if (RazdDataSet.RecordCount>0)
                                    then begin
                                          id:=StrToInt64(cxGrid3DBTableView1.DataController.DataSource.DataSet.FieldByName('ID_RAZD_ST').AsString);
                                          StDataSet.SQLs.SelectSQL.Text:=' SELECT R.ID_RAZD_ST, R.RAZD_ST_NUM, R.RAZD_ST_TITLE       '+
                                                                           ' FROM  PUB_SPR_RAZD_ST R'+
                                                                           ' WHERE  R.LINKTO='+IntToStr(id)+
                                                                           '    AND R.IS_RAZDEL=0 '+
                                                                           '    AND R.ENABLE=1    '+
                                                                           '    ORDER BY  R.RAZD_ST_NUM     ';
                                          StDataSet.Open;
                                          StDataSet.FetchAll;
                                    end;
                               end;
                           end;
                       end;
      end;

end;

procedure Tpub_spr_smet.cxGrid3Enter(Sender: TObject);
begin
     cxGrid3DBTableView1FocusedRecordChanged(cxGrid3DBTableView1,
                                             cxGrid3DBTableView1.Controller.FocusedRecord,
                                             cxGrid3DBTableView1.Controller.FocusedRecord,
                                             true);
end;

procedure Tpub_spr_smet.ViewButtonClick(Sender: TObject);
begin
      case CurMode of
          psmGroup   : begin
                         ResultValue:=VarArrayCreate([0, 1], varVariant);
                         ResultValue[0]:=GroupsDataSet.FieldByName('ID_GROUP').Value;
                         ResultValue[1]:=GroupsDataSet.FieldByName('GROUP_TITLE').Value;
                         ModalResult:=mrYes;
                       end;
          psmSmet,
          psmSmetWithoutPeriod
                      : begin
                         ResultValue:=VarArrayCreate([0, 3], varVariant);

                         ResultValue[0]:=SmetaDataSet.FieldByName('ID_SMETA').Value;
                         ResultValue[1]:=NULL;
                         ResultValue[2]:=SmetaDataSet.FieldByName('SMETA_TITLE').Value;
                         ResultValue[3]:=SmetaDataSet.FieldByName('SMETA_KOD').Value;


                         ModalResult:=mrYes;
                       end;
          psmSmetMulty
                      :begin
                       //////
                         DataSource1.DataSet:=nil;
                         RxMemoryData1.first;
                         while not RxMemoryData1.eof do
                          if RxMemoryData1['SELCHECK']<>'T' then RxMemoryData1.delete
                          else RxMemoryData1.next;

                         if RxMemoryData1['SELCHECK']<>'T' then RxMemoryData1.delete;
                         
                         ResultDataSet:=RxMemoryData1;
                         ModalResult:=mrYes;
                       end;
          psmRazdSt  : begin
                        if CheckChValues
                        then begin
                         ResultValue:=VarArrayCreate([0, 10], varVariant);
                         ResultValue[0] :=SmetaDataSet.FieldByName('ID_SMETA').Value;
                         ResultValue[1] :=RazdDataSet.FieldByName('ID_RAZD_ST').Value;
                         ResultValue[2] :=StDataSet.FieldByName('ID_RAZD_ST').Value;
                         ResultValue[3] :=NULL;
                         ResultValue[4] :=RazdDataSet.FieldByName('RAZD_ST_TITLE').Value;
                         ResultValue[5] :=StDataSet.FieldByName('RAZD_ST_TITLE').Value;
                         ResultValue[6] :=SmetaDataSet.FieldByName('SMETA_TITLE').Value;
                         ResultValue[7] :=RazdDataSet.FieldByName('RAZD_ST_NUM').Value;
                         ResultValue[8] :=StDataSet.FieldByName('RAZD_ST_NUM').Value;
                         ResultValue[9] :=SmetaDataSet.FieldByName('SMETA_KOD').Value;
                         ResultValue[10]:=NULL;

                         ModalResult:=mrYes;
                        end;
                       end;
      end;

end;

function Tpub_spr_smet.CheckChValues: Boolean;
var Res:Boolean;
begin
  {
    Res:=true;
    if (cxDBTextEdit1.Text='') and Res
    then begin
         MessageBox(Application.Handle,PChar(BU_SmError),PChar(BU_ErrorCaption),MB_OK and MB_ICONERROR);
         Res:=false;
    end;

    if (RazdDataSet.Active)  and Res
    then begin
            if (cxDBTextEdit2.Text='') and Res
            then begin
                 MessageBox(self.Handle,PChar(BU_RzError),PChar(BU_ErrorCaption),MB_OK and MB_ICONERROR);
                 Res:=false;
            end;
    end
    else begin
                 MessageBox(self.Handle,PChar(BU_RzError),PChar(BU_ErrorCaption),MB_OK and MB_ICONERROR);
                 Res:=false;
    end;

    if (StDataSet.Active) and Res
    then begin
            if (cxDBTextEdit3.Text='') and Res
            then begin
                 MessageBox(self.Handle,PChar(BU_StCHooseError),PChar(BU_ErrorCaption),MB_OK and MB_ICONERROR);
                 Res:=false;
            end;
    end
    else begin
                 MessageBox(self.Handle,PChar(BU_StCHooseError),PChar(BU_ErrorCaption),MB_OK and MB_ICONERROR);
                 Res:=false;
    end;

    CheckChValues:=Res;
    }
end;



procedure Tpub_spr_smet.ToolButton4Click(Sender: TObject);
begin
  close;
end;

procedure Tpub_spr_smet.SmViewDblClick(Sender: TObject);
begin
//    ViewButton.OnClick(self);
end;

procedure Tpub_spr_smet.SmViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key=VK_RETURN)
  THEN BEGIN
       ViewButton.OnClick(self);
  END
end;

procedure Tpub_spr_smet.cxGrid3DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key=VK_RETURN)
  THEN BEGIN
       ViewButton.OnClick(self);
  END

end;

procedure Tpub_spr_smet.cxGrid4DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key=VK_RETURN)
  THEN BEGIN
       ViewButton.OnClick(self);
  END

end;

procedure Tpub_spr_smet.cxGrid3DBTableView1DblClick(Sender: TObject);
begin
       ViewButton.OnClick(self);
end;

procedure Tpub_spr_smet.cxGrid4DBTableView1DblClick(Sender: TObject);
begin
       ViewButton.OnClick(self);
end;

constructor Tpub_spr_smet.Create(AOwner: TComponent;
  DBHANDLE: TISC_DB_HANDLE; ActualDate: TDateTime; Mode: TPublicSmetaMode;
  Id_sm, id_rz, id_st: Integer);
begin
      inherited Create(AOwner);
      self.p_need:=true;
      self.p_id_rz:=id_rz;
      self.p_id_st:=id_st;
      self.p_id_sm:=id_sm;

      Self.WorkDatabase.Handle:=DBHAndle;
      self.ActualDate:=ActualDate;
      DateTimeToString(ActualDate_str,'dd.mm.yyyy',self.ActualDate);
      CurMode:=Mode;
      case Mode of
          psmGroup   : begin
                         Panel1.Visible:=false;
                         cxGrid1.Visible:=true;
                         cxGrid2.Visible:=false;
                         cxGrid1.Align:=alClient;
                         GroupsDataSet.SQLs.SelectSQL.Text:='   SELECT DISTINCT G.*                 '+
                                                            '   FROM PUB_SMETA_GROUP G, BU_SMET_PLUS_PERIODS P, PUB_SPR_SMETA S '+
                                                            '   WHERE    G.ID_GROUP=S.ID_GROUP  '+
                                                            '        AND S.ID_SMETA=P.ID_SMETA  '+
                                                            '        AND P.DATE_BEG<='+''''+ActualDate_str+''''+
                                                            '        AND P.DATE_END> '+''''+ActualDate_str+'''';
                         GroupsDataSet.Open;
                         GroupsDataSet.FetchAll;

                       end;
          psmSmet    : begin

                         Panel1.Visible:=false;
                         cxGrid1.Visible:=false;
                         cxGrid2.Visible:=true;
                         cxGrid2.Align:=alClient;
                         SmetaDataSet.SQLs.SelectSQL.Text:= '   SELECT S.ID_SMETA, S.SMETA_TITLE, S.SMETA_KOD, P.ID_PLAN   '+
                                                            '   FROM BU_SMET_PLUS_PERIODS P, PUB_SPR_SMETA S '+
                                                            '   WHERE  S.ID_SMETA=P.ID_SMETA '+
                                                            '        AND P.DATE_BEG<='+''''+ActualDate_str+''''+
                                                            '        AND P.DATE_END> '+''''+ActualDate_str+''''+
                                                            '   ORDER BY S.SMETA_KOD                           ';
                         SmetaDataSet.Open;
                         SmetaDataSet.FetchAll;

                         if self.p_need
                         then begin
                                   //cxGrid2DBTableView1.DataController.LocateByKey(self.p_id_sm);
                                   SmetaDataSet.Locate('ID_SMETA',p_id_sm,[]);
                         end;

                       end;
          psmRazdSt  : begin

                         cxGrid1.Visible:=false;
                         cxGrid2.Visible:=true;
                         cxGrid2.Width:=cxGrid1.Width;
                         Splitter2.Left:=cxGrid1.Width+1;
                         Panel1.Visible:=true;
                         SmetaDataSet.SQLs.SelectSQL.Text:= '   SELECT S.ID_SMETA, S.SMETA_TITLE, S.SMETA_KOD, P.ID_PLAN   '+
                                                            '   FROM BU_SMET_PLUS_PERIODS P, PUB_SPR_SMETA S '+
                                                            '   WHERE  S.ID_SMETA=P.ID_SMETA '+
                                                            '        AND P.DATE_BEG<='+''''+ActualDate_str+''''+
                                                            '        AND P.DATE_END> '+''''+ActualDate_str+''''+
                                                            '   ORDER BY S.SMETA_KOD                           ';                                                            ;
                         SmetaDataSet.Open;
                         SmetaDataSet.FetchAll;
                         //Panel6.Visible:=true;

                         if (SmetaDataSet.RecordCount>0)
                         then begin
                                     if self.p_need
                                     then begin
                                              if SmetaDataSet.Locate('ID_SMETA',p_id_sm,[])
                                              then begin
                                                        RazdDataSet.SQLs.SelectSQL.Text:=' SELECT R.ID_RAZD_ST, R.RAZD_ST_NUM, R.RAZD_ST_TITLE       '+
                                                                                        ' FROM  PUB_SPR_RAZD_ST R, BU_SMET_STRUCTURE S  '+
                                                                                        ' WHERE  S.ID_PLAN='+SmetaDataSet.FieldByName('ID_PLAN').AsString+
                                                                                        '    AND S.ID_PLAN_OBJ=R.ID_RAZD_ST        '+
                                                                                        '    AND R.IS_RAZDEL=1 '+
                                                                                        '    AND R.ENABLE=1    '+
                                                                                        '    ORDER BY  R.RAZD_ST_NUM     ';
                                                        RazdDataSet.Open;
                                                        RazdDataSet.FetchAll;
                                                        if RazdDataSet.Locate('ID_RAZD_ST',p_id_rz,[])
                                                        then begin
                                                                  StDataSet.SQLs.SelectSQL.Text:=' SELECT R.ID_RAZD_ST, R.RAZD_ST_NUM, R.RAZD_ST_TITLE       '+
                                                                                                 ' FROM  PUB_SPR_RAZD_ST R'+
                                                                                                 ' WHERE  R.LINKTO='+IntToStr(p_id_rz)+
                                                                                                 '    AND R.IS_RAZDEL=0 '+
                                                                                                 '    AND R.ENABLE=1    '+
                                                                                                 '    ORDER BY  R.RAZD_ST_NUM ';
                                                                  StDataSet.Open;
                                                                  StDataSet.FetchAll;
                                                                  StDataSet.Locate('ID_RAZD_ST',p_id_st,[]);
                                                        end;
                                              end;
                                     end;

                         end;
                       end;
      end;
      self.Caption:='Бюджети, які функціонують на '+ActualDate_str;    self.p_id_sm:=id_sm;
end;

procedure Tpub_spr_smet.ToolButton1Click(Sender: TObject);
var id_sm,MODE,SM_CODE,SM_TITLE:String;
begin
    if T=nil then T:=TfrmGetPosForm.Create(self);
    if T.ShowModal=mrYes
    then begin
               if SearchDataSet.Active then SearchDataSet.Close;

               if T.CheckCode.Checked
               then begin
                         MODE:='1';
                         SM_CODE:=T.EdCode.Text;
                         SM_TITLE:='';
               end
               else begin
                         MODE:='0';
                         SM_CODE:='0';
                         SM_TITLE:=T.EdTitle.Text;
               end;

               SearchDataSet.SelectSQL.Text:='SELECT * FROM BU_SEARCH('+SM_CODE+','+''''+SM_TITLE+''''+','+''''+datetostr(self.ActualDate)+''''+','+MODE+')'+' order by ID_SMETA asc';
               SearchDataSet.Open;
               SearchDataSet.FetchAll;
               SearchDataSet.First;
               //SmetaDataSet.Locate('ID_SMETA',SearchDataSet['ID_SMETA'],[]);
               ID_SM:=SearchDataSet.FieldByName('ID_SMETA').AsString;
               SmView.BeginUpdate;
                      SmView.DataController.LocateByKey(ID_SM);
               SmView.EndUpdate;
    end;
end;

procedure Tpub_spr_smet.Action3Execute(Sender: TObject);
var ID_SM:String;
begin
    smview.Controller.GoToNext(True);
     {if SearchDataSet.Active
     then begin
               if (SearchDataSet.RecordCount>0)
               then begin
                         if SearchDataSet.Eof
                         then SearchDataSet.First
                         else SearchDataSet.Next;  


                         ID_SM:=SearchDataSet.FieldByName('ID_SMETA').AsString;
                         SmView.BeginUpdate;
                                SmView.DataController.LocateByKey(ID_SM);
                         SmView.EndUpdate;
               end;
     end; }
end;



procedure Tpub_spr_smet.SmetaDataSetCalcFields(DataSet: TDataSet);
var Field: TStringField;
begin


end;

procedure Tpub_spr_smet.ToolButton6Click(Sender: TObject);
var id:Integer;
begin
 DataSource1.DataSet:=nil;
 id:=StrToInt(RxMemoryData1['ID_SMETA']);
 RxMemoryData1.First;
 while not RxMemoryData1.Eof do
 begin
 if RxMemoryData1['SELCHECK']='F' then
  begin
    RxMemoryData1.Edit;
    RxMemoryData1['SELCHECK']:='T';
    RxMemoryData1.Post;
  end
 else if RxMemoryData1['SELCHECK']='T' then
  begin
    RxMemoryData1.Edit;
    RxMemoryData1['SELCHECK']:='F';
    RxMemoryData1.Post;
  end;
  RxMemoryData1.Next;
 end;
 if RxMemoryData1['SELCHECK']='F' then
  begin
    RxMemoryData1.Edit;
    RxMemoryData1['SELCHECK']:='T';
    RxMemoryData1.Post;
  end
 else if RxMemoryData1['SELCHECK']='T' then
  begin
    RxMemoryData1.Edit;
    RxMemoryData1['SELCHECK']:='F';
    RxMemoryData1.Post;
  end;
 RxMemoryData1.Locate('ID_SMETA',id,[]);
 DataSource1.DataSet:=RxMemoryData1;
end;

procedure Tpub_spr_smet.ToolButton2Click(Sender: TObject);
var id:Integer;
begin
  DataSource1.DataSet:=nil;
  id:=StrToInt(RxMemoryData1['ID_SMETA']);
  RxMemoryData1.First;
  while not RxMemoryData1.Eof do
  begin
    RxMemoryData1.Edit;
    RxMemoryData1['SelCheck']:='T';
    RxMemoryData1.Post;
    RxMemoryData1.Next;
  end;
  RxMemoryData1.Edit;
  RxMemoryData1['SelCheck']:='T';
  RxMemoryData1.Post;
  RxMemoryData1.Locate('ID_SMETA',id,[]);
  DataSource1.DataSet:=RxMemoryData1;
end;

procedure Tpub_spr_smet.ToolButton5Click(Sender: TObject);
var id:Integer;
begin
  DataSource1.DataSet:=nil;
  id:=StrToInt(RxMemoryData1['ID_SMETA']);
  RxMemoryData1.First;
  while not RxMemoryData1.Eof do
  begin
    RxMemoryData1.Edit;
    RxMemoryData1['SelCheck']:='F';
    RxMemoryData1.Post;
    RxMemoryData1.Next;
  end;
  RxMemoryData1.Edit;
  RxMemoryData1['SelCheck']:='F';
  RxMemoryData1.Post;
  RxMemoryData1.Locate('ID_SMETA',id,[]);
  DataSource1.DataSet:=RxMemoryData1;
end;

end.
