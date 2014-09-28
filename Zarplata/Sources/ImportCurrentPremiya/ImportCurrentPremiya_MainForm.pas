unit ImportCurrentPremiya_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase, DB,ImportCurrentPremiya_DM, cxGraphics, dxBarExtItems,
  dxBar, cxControls, dxStatusBar, ExtCtrls, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid,DateUtils,ImportCurrentPremiya_AddForm,
  ImportCurrentPremiya_Filter, cxContainer, cxTextEdit,StdCtrls, Dates,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxCheckBox, cxLabel,zMessages,
  Unit_zGlobal_Consts,z_uWaitForm, Unit_sprSubs_Consts;

type
  TfmImportCurrentPremiya = class(TForm)
    Panel1: TPanel;
    dxBarManager1: TdxBarManager;
    dxStatusBar1: TdxStatusBar;
    AddForm: TdxBarButton;
    dxBarButton1: TdxBarButton;
    AddButton: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    ImportGridDBTableView1: TcxGridDBTableView;
    ImportGridLevel1: TcxGridLevel;
    ImportGrid: TcxGrid;
    ImportGridDBTableView1DBColumn_Import: TcxGridDBColumn;
    RefreshBtn: TdxBarLargeButton;
    ImportGridDBTableView1DB_Num_project: TcxGridDBColumn;
    ImportGridDBTableView1DB_Num_order: TcxGridDBColumn;
    ImportGridDBTableView1DB_Date_project: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
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
    ExitBtn: TdxBarLargeButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    dxBarButton2: TdxBarButton;
    FilterBtn: TdxBarLargeButton;
    ImportGridDBTableView1DB_Hash_code: TcxGridDBColumn;
    ImportGridDBTableView1DB_Date_order: TcxGridDBColumn;
    ImportGridDBTableView1DB_Note: TcxGridDBColumn;
    cxDateBegN: TcxLabel;
    cxDateEndN: TcxLabel;
    cxDateBegP: TcxLabel;
    cxDateEndP: TcxLabel;
    Label2: TLabel;
    cxLabel1: TcxLabel;
    ImportGridDBTableView1DB_Is_hash: TcxGridDBColumn;
    GridTableViewStyleSheetRose: TcxGridTableViewStyleSheet;
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
    DeleteButton: TdxBarLargeButton;
    procedure RefreshBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure FilterBtnClick(Sender: TObject);
    procedure ImportGridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ImportGridDBTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure DeleteButtonClick(Sender: TObject);
  private
    PRes:Variant;
    PLanguageIndex:Byte;
    PimportAdd:TimportAddform;
    PimportFilter:TimportFilter;
    DateTek:TDate;
    DateBeg:TDate;
    DateEnd:TDate;

  public
    id_session:Int64;
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;FilterParams:TimportFilter); reintroduce;
    property Res:Variant read PRes;
  end;

var
  fmImportCurrentPremiya: TfmImportCurrentPremiya;

implementation

uses ZProc;


{$R *.dfm}
constructor TfmImportCurrentPremiya.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;FilterParams:TimportFilter);
begin

//******************************************************************
  inherited Create(AOwner);
  PLanguageIndex                      := LanguageIndex;
  RefreshBtn.Caption                  := GetConst('Refresh',tcButton);
  ExitBtn.Caption                     := GetConst('Exit',tcButton);
 //******************************************************************
  DM:=TDM.Create(AOwner,Db_Handle);
  id_session := DM.DB.Gen_Id('GEN_Z_IMP_CUR_PREM_SESSION',1);
  RefreshBtn.Click;

  PimportFilter.oldFilterDataBegN := DateBeg;
  PimportFilter.oldFilterDataEndN := DateEnd;
  PimportFilter.oldFilterDataBegP := DateBeg;
  PimportFilter.oldFilterDataEndP := DateEnd;
  PimportFilter.FilterDataBegN    := DateBeg;
  PimportFilter.FilterDataEndN    := DateEnd;
  PimportFilter.FilterDataBegP    := DateBeg;
  PimportFilter.FilterDataEndP    := DateEnd;
  PimportFilter.is_period_P       := true;
  PimportFilter.is_period_N       := true;
  PimportFilter.is_type           := false;
  PimportFilter.Filter_session    := id_session;
