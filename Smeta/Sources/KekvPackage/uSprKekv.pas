unit uSprKekv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, FIBDatabase, pFIBDatabase,
  ImgList,pFibDataSet, StdCtrls, dateUtils, Menus,pFibStoredProc, Buttons,
  ExtCtrls, IBase, GlobalSpr, Resources_unitb,
  ActnList, Placemnt, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls,
  cxInplaceContainer, cxTLData, cxDBTL, DB, FIBDataSet, cxMaskEdit,
  cxCheckBox, cxTextEdit, cxContainer, cxEdit, cxDropDownEdit;

type


  TfrmKekvSprBPL = class(TForm)
    KekvImageList: TImageList;
    WorkPopup: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N10: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N15: TMenuItem;
    N8: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N14: TMenuItem;
    N9: TMenuItem;
    SmallImages: TImageList;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    CoolBar2: TCoolBar;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    DelButton: TToolButton;
    UpdateButton: TToolButton;
    ToolBar3: TToolBar;
    ChooseButton: TToolButton;
    RefreshButton: TToolButton;
    ToolButton9: TToolButton;
    PropButton: TToolButton;
    CloseButton: TToolButton;
    ActionList1: TActionList;
    Action1: TAction;
    FormStorage1: TFormStorage;
    Action2: TAction;
    Panel2: TPanel;
    Label1: TLabel;
    KekvDataSet: TpFIBDataSet;
    KekvDataSource: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    KekvTreeList: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn;
    cxStyle2: TcxStyle;
    cbMonth: TcxComboBox;
    cbYear: TcxComboBox;
    KekvTreeListcxDBTreeListColumn1: TcxDBTreeListColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure ChooseButtonClick(Sender: TObject);
    procedure FilterButtonClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure PropButtonClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure KekvTreeViewDblClick(Sender: TObject);
    procedure cbMonthPropertiesChange(Sender: TObject);
    procedure cbYearPropertiesChange(Sender: TObject);
    procedure KekvTreeListExpanding(Sender: TObject;
      ANode: TcxTreeListNode; var Allow: Boolean);
    procedure KekvTreeListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    chflag:Boolean;
  public
     GConnection:TConfigConnStructure;
     INFINITY_DATE:TdateTime;
     ActualDate:TDateTime;
     SchLevelCount:Integer;
     FlagMultiSelect:Boolean;
     ResultValue:Variant;
     Root:Integer;
     CurFS:TFormStyle;
     constructor Create(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;         FS:TFormStyle; Book_Date:TDateTime;Root:Integer); overload;

    { Public declarations }
  end;

  function GetSprMdi(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime; Root:Integer):integer;stdcall;
  function GetSprModal(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime; Root:Integer):Variant;stdcall;

  exports GetSprMdi, GetSprModal;

{$R *.dfm}

implementation

uses uEditKekv, BaseTypes;

function GetSprMdi(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime; Root:Integer):integer;stdcall;
var i:integer;
      f:Boolean;
begin
            f :=true;
            for i:=0 to Application.MainForm.MDIChildCount-1 do
            begin
                 if (Application.MainForm.MDIChildren[i] is TfrmKekvSprBPL)
                 then begin
                                   Application.MainForm.MDIChildren[i].BringToFront;
                                   f:=false;
                 end;
            end;
            if f then TfrmKekvSprBPL.Create(AOwner,DBHandle,FSmdiChild,Book_Date,Root);
            result:=0;
end;

function GetSprModal(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime; Root:Integer):Variant;stdcall;
var T:TfrmKekvSprBPL;
      Res:variant;
begin
       T:=TfrmKekvSprBPL.Create(AOwner,DBHandle,FSNormal,Book_Date,Root);
       if T.ShowModal=mrYes
       then Res:=T.ResultValue;
       T.Free;
       GetSprModal:=Res;
end;


constructor TfrmKekvSprBPL.Create(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime; Root:Integer);
var
    date_str:string;
    i:integer;

