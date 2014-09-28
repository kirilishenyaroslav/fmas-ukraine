unit Sp_f1dfFirm_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxBar, dxBarExtItems, cxTL,
  cxMaskEdit, cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer,
  cxTextEdit, ExtCtrls, cxInplaceContainer, cxDBTL, cxTLData, dxDockPanel,
  dxDockControl,ZProc, Kernel, PackageLoad,
  cxCheckBox, FIBDataSet, pFIBDataSet, Unit_ZGlobal_Consts,
  Sp_f1dfFirm_Control, cxLabel, cxDBEdit, ZTypes,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, IBase,
  RxMemDS, zMessages, pFIBErrorHandler, ComCtrls, Sp_F1dfFirm_DataModule,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxGridBandedTableView, cxGridDBBandedTableView,
  GlobalSpr, dxStatusBar, Menus;

type TVoplPropUse = record
 Id:integer;
 In_use:string[1];
end;

type
  TFZSp_f1dfFirm = class(TForm)
    BarManager: TdxBarManager;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
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
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
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
    SplitterNarProps: TcxSplitter;
    PanelNarChild2: TPanel;
    GridF1dfFirmShifr: TcxGrid;
    GridF1dfFirmShifrView1: TcxGridDBTableView;
    GridColumnShifr: TcxGridDBColumn;
    GridColumnOptionsUse: TcxGridDBColumn;
    GridF1dfFirmShifrLevel1: TcxGridLevel;
    PanelNarGrid1: TPanel;
    GridF1dfFirm: TcxGrid;
    GridF1dfFirmLevel1: TcxGridLevel;
    GridF1dfFirmDBBandedTableView1: TcxGridDBBandedTableView;
    GridF1dfFirmDBBandedTableView1DBBandedColumnFirmName: TcxGridDBBandedColumn;
    GridF1dfFirmDBBandedTableView1DBBandedColumnFirmNameFull: TcxGridDBBandedColumn;
    GridF1dfFirmDBBandedTableView1DBBandedColumnDirector: TcxGridDBBandedColumn;
    GridF1dfFirmDBBandedTableView1DBBandedColumnTinDirector: TcxGridDBBandedColumn;
    GridF1dfFirmDBBandedTableView1DBBandedColumnTelDirector: TcxGridDBBandedColumn;
    GridF1dfFirmDBBandedTableView1DBBandedColumnGlavBuhg: TcxGridDBBandedColumn;
    GridF1dfFirmDBBandedTableView1DBBandedColumnTinGlBuhg: TcxGridDBBandedColumn;
    GridF1dfFirmDBBandedTableView1DBBandedColumnTelGlBuhg: TcxGridDBBandedColumn;
    GridF1dfFirmDBBandedTableView1DBBandedColumnDpi: TcxGridDBBandedColumn;
    GridF1dfFirmDBBandedTableView1DBBandedColumnKodDpi: TcxGridDBBandedColumn;
    GridF1dfFirmDBBandedTableView1DBBandedColumnFileDa: TcxGridDBBandedColumn;
    GridF1dfFirmDBBandedTableView1DBBandedColumnOkpo: TcxGridDBBandedColumn;
    dxStatusBar1: TdxStatusBar;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InsertBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure GridF1dfFirmShifrView1DblClick(Sender: TObject);
    procedure GridF1dfFirmView1KeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
  private
    DM:TDMF1dfFirm;
    Ins_Resault: Variant;
    PlanguageIndex:byte;
  public
    constructor Create(AParameter:TZSimpleParamFull);reintroduce;
    property Resault: Variant read Ins_Resault;
  end;

function View_FZ_F1dfFirm_Sp(AParameter:TZSimpleParamFull):Variant;stdcall;
 exports View_FZ_F1dfFirm_Sp;

implementation

uses cxCalendar, Math, cxButtonEdit;

{$R *.dfm}

function View_FZ_F1dfFirm_Sp(AParameter:TZSimpleParamFull):Variant;
var ViewForm: TFZSp_F1dfFirm;
    Res:Variant;
begin
  ViewForm  :=  TFZSp_F1dfFirm.Create(AParameter);
  ViewForm.FormStyle := AParameter.FormStyle;
  case ViewForm.FormStyle of
    fsNormal              :
    begin
        ViewForm.ShowModal;
        if (ViewForm.ModalResult=mrYes) then
           res:=ViewForm.Resault
        else
           res:=NULL;
         ViewForm.free;
    end;
    fsMDIChild	          :
    begin
        ViewForm.Show;
    end;
   else
    begin
     ViewForm.ShowModal;
     res:=ViewForm.Resault;
     ViewForm.free;
    end;
   end;
  View_FZ_F1dfFirm_Sp:=res;


