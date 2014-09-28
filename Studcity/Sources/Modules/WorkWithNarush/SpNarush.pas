unit SpNarush;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ComCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, cxClasses, cxSplitter, ToolWin,
  StudcityConst,IBase, ExtCtrls, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, ImgList, FIBQuery, pFIBQuery, pFIBStoredProc, cxContainer,
  cxTextEdit, cxMemo, dxBar, dxBarExtItems, ActnList,St_ser_function;

type
  TfrmSpNarush = class(TForm)
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
    cxStyleSilver: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GroupBox1: TGroupBox;
    cxGridVzysk: TcxGrid;
    cxGridVzyskDBTableView1: TcxGridDBTableView;
    cxGridVzyskLevel1: TcxGridLevel;
    StatusBar1: TStatusBar;
    GroupBox2: TGroupBox;
    cxGridNarush: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    Splitter1: TSplitter;
    Database: TpFIBDatabase;
    pFIBDataSetVzysk: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSourceVzysk: TDataSource;
    NAME_VZYSK: TcxGridDBColumn;
    pFIBDataSetNarush: TpFIBDataSet;
    DataSourceNarush: TDataSource;
    SHORT_NAME: TcxGridDBColumn;
    ImageList: TImageList;
    pFIBStoredProc: TpFIBStoredProc;
    MemoShortNameNarush: TcxMemo;
    dxBarManager1: TdxBarManager;
    ToolButtonADD: TdxBarLargeButton;
    ToolButtonEdit: TdxBarLargeButton;
    ToolButtonDel: TdxBarLargeButton;
    ToolButtonRefresh: TdxBarLargeButton;
    ToolButtonGet: TdxBarLargeButton;
    ToolButtonExit: TdxBarLargeButton;
    DisabledLargeImages: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pFIBDataSetNarushAfterScroll(DataSet: TDataSet);
    procedure ToolButtonExitClick(Sender: TObject);
    procedure ToolButtonRefreshClick(Sender: TObject);
    procedure cxGridVzyskClick(Sender: TObject);
    procedure ToolButtonGetClick(Sender: TObject);
    procedure ToolButtonEditClick(Sender: TObject);
    procedure ToolButtonDelClick(Sender: TObject);
    procedure cxGridNarushEnter(Sender: TObject);
    procedure cxGridVzyskEnter(Sender: TObject);
    procedure ToolButtonADDClick(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
    procedure dxBarLargeButton7Click(Sender: TObject);
  private
    { Private declarations }
    Constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE;frmST:TFormStyle);overload;
    function GetValue():variant;
  public
    { Public declarations }
  end;
function LoadSpNarush(AOwner : TComponent;DB:TISC_DB_HANDLE;frmST:TFormStyle):Variant;stdcall;
exports LoadSpNarush;

var
  frmSpNarush: TfrmSpNarush;
  last_grid:Integer;
  get_result:Variant;
  lang:Integer;
implementation
uses
  VzyskADD,
  NarushADD;
{$R *.dfm}
function LoadSpNarush(AOwner : TComponent;DB:TISC_DB_HANDLE;frmST:TFormStyle):Variant;
var
  Sp:TfrmSpNarush;
begin
  Sp:=TfrmSpNarush.Create(AOwner,DB,frmST);
  if frmST=fsNormal then
    begin
      //Sp.ShowModal;
      LoadSpNarush:=Sp.GetValue();
      Sp.free;
    end;
end;

Constructor TfrmSpNarush.Create(AOwner : TComponent;DB:TISC_DB_HANDLE;frmST:TFormStyle);
begin
  Inherited Create(AOwner);
  Lang:=ST_serLanguageIndex(DB);
  Database.Handle:=DB;
  if frmST=fsMDIChild then
    begin
      FormStyle:=fsMDIChild;
      ToolButtonGet.Enabled:=false;
    end;
end;

procedure TfrmSpNarush.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmSpNarush.FormCreate(Sender: TObject);
begin
  ToolButtonRefresh.Caption:=StudcityConst.Studcity_ACTION_REFRESH_CONST_EX[Lang];
  ToolButtonADD.Caption:=StudcityConst.Studcity_ACTION_ADD_CONST_EX[Lang];
  ToolButtonEdit.Caption:=StudcityConst.Studcity_ACTION_EDIT_CONST_EX[Lang];
  ToolButtonDel.Caption:=StudcityConst.Studcity_ACTION_DELETE_CONST_EX[Lang];
  ToolButtonGet.Caption:=StudcityConst.Studcity_ACTION_CHOOSE_CONST_EX[Lang];
  ToolButtonExit.Caption:=StudcityConst.Studcity_ACTION_CLOSE_CONST_EX[Lang];
  Caption:=StudcityConst.Studcity_SpNarush_EX[Lang];
  NAME_VZYSK.Caption:=StudcityConst.Studcity_SpNarushVzysk_EX[Lang];
  SHORT_NAME.Caption:=StudcityConst.Studcity_SpNarushName_EX[Lang];


  pFIBDataSetVzysk.Active:=false;
  pFIBDataSetVzysk.Active:=true;

  last_grid:=1;
