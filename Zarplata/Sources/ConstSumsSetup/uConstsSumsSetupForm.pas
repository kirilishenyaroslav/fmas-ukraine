unit uConstsSumsSetupForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems,ConstSumsDM,Ibase, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid,uEditForm,ZTypes,
  ZMessages, cxGridBandedTableView, cxSplitter, Unit_ZGlobal_Consts, ZProc,
  cxCheckBox, cxTextEdit, CTEditFormUnit, dxStatusBar;
type
  TConstSumsSetupForm = class(TForm)
    BarManager: TdxBarManager;
    UpdateBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1Level1: TcxGridLevel;
    Grid1: TcxGrid;
    Grid2DBTableView1: TcxGridDBTableView;
    Grid2Level1: TcxGridLevel;
    Grid2: TcxGrid;
    Styles: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    Grid1DBTableView1DBColumn1: TcxGridDBColumn;
    Grid2DBTableView1DBColumn1: TcxGridDBColumn;
    Grid2DBTableView1DBColumn2: TcxGridDBColumn;
    Grid2DBTableView1DBColumn3: TcxGridDBColumn;
    cxSplitter1: TcxSplitter;
    AddConstType: TdxBarLargeButton;
    UpdConstType: TdxBarLargeButton;
    DelConstType: TdxBarLargeButton;
    AddConst: TdxBarLargeButton;
    UpdConst: TdxBarLargeButton;
    DelConst: TdxBarLargeButton;
    dxStatusBar1: TdxStatusBar;
    dxStatusBar2: TdxStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitBtnClick(Sender: TObject);
    procedure AddConstClick(Sender: TObject);
    procedure UpdConstClick(Sender: TObject);
    procedure DelConstClick(Sender: TObject);
    procedure DelConstTypeClick(Sender: TObject);
    procedure AddConstTypeClick(Sender: TObject);
    procedure UpdConstTypeClick(Sender: TObject);
  private
    DM: TMainDM;
    PLanguageIndex:byte;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
  end;


implementation
{$R *.dfm}

constructor TConstSumsSetupForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
var i:byte;
begin
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 AddConst.Caption:=InsertBtn_Caption[PLanguageIndex];
 UpdConst.Caption:=UpdateBtn_Caption[PLanguageIndex];
 DelConst.Caption:=DeleteBtn_Caption[PLanguageIndex];
 AddConstType.Caption:=Add_SP_Const_type[PLanguageIndex];
 UpdConstType.Caption:=Upd_SP_Const_type[PLanguageIndex];
 DelConstType.Caption:=Del_SP_Const_type[PLanguageIndex];
 dxStatusBar1.Panels[0].Text:= 'F2 - '+AddConst.Caption;
 dxStatusBar1.Panels[1].Text:= 'F3 - '+UpdConst.Caption;
 dxStatusBar1.Panels[2].Text:= 'F4 - '+DelConst.Caption;
 dxStatusBar2.Panels[0].Text:= 'Shift+F2 - '+AddConstType.Caption;
 dxStatusBar2.Panels[1].Text:= 'Shift+F3 - '+UpdConstType.Caption;
 dxStatusBar2.Panels[2].Text:= 'Shift+F4 - '+DelConstType.Caption;
 Grid2DBTableView1DBColumn1.Caption:=GridClSumma_Caption[PLanguageIndex];
 Grid2DBTableView1DBColumn2.Caption:=LabelDateBeg_Caption[PLanguageIndex];
 Grid2DBTableView1DBColumn3.Caption:=LabelDateEnd_Caption[PLanguageIndex];
 Grid1DBTableView1DBColumn1.Caption:=FZSp_VidOpl_GridConstsColumnNameProp_Caption[PLanguageIndex];
 DM:= TMainDM.Create(self,Db_Handle);
 Grid1DBTableView1.DataController.DataSource := DM.DSource1;
 Grid2DBTableView1.DataController.DataSource := DM.DSource2;
 WindowState := wsMaximized;
end;

procedure TConstSumsSetupForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    MainDM.Free;
    Action:=caFree;
end;

procedure TConstSumsSetupForm.ExitBtnClick(Sender: TObject);
begin
    Close;
end;


procedure TConstSumsSetupForm.AddConstClick(Sender: TObject);
var form: TEditForm;
begin
form:=TEditForm.Create(Self,DM.DB.Handle,zcfsInsert,DM.DSet1['ID'],DM.DSet1['CONST_NAME'],DM.DSet1['ID']);
form.showmodal;
DM.DSet1.CloseOpen(true);
DM.DSet2.CloseOpen(true);
end;

procedure TConstSumsSetupForm.UpdConstClick(Sender: TObject);
var form: TEditForm;
begin
form:=TEditForm.Create(Self,DM.DB.Handle,zcfsUpdate,DM.DSet2['ID'],DM.DSet1['CONST_NAME'],DM.DSet1['ID']);
form.showmodal;
DM.DSet1.CloseOpen(true);
DM.DSet2.CloseOpen(true);
end;

procedure TConstSumsSetupForm.DelConstClick(Sender: TObject);
begin
if ZShowMessage(Caption_Delete[PLanguageIndex],DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes
then
 try
  begin
    DM.StProc.StoredProcName:='Z_CONST_SUMS_D';
    DM.StProc.Transaction.StartTransaction;
    DM.StProc.Prepare;
    DM.StProc.ParamByName('ID').AsInteger := DM.DSet2['ID'];
    DM.StProc.ExecProc;
    DM.StProc.Transaction.Commit;
    DM.DSet1.CloseOpen(true);
    DM.DSet2.CloseOpen(true);
  end;
except
  on e:exception do
   begin
     DM.StProc.Transaction.Rollback;
     ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
   end;
end;
end;

procedure TConstSumsSetupForm.DelConstTypeClick(Sender: TObject);
begin
if ZShowMessage(Caption_Delete[PLanguageIndex],DelAllRecords_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes
then
 try
  begin
    DM.StProc.StoredProcName:='Z_SP_CONSTS_D';
    DM.StProc.Transaction.StartTransaction;
    DM.StProc.Prepare;
    DM.StProc.ParamByName('ID').AsInteger := DM.DSet1['ID'];
    DM.StProc.ExecProc;
    DM.StProc.Transaction.Commit;
    DM.DSet1.CloseOpen(true);
    DM.DSet2.CloseOpen(true);
  end;
except
  on e:exception do
   begin
     DM.StProc.Transaction.Rollback;
     ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
   end;
end;
end;


procedure TConstSumsSetupForm.AddConstTypeClick(Sender: TObject);
var form: TCTEditForm;
begin
form:=TCTEditForm.Create(Self,DM.DB.Handle,zcfsInsert,DM.DSet1['ID']);
form.showmodal;
DM.DSet1.CloseOpen(true);
DM.DSet2.CloseOpen(true);
end;

procedure TConstSumsSetupForm.UpdConstTypeClick(Sender: TObject);
var form: TCTEditForm;
begin
form:=TCTEditForm.Create(Self,DM.DB.Handle,zcfsUpdate,DM.DSet1['ID']);
form.showmodal;
DM.DSet1.CloseOpen(true);
DM.DSet2.CloseOpen(true);
end;

end.

