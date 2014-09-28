unit AcctCard_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, dxBar, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid, ibase, ZProc, AcctCard_Filter, dxBarExtItems,
  zMessages, Unit_ZGlobal_Consts, cxGridBandedTableView,
  cxGridDBBandedTableView, cxTextEdit, RxMemDS, z_uWaitForm, Menus,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxCheckBox;

type
  TFZAcctCard_MainForm = class(TForm)
    GridLevel: TcxGridLevel;
    Grid: TcxGrid;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    SelectBtn: TdxBarLargeButton;
    GridDBBandedTableView: TcxGridDBBandedTableView;
    GridDBBandedTableViewDBBandedColumnFio: TcxGridDBBandedColumn;
    GridDBBandedTableViewDBBandedColumnTin: TcxGridDBBandedColumn;
    GridDBBandedTableViewDBBandedColumnAcctCard: TcxGridDBBandedColumn;
    GridDBBandedTableViewDBBandedColumnFfio: TcxGridDBBandedColumn;
    GridDBBandedTableViewDBBandedColumnFtin: TcxGridDBBandedColumn;
    GridDBBandedTableViewDBBandedColumnFAcctCard: TcxGridDBBandedColumn;
    GridDBBandedTableViewDBBandedColumnWTypePayment: TcxGridDBBandedColumn;
    GridDBBandedTableViewDBBandedColumnRType: TcxGridDBBandedColumn;
    GridDBBandedTableViewDBBandedColumnGTypePayment: TcxGridDBBandedColumn;
    GridDBBandedTableViewDBBandedColumnRCheck: TcxGridDBBandedColumn;
    GridDBBandedTableViewDBBandedColumnWTpCheck: TcxGridDBBandedColumn;
    GridDBBandedTableViewDBBandedColumnGTpCheck: TcxGridDBBandedColumn;
    PrintBtn: TdxBarLargeButton;
    PopupMenu: TPopupMenu;
    TPZarplataSubMenu: TMenuItem;
    TPGrantSubMenu: TMenuItem;
    AcctCardSubMenu: TMenuItem;
    AcctCardCheckBtn: TMenuItem;
    AcctCardUnCheckBtn: TMenuItem;
    TPZarplataCheckBtn: TMenuItem;
    TPZarplataUnCheckBtn: TMenuItem;
    TPGrantCheckBtn: TMenuItem;
    TPGrantUnCheckBtn: TMenuItem;
    GridDBBandedTableViewDBBandedColumnDateEndWork: TcxGridDBBandedColumn;
    GridDBBandedTableViewDBBandedColumnDateEndStud: TcxGridDBBandedColumn;
    GridDBBandedTableViewDBBandedColumnDateEndGrant: TcxGridDBBandedColumn;
    ClearBtn: TdxBarLargeButton;
    FilterBtn: TdxBarLargeButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitBtnClick(Sender: TObject);
    procedure GridDBBandedTableViewDBBandedColumnRTypeGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure PrintBtnClick(Sender: TObject);
    procedure AcctCardCheckBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure FilterBtnClick(Sender: TObject);
  private
    PLanguageIndex:Byte;
    PDb_Handle:TISC_DB_HANDLE;
    PId_Type_Payment:integer;
    MemoryData: TRxMemoryData;
    PIs_Work: string;
    PIs_Grant: string;
    PBankName:string;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

uses AcctCard_DM, FIBQuery;

var
  DM: TDM;
  FilterForm:TFZAcctCard_Filter;

{$R *.dfm}
constructor TFZAcctCard_MainForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
var i:byte;
    wf: TForm;
begin
  FilterForm:=TFZAcctCard_Filter.Create(AOwner,DB_Handle);
if(FilterForm.ShowModal=mrYes)then
begin
  inherited Create(AOwner);
  PLanguageIndex:=LanguageIndex;
  PDb_Handle:=DB_Handle;
  PId_Type_Payment:=FilterForm.Id_Type_Payment;
  PIs_Work:=FilterForm.IsZarplata;
  PIs_Grant:=FilterForm.IsGrant;
  PBankName:=FilterForm.BankName;
//******************************************************************************
  Caption                   := 'Звіт';
  self.WindowState:=wsMaximized;
