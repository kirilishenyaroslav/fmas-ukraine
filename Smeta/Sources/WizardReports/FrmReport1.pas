unit FrmReport1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxHyperLinkEdit,Ibase, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  Contnrs, cxGridBandedTableView, cxGridDBBandedTableView, Menus,
  cxExportGrid4Link, cxExport, cxTextEdit, frxClass, frxDBSet, cxContainer,
  cxDBEdit,pFibStoredProc, cxMaskEdit, cxDropDownEdit, cxCalendar,
  frxExportPDF, frxExportImage, frxExportRTF, frxExportXML, frxExportXLS,
  frxExportHTML, frxExportTXT, Placemnt, ComCtrls, cxCalc, cxCheckBox,
  ShellApi;

type


  TfrmHtmlReport = class(TForm)
    Panel2: TPanel;
    cxStyleRepository1: TcxStyleRepository;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetHighContrastWhite: TcxGridTableViewStyleSheet;
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
    TitlePanel: TPanel;
    WorkDatabase: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    DataSource: TDataSource;
    GridBandedTableViewStyleSheetHighContrastWhite: TcxGridBandedTableViewStyleSheet;
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
    BuReportsInfoGrid: TcxGrid;
    ViewLevel0: TcxGridDBTableView;
    ViewLevel0DBColumn2: TcxGridDBColumn;
    ViewLevel0DBColumn3: TcxGridDBColumn;
    ViewLevel0DBColumn4: TcxGridDBColumn;
    ViewLevel1: TcxGridDBTableView;
    ViewLevel1DBColumn1: TcxGridDBColumn;
    ViewLevel1DBColumn2: TcxGridDBColumn;
    ViewLevel1DBColumn3: TcxGridDBColumn;
    ViewLevel1DBColumn4: TcxGridDBColumn;
    ViewLevel2: TcxGridDBBandedTableView;
    PLAN_VALUE: TcxGridDBBandedColumn;
    BU_KASSA_FACT: TcxGridDBBandedColumn;
    BU_FINANCE_FACT: TcxGridDBBandedColumn;
    BU_DEBIT_Z: TcxGridDBBandedColumn;
    BU_KREDIT_Z: TcxGridDBBandedColumn;
    DIFF_FROM_PLAN: TcxGridDBBandedColumn;
    SHOW_TITLE: TcxGridDBBandedColumn;
    ViewLevel3: TcxGridDBBandedTableView;
    ViewLevel4: TcxGridDBBandedTableView;
    ViewLevel4DBBandedColumn1: TcxGridDBBandedColumn;
    ViewLevel4DBBandedColumn3: TcxGridDBBandedColumn;
    PLAN_VALUE_COLUMN: TcxGridDBBandedColumn;
    BU_KASSA_FACT_COLUMN: TcxGridDBBandedColumn;
    ViewLevel4DBBandedColumn6: TcxGridDBBandedColumn;
    ViewLevel4DBBandedColumn7: TcxGridDBBandedColumn;
    BU_KREDIT_Z_COLUMN: TcxGridDBBandedColumn;
    DIFF_FROM_PLAN_COLUMN: TcxGridDBBandedColumn;
    ExportPopupMenu: TPopupMenu;
    HTML1: TMenuItem;
    Excelajhvfne1: TMenuItem;
    SaveDialog1: TSaveDialog;
    ViewLevel2DBBandedColumn1: TcxGridDBBandedColumn;
    PROFIT_FLAG_TITLE: TcxGridDBBandedColumn;
    PLAN_VALUE_FC: TcxGridDBBandedColumn;
    BU_KASSA_FACT_FC: TcxGridDBBandedColumn;
    BU_FINANCE_FACT_FC: TcxGridDBBandedColumn;
    BU_DEBIT_Z_FC: TcxGridDBBandedColumn;
    BU_KREDIT_Z_FC: TcxGridDBBandedColumn;
    DIFF_FROM_PLAN_FC: TcxGridDBBandedColumn;
    RAZD_STYLE: TcxStyle;
    ST_STYLE: TcxStyle;
    SM_STYLE: TcxStyle;
    TYPE_OBJ: TcxGridDBBandedColumn;
    ViewLevel4DBBandedColumn2: TcxGridDBBandedColumn;
    DBDataset: TfrxDBDataset;
    PlanRestsDataSet: TpFIBDataSet;
    PlanRestDataset: TfrxDBDataset;
    RestDataSource: TDataSource;
    RED_SUM_STYLE: TcxStyle;
    RAZD_STYLE_RED: TcxStyle;
    ST_STYLE_RED: TcxStyle;
    SM_STYLE_RED: TcxStyle;
    Panel4: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    PrintButton: TcxButton;
    cxButton11: TcxButton;
    ViewLevel1DBColumn5: TcxGridDBColumn;
    ViewLevel1DBColumn6: TcxGridDBColumn;
    cxStyle24: TcxStyle;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxPDFExport1: TfrxPDFExport;
    ViewLevel1DBColumn7: TcxGridDBColumn;
    GridTableViewStyleSheetWindowsClassic: TcxGridTableViewStyleSheet;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxGridTableViewStyleSheet2: TcxGridTableViewStyleSheet;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxGridTableViewStyleSheet3: TcxGridTableViewStyleSheet;
    ViewLevel4DBBandedColumn10: TcxGridDBBandedColumn;
    PLAN_FC: TcxGridDBBandedColumn;
    KASSA_FC: TcxGridDBBandedColumn;
    DIFF_FC: TcxGridDBBandedColumn;
    ViewLevelMonth: TcxGridDBBandedTableView;
    SHOW_TITLE_: TcxGridDBBandedColumn;
    PLAN_VALUE_: TcxGridDBBandedColumn;
    BU_KASSA_FACT_: TcxGridDBBandedColumn;
    DIFF_FROM_PLAN_: TcxGridDBBandedColumn;
    PROFIT_FLAG_TITLE_EX_: TcxGridDBBandedColumn;
    OBJECT_TYPE: TcxGridDBBandedColumn;
    PLAN_VALUE_FC_: TcxGridDBBandedColumn;
    BU_KASSA_FACT_FC_: TcxGridDBBandedColumn;
    DIFF_FROM_PLAN_FC_: TcxGridDBBandedColumn;
    RowDataSet: TfrxUserDataSet;
    ColDataSet: TfrxUserDataSet;
    PLReestrView: TcxGridDBBandedTableView;
    PLReestrViewDBBandedColumn1: TcxGridDBBandedColumn;
    PLReestrViewDBBandedColumn2: TcxGridDBBandedColumn;
    PLReestrViewDBBandedColumn4: TcxGridDBBandedColumn;
    PLReestrViewDBBandedColumn5: TcxGridDBBandedColumn;
    PLReestrViewDBBandedColumn6: TcxGridDBBandedColumn;
    PLReestrViewDBBandedColumn3: TcxGridDBBandedColumn;
    PLReestrViewDBBandedColumn7: TcxGridDBBandedColumn;
    FormStorage1: TFormStorage;
    PrintPopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    FPlanRestsDataSet: TpFIBDataSet;
    FRestDataSource: TDataSource;
    ViewLevel1DBColumn8: TcxGridDBColumn;
    frxReport1: TfrxReport;
    ViewLevel3DBBandedColumn1: TcxGridDBBandedColumn;
    ViewLevel3DBBandedColumn2: TcxGridDBBandedColumn;
    ViewLevel3DBBandedColumn4: TcxGridDBBandedColumn;
    ViewLevel3DBBandedColumn5: TcxGridDBBandedColumn;
    ViewLevel3DBBandedColumn3: TcxGridDBBandedColumn;
    ViewLevel0DBColumn5: TcxGridDBColumn;
    SmGroupV_Detail: TcxGridLevel;
    ViewLevel8: TcxGridDBBandedTableView;
    ViewLevel8DBBandedColumn1: TcxGridDBBandedColumn;
    ViewLevel8DBBandedColumn2: TcxGridDBBandedColumn;
    ViewLevel8DBBandedColumn5: TcxGridDBBandedColumn;
    ChengeWorkperiodMenu: TPopupMenu;
    N3: TMenuItem;
    ViewLevel1DBColumn9: TcxGridDBColumn;
    ViewLevel1DBColumn10: TcxGridDBColumn;
    ViewLevel0DBColumn1: TcxGridDBColumn;
    OBJECT_TYPE_COL: TcxGridDBColumn;
    cxStyle58: TcxStyle;
    ViewLevel1DBColumn11: TcxGridDBColumn;
    cxCheckBox1: TcxCheckBox;
    cxButton3: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ViewLevel8DBBandedColumn5StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure PrintButtonClick(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent; DB_Handle:TISC_DB_HANDLE;id_smeta:Int64;date_beg:TdateTime;date_end:Tdatetime; Id_USER:Int64);overload;
    function    getSQLTextForGroupPlanDetail(id_smeta:Int64;criteria1,criteria2,criteria3, criteria4:Integer;id_razd_st:int64;id_level:Integer):String;
    procedure   doConfigureGroupDetailGrid(id_smeta:Int64);
    { Public declarations }
  end;


