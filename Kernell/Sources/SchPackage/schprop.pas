unit schProp;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls,pFibQuery, Forms, Resources_unitb,
  Dialogs,  ComCtrls, DB, FIBDataSet, pFIBDataSet, Buttons, ToolWin,
  Menus, ImgList, ExtCtrls, pFIBStoredProc, Grids, DBGrids, ActnList,
  FIBDatabase, pFIBDatabase, StdCtrls,Ibase,
  DBCtrls, cxControls, cxContainer, cxCheckListBox, cxDBCheckListBox, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCheckComboBox,cxCheckBox,
  cxDBCheckComboBox, frxClass, frxDBSet, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxInplaceContainer, cxDBTL, cxTLData, cxDBEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxStatusBar;

type

TSchInfo=record
  ID_MAIN_SCH         : integer;
  SCH_TITLE           : string;
  SCH_NUMBER          : string;
  SCH_TYPE            : integer;
  DATE_BEG            : TDateTime;
  DATE_END            : TDateTime;
  TYPE_OBJECT         : integer;
  SCH_TYPE_TITLE      : string;
  TYPE_OBJ_TITLE      : string;
  LINKTO              : integer;
  ID_SYSTEM           : integer;
end;

  TfrmSchProp = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar2: TToolBar;
    ToolButton13: TToolButton;
    RefreshToolButton: TToolButton;
    SchImageList: TImageList;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ActionList1: TActionList;
    InsertAction: TAction;
    DeleteAction: TAction;
    UpdateAction: TAction;
    GetAction: TAction;
    RefreshAction: TAction;
    CloseAction: TAction;
    ViewAction: TAction;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    ToolBar4: TToolBar;
    Label1: TLabel;
    cbMonth: TComboBox;
    cbYear: TComboBox;
    SmallImages: TImageList;
    WorkDatabase: TpFIBDatabase;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SysExtDataSet: TpFIBDataSet;
    SysExDataSource: TDataSource;
    FindAction: TAction;
    Action1: TAction;
    MasterSchDataSet: TpFIBDataSet;
    MasterDataSource: TDataSource;
    SchTreeView: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    SchTreeSaldoDataSet: TpFIBDataSet;
    SchTreeDataSource: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxStyle2: TcxStyle;
    cxStyle5: TcxStyle;
    ToolBar1: TToolBar;
    Label5: TLabel;
    cxLookupComboBox1: TcxLookupComboBox;
    SchPropDataSet: TpFIBDataSet;
    SchPropDataSource: TDataSource;
    SchTreeViewcxDBTreeListColumn2: TcxDBTreeListColumn;
    cxStyle3: TcxStyle;
    cxCheckBox1: TcxCheckBox;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    SchTreeViewcxDBTreeListColumn3: TcxDBTreeListColumn;
    dxStatusBar1: TdxStatusBar;
    Esc: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DelToolButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure RefreshToolButtonClick(Sender: TObject);
    procedure CloseToolButtonClick(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure PropButtonClick(Sender: TObject);
    procedure OperButtonClick(Sender: TObject);
    procedure ChooseButtonClick(Sender: TObject);
    procedure cbMonthChange(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure FindActionExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure SchTreeViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SchTreeViewStylesGetContentStyle(Sender, AItem: TObject;
      ANode: TcxTreeListNode; var AStyle: TcxStyle);
    procedure ToolButton2Click(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxLookupComboBox1PropertiesChange(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure SchTreeViewExpanding(Sender: TObject; ANode: TcxTreeListNode;
      var Allow: Boolean);
    procedure ToolButton4Click(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
    procedure InsertActionExecute(Sender: TObject);
    procedure EscExecute(Sender: TObject);
  private
    ExtractAllFlag:Boolean;
    LocateId:Integer;
    { Private declarations }
  public
    MBOOK_DATE:TDateTime;
    id_sch_in:integer;
    in_sch_in_credit:integer;
    INFINITY_DATE:TdateTime;
    Work_Id_Object:Integer;
    ActualDate:TDateTime;
    SchLevelCount:Integer;
    FlagMultiSelect:Boolean;
    ResultValue:Variant;
    Root:Integer;
    CurFS:TFormStyle;
    function LocateSch(Id_sch:Integer):Boolean;
    function GotoNodeById(View:TcxDBTreeList;Id_obj:Integer):TcxTreeListNode;
    constructor Create(AOwner: TComponent;DBhandle: TISC_DB_HANDLE;  Actual_Date: TDateTime; Root: Integer);
    function GetMainSQL:String;
  end;


implementation

uses  DateUtils, FindSch, FIBQuery, GlobalSpr, BaseTypes;
{$R *.dfm}


procedure TfrmSchProp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TfrmSchProp.FormCreate(Sender: TObject);
var date_str:string;
    TempdataSet:TpFibDataSet;
    i:integer;
begin
       SchPropDataSet.Open;
       SchPropDataSet.FetchAll;

       dateTimetostring(date_str,'dd.mm.yyyy', ActualDate);

       MasterSchDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_MAIN_SCH_SELECT_LEVEL('+''''+date_str+''''+',1)';
       MasterSchDataSet.Open;
       cbMonth.Items.Add(TRIM(BU_Month_01));
       cbMonth.Items.Add(TRIM(BU_Month_02));
       cbMonth.Items.Add(TRIM(BU_Month_03));
       cbMonth.Items.Add(TRIM(BU_Month_04));
       cbMonth.Items.Add(TRIM(BU_Month_05));
       cbMonth.Items.Add(TRIM(BU_Month_06));
       cbMonth.Items.Add(TRIM(BU_Month_07));
       cbMonth.Items.Add(TRIM(BU_Month_08));
       cbMonth.Items.Add(TRIM(BU_Month_09));
       cbMonth.Items.Add(TRIM(BU_Month_10));
       cbMonth.Items.Add(TRIM(BU_Month_11));
       cbMonth.Items.Add(TRIM(BU_Month_12));

       for i:=0 to YEARS_COUNT do
       begin
          cbYear.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
       end;
       cbMonth.ItemIndex:=MonthOf(ActualDate)-1;
       for i:=0 to cbYear.Items.Count-1 do
       begin
           if pos(cbYear.Items[i],IntToStr(YearOf(ActualDate)))>0
           then begin
              cbYear.ItemIndex:=i;
              break;
           end;
       end;
       SchTreeSaldoDataSet.SelectSQL.Text:=GetMainSQL;
       SchTreeSaldoDataSet.Open;

       TempdataSet:=TpFibDataSet.Create(self);
       TempdataSet.Database:=WorkDatabase;
       TempdataSet.Transaction:=ReadTransaction;
       TempdataSet.SQLs.SelectSQL.Text:='SELECT * FROM  PUB_SYS_DATA';
       TempdataSet.Open;
       //заполнение настроек системы
       SchLevelCount:=TempdataSet.FieldByName('MAX_SCH_LEVEL_COUNT').AsInteger;
       INFINITY_DATE:=TempdataSet.FieldByName('INFINITY_DATE').AsDateTime;
       MBOOK_DATE   :=TempdataSet.FieldByName('MAIN_BOOK_DATE').AsDateTime;
       TempdataSet.Close;
       TempdataSet.Free;
       if (LocateId>0)
       then begin
             LocateSch(LocateId);
       end;
end;

function TfrmSchProp.GotoNodeById(View:TcxDBTreeList;Id_obj:Integer):TcxTreeListNode;
var Res_node:TcxTreeListNode;
begin
    Res_node:=nil;
    if SchTreeSaldoDataSet.Locate('ID_SCH',ID_OBJ,[])
    then begin
         Res_node:=SchTreeView.FocusedNode;

         if Res_node<>nil
         then begin
              if not Res_node.Expanded
              then begin
                   Res_node.Expand(false);
              end;
         end;
    end;

    GotoNodeById:=Res_node;
end;



procedure TfrmSchProp.DelToolButtonClick(Sender: TObject);
var Proc:TpFibStoredProc;
begin
if SchTreeView.FocusedNode.Parent<>nil
then begin
          if not SchTreeView.FocusedNode.HasChildren
          then begin
                    if MessageBox(Handle,PChar(BU_DeleteConfirmation+SchTreeSaldoDataSet.FieldByName('SCH_NUMBER').AsString),PChar(BU_WarningCaption),MB_YESNO or MB_ICONERROR)=idYes
                    then begin
                                Proc:=TpFibStoredProc.Create(self);
                                Proc.Database:=WorkDatabase;
                                Proc.Transaction:=WriteTransaction;
                                proc.StoredProcName:='PUB_SP_MAIN_SCH_DELETE';
                                WriteTransaction.StartTransaction;
                                try
                                      proc.Prepare;
                                      proc.ParamByName('P_ID_SCH').asInt64  :=StrToInt64(SchTreeSaldoDataSet.FieldByName('ID_SCH').AsString);
                                      proc.ParamByName('P_DATE_END').Value  :=ActualDate-1;
                                      proc.ExecProc;
                                except on E:Exception do
                                      begin
                                              MessageBox(Application.Handle,PChar(E.Message),PChar(BU_WarningCaption),MB_OK and MB_ICONWARNING);
                                              WriteTransaction.Rollback;
                                              Exit;
                                      end;
                                end;
                                WriteTransaction.Commit;
                                SchTreeSaldoDataSet.CacheDelete;
                    end;
          end
          else begin
                    MessageBox(Application.Handle,PChar(BU_HasChildError),PChar(BU_WarningCaption),MB_OK and MB_ICONWARNING);
          end;
end;
end;

procedure TfrmSchProp.SpeedButton1Click(Sender: TObject);
begin
    SchTreeView.FullExpand;
end;

procedure TfrmSchProp.SpeedButton2Click(Sender: TObject);
begin
   SchTreeView.FullCollapse;
end;

procedure TfrmSchProp.SpeedButton3Click(Sender: TObject);
begin
   if SchTreeView.FocusedNode<>nil
   then SchTreeView.FocusedNode.Expand(false);
end;

procedure TfrmSchProp.SpeedButton4Click(Sender: TObject);
begin
   if SchTreeView.FocusedNode<>nil
   then SchTreeView.FocusedNode.Collapse(false);
end;

procedure TfrmSchProp.DeleteActionExecute(Sender: TObject);
begin
  SpeedButton3Click(self);
end;

procedure TfrmSchProp.InsertActionExecute(Sender: TObject);
begin
  SpeedButton4Click(self);
end;

procedure TfrmSchProp.RefreshToolButtonClick(Sender: TObject);
var date_str:string;
    id:integer;
begin
       ID:=0;
       dateTimetostring(date_str,'dd.mm.yyyy', ActualDate);
       if MasterSchDataSet.Active then MasterSchDataSet.Close;
       MasterSchDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_MAIN_SCH_SELECT_LEVEL('+''''+date_str+''''+',1)';
       MasterSchDataSet.Open;
       dateTimetostring(date_str,'dd.mm.yyyy', ActualDate);
       if SchTreeSaldoDataSet.Active
       then  begin
               if SchTreeSaldoDataSet.RecordCount>0
               then id:=SchTreeSaldoDataSet.FieldByName('ID_SCH').AsInteger;
               SchTreeSaldoDataSet.Close;
       end;
       SchTreeSaldoDataSet.SelectSQL.Text:=GetMainSQL;
       SchTreeView.DataController.BeginUpdate;
       SchTreeSaldoDataSet.Open;
       LocateSch(ID);
       SchTreeView.DataController.EndUpdate;
end;

procedure TfrmSchProp.CloseToolButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmSchProp.RefreshActionExecute(Sender: TObject);
begin
     RefreshToolButton.OnClick(self);
end;

procedure TfrmSchProp.PropButtonClick(Sender: TObject);
begin
 if SchTreeView.FocusedNode<>nil
 then begin
    if  (SchTreeSaldoDataSet.FieldByName('TYPE_OBJECT').asInteger>=2) and (not SchTreeView.FocusedNode.HasChildren)
    then begin
         GetPropByObj(self.owner,WorkDatabase.Handle,SchTreeSaldoDataSet.FieldByName('ID_SCH').asInteger,ActualDate,ptSch);
    end
    else begin
          MessageBox(Handle,PChar(BU_PropError),PChar(BU_WarningCaption),MB_OK and MB_ICONWARNING);
    end;
  end;
end;

procedure TfrmSchProp.OperButtonClick(Sender: TObject);
begin
 if SchTreeView.FocusedNode<>nil
 then begin
    if  (SchTreeSaldoDataSet.FieldByName('TYPE_OBJECT').asInteger>=2) and (not SchTreeView.FocusedNode.HasChildren)
    then begin
          GetOperationsSpr(self.owner,WorkDatabase.Handle,fsmdiChild,SchTreeSaldoDataSet.FieldByName('ID_SCH').asInteger,ActualDate,false);
    end
    else begin
          MessageBox(Handle,PChar(BU_PropError),PChar(BU_WarningCaption),MB_OK and MB_ICONWARNING);
    end;
  end;
end;

procedure TfrmSchProp.ChooseButtonClick(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmSchProp.cbMonthChange(Sender: TObject);
var date_str:string;
begin
     DateSeparator:='.';
     ActualDate:=StrToDate('01.'+IntToStr(cbMonth.ItemIndex+1)+'.'+cbYear.Items[cbYear.ItemIndex]);
     DateTimeToString(date_str,'dd.mm.yyyy',ActualDate);
     RefreshToolButton.OnClick(self);
end;

procedure TfrmSchProp.N9Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmSchProp.N6Click(Sender: TObject);
begin
  RefreshToolButton.OnClick(self);
end;

procedure TfrmSchProp.ToolButton17Click(Sender: TObject);
begin
   if CurFS=fsNormal
   then Close
   else ModalResult:=mrNo;
end;

procedure TfrmSchProp.DBLookupComboBox1CloseUp(Sender: TObject);
begin
     RefreshToolButton.OnClick(self);
end;


procedure TfrmSchProp.ToolButton13Click(Sender: TObject);
var T:TfrmSearchSch;
    Proc:TpFibStoredProc;
    FindItem:Integer;
begin
    T:=TfrmSearchSch.Create(self);
    if T.ShowModal=mrYes
    then begin
         Proc:=TpFibStoredProc.Create(self);
         Proc.Database:=WorkDatabase;
         Proc.Transaction:=ReadTransaction;
         Proc.StoredProcName:='PUB_SP_MAIN_SCH_FIND';
         Proc.Prepare;
         Proc.ParamByName('SCH_NUMBER_FOR_FIND').AsString:=Trim(T.Edit1.Text);
         Proc.ParamByName('BOOK_DATE').Value             :=ActualDate;
         Proc.ExecProc;
         FindItem:=Proc.ParamByName('FIND_SCH').AsInteger;
         Proc.Free;
         LocateSch(FindItem);
    end;
    T.Free;
end;

function TfrmSchProp.LocateSch(Id_sch: Integer): Boolean;
var     LinksPath:TpFibDataSet;
        Str:String;
        i:Integer;
        N:TcxTreeListNode;
begin
if (Id_sch>0)
then begin
         DateTimeToString(Str,'dd.mm.yyyy',ActualDate);
         LinksPath:=TpFibDataSet.Create(self);
         LinksPath.Database:=WorkDatabase;
         LinksPath.Transaction:=ReadTransaction;
         LinksPath.SelectSQL.Text:='SELECT * FROM PUB_SP_MAIN_SCH_GET_PATH_EX('+IntToStr(Id_sch)+','+''''+Str+''''+') ORDER BY ID_SCH';
         LinksPath.Open;
         LinksPath.FetchAll;
         for i:=0 to LinksPath.RecordCount-1 do
         begin
             N:=GotoNodeById(SchTreeView,LinksPath.FieldByName('ID_SCH').AsINteger);
             if N<>nil
             then begin
                   SchTreeView.FocusedNode:=N;
                   N.Expand(false);
             end;
             LinksPath.Next;
         end;
         LinksPath.Close;
         LinksPath.Free;

         if SchTreeSaldoDataSet.RecordCount>0
         then LocateSch:=SchTreeSaldoDataSet.FieldByName('ID_SCH').Value
         else LocateSch:=false;
end;
end;

procedure TfrmSchProp.FindActionExecute(Sender: TObject);
begin
    ToolButton13Click(self);
end;

procedure TfrmSchProp.Action1Execute(Sender: TObject);
begin
    if self.WindowState=wsMaximized
    then self.WindowState:=wsNormal
    else self.WindowState:=wsMaximized;
end;

constructor TfrmSchProp.Create(AOwner: TComponent;
  DBhandle: TISC_DB_HANDLE;  Actual_Date: TDateTime; Root: Integer);
begin
      inherited Create(AOwner);
      self.ActualDate:=Actual_Date;
      self.Root:=Root;
      Self.WorkDatabase.Handle:=DBHandle;
      ExtractAllFlag:=true;
      if Self.FormStyle=fsNormal
      then begin
                cbMonth.Enabled:=false;
                cbYear.Enabled:=false;
      end;
end;

procedure TfrmSchProp.SchTreeViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (KEY=VK_LEFT)
  THEN BEGIN
       if SchTreeView.FocusedNode<>nil
       then SchTreeView.FocusedNode.Collapse(true);
  END;
  if (KEY=VK_RIGHT)
  THEN BEGIN
       if SchTreeView.FocusedNode<>nil
       then SchTreeView.FocusedNode.Expand(false);
  END;
end;

procedure TfrmSchProp.SchTreeViewStylesGetContentStyle(Sender,
  AItem: TObject; ANode: TcxTreeListNode; var AStyle: TcxStyle);
begin
     if (ANode.Texts[0]='Класс')
     then AStyle:=cxStyle1
     else begin
          if (ANode.Texts[2]='1')
          then AStyle:=cxStyle3
          else AStyle:=cxStyle2;
     end;
end;

procedure TfrmSchProp.ToolButton2Click(Sender: TObject);
begin
    Close;
end;

function TfrmSchProp.GetMainSQL: String;
var n_pp,date_str:String;
begin
     if (cxLookupComboBox1.EditValue=null)
     then n_pp:='0'
     else n_pp:=varToStr(cxLookupComboBox1.EditValue);
     dateTimetostring(date_str,'dd.mm.yyyy', ActualDate);
     if cxCheckBox1.Checked
     then Result:=' SELECT * FROM PUB_SP_MAIN_SCH_PROP_AN_SELECT('+''''+date_str+''''+',1,'+n_pp+') WHERE SET_FLAG=1'
     else Result:=' SELECT * FROM PUB_SP_MAIN_SCH_PROP_AN_SELECT('+''''+date_str+''''+',1,'+n_pp+')';
end;

procedure TfrmSchProp.cxCheckBox1PropertiesChange(Sender: TObject);
begin
     RefreshToolButton.OnClick(self);
end;

procedure TfrmSchProp.cxLookupComboBox1PropertiesChange(Sender: TObject);
begin
    RefreshToolButton.OnClick(self);
end;

procedure TfrmSchProp.ToolButton3Click(Sender: TObject);
var Proc:TpFibStoredProc;
    Curr_Id_Sch,i:Integer;
begin
if (cxLookupComboBox1.EditValue<>NULL)
then begin
    if SchTreeSaldoDataSet.RecordCount>0
    then begin
         Proc:=TpFibStoredProc.Create(self);
         Proc.Database:=WorkDatabase;
         Proc.Transaction:=WriteTransaction;
         WriteTransaction.StartTransaction;
         Proc.StoredProcName:='PUB_DT_SCH_PROP_SET';
         Proc.Prepare;
         for i:=0 to SchTreeView.SelectionCount-1 do
         begin
              Curr_Id_Sch:=StrToInt(SchTreeView.Selections[i].Texts[4]);
              Proc.ParamByName('P_ID_PROP').Value  :=SchPropDataSet.FieldByName('ID_PROP').Value;
              Proc.ParamByName('P_ID_OBJ').AsInteger :=Curr_Id_Sch;
              Proc.ParamByName('P_TYPE_PROP').Value:=1;
              Proc.ParamByName('P_DATE_BEG').Value :=ActualDate;
              Proc.ExecProc;
         end;
         WriteTransaction.Commit;
         RefreshToolButton.OnClick(self);
    end;
end
else ShowMessage('Не вибрана властивість');
end;

procedure TfrmSchProp.SchTreeViewExpanding(Sender: TObject;
  ANode: TcxTreeListNode; var Allow: Boolean);
begin
   SchTreeView.FocusedNode:=ANode;
end;

procedure TfrmSchProp.ToolButton4Click(Sender: TObject);
var Proc:TpFibStoredProc;
    i:Integer;
    Curr_Id_Sch:Integer;
begin
if cxLookupComboBox1.Text=''
then begin
    if SchTreeSaldoDataSet.RecordCount>0
    then begin
        Proc:=TpFibStoredProc.Create(self);
        Proc.Database:=WorkDatabase;
        Proc.Transaction:=WriteTransaction;
        WriteTransaction.StartTransaction;
        Proc.StoredProcName:='PUB_DT_SCH_PROP_SET';
        Proc.Prepare;
        for i:=0 to SchTreeView.SelectionCount-1 do
        begin
                  Curr_Id_Sch:=StrToInt(SchTreeView.Selections[i].Texts[4]);
                  Proc:=TpFibStoredProc.Create(self);
                  Proc.Database:=WorkDatabase;
                  Proc.Transaction:=WriteTransaction;
                  WriteTransaction.StartTransaction;
                  Proc.StoredProcName:='PUB_DT_SCH_PROP_DEL';
                  Proc.Prepare;
                  Proc.ParamByName('P_ID_PROP').Value  :=SchPropDataSet.FieldByName('ID_PROP').Value;
                  Proc.ParamByName('P_ID_SCH').Value   :=Curr_Id_Sch;
                  Proc.ParamByName('P_CURR_DATE').Value:=ActualDate;
                  Proc.ParamByName('P_USE_END').Value  :=ActualDate-1;
                  Proc.ExecProc;
        end;
        WriteTransaction.Commit;
        RefreshToolButton.OnClick(self);
    end;
end
else ShowMessage('Не вибрана властивість');
end;

procedure TfrmSchProp.EscExecute(Sender: TObject);
begin
  close;
end;

end.