end;

procedure TfrmSpNarush.pFIBDataSetNarushAfterScroll(DataSet: TDataSet);
begin
MemoShortNameNarush.Clear;
MemoShortNameNarush.Lines.Add(pFIBDataSetNarush.FieldByName('NARUSH').AsString);

end;

procedure TfrmSpNarush.ToolButtonExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSpNarush.ToolButtonRefreshClick(Sender: TObject);
var
  id_r:Int64;
begin
if last_grid=1 then
  begin
    id_r:=pFIBDataSetVzysk.FieldByName('id_vzysk').asVariant;
    pFIBDataSetVzysk.Active:=false;
    pFIBDataSetVzysk.Active:=true;
    pFIBDataSetVzysk.Locate('id_vzysk',id_r,[]);
  end;
if last_grid=2 then
  begin
    id_r:=pFIBDataSetNarush.FieldByName('id_narush').asVariant;
    pFIBDataSetNarush.Active:=false;
    pFIBDataSetNarush.Active:=true;
    pFIBDataSetNarush.Locate('id_narush',id_r,[]);
  end;
end;

procedure TfrmSpNarush.cxGridVzyskClick(Sender: TObject);
begin
  last_grid:=1;
end;

procedure TfrmSpNarush.ToolButtonGetClick(Sender: TObject);
begin
  get_result:=VarArrayCreate([0,1],varVariant);
  get_result[0]:=VarArrayOf([pFIBDataSetNarush.FieldByName('id_narush').AsVariant,pFIBDataSetNarush.FieldByName('short_name').AsString]);
  Close;
end;

function TfrmSpNarush.GetValue():variant;
begin
  ShowModal;
  GetValue:=get_result;
end;

procedure TfrmSpNarush.ToolButtonEditClick(Sender: TObject);
var
  ModiSP:TfrmVzyskADD;
  ModiNar:TfrmNaruskADD;
begin
if last_grid=1 then
  begin
    if pFIBDataSetVzysk.FieldByName('id_vzysk').AsInteger>1 then
      begin
        ModiSP:=TfrmVzyskADD.Create(Self,pFIBDataSetVzysk.FieldByName('id_vzysk').AsInteger,lang);
        ModiSP.ShowModal;
        ModiSP.Free;
        ToolButtonRefreshClick(self);
      end;
  end;
if last_grid=2 then
  begin
    if pFIBDataSetNarush.FieldByName('id_narush').AsInteger>1 then
      begin
        ModiNar:=TfrmNaruskADD.Create(Self,pFIBDataSetNarush.FieldByName('id_narush').AsInteger,pFIBDataSetVzysk.FieldByName('id_vzysk').AsInteger,lang);
        ModiNar.ShowModal;
        ModiNar.Free;
        ToolButtonRefreshClick(self);
      end;  
  end;
end;

procedure TfrmSpNarush.ToolButtonDelClick(Sender: TObject);
begin
if messageBox(Handle,PChar(StudcityConst.Studcity_MESSAGE_DELETE),
     PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_YESNO or MB_ICONQUESTION)=mrYes then
  begin
      pFIBStoredProc.Database:=Database;
      pFIBStoredProc.Transaction:=WriteTransaction;
      WriteTransaction.StartTransaction;
      if last_grid=1 then
        begin
          pFIBStoredProc.StoredProcName:='ST_SP_VZYSK_DELETE';
          pFIBStoredProc.Prepare;
          pFIBStoredProc.ParamByName('id_vzysk').AsInt64:=pFIBDataSetVzysk.FieldByName('id_vzysk').AsVariant;
          try
            pFIBStoredProc.ExecProc;
            Except
              begin
                exit;
              end;
           end;
           if pFIBStoredProc.FieldByName('error').AsInteger=1 then
             begin
               MessageBox(Handle,PChar(StudcityConst.Studcity_MESSAGE_EXISTS_NARUSH),PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_OK or MB_ICONWARNING);
             end;
           WriteTransaction.Commit;
           ToolButtonRefreshClick(self);
        end;
      if last_grid=2 then
        begin
          pFIBStoredProc.StoredProcName:='ST_SP_NARUSH_DELETE';
          pFIBStoredProc.Prepare;
          pFIBStoredProc.ParamByName('id_narush').AsInt64:=pFIBDataSetNarush.FieldByName('id_narush').AsVariant;
          try
            pFIBStoredProc.ExecProc;
            Except
              begin
                exit;
              end;
           end;
           if pFIBStoredProc.FieldByName('error').AsInteger=1 then
             begin
               MessageBox(Handle,PChar(StudcityConst.Studcity_MESSAGE_EXISTS_NARUSH_USER),PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_OK or MB_ICONWARNING);
             end;
           WriteTransaction.Commit;
           ToolButtonRefreshClick(self);
        end;
  end;
end;

procedure TfrmSpNarush.cxGridNarushEnter(Sender: TObject);
begin
  last_grid:=2;
end;

procedure TfrmSpNarush.cxGridVzyskEnter(Sender: TObject);
begin
  last_grid:=1;
end;

