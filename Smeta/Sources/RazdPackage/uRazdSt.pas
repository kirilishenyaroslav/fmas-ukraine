unit uRazdSt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, FIBDatabase, pFIBDatabase,Resources_unitb,
  ImgList,pFibDataSet, StdCtrls, dateUtils, Menus,pFibStoredProc, Buttons,
  ExtCtrls,Ibase, GlobalSpr, DB, Halcn6db, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxMaskEdit, cxInplaceContainer, cxDBTL, cxControls,
  cxTLData, FIBDataSet, cxTextEdit, cxCheckBox, Placemnt, frxClass,
  frxDBSet, cxContainer, cxEdit, cxDropDownEdit, frxExportPDF,
  frxExportXML, frxExportXLS, frxExportHTML, frxExportTXT, ActnList;

  resourcestring
    Spr_title='Довідник розділів/статей доходів і видатків';

type

  TfrmRazdSt = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    DelButton: TToolButton;
    UpdateButton: TToolButton;
    ChooseButton: TToolButton;
    WorkPopup: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N10: TMenuItem;
    N6: TMenuItem;
    N15: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N14: TMenuItem;
    N9: TMenuItem;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    SmallImages: TImageList;
    WorkDatabase: TpFIBDatabase;
    ToolBar2: TToolBar;
    RefreshButton: TToolButton;
    PropButton: TToolButton;
    CloseButton: TToolButton;
    OpenDialog1: TOpenDialog;
    RazdDbfDataSet: THalcyonDataSet;
    RazdStTreeView: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn;
    SchTreeViewcxDBTreeListColumn1: TcxDBTreeListColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle5: TcxStyle;
    SchTreeViewcxDBTreeListColumn2: TcxDBTreeListColumn;
    RazdDataSet: TpFIBDataSet;
    RazdDataSource: TDataSource;
    RazdStTreeViewcxDBTreeListColumn1: TcxDBTreeListColumn;
    cxStyle4: TcxStyle;
    RazdStTreeViewcxDBTreeListColumn2: TcxDBTreeListColumn;
    FormStorage1: TFormStorage;
    ToolButton2: TToolButton;
    frxDBDataset1: TfrxDBDataset;
    PrintDataSet: TpFIBDataSet;
    Panel1: TPanel;
    Label2: TLabel;
    cbMode: TcxComboBox;
    RazdStTreeViewcxDBTreeListColumn3: TcxDBTreeListColumn;
    cxStyle3: TcxStyle;
    cxStyle6: TcxStyle;
    frxReport1: TfrxReport;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxPDFExport1: TfrxPDFExport;
    ToolButton3: TToolButton;
    ActionList1: TActionList;
    Action1: TAction;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DelButtonClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure ChooseButtonClick(Sender: TObject);
    procedure cbMonthChange(Sender: TObject);
    procedure cbModeChange(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure RazdStTreeViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RazdStTreeViewExpanding(Sender: TObject;
      ANode: TcxTreeListNode; var Allow: Boolean);
    procedure RazdStTreeViewCollapsing(Sender: TObject;
      ANode: TcxTreeListNode; var Allow: Boolean);
    procedure FormShow(Sender: TObject);
    procedure RazdStTreeViewStylesGetContentStyle(Sender, AItem: TObject;
      ANode: TcxTreeListNode; var AStyle: TcxStyle);
    procedure PropButtonClick(Sender: TObject);
    procedure RazdStTreeViewDblClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     INFINITY_DATE:TdateTime;
     ActualDate:TDateTime;
     SchLevelCount:Integer;
     FlagMultiSelect:Boolean;
     ResultValue:Variant;
     Root:Int64;
     CurFS:TFormStyle;
     Mode:TRazdStViewMode;
     ChooseMode:TRazdStChMode;
     constructor Create(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;         FS:TFormStyle; Book_Date:TDateTime;Root:Int64;Mode:TRazdStViewMode;Choose:TRazdStChMode); overload;
  end;


function GetSprMDI(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle; Book_Date:TDateTime;Root:Int64;Mode:TRazdStViewMode;Choose:TRazdStChMode):Variant;stdcall;
function GetSprModal(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle; Book_Date:TDateTime;Root:Int64;Mode:TRazdStViewMode;Choose:TRazdStChMode):Variant;stdcall

exports GetSprMDI,GetSprModal;

implementation

uses  uEditrazdSt, BaseTypes, UGetPrintDate;
{$R *.dfm}
function GetSprModal(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle; Book_Date:TDateTime;Root:Int64;Mode:TRazdStViewMode;Choose:TRazdStChMode):Variant;
var T:TfrmRazdSt;
    Res:Variant;
begin
    T:=TfrmRazdSt.Create(AOwner,DBHandle,FS,Book_Date,Root,Mode,Choose);
    T.ShowModal;
    Res:=T.ResultValue;
    T.Free;
    GetSprModal:=Res;
end;

function GetSprMDI(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle; Book_Date:TDateTime;Root:Int64;Mode:TRazdStViewMode;Choose:TRazdStChMode):Variant;
var f:Boolean;
    i:integer;
begin
            f :=true;
            for i:=0 to Application.MainForm.MDIChildCount-1 do
            begin
                 if (Application.MainForm.MDIChildren[i] is TfrmRazdSt)
                 then begin
                                   Application.MainForm.MDIChildren[i].BringToFront;
                                   f:=false;
                 end;
            end;
            if f then TfrmRazdSt.Create(AOwner,DBHandle,FS,Book_Date,Root,Mode,Choose);
            Result:=0;
end;

constructor TfrmRazdSt.Create(AOwner: TComponent;DBHandle:TISC_DB_HANDLE;
  FS: TFormStyle; Book_Date: TDateTime; Root: Int64;Mode:TRazdStViewMode;
  Choose:TRazdStChMode);
var Date_str:String;
begin
      inherited Create(AOwner);
      Self.WorkDatabase.Handle:=DBhandle;
      self.Mode:=Mode;
      ChooseMode:=Choose;
      ActualDate:=Book_Date;
      CurFS:=FS;
      self.FormStyle:=FS;
      if (CurFS=fsNormal)
      then begin
         ChooseButton.Enabled:=true;
         N15.Enabled:=true;
         AddButton.Enabled:=false;
         DelButton.Enabled:=false;
         UpdateButton.Enabled:=false;
         PropButton.Enabled:=false;
         N1.Enabled:=false;
         N2.Enabled:=false;
         N3.Enabled:=false;
         N12.Enabled:=false;
      end;

     dateTimetostring(Date_str,'dd.mm.yyyy', ActualDate);

     case Mode of
                allData   : begin
                                 self.Root:=0;
                                 if (ChooseMode=cmRazd)
                                 then begin
                                           RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT('+IntToStr(Root)+') WHERE IS_RAZDEL=1 '+
                                           ' ORDER BY RAZD_ST_NUM, PROFITABLE';
                                 end
                                 else begin
                                           RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT('+IntToStr(Root)+')  '+
                                           ' ORDER BY RAZD_ST_NUM, PROFITABLE';
                                 end;
                                 cbMode.ItemIndex:=0;
                           end;
             allEnable    : begin
                                 self.Root:=0;

                                 if (ChooseMode=cmRazd)
                                 then begin
                                           RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT('+IntToStr(Root)+') WHERE IS_RAZDEL=1  '+
                                           ' AND ENABLE=1 ORDER BY RAZD_ST_NUM, PROFITABLE';
                                 end
                                 else begin
                                           RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT('+IntToStr(Root)+') '+
                                           ' WHERE ENABLE=1 ORDER BY RAZD_ST_NUM, PROFITABLE';
                                 end;
                                 cbMode.ItemIndex:=1;
                           end;
         allEnableProfit   : begin
                                   self.Root:=0;
                                   if (ChooseMode=cmRazd)
                                   then begin
                                             RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT('+IntToStr(Root)+') WHERE IS_RAZDEL=1 '+
                                             ' AND PROFITABLE=1 ORDER BY RAZD_ST_NUM, PROFITABLE';
                                   end
                                   else begin
                                             RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT('+IntToStr(Root)+') '+
                                             ' WHERE PROFITABLE=1 ORDER BY RAZD_ST_NUM, PROFITABLE';
                                   end;
                                   cbMode.ItemIndex:=1;
                           end;
          allEnableValid   : begin
                                   self.Root:=0;
                                   if (ChooseMode=cmRazd)
                                   then begin
                                             RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT('+IntToStr(Root)+') WHERE IS_RAZDEL=1 '+
                                             ' AND IS_VALID=1 AND ENABLE=1 ORDER BY RAZD_ST_NUM, PROFITABLE';
                                   END
                                   ELSE BEGIN
                                             RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT('+IntToStr(Root)+')  '+
                                             ' WHERE IS_VALID=1 AND ENABLE=1 ORDER BY RAZD_ST_NUM, PROFITABLE';
                                   end;
                                   cbMode.ItemIndex:=2;
                           end;
   allEProfitUnderBudget : begin
                           RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT_UNDER_BU(1,'+IntToStr(Root)+') ';
                           cbMode.Visible:=false;
                           end;
 allENotProfitUnderBudget: begin
                           RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT_UNDER_BU(0,'+IntToStr(Root)+') ';
                           cbMode.Visible:=false;
                           end;
      allNotExistInPlan  : begin
                           RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RZD_ST_SELECT_UNDER_BU2('+IntToStr(Root)+') ';
                           cbMode.Visible:=false;
                           RazdStTreeView.OptionsSelection.MultiSelect:=true;
                           end;
       allExistInPlan    : begin
                           RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RZD_ST_SELECT_UNDER_BU3('+IntToStr(Root)+') ';
                           cbMode.Visible:=false;
                           RazdStTreeView.OptionsSelection.MultiSelect:=false;
                           end;
        allExistInPlanSt : begin
                           RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RZD_ST_SELECT_UNDER_BU4('+IntToStr(Root)+') ';
                           cbMode.Visible:=false;
                           RazdStTreeView.OptionsSelection.MultiSelect:=false;
                           end;
        allRazdOnly      : begin
                           self.Root:=0;
                           RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT('+IntToStr(Root)+') '+
                           ' WHERE IS_RAZDEL=1 AND ENABLE=1 ORDER BY RAZD_ST_NUM, PROFITABLE';
                           cbMode.Visible:=false;
                           end;

     end;

      RazdStTreeView.BeginUpdate;
      RazdDataSet.Open;
      RazdDataSet.First;
      RazdStTreeView.FullCollapse;
      RazdStTreeView.EndUpdate;

      RazdStTreeView.RestoreFromRegistry('Software\Budgeting\SprRazdSt',false,false);


      PrintDataSet.SelectSQL.Text:='SELECT * FROM PUB_SPR_RAZD_ST_SELECT_PRINT(-1) ORDER BY SHOW_ID ASC';
end;



procedure TfrmRazdSt.SpeedButton1Click(Sender: TObject);
begin
      RazdStTreeView.FullExpand;
end;

procedure TfrmRazdSt.SpeedButton2Click(Sender: TObject);
begin
      RazdStTreeView.FullCollapse;
end;

procedure TfrmRazdSt.SpeedButton3Click(Sender: TObject);
begin
      RazdStTreeView.FocusedNode.Expand(false);
end;

procedure TfrmRazdSt.SpeedButton4Click(Sender: TObject);
begin
      RazdStTreeView.FocusedNode.Collapse(false);
end;

procedure TfrmRazdSt.AddButtonClick(Sender: TObject);
var T:TfrmEditRazdSt;
begin
   if (RazdDataSet.FieldByName('IS_RAZDEL').AsInteger<>0)
   then begin
          T:=TfrmEditRazdSt.Create(self);
          T.ShowModal;
          T.Free;
   end
   else begin
          MessageBox(Handle,PChar(BU_CountLevelError),PChar(BU_WarningCaption),MB_OK AND MB_ICONERROR);
   end;
end;

procedure TfrmRazdSt.UpdateButtonClick(Sender: TObject);
var T:TfrmEditRazdSt;
begin
    if RazdDataSet.RecordCount>0
    then begin
          T:=TfrmEditRazdSt.Create(self);
          T.EditFlag:=true;
          T.ShowModal;
          T.Free;
    end;
end;

procedure TfrmRazdSt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     RazdStTreeView.StoreToRegistry('Software\Budgeting\SprRazdSt',true);
     Action:=caFree;
end;

procedure TfrmRazdSt.DelButtonClick(Sender: TObject);
var Proc:TpFibStoredProc;
    id:integer;
begin
if RazdStTreeView.FocusedNode.Parent<>nil
then begin
          if (RazdDataSet.FieldByName('IS_RAZDEL').Value=1)
                     then begin
                               ShowMessage('Увага! Ви намагаєтеся видалити розділ! Вся структура розділу буде втрачена!');
                     end;

          if (BaseTypes.agMessageDlg(BU_WarningCaption,BU_DeleteConfirmation+' '+RazdStTreeView.FocusedNode.Texts[2],mtWarning,[mbYes,mbNo])=mrYes)
          then begin
                     try
                             Proc:=TpFibStoredProc.Create(self);
                             Proc.Database:=WorkDatabase;
                             Proc.Transaction:=WriteTransaction;
                             Proc.StoredProcName:='PUB_RAZD_ST_DELETE';
                             Proc.Transaction.StartTransaction;
                             Proc.Prepare;
                             id:=RazdDataSet.FieldByName('LINKTO').Value;
                             Proc.ParamByName('P_ID_RAZD_ST').Value:=RazdDataSet.FieldByName('ID_RAZD_ST').Value ;
                             Proc.ExecProc;
                             Proc.Transaction.Commit;
                             Proc.Free;
                             RazdDataSet.CacheDelete;
                             RazdDataSet.Locate('ID_RAZD_ST',id,[]);
                             except on E:Exception do
                                    begin
                                         ShowMessage(e.Message);
                                    end;
                    end;
          end;
end;
end;

procedure TfrmRazdSt.N1Click(Sender: TObject);
begin
   AddButton.OnClick(self);
end;

procedure TfrmRazdSt.N2Click(Sender: TObject);
begin
     UpdateButton.OnClick(self);
end;

procedure TfrmRazdSt.N3Click(Sender: TObject);
begin
     DelButton.OnClick(self);
end;

procedure TfrmRazdSt.N6Click(Sender: TObject);
begin
     RefreshButton.OnClick(self);
end;

procedure TfrmRazdSt.N15Click(Sender: TObject);
begin
  ChooseButton.OnClick(self);
end;

procedure TfrmRazdSt.N12Click(Sender: TObject);
begin
  PropButton.OnClick(self);
end;

procedure TfrmRazdSt.N9Click(Sender: TObject);
begin
   CloseButton.OnClick(self);
end;

procedure TfrmRazdSt.RefreshButtonClick(Sender: TObject);
var Date_str:String;
    id:Integer;
begin
     dateTimetostring(Date_str,'dd.mm.yyyy', ActualDate);
     id:=0;

     if RazdDataSet.Active
     then begin
          if RazdDataSet.RecordCount>0 then id:=RazdDataSet.FieldByName('ID_RAZD_ST').AsInteger;
          RazdDataSet.Close;
     end;

     case Mode of
          allData        : begin
                           RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT('+IntToStr(Root)+') '+
                           ' ORDER BY RAZD_ST_NUM, PROFITABLE';
                           cbMode.ItemIndex:=0;
                           end;
          allEnable      : begin
                           RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT('+IntToStr(Root)+') '+
                           ' WHERE ENABLE=1 ORDER BY RAZD_ST_NUM, PROFITABLE';
                           cbMode.ItemIndex:=1;
                           end;
      allEnableValid     : begin
                           RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT('+IntToStr(Root)+') '+
                           ' WHERE IS_VALID=1 AND ENABLE=1 ORDER BY RAZD_ST_NUM, PROFITABLE';
                           cbMode.ItemIndex:=2;
                           end;
   allEProfitUnderBudget : begin
                           RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT_UNDER_BU(1,'+IntToStr(Root)+') ';
                           cbMode.Visible:=false;
                           end;
 allENotProfitUnderBudget: begin
                           RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT_UNDER_BU(0,'+IntToStr(Root)+') ';
                           cbMode.Visible:=false;
                           end;
      allNotExistInPlan  : begin
                           RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RZD_ST_SELECT_UNDER_BU2 ('+IntToStr(Root)+') ';
                           cbMode.Visible:=false;
                           RazdStTreeView.OptionsSelection.MultiSelect:=true;
                           end;
       allExistInPlan    : begin
                           RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RZD_ST_SELECT_UNDER_BU3 ('+IntToStr(Root)+') ';
                           cbMode.Visible:=false;
                           RazdStTreeView.OptionsSelection.MultiSelect:=false;
                           end;
        allExistInPlanSt : begin
                           RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RZD_ST_SELECT_UNDER_BU4 ('+IntToStr(Root)+') ';
                           cbMode.Visible:=false;
                           RazdStTreeView.OptionsSelection.MultiSelect:=false;
                           end;
              allRazdOnly : begin
                           self.Root:=0;
                           RazdDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT('+IntToStr(Root)+') '+
                           ' WHERE IS_RAZDEL=1 AND ENABLE=1 ORDER BY RAZD_ST_NUM, PROFITABLE';
                           cbMode.Visible:=false;
                           end;

      end;
      RazdStTreeView.BeginUpdate;
      RazdDataSet.Open;
      if id>0 then RazdDataSet.Locate('ID_RAZD_ST',id,[]);
      RazdStTreeView.EndUpdate;
end;

procedure TfrmRazdSt.ChooseButtonClick(Sender: TObject);
var i:Integer;
begin
if (RazdDataSet.RecordCount>0)
then begin
                         if (RazdDataSet.FieldByName('IS_RAZDEL').AsInteger=1)
                         and (ChooseMode=cmRazd)
                         then begin
                                    if RazdStTreeView.SelectionCount=1
                                    then ResultValue:=RazdDataSet.FieldByName('ID_RAZD_ST').Value
                                    else begin
                                               ResultValue:=VarArrayCreate([0,RazdStTreeView.SelectionCount-1],varInteger);
                                               for i:=0 to RazdStTreeView.SelectionCount-1 do
                                               begin
                                                    ResultValue[i]:=RazdStTreeView.Selections[i].Texts[6];
                                               end;
                                    end;
                                    ModalResult:=mrOk;
                         end;
                         if (RazdDataSet.FieldByName('IS_RAZDEL').AsInteger=0)
                         and (ChooseMode=cmRazd)
                         then begin
                              MessageBox(Handle,PChar(BU_ChooseRzError),PChar(BU_WarningCaption),MB_OK and MB_ICONWARNING);
                              Exit;
                         end;
                         if (RazdDataSet.FieldByName('IS_RAZDEL').AsInteger=0)
                         and (ChooseMode=cmSt)
                         then begin
                              ResultValue:=RazdDataSet.FieldByName('ID_RAZD_ST').Value;
                              ModalResult:=mrOk;
                         end;
                         if (RazdDataSet.FieldByName('IS_RAZDEL').AsInteger=1)
                         and (ChooseMode=cmSt)
                         then begin
                              MessageBox(Handle,PChar(BU_ChooseStError),PChar(BU_WarningCaption),MB_OK and MB_ICONWARNING);
                              Exit;
                         end;
end;
end;

procedure TfrmRazdSt.cbMonthChange(Sender: TObject);
begin
     RefreshButton.OnClick(self);
end;

procedure TfrmRazdSt.cbModeChange(Sender: TObject);
begin
     if cbMode.ItemIndex=0 then Mode:=allData;
     if cbMode.ItemIndex=1 then Mode:=allEnable;
     if cbMode.ItemIndex=2 then Mode:=allEnableValid;
     RefreshButton.OnClick(self);
end;

procedure TfrmRazdSt.CloseButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmRazdSt.ToolButton1Click(Sender: TObject);
var i:Integer;
    ImportStoredProc:TpFibStoredProc;
begin
     if OpenDialog1.Execute and FileExists(OpenDialog1.FileName)
     then begin
          ImportStoredProc:=TpFibStoredProc.Create(self);
          ImportStoredProc.Database:=WorkDatabase;
          ImportStoredProc.Transaction:=WriteTransaction;
          WriteTransaction.StartTransaction;
          ImportStoredProc.StoredProcName:='PUB_RAZD_ST_IMPORT';
          ImportStoredProc.Prepare;

          RazdDbfDataSet.DatabaseName:=ExtractFilePath(OpenDialog1.FileName);
          RazdDbfDataSet.TableName   :=ExtractFileName(OpenDialog1.FileName);
          RazdDbfDataSet.Open;
          RazdDbfDataSet.First;
          for i:=0 to RazdDbfDataSet.RecordCount-1 do
          begin
              ImportStoredProc.ParamByName('KOD_RAZ').Value     :=RazdDbfDataSet.FieldByName('KOD_RAZ').Value;
              ImportStoredProc.ParamByName('KOD_ST').Value      :=RazdDbfDataSet.FieldByName('KOD_ST').Value;
              ImportStoredProc.ParamByName('NAME').Value        :=RazdDbfDataSet.FieldByName('NAME').Value;
              ImportStoredProc.ParamByName('PROFITABLE').Value  :=RazdDbfDataSet.FieldByName('PROFITABLE').Value;
              ImportStoredProc.ParamByName('ENABLE').Value      :=RazdDbfDataSet.FieldByName('ENABLE').Value;
              ImportStoredProc.ParamByName('PL_BY_RAZ').Value   :=RazdDbfDataSet.FieldByName('PL_BY_RAZ').Value;
              ImportStoredProc.ParamByName('PL_BY_RAZ').Value   :=RazdDbfDataSet.FieldByName('PL_BY_RAZ').Value;
              ImportStoredProc.ParamByName('KOD_R').Value       :=RazdDbfDataSet.FieldByName('KOD_R').Value;
              ImportStoredProc.ExecProc;

              RazdDbfDataSet.Next;
          end;

          WriteTransaction.Commit;
          ImportStoredProc.Free;
     end;
end;

procedure TfrmRazdSt.RazdStTreeViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (KEY=VK_LEFT)
  THEN BEGIN
       if RazdStTreeView.FocusedNode<>nil
       then RazdStTreeView.FocusedNode.Collapse(true);
  END;
  if (KEY=VK_RIGHT)
  THEN BEGIN
       if RazdStTreeView.FocusedNode<>nil
       then RazdStTreeView.FocusedNode.Expand(false);
  END;

end;

procedure TfrmRazdSt.RazdStTreeViewExpanding(Sender: TObject;
  ANode: TcxTreeListNode; var Allow: Boolean);
begin
  RazdStTreeView.FocusedNode:=ANode;
end;

procedure TfrmRazdSt.RazdStTreeViewCollapsing(Sender: TObject;
  ANode: TcxTreeListNode; var Allow: Boolean);
begin
    RazdStTreeView.FocusedNode:=ANode;
end;

procedure TfrmRazdSt.FormShow(Sender: TObject);
begin
    RazdStTreeView.BeginUpdate;
    RazdStTreeView.FullCollapse;
    RazdStTreeView.EndUpdate;
end;

procedure TfrmRazdSt.RazdStTreeViewStylesGetContentStyle(Sender,
  AItem: TObject; ANode: TcxTreeListNode; var AStyle: TcxStyle);
begin
  if ANode.Texts[5]='1'
  then begin
            if ANode.Texts[7]='1'
            then AStyle:=cxStyle1
            else AStyle:=cxStyle3;
  end
  else begin
            if ANode.Texts[7]='1'
            then AStyle:=cxStyle2
            else AStyle:=cxStyle6;
  end;          
end;

procedure TfrmRazdSt.PropButtonClick(Sender: TObject);
begin
if RazdDataSet.RecordCount>0
     then GetPropByObj(self.owner,WorkDatabase.Handle,
     RazdDataSet.FieldByName('ID_RAZD_ST').AsInteger,ActualDate,ptRazdSt);
end;

procedure TfrmRazdSt.RazdStTreeViewDblClick(Sender: TObject);
begin
     ChooseButtonClick(self);
end;

procedure TfrmRazdSt.ToolButton2Click(Sender: TObject);
var T:TfrmPrintConfigure;
begin
     T:=TfrmPrintConfigure.Create(self, WorkDatabase.Handle);
     if T.ShowModal=mryes
     then begin
               if PrintDataSet.Active
               then PrintDataSet.Close;

               if T.cxCheckBox1.Checked
               then begin
                         if RazdDataSet.FieldByName('IS_RAZDEL').asInteger=1
                         then PrintDataSet.SelectSQL.Text:='SELECT * FROM PUB_SPR_RAZD_ST_SELECT_PRINT(-1,'+''''+DateToStr(T.cxDateEdit1.Date)+''''+',1,'+RazdDataSet.FieldByName('ID_RAZD_ST').AsString +') ORDER BY SHOW_ID ASC'
                         else PrintDataSet.SelectSQL.Text:='SELECT * FROM PUB_SPR_RAZD_ST_SELECT_PRINT(-1,'+''''+DateToStr(T.cxDateEdit1.Date)+''''+',1,'+RazdDataSet.FieldByName('LINKTO').AsString +') ORDER BY SHOW_ID ASC';
               end
               else begin
                         PrintDataSet.SelectSQL.Text:='SELECT * FROM PUB_SPR_RAZD_ST_SELECT_PRINT(-1,'+''''+DateToStr(T.cxDateEdit1.Date)+''''+',0,0) ORDER BY SHOW_ID ASC';
               end;

               PrintDataSet.Open;

               frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\ReportSprRazdSt.fr3',true);
               frxReport1.Variables['ADATE']:=''''+datetostr(t.cxDateEdit1.Date)+'''';
               frxReport1.PrepareReport(true);
               frxReport1.ShowPreparedReport;
     end;
     T.Free;