implementation

uses GlobalSpr, BaseTypes, cxGridViewData, frmReport1Chart, UGetAnalizeLevel;

{$R *.dfm}


constructor TfrmHtmlReport.Create(AOwner: TComponent; DB_Handle: TISC_DB_HANDLE;
 id_smeta:Int64; date_beg:TdateTime;date_end:TdateTime; Id_USER: Int64);
var T:TfrmGetAnalizelevel;
    isQuit:Boolean;
begin
    inherited Create(AOwner);
    isQuit:=true;

    T:=TfrmGetAnalizelevel.Create(self, DB_Handle);
    if T.ShowModal=mrYes
    then begin
              WorkDatabase.Handle:=DB_Handle;
              ReadTransaction.StartTransaction;
              doConfigureGroupDetailGrid(id_smeta);
              DataSet.SelectSQL.Text:=getSQLTextForGroupPlanDetail(id_smeta,
                                                                   Integer(T.Criteria1.checked),
                                                                   Integer(T.Criteria2.checked),
                                                                   Integer(T.Criteria3.checked),
                                                                   Integer(T.Criteria4.checked),
                                                                   T.id_razd_st,
                                                                   t.cxRadioGroup1.ItemIndex);
              DataSet.Open;

              ViewLevel8.ViewData.Expand(true);
              isQuit:=false;
    end;
    T.Free;

    if isQuit
    then PostMessage(self.Handle, WM_CLOSE,0,0);