end;

constructor TFZSp_f1dfFirm.Create(AParameter:TZSimpleParamFull);
var i: smallint;
begin
inherited Create(AParameter.Owner);
PlanguageIndex := LanguageIndex;
Ins_Resault := VarArrayCreate([0,2],varVariant);
//******************************************************************************//
//******************************************************************************//
DM:=TDMF1dfFirm.Create(Self);
DM.DB.Handle:=AParameter.DB_Handle;
DM.RTransaction.StartTransaction;
//******************************************************************************//
//******************************************************************************//
GridF1dfFirmDBBandedTableView1.DataController.DataSource:=DM.DSource1;
GridF1dfFirmShifrView1.DataController.DataSource:=DM.DSource2;
//******************************************************************************//

DM.DSet1.SQLs.SelectSQL.Text  := 'SELECT * FROM Z_1DF_FIRM_S(NULL) ORDER BY FIRM_NAME';
DM.DSet2.SQLs.SelectSQL.Text  := 'SELECT * from Z_1DF_FIRM_SHIFR_S(?ID_1DF_FIRM) ORDER BY SHIFR';
DM.DSet1.Open;
DM.DSet2.Open;

self.Caption                             := 'Довідник філіалів';
self.InsertBtn.Caption                   := InsertBtn_Caption[PLanguageIndex];
self.UpdateBtn.Caption                   := UpdateBtn_Caption[PLanguageIndex];
self.DeleteBtn.Caption                   := DeleteBtn_Caption[PLanguageIndex];
self.RefreshBtn.Caption                  := RefreshBtn_Caption[PLanguageIndex];
self.SelectBtn.Caption                   := SelectBtn_Caption[PLanguageIndex];
self.ExitBtn.Caption                     := ExitBtn_Caption[PLanguageIndex];
//******************************************************************************//
GridColumnShifr.Caption               := FZSp_VidOpl_GridColumnOptionsName_Caption[PLanguageIndex];
GridColumnOptionsUse.Caption          := FZSp_VidOpl_GridColumnOptionsUse_Caption[PLanguageIndex];

GridF1dfFirmDBBandedTableView1DBBandedColumnFirmName.Caption     :=GridClName_Caption[PLanguageIndex];
GridF1dfFirmDBBandedTableView1DBBandedColumnFirmNameFull.Caption :=GridClFullNameLong_Caption[PLanguageIndex];
GridF1dfFirmDBBandedTableView1DBBandedColumnDirector.Caption     :=LabelDirector_Caption[PLanguageIndex];
GridF1dfFirmDBBandedTableView1DBBandedColumnTinDirector.Caption  :=GridClTin_Caption[PLanguageIndex];
GridF1dfFirmDBBandedTableView1DBBandedColumnTelDirector.Caption  :=LabelTel_Caption[PLanguageIndex];
GridF1dfFirmDBBandedTableView1DBBandedColumnGlavBuhg.Caption     :=LabelGlavBuhg_Caption[PLanguageIndex];
GridF1dfFirmDBBandedTableView1DBBandedColumnTinGlBuhg.Caption    :=GridClTin_Caption[PLanguageIndex];
GridF1dfFirmDBBandedTableView1DBBandedColumnTelGlBuhg.Caption    :=LabelTel_Caption[PLanguageIndex];
GridF1dfFirmDBBandedTableView1DBBandedColumnDpi.Caption          :='ДПІ';
GridF1dfFirmDBBandedTableView1DBBandedColumnKodDpi.Caption       :='Код ДПІ';
GridF1dfFirmDBBandedTableView1DBBandedColumnFileDa.Caption       :='Файл';
GridF1dfFirmDBBandedTableView1DBBandedColumnOkpo.Caption         :=LabelOkpo_Caption[PLanguageIndex];
//******************************************************************************//
//******************************************************************************//
 dxStatusBar1.Panels[0].Text   := ShortCutToText(InsertBtn.ShortCut)+' - '+InsertBtn.Caption;
 dxStatusBar1.Panels[1].Text   := ShortCutToText(UpdateBtn.ShortCut)+' - '+UpdateBtn.Caption;
 dxStatusBar1.Panels[2].Text   := ShortCutToText(DeleteBtn.ShortCut)+' - '+DeleteBtn.Caption;
 dxStatusBar1.Panels[3].Text   := ShortCutToText(RefreshBtn.ShortCut)+' - '+RefreshBtn.Caption;
 dxStatusBar1.Panels[4].Text   := ShortCutToText(ExitBtn.ShortCut)+' - '+ExitBtn.Caption;

