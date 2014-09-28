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
  ActnList, Placemnt, dxStatusBar, findsmeta;



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
    SmView: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    SmetaDataSet: TpFIBDataSet;
    GroupsDataSet: TpFIBDataSet;
    SmetaDataSource: TDataSource;
    GroupsDataSource: TDataSource;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    SmViewDBColumn1: TcxGridDBColumn;
    SmViewDBColumn2: TcxGridDBColumn;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
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
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    ActionList1: TActionList;
    Action1: TAction;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    FormStorage1: TFormStorage;
    ToolButton1: TToolButton;
    SearchDataSet: TpFIBDataSet;
    Action2: TAction;
    Action3: TAction;
    dxStatusBar1: TdxStatusBar;
    Action4: TAction;
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
    procedure Action4Execute(Sender: TObject);
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
    function CheckChValues:Boolean;
    constructor Create(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;ActualDate:TDateTime;Mode:TPublicSmetaMode); overload;
    constructor Create(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;ActualDate:TDateTime;Mode:TPublicSmetaMode;Id_sm,id_rz,id_st:Integer); overload;
  end;

  function GetSmets(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;ActualDate:TDateTime;Mode:TPublicSmetaMode):Variant;stdcall;
  function GetSmetsEx(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;ActualDate:TDateTime;Mode:TPublicSmetaMode;Id_sm,id_rz,id_st:Integer):Variant;stdcall;
  function GetPackVersion:Integer;stdcall;

  exports  GetSmets, GetSmetsEx, GetPackVersion;

implementation


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


constructor Tpub_spr_smet.Create(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; ActualDate: TDateTime; Mode: TPublicSmetaMode);
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
                             Panel6.Visible:=true;

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
end;



procedure Tpub_spr_smet.ToolButton4Click(Sender: TObject);
begin
  close;
end;

procedure Tpub_spr_smet.SmViewDblClick(Sender: TObject);
begin
    ViewButton.OnClick(self);
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
                         Panel6.Visible:=true;

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
               ID_SM:=SearchDataSet.FieldByName('ID_SMETA').AsString;
               SmView.BeginUpdate;
                      SmView.DataController.LocateByKey(ID_SM);
               SmView.EndUpdate;
    end;
end;

procedure Tpub_spr_smet.Action3Execute(Sender: TObject);
var ID_SM:String;
begin
     if SearchDataSet.Active
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
     end;
end;

procedure Tpub_spr_smet.Action4Execute(Sender: TObject);
begin
  close;
end;

end.