end;

procedure TfmImportCurrentPremiya.RefreshBtnClick(Sender: TObject);
var
    wf:TForm;
begin
    wf := ShowWaitForm(Self,zwfPrepareData);
    DateTek            := Encodedate(YearOf(Date), MonthOf(Date), 1);
    DateBeg            := IncMonth(DateTek, -1);
    DateEnd            := IncMonth(DateTek, 1);
    cxDateBegN.Caption := DateToStr(DateBeg);
    cxDateEndN.Caption := DateToStr(DateEnd);
    cxDateBegP.Caption := DateToStr(DateBeg);
    cxDateEndP.Caption := DateToStr(DateEnd);

    cxDateBegN.Visible := True;
    cxDateEndN.Visible := True;
    cxDateBegP.Visible := True;
    cxDateEndP.Visible := True;

    DM.DSetMain.Close;
    DM.DSetMain.SQLs.SelectSQL.Text := 'SELECT DISTINCT * FROM Z_IMP_CUR_PREM_S(:ID_SESSION, :DATE_BEG_PROJECT, :DATE_END_PROJECT, :DATE_BEG_ORDER, :DATE_END_ORDER)';
    DM.DSetMain.ParamByName('DATE_BEG_PROJECT').Value := DateBeg;
    DM.DSetMain.ParamByName('DATE_END_PROJECT').Value := DateEnd;
    DM.DSetMain.ParamByName('DATE_BEG_ORDER').Value   := DateBeg;
    DM.DSetMain.ParamByName('DATE_END_ORDER').Value   := DateEnd;
    DM.DSetMain.ParamByName('ID_SESSION').Value       := id_session;
    DM.DSetMain.Open;

    CloseWaitForm(wf);
end;

procedure TfmImportCurrentPremiya.ExitBtnClick(Sender: TObject);
begin
//  if (DM.ReadTranzaction.Active=true) then
//  DM.ReadTranzaction.Commit;

  DM.pFIBStoredProc.Transaction.StartTransaction;
  DM.pFIBStoredProc.StoredProcName                    := 'Z_IMP_CUR_PREM_TYPE_DEL';
  DM.pFIBStoredProc.ParamByName('ID_SESSION').AsInt64 := id_session;
  DM.pFIBStoredProc.ParamByName('ID_TYPE').AsVariant    := null;
  DM.pFIBStoredProc.ExecProc;
  DM.pFIBStoredProc.Transaction.Commit;

 { DM.ReadTranzaction.StartTransaction;
  DM.DSet_.Close;
  DM.DSet_.SelectSQL.Text := 'execute procedure Z_IMP_CUR_PREM_TYPE_DEL(:ID_TYPE,:ID_SESSION);';
  DM.DSet_.ParamByName('ID_SESSION').Value :=  id_session;
  DM.DSet_.ParamByName('ID_TYPE').Value    :=  null;
  DM.DSet_.Open;
  DM.ReadTranzaction.Commit;   }

  close;

end;

procedure TfmImportCurrentPremiya.AddButtonClick(Sender: TObject);
var
  ViewForm : TfmAddForm;
  id_ord:Integer;
  wf: TForm;