end;

                    
procedure TfrmHtmlReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;


procedure TfrmHtmlReport.doConfigureGroupDetailGrid(id_smeta:Int64);
var ArrColumns: array of TcxGridDBBandedColumn;
    i:Integer;
    D,M,Y:Word;
    SmTitleQuery:TpfibDataSet;
    D1:TDateTime;
begin
    //Получаем информацию по периоду функционирования бюджета
    D1:=Now;
    Screen.Cursor:=crSQLWait;


    i:=0;
    while (i<=ViewLevel8.ColumnCount-1) do
    begin
         if TcxGridDBBandedColumn(ViewLevel8.Columns[i]).Position.BandIndex=1
         then begin
                   ViewLevel8.Columns[i].Free;
                   i:=i-1;
         end
         else i:=i+1;
    end;

    SmTitleQuery:=TpfibDataSet.Create(self);
    SmTitleQuery.Database:=WorkDatabase;
    SmTitleQuery.Transaction:=ReadTransaction;
    SmTitleQuery.SelectSQL.Text:='SELECT * FROM BU_GET_SM_IN_PERIOD('+IntToStr(id_smeta)+','+''''+DateToStr(date)+''''+','+''''+DateToStr(date)+''''+')';
    SmTitleQuery.Open;
    SmTitleQuery.FetchAll;
    SmTitleQuery.First;

    SetLength(ArrColumns,SmTitleQuery.RecordCount*2);
    ViewLevel8.Bands[1].Width:=SmTitleQuery.RecordCount*150;

    for i:=1 to SmTitleQuery.RecordCount do
    begin
         ArrColumns[i-1]:= ViewLevel8.CreateColumn;
         ArrColumns[i-1].HeaderAlignmentHorz:=taCenter;
         ArrColumns[i-1].PropertiesClass:=TcxTextEditProperties;
         TcxTextEditProperties(ArrColumns[i-1].Properties).Alignment.Vert:=taVCenter;
         ArrColumns[i-1].Position.BandIndex:=1;
         ArrColumns[i-1].Width:=150;
         ArrColumns[i-1].Styles.OnGetContentStyle:=ViewLevel8DBBandedColumn5StylesGetContentStyle;
         ArrColumns[i-1].Options.Filtering:=false;
         ArrColumns[i-1].DataBinding.FieldName:='SM_'+SmTitleQuery.FieldByName('id_plan').AsString;
         ArrColumns[i-1].Name:='SM_'+SmTitleQuery.FieldByName('id_plan').AsString;
         DecodeDate(D1,Y,M,D);
         ArrColumns[i-1].Caption:=SmTitleQuery.FieldByName('NOTE').AsString;

         ArrColumns[i]:= ViewLevel8.CreateColumn;
         ArrColumns[i].HeaderAlignmentHorz:=taCenter;
         ArrColumns[i].PropertiesClass:=TcxTextEditProperties;
         TcxTextEditProperties(ArrColumns[i].Properties).Alignment.Vert:=taVCenter;
         ArrColumns[i].Position.BandIndex:=1;
         ArrColumns[i].Width:=150;
         ArrColumns[i].Styles.OnGetContentStyle:=ViewLevel8DBBandedColumn5StylesGetContentStyle;
         ArrColumns[i].Options.Filtering:=false;
         ArrColumns[i].DataBinding.FieldName:='SM_'+SmTitleQuery.FieldByName('id_plan').AsString+'_percent';
         ArrColumns[i].Name:='SM_'+SmTitleQuery.FieldByName('id_plan').AsString+'_percent';
         ArrColumns[i].Caption:='%';
         ArrColumns[i].Visible:=False;

         D1:=IncMonth(D1,1);

         with ViewLevel8.DataController.Summary.DefaultGroupSummaryItems.Add as TcxGridDBBandedTableSummaryItem do
         begin
              Column := ArrColumns[i-1];
              FieldName:='SM_'+SmTitleQuery.FieldByName('id_plan').AsString+'_FC';
              Kind := skSum;
              Format := '0.00;-0.00';
              Position:=spFooter;
        end;

        SmTitleQuery.Next;
    end;

    SmTitleQuery.Close;
    SmTitleQuery.Free;
    Screen.Cursor:=crDefault;