//******************************************************************************
  RefreshBtn.Caption                           := RefreshBtn_Caption[PLanguageIndex];
  PrintBtn.Caption                             := PrintBtn_Caption[PLanguageIndex];
  ClearBtn.Caption                             := ClearBtn_Caption[PLanguageIndex];
  ExitBtn.Caption                              := ExitBtn_Caption[PLanguageIndex];
  SelectBtn.Caption                            := 'Обробити';
  ClearBtn.Hint                                := 'Вилучити усі картки і типи виплат данного банку з бази';
  FilterBtn.Caption                            := FilterBtn_Caption[PLanguageIndex];
//******************************************************************************
  GridDBBandedTableView.Bands[1].Caption:=GridClFIO_Caption[PLanguageIndex];
  GridDBBandedTableViewDBBandedColumnFio.Caption:='';
  GridDBBandedTableViewDBBandedColumnFfio.Caption:='';
  GridDBBandedTableView.Bands[2].Caption:=GridClTin_Caption[PLanguageIndex];
  GridDBBandedTableViewDBBandedColumnTin.Caption:='';
  GridDBBandedTableViewDBBandedColumnFtin.Caption:='';
  GridDBBandedTableView.Bands[3].Caption:=Label_Acct_Card[PLanguageIndex];
  GridDBBandedTableViewDBBandedColumnAcctCard.Caption:='';
  GridDBBandedTableViewDBBandedColumnFAcctCard.Caption:='';
  GridDBBandedTableView.Bands[4].Caption:=GridClTypePayment_Caption[PLanguageIndex];
  GridDBBandedTableViewDBBandedColumnWTypePayment.Caption:='Заробітна плата';
  GridDBBandedTableViewDBBandedColumnGTypePayment.Caption:='Стипендія';
  GridDBBandedTableViewDBBandedColumnRType.Caption:=GridClNameVidopl_Caption[PLanguageIndex];
  GridDBBandedTableView.Bands[5].Caption:='Закінчення';
  GridDBBandedTableViewDBBandedColumnDateEndWork.Caption:='роботи';
  GridDBBandedTableViewDBBandedColumnDateEndStud.Caption:='навчання';
  GridDBBandedTableViewDBBandedColumnDateEndGrant.Caption:='стипендії';
