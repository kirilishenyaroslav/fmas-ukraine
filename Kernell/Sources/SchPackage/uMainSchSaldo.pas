unit uMainSchSaldo;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls,pFibQuery, Forms, Resources_unitb,
  Dialogs,  ComCtrls, DB, FIBDataSet, pFIBDataSet, Buttons, ToolWin,
  Menus, ImgList, ExtCtrls, pFIBStoredProc, Grids, DBGrids, ActnList,
  FIBDatabase, pFIBDatabase, StdCtrls,Ibase,
  DBCtrls, cxControls, cxContainer, cxCheckListBox, cxDBCheckListBox, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCheckComboBox,cxCheckBox,
  cxDBCheckComboBox, frxClass, frxDBSet, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxInplaceContainer, cxDBTL, cxTLData, cxDBEdit, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses,
  cxGridCustomView, cxGridLevel, cxGrid, frxExportRTF, frxExportXML,
  frxExportXLS,AccMGMT,BaseTypes, Placemnt, dxStatusBar, frxDMPExport;


resourcestring
  Spr_title='Сальдо балансових рахунків';

type

TSchInfo=record
  ID_MAIN_SCH         : integer;
  SCH_TITLE           : string;
  SCH_NUMBER          : string;
  SCH_TYPE            : integer;
  DATE_BEG            : TDateTime;
  DATE_END            : TDateTime;
  TYPE_OBJECT         : integer;
  SCH_TYPE_TITLE      : string;
  TYPE_OBJ_TITLE      : string;
  LINKTO              : integer;
  ID_SYSTEM           : integer;