begin
  id_ord   := DM.DSetMain['ID_ORDER'];
  ViewForm := TfmAddForm.Create(Self,DM.DB.Handle,PimportAdd);
  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrOK then
    begin
     try
      PimportAdd.Kod_Setup := ViewForm.Parameter.Kod_Setup;
      PimportAdd.Id_VidOpl := ViewForm.Parameter.Id_VidOpl;

      wf:=ShowWaitForm(self, zwfDoFunction);

      DM.pFIBStoredProc.Transaction.StartTransaction;

     { DM.DSetImport.Close;
      DM.DSetImport.SelectSQL.Text:= 'select * from Z_IMP_CURRENT_PREMIYA(:id_vidopl, :id_order, :kod_setup)';
      DM.DSetImport.ParamByName('id_vidopl').Value := PimportAdd.Id_VidOpl;
      DM.DSetImport.ParamByName('id_order').Value  := DM.DSetMain['ID_ORDER'];
      DM.DSetImport.ParamByName('kod_setup').Value := PimportAdd.Kod_Setup;
      DM.DSetImport.Open;    }


      DM.pFIBStoredProc.StoredProcName := 'Z_IMP_CURRENT_PREMIYA';
      DM.pFIBStoredProc.ParamByName('id_vidopl').Value := PimportAdd.Id_VidOpl;
      DM.pFIBStoredProc.ParamByName('id_order').Value  := DM.DSetMain['ID_ORDER'];
      DM.pFIBStoredProc.ParamByName('kod_setup').Value := PimportAdd.Kod_Setup;
      DM.pFIBStoredProc.ExecProc;
      DM.pFIBStoredProc.Transaction.Commit;

      DM.DSetMain.SQLs.UpdateSQL.Text:='SELECT DISTINCT * FROM Z_IMP_CUR_PREM_S(:ID_SESSION, :DATE_BEG_PROJECT, :DATE_END_PROJECT, :DATE_BEG_ORDER, :DATE_END_ORDER) where id_order = '+IntToStr(id_ord);
      DM.DSetMain.ParamByName('DATE_BEG_PROJECT').Value := DateBeg;
      DM.DSetMain.ParamByName('DATE_END_PROJECT').Value := DateEnd;
      DM.DSetMain.ParamByName('DATE_BEG_ORDER').Value   := DateBeg;
      DM.DSetMain.ParamByName('DATE_END_ORDER').Value   := DateEnd;
      DM.DSetMain.ParamByName('ID_SESSION').Value       := id_session;

      DM.DSetMain.Edit;
      DM.DSetMain.Post;

      //DM.WriteTransaction.Commit;
      //DM.ReadTranzaction.Commit;
      //DM.DSetMain.Close;
      //DM.DSetMain.Open;
      //DM.DSetMain.Locate('ID_ORDER',id_ord,[]);
      CloseWaitForm(wf);
      ZShowMessage(TFSprSubs_LabelTo_Caption,'Документ проімпортован',mtInformation,[mbOK]);

     except on E: Exception do
      begin
        zshowMessage(Error_Caption[pLanguageIndex],e.Message,mtError,[mbOk]);
        CloseWaitForm(wf);
        DM.WriteTransaction.Rollback;
      end;
     end;
    end;

end;

procedure TfmImportCurrentPremiya.FilterBtnClick(Sender: TObject);
var
  ViewForm : TfmFilterForm;
  wf:TForm;
begin
  ViewForm := TfmFilterForm.Create(Self,DM.DB.Handle,PimportFilter);
  ViewForm.ShowModal;
  
  if ViewForm.ModalResult = mrYes then
   begin
    PimportFilter := ViewForm.Parameter;

    wf            := ShowWaitForm(Self,zwfPrepareData);
    //wf.Position   := poDesktopCenter;

    cxDateBegN.Caption := DateToStr(PimportFilter.FilterDataBegN);
    cxDateEndN.Caption := DateToStr(PimportFilter.FilterDataEndN);
    cxDateBegP.Caption := DateToStr(PimportFilter.FilterDataBegP);;
    cxDateEndP.Caption := DateToStr(PimportFilter.FilterDataEndP);

    DM.DSetMain.Close;
    DM.DSetMain.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM Z_IMP_CUR_PREM_S(:ID_SESSION, :DATE_BEG_PROJECT, :DATE_END_PROJECT, :DATE_BEG_ORDER, :DATE_END_ORDER)';
    DM.DSetMain.ParamByName('DATE_BEG_PROJECT').Value := PimportFilter.FilterDataBegP;
    DM.DSetMain.ParamByName('DATE_END_PROJECT').Value := PimportFilter.FilterDataEndP;
    DM.DSetMain.ParamByName('DATE_BEG_ORDER').Value   := PimportFilter.FilterDataBegN;
    DM.DSetMain.ParamByName('DATE_END_ORDER').Value   := PimportFilter.FilterDataEndN;
    DM.DSetMain.ParamByName('ID_SESSION').AsInt64     := PimportFilter.Filter_session;
    DM.DSetMain.Open;

    if PimportFilter.is_period_P=False then
     begin
       cxDateBegP.Visible := False;
       cxDateEndP.Visible := False;
     end
    else
     begin
       cxDateBegP.Visible := true;
       cxDateEndP.Visible := true;
     end;


    if PimportFilter.is_period_N=False then
     begin
       cxDateBegN.Visible := False;
       cxDateEndN.Visible := False;
     end
    else
     begin
       cxDateBegN.Visible := true;
       cxDateEndN.Visible := true;
     end;

    CloseWaitForm(wf);
   end