end;

procedure TfrmRazdSt.ToolButton3Click(Sender: TObject);
     var CloneSP:TpFibStoredProc;
         id:Integer;
         new_num:Integer;
begin
     if Application.MessageBox('Ви дійсно хочете клонувати запис?','Увага!',MB_YESNO+MB_ICONWARNING)=IDYES
     then begin
               if (RazdDataSet.RecordCount>0)
               then begin
                         if (RazdDataSet.FieldByName('IS_RAZDEL').AsInteger in [0,1])
                         then begin
                                  //PUB_SPR_RAZD_ST_CLONE
                                  CloneSP:=TpFibStoredProc.Create(self);
                                  CloneSP.Database:=WorkDatabase;
                                  CloneSP.Transaction:=WriteTransaction;

                                  WriteTransaction.StartTransaction;
                                  CloneSP.StoredProcName:='PUB_SPR_RAZD_ST_CLONE';
                                  CloneSP.Prepare;
                                  CloneSP.ParamByName('ID_RAZD_ST_IN').Value:=RazdDataSet.FieldByName('ID_RAZD_ST').Value;
                                  if RazdDataSet.FieldByName('IS_RAZDEL').Value=1
                                  then new_num:=StrToInt(InputBox('Клонування розділа','Ви клонуєте розділ з номером! Треба ввести номер нового розділу.',RazdDataSet.FieldByName('RAZD_ST_NUM').AsString))
                                  else new_num:=StrToInt(InputBox('Клонування статті','Ви клонуєте статтю з номером! Треба ввести номер нової статті.',RazdDataSet.FieldByName('RAZD_ST_NUM').AsString));
                                  CloneSP.ParamByName('NEW_NUM').Value      :=new_num;

                                  CloneSP.ExecProc;
                                  id:= CloneSP.ParamByName('ID_RAZD_ST_OUT').Value;
                                  WriteTransaction.Commit;
                                  RazdDataSet.CloseOpen(true);
                                  CloneSP.Free;
                                  RazdDataSet.Locate('ID_RAZD_ST', id, []);

                         end
                         else ShowMessage('Цей запис клонувати не можливо!');
               end;
     end;
end;

procedure TfrmRazdSt.Action1Execute(Sender: TObject);
begin
      ChooseButtonClick(self);
end;

end.