end;

  TfrmSchSaldo = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar2: TToolBar;
    RefreshToolButton: TToolButton;
    SchImageList: TImageList;
    ActionList1: TActionList;
    InsertAction: TAction;
    DeleteAction: TAction;
    UpdateAction: TAction;
    GetAction: TAction;
    RefreshAction: TAction;
    CloseAction: TAction;
    ViewAction: TAction;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    SmallImages: TImageList;
    WorkDatabase: TpFIBDatabase;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SysExtDataSet: TpFIBDataSet;
    SysExDataSource: TDataSource;
    Action1: TAction;
    MasterSchDataSet: TpFIBDataSet;
    MasterDataSource: TDataSource;
    SchTreeSaldoDataSet: TpFIBDataSet;
    SchTreeDataSource: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    ToolButton3: TToolButton;
    cxStyle5: TcxStyle;
    ToolButton1: TToolButton;
    cxDBTextEdit3: TcxDBTextEdit;
    Panel3: TPanel;
    ToolButton4: TToolButton;
    SchSaldoDataset: TfrxDBDataset;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn8: TcxGridDBBandedColumn;
    cxStyle6: TcxStyle;
    cxGrid1DBBandedTableView1DBBandedColumn9: TcxGridDBBandedColumn;
    ToolButton5: TToolButton;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    FormStorage1: TFormStorage;
    Panel4: TPanel;
    Label1: TLabel;
    cbMonthBeg: TComboBox;
    cbYearBeg: TComboBox;
    cxCheckBox1: TcxCheckBox;
    checkBalanceObjects: TcxCheckBox;
    cxGrid1DBBandedTableView1DBBandedColumn10: TcxGridDBBandedColumn;
    Esc: TAction;
    pFIBDataSet1: TpFIBDataSet;
    dxStatusBar1: TdxStatusBar;
    Print: TAction;
    frxDotMatrixExport1: TfrxDotMatrixExport;
    btn1: TToolButton;
    cbMonthEnd: TComboBox;
    cbYearEnd: TComboBox;
    cxGrid1DBBandedTableView1DBBandedColumn11: TcxGridDBBandedColumn;
    frxReport1: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RefreshToolButtonClick(Sender: TObject);
    procedure CloseToolButtonClick(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure ChooseButtonClick(Sender: TObject);
    procedure cbMonthChange(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxGrid1DBBandedTableView1DBBandedColumn1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxGrid1DBBandedTableView1DBBandedColumn2StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxGrid1DBBandedTableView1DBBandedColumn3StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxGrid1DBBandedTableView1DBBandedColumn4StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxGrid1DBBandedTableView1DBBandedColumn5StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxGrid1DBBandedTableView1DBBandedColumn6StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxGrid1DBBandedTableView1DBBandedColumn7StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ToolButton3Click(Sender: TObject);
    procedure checkBalanceObjectsPropertiesChange(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure PrintExecute(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure btn1Click(Sender: TObject);
    procedure cxGrid1DBBandedTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBBandedTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  private
    ExtractAllFlag:Boolean;
    LocateId:Integer;
    { Private declarations }
  public
    MBOOK_DATE:TDateTime;
    id_sch_in:integer;
    in_sch_in_credit:integer;
    INFINITY_DATE:TdateTime;
    Work_Id_Object:Integer;
    ActualDate:TDateTime;
    ActualDateEnd:TDateTime;
    SchLevelCount:Integer;
    FlagMultiSelect:Boolean;
    ResultValue:Variant;
    Root:Integer;
    CurFS:TFormStyle;
    constructor Create(AOwner: TComponent;DBhandle: TISC_DB_HANDLE;  Actual_Date: TDateTime; Root: Integer);
  end;


implementation

uses  DateUtils, FindSch, FIBQuery, GlobalSpr,
      UExtSaldo;
{$R *.dfm}


procedure TfrmSchSaldo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TfrmSchSaldo.FormCreate(Sender: TObject);
var date_str, date_str1:string;
    TempdataSet:TpFibDataSet;
    i:integer;
begin
       dateTimetostring(date_str, 'dd.mm.yyyy', ActualDate);
       dateTimetostring(date_str1,'dd.mm.yyyy', IncMonth(ActualDateEnd)-1);

       Panel3.Visible:=true;
       Application.ProcessMessages;
       cbMonthbeg.Items.Add(TRIM(BU_Month_01));
       cbMonthbeg.Items.Add(TRIM(BU_Month_02));
       cbMonthbeg.Items.Add(TRIM(BU_Month_03));
       cbMonthbeg.Items.Add(TRIM(BU_Month_04));
       cbMonthbeg.Items.Add(TRIM(BU_Month_05));
       cbMonthbeg.Items.Add(TRIM(BU_Month_06));
       cbMonthbeg.Items.Add(TRIM(BU_Month_07));
       cbMonthbeg.Items.Add(TRIM(BU_Month_08));
       cbMonthbeg.Items.Add(TRIM(BU_Month_09));
       cbMonthbeg.Items.Add(TRIM(BU_Month_10));
       cbMonthbeg.Items.Add(TRIM(BU_Month_11));
       cbMonthbeg.Items.Add(TRIM(BU_Month_12));

       for i:=0 to YEARS_COUNT do
       begin
          cbYearbeg.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
       end;
       cbMonthbeg.ItemIndex:=MonthOf(ActualDate)-1;

       cbMonthend.Items.Add(TRIM(BU_Month_01));
       cbMonthend.Items.Add(TRIM(BU_Month_02));
       cbMonthend.Items.Add(TRIM(BU_Month_03));
       cbMonthend.Items.Add(TRIM(BU_Month_04));
       cbMonthend.Items.Add(TRIM(BU_Month_05));
       cbMonthend.Items.Add(TRIM(BU_Month_06));
       cbMonthend.Items.Add(TRIM(BU_Month_07));
       cbMonthend.Items.Add(TRIM(BU_Month_08));
       cbMonthend.Items.Add(TRIM(BU_Month_09));
       cbMonthend.Items.Add(TRIM(BU_Month_10));
       cbMonthend.Items.Add(TRIM(BU_Month_11));
       cbMonthend.Items.Add(TRIM(BU_Month_12));

       for i:=0 to YEARS_COUNT do
       begin
            cbYearend.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
       end;
       cbMonthend.ItemIndex:=MonthOf(ActualDate)-1;

       for i:=0 to cbYearbeg.Items.Count-1 do
       begin
           if pos(cbYearbeg.Items[i],IntToStr(YearOf(ActualDate)))>0
           then begin
                     cbYearbeg.ItemIndex:=i;
                     break;
           end;
       end;

       for i:=0 to cbYearEnd.Items.Count-1 do
       begin
           if pos(cbYearEnd.Items[i],IntToStr(YearOf(ActualDate)))>0
           then begin
                     cbYearEnd.ItemIndex:=i;
                     break;
           end;
       end;



       caption:=Spr_title+' за період з '+ date_str +' по '+ date_str1;

       SchTreeSaldoDataSet.SelectSQL.Text:='';

       SchTreeSaldoDataSet.SelectSQL.Text:=' SELECT * FROM PUB_SP_MAIN_SCH_SELECT_SALDO_E2('+''''+date_str+''''+
                                           ','+''''+date_str1+''''+
                                           ','+IntToStr(Root)+
                                           ','+IntToStr(Integer(cxCheckBox1.checked))+
                                           ','+IntToStr(Integer(checkBalanceObjects.checked))+
                                           ')';
       SchTreeSaldoDataSet.Open;
       Panel3.Visible:=false;

       TempdataSet:=TpFibDataSet.Create(self);
       TempdataSet.Database:=WorkDatabase;
       TempdataSet.Transaction:=ReadTransaction;
       TempdataSet.SQLs.SelectSQL.Text:='SELECT * FROM  PUB_SYS_DATA';
       TempdataSet.Open;
       //заполнение настроек системы
       SchLevelCount:=TempdataSet.FieldByName('MAX_SCH_LEVEL_COUNT').AsInteger;
       INFINITY_DATE:=TempdataSet.FieldByName('INFINITY_DATE').AsDateTime;
       MBOOK_DATE   :=TempdataSet.FieldByName('MAIN_BOOK_DATE').AsDateTime;
       TempdataSet.Close;
       TempdataSet.Free;
end;


procedure TfrmSchSaldo.RefreshToolButtonClick(Sender: TObject);
var date_str, date_str1:string;
    id:integer;
begin
       DateSeparator:='.';
       ActualDate:=StrToDate('01.'+IntToStr(cbMonthbeg.ItemIndex+1)+'.'+cbYearbeg.Items[cbYearbeg.ItemIndex]);
       DateTimeToString(date_str,'dd.mm.yyyy',ActualDate);

       ActualDateEnd:=StrToDate('01.'+IntToStr(cbMonthEnd.ItemIndex+1)+'.'+cbYearEnd.Items[cbYearEnd.ItemIndex]);
       DateTimeToString(date_str1,'dd.mm.yyyy',IncMonth(ActualDateEnd)-1);


       if not (ActualDate>ActualDateEnd)
       then begin

                 caption:=Spr_title+' за період з '+ date_str +' по '+ date_str1;


                 Panel3.Visible:=true;
                 Application.ProcessMessages;

                 dateTimetostring(date_str,'dd.mm.yyyy', ActualDate);
                 dateTimetostring(date_str1,'dd.mm.yyyy', ActualDateEnd);





                 if SchTreeSaldoDataSet.Active
                 then  begin
                         if SchTreeSaldoDataSet.RecordCount>0
                         then id:=SchTreeSaldoDataSet.FieldByName('ID_SCH').AsInteger;
                         SchTreeSaldoDataSet.Close;
                 end;

                 ActualDateEnd:=StrToDate('01.'+IntToStr(cbMonthEnd.ItemIndex+1)+'.'+cbYearEnd.Items[cbYearEnd.ItemIndex]);
                 DateTimeToString(date_str1,'dd.mm.yyyy',ActualDateEnd);


                 SchTreeSaldoDataSet.SelectSQL.Text:=' SELECT * FROM PUB_SP_MAIN_SCH_SELECT_SALDO_E2('+''''+date_str+''''+
                                           ','+''''+date_str1+''''+
                                           ','+IntToStr(Root)+
                                           ','+IntToStr(Integer(cxCheckBox1.checked))+
                                           ','+IntToStr(Integer(checkBalanceObjects.checked))+
                                           ')';
                                           
                 SchTreeSaldoDataSet.Open;
                 SchTreeSaldoDataSet.Locate('ID_SCH',id,[]);
                 Panel3.Visible:=false;
       end
       else ShowMessage('Дата закінчення періоду не може бути за дату початку!');          
end;

procedure TfrmSchSaldo.CloseToolButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmSchSaldo.RefreshActionExecute(Sender: TObject);
begin
     RefreshToolButton.OnClick(self);
end;

procedure TfrmSchSaldo.ChooseButtonClick(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmSchSaldo.cbMonthChange(Sender: TObject);
var date_str, date_str1:string;
begin
     DateSeparator:='.';
     ActualDate:=StrToDate('01.'+IntToStr(cbMonthbeg.ItemIndex+1)+'.'+cbYearbeg.Items[cbYearbeg.ItemIndex]);
     DateTimeToString(date_str,'dd.mm.yyyy',ActualDate);

     ActualDateEnd:=StrToDate('01.'+IntToStr(cbMonthEnd.ItemIndex+1)+'.'+cbYearEnd.Items[cbYearEnd.ItemIndex]);
     DateTimeToString(date_str1,'dd.mm.yyyy',IncMonth(ActualDateEnd)-1);


     caption:=Spr_title+' за період з '+ date_str +' по '+ date_str1;
     
     RefreshToolButton.OnClick(self);
end;

procedure TfrmSchSaldo.N9Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmSchSaldo.N6Click(Sender: TObject);
begin
  RefreshToolButton.OnClick(self);
end;

procedure TfrmSchSaldo.ToolButton17Click(Sender: TObject);
begin
   if CurFS=fsNormal
   then Close
   else ModalResult:=mrNo;
end;

procedure TfrmSchSaldo.DBLookupComboBox1CloseUp(Sender: TObject);
begin
     RefreshToolButton.OnClick(self);
end;


procedure TfrmSchSaldo.Action1Execute(Sender: TObject);
begin
    if self.WindowState=wsMaximized
    then self.WindowState:=wsNormal
    else self.WindowState:=wsMaximized;
end;

constructor TfrmSchSaldo.Create(AOwner: TComponent; DBhandle: TISC_DB_HANDLE;  Actual_Date: TDateTime; Root: Integer);
begin
      inherited Create(AOwner);
      self.ActualDate   :=Actual_Date;
      Self.ActualDateEnd:=Actual_Date;

      self.Root:=Root;
      Self.WorkDatabase.Handle:=DBHandle;
      ExtractAllFlag:=true;
      if (Self.FormStyle=fsNormal)
      then begin
                cbMonthbeg.Enabled:=false;
                cbYearbeg.Enabled:=false;

                cbMonthend.Enabled:=false;
                cbYearend.Enabled:=false;
      end;
end;

procedure TfrmSchSaldo.ToolButton1Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmSchSaldo.ToolButton4Click(Sender: TObject);
begin
     if fibCheckPermission('/ROOT/Kernell/MBook','Print')=0
     then begin //yes
                     cxGrid1DBBandedTableView1.BeginUpdate;
                     frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Mbook\ReportSchOborVed2.fr3',true);

                     frxReport1.PrepareReport(true);
                     cxGrid1DBBandedTableView1.EndUpdate;
                     frxReport1.ShowPreparedReport;
     end
     else begin
                     BaseTypes.agMessageDlg('Увага!','Ви не маєте прав друкувати цю інформацію?',mtWarning,[mbOk]);
     end;
end;

procedure TfrmSchSaldo.cxCheckBox1PropertiesChange(Sender: TObject);
begin
     cxGrid1DBBandedTableView1.Bands[2].Visible:=not cxCheckBox1.Checked;
     RefreshToolButton.OnClick(self);
end;

procedure TfrmSchSaldo.checkBalanceObjectsPropertiesChange(Sender: TObject);
begin
     RefreshToolButton.OnClick(self);
end;

procedure TfrmSchSaldo.cxGrid1DBBandedTableView1DBBandedColumn1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if (ARecord.Values[10]=null) then AStyle:=cxStyle6;
  if (ARecord.Values[9]='0') then AStyle:=cxStyle3;
end;

procedure TfrmSchSaldo.cxGrid1DBBandedTableView1DBBandedColumn2StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if (ARecord.Values[10]=null) then AStyle:=cxStyle6;
  if (ARecord.Values[9]='0') then AStyle:=cxStyle3;
end;

procedure TfrmSchSaldo.cxGrid1DBBandedTableView1DBBandedColumn3StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if (ARecord.Values[10]=null)  then AStyle:=cxStyle6;
  if (ARecord.Values[9]='0') then AStyle:=cxStyle3;
end;

procedure TfrmSchSaldo.cxGrid1DBBandedTableView1DBBandedColumn4StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if (ARecord.Values[10]=null)  then AStyle:=cxStyle6;
  if (ARecord.Values[9]='0') then AStyle:=cxStyle3;
end;

procedure TfrmSchSaldo.cxGrid1DBBandedTableView1DBBandedColumn5StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if (ARecord.Values[10]=null)  then AStyle:=cxStyle6;
  if (ARecord.Values[9]='0') then AStyle:=cxStyle3;
end;

procedure TfrmSchSaldo.cxGrid1DBBandedTableView1DBBandedColumn6StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if (ARecord.Values[10]=null)  then AStyle:=cxStyle6;
  if (ARecord.Values[9]='0') then AStyle:=cxStyle3;
end;

procedure TfrmSchSaldo.cxGrid1DBBandedTableView1DBBandedColumn7StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if (ARecord.Values[10]=null)  then AStyle:=cxStyle6;
  if (ARecord.Values[9]='0')    then AStyle:=cxStyle3;
end;

procedure TfrmSchSaldo.ToolButton3Click(Sender: TObject);
var T:TfrmExtSaldo;
begin
     //Проверяем что выбранный объект справочника счетов является листиком
     if SchTreeSaldoDataSet.FieldByName('OPEN_SCH').Value<>NULL
     then begin
               T:=TfrmExtSaldo.Create(self);
               T.ShowModal;
               T.Free;
               RefreshToolButton.OnClick(self);
     end;
end;

procedure TfrmSchSaldo.EscExecute(Sender: TObject);
begin
     Close;
end;

procedure TfrmSchSaldo.PrintExecute(Sender: TObject);
begin
      ToolButton4Click(self);
end;


procedure TfrmSchSaldo.frxReport1GetValue(const VarName: String; var Value: Variant);
var
  DSet: TpFIBDataSet;
  date_str, date_str1:string;
begin
    DSet:=TpFIBDataSet.Create(self);
    DSet.Database:=WorkDatabase;
    DSet.SQLs.SelectSQL.Text:='select * from PUB_SYS_DATA';
    DSet.Open;

    if VarName='Period'
    then begin

    //Value:=ActualDate;
    DateSeparator:='.';
    ActualDate:=StrToDate('01.'+IntToStr(cbMonthbeg.ItemIndex+1)+'.'+cbYearbeg.Items[cbYearbeg.ItemIndex]);
    DateTimeToString(date_str,'dd.mm.yyyy',ActualDate);

    ActualDateEnd:=StrToDate('01.'+IntToStr(cbMonthEnd.ItemIndex+1)+'.'+cbYearEnd.Items[cbYearEnd.ItemIndex]);
    DateTimeToString(date_str1,'dd.mm.yyyy',IncMonth(ActualDateEnd)-1);


    Value:=' за період з '+ date_str +' по '+ date_str1;
    end;


    if VarName='MAIN_BUHG_FIO' then Value:=DSet['UW_FIO_GLBUHG'];

    DSet.Close;
    DSet.Free;
end;

procedure TfrmSchSaldo.btn1Click(Sender: TObject);
begin
     if not (SchTreeSaldoDataSet.FieldByName('OPEN_SCH').Value = null)
     then begin
               GlobalSpr.GetOborAnalizeEx(Self,WorkDatabase.Handle,-1,SchTreeSaldoDataSet.FieldByName('ID_SCH').Value,ActualDate);
     end;
end;

procedure TfrmSchSaldo.cxGrid1DBBandedTableView1DblClick(Sender: TObject);
begin
     btn1Click(self);
end;

procedure TfrmSchSaldo.cxGrid1DBBandedTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      //
end;

end.
