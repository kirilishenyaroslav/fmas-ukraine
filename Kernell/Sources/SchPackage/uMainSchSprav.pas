unit uMainSchSprav;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls,pFibQuery, Forms, Dialogs,  ComCtrls, DB, FIBDataSet,
  pFIBDataSet, Buttons, ToolWin, Menus, ImgList, ExtCtrls,
  pFIBStoredProc, Grids, DBGrids, ActnList, FIBDatabase, pFIBDatabase,
  StdCtrls,Ibase,DBCtrls, cxControls,
  cxContainer, cxCheckListBox, cxDBCheckListBox, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCheckComboBox,cxCheckBox, cxDBCheckComboBox,
  frxClass, frxDBSet, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxInplaceContainer, cxDBTL, cxTLData, cxDBEdit ,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Placemnt, dxStatusBar,
  AppEvnts, fib, frxExportPDF, frxExportImage, frxExportRTF, frxExportXLS,
  frxExportHTML;


resourcestring
   Spr_title='Довідник балансових рахунків';

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

  TfrmSchMain = class(TForm)
    WorkPopup: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
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
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    SmallImages: TImageList;
    WorkDatabase: TpFIBDatabase;
    SysDataSet: TpFIBDataSet;
    SysSource: TDataSource;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SysExtDataSet: TpFIBDataSet;
    SysExDataSource: TDataSource;
    FindAction: TAction;
    Action1: TAction;
    MasterDBDataset: TfrxDBDataset;
    MasterSchDataSet: TpFIBDataSet;
    MasterDataSource: TDataSource;
    PrintPopupMenu: TPopupMenu;
    N18: TMenuItem;
    N19: TMenuItem;
    SchTreeView: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn;
    SchTreeDataSet: TpFIBDataSet;
    SchTreeDataSource: TDataSource;
    SchTreeViewcxDBTreeListColumn1: TcxDBTreeListColumn;
    SchTreeViewcxDBTreeListColumn2: TcxDBTreeListColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxStyle2: TcxStyle;
    N20: TMenuItem;
    N21: TMenuItem;
    cxStyle3: TcxStyle;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    SchTreeViewcxDBTreeListColumn3: TcxDBTreeListColumn;
    SchTreeViewcxDBTreeListColumn4: TcxDBTreeListColumn;
    N26: TMenuItem;
    SchTreeViewcxDBTreeListColumn5: TcxDBTreeListColumn;
    SchTreeViewcxDBTreeListColumn6: TcxDBTreeListColumn;
    cxStyle4: TcxStyle;
    Panel3: TPanel;
    Label1: TLabel;
    cbMonth: TComboBox;
    cbYear: TComboBox;
    Label5: TLabel;
    CheckLinearView: TcxCheckBox;
    ToolBar1: TToolBar;
    AddToolButton: TToolButton;
    DelToolButton: TToolButton;
    EditToolButton: TToolButton;
    PropButton: TToolButton;
    OperButton: TToolButton;
    ChooseButton: TToolButton;
    ToolButton1: TToolButton;
    RefreshToolButton: TToolButton;
    ToolButton15: TToolButton;
    CloseToolButton: TToolButton;
    N16: TMenuItem;
    N17: TMenuItem;
    N27: TMenuItem;
    FormStorage1: TFormStorage;
    GetAction2: TAction;
    Label6: TLabel;
    Label7: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    SchTreeViewcxDBTreeListColumn7: TcxDBTreeListColumn;
    frxReport1: TfrxReport;
    dxStatusBar1: TdxStatusBar;
    Esc: TAction;
    PropMenu: TPopupMenu;
    PopupProp: TMenuItem;
    PopupCopyProp: TMenuItem;
    IDSystemComboBox: TDBLookupComboBox;
    actGetID: TAction;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxBMPExport1: TfrxBMPExport;
    frxPDFExport1: TfrxPDFExport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddToolButtonClick(Sender: TObject);
    procedure EditToolButtonClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DelToolButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure RefreshToolButtonClick(Sender: TObject);
    procedure CloseToolButtonClick(Sender: TObject);
    procedure ViewToolButtonClick(Sender: TObject);
    procedure InsertActionExecute(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
    procedure UpdateActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure PropButtonClick(Sender: TObject);
    procedure OperButtonClick(Sender: TObject);
    procedure ChooseButtonClick(Sender: TObject);
    procedure cbMonthChange(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure IDSystemComboBoxCloseUp(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure SchTreeViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SchTreeViewStylesGetContentStyle(Sender, AItem: TObject; ANode: TcxTreeListNode; var AStyle: TcxStyle);
    procedure N21Click(Sender: TObject);
    procedure WorkPopupPopup(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure CheckLinearViewClick(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SchTreeViewDblClick(Sender: TObject);
    procedure SchTreeViewExpanding(Sender: TObject; ANode: TcxTreeListNode; var Allow: Boolean);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure GetActionExecute(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FindActionExecute(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure PopupPropClick(Sender: TObject);
    procedure PopupCopyPropClick(Sender: TObject);
    procedure actGetIDExecute(Sender: TObject);
  private
    SelectMode        :Integer;
    {
     1-обычный справочник счетов
     2-справочник счетов с учетом операций
     3-справочник счетов с учетом операций с фильрацией по форме учета
    }
  public
    ExtractAllFlag    :Boolean;
    ChooseAllObjects  :Boolean;
    LocateId          :Integer;
    id_sch_in         :integer;
    in_sch_in_credit  :integer;
    INFINITY_DATE     :TDateTime;
    Work_Id_Object    :Integer;
    ActualDate        :TDateTime;
    SchLevelCount     :Integer;
    FlagMultiSelect   :Boolean;
    ResultValue       :Variant;
    Root              :Integer;
    CurFS             :TFormStyle;
    FilterIdSystem    :Integer;
    Use_mo            :Integer;
    function    LocateSch(Id_sch:Integer):Boolean;
    function    GotoNodeById(View:TcxDBTreeList;Id_obj:Integer):TcxTreeListNode;
    function    GetMainSql:String;
    constructor Create(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle;      Book_Date:TDateTime; Root:Integer); reintroduce; overload;
    constructor Create(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle;      Book_Date:TDateTime; Root:Integer;    Id_sys_uch:integer;       id_sch:integer); reintroduce; overload;
    constructor Create(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; Book_Date:TDateTime;Id_sys_uch:integer;  id_sch:integer;  In_sch_in_credit:Integer); reintroduce; overload;
    constructor Create(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle;      Book_Date:TDateTime; Root:Integer;    Id_sch:Integer;           Id_sch_In:Integer;      In_sch_in_credit:Integer);reintroduce; overload;
  end;

implementation

uses  UEditmainSchSprav, DateUtils, FindSch,
      GlobalSpr,  BaseTypes, Resources_unitb, UpKernelUnit, CopyProperties;
{$R *.dfm}

procedure TfrmSchMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      SchTreeView.StoreToRegistry('Software\Budgeting\SchTreeView',true);
      Action:=caFree;
end;

procedure TfrmSchMain.AddToolButtonClick(Sender: TObject);
var T:TfrmEditSch;
begin
    if SchTreeView.FocusedNode.Level<SchLevelCount
    then begin
              T:=TfrmEditSch.Create(self, -1);
              T.IsEdit:=false;
              T.ShowModal;
              T.Free;
   end
   else begin
             MessageBox(Application.Handle,PChar(BU_CountLevelError),PChar(BU_ErrorCaption),MB_OK or MB_ICONERROR);
   end;
end;

procedure TfrmSchMain.EditToolButtonClick(Sender: TObject);
var T:TfrmEditSch;
begin
if SchTreeView.FocusedNode.Parent<>nil
then begin
    T:=TfrmEditSch.Create(self,WorkDatabase.Gen_Id('GEN_PUB_SP_MAIN_SCH_SESSION_ID',1));
    T.IsEdit:=true;
    T.ShowModal;
    T.Free;
end;
end;

procedure TfrmSchMain.N1Click(Sender: TObject);
begin
   AddToolButton.OnClick(self);
end;

procedure TfrmSchMain.N2Click(Sender: TObject);
begin
   EditToolButton.OnClick(self);
end;

function TfrmSchMain.GotoNodeById(View:TcxDBTreeList;Id_obj:Integer):TcxTreeListNode;
var
    Res_node:TcxTreeListNode;
begin
    Res_node:=nil;
    if SchTreeDataSet.Locate('ID_SCH',ID_OBJ,[])
    then begin
         Res_node:=SchTreeView.FocusedNode;
    end;
    if Res_node<>nil
    then begin
            if not Res_node.Expanded
            then begin
                 Res_node.Expand(false);
            end;
    end;
    GotoNodeById:=Res_node;
end;



procedure TfrmSchMain.DelToolButtonClick(Sender: TObject);
var Proc:TpFibStoredProc;
begin
      if (SchTreeView.FocusedNode.Parent<>nil)
      then begin
                if not SchTreeView.FocusedNode.HasChildren
                then begin
                          if BaseTypes.agMessageDlg(BU_WarningCaption,BU_DeleteConfirmation+SchTreeDataSet.FieldByName('SCH_NUMBER').AsString,mtWarning,[mbYes,mbNo])=mrYes
                          then begin
                                      Proc:=TpFibStoredProc.Create(self);
                                      Proc.Database:=WorkDatabase;
                                      Proc.Transaction:=WriteTransaction;
                                      proc.StoredProcName:='PUB_SP_MAIN_SCH_DELETE';
                                      WriteTransaction.StartTransaction;

                                      StartHistory(WriteTransaction);

                                      try
                                            proc.Prepare;
                                            proc.ParamByName('P_ID_SCH').asInt64  :=StrToInt64(SchTreeDataSet.FieldByName('ID_SCH').AsString);
                                            proc.ParamByName('P_DATE_END').Value  :=ActualDate;
                                            proc.ExecProc;
                                      except on E:Exception do
                                            begin
                                                    agMessageDlg(BU_WarningCaption,E.Message,mtWarning,[mbOK]);
                                                    WriteTransaction.Rollback;
                                                    Exit;
                                            end;
                                      end;
                                      WriteTransaction.Commit;
                                      SchTreeDataSet.CacheDelete;
                          end;
                end
                else begin
                          agMessageDlg(BU_WarningCaption,BU_HasChildError,mtWarning,[mbOK]);
                end;
      end;
end;

procedure TfrmSchMain.SpeedButton1Click(Sender: TObject);
begin
    SchTreeView.FullExpand; 
    if  SchTreeView.Nodes.Count>0  then   SchTreeView.FocusedNode:=SchTreeView.Nodes[0];
end;

procedure TfrmSchMain.SpeedButton2Click(Sender: TObject);
begin
   SchTreeView.FullCollapse;
end;

procedure TfrmSchMain.SpeedButton3Click(Sender: TObject);
begin
   if SchTreeView.FocusedNode<>nil
   then SchTreeView.FocusedNode.Expand(false);
end;

procedure TfrmSchMain.SpeedButton4Click(Sender: TObject);
begin
   if SchTreeView.FocusedNode<>nil
   then SchTreeView.FocusedNode.Collapse(false);
end;

procedure TfrmSchMain.RefreshToolButtonClick(Sender: TObject);
var date_str:string;
    id:integer;
begin
       ID:=0;
       dateTimetostring(date_str,'dd.mm.yyyy', ActualDate);
       if MasterSchDataSet.Active then MasterSchDataSet.Close;
       MasterSchDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_MAIN_SCH_SELECT_LEVEL('+''''+date_str+''''+',1)';
       MasterSchDataSet.Open;

       dateTimetostring(date_str,'dd.mm.yyyy', ActualDate);
       if SchTreeDataSet.Active
       then  begin
               if SchTreeDataSet.RecordCount>0
               then id:=SchTreeDataSet.FieldByName('ID_SCH').AsInteger;
               SchTreeDataSet.Close;
       end;
       SchTreeDataSet.SelectSQL.Text:=GetMainSql;
       SchTreeView.BeginUpdate;
       SchTreeDataSet.Open;
       if SchTreeView.FocusedNode<>nil then SchTreeView.TopVisibleIndex:=SchTreeView.FocusedNode.Index;
       SchTreeView.EndUpdate;

       LocateSch(ID);

end;

procedure TfrmSchMain.CloseToolButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmSchMain.ViewToolButtonClick(Sender: TObject);
var T:TfrmEditSch;
begin
    T:=TfrmEditSch.Create(self,WorkDatabase.Gen_Id('GEN_PUB_SP_MAIN_SCH_SESSION_ID',1));
    T.IsEdit:=true;
    T.IsView:=true;
    T.ShowModal;
    T.Free;

end;

procedure TfrmSchMain.InsertActionExecute(Sender: TObject);
begin
    AddToolButton.OnClick(self);
end;

procedure TfrmSchMain.DeleteActionExecute(Sender: TObject);
begin
     DelToolButton.OnClick(self);
end;

procedure TfrmSchMain.UpdateActionExecute(Sender: TObject);
begin
     EditToolButton.OnClick(self);
end;

procedure TfrmSchMain.RefreshActionExecute(Sender: TObject);
begin
     RefreshToolButton.OnClick(self);
end;

procedure TfrmSchMain.CloseActionExecute(Sender: TObject);
begin
     CloseToolButton.OnClick(self);
end;

constructor TfrmSchMain.Create(AOwner: TComponent; DBhandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime; Root:Integer);
begin
      inherited Create(AOwner);
      SelectMode:=1;
      IDSystemComboBox.KeyValue:=0;
      self.ActualDate:=Book_Date;
      self.Root:=Root;
      CurFS:=FS;
      Self.WorkDatabase.Handle:=DBHandle;
      Self.FormStyle:=FS;
      ExtractAllFlag:=false;
      SysExtDataSet.Open;
      SysExtDataSet.FetchAll;

      if Self.FormStyle=fsNormal
      then begin
         SchTreeView.OptionsSelection.MultiSelect:=true;
         ChooseButton.Enabled:=true;
         N15.Enabled:=true;
         AddToolButton.Enabled:=false;
         DelToolButton.Enabled:=false;
         EditToolButton.Enabled:=false;
         PropButton.Enabled:=false;
         OperButton.Enabled:=false;
         //cbMonth.Enabled:=false;
         //cbYear.Enabled:=false;
         N1.Enabled:=false;
         N2.Enabled:=false;
         N3.Enabled:=false;
         N4.Enabled:=false;
         N13.Enabled:=false;
         N12.Enabled:=false;
      end;
end;


procedure TfrmSchMain.PropButtonClick(Sender: TObject);
begin
 if SchTreeView.FocusedNode<>nil
 then begin
    if  (SchTreeDataSet.FieldByName('TYPE_OBJECT').asInteger>=2){and (not SchTreeView.FocusedNode.HasChildren)}
    then begin
          GetPropByObj(self.owner,WorkDatabase.Handle,SchTreeDataSet.FieldByName('ID_SCH').asInteger,ActualDate,ptSch);
    end
    else begin
          agMessageDlg(BU_WarningCaption,BU_PropError,mtWarning,[mbOK]);
    end;
  end;
end;

procedure TfrmSchMain.PopupPropClick(Sender: TObject);
begin
  PropButton.OnClick(Sender);
end;

procedure TfrmSchMain.OperButtonClick(Sender: TObject);
begin
  if SchTreeView.FocusedNode<>nil
  then begin
    if  (SchTreeDataSet.FieldByName('TYPE_OBJECT').asInteger>=2) and (not SchTreeView.FocusedNode.HasChildren)
    then begin
         GetOperationsSpr(self.owner,WorkDatabase.Handle,fsmdiChild,SchTreeDataSet.FieldByName('ID_SCH').asInteger,ActualDate,false);
    end
    else begin
          agMessageDlg(BU_WarningCaption,BU_PropError,mtWarning,[mbOK]);
    end;
  end;
end;

procedure TfrmSchMain.ChooseButtonClick(Sender: TObject);
var i:Integer;
begin
  if not SchTreeView.OptionsSelection.MultiSelect then begin

      if SchTreeView.SelectionCount=1 then begin

           if not ChooseAllObjects then begin

                 if not SchTreeView.Selections[0].HasChildren then begin

                         ResultValue:=VarArrayCreate([0,0], varVariant);
                         if (SelectMode <> 3) then begin
                                   ResultValue[0]:=VarArrayOf([SchTreeDataSet.FieldByName('ID_SCH').value,
                                                               SchTreeDataSet.FieldByName('SCH_TITLE').value,
                                                               SchTreeDataSet.FieldByName('TYPE_OBJECT').value,
                                                               SchTreeDataSet.FieldByName('SCH_NUMBER').value,
                                                               SchTreeDataSet.FieldByName('ID_SYSTEM').value]);
                         end
                         else begin
                                   ResultValue[0]:=VarArrayOf([SchTreeDataSet.FieldByName('ID_SCH').value,
                                                               SchTreeDataSet.FieldByName('SCH_TITLE').value,
                                                               SchTreeDataSet.FieldByName('TYPE_OBJECT').value,
                                                               SchTreeDataSet.FieldByName('SCH_NUMBER').value,
                                                               SchTreeDataSet.FieldByName('ID_OPER').value,
                                                               SchTreeDataSet.FieldByName('OPER_DB_CR_DOC').value,
                                                               SchTreeDataSet.FieldByName('OPER_KR_CR_DOC').value,
                                                               SchTreeDataSet.FieldByName('OPER_DB_CR_PROV').value,
                                                               SchTreeDataSet.FieldByName('OPER_KR_CR_PROV').value,
                                                               SchTreeDataSet.FieldByName('ID_SYSTEM').value
                                                               ]);
                         end;

                         ModalResult:=mrYes;
                 end
                 else begin
                         if self.FormStyle=fsNormal
                         then agMessageDlg(BU_HieracChooseError,BU_PropError,mtWarning,[mbOK]);
                 end;
           end
           else begin
                         ResultValue:=VarArrayCreate([0, 0], varVariant);
                         ResultValue[0]:=VarArrayOf([SchTreeDataSet.FieldByName('ID_SCH').value,
                                                     SchTreeDataSet.FieldByName('SCH_TITLE').value,
                                                     SchTreeDataSet.FieldByName('TYPE_OBJECT').value,
                                                     SchTreeDataSet.FieldByName('SCH_NUMBER').value,
                                                     SchTreeDataSet.FieldByName('ID_SYSTEM').value]);
                         ModalResult:=mrYes;
           end;
      end;
  end
  else begin
     ResultValue:=VarArrayCreate([0, SchTreeView.SelectionCount-1], varVariant);
     for i:=0 to SchTreeView.SelectionCount-1 do
     begin
          if not ChooseAllObjects then begin
            if not SchTreeView.Selections[i].HasChildren then begin
                ResultValue[i]:=VarArrayOf([ SchTreeView.Selections[i].Texts[7] {ID_MAIN_SCH},
                                             SchTreeView.Selections[i].Texts[1] {SCH_TITLE},
                                             SchTreeView.Selections[i].Texts[8] {TYPE_OBJECT},
                                             SchTreeView.Selections[i].Texts[0] {SCH_NUMBER},
                                             SchTreeView.Selections[i].Texts[9]]);
            end
          end
          else begin
                ResultValue[i]:=VarArrayOf([ SchTreeView.Selections[i].Texts[7] {ID_MAIN_SCH},
                                             SchTreeView.Selections[i].Texts[1] {SCH_TITLE},
                                             SchTreeView.Selections[i].Texts[8] {TYPE_OBJECT},
                                             SchTreeView.Selections[i].Texts[0] {SCH_NUMBER},
                                             SchTreeView.Selections[i].Texts[9]]);
          end;
     end;
     ModalResult:=mrYes;
  end;
end;

procedure TfrmSchMain.cbMonthChange(Sender: TObject);
var date_str:string;
begin
     DateSeparator:='.';
     ActualDate:=StrToDate('01.'+IntToStr(cbMonth.ItemIndex+1)+'.'+cbYear.Items[cbYear.ItemIndex]);
     DateTimeToString(date_str,'dd.mm.yyyy',ActualDate);
     caption:=Spr_title+' на '+ date_str;
     RefreshToolButton.OnClick(self);
end;

procedure TfrmSchMain.N15Click(Sender: TObject);
begin
     ChooseButton.OnClick(self);
end;

procedure TfrmSchMain.N3Click(Sender: TObject);
begin
     DelToolButton.OnClick(self);
end;

procedure TfrmSchMain.N12Click(Sender: TObject);
begin
    PropButton.OnClick(self);
end;

procedure TfrmSchMain.N13Click(Sender: TObject);
begin
 OperButton.OnClick(self);
end;

procedure TfrmSchMain.N9Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmSchMain.N6Click(Sender: TObject);
begin
  RefreshToolButton.OnClick(self);
end;

procedure TfrmSchMain.ToolButton17Click(Sender: TObject);
begin
   if CurFS=fsNormal
   then Close
   else ModalResult:=mrNo;
end;

procedure TfrmSchMain.IDSystemComboBoxCloseUp(Sender: TObject);
begin
     RefreshToolButton.OnClick(self);
end;
//=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
constructor TfrmSchMain.Create(AOwner: TComponent; DBhandle: TISC_DB_HANDLE; FS: TFormStyle;
                                Book_Date: TDateTime;  Root, Id_sys_uch, id_sch: integer);
begin
      inherited Create(AOwner);
      SelectMode:=1;
      IDSystemComboBox.KeyValue:=Id_sys_uch;
      self.ActualDate:=Book_Date;
      self.Root:=Root;
      CurFS:=FS;
      Self.WorkDatabase.Handle:=DBHandle;
      Self.FormStyle:=FS;
      ExtractAllFlag:=true;
      LocateId:=id_sch;
      SysExtDataSet.Open;
      SysExtDataSet.FetchAll;

      if Self.FormStyle=fsNormal
      then begin
         SchTreeView.OptionsSelection.MultiSelect:=true;
         ChooseButton.Enabled:=true;
         N15.Enabled:=true;
         AddToolButton.Enabled:=false;
         DelToolButton.Enabled:=false;
         EditToolButton.Enabled:=false;
         PropButton.Enabled:=false;
         OperButton.Enabled:=false;
         //cbMonth.Enabled:=false;
         //cbYear.Enabled:=false;
         N1.Enabled:=false;
         N2.Enabled:=false;
         N3.Enabled:=false;
         N4.Enabled:=false;
         N13.Enabled:=false;
         N12.Enabled:=false;
      end;
end;

constructor TfrmSchMain.Create( AOwner: TComponent; DBhandle: TISC_DB_HANDLE; FS: TFormStyle;
                                Book_Date: TDateTime; Root, Id_sch, Id_sch_In, In_sch_in_credit: Integer);
begin
      inherited Create(AOwner);
      SelectMode:=2;
      self.ActualDate:=Book_Date;
      self.Root:=Root;
      self.id_sch_in:=Id_sch_In;
      self.in_sch_in_credit:=In_sch_in_credit;
      CurFS:=FS;
      Self.WorkDatabase.Handle:=DBHandle;
      Self.FormStyle:=FS;
      ExtractAllFlag:=true;
      LocateId:=id_sch;

      if Self.FormStyle=fsNormal
      then begin
         SchTreeView.OptionsSelection.MultiSelect:=true;
         ChooseButton.Enabled:=true;
         N15.Enabled:=true;
         AddToolButton.Enabled:=false;
         DelToolButton.Enabled:=false;
         EditToolButton.Enabled:=false;
         PropButton.Enabled:=false;
         OperButton.Enabled:=false;
         //cbMonth.Enabled:=false;
         //cbYear.Enabled:=false;
         N1.Enabled:=false;
         N2.Enabled:=false;
         N3.Enabled:=false;
         N4.Enabled:=false;
         N13.Enabled:=false;
         N12.Enabled:=false;
      end;
end;

procedure TfrmSchMain.ToolButton13Click(Sender: TObject);
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

procedure TfrmSchMain.FindActionExecute(Sender: TObject);
begin
  ToolButton13Click(self);
end;

function TfrmSchMain.LocateSch(Id_sch: Integer): Boolean;
var     LinksPath:TpFibDataSet;
        Str:String;
        i:Integer;
        N:TcxTreeListNode;
begin
        if CheckLinearView.Checked
        then begin
                 N:=GotoNodeById(SchTreeView,Id_sch);
                 if N<>nil
                 then begin
                       SchTreeView.FocusedNode:=N;
                 end;
                 LocateSch:=true;
        end
        else begin
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
                 end
                 else Break;
                 LinksPath.Next;
             end;
             LinksPath.Close;
             LinksPath.Free;

             LocateSch:=(SchTreeDataSet.FieldByName('ID_SCH').Value=Id_sch);
         end;


end;

procedure TfrmSchMain.Action1Execute(Sender: TObject);
begin
    if self.WindowState=wsMaximized
    then self.WindowState:=wsNormal
    else self.WindowState:=wsMaximized;
end;


procedure TfrmSchMain.N16Click(Sender: TObject);
begin
if  (SchTreeDataSet.FieldByName('TYPE_OBJECT').AsInteger>=2) and (not SchTreeView.FocusedNode.HasChildren)
then begin
      GlobalSpr.GetSchWithOperFilter(Application.MainForm,WorkDatabase.Handle,fsMdiChild,ActualDate,DEFAULT_ROOT_ID,0,
      SchTreeDataSet.FieldByName('ID_SCH').AsInteger,1);
end
else begin
      agMessageDlg(BU_WarningCaption,BU_PropError,mtWarning,[mbOK]);
end;
end;

procedure TfrmSchMain.N17Click(Sender: TObject);
var Proc:TpFibStoredProc;
    FindItem:Integer;
begin
    if (SchTreeDataSet.RecordCount>0)
    then begin
              if (not SchTreeView.FocusedNode.HasChildren)
              then begin
                          if (SchTreeDataSet.FieldByName('ID_SYSTEM').AsInteger=1)
                          then begin
                                    Proc:=TpFibStoredProc.Create(self);
                                    Proc.Database:=WorkDatabase;
                                    Proc.Transaction:=WriteTransaction;
                                    WriteTransaction.StartTransaction;
                                    Proc.StoredProcName:='MBOOK_MOVE_SCH_UNDER_SPR';
                                    Proc.Prepare;
                                    Proc.ParamByName('ID_SCH').Value     :=SchTreeDataSet.FieldByName('ID_SCH').Value;
                                    Proc.ParamByName('MOVE_MODE').Value  :=1;
                                    Proc.ParamByName('ID_USER').Value    :=0;
                                    Proc.ExecProc;
                                    if (Proc.ParamByName('RESULT').AsInteger=1)
                                    then WriteTransaction.Commit
                                    else begin
                                              ShowMessage(Proc.ParamByName('LOG_MESSAGE').AsString);
                                              WriteTransaction.Rollback;
                                    end;

                                    FindItem:=SchTreeDataSet.FieldByName('ID_SCH').Value;
                                    SchTreeDataSet.CloseOpen(true);
                                    Proc.Free;
                                    LocateSch(FindItem);
                          end
                          else ShowMessage('Цю функцію не можна використовувати для рахунка!');
              end
              else ShowMessage('Цю функцію не можна використовувати для рахунка!');
    end;
end;

procedure TfrmSchMain.N18Click(Sender: TObject);
begin
     frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\MBook\ReportBallanceObjects.fr3',true);
     frxReport1.PrepareReport(true);
     frxReport1.ShowPreparedReport;
end;

procedure TfrmSchMain.N19Click(Sender: TObject);
begin
     frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\MBook\ReportBallanceObjectsFull.fr3',true);
     frxReport1.PrepareReport(true);
     frxReport1.ShowPreparedReport;
end;

procedure TfrmSchMain.SchTreeViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TfrmSchMain.SchTreeViewStylesGetContentStyle(Sender, AItem: TObject; ANode: TcxTreeListNode; var AStyle: TcxStyle);
begin
  if (ANode.Texts[0]='Класс')
  then AStyle:=cxStyle1
  else AStyle:=cxStyle2;
end;

procedure TfrmSchMain.N21Click(Sender: TObject);
var Proc:TpFibStoredProc;
    FindItem:Integer;
begin
    Proc:=TpFibStoredProc.Create(self);
    Proc.Database:=WorkDatabase;
    Proc.Transaction:=WriteTransaction;
    WriteTransaction.StartTransaction;
    Proc.StoredProcName:='PUB_SCH_MAIN_SET_BLOCKED';
    Proc.Prepare;
    Proc.ParamByName('ID_SCH').Value     :=SchTreeDataSet.FieldByName('ID_SCH').Value;
    if SchTreeDataSet.FieldByName('IS_BLOCKED').AsInteger=1
    then Proc.ParamByName('STATE').Value      :=0
    else Proc.ParamByName('STATE').Value      :=1;
    Proc.ParamByName('ACTUAL_DATE').Value             :=ActualDate;
    Proc.ExecProc;
    WriteTransaction.Commit;
    FindItem:=SchTreeDataSet.FieldByName('ID_SCH').Value;
    SchTreeDataSet.CloseOpen(true);
    Proc.Free;
    LocateSch(FindItem);
end;

procedure TfrmSchMain.WorkPopupPopup(Sender: TObject);
begin
  if SchTreeDataSet.Active
  then begin
    if SchTreeDataSet.RecordCount>0
    then begin
           N21.Enabled:=true;
           N2.Enabled :=true;
           N3.Enabled :=true;
           N4.Enabled :=true;
           N13.Enabled:=true;
           N12.Enabled:=true;
           N21.Enabled:=true;
           if SchTreeDataSet.FieldByName('IS_BLOCKED').AsInteger=-1
           then N21.Enabled:=false;
           if SchTreeDataSet.FieldByName('IS_BLOCKED').AsInteger=1
           then N21.Caption:='Розблокувати рахунок балансу'
           else N21.Caption:='Заблокувати рахунок балансу';
    end
    else begin
           N3.Enabled :=false;
           N4.Enabled :=false;
           N21.Enabled:=false;
           N2.Enabled :=false;
           N13.Enabled:=false;
           N12.Enabled:=false;
           N21.Enabled:=false;
    end;
  end;
end;

procedure TfrmSchMain.N22Click(Sender: TObject);
var Proc:TpFibStoredProc;
    FindItem:Integer;
begin
    Proc:=TpFibStoredProc.Create(self);
    Proc.Database:=WorkDatabase;
    Proc.Transaction:=WriteTransaction;
    WriteTransaction.StartTransaction;
    Proc.StoredProcName:='PUB_SCH_MAIN_SET_BLOCKED_EX';
    Proc.Prepare;
    Proc.ParamByName('STATE').Value      :=1;
    Proc.ParamByName('ACTUAL_DATE').Value             :=ActualDate;
    Proc.ParamByName('ID_REG_UCH').Value              :=IDSystemComboBox.KeyValue;
    Proc.ExecProc;
    WriteTransaction.Commit;
    FindItem:=SchTreeDataSet.FieldByName('ID_SCH').Value;
    SchTreeDataSet.CloseOpen(true);
    Proc.Free;
    LocateSch(FindItem);
end;

procedure TfrmSchMain.N23Click(Sender: TObject);
var Proc:TpFibStoredProc;
    FindItem:Integer;
begin
    Proc:=TpFibStoredProc.Create(self);
    Proc.Database:=WorkDatabase;
    Proc.Transaction:=WriteTransaction;
    WriteTransaction.StartTransaction;
    Proc.StoredProcName:='PUB_SCH_MAIN_SET_BLOCKED_EX';
    Proc.Prepare;
    Proc.ParamByName('STATE').Value      :=0;
    Proc.ParamByName('ACTUAL_DATE').Value             :=ActualDate;
    Proc.ParamByName('ID_REG_UCH').Value              :=IDSystemComboBox.KeyValue;
    Proc.ExecProc;
    WriteTransaction.Commit;
    FindItem:=SchTreeDataSet.FieldByName('ID_SCH').Value;
    SchTreeDataSet.CloseOpen(true);
    Proc.Free;
    LocateSch(FindItem);
end;

procedure TfrmSchMain.N24Click(Sender: TObject);
begin
     N18Click(self);
end;

procedure TfrmSchMain.N25Click(Sender: TObject);
begin
     N19Click(self);
end;

procedure TfrmSchMain.CheckLinearViewClick(Sender: TObject);
begin
    RefreshToolButtonClick(Self);
end;

function TfrmSchMain.GetMainSql: String;
var Date_Str:String;
begin
       dateTimetostring(date_str,'dd.mm.yyyy', ActualDate);

       if (SelectMode = 1)
       then begin {Обычный справочник счетов - Отбираем все дерево - и администрируем}
                  if (CheckLinearView.Checked)
                  then Result:=' SELECT * FROM PUB_SP_MAIN_SCH_SELECT_EX('+''''+date_str+''''+','+IntToStr(Root)+','+VarToStr(IDSystemComboBox.KeyValue)+') WHERE NOT(OPEN_SCH IS NULL)'
                  else Result:=' SELECT * FROM PUB_SP_MAIN_SCH_SELECT_EX('+''''+date_str+''''+','+IntToStr(Root)+','+VarToStr(IDSystemComboBox.KeyValue)+')'
       end;

       if (SelectMode = 2)
       then begin {Справочник счетов с учетом корреспонденции}
                  if CheckLinearView.Checked
                  then Result:=' SELECT * FROM PUB_SP_MAIN_SCH_SELECT_EX2('+''''+date_str+''''+','+IntToStr(Root)+','+IntToStr(id_sch_in)+','+IntToStr(in_sch_in_credit)+') WHERE NOT(OPEN_SCH IS NULL)'
                  else Result:=' SELECT * FROM PUB_SP_MAIN_SCH_SELECT_EX2('+''''+date_str+''''+','+IntToStr(Root)+','+IntToStr(id_sch_in)+','+IntToStr(in_sch_in_credit)+')';
       end;

       if (SelectMode = 3)
       then begin
                  if CheckLinearView.Checked
                  then Result:=' SELECT * FROM PUB_SP_MAIN_SCH_SELECT_EX2('+''''+date_str+''''+','+IntToStr(Root)+','+IntToStr(id_sch_in)+','+IntToStr(in_sch_in_credit)+') WHERE (NOT(OPEN_SCH IS NULL)) AND ID_SYSTEM='+IntToStr(FilterIdSystem)
                  else Result:=' SELECT * FROM PUB_SP_MAIN_SCH_SELECT_EX2('+''''+date_str+''''+','+IntToStr(Root)+','+IntToStr(id_sch_in)+','+IntToStr(in_sch_in_credit)+') WHERE ID_SYSTEM='+IntToStr(FilterIdSystem);
       end;
end;

procedure TfrmSchMain.N26Click(Sender: TObject);
begin
     if CheckLinearView.Checked
     then CheckLinearView.Checked:=false
     else CheckLinearView.Checked:=true;
     RefreshToolButtonClick(Self);
end;

procedure TfrmSchMain.FormShow(Sender: TObject);
var date_str:string;
    TempdataSet:TpFibDataSet;
    i:integer;
begin
       TempdataSet:=TpFibDataSet.Create(self);
       TempdataSet.Database:=WorkDatabase;
       TempdataSet.Transaction:=ReadTransaction;
       TempdataSet.SQLs.SelectSQL.Text:='SELECT * FROM  PUB_SYS_DATA';

       TempdataSet.Open;

       //заполнение настроек системы
       SchLevelCount:=TempdataSet.FieldByName('MAX_SCH_LEVEL_COUNT').AsInteger;
       INFINITY_DATE:=TempdataSet.FieldByName('INFINITY_DATE').AsDateTime;

       if (ActualDate=0) then ActualDate:=TempdataSet.FieldByName('MAIN_BOOK_DATE').AsDateTime;

       TempdataSet.Close;
       TempdataSet.Free;



       dateTimetostring(date_str,'dd.mm.yyyy', ActualDate);
       if MasterSchDataSet.Active then MasterSchDataSet.Close;
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
          cbYear.Items.Add(TRIM(IntToStr(1996+i)));
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

       caption:=Spr_title+' на '+ date_str;
       SchTreeView.BeginUpdate;
       if SchTreeDataSet.Active then  SchTreeDataSet.Close;
       SchTreeDataSet.SelectSQL.Text:=GetMainSql;
       SchTreeDataSet.Open;

       if SchTreeView.FocusedNode<>nil then SchTreeView.TopVisibleIndex:=SchTreeView.FocusedNode.Index;
       SchTreeView.EndUpdate;

       if (LocateId>0)  then  LocateSch(LocateId)
                        else  SchTreeDataSet.First;
end;

procedure TfrmSchMain.SchTreeViewDblClick(Sender: TObject);
begin
    ChooseButtonClick(Self);
end;

procedure TfrmSchMain.SchTreeViewExpanding(Sender: TObject;
  ANode: TcxTreeListNode; var Allow: Boolean);
begin
  SchTreeView.FocusedNode:=ANode;
end;

procedure TfrmSchMain.ToolButton1Click(Sender: TObject);
begin
  ToolButton13Click(self);
end;

procedure TfrmSchMain.ToolButton2Click(Sender: TObject);
begin                      
  Close;
end;

constructor TfrmSchMain.Create(AOwner: TComponent; DBhandle: TISC_DB_HANDLE; Book_Date: TDateTime;
                               Id_sys_uch, id_sch: integer; In_sch_in_credit: Integer);
begin
      inherited Create(AOwner);
      {Флаг который задает источник информации для справочника}
      SelectMode:=3;
      {Настройка работы справочника}
      self.ActualDate         :=Book_Date;
      self.Root               :=1;
      self.id_sch_in          :=Id_sch;
      self.In_sch_in_credit   :=In_sch_in_credit;
      self.FilterIdSystem     :=Id_sys_uch;
      CurFS                   :=fsNormal;
      Self.WorkDatabase.Handle:=DBHandle;
      Self.FormStyle          :=fsNormal;
      ExtractAllFlag          :=true;

      {Настройка интерфейса справочника}
      SchTreeView.OptionsSelection.MultiSelect:=false;
      SchTreeView.PopupMenu       :=nil;
      ChooseButton.Enabled        :=true;
      AddToolButton.Enabled       :=false;
      DelToolButton.Enabled       :=false;
      EditToolButton.Enabled      :=false;
      PropButton.Enabled          :=false;
      OperButton.Enabled          :=false;
      //cbMonth.Enabled             :=false;
      //cbYear.Enabled              :=false;
end;

procedure TfrmSchMain.GetActionExecute(Sender: TObject);
begin
     ChooseButton.OnClick(self);
end;

procedure TfrmSchMain.N27Click(Sender: TObject);
var Proc:TpFibStoredProc;
    FindItem:Integer;
begin
    if (SchTreeDataSet.RecordCount>0)
    then begin
              if (not SchTreeView.FocusedNode.HasChildren)
              then begin
                          if (SchTreeDataSet.FieldByName('ID_SYSTEM').AsInteger=1)
                          then begin
                                    Proc:=TpFibStoredProc.Create(self);
                                    Proc.Database:=WorkDatabase;
                                    Proc.Transaction:=WriteTransaction;
                                    WriteTransaction.StartTransaction;
                                    Proc.StoredProcName:='MBOOK_MOVE_SCH_UNDER_SPR';
                                    Proc.Prepare;
                                    Proc.ParamByName('ID_SCH').Value     :=SchTreeDataSet.FieldByName('ID_SCH').Value;
                                    Proc.ParamByName('MOVE_MODE').Value  :=2;
                                    Proc.ParamByName('ID_USER').Value    :=0;
                                    Proc.ExecProc;
                                    if (Proc.ParamByName('RESULT').AsInteger=1)
                                    then WriteTransaction.Commit
                                    else begin
                                              ShowMessage(Proc.ParamByName('LOG_MESSAGE').AsString);
                                              WriteTransaction.Rollback;
                                    end;

                                    FindItem:=SchTreeDataSet.FieldByName('ID_SCH').Value;
                                    SchTreeDataSet.CloseOpen(true);
                                    Proc.Free;
                                    LocateSch(FindItem);
                          end
                          else ShowMessage('Цю функцію не можна використовувати для рахунка!');
              end
              else ShowMessage('Цю функцію не можна використовувати для рахунка!');
    end;
end;

procedure TfrmSchMain.FormCreate(Sender: TObject);
var SysInfoQuery:TpFibDataSet;
begin
     SysInfoQuery            :=TpFibDataSet.Create(self);
     SysInfoQuery.Database   :=WorkDatabase;
     SysInfoQuery.Transaction:=ReadTransaction;
     SysInfoQuery.SelectSQL.Text:='select use_mo from pub_sys_data';
     SysInfoQuery.Open;
     if SysInfoQuery.RecordCount>0
     then begin
               if   SysInfoQuery.FBN('use_mo').Value<>null
               then use_mo:=SysInfoQuery.FBN('use_mo').Value
               else use_mo:=0;
     end;
     SysInfoQuery.Close;
     SysInfoQuery.Free;
end;

procedure TfrmSchMain.EscExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmSchMain.PopupCopyPropClick(Sender: TObject);
var
  T:TfrmCopyProp;
begin
  if  (SchTreeDataSet.FieldByName('TYPE_OBJECT').asInteger>=2)
  then begin
      T:=TfrmCopyProp.Create(self, WorkDataBase.Handle, SchTreeDataSet.FieldByName('ID_SCH').AsInteger, ActualDate);
      T.Caption:=T.Caption+'  '+SchTreeDataSet.FieldByName('SCH_NUMBER').AsString;
      T.cxLabel3.Caption:=SchTreeDataSet.FieldByName('SCH_TITLE').AsString;
      T.cxLabel4.Caption:=SchTreeDataSet.FieldByName('SCH_NUMBER').AsString;
      T.ShowModal;
      T.Free;
  end
  else
      ShowMessage('Для цього рівня операція не виконується.'+#13+'Оберіть нижчий рівень.');
end;

procedure TfrmSchMain.actGetIDExecute(Sender: TObject);
begin
    ShowMessage('SCH_NUMBER  '+cxDBTreeList1cxDBTreeListColumn1.Value+#13+
    'SCH_TITLE      '+cxDBTreeList1cxDBTreeListColumn2.Value+#13+
    'ID                   '+inttostr(SchTreeViewcxDBTreeListColumn5.Value));
end;

end.