begin
      inherited Create(AOwner);
      chflag:=false;
      Self.WorkDatabase.Handle:=DBHAndle;
      ActualDate:=Book_Date;
      self.Root:=Root;
      CurFS:=FS;
      self.FormStyle:=FS;
      KekvDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_KEKV_SELECT('+''''+DateToStr(Book_Date)+''''+',0)';
      if (CurFS=fsNormal)
      then begin
         KekvDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_KEKV_SELECT('+''''+DateToStr(Book_Date)+''''+',0) WHERE ENABLED=1';
         ChooseButton.Enabled:=true;
         N15.Enabled:=true;
         AddButton.Enabled:=false;
         DelButton.Enabled:=false;
         UpdateButton.Enabled:=false;
         PropButton.Enabled:=false;
         cbMonth.Enabled:=false;
         cbYear.Enabled:=false;
         N1.Enabled:=false;
         N2.Enabled:=false;
         N3.Enabled:=false;
         N4.Enabled:=false;
         N12.Enabled:=false;
      end;
      KekvDataSet.Open;
      KekvTreeList.FocusedNode:=KekvTreeList.Items[0];

     cbMonth.Properties.Items.Add(TRIM(BU_Month_01));
     cbMonth.Properties.Items.Add(TRIM(BU_Month_02));
     cbMonth.Properties.Items.Add(TRIM(BU_Month_03));
     cbMonth.Properties.Items.Add(TRIM(BU_Month_04));
     cbMonth.Properties.Items.Add(TRIM(BU_Month_05));
     cbMonth.Properties.Items.Add(TRIM(BU_Month_06));
     cbMonth.Properties.Items.Add(TRIM(BU_Month_07));
     cbMonth.Properties.Items.Add(TRIM(BU_Month_08));
     cbMonth.Properties.Items.Add(TRIM(BU_Month_09));
     cbMonth.Properties.Items.Add(TRIM(BU_Month_10));
     cbMonth.Properties.Items.Add(TRIM(BU_Month_11));
     cbMonth.Properties.Items.Add(TRIM(BU_Month_12));

     for i:=0 to YEARS_COUNT do
     begin
        cbYear.Properties.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
     end;

     dateTimetostring(date_str,'dd.mm.yyyy', ActualDate);
     caption:='Довідник кодів видатків на '+ date_str;

     cbMonth.ItemIndex:=MonthOf(ActualDate)-1;
     for i:=0 to cbYear.Properties.Items.Count-1 do
     begin
         if pos(cbYear.Properties.Items[i],IntToStr(YearOf(ActualDate)))>0
         then begin
            cbYear.ItemIndex:=i;
            break;
         end;
     end;
      chflag:=true;
end;


procedure TfrmKekvSprBPL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmKekvSprBPL.RefreshButtonClick(Sender: TObject);
var Id_kekv:Int64;
begin
     KekvTreeList.BeginUpdate;
     Id_kekv:=-1;
     if (KekvDataSet.RecordCount>0)
     then Id_kekv:=StrToInt64(KekvDataSet.FieldByName('ID_KEKV').AsString);
     KekvDataSet.Close;
     KekvDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_KEKV_SELECT('+''''+DateToStr(ActualDate)+''''+',0)';
     KekvDataSet.Open;
     KekvDataSet.Locate('Id_kekv',Id_kekv,[]);
     KekvTreeList.EndUpdate;     
end;

procedure TfrmKekvSprBPL.CloseButtonClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmKekvSprBPL.N1Click(Sender: TObject);
begin
  AddButton.OnClick(self);
end;

procedure TfrmKekvSprBPL.AddButtonClick(Sender: TObject);
var T:TfrmEditKekv;
begin
    T:=TfrmEditKekv.Create(self);
    T.EditFlag:=false;
    T.ShowModal;
    T.Free;
end;

procedure TfrmKekvSprBPL.DelButtonClick(Sender: TObject);
var Proc:TpFibStoredProc;
    LinkTo:Integer;
begin
LinkTo:=-1;
if (KekvDataSet.RecordCount>0)
then begin
          if not kekvTreeList.FocusedNode.HasChildren
          then begin
                    if  BaseTypes.agMessageDlg(BU_WarningCaption,BU_DeleteConfirmation,mtWarning,[mbYes,mbNo])=mrYes
                    then begin
                                Proc:=TpFibStoredProc.Create(self);
                                Proc.Database:=WorkDatabase;
                                Proc.Transaction:=WriteTransaction;
                                proc.StoredProcName:='PUB_KEKV_DELETE';
                                WriteTransaction.StartTransaction;
                                try
                                      proc.Prepare;
                                      LinkTo:=KekvDataSet.FieldByName('LINKTO').Value;
                                      proc.ParamByName('P_ID_KEKV').asInt64:=StrToInt64(KekvDataSet.FieldByName('ID_KEKV').asstring);
                                      proc.ParamByName('P_USE_END').Value:=ActualDate;
                                      proc.ExecProc;
                                      KekvDataSet.CacheDelete;
                                except on E:Exception do
                                      begin
                                            Showmessage(E.Message);
                                      end;
                                end;
                                WriteTransaction.Commit;
                                KekvTreeList.BeginUpdate;
                                KekvDataSet.Locate('ID_KEKV',linkto,[]);
                                KekvTreeList.EndUpdate;
                    end;
          end
          else begin
                    MessageBox(Application.Handle,PChar(BU_HasChildError),PChar(BU_WarningCaption),MB_OK and MB_ICONWARNING);
          end;
end;

end;

procedure TfrmKekvSprBPL.UpdateButtonClick(Sender: TObject);
var T:TfrmEditKekv;
begin
if KekvTreeList.FocusedNode.Parent<>nil
then begin
    T:=TfrmEditKekv.Create(self);
    T.EditFlag:=true;
    T.ShowModal;
    T.Free;