//******************************************************************************
  DM:=TDM.Create(Self);
  DM.DSet.SQLs.SelectSQL.Text:='SELECT * FROM Z_UTIL_IMPORT_ACCTCARD_DIF('+IntToStr(PId_Type_Payment)+','''+PIs_work+''','''+PIs_Grant+''') ORDER BY RTYPE';
  try
    wf:=ShowWaitForm(TForm(Aowner),zwfSelectData);
    DM.DB.Handle:=PDb_Handle;
    DM.DSet.Open;
    CloseWaitForm(wf);
  except
    on E:Exception do
    begin
      CloseWaitForm(wf);
      ZShowMessage(Error_Caption[PLanguageIndex],
                   E.Message,mtError,[mbOK]);
    end;
  end;
  MemoryData:=TRxMemoryData.Create(self);
  MemoryData.FieldDefs.Add('TIN',ftString,10);
  MemoryData.FieldDefs.Add('ACCT_CARD',ftString,16);
  MemoryData.FieldDefs.Add('FIO',ftString,60);
  MemoryData.FieldDefs.Add('FTIN',ftString,10);
  MemoryData.FieldDefs.Add('FACCT_CARD',ftString,16);
  MemoryData.FieldDefs.Add('FFIO',ftString,80);
  MemoryData.FieldDefs.Add('RTYPE',ftSmallint);
  MemoryData.FieldDefs.Add('RCHECK',ftBoolean);
  MemoryData.FieldDefs.Add('WTYPE_PAYMENT',ftString,15);
  MemoryData.FieldDefs.Add('GTYPE_PAYMENT',ftString,15);
  MemoryData.FieldDefs.Add('WTPCHECK',ftBoolean);
  MemoryData.FieldDefs.Add('GTPCHECK',ftBoolean);
  MemoryData.FieldDefs.Add('DATE_END_WORK',ftDate);
  MemoryData.FieldDefs.Add('DATE_END_STUD',ftDate);
  MemoryData.FieldDefs.Add('DATE_END_GRANT',ftDate);
  MemoryData.Open;
  DM.DSet.First;
  while not(DM.DSet.Eof)do
  begin
    MemoryData.Insert;
    MemoryData['TIN']:=DM.DSet['TIN'];
    MemoryData['ACCT_CARD']:=DM.DSet['ACCT_CARD'];
    MemoryData['FIO']:=DM.DSet['FIO'];
    MemoryData['FTIN']:=DM.DSet['FTIN'];
    MemoryData['FACCT_CARD']:=DM.DSet['FACCT_CARD'];
    MemoryData['FFIO']:=DM.DSet['FFIO'];
    MemoryData['RTYPE']:=DM.DSet['RTYPE'];
    MemoryData['RCHECK']:=False;
    MemoryData['WTYPE_PAYMENT']:=DM.DSet['WTYPE_PAYMENT'];
    MemoryData['GTYPE_PAYMENT']:=DM.DSet['GTYPE_PAYMENT'];
    MemoryData['WTPCHECK']:=False;
    MemoryData['GTPCHECK']:=False;
    MemoryData['DATE_END_WORK']:=DM.DSet['DATE_END_WORK'];
    MemoryData['DATE_END_STUD']:=DM.DSet['DATE_END_STUD'];
    MemoryData['DATE_END_GRANT']:=DM.DSet['DATE_END_GRANT'];
    MemoryData.Post;
    DM.DSet.Next
  end;
  GridDBBandedTableView.DataController.DataSource:=DM.DSource;
  DM.DSource.DataSet:=MemoryData;
  if(PIs_Work='F')then
  begin
    GridDBBandedTableViewDBBandedColumnWTypePayment.Visible:=false;
    GridDBBandedTableViewDBBandedColumnWTpCheck.Visible:=false;
    GridDBBandedTableViewDBBandedColumnDateEndWork.Visible:=false;
  end;
  if(PIs_Grant='F')then
  begin
    GridDBBandedTableViewDBBandedColumnGTypePayment.Visible:=false;
    GridDBBandedTableViewDBBandedColumnGTpCheck.Visible:=false;
    GridDBBandedTableViewDBBandedColumnDateEndStud.Visible:=false;
    GridDBBandedTableViewDBBandedColumnDateEndGrant.Visible:=false;
  end;
end;
end;

procedure TFZAcctCard_MainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFZAcctCard_MainForm.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFZAcctCard_MainForm.GridDBBandedTableViewDBBandedColumnRTypeGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if(AText='0')then AText:='0-фіз. особу не знайдено в базі';
  if(AText='1')then AText:='1-номери карток не збігаються';
  if(AText='2')then AText:='2-картка не знайдена в базі у даної фіз. особи';
  if(AText='3')then AText:='3-фіз. особу не знайдено у файлі';
  if(AText='4')then AText:='4-тип виплати не збігається';
  if(AText='5')then AText:='5-картковий рахунок закрито';
end;

procedure TFZAcctCard_MainForm.PrintBtnClick(Sender: TObject);
var PrintDSet: TRxMemoryData;
    i: integer;
    RCount: integer;
    wf:TForm;
begin
  try
    wf:=ShowWaitForm(self,zwfPrepareData);
    PrintDSet:=TRxMemoryData.Create(self);
    PrintDSet.CopyStructure(MemoryData);
    RCount:=GridDBBandedTableView.DataController.FilteredRecordCount;
    i:=0;
    while (i<RCount)do
    begin
      GridDBBandedTableView.DataController.FocusedRowIndex:=i;
      PrintDSet.LoadFromDataSet(MemoryData,1,lmAppend);
      Inc(i);
    end;
  finally
    CloseWaitForm(wf);
  end;
  DM.BankName:=PBankName;
  DM.IsWork:=PIs_Work;
  DM.IsGrant:=PIs_Grant;
  DM.Print(PrintDSet);
  GridDBBandedTableView.Focused:=false;
  GridDBBandedTableView.Focused:=true;
  GridDBBandedTableView.DataController.FocusedRowIndex:=0;
end;

procedure TFZAcctCard_MainForm.AcctCardCheckBtnClick(Sender: TObject);
var i: integer;
    id: integer;
    RCount: integer;
    wf:TForm;
begin
  try
    wf:=ShowWaitForm(self,zwfPrepareData);
    id:=GridDBBandedTableView.DataController.FocusedRecordIndex;
    RCount:=GridDBBandedTableView.DataController.FilteredRecordCount;
    i:=0;
    while (i<RCount)do
    begin
      GridDBBandedTableView.DataController.FocusedRowIndex:=i;
      MemoryData.Edit;
      if(TMenuItem(Sender).Name='AcctCardCheckBtn')then
        MemoryData['RCHECK']:=true
      else
      begin
        if(TMenuItem(Sender).Name='AcctCardUnCheckBtn')then
          MemoryData['RCHECK']:=false
        else
        begin
          if(TMenuItem(Sender).Name='TPZarplataCheckBtn')then
            MemoryData['WTPCHECK']:=true
          else
          begin
            if(TMenuItem(Sender).Name='TPZarplataUnCheckBtn')then
              MemoryData['WTPCHECK']:=false
            else
            begin
              if(TMenuItem(Sender).Name='TPGrantCheckBtn')then
                MemoryData['GTPCHECK']:=true
              else
              begin
                if(TMenuItem(Sender).Name='TPGrantUnCheckBtn')then
                  MemoryData['GTPCHECK']:=false
              end;
            end;
          end;
        end;
      end;
      MemoryData.Post;
      Inc(i);
    end;
  finally
    CloseWaitForm(wf);
  end;
  GridDBBandedTableView.DataController.FocusedRecordIndex:=id;
end;

procedure TFZAcctCard_MainForm.RefreshBtnClick(Sender: TObject);
var wf: TForm;
begin
  DM.DSource.DataSet:=nil;
  wf:=ShowWaitForm(self,zwfSelectData);
  DM.DSet.Close;
  MemoryData.Close;
  MemoryData.Open;
  DM.DSet.SQLs.SelectSQL.Text:='SELECT * FROM Z_UTIL_IMPORT_ACCTCARD_DIF('+IntToStr(PId_Type_Payment)+','''+PIs_work+''','''+PIs_Grant+''') ORDER BY RTYPE';
  try
    DM.DSet.Open;
  except
    on E:Exception do
    begin
      CloseWaitForm(wf);
      ZShowMessage(Error_Caption[PLanguageIndex],
                   E.Message,mtError,[mbOK]);
    end;
  end;
  DM.DSet.First;
  while not(DM.DSet.Eof)do
  begin
    MemoryData.Insert;
    MemoryData['TIN']:=DM.DSet['TIN'];
    MemoryData['ACCT_CARD']:=DM.DSet['ACCT_CARD'];
    MemoryData['FIO']:=DM.DSet['FIO'];
    MemoryData['FTIN']:=DM.DSet['FTIN'];
    MemoryData['FACCT_CARD']:=DM.DSet['FACCT_CARD'];
    MemoryData['FFIO']:=DM.DSet['FFIO'];
    MemoryData['RTYPE']:=DM.DSet['RTYPE'];
    MemoryData['RCHECK']:=False;
    MemoryData['WTYPE_PAYMENT']:=DM.DSet['WTYPE_PAYMENT'];
    MemoryData['GTYPE_PAYMENT']:=DM.DSet['GTYPE_PAYMENT'];
    MemoryData['WTPCHECK']:=False;
    MemoryData['GTPCHECK']:=False;
    MemoryData['DATE_END_WORK']:=DM.DSet['DATE_END_WORK'];
    MemoryData['DATE_END_STUD']:=DM.DSet['DATE_END_STUD'];
    MemoryData['DATE_END_GRANT']:=DM.DSet['DATE_END_GRANT'];
    MemoryData.Post;
    DM.DSet.Next
  end;
  MemoryData.First;
  if(PIs_Work='T')then
  begin
    GridDBBandedTableViewDBBandedColumnWTypePayment.Visible:=true;
    GridDBBandedTableViewDBBandedColumnWTpCheck.Visible:=true;
    GridDBBandedTableViewDBBandedColumnDateEndWork.Visible:=true;
  end else
  begin
    GridDBBandedTableViewDBBandedColumnWTypePayment.Visible:=false;
    GridDBBandedTableViewDBBandedColumnWTpCheck.Visible:=false;
    GridDBBandedTableViewDBBandedColumnDateEndWork.Visible:=false;
  end;
  if(PIs_Grant='T')then
  begin
    GridDBBandedTableViewDBBandedColumnGTypePayment.Visible:=true;
    GridDBBandedTableViewDBBandedColumnGTpCheck.Visible:=true;
    GridDBBandedTableViewDBBandedColumnDateEndStud.Visible:=true;
    GridDBBandedTableViewDBBandedColumnDateEndGrant.Visible:=true;
  end else
  begin
    GridDBBandedTableViewDBBandedColumnGTypePayment.Visible:=false;
    GridDBBandedTableViewDBBandedColumnGTpCheck.Visible:=false;
    GridDBBandedTableViewDBBandedColumnDateEndStud.Visible:=false;
    GridDBBandedTableViewDBBandedColumnDateEndGrant.Visible:=false;
  end;
  CloseWaitForm(wf);
  DM.DSource.DataSet:=MemoryData;
end;

procedure TFZAcctCard_MainForm.ClearBtnClick(Sender: TObject);
var wf:TForm;
begin
  try
    wf:=ShowWaitForm(self,zwfDoFunction);
    DM.WTran.StartTransaction;
    with DM.StProc do
    begin
      StoredProcName:='Z_TNACCESS_CLEAR_FOR_TYPE_PAY';
      Prepare;
      ParamByName('ID_TYPE_PAYMENT').AsInteger:=PId_Type_Payment;
      ParamByName('IS_WORK').AsString:=PIs_Work;
      ParamByName('IS_GRANT').AsString:=PIs_Grant;
      ExecProc;
    end;
    DM.WTran.Commit;
    CloseWaitForm(wf);
  except
    on E:Exception do
    begin
      ZShowMessage(Error_Caption[PLanguageIndex],
                   E.Message,mtError,[mbOK]);
      if DM.WTran.InTransaction then DM.WTran.Rollback;
      CloseWaitForm(wf);
    end;
  end;
  ZShowMessage(Information_Caption[PLanguageIndex],
              'Дані успішно видалено',mtInformation,[mbOK]);
  RefreshBtn.Click;
end;

procedure TFZAcctCard_MainForm.SelectBtnClick(Sender: TObject);
var wf:TForm;
begin
  DM.DSource.DataSet:=nil;
  try
    wf:=ShowWaitForm(self,zwfDoFunction);
    MemoryData.First;
    while not(MemoryData.Eof)do
    begin
      if((MemoryData['RCHECK']=true)or(MemoryData['WTPCHECK']=true)or
         (MemoryData['GTPCHECK']=true))then
      begin
        DM.WTran.StartTransaction;
        with DM.StProc do
        begin
          StoredProcName:='Z_TNACCESS_MAN_REFRESH_CARD';
          Prepare;
          ParamByName('ID_TYPE_PAYMENT').AsInteger:=PId_Type_Payment;
          if(MemoryData['RTYPE']=3)then
          begin
            ParamByName('TIN').AsString:=MemoryData['TIN'];
            ParamByName('ACCT_CARD').AsString:=MemoryData['ACCT_CARD'];
          end
          else
          begin
            ParamByName('TIN').AsString:=MemoryData['FTIN'];
            ParamByName('ACCT_CARD').AsString:=MemoryData['FACCT_CARD'];
          end;
          if(MemoryData['RCHECK']=true)then
            ParamByName('RTYPE').AsInteger:=MemoryData['RTYPE']
          else
            ParamByName('RTYPE').AsInteger:=0;
          if(MemoryData['WTPCHECK']=true)then
            ParamByName('IS_WORK').AsString:='T'
          else
            ParamByName('IS_WORK').AsString:='F';
          if(MemoryData['GTPCHECK']=true)then
            ParamByName('IS_GRANT').AsString:='T'
          else
            ParamByName('IS_GRANT').AsString:='F';
          ExecProc;
        end;
        DM.WTran.Commit;
      end;
      MemoryData.Next;
    end;
    CloseWaitForm(wf);
  except
    on E:Exception do
    begin
      ZShowMessage(Error_Caption[PLanguageIndex],
                   E.Message,mtError,[mbOK]);
      if DM.WTran.InTransaction then DM.WTran.Rollback;
      CloseWaitForm(wf);
    end;
  end;
  DM.DSource.DataSet:=MemoryData;
  ZShowMessage(Information_Caption[PLanguageIndex],
              'Операцію виконано успішно',mtInformation,[mbOK]);
  RefreshBtn.Click;
end;

procedure TFZAcctCard_MainForm.FilterBtnClick(Sender: TObject);
begin
  if(FilterForm.ShowModal=mrYes)then
  begin
    PId_Type_Payment:=FilterForm.Id_Type_Payment;
    PIs_Work:=FilterForm.IsZarplata;
    PIs_Grant:=FilterForm.IsGrant;
    PBankName:=FilterForm.BankName;
    RefreshBtn.Click;
  end;
end;

end.