for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
//******************************************************************************//
  self.FormStyle         := fsNormal;
  self.Position          := poOwnerFormCenter;
  WindowState            := wsMaximized;
//******************************************************************************//
end;

procedure TFZSp_f1dfFirm.ExitBtnClick(Sender: TObject);
begin
   ModalResult:=mrNo;
   close;
end;

procedure TFZSp_f1dfFirm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if Dm.RTransaction.InTransaction then Dm.RTransaction.Commit;
if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFZSp_f1dfFirm.InsertBtnClick(Sender: TObject);
var InsertForm:TZF1dfFirmControl;
    Id:Integer;
begin
InsertForm         := TZF1dfFirmControl.Create(self,DM.DB.Handle);
InsertForm.Caption := 'Додавання підприємства';;
InsertForm.ShowModal;
If InsertForm.ModalResult=mrYes then
 try
   DM.StProc.Database                               := DM.DB;
   DM.StProc.Transaction                            := DM.WTransaction;
   DM.StProc.Transaction.StartTransaction;
   DM.StProc.StoredProcName                         := 'Z_1DF_FIRM_I';
   DM.StProc.Prepare;
   DM.StProc.ParamByName('FIRM_NAME').AsString       := InsertForm.MaskEditShortName.Text;
   DM.StProc.ParamByName('FIRM_NAME_FULL').AsString  := InsertForm.MaskEditFullName.Text;
   DM.StProc.ParamByName('DIRECTOR').AsString        := InsertForm.EditDirector.EditValue;
   DM.StProc.ParamByName('TEL_DIRECTOR').AsInteger   := StrToInt(InsertForm.MaskEditDirectorTel.Text);
   DM.StProc.ParamByName('TIN_DIRECTOR').AsString    := InsertForm.ButtonEditDirectorTin.Text;
   DM.StProc.ParamByName('GLAV_BUHG').AsString       := InsertForm.EditGlBuhg.EditValue;
   DM.StProc.ParamByName('TEL_GLBUHG').AsInteger     := StrToInt(InsertForm.MaskEditGlBuhgTel.Text);
   DM.StProc.ParamByName('TIN_GLBUHG').AsString      := InsertForm.ButtonEditGlBuhgTin.Text;
   DM.StProc.ParamByName('OKPO').AsString            := InsertForm.MaskEditOkpo.Text;
   DM.StProc.ParamByName('DPI').AsString             := InsertForm.MaskEditDPI.Text;
   DM.StProc.ParamByName('KOD_DPI').AsString         := InsertForm.MaskEditKodDPI.Text;
   DM.StProc.ParamByName('FILE_DA').AsString         := InsertForm.MaskEditFileDa.Text;
   DM.StProc.ExecProc;
   ID := DM.StProc.ParamByName('ID_1DF_FIRM').AsInteger;
   DM.StProc.Transaction.Commit;
   DM.DSet1.CloseOpen(true);
   DM.DSet2.CloseOpen(true);
   GridF1dfFirmDBBandedTableView1.DataController.LocateByKey(ID);
 except
  on E: Exception do
   begin
    ZShowMessage(Error_caption[PLanguageIndex],e.Message,mtError,[mbOK]);
    DM.StProc.Transaction.Rollback;
   end;
 end;
InsertForm.Free;
self.Activate;
end;

procedure TFZSp_f1dfFirm.RefreshBtnClick(Sender: TObject);
var KeyParent,KeyChild:variant;
begin
  DM.DSet1.CloseOpen(true);
  DM.DSet2.CloseOpen(true);
end;

procedure TFZSp_f1dfFirm.UpdateBtnClick(Sender: TObject);
var UpdateForm:TZF1dfFirmControl;
    Id:Integer;
