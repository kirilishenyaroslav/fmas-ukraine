unit DiscSpec_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ActnList, cxStyles, dxBar, dxBarExtItems, cxGraphics,
  cxControls, dxStatusBar, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc, DB, FIBDataSet, pFIBDataSet, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid,Ibase,uPrK_Resources,AArray, pFIBErrorHandler,
  cxSplitter, ExtCtrls, DiscSpec_ParSetup, frxClass, frxDBSet, frxDesgn,
  DiscSpec_dmCommonStyles;

type
  TfMainForm = class(TForm)
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyleHeader: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyleInactive: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyleBackGround_Content: TcxStyle;
    cxStyleSelection: TcxStyle;
    ActionList: TActionList;
    ActionADD: TAction;
    ActionChange: TAction;
    ActionDEL: TAction;
    ActionView: TAction;
    ActionRefresh: TAction;
    ActionSelect: TAction;
    ActionCancel: TAction;
    ImageList: TImageList;
    dxStatusBar1: TdxStatusBar;
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    DSource: TDataSource;
    dxBarManager1: TdxBarManager;
    AddBtn: TdxBarLargeButton;
    ChangeBtn: TdxBarLargeButton;
    DelBtn: TdxBarLargeButton;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    CancelBtn: TdxBarLargeButton;
    ViewBtn: TdxBarLargeButton;
    ActionPrint: TAction;
    PrintBtn: TdxBarLargeButton;
    GridDBTableView1: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    cmnSPEC_NAME: TcxGridDBColumn;
    cmnDISC_NAME: TcxGridDBColumn;
    cmnKAF_NAME: TcxGridDBColumn;
    InfoPanel: TPanel;
    InfoGridDBTableView1: TcxGridDBTableView;
    InfoGridLevel1: TcxGridLevel;
    InfoGrid: TcxGrid;
    cxSplitter1: TcxSplitter;
    DSetDetail: TpFIBDataSet;
    DSourceDetail: TDataSource;
    cmnINFO_TEXT: TcxGridDBColumn;
    rDSet: TfrxDBDataset;
    rDSetDetail: TfrxDBDataset;
    rDesigner: TfrxDesigner;
    DSetDetail1: TpFIBDataSet;
    Report: TfrxReport;
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
  private
    Layout   :array[0.. KL_NAMELENGTH] of char;
    DBHANDLE             :TISC_DB_HANDLE;
    IndexLanguage        :Integer;
    pStylesDM            :TStylesDM;
  public
     ResultArray             :Variant;
     AllDataKods             :Variant;
     AllDataNpps             :Variant;
     TextViewColor           :TColor; // используется для изменения цвета TextEdit'a при просмотре
     ParamSprav              :TAArray;
     procedure InicCaption; virtual;
     constructor Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE);reintroduce;
  end;

{  function View_UO_KafDiscSpec(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
   exports View_UO_KafDiscSpec;
}
implementation
uses
 AccMgmt,uConstants;

{$R *.dfm}

const ReportPath='\Reports\UO\RSpecDisc.fr3';

{function View_UO_KafDiscSpec(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm:TfMainForm;
begin
  ViewForm:=TfMainForm.Create(AOwner,DB);
  ViewForm.Show;
end;      }

constructor TfMainForm.Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  DB.Handle:=ADB_HANDLE;
  ReadTransaction.Active:=True;
  ActionRefreshExecute(nil);
  InicCaption;
  pStylesDM:=TStylesDM.Create(Self);
  GridDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
  InfoGridDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
end;
{ вызывается при иниц. Caption формы}

procedure TfMainForm.InicCaption;
begin
    IndexLanguage:=uPrK_Resources.SelectLanguage;
    dxBarManager1.Bars[0].BorderStyle    :=bbsNone;
    dxBarManager1.Bars[0].ShowMark       :=false;
    dxBarManager1.CanCustomize           :=false;
    dxBarManager1.Bars[0].AllowClose       :=false;
    dxBarManager1.Bars[0].AllowCustomizing    :=false;
    dxBarManager1.Bars[0].AllowQuickCustomizing  :=false;
    dxBarManager1.Bars[0].AllowReset                :=false;
    dxBarManager1.Bars[0].MultiLine                   :=True;

//    Caption     :=InicFormCaption;
    ActionADD.Caption                    :=nAction_Add[IndexLanguage];
    ActionChange.Caption                 :=nAction_Change[IndexLanguage];
    ActionDEL.Caption                    :=nAction_Del[IndexLanguage];
    ActionView.Caption                   :=nAction_View[IndexLanguage];
    ActionSelect.Caption                 :=nAction_Vibrat[IndexLanguage];
    ActionRefresh.Caption                :=nActiont_Obnov[IndexLanguage];
    ActionCancel.Caption                 :=nAction_Exit[IndexLanguage];
    ActionPrint.Caption                  :=nActiontPrint[IndexLanguage];

    ActionADD.Hint                       :=nHintAction_Add[IndexLanguage];
    ActionChange.Hint                    :=nHintAction_Change[IndexLanguage];
    ActionDEL.Hint                       :=nHintAction_Del[IndexLanguage];
    ActionView.Hint                      :=nHintAction_View[IndexLanguage];
    ActionSelect.Hint                    :=nHintAction_Vibrat[IndexLanguage];
    ActionRefresh.Hint                   :=nHintAction_Obnov[IndexLanguage];
    ActionCancel.Hint                    :=nHintAction_Exit[IndexLanguage];
    ActionPrint.Hint                     :=nHintActiontPrint[IndexLanguage];

    dxStatusBar1.Panels[0].Text          :=nStatBarAdd[IndexLanguage];
    dxStatusBar1.Panels[1].Text          :=nStatBarChange[IndexLanguage];
    dxStatusBar1.Panels[2].Text          :=nStatBarDel[IndexLanguage];
    dxStatusBar1.Panels[3].Text          :=nStatBarVibrat[IndexLanguage];
    dxStatusBar1.Panels[4].Text          :=nStatBarObnov[IndexLanguage];
    dxStatusBar1.Panels[5].Text          :=nStatBarExit[IndexLanguage];
end;

procedure TfMainForm.ActionRefreshExecute(Sender: TObject);
var pID:Int64;
begin
  pID:=-1;
  if DSet.Active then
    if not DSet.IsEmpty then
      pID:=DSet['ID_SP_KAF_DISC_SPEC'];

  if DSetDetail.Active then DSetDetail.Close;
  if DSet.Active then DSet.Close;
  if DSetDetail1.Active  then DSetDetail1.Close;
  DSet.SQLs.SelectSQL.Text:='SELECT * FROM UO_SP_KAF_DISC_SPEC_S';
  DSetDetail.SQLs.SelectSQL.Text:='SELECT * FROM UO_SP_KAF_DISC_SPEC_GET_INFO(?ID_SP_KAF_DISC_SPEC)';
  DSetDetail1.SQLs.SelectSQL.Text:='SELECT * FROM UO_SP_KAF_DISC_SPEC_GET_INFO1(?ID_SP_KAF_DISC_SPEC)';
  DSet.Open;
  DSetDetail.Open;
  DSetDetail1.Open;

  if pID>-1 then
    DSet.Locate('ID_SP_KAF_DISC_SPEC',pID,[]);
end;

procedure TfMainForm.ActionCancelExecute(Sender: TObject);
begin
  ReadTransaction.Active:=False;
  Close;
end;

procedure TfMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
  ReadTransaction.Active:=False;
end;

procedure TfMainForm.ActionChangeExecute(Sender: TObject);
var ViewForm:TfParSet;
begin
  if DSet.IsEmpty then Exit;
  ViewForm:=TfParSet.Create(Self,DB.Handle,DSet['ID_SP_SPEC'],DSet['ID_SP_DISC'],ChangePrk);
  ViewForm.ShowModal;
  ViewForm.Release;
  ActionRefreshExecute(Self);
end;

procedure TfMainForm.ActionADDExecute(Sender: TObject);
var ViewForm:TfParSet;
begin
  ViewForm:=TfParSet.Create(Self,DB.Handle,-1,-1,AddPrK);
  ViewForm.ShowModal;
  ViewForm.Release;
  ActionRefreshExecute(Self);
end;

procedure TfMainForm.ActionViewExecute(Sender: TObject);
var ViewForm:TfParSet;
begin
  if DSet.IsEmpty then Exit;
  ViewForm:=TfParSet.Create(Self,DB.Handle,DSet['ID_SP_SPEC'],DSet['ID_SP_DISC'],ViewPrK);
  ViewForm.ShowModal;
  ViewForm.Release;
  ActionRefreshExecute(Self);
end;

procedure TfMainForm.ActionDELExecute(Sender: TObject);
begin
 if DSet.IsEmpty then Exit;
 if uPrK_Resources.prkMessageDlg('Видалення','Ви дійсно бажаєте видалити запис?',mtConfirmation,[mbYes,mbNo],0)=mrNo then
   Exit;
 try
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName:='UO_SP_KAF_DISC_SPEC_D';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_SP_KAF_DISC_SPEC').AsInt64:=DSet['ID_SP_KAF_DISC_SPEC'];
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
 except
 on E:Exception do
   begin
     StoredProc.Transaction.Rollback;
     prkMessageDlg('Помилка',E.Message,mtError,[mbOK],0);
   end;
 end;
 ActionRefreshExecute(Self);
end;

procedure TfMainForm.ActionPrintExecute(Sender: TObject);
begin
  Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ReportPath);
  Report.DesignReport;
  InfoGrid.SetFocus;
end;

end.