end;

procedure TfmImportCurrentPremiya.ImportGridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
   if (DM.DSetMain['import']='T') then
    begin
     AddButton.Enabled    := False;
     DeleteButton.Enabled := True;
    end
   else
    begin
     AddButton.Enabled := True;
     DeleteButton.Enabled := False;
     end;
end;

procedure TfmImportCurrentPremiya.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 // DM.DSet_.SelectSQL.Text := 'DELETE FROM Z_IMP_CUR_PREMIYA_TYPE where ID_SESSION='+IntToStr(id_session)+';';
 // if (DM.ReadTranzaction.Active=true) then
//  DM.ReadTranzaction.Commit;

  DM.pFIBStoredProc.Transaction.StartTransaction;
  DM.pFIBStoredProc.StoredProcName                    := 'Z_IMP_CUR_PREM_TYPE_DEL';
  DM.pFIBStoredProc.ParamByName('ID_SESSION').AsInt64 := id_session;
  DM.pFIBStoredProc.ParamByName('ID_TYPE').AsVariant  := null;
  DM.pFIBStoredProc.ExecProc;
  DM.pFIBStoredProc.Transaction.Commit;

  if formstyle = fsMDIChild then
   begin
     action := caFree;
   end
  else DM.free;

end;

procedure TfmImportCurrentPremiya.ImportGridDBTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if ARecord.DisplayTexts[7]='F' then
  AStyle:=cxStyle15 ;
end;

procedure TfmImportCurrentPremiya.DeleteButtonClick(Sender: TObject);
var
  id_ord:Integer;
  wf: TForm;
begin
 id_ord   := DM.DSetMain['ID_ORDER'];

 if  ZShowMessage(TFSprSubs_LabelTo_Caption,'Ви дійсно бажаєте разімпортувати наказ?',mtInformation,[mbOk,mbCancel])=mrOk then
  begin
   try
    wf:=ShowWaitForm(self, zwfDoFunction);

    DM.pFIBStoredProc.Transaction.StartTransaction;
    DM.pFIBStoredProc.StoredProcName                    := 'Z_IMP_CUR_PREMIYA_DEL';
    DM.pFIBStoredProc.ParamByName('ID_ORDER').Value     := DM.DSetMain['ID_ORDER'];
    DM.pFIBStoredProc.ExecProc;
    DM.pFIBStoredProc.Transaction.Commit;

    DM.DSetMain.Close;
    DM.DSetMain.Open;
    DM.DSetMain.Locate('ID_ORDER',id_ord,[]);
    CloseWaitForm(wf);
    ZShowMessage(TFSprSubs_LabelTo_Caption,'Документ разімпортован',mtInformation,[mbOK]);

   except on E: Exception do
    begin
     ZShowMessage(TFSprSubs_LabelTo_Caption,'Документ не разімпортован',mtError,[mbOK]);
     CloseWaitForm(wf);
     DM.pFIBStoredProc.Transaction.Rollback;
    end;
   end;
  end;
end;

end.