begin
try
 DM.StProc.Database                               := DM.DB;
 DM.StProc.Transaction                            := DM.WTransaction;
 DM.StProc.Transaction.StartTransaction;

 UpdateForm                        := TZF1dfFirmControl.Create(self, DM.DB.Handle);
 UpdateForm.Caption                := 'Редагування підприємства';
 if not VarIsNULL(DM.DSet1['FIRM_NAME']) then
   UpdateForm.MaskEditShortName.Text         := DM.DSet1['FIRM_NAME'];
 if not VarIsNULL(DM.DSet1['FIRM_NAME_FULL']) then
   UpdateForm.MaskEditFullName.Text          := DM.DSet1['FIRM_NAME_FULL'];
 if not VarIsNULL(DM.DSet1['TIN_DIRECTOR']) then
   UpdateForm.ButtonEditDirectorTin.EditValue:= DM.DSet1['TIN_DIRECTOR'];
 if not VarIsNULL(DM.DSet1['DIRECTOR']) then
   UpdateForm.EditDirector.EditValue         := DM.DSet1['DIRECTOR'];
 if not VarIsNULL(DM.DSet1['TEL_DIRECTOR']) then
   UpdateForm.MaskEditDirectorTel.Text       := DM.DSet1['TEL_DIRECTOR'];
 if not VarIsNULL(DM.DSet1['TIN_GLBUHG']) then
   UpdateForm.ButtonEditGlBuhgTin.EditValue  := DM.DSet1['TIN_GLBUHG'];
 if not VarIsNULL(DM.DSet1['GLAV_BUHG']) then
   UpdateForm.EditGlBuhg.EditValue           := DM.DSet1['GLAV_BUHG'];
 if not VarIsNULL(DM.DSet1['TEL_GLBUHG']) then
    UpdateForm.MaskEditGlBuhgTel.Text        := DM.DSet1['TEL_GLBUHG'];
 if not VarIsNULL(DM.DSet1['DPI']) then
   UpdateForm.MaskEditDPI.Text               := DM.DSet1['DPI'];
 if not VarIsNULL(DM.DSet1['KOD_DPI']) then
   UpdateForm.MaskEditKodDPI.Text            := DM.DSet1['KOD_DPI'];
 if not VarIsNULL(DM.DSet1['OKPO']) then
   UpdateForm.MaskEditOkpo.Text              := DM.DSet1['OKPO'];
 if not VarIsNULL(DM.DSet1['FILE_DA']) then
   UpdateForm.MaskEditFileDa.Text            := DM.DSet1['FILE_DA'];
 UpdateForm.ShowModal;
 If UpdateForm.ModalResult=mrYes then
  begin
   DM.StProc.StoredProcName                         := 'Z_1DF_FIRM_U';
   DM.StProc.Prepare;
   ID:=DM.DSet1['ID_1DF_FIRM'];
   DM.StProc.ParamByName('ID_1DF_FIRM').AsInteger    := DM.DSet1['ID_1DF_FIRM'];
   DM.StProc.ParamByName('FIRM_NAME').AsString       := UpdateForm.MaskEditShortName.Text;
   DM.StProc.ParamByName('FIRM_NAME_FULL').AsString  := UpdateForm.MaskEditFullName.Text;
   DM.StProc.ParamByName('DIRECTOR').AsString        := UpdateForm.EditDirector.EditValue;
   DM.StProc.ParamByName('TEL_DIRECTOR').AsInteger   := StrToInt(UpdateForm.MaskEditDirectorTel.Text);
   DM.StProc.ParamByName('TIN_DIRECTOR').AsString    := UpdateForm.ButtonEditDirectorTin.Text;
   DM.StProc.ParamByName('GLAV_BUHG').AsString       := UpdateForm.EditGlBuhg.EditValue;
   DM.StProc.ParamByName('TEL_GLBUHG').AsInteger     := StrToInt(UpdateForm.MaskEditGlBuhgTel.Text);
   DM.StProc.ParamByName('TIN_GLBUHG').AsString      := UpdateForm.ButtonEditGlBuhgTin.Text;
   DM.StProc.ParamByName('OKPO').AsString            := UpdateForm.MaskEditOkpo.Text;
   DM.StProc.ParamByName('DPI').AsString             := UpdateForm.MaskEditDPI.Text;
   DM.StProc.ParamByName('KOD_DPI').AsString         := UpdateForm.MaskEditKodDPI.Text;
   DM.StProc.ParamByName('FILE_DA').AsString         := UpdateForm.MaskEditFileDa.Text;
   DM.StProc.ExecProc;
  end;
   if UpdateForm.ModalResult=mrYes then DM.StProc.Transaction.Commit;
   DM.DSet1.CloseOpen(true);
   DM.DSet2.CloseOpen(true);
   GridF1dfFirmDBBandedTableView1.DataController.LocateByKey(ID);
 except
  on E: Exception do
   begin
    ZShowMessage(Error_caption[PLanguageIndex],e.Message,mtError,[mbOK]);
    DM.WTransaction.Rollback;
   end;
 end;
 UpdateForm.Free;
