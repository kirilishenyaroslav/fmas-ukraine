unit BsDocumentMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, DB, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxControls, cxInplaceContainer,
  cxTLData, cxDBTL, dxBar, dxBarExtItems, ActnList, cxMaskEdit, ImgList,
  cxClasses, cxGridTableView,  uCommon_Types, FIBQuery,
  pFIBQuery, pFIBStoredProc, ExtCtrls, DateUtils, cxTextEdit, cxDBEdit,
  cxContainer, cxEdit, cxLabel, uCommon_Messages, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, cxButtonEdit,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxDropDownEdit, uCommon_Loader,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Menus,
  uCommon_Funcs, uConsts, cxCheckBox, cxCalendar, cxMemo;

const
   pnlGridHeight=159;
   frmTop=180;

type
  frmButton = (fbAdd, fbModif, fbDelete, fbSelect, fbExit, fbFilter, fbClear, fbRedo, fbUndo, fbOk, fbCancel);
  frmButtons = set of frmButton;

  TfrmDocument = class(TForm)
    DocDB: TpFIBDatabase;
    DocTransRead: TpFIBTransaction;
    DocTransWrite: TpFIBTransaction;
    ActionList1: TActionList;
    StyleRepository: TcxStyleRepository;
    stBackground: TcxStyle;
    stContent: TcxStyle;
    stContentEven: TcxStyle;
    stContentOdd: TcxStyle;
    stFilterBox: TcxStyle;
    stFooter: TcxStyle;
    stGroup: TcxStyle;
    stGroupByBox: TcxStyle;
    stHeader: TcxStyle;
    stInactive: TcxStyle;
    stIncSearch: TcxStyle;
    stIndicator: TcxStyle;
    stPreview: TcxStyle;
    stSelection: TcxStyle;
    stHotTrack: TcxStyle;
    ContentError: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    ImageList: TImageList;
    StoredProc: TpFIBStoredProc;
    lblRegNumber: TcxLabel;
    RegNumber: TcxTextEdit;
    OutputNumber: TcxTextEdit;
    lblRegDate: TcxLabel;
    lblInputNumber: TcxLabel;
    lblDocStatus: TcxLabel;
    pnlGrid: TPanel;
    pnlMain: TPanel;
    BarManager: TdxBarManager;
    btn: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    btnAdd: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    btnRefresh: TdxBarLargeButton;
    btnSelect: TdxBarLargeButton;
    btnClose: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    btnFliter: TdxBarLargeButton;
    btnClear: TdxBarLargeButton;
    ActClose: TAction;
    ActFilter: TAction;
    ActClear: TAction;
    FIlterGridDBView: TcxGridDBTableView;
    FIlterGridLevel: TcxGridLevel;
    FIlterGrid: TcxGrid;
    DocStatusDS: TDataSource;
    DocStatusDSet: TpFIBDataSet;
    btnRedo: TdxBarLargeButton;
    btnUndo: TdxBarLargeButton;
    ActRedo: TAction;
    ActUndo: TAction;
    TimeEnter: TTimer;
    FilterSet: TpFIBDataSet;
    FilterDS: TDataSource;
    pnlAction: TPanel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    ActOk: TAction;
    ActCancel: TAction;
    ColumnDateBeg: TcxGridDBColumn;
    ColumnDateEnd: TcxGridDBColumn;
    ColumnInputNumber: TcxGridDBColumn;
    ColumnCustServ: TcxGridDBColumn;
    ColumnDocType: TcxGridDBColumn;
    lblDocType: TcxLabel;
    DocTypeBox: TcxLookupComboBox;
    DocTypeDS: TDataSource;
    DocTypeDSet: TpFIBDataSet;
    ColumnRegNumber: TcxGridDBColumn;
    ColumnOutputNumber: TcxGridDBColumn;
    ColumnDeliveryDate: TcxGridDBColumn;
    ColumnRegDate: TcxGridDBColumn;
    Panel1: TPanel;
    lblDateWiring: TcxLabel;
    ColumnDocStatus: TcxGridDBColumn;
    lblUser: TcxLabel;
    lblDocNote: TcxLabel;
    lblRegDateEqual: TcxLabel;
    MenuSigns: TPopupMenu;
    msMoreEqual: TMenuItem;
    msLessEqual: TMenuItem;
    msEqual: TMenuItem;
    msMore: TMenuItem;
    msLess: TMenuItem;
    msNotEqual: TMenuItem;
    DisObjStyleRepository: TcxStyleRepository;
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
    DisObjectGridStyle: TcxGridTableViewStyleSheet;
    BsConstDset: TpFIBDataSet;
    btnCnt: TdxBarLargeButton;
    btnPrint: TdxBarLargeButton;
    PrintMenu: TdxBarPopupMenu;
    btnQuittance: TdxBarLargeButton;
    btnExampleFill: TdxBarLargeButton;
    InputNumber: TcxTextEdit;
    lblOuputNumber: TcxLabel;
    lblDeliveryDate: TcxLabel;
    CustServiceBox: TcxLookupComboBox;
    lblCustServ: TcxLabel;
    CustServDSet: TpFIBDataSet;
    CustServDS: TDataSource;
    RegDate: TcxDateEdit;
    PeriodBox: TGroupBox;
    DateBeg: TcxDateEdit;
    DateEnd: TcxDateEdit;
    lblDateBeg: TcxLabel;
    lblDateEnd: TcxLabel;
    CustServBox: TGroupBox;
    DeliveryDate: TcxDateEdit;
    DocStatusBox: TcxLookupComboBox;
    DateWiring: TcxDateEdit;
    DocNote: TcxMemo;
    dxBarLargeButton1: TdxBarLargeButton;
    ColumnDateWiring: TcxGridDBColumn;
    ColumnUser: TcxGridDBColumn;
    ActIns: TAction;
    ActEdit: TAction;
    ActDel: TAction;
    ActSelect: TAction;
    UserBox: TcxLookupComboBox;
    UserDSet: TpFIBDataSet;
    UserDS: TDataSource;
    btnMode: TdxBarLargeButton;
    procedure ActOkExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActCancelExecute(Sender: TObject);
    procedure ActCloseExecute(Sender: TObject);
    procedure ActFilterExecute(Sender: TObject);
    procedure ActUndoExecute(Sender: TObject);
    procedure TimeEnterTimer(Sender: TObject);
    procedure FilterSetEndScroll(DataSet: TDataSet);
    procedure ActDelExecute(Sender: TObject);
    procedure DocTypeBoxExit(Sender: TObject);
    procedure DocTypeBoxEnter(Sender: TObject);
    procedure DocTypeBoxClick(Sender: TObject);
    procedure StreetBoxClick(Sender: TObject);
    procedure msEqualClick(Sender: TObject);
    procedure msLessEqualClick(Sender: TObject);
    procedure msLessClick(Sender: TObject);
    procedure msMoreClick(Sender: TObject);
    procedure msMoreEqualClick(Sender: TObject);
    procedure msNotEqualClick(Sender: TObject);
    procedure btnCntClick(Sender: TObject);
    procedure TypeStreetBoxEnter(Sender: TObject);
    procedure TypeStreetBoxExit(Sender: TObject);
    procedure lblCustServMouseEnter(Sender: TObject);
    procedure lblCustServMouseLeave(Sender: TObject);
    procedure CustServiceBoxClick(Sender: TObject);
    procedure CustServiceBoxEnter(Sender: TObject);
    procedure CustServiceBoxExit(Sender: TObject);
    procedure ActClearExecute(Sender: TObject);
    procedure lblCustServClick(Sender: TObject);
    procedure UserBoxEnter(Sender: TObject);
    procedure UserBoxExit(Sender: TObject);
    procedure UserBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DocTypeBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CustServiceBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblDocTypeMouseEnter(Sender: TObject);
    procedure lblDocTypeMouseLeave(Sender: TObject);
    procedure ActInsExecute(Sender: TObject);
    procedure ActEditExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CustServiceBoxPropertiesInitPopup(Sender: TObject);
    procedure DocTypeBoxPropertiesInitPopup(Sender: TObject);
    procedure UserBoxPropertiesInitPopup(Sender: TObject);
    procedure ActSelectExecute(Sender: TObject);
    procedure lblDocTypeClick(Sender: TObject);
    procedure FIlterGridDBViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure DocStatusBoxPropertiesInitPopup(Sender: TObject);
  private
    { Private declarations }
    IdDocument, IdDocumentRoot:Variant;
    frmHeight:Integer;
    ContextInputType:Integer;
    IdCustServRoot:Integer;
    HtKey:TbsShortCut;
    BIniLanguage:Byte;
    isInsUpdBlock, isAdmin, isAdd:Boolean;
    procedure CloseConnect;
    function CheckData:Boolean;
    procedure DocStatusDSetCloseOpen;
    procedure BtnEnabled(btn:frmButtons);
    procedure FormComponentEnabled(isEnabled:Boolean);
  public
    { Public declarations }
    ResDocument : Variant;
    constructor  Create(AParameter:TBsSimpleParams);reintroduce;
  end;