end;

function TfrmHtmlReport.getSQLTextForGroupPlanDetail(id_smeta:Int64;criteria1,criteria2,criteria3, criteria4:Integer;id_razd_st:int64;id_level:integer): String;
var i:Integer;
    SmTitleQuery:TpfibDataSet;
    ResStr:String;
    T:TfrmGetAnalizelevel;
begin
    //Получаем информацию по бюджетам, которые входят в группу
    SmTitleQuery:=TpfibDataSet.Create(self);
    SmTitleQuery.Database:=WorkDatabase;
    SmTitleQuery.Transaction:=ReadTransaction;
    SmTitleQuery.SelectSQL.Text:='SELECT * FROM  BU_GET_SM_IN_PERIOD('+IntToStr(id_smeta)+','+''''+DateToStr(date)+''''+','+''''+DateToStr(date)+''''+')';
    SmTitleQuery.Open;
    SmTitleQuery.FetchAll;
    SmTitleQuery.First;

    ResStr:=' SELECT VAL.*, ';
    i:=1;
    while (i<SmTitleQuery.RecordCount) do
    begin
         ResStr:=ResStr+' ( SELECT PLAN_VALUE FROM BU_GET_PLAN_VALUE(VAL.SHOW_ID,'+SmTitleQuery.FieldByName('ID_PLAN').AsString+')) AS '+' SM_'+SmTitleQuery.FieldByName('id_plan').AsString;
         ResStr:=ResStr+' , ';
         ResStr:=ResStr+' ( SELECT PLAN_VALUE_FC FROM BU_GET_PLAN_VALUE(VAL.SHOW_ID,'+SmTitleQuery.FieldByName('ID_PLAN').AsString+')) AS '+' SM_'+SmTitleQuery.FieldByName('id_plan').AsString+'_FC';
         ResStr:=ResStr+' , ';
         ResStr:=ResStr+' ( SELECT PLAN_VALUE_PERCENT FROM BU_GET_PLAN_VALUE(VAL.SHOW_ID,'+SmTitleQuery.FieldByName('ID_PLAN').AsString+')) AS '+' SM_'+SmTitleQuery.FieldByName('id_plan').AsString+'_percent';
         ResStr:=ResStr+' , ';

         i:=i+1;
         SmTitleQuery.Next;
    end;
    ResStr:=ResStr+' ( SELECT PLAN_VALUE FROM BU_GET_PLAN_VALUE(VAL.SHOW_ID,'+SmTitleQuery.FieldByName('ID_PLAN').AsString+')) AS '+' SM_'+SmTitleQuery.FieldByName('id_plan').AsString+' , ';
    ResStr:=ResStr+' ( SELECT PLAN_VALUE_FC FROM BU_GET_PLAN_VALUE(VAL.SHOW_ID,'+SmTitleQuery.FieldByName('ID_PLAN').AsString+')) AS '+' SM_'+SmTitleQuery.FieldByName('id_plan').AsString+'_FC'+' , ';
    ResStr:=ResStr+' ( SELECT PLAN_VALUE_PERCENT FROM BU_GET_PLAN_VALUE(VAL.SHOW_ID,'+SmTitleQuery.FieldByName('ID_PLAN').AsString+')) AS '+' SM_'+SmTitleQuery.FieldByName('id_plan').AsString+'_percent';

    ResStr:=ResStr+'  FROM BU_GET_BUDGET_STRU_BY_PERIOD('+IntToStr(id_smeta)+','+
                                                        ''''+DateToStr(date)+''''+','+
                                                        ''''+DateToStr(date)+''''+','+
                                                        IntToStr(criteria1)+','+
                                                        IntToStr(criteria2)+','+
                                                        IntToStr(criteria3)+','+
                                                        IntToStr(criteria4)+','+
                                                        IntToStr(id_razd_st)+','+
                                                        IntToStr(id_level)+
                                                        ') val order by show_position';

    Result:=ResStr;