end;

procedure TFZSp_f1dfFirm.DeleteBtnClick(Sender: TObject);
var TmpDSet:TpFIBDataSet;
begin
if ZShowMessage(Caption_Delete[PlanguageIndex],DeleteRecordQuestion_Text[PlanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
 try
  DM.StProc.Transaction.StartTransaction;
  DM.StProc.StoredProcName:='Z_1DF_FIRM_D';
  DM.StProc.Prepare;
  DM.StProc.ParamByName('ID_1DF_FIRM').AsInteger := DM.DSet1['ID_1DF_FIRM'];
  DM.StProc.ExecProc;
  DM.StProc.Transaction.Commit;
  DM.DSet1.CloseOpen(true);
  DM.DSet2.CloseOpen(true);
 except
  on E: Exception do
   begin
    ZShowMessage(Error_caption[PLanguageIndex],e.Message,mtError,[mbOK]);
    DM.StProc.Transaction.Rollback;
   end;
 end;
end;

procedure TFZSp_f1dfFirm.SelectBtnClick(Sender: TObject);
begin
{if PageControl.ActivePage=TabSheetNarchisl then
 begin
  Ins_Resault[0] := DM.DSetNar1['ID_VIDOPL'];
  Ins_Resault[1] := DM.DSetNar1['NAME_VIDOPL'];
  Ins_Resault[2] := DM.DSetNar1['KOD_VIDOPL'];
 end;
if PageControl.ActivePage=TabSheetUder then
 begin
  Ins_Resault[0] := DM.DSetUd1['ID_VIDOPL'];
  Ins_Resault[1] := DM.DSetUd1['NAME_VIDOPL'];
  Ins_Resault[2] := DM.DSetUd1['KOD_VIDOPL'];
 end;
  self.ModalResult:=mrYes;}
end;

procedure TFZSp_f1dfFirm.GridF1dfFirmShifrView1DblClick(Sender: TObject);
var id:variant;
begin
  try
    DM.StProc.Transaction.StartTransaction;
    DM.StProc.StoredProcName:='Z_1DF_FIRM_SHIFR_U';
    DM.StProc.Prepare;
    id:=DM.DSet2['SHIFR'];
    DM.StProc.ParamByName('ID_1DF_FIRM').AsInteger := DM.DSet1['ID_1DF_FIRM'];
    DM.StProc.ParamByName('SHIFR').AsString := DM.DSet2['SHIFR'];
    DM.StProc.ParamByName('IN_USE').AsInteger := IfThen(DM.DSet2['IN_USE']=1,0,1);
    DM.StProc.ExecProc;
    DM.StProc.Transaction.Commit;
    DM.DSet2.CloseOpen(True);
    GridF1dfFirmShifrView1.DataController.LocateByKey(id);
  except
   on E:Exception do
    begin
      ZShowMessage(Error_caption[PLanguageIndex],e.Message,mtError,[mbOK]);
     DM.StProc.Transaction.Rollback;
    end;
  end;
end;

procedure TFZSp_f1dfFirm.GridF1dfFirmView1KeyPress(Sender: TObject;
  var Key: Char);
begin
{ If (Key in ['0'..'9']) then
  begin
   if (GridVidOplView1.OptionsBehavior.IncSearchItem <> GridColumnVidOplKod)then
    begin
     GridVidOplView1.Controller.IncSearchingText   := '';
     GridVidOplView1.OptionsBehavior.IncSearchItem := GridColumnVidOplKod;
    end
  end
 else
  if (GridVidOplView1.OptionsBehavior.IncSearchItem <> GridColumnVidOplName)then
   begin
    GridVidOplView1.Controller.IncSearchingText   := '';
    GridVidOplView1.OptionsBehavior.IncSearchItem := GridColumnVidOplName;
   end;}
end;

procedure TFZSp_f1dfFirm.FormResize(Sender: TObject);
var i:integer;
begin
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
end;

end.