end;
end;

procedure TfrmKekvSprBPL.ChooseButtonClick(Sender: TObject);
begin
if self.FormStyle=fsNormal
then begin
      if not KekvTreeList.OptionsSelection.MultiSelect
      then begin
            if KekvTreeList.SelectionCount=1
            then begin
                 if not KekvTreeList.FocusedNode.HasChildren
                 then begin
                         ResultValue:=VarArrayCreate([0, 0], varVariant);
                         ResultValue[0]:=VarArrayOf([KekvDataSet.FieldByName('ID_KEKV').Value,
                                                     KekvDataSet.FieldByName('KEKV_TITLE').Value,
                                                     KekvDataSet.FieldByName('KEKV_CODE').Value,
                                                     KekvDataSet.FieldByName('LINKTO').Value]);

                         ModalResult:=mrYes;
                 end
                 else begin
                         MessageBox(Handle,PChar(BU_HieracChooseError),PChar(BU_WarningCaption),MB_OK and MB_ICONWARNING);
                 end;
            end;
      end
      else begin
           ResultValue:=null;
           ModalResult:=mrYes;
      end;
end;
end;

procedure TfrmKekvSprBPL.FilterButtonClick(Sender: TObject);
begin
//
end;

procedure TfrmKekvSprBPL.HelpButtonClick(Sender: TObject);
begin
//
end;

procedure TfrmKekvSprBPL.PrintButtonClick(Sender: TObject);
begin
//
end;

procedure TfrmKekvSprBPL.PropButtonClick(Sender: TObject);
begin
      if (KekvDataSet.RecordCount>0)
      then begin
                 GlobalSpr.GetPropByObj(self.owner,
                                        WorkDatabase.Handle,
                                        KekvDataSet.FieldByName('ID_KEKV').value,
                                        ActualDate,
                                        ptKekv);
      end;
end;

procedure TfrmKekvSprBPL.N2Click(Sender: TObject);
begin
   UpdateButton.OnClick(self);
end;

procedure TfrmKekvSprBPL.N3Click(Sender: TObject);
begin
     DelButton.OnClick(self);
end;

procedure TfrmKekvSprBPL.N6Click(Sender: TObject);
begin
  RefreshButton.OnClick(self);
end;

procedure TfrmKekvSprBPL.N15Click(Sender: TObject);
begin
ChooseButton.OnClick(self);
end;

procedure TfrmKekvSprBPL.N12Click(Sender: TObject);
begin
PropButton.OnClick(self);
end;

procedure TfrmKekvSprBPL.N9Click(Sender: TObject);
begin
  CloseButton.OnClick(self);
end;

procedure TfrmKekvSprBPL.ViewButtonClick(Sender: TObject);
var T:TfrmEditKekv;
begin
if KekvTreeList.FocusedNode.Parent<>nil
then begin
    T:=TfrmEditKekv.Create(self);
    T.EditFlag:=true;
    T.ViewFlag:=true;
    T.ShowModal;
    T.Free;
end;
end;

procedure TfrmKekvSprBPL.FormCreate(Sender: TObject);
begin
       label1.Caption:=PUB_STATE_ON_DATE_CONST;
end;

procedure TfrmKekvSprBPL.KekvTreeViewDblClick(Sender: TObject);
begin
     ChooseButtonClick(self);
end;

procedure TfrmKekvSprBPL.cbMonthPropertiesChange(Sender: TObject);
var date_str:string;
begin
     if chflag
     then begin
     DateSeparator:='.';
     ActualDate:=StrToDate('01.'+IntToStr(cbMonth.ItemIndex+1)+'.'+cbYear.Properties.Items[cbYear.ItemIndex]);
     DateTimeToString(date_str,'dd.mm.yyyy',ActualDate);
     caption:='Довідник кодів видатків на '+ date_str;
     RefreshButton.OnClick(self);
     end;
end;

procedure TfrmKekvSprBPL.cbYearPropertiesChange(Sender: TObject);
var date_str:string;
begin
     if chflag
     then begin
     DateSeparator:='.';
     ActualDate:=StrToDate('01.'+IntToStr(cbMonth.ItemIndex+1)+'.'+cbYear.Properties.Items[cbYear.ItemIndex]);
     DateTimeToString(date_str,'dd.mm.yyyy',ActualDate);
     caption:='Довідник кодів видатків на '+ date_str;
     RefreshButton.OnClick(self);
     end;
end;

procedure TfrmKekvSprBPL.KekvTreeListExpanding(Sender: TObject;
  ANode: TcxTreeListNode; var Allow: Boolean);
begin
     ANode:=KekvTreeList.FocusedNode;
end;

procedure TfrmKekvSprBPL.KekvTreeListKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key=VK_RIGHT
     then KekvTreeList.FocusedNode.Expand(false);
     if Key=VK_LEFT
     then KekvTreeList.FocusedNode.Collapse(false);
end;

end.