end;



procedure TfrmHtmlReport.ViewLevel8DBBandedColumn5StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[2]=1)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[2]=0)
      then AStyle:=RAZD_STYLE;
end;

procedure TfrmHtmlReport.PrintButtonClick(Sender: TObject);
begin
     with TfrmReport1Diagram.Create(self,DataSet) do
     begin
          Showmodal;
          free;
     end;
end;

procedure TfrmHtmlReport.cxCheckBox1PropertiesChange(Sender: TObject);
var i:Integer;
begin
     if cxCheckBox1.Checked
     then begin
               ViewLevel8.Bands[1].Width:=ViewLevel8.Bands[1].Width*2;

               for i:=0 to ViewLevel8.ColumnCount-1 do
               begin
                    if  not ViewLevel8.Columns[i].Visible
                    and (Pos('_percent',ViewLevel8.Columns[i].Name)>0)
                    then ViewLevel8.Columns[i].Visible:=true;
               end;


     end
     else begin
               ViewLevel8.Bands[1].Width:=ViewLevel8.Bands[1].Width div 2;

               for i:=0 to ViewLevel8.ColumnCount-1 do
               begin
                    if  ViewLevel8.Columns[i].Visible
                    and (Pos('_percent',ViewLevel8.Columns[i].Name)>0)
                    then ViewLevel8.Columns[i].Visible:=false;
               end;
     end;
end;

procedure TfrmHtmlReport.cxButton1Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmHtmlReport.cxButton3Click(Sender: TObject);
begin
shellexecute(Handle,
     'Open',
     PAnsiChar(ExtractFilePath(Application.ExeName)+'HELP\SAMPLE.chm'),
     nil,
     nil,
     SW_RESTORE);
end;

end.