var
  frmDocument: TfrmDocument;

implementation

{$R *.dfm}

constructor TfrmDocument.Create(AParameter:TBsSimpleParams);
begin
   inherited Create(AParameter.Owner);
   isAdmin:=AParameter.is_admin;
   DocDB.Handle:=AParameter.Db_Handle;
   pnlGrid.Visible:=False;
   frmHeight:=Self.Height-pnlGridHeight;
   Self.Height:=frmHeight;
   Self.Top:=frmTop;
   if AParameter.FormStyle=fsMDIChild then btnSelect.Visible:=ivNever;
   BsConstDset.Close;
   BsConstDset.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CONSTS';
   BsConstDset.Open;
   IdCustServRoot:=BsConstDset['ID_GR_LIST_CUST_SERV_ROOT'];
   HtKey:=LoadShortCut(DocDB.Handle, Self);
   ActFilter.ShortCut:=HtKey.Search;
   ActClear.ShortCut:=HtKey.Clear;
   ActClose.ShortCut:=HtKey.Close;
   ActIns.ShortCut:=HtKey.Add;
   ActEdit.ShortCut:=HtKey.Edit;
   ActDel.ShortCut:=HtKey.Del;
   ActSelect.ShortCut:=HtKey.Choice;
   BIniLanguage:=uCommon_Funcs.bsLanguageIndex();
   ActClose.Caption:=uConsts.bs_ExitBtn_Caption[BIniLanguage];
   ActCancel.Caption:=uConsts.bs_Cancel[BIniLanguage];
   ActOk.Caption:=uConsts.bs_Accept[BIniLanguage];
   ActIns.Caption:=uConsts.bs_InsertBtn_Caption[BIniLanguage];
   ActEdit.Caption:=uConsts.bs_EditBtn_Caption[BIniLanguage];
   ActDel.Caption:=uConsts.bs_DeleteBtn_Caption[BIniLanguage];
   ActSelect.Caption:=uConsts.bs_SelectBtn_Caption[BIniLanguage];
   DocStatusDSetCloseOpen;
   DocNote.Text:='';
   isInsUpdBlock:=False;
   isAdd:=True;
   IdDocument:=Null;
   IdDocumentRoot:=Null;
   BtnEnabled([fbAdd, fbModif, fbDelete, fbSelect, fbExit, fbFilter, fbClear, fbUndo, fbRedo]);
