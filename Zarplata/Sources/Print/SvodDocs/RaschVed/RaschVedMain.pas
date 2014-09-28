unit RaschVedMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer,
  cxTreeView, cxControls, cxGroupBox, IBase, cxEdit, cxRadioGroup,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxInplaceContainer, cxSpinEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLabel, Unit_ZGlobal_Consts,
  cxClasses, RaschVedMainDM, Dates, ZSvodLoaderUnit, ZSvodTypesUnit,
  ExtCtrls, dxBar, dxBarExtItems, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, RaschVedPrintDM, ZProc,
  RaschVedReestrPrintDM, zMessages, cxCheckBox, cxDBTL, cxTLData;

type
  TFOptions = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    PrintSvodBtn: TdxBarLargeButton;
    Styles: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
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
    PrintReestrBtn: TdxBarLargeButton;
    TreeListDep: TcxDBTreeList;
    TreeListColumnDepName: TcxDBTreeListColumn;
    TreeListColumnDepYes: TcxDBTreeListColumn;
    TreeListColumnDepId: TcxDBTreeListColumn;
    TreeListDepcxDBTreeListColumnCount: TcxDBTreeListColumn;
    TreeListDepcxDBTreeListColumnKOD: TcxDBTreeListColumn;
    procedure ExitBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure PrintSvodBtnClick(Sender: TObject);
    procedure PrintReestrBtnClick(Sender: TObject);
    procedure TreeListDepClick(Sender: TObject);
  private
    PParameter:TZAccListParameter;
    MainDM:TMainDM;
    PLanguageIndex:byte;
  public
    constructor Create(AParameter:TZAccListParameter);reintroduce;
    destructor Destroy;reintroduce;
  end;

implementation

uses FIBQuery;

{$R *.dfm}

constructor TFOptions.Create(AParameter:TZAccListParameter);
begin
 inherited Create(AParameter.AOwner);
 PParameter:=AParameter;
 PParameter.AOwner:=self;
 MainDM:=TMainDM.Create(PParameter);
 PParameter:=AParameter;
 PLanguageIndex:=LanguageIndex;
//******************************************************************************
 PrintSvodBtn.Caption := Sheets_Const[PLanguageIndex];
 PrintReestrBtn.Caption :=  Reestr_Const[PLanguageIndex];
 RefreshBtn.Caption := RefreshBtn_Caption[PLanguageIndex];
 ExitBtn.Caption    := ExitBtn_Caption[PLanguageIndex];

 TreeListColumnDepName.Caption.Text := LabelDepartment_Caption[PLanguageIndex];
 TreeListDepcxDBTreeListColumnKOD.Caption.Text := GridClKodDepartment_Caption[PLanguageIndex];;
 TreeListDepcxDBTreeListColumnCount.Caption.Text := OfPeople_Const[PLanguageIndex];

 Caption := FRaschVed_SelDepartment_Caption[PLanguageIndex];
//******************************************************************************
 TreeListDep.DataController.DataSource:=MainDM.DSource;
end;

procedure TFOptions.ExitBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFOptions.RefreshBtnClick(Sender: TObject);
var _recno:integer;
begin
_recno:=MainDM.DSet.RecNo;
MainDM.DSet.CloseOpen(True);
MainDM.DSet.RecNo:=_Recno;
end;

procedure TFOptions.PrintSvodBtnClick(Sender: TObject);
var PrintDM:TPrintDM;
ID_SESSION_FILTER_DEP:Integer;
begin
PParameter.AOwner:=Self;
with MainDM do
begin
 try
  StProc.StoredProcName := 'PUB_GET_ID_BY_GEN';
  StProc.Transaction.StartTransaction;
  StProc.Prepare;
  StProc.ParamByName('GENERATOR_NAME').AsString:='GEN_Z_FILTER_IDS_ID';
  StProc.ParamByName('STEP').AsInteger:=1;
  StProc.ExecProc;
  StProc.Transaction.Commit;
  PParameter.ID_SESSION_FILTER_DEP:=StProc.ParamByName('RET_VALUE').AsInteger;
 except
 on E:exception do
   begin
     ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOk]);
     StProc.Transaction.Rollback;
   end;
 end;

 //PParameter.Id_Department:=MainDM.DSet['ID_DEPARTMENT'];
 DSet.First;
 while not(DSet.Eof) do
 begin
   if GridDBTableView1.Controller.FocusedRecord.Selected=true then
      try
        StProc.StoredProcName := 'Z_FILTER_PRINT_RASCH_VED_BUF_I';
        StProc.Transaction.StartTransaction;
        StProc.Prepare;
        StProc.ParamByName('ID_SESSION_FILTER_DEP').AsInteger:=PParameter.ID_SESSION_FILTER_DEP;
        StProc.ParamByName('ID_DEPARTMENT').AsInteger:=DSet['ID_DEPARTMENT'];
        StProc.ExecProc;
        StProc.Transaction.Commit;
      except
        on E:exception do
        begin
          ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOk]);
          StProc.Transaction.Rollback;
        end;
      end;
   DSet.Next
 end;
end;
PrintDM:=TPrintDM.Create(self);
if (PParameter.TypeData in [4]) then
  PrintDM.ReportCreateShort(PParameter)
else
  PrintDM.ReportCreate(PParameter);
PrintDM.Free;
{try
  MainDM.StProc.StoredProcName := 'Z_FILTER_IDS_D';
  MainDM.StProc.Transaction.StartTransaction;
  MainDM.StProc.Prepare;
  MainDM.StProc.ParamByName('ID_SESSION').AsInteger:=PParameter.Id_Department;
  MainDM.StProc.ExecProc;
  MainDM.StProc.Transaction.Commit;
 except
 on E:exception do
   begin
     ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOk]);
     MainDM.StProc.Transaction.Rollback;
   end;
 end;  }
end;

destructor TFOptions.Destroy;
begin
 MainDM.Destroy;
 inherited Destroy;
end;

procedure TFOptions.PrintReestrBtnClick(Sender: TObject);
var PrintDM:TDM;
begin
PParameter.AOwner:=Self;
PParameter.Id_Department:=MainDM.DSet['ID_DEPARTMENT'];
PrintDM:=TDM.Create(self);
PrintDM.PrintSpr(PParameter);
PrintDM.Free;
end;

procedure TFOptions.TreeListDepClick(Sender: TObject);
begin
  if  MainDM.DSet['exists_line']=1 then
  begin
    PrintSvodBtn.Enabled:=true;
    PrintReestrBtn.Enabled:=true;
  end
  else
  begin
    PrintSvodBtn.Enabled:=false;
    PrintReestrBtn.Enabled:=false;
  end
end;

end.