procedure TfrmSpNarush.ToolButtonADDClick(Sender: TObject);
var
  ModiSP:TfrmVzyskADD;
  ModiNar:TfrmNaruskADD;
begin
if last_grid=1 then
  begin
    ModiSP:=TfrmVzyskADD.Create(Self,-1,lang);
    ModiSP.ShowModal;
    ModiSP.Free;
    ToolButtonRefreshClick(self);
  end;
if last_grid=2 then
  begin
    ModiNar:=TfrmNaruskADD.Create(Self,-1,pFIBDataSetVzysk.FieldByName('id_vzysk').AsInteger,lang);
    ModiNar.ShowModal;
    ModiNar.Free;
    ToolButtonRefreshClick(self);
  end;
end;

procedure TfrmSpNarush.dxBarLargeButton3Click(Sender: TObject);
var
  ModiSP:TfrmVzyskADD;
  ModiNar:TfrmNaruskADD;
begin
if last_grid=1 then
  begin
    if pFIBDataSetVzysk.FieldByName('id_vzysk').AsInteger>0 then
      begin
        ModiSP:=TfrmVzyskADD.Create(Self,pFIBDataSetVzysk.FieldByName('id_vzysk').AsInteger,lang);
        ModiSP.ShowModal;
        ModiSP.Free;
        ToolButtonRefreshClick(self);
      end;
  end;
if last_grid=2 then
  begin
    if pFIBDataSetNarush.FieldByName('id_narush').AsInteger>0 then
      begin
        ModiNar:=TfrmNaruskADD.Create(Self,pFIBDataSetNarush.FieldByName('id_narush').AsInteger,pFIBDataSetVzysk.FieldByName('id_vzysk').AsInteger,lang);
        ModiNar.ShowModal;
        ModiNar.Free;
        ToolButtonRefreshClick(self);
      end;  
  end;
end;

procedure TfrmSpNarush.dxBarLargeButton4Click(Sender: TObject);
begin
if messageBox(Handle,PChar(StudcityConst.Studcity_MESSAGE_DELETE),
     PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_YESNO or MB_ICONQUESTION)=mrYes then
  begin
      pFIBStoredProc.Database:=Database;
      pFIBStoredProc.Transaction:=WriteTransaction;
      WriteTransaction.StartTransaction;
      if last_grid=1 then
        begin
          pFIBStoredProc.StoredProcName:='ST_SP_VZYSK_DELETE';
          pFIBStoredProc.Prepare;
          pFIBStoredProc.ParamByName('id_vzysk').AsInt64:=pFIBDataSetVzysk.FieldByName('id_vzysk').AsVariant;
          try
            pFIBStoredProc.ExecProc;
            Except
              begin
                exit;
              end;
           end;
           if pFIBStoredProc.FieldByName('error').AsInteger=1 then
             begin
               MessageBox(Handle,PChar(StudcityConst.Studcity_MESSAGE_EXISTS_NARUSH),PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_OK or MB_ICONWARNING);
             end;
           WriteTransaction.Commit;
           ToolButtonRefreshClick(self);
        end;
      if last_grid=2 then
        begin
          pFIBStoredProc.StoredProcName:='ST_SP_NARUSH_DELETE';
          pFIBStoredProc.Prepare;
          pFIBStoredProc.ParamByName('id_narush').AsInt64:=pFIBDataSetNarush.FieldByName('id_narush').AsVariant;
          try
            pFIBStoredProc.ExecProc;
            Except
              begin
                exit;
              end;
           end;
           if pFIBStoredProc.FieldByName('error').AsInteger=1 then
             begin
               MessageBox(Handle,PChar(StudcityConst.Studcity_MESSAGE_EXISTS_NARUSH_USER),PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_OK or MB_ICONWARNING);
             end;
           WriteTransaction.Commit;
           ToolButtonRefreshClick(self);
        end;
  end;
end;

procedure TfrmSpNarush.dxBarLargeButton5Click(Sender: TObject);
var
  id_r:Int64;
begin
if last_grid=1 then
  begin
    id_r:=pFIBDataSetVzysk.FieldByName('id_vzysk').asVariant;
    pFIBDataSetVzysk.Active:=false;
    pFIBDataSetVzysk.Active:=true;
    pFIBDataSetVzysk.Locate('id_vzysk',id_r,[]);
  end;
if last_grid=2 then
  begin
    id_r:=pFIBDataSetNarush.FieldByName('id_narush').asVariant;
    pFIBDataSetNarush.Active:=false;
    pFIBDataSetNarush.Active:=true;
    pFIBDataSetNarush.Locate('id_narush',id_r,[]);
  end;
end;

procedure TfrmSpNarush.dxBarLargeButton6Click(Sender: TObject);
begin
  get_result:=VarArrayCreate([0,1],varVariant);
  get_result[0]:=VarArrayOf([pFIBDataSetNarush.FieldByName('id_narush').AsVariant,pFIBDataSetNarush.FieldByName('short_name').AsString]);
  Close;
end;

procedure TfrmSpNarush.dxBarLargeButton7Click(Sender: TObject);
begin
  Close;
end;

end.