end;

procedure TfrmDocument.FormComponentEnabled(isEnabled:Boolean);
begin
  RegNumber.Enabled:=isEnabled;
  RegDate.Enabled:=isEnabled;
  UserBox.Enabled:=isEnabled;
end;

procedure TfrmDocument.BtnEnabled(btn:frmButtons);
begin
   btnAdd.Enabled:=fbAdd in btn;
   ActIns.Enabled:=btnAdd.Enabled;
   btnEdit.Enabled:=fbModif in btn;
   ActEdit.Enabled:=btnEdit.Enabled;
   btnDel.Enabled:=fbDelete in btn;
   ActDel.Enabled:=btnDel.Enabled;
   btnSelect.Enabled:=fbSelect in btn;
   ActSelect.Enabled:=btnSelect.Enabled;
   btnClose.Enabled:=fbExit in btn;
   ActClose.Enabled:=btnClose.Enabled;
   btnOk.Visible:=fbOk in btn;
   ActOk.Enabled:=btnOk.Enabled;
   btnCancel.Visible:=fbCancel in btn;
   ActCancel.Enabled:=btnCancel.Enabled;
   btnFliter.Enabled:=fbFilter in btn;
   ActFilter.Enabled:=btnFliter.Enabled;
   btnClear.Enabled:=fbClear in btn;
   ActClear.Enabled:=btnClear.Enabled;
   btnUndo.Enabled:=fbUndo in btn;
   ActUndo.Enabled:=btnUndo.Enabled;
   btnRedo.Enabled:=fbRedo in btn;
   ActRedo.Enabled:=btnRedo.Enabled;
   pnlAction.Visible:=btnOk.Visible;
end;

procedure TfrmDocument.DocStatusDSetCloseOpen;
begin
   if DocStatusDSet.Active then DocStatusDSet.Close;
   DocStatusDSet.SQLs.SelectSQL.Text:='Select Distinct * From Bs_Document_Status_Sel';
   DocStatusDSet.Open;
end;

procedure TfrmDocument.ActOkExecute(Sender: TObject);
var Id:Int64;
begin
   try
      if bsShowMessage('Увага!', 'Ви дійсно бажаєте зберегти інформацію?', mtConfirmation, [mbYes, mbNo])=mrNo then Exit;
      if not CheckData then
      begin
         bsShowMessage(Application.Title, 'Ви не заповнили усі необхідні поля!', mtInformation, [mbOK]);
         Exit;
      end;
      StoredProc.StoredProcName:='BS_DOCUMENTS_INS_UPD';
      StoredProc.Transaction.StartTransaction;
      StoredProc.Prepare;
      StoredProc.ParamByName('PERIOD_BEG').AsDate:=DateBeg.Date;
      if DateEnd.Text='' then StoredProc.ParamByName('PERIOD_END').Value:=null
      else StoredProc.ParamByName('PERIOD_END').AsDate:=DateEnd.Date;
      StoredProc.ParamByName('ID_DOCUMENT_TYPE').AsInteger:=DocTypeBox.EditValue;
      StoredProc.ParamByName('INPUT_NUMBER').AsString:=InputNumber.Text;
      if CustServiceBox.EditText='' then StoredProc.ParamByName('ID_CUSTOMER_SERVICE').Value:=null
      else StoredProc.ParamByName('ID_CUSTOMER_SERVICE').AsInteger:=StrToInt(CustServiceBox.EditValue);
      StoredProc.ParamByName('OUTPUT_NUMBER').AsString:=OutputNumber.Text;
      if DeliveryDate.Text='' then StoredProc.ParamByName('DELIVERY_DATE').Value:=null
      else StoredProc.ParamByName('DELIVERY_DATE').AsDate:=DeliveryDate.Date;
      if DocStatusBox.EditText='' then StoredProc.ParamByName('ID_DOCUMENT_STATUS').Value:=null
      else StoredProc.ParamByName('ID_DOCUMENT_STATUS').AsInteger:=DocStatusBox.EditValue;
      if DateWiring.Text='' then StoredProc.ParamByName('DATE_WIRING').Value:=null
      else StoredProc.ParamByName('DATE_WIRING').AsDate:=DateWiring.Date;
      StoredProc.ParamByName('DOCUMENT_NOTE').AsString:=DocNote.Text;
      {if VarIsNull(IdDocument) then StoredProc.ParamByName('ID_DOCUMENT').Value:=Null
      else StoredProc.ParamByName('ID_DOCUMENT').AsInt64:=IdDocument;    }
      if isAdd then StoredProc.ParamByName('ID_DOCUMENT').Value:=Null
      else StoredProc.ParamByName('ID_DOCUMENT').AsInt64:=IdDocument; 
      if VarIsNull(IdDocumentRoot) then StoredProc.ParamByName('ID_ROOT_DOCUMENT').Value:=null
      else StoredProc.ParamByName('ID_ROOT_DOCUMENT').AsInt64:=IdDocumentRoot;
      StoredProc.ExecProc;
      Id:=StoredProc.FieldByName('RET_VALUE').AsInt64;
      StoredProc.Transaction.Commit;
   except on E:Exception
          do begin
                bsShowMessage('Увага!', E.Message, mtInformation, [mbOk]);
                StoredProc.Transaction.Rollback;
          end;
   end;
   FormComponentEnabled(True);
   BtnEnabled([fbAdd, fbModif, fbDelete, fbSelect, fbExit, fbFilter, fbClear, fbUndo, fbRedo]);
   isInsUpdBlock:=False;
   ActClearExecute(Self);
   ActFilterExecute(Self);
   FilterSet.Locate('Reg_Number', Id, []);
   btnMode.Visible:=ivNever;
   btnFliter.Visible:=ivAlways;
   DateBeg.Style.Color:=clWindow;
   DocTypeBox.Style.Color:=clWindow;
   DeliveryDate.Style.Color:=clWindow;
   DocNote.Style.Color:=clWindow;   
end;

function TfrmDocument.CheckData:Boolean;
begin
   Result:=True;
   DateBeg.Style.Color:=clWindow;
   DocTypeBox.Style.Color:=clWindow;
   DeliveryDate.Style.Color:=clWindow;
   DocNote.Style.Color:=clWindow;

   if DateBeg.Text='' then
   begin
      Result:=False;
      //bsShowMessage(Application.Title, 'Ви не обрали "Період з"!', mtInformation, [mbOK]);
      DateBeg.Style.Color:=uConsts.BsClFieldIsEmpty;
      //DateBeg.SetFocus;
   end;

   if DocTypeBox.EditText='' then
   begin
      Result:=False;
      //bsShowMessage(Application.Title, 'Ви не обрали "Тип документа"!', mtInformation, [mbOK]);
      DocTypeBox.Style.Color:=uConsts.BsClFieldIsEmpty;
      //DocTypeBox.SetFocus;
   end;

   if DeliveryDate.Text='' then
   begin
      Result:=False;
      //bsShowMessage(Application.Title, 'Ви не обрали "Дату видачі"!', mtInformation, [mbOK]);
      //DeliveryDate.SetFocus;
      DeliveryDate.Style.Color:=uConsts.BsClFieldIsEmpty;
   end;

   if DocNote.Text='' then
   begin
      Result:=False;
      //bsShowMessage(Application.Title, 'Ви не заповнили поле "Текст документу"!', mtInformation, [mbOK]);
      //DocNote.SetFocus;
      DocNote.Style.Color:=uConsts.BsClFieldIsEmpty;
   end;
end;

procedure TfrmDocument.CloseConnect;
var i:Integer;
begin
   for i:=0 to DocDB.TransactionCount-1 do
   begin
      if DocDB.Transactions[i].Active then DocDB.Transactions[i].Rollback;
   end;
   DocDB.Close;
end;


procedure TfrmDocument.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CloseConnect;
   if FormStyle = fsMDIChild then action:=caFree;
end;

procedure TfrmDocument.ActCancelExecute(Sender: TObject);
begin
   FormComponentEnabled(True);
   BtnEnabled([fbAdd, fbModif, fbDelete, fbSelect, fbExit, fbFilter, fbClear, fbUndo, fbRedo]);
   isInsUpdBlock:=False;
   btnMode.Visible:=ivNever;
   btnFliter.Visible:=ivAlways;
   DateBeg.Style.Color:=clWindow;
   DocTypeBox.Style.Color:=clWindow;
   DeliveryDate.Style.Color:=clWindow;
   DocNote.Style.Color:=clWindow;   
end;

procedure TfrmDocument.ActCloseExecute(Sender: TObject);
begin
   ResDocument:=null;
   Close;
end;

procedure TfrmDocument.ActFilterExecute(Sender: TObject);
var strFilter:string;
begin
   strFilter:='';
   if RegNumber.Text='' then strFilter:='Null,'
   else strFilter:=RegNumber.Text+',';

   if RegDate.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+''''+DateToStr(RegDate.Date)+''',';
   strFilter:=strFilter+''''+lblRegDateEqual.Caption+''',';

   if DateBeg.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+''''+DateToStr(DateBeg.Date)+''',';

   if DateEnd.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+''''+DateToStr(DateEnd.Date)+''',';

   if VarIsNull(DocTypeBox.EditValue) then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+IntToStr(DocTypeBox.EditValue)+',';

   if InputNumber.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+''''+InputNumber.Text+''',';

   if VarIsNull(CustServiceBox.EditValue) then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+IntToStr(CustServiceBox.EditValue)+',';

   if OutputNumber.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+''''+OutputNumber.Text+''',';

   if DeliveryDate.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+''''+DateToStr(DeliveryDate.Date)+''',';

   If VarIsNull(DocStatusBox.EditValue) then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+IntToStr(DocStatusBox.EditValue)+',';

   if DateWiring.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+''''+DateToStr(DateWiring.Date)+''',';

   if VarIsNull(UserBox.EditValue) then strFilter:=strFilter+'Null'
   else strFilter:=strFilter+IntToStr(UserBox.EditValue);

   //Showmessage(strFilter);

   if FilterSet.Active then FilterSet.Close;
   FilterSet.SQLs.SelectSQL.Text:='select distinct * from BS_DOCUMENTS_FILTER('+strFilter+')';
   FilterSet.Open;

   if (not FilterSet.IsEmpty) then
   begin
      Self.Height:=frmHeight+pnlGridHeight;
      if not pnlGrid.Visible then pnlGrid.Visible:=True;
   end
   else
   begin
      if pnlGrid.Visible then pnlGrid.Visible:=False;
      Self.Height:=frmHeight;
      bsShowMessage('Увага!', 'За найстроками фільтру не було знайдено записів!', mtInformation, [mbOK]);
   end;
end;

procedure TfrmDocument.ActUndoExecute(Sender: TObject);
begin
   Showmessage('В разработке');
end;

procedure TfrmDocument.TimeEnterTimer(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
   case ContextInputType of
      0:
      begin
         DocTypeDSet.Close;
         DocTypeDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_DOC_TYPE_FILTER(:FILTER_STR)';
         DocTypeDSet.ParamByName('FILTER_STR').AsString:=DocTypeBox.EditText;
         DocTypeDSet.Open;
         if not DocTypeDSet.IsEmpty then
         begin
            DocTypeBox.Properties.DropDownHeight:=100;
            DocTypeBox.DroppedDown:=True;
         end;
      end;
      1:
      begin
         CustServDSet.Close;
         CustServDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_CUSTOM_SERVICE_FILTER(:FILTER_STR)';
         CustServDSet.ParamByName('FILTER_STR').AsString:=CustServiceBox.EditText;
         CustServDSet.Open;
         if not CustServDSet.IsEmpty then
         begin
            CustServiceBox.Properties.DropDownHeight:=100;
            CustServiceBox.DroppedDown:=True;
         end;
      end;
      2:
      begin
         UserDSet.Close;
         UserDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_USER_FILTER(:FILTER_STR)';
         UserDSet.ParamByName('FILTER_STR').AsString:=UserBox.EditText;
         UserDSet.Open;
         if not UserDSet.IsEmpty then
         begin
            UserBox.Properties.DropDownHeight:=100;
            UserBox.DroppedDown:=True;
         end;
      end;
   end;
end;

procedure TfrmDocument.FilterSetEndScroll(DataSet: TDataSet);
begin
   if FilterSet.IsEmpty then
   begin
      IdDocument:=Null;
      IdDocumentRoot:=Null;
      Exit;
   end;
   IdDocument:=FilterSet['Reg_Number'];
   IdDocumentRoot:=FilterSet['Id_Root_Document'];
   RegNumber.Text:=IntToStr(IdDocument);
   RegDate.Date:=FilterSet['Reg_Date'];
   DateBeg.Date:=FilterSet['Date_Beg'];
   if VarIsNull(FilterSet['Date_End']) then DateEnd.Text:=''
   else DateEnd.Date:=FilterSet['Date_End'];
   if DocTypeDSet.Active then DocTypeDSet.Close;
   DocTypeDSet.SQLs.SelectSQL.Text:='Select Distinct * From Bs_Document_Type_Sel_By_Id(:Id_Doc_Type)';
   DocTypeDSet.ParamByName('Id_Doc_Type').AsInteger:=FilterSet['Id_Document_Type'];
   DocTypeDSet.Open;
   DocTypeBox.EditValue:=FilterSet['Id_Document_Type'];
   if VarIsNull(FilterSet['Input_Number']) then InputNumber.Text:=''
   else InputNumber.Text:=FilterSet['Input_Number'];
   if not VarIsNull(FilterSet['Id_Customer_Service']) then
   begin
      if CustServDSet.Active then CustServDSet.Close;
      CustServDSet.SQLs.SelectSQL.Text:='Select Distinct * From Bs_Get_Group_List_Obj_By_Id(:Id_Gr_List_Obj)';
      CustServDSet.ParamByName('Id_Gr_List_Obj').AsInteger:=FilterSet['Id_Customer_Service'];
      CustServDSet.Open;
      CustServiceBox.EditValue:=FilterSet['Id_Customer_Service'];
   end
   else
   begin
      if CustServDSet.Active then CustServDSet.Close;
      CustServiceBox.EditValue:=(null);
   end;

   if VarIsNull(FilterSet['Output_Number']) then OutputNumber.Text:=''
   else OutputNumber.Text:=FilterSet['Output_Number'];
   If VarIsNull(FilterSet['Delivery_Date']) then DeliveryDate.Text:=''
   else DeliveryDate.Date:=FilterSet['Delivery_Date'];
   if VarIsNull(FilterSet['Id_Document_Status']) then DocStatusBox.EditValue:=(null)
   else DocStatusBox.EditValue:=FilterSet['Id_Document_Status'];
   if VarIsNull(FilterSet['Date_Wiring']) then DateWiring.Text:=''
   else DateWiring.Date:=FilterSet['Date_Wiring'];
   if UserDSet.Active then UserDSet.Close;
   UserDSet.SQLs.SelectSQL.Text:='Select Distinct * From Users U Where U.Id_User=:Id_User';
   UserDSet.ParamByName('Id_User').AsInteger:=FilterSet['Id_User'];
   UserDSet.Open;
   UserBox.EditValue:=FilterSet['Id_User'];
   if VarIsNull(FilterSet['Document_Note']) then DocNote.Text:=''
   else DocNote.Text:=FilterSet['Document_Note'];
end;

procedure TfrmDocument.ActDelExecute(Sender: TObject);
var ErMsg:String;
begin
   try
      if FilterSet.IsEmpty then Exit;
      if bsShowMessage('Увага!', 'Ви дійсно бажаєте видалити цей запис?', mtConfirmation, [mbYes, mbNo])=mrNo then Exit;
      StoredProc.StoredProcName:='BS_DOCUMENT_DEL';
      StoredProc.Transaction.StartTransaction;
      StoredProc.Prepare;
      StoredProc.ParamByName('Id_Document').AsInteger:=FilterSet['Reg_Number'];
      StoredProc.ExecProc;
      ErMsg:=StoredProc.FieldByName('Er_Msg').AsString;
      if ErMsg='No' then StoredProc.Transaction.Commit
      else
      begin
         bsShowMessage('Увага!', ErMsg, mtInformation, [mbOK]);
         StoredProc.Transaction.Rollback;
      end;
      ActClearExecute(Sender);
      ActFilterExecute(Sender);
   except on E:Exception
          do begin
               bsShowMessage('Увага', E.Message, mtInformation, [mbOK]);
               StoredProc.Transaction.Rollback;
          end;
   end;  
end;

procedure TfrmDocument.DocTypeBoxExit(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDocument.DocTypeBoxEnter(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDocument.DocTypeBoxClick(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDocument.StreetBoxClick(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDocument.msEqualClick(Sender: TObject);
begin
   (FindComponent(MenuSigns.PopupComponent.Name) as TcxLabel).Caption:=msEqual.Caption;
end;

procedure TfrmDocument.msLessEqualClick(Sender: TObject);
begin
   (FindComponent(MenuSigns.PopupComponent.Name) as TcxLabel).Caption:=msLessEqual.Caption;
end;

procedure TfrmDocument.msLessClick(Sender: TObject);
begin
   (FindComponent(MenuSigns.PopupComponent.Name) as TcxLabel).Caption:=msLess.Caption;
end;

procedure TfrmDocument.msMoreClick(Sender: TObject);
begin
   (FindComponent(MenuSigns.PopupComponent.Name) as TcxLabel).Caption:=msMore.Caption;
end;

procedure TfrmDocument.msMoreEqualClick(Sender: TObject);
begin
   (FindComponent(MenuSigns.PopupComponent.Name) as TcxLabel).Caption:=msMoreEqual.Caption;
end;

procedure TfrmDocument.msNotEqualClick(Sender: TObject);
begin
   (FindComponent(MenuSigns.PopupComponent.Name) as TcxLabel).Caption:=msNotEqual.Caption;
end;

procedure TfrmDocument.btnCntClick(Sender: TObject);
begin
   if FilterSet.IsEmpty then Exit;
   FilterSet.FetchAll;
   bsShowMessage('Підрахунок!', 'Загальна кількість записів дорівнює '+IntToStr(FilterSet.RecordCount), mtInformation, [mbOK]);
end;

procedure TfrmDocument.TypeStreetBoxEnter(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDocument.TypeStreetBoxExit(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDocument.lblCustServMouseEnter(Sender: TObject);
begin
   Screen.Cursor:=crHandPoint;
end;

procedure TfrmDocument.lblCustServMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

procedure TfrmDocument.CustServiceBoxClick(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDocument.CustServiceBoxEnter(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDocument.CustServiceBoxExit(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDocument.ActClearExecute(Sender: TObject);
begin
    RegNumber.Text:='';
    RegDate.EditValue:=(null);
    DateBeg.EditValue:=(null);
    DateEnd.EditValue:=(null);
    if DocTypeDSet.Active then DocTypeDSet.Close;
    DocTypeBox.EditValue:=(null);
    if CustServDSet.Active then CustServDSet.Close;
    CustServiceBox.EditValue:=(null);
    if UserDSet.Active then UserDSet.Close;
    UserBox.EditValue:=(null);
    InputNumber.Text:='';
    OutputNumber.Text:='';
    DeliveryDate.EditValue:=(null);
    DocStatusBox.EditValue:=(null);
    DateWiring.EditValue:=(null);
    DocNote.Text:='';
end;

procedure TfrmDocument.lblCustServClick(Sender: TObject);
var AParameter:TBsSimpleParams;
    Res:Variant;
begin
  try
    AParameter:= TBsSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:= DocDB.Handle;
    AParameter.Formstyle:=fsNormal;
    AParameter.WaitPakageOwner:=self;
    AParameter.ID_Locate:=IdCustServRoot;
    Res:=RunFunctionFromPackage(AParameter, 'BillingSystem\BsGroupObjects.bpl','ShowObjectsGroup');
    AParameter.Free;

    if VarArrayDimCount(Res)>0 then
    begin
       if CustServDSet.Active then CustServDSet.Close;
       CustServDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
       CustServDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=Res[0];
       CustServDSet.Open;
       CustServiceBox.EditValue:=Res[0];
       CustServiceBox.SetFocus;
    end;
  except on E:exception
         do bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
  end;
end;

procedure TfrmDocument.UserBoxEnter(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDocument.UserBoxExit(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDocument.UserBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   ContextInputType:=2;
   if UserBox.EditText='' then
      if UserDSet.Active then UserDSet.Close;
   TimeEnter.Enabled:= not(UserBox.EditText='');
end;

procedure TfrmDocument.DocTypeBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    ContextInputType:=0;
    if DocTypeBox.EditText='' then
       if DocTypeDSet.Active then DocTypeDSet.Close;
    TimeEnter.Enabled:=not (DocTypeBox.EditText='');   
end;

procedure TfrmDocument.CustServiceBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    ContextInputType:=1;
    if CustServiceBox.EditText='' then
       if CustServDSet.Active then CustServDSet.Close;
    TimeEnter.Enabled:=not (CustServiceBox.EditText='');
end;

procedure TfrmDocument.lblDocTypeMouseEnter(Sender: TObject);
begin
   Screen.Cursor:=crHandPoint;
end;

procedure TfrmDocument.lblDocTypeMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

procedure TfrmDocument.ActInsExecute(Sender: TObject);
begin
   if not isInsUpdBlock then
   begin
      IdDocument:=Null;
      IdDocumentRoot:=Null;
      FormComponentEnabled(False);
      BtnEnabled([fbOk, fbCancel, fbExit]);
      isInsUpdBlock:=True;
      isAdd:=True;
      btnMode.Hint:=ActIns.Caption;
      btnMode.LargeImageIndex:=0;
      btnMode.Visible:=ivAlways;
      btnFliter.Visible:=ivNever;
   end;
end;

procedure TfrmDocument.ActEditExecute(Sender: TObject);
begin
   if VarIsNull(IdDocument) then Exit;
   if not isInsUpdBlock then
   begin
      FormComponentEnabled(False);
      BtnEnabled([fbOk, fbCancel, fbExit]);
      isInsUpdBlock:=True;
      isAdd:=False;
      btnMode.Hint:=ActEdit.Caption;
      btnMode.LargeImageIndex:=1;
      btnMode.Visible:=ivAlways;
      btnFliter.Visible:=ivNever;
   end;
end;

procedure TfrmDocument.FormShow(Sender: TObject);
begin
   Self.Top:=Round(Application.MainForm.Height/5);
end;

procedure TfrmDocument.CustServiceBoxPropertiesInitPopup(Sender: TObject);
begin
   if CustServiceBox.EditText='' then
   begin
      CustServDSet.Close;
      CustServDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_CUSTOM_SERVICE_FILTER(:FILTER_STR)';
      CustServDSet.ParamByName('FILTER_STR').AsString:=CustServiceBox.EditText;
      CustServDSet.Open;
   end
end;

procedure TfrmDocument.DocTypeBoxPropertiesInitPopup(Sender: TObject);
begin
   if DocTypeBox.EditText='' then
   begin
      DocTypeDSet.Close;
      DocTypeDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_DOC_TYPE_FILTER(:FILTER_STR)';
      DocTypeDSet.ParamByName('FILTER_STR').AsString:=DocTypeBox.EditText;
      DocTypeDSet.Open;
   end;
end;

procedure TfrmDocument.UserBoxPropertiesInitPopup(Sender: TObject);
begin
   if UserBox.EditText='' then
   begin
      UserDSet.Close;
      UserDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_USER_FILTER(:FILTER_STR)';
      UserDSet.ParamByName('FILTER_STR').AsString:=UserBox.EditText;
      UserDSet.Open;
   end;
end;

procedure TfrmDocument.ActSelectExecute(Sender: TObject);
begin
   if FilterSet.IsEmpty then Exit;
   if not VarIsNull(FilterSet['Reg_Number']) then
   begin
      ResDocument:=FilterSet['Reg_Number'];
      ModalResult:=mrOk;
   end;
end;

procedure TfrmDocument.lblDocTypeClick(Sender: TObject);
var AParameter:TBsSimpleParams;
    Res:Variant;
begin
  try
    AParameter:= TBsSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:= DocDB.Handle;
    AParameter.Formstyle:=fsNormal;
    AParameter.WaitPakageOwner:=self;
    AParameter.is_admin:=isAdmin;
    Res:=RunFunctionFromPackage(AParameter, 'BillingSystem\bs_sp_DocType.bpl','ShowSPDocumentType');
    AParameter.Free;

    if VarArrayDimCount(Res)>0 then
    begin
       if DocTypeDSet.Active then DocTypeDSet.Close;
       DocTypeDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_DOCUMENT_TYPE_SEL_BY_ID(:ID_DOCUMENT_TYPE_IN)';
       DocTypeDSet.ParamByName('ID_DOCUMENT_TYPE_IN').AsInteger:=Res[0];
       DocTypeDSet.Open;
       DocTypeBox.EditValue:=Res[0];
       DocTypeBox.SetFocus;
    end;
  except on E:exception
         do bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
  end;
end;

procedure TfrmDocument.FIlterGridDBViewCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
   FilterSetEndScroll(FilterSet);
end;

procedure TfrmDocument.DocStatusBoxPropertiesInitPopup(Sender: TObject);
begin
   DocStatusDSetCloseOpen
end;

end.
