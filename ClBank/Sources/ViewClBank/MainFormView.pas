unit MainFormView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, StdCtrls, ComCtrls,
  cxGridBandedTableView, FIBDataSet, pFIBDataSet,IBase, ToolWin, Buttons,
  cxCalc, cxButtonEdit, cxMaskEdit, cxLabel, cxDropDownEdit, cxCalendar,
  cxCheckBox, cxContainer, cxTextEdit, cxMemo, ExtCtrls,LoaderClBank,
  ImgList, cxCurrencyEdit,ConstClBank, FIBQuery, pFIBQuery, pFIBStoredProc,
  frxClass, frxDesgn, frxDBSet, Menus, cxDBEdit, cxDBLabel, frxExportXLS,
  frxExportRTF, frxExportXML;

type
  TfrmMainFormView = class(TForm)
    Database: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    pFIBDataSet: TpFIBDataSet;
    DataSource: TDataSource;
    NATIVE_RS: TcxGridDBColumn;
    DATE_DOC: TcxGridDBColumn;
    DATE_VIP: TcxGridDBColumn;
    CUSTOMER_NAME: TcxGridDBColumn;
    NUM_DOC: TcxGridDBColumn;
    SUM_DOC_PR: TcxGridDBColumn;
    SUM_DOC_RAS: TcxGridDBColumn;
    TYPE_DOC: TcxGridDBColumn;
    ToolBar1: TToolBar;
    ToolButtonFind: TToolButton;
    ToolButtonRefresh: TToolButton;
    StyleRepository: TcxStyleRepository;
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
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    ToolButtonADD: TToolButton;
    ToolButtonEdit: TToolButton;
    ImageList1: TImageList;
    ToolButtonExit: TToolButton;
    GroupBox2: TGroupBox;
    LabelRsCustomer: TLabel;
    IS_DELETE: TcxGridDBColumn;
    IS_WORK_DOC: TcxGridDBColumn;
    IS_ADD_CLBANK: TcxGridDBColumn;
    ToolButtonDelete: TToolButton;
    pFIBStoredProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    ToolButton1: TToolButton;
    FROM_DOC: TcxGridDBColumn;
    PanelWait: TPanel;
    Timer1: TTimer;
    ToolButtonPrint: TToolButton;
    frxDBDataset: TfrxDBDataset;
    frxDesigner: TfrxDesigner;
    Image1: TImage;
    frxReport1: TfrxReport;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    RATE_ACCOUNT_NAT: TcxGridDBColumn;
    PrintGroup: TMenuItem;
    frxReport: TfrxReport;
    cxDBMemo1: TcxDBMemo;
    cxDBTextEdit1: TcxDBTextEdit;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    PopupMenu2: TPopupMenu;
    ActionDel: TMenuItem;
    ActionDelAll: TMenuItem;
    Query: TpFIBQuery;
    DATE_PROV: TcxGridDBColumn;
    
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ToolButtonFindClick(Sender: TObject);
    procedure ToolButtonADDClick(Sender: TObject);
    procedure ToolButtonEditClick(Sender: TObject);
    procedure ToolButtonExitClick(Sender: TObject);
    procedure ToolButtonRefreshClick(Sender: TObject);
    procedure cxGridDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ToolButtonDeleteClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure PrintGroupClick(Sender: TObject);
    procedure ActionDelClick(Sender: TObject);
    procedure ActionDelAllClick(Sender: TObject);
  private
    id_session : int64;
    constructor Create(AOwner : TComponent;DBH:TISC_DB_HANDLE);overload;
  public
    procedure RefreshData();
    { Public declarations }
  end;
  function ViewClBank(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  exports ViewClBank;
var
  frmMainFormView: TfrmMainFormView;
  paramFN:Variant;
  ColorFont:Tcolor;
  FlClose:Integer;
  FlFirstRun:Integer;
implementation
uses
  FindForm;
{$R *.dfm}
function ViewClBank(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
var
  View: TfrmMainFormView;
begin
  View:=TfrmMainFormView.Create(AOwner,DB);
end;


constructor TfrmMainFormView.Create(AOwner : TComponent;DBH:TISC_DB_HANDLE);
var
  i:Integer;
begin
  inherited Create(AOwner);
  Database.Handle:=DBH;

  pFIBDataSet.Database             := Database;
  pFIBDataSet.Transaction          := Transaction;

  Transaction.StartTransaction;
  FlFirstRun:=0;

  FlClose := 0;
  DecimalSeparator := ',';
  cxDBMemo1.Text :='';
  colorFont:=cxGrid.Canvas.Font.Color;
  cxDBTextEdit1.Text:=ConstClBank.ClBank_rs_customer;

  ToolButtonADD.Caption:=ConstClBank.ClBank_ACTION_ADD_CONST;
  ToolButtonEdit.Caption:=ConstClBank.ClBank_ACTION_EDIT_CONST;
  ToolButtonDelete.Caption:=ConstClBank.ClBank_ACTION_DELETE_CONST;
  ToolButtonRefresh.Caption:=ConstClBank.ClBank_ACTION_REFRESH_CONST;
  ToolButtonFind.Caption:=ConstClBank.ClBank_ACTION_FILTER_CONST;
  ToolButtonExit.Caption:=ConstClBank.ClBank_ACTION_CLOSE_CONST;
  ToolButtonPrint.Caption:=ConstClBank.ClBank_ACTION_PRINT_CONST;
  ActionDel.Caption:=ConstClBank.ClBank_ACTION_DELETE_CONST;
  ActionDelAll.Caption:=ConstClBank.ClBank_ACTION_DELETE_ALL_CONST;

  id_session := Database.Gen_Id('CLBANK_ALL_DOC_VIEW_GEN', 1);

  ParamFN:=VarArrayCreate([0,11],varVariant);
  for i:=0 to 11 do
    begin
      ParamFN[i]:=VarArrayOf([0,0,0,0,0]);
    end;
  Timer1.Enabled:=true;
end;




procedure TfrmMainFormView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Query.Transaction := WriteTransaction;
    WriteTransaction.StartTransaction;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM CLBANK_ALL_DOC_VIEW_TMP WHERE ID_SESSION='+IntToStr(id_session)+'');
    Query.ExecQuery;
    WriteTransaction.Commit;

    Action:=caFree;
end;

procedure TfrmMainFormView.RefreshData();
begin
    PanelWait.Visible:=true;
    Refresh;

    Query.Database                   := Database;
    Query.Transaction                := WriteTransaction;


    WriteTransaction.StartTransaction;

    Query.close;
    Query.SQL.Clear;
    Query.SQL.Text := 'INSERT INTO CLBANK_ALL_DOC_ViEW_TMP (ID_doc, ID_SESSION,TYPE_DOC)';
    Query.SQL.Add('select distinct c.id_doc as id_doc, '+IntToStr(id_session)+' as ID_SESSION, '+IntToStr(1)+' as TYPE_DOC_');
    Query.SQL.Add('from  clbank_buff c');
    if paramFN[6][0]=1 then
    begin
         Query.SQL.Add(', PUB_SP_CUSTOMER cust, PUB_SP_CUST_RATE_ACC cust_acc ');
    end;
    Query.SQL.Add('where  c.id_doc>0');

    {по дате докумена}
    if paramFN[0][0]=1 then
    begin
        if paramFN[0][1]=1 then
        begin
            Query.SQL.Add('and c.DATE_DOC >='''+DateToStr(paramFN[0][2])+'''');
        end;
        if paramFN[0][3]=1 then
        begin
            Query.SQL.Add('AND c.DATE_DOC <='''+DateToStr(paramFN[0][4])+'''');
        end;
    end;
    {по дате банковской выписки}
    if paramFN[1][0]=1 then
    begin
        if paramFN[1][1]=1 then
        begin
             Query.SQL.Add('and c.date_vip >='''+DateToStr(paramFN[1][2])+'''');
        end;
        if paramFN[1][3]=1 then
        begin
            Query.SQL.Add('and c.date_doc<='''+DateToStr(paramFN[1][4])+'''');
        end;
    end;

    {по номеру документа}
    if paramFN[2][0]=1 then
    begin
        Query.SQL.Add(' and c.num_doc Like '''+'%'+ paramFN[2][1]+'%'+'''');
    end;

    {по сумме}
    if paramFN[3][0]=1 then
    begin
        if paramFN[3][1]=1 then
        begin
            Query.SQL.Add(' and c.SUM_DOC>='+StringReplace(vartostr(paramFN[3][2]), ',', '.', [rfReplaceAll])+'');
        end;
        if paramFN[3][3]=1 then
        begin
            Query.SQL.Add(' and c.SUM_DOC<='+StringReplace(vartostr(paramFN[3][4]), ',', '.', [rfReplaceAll])+'');
        end;
    end;

    {то приходу/расходу}
    if paramFN[4][0]=1 then
    begin
        if paramFN[4][1]=1 then
        begin
            Query.SQL.Add('AND c.TYPE_DOC=1');
        end;
        if paramFN[4][1]=2 then
        begin
            Query.SQL.Add('AND c.TYPE_DOC=-1');
        end;
    end;


  // по нашему р/с *
    if paramFN[5][0]=1 then
    begin
        Query.SQL.Add('AND c.id_account_native='+VarToStr(paramFN[5][1])+'');
    end;

  {по контрагенту}
    if paramFN[6][0]=1 then
    begin
        if paramFN[6][1]=0 then
        begin
             Query.SQL.Add('AND cust.id_customer='+VarToStr(paramFN[6][2])+'');
             Query.SQL.Add('AND cust.id_customer=cust_acc.id_customer and cust_acc.id_rate_account=c.id_account_customer');
        end;
        if paramFN[6][1]=1 then
        begin
            Query.SQL.Add(' and upper(cust.name_customer) Like '''+'%'+AnsiUpperCase(paramFN[6][4])+'%'+'''');
            Query.SQL.Add('AND cust.id_customer=cust_acc.id_customer and cust_acc.id_rate_account=c.id_account_customer');
        end;
    end;

  //по р/с контрагента *
    if paramFN[7][0]=1 then
    begin
        Query.SQL.Add('AND c.id_account_customer='+VarToStr(paramFN[7][1])+'');
    end;

  //по основанию докумета *
    if paramFN[8][0]=1 then
    begin
        Query.SQL.Add(' and upper(c.note) Like'''+'%'+AnsiUpperCase(paramFN[8][1])+'%'+'''');
    end;

    {то обработан/не обработан}
    if paramFN[9][0]=1 then
    begin
        if paramFN[9][1]=0 then
        begin
            Query.SQL.Add('AND (c.obrabotan=0 or c.obrabotan is null)');
        end;
        if paramFN[9][1]=1 then
        begin
            Query.SQL.Add('AND c.obrabotan=1');
        end;
    end;


  {удален не удален}
    if paramFN[10][0]=1 then
    begin
        if paramFN[10][1]=0 then
        begin

            Query.SQL.Add('AND c.IS_DELETE=0');
        end;
    end;

    Query.ExecQuery;

/////////////////////////////////////////////////////////////////////////////////////////
    Query.close;
    Query.SQL.Text := 'INSERT INTO CLBANK_ALL_DOC_ViEW_TMP (ID_doc, ID_SESSION,TYPE_DOC)';
    Query.SQL.Add('select distinct d.id_key as id_doc, '+IntToStr(id_session)+' as ID_SESSION, '+IntToStr(2)+' as TYPE_DOC_');
    Query.SQL.Add('from  dog_dt_pl_doc d');
    if paramFN[6][0]=1 then
    begin
         Query.SQL.Add(', PUB_SP_CUSTOMER cust');
    end;
    Query.SQL.Add('where  d.id_key>0 and (d.deleted_system=0 OR d.deleted_system=2) ');



  {по дате докумена}
    if paramFN[0][0]=1 then
    begin
        if paramFN[0][1]=1 then
        begin
            Query.SQL.Add('and d.export_day >='''+DateToStr(paramFN[0][2])+'''');
        end;
        if paramFN[0][3]=1 then
        begin
            Query.SQL.Add('AND d.export_day <='''+DateToStr(paramFN[0][4])+'''');
        end;
    end;

  {по дате банковской выписки}
    if paramFN[1][0]=1 then
    begin
        if paramFN[1][1]=1 then
        begin
             Query.SQL.Add('and d.export_day >='''+DateToStr(paramFN[1][2])+'''');
        end;
        if paramFN[1][3]=1 then
        begin
            Query.SQL.Add('and d.export_day<='''+DateToStr(paramFN[1][4])+'''');
        end;
    end;
    {по номеру документа}
    if paramFN[2][0]=1 then
    begin
        Query.SQL.Add(' and d.num_doc Like '''+'%'+ paramFN[2][1]+'%'+'''');
    end;
    {по сумме}
    if paramFN[3][0]=1 then
    begin
        if paramFN[3][1]=1 then
        begin
            Query.SQL.Add(' and d.summa>='+StringReplace(vartostr(paramFN[3][2]), ',', '.', [rfReplaceAll])+'');
        end;
        if paramFN[3][3]=1 then
        begin
            Query.SQL.Add(' and d.summa<='+StringReplace(vartostr(paramFN[3][4]), ',', '.', [rfReplaceAll])+'');
        end;
    end;


    // по нашему р/с *
    if paramFN[5][0]=1 then
    begin
        Query.SQL.Add('AND d.id_rate_account_native='+VarToStr(paramFN[5][1])+'');
    end;
  {по контрагенту}
    if paramFN[6][0]=1 then
    begin
        if paramFN[6][1]=0 then
        begin
             Query.SQL.Add('AND d.id_customer='+VarToStr(paramFN[6][2])+'');
        end;
        if paramFN[6][1]=1 then
        begin
             Query.SQL.Add(' and upper(cust.name_customer) Like '''+'%'+AnsiUpperCase(paramFN[6][4])+'%'+'''');
             Query.SQL.Add('AND cust.id_customer=d.id_customer ');
        end;
    end;

    //по р/с контрагента *
    if paramFN[7][0]=1 then
    begin
        Query.SQL.Add('AND d.id_rate_account='+VarToStr(paramFN[7][1])+'');
    end;
    //по основанию докумета *
    if paramFN[8][0]=1 then
    begin
        Query.SQL.Add(' and upper(d.note) Like'''+'%'+AnsiUpperCase(paramFN[8][1])+'%'+'''');
    end;

    Query.ExecQuery;


    WriteTransaction.Commit;

    pFIBDataSet.Close;
    pFIBDataSet.SQLs.SelectSQL.Text := 'SELECT * FROM CLBANK_FIND_DOC('+ IntToStr(id_session)+')';
    pFIBDataSet.Open;
    pFIBDataSet.FetchAll;

    PanelWait.Visible:=false;
    Refresh;
end;

procedure TfrmMainFormView.SpeedButton1Click(Sender: TObject);
begin
   RefreshData();
end;

procedure TfrmMainFormView.ToolButtonFindClick(Sender: TObject);
var
  Find:TfrmFindForm;
begin
  Find:=TfrmFindForm.Create(self,paramFN);
  paramFN:=Find.FindClBankDoc();

  Query.Transaction := WriteTransaction;
  WriteTransaction.StartTransaction;
  Query.SQL.Clear;
  Query.SQL.Add('DELETE FROM CLBANK_ALL_DOC_VIEW_TMP WHERE ID_SESSION='+IntToStr(id_session)+'');
  Query.ExecQuery;
  WriteTransaction.Commit;

  if Find.closeFind=1 then
    begin
      Find.free;
      RefreshData();
      FlClose:=0;
      FlFirstRun:=1;
    end
  else
  begin
      Find.free;
      FlClose:=1;
      if FlFirstRun = 0
      then Close;
  end;
end;

procedure TfrmMainFormView.ToolButtonADDClick(Sender: TObject);
var
res:Integer;
begin
res:=LoaderClBank.LoadAddDocClBank(self,Database.Handle,fsNormal,0,Date);
if res=0 then
  begin
    RefreshData();
  end;
end;

procedure TfrmMainFormView.ToolButtonEditClick(Sender: TObject);
var
  res:Integer;
begin
if pFIBDataSet.RecordCount=0 then
  begin
    exit;
  end;
res:=LoaderClBank.LoadEditDocClBank(self,Database.Handle,fsNormal,pFIBDataSet.FieldByName('ID_DOC').AsVariant);
if res=0 then
  begin
    RefreshData();
  end;
end;

procedure TfrmMainFormView.ToolButtonExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainFormView.ToolButtonRefreshClick(Sender: TObject);
begin
  RefreshData();
end;

procedure TfrmMainFormView.cxGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect:TRect;
  ind:Integer;
begin
  Arect:=AViewInfo.Bounds;
  ind:=Sender.IndexOfItem(IS_DELETE);

  if AViewInfo.GridRecord.Values[ind]=1 then
    begin
      ACanvas.Canvas.Font.Color:=clSilver;
      ACanvas.Canvas.Font.Style:=[fsStrikeOut];
      ACanvas.Canvas.FillRect(Arect);
    end
    else
    begin
      ACanvas.Canvas.Pen.Color:=colorFont;
      ACanvas.Canvas.Font.Style:=[];
      ACanvas.Canvas.FillRect(Arect);
    end;
end;

procedure TfrmMainFormView.ToolButtonDeleteClick(Sender: TObject);
begin
   if pFIBDataSet.RecordCount=0 then
   begin
      exit;
   end;


  if messageBox(Handle,PChar(ConstClBank.ClBank_MESSAGE_DELETE),
            PChar(ConstClBank.ClBank_MESSAGE_WARNING),MB_OKCANCEL or MB_ICONWARNING)=1 then
  begin

      pFIBDataSet.First;
      while not pFIBDataSet.Eof do
      begin
          LoaderClBank.LoadDelDocClBank(self,Database.Handle,fsNormal,pFIBDataSet.FieldByName('ID_DOC').AsVariant);
          pFIBDataSet.Next;
      end;
    RefreshData();
  end;
end;

procedure TfrmMainFormView.ToolButton1Click(Sender: TObject);
begin
  LoaderClBank.LoadViewDocClBank(self,Database.Handle,fsNormal,pFIBDataSet.FieldByName('id_doc').AsVariant);
end;

procedure TfrmMainFormView.FormShow(Sender: TObject);
begin
  if (FlClose=1) and (FlFirstRun=0) then
    begin
      Close;
    end;
  if (FlClose=1) and (FlFirstRun=0) then
  begin
      Close;
  end;
end;

procedure TfrmMainFormView.Timer1Timer(Sender: TObject);
begin
  timer1.Enabled:=false;
  ToolButtonFindClick(self);
end;

procedure TfrmMainFormView.N1Click(Sender: TObject);
begin
  DataSource.Enabled := false;
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\ClBank\PrintAllDoc.fr3');

  frxReport.PrepareReport(true);
  frxReport.ShowReport(true);
  DataSource.Enabled := true;
  //frxReport.DesignReport;
end;

procedure TfrmMainFormView.N2Click(Sender: TObject);
begin
  DataSource.Enabled := false;
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\ClBank\PrintAllDoc2010.fr3');

  frxReport.PrepareReport(true);
  frxReport.ShowReport(true);
  DataSource.Enabled := true;
  //frxReport.DesignReport;
end;

procedure TfrmMainFormView.PrintGroupClick(Sender: TObject);
begin
  DataSource.Enabled := false;
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\ClBank\PrintAllDoc2011_group_rs.fr3');

  frxReport.PrepareReport(true);
  frxReport.ShowReport(true);
  DataSource.Enabled := true;
  //frxReport.DesignReport;
end;

procedure TfrmMainFormView.ActionDelClick(Sender: TObject);
begin
    if pFIBDataSet.RecordCount=0 then
    begin
        exit;
    end;


    if messageBox(Handle,PChar(ConstClBank.ClBank_DOC_NUM+pFIBDataSet.FieldByName('NUM_DOC').AsString+'?'),
            PChar(ConstClBank.ClBank_MESSAGE_WARNING),MB_OKCANCEL or MB_ICONWARNING)=1 then
    begin
        LoaderClBank.LoadDelDocClBank(self,Database.Handle,fsNormal,pFIBDataSet.FieldByName('ID_DOC').AsVariant);
        RefreshData();
    end;
end;

procedure TfrmMainFormView.ActionDelAllClick(Sender: TObject);
begin
    if pFIBDataSet.RecordCount=0 then
    begin
        exit;
    end;


    if messageBox(Handle,PChar(ConstClBank.ClBank_MESSAGE_DELETE_ALL_NEOBR),
            PChar(ConstClBank.ClBank_MESSAGE_WARNING),MB_OKCANCEL or MB_ICONWARNING)=1 then
    begin
        PanelWait.Visible:=true;
        Refresh;
        pFIBDataSet.First;
        while not pFIBDataSet.Eof do
        begin
            LoaderClBank.LoadDelDocClBank(self,Database.Handle,fsNormal,pFIBDataSet.FieldByName('ID_DOC').AsVariant);
            pFIBDataSet.Next;
        end;
        PanelWait.Visible:=false;
        Refresh;
        RefreshData();
    end;
end;

end.