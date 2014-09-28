unit BsUnivRep;

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
  uCommon_Funcs, uConsts, cxCheckBox, cxCalendar, cxMemo, BsUnivSprav,
  frxClass, frxDBSet;


type

  TfrmUnivReport = class(TForm)
    RepReadTrans: TpFIBTransaction;
    ActionList1: TActionList;
    ImageList: TImageList;
    pnlGrid: TPanel;
    BarManager: TdxBarManager;
    btnSelect: TdxBarLargeButton;
    btnClose: TdxBarLargeButton;
    ActClose: TAction;
    FilterDS: TDataSource;
    Panel1: TPanel;
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
    BsReportDSet: TpFIBDataSet;
    ActPrint: TAction;
    RepDB: TpFIBDatabase;
    RepWriteTrans: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    ReportGridDBView: TcxGridDBTableView;
    ReportGridLevel: TcxGridLevel;
    ReportGrid: TcxGrid;
    FilterSet: TpFIBDataSet;
    ColumnFilterChecked: TcxGridDBColumn;
    ColumnNameFilter: TcxGridDBColumn;
    PrintDSet: TpFIBDataSet;
    frDB: TfrxDBDataset;
    frReport: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure ReportGridDBViewDblClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
  private
    { Private declarations }
    IdReport:Integer;
    IdReportSession:Int64;
    procedure CloseConnect;
    procedure FilterDSetCloseOpen;
    procedure FilterValueDel;
    procedure SaveValueFilter(IdFilter, ValueFilter:Integer);
  public
    { Public declarations }
    constructor  Create(AParameter:TBsSimpleParams);reintroduce;
  end;

var
  frmUnivReport: TfrmUnivReport;

implementation

uses BsReportFilter;

{$R *.dfm}

constructor TfrmUnivReport.Create(AParameter:TBsSimpleParams);
begin
  try
    inherited Create(AParameter.Owner);
    RepDB.Handle:=AParameter.Db_Handle;
    IdReport:=AParameter.ID_Locate;
    StoredProc.StoredProcName:='PUB_GET_ID_BY_GEN';
    StoredProc.Transaction.StartTransaction;
    StoredProc.Prepare;
    StoredProc.ParamByName('GENERATOR_NAME').AsString:='GEN_BS_REPORT_SESSION_ID';
    StoredProc.ParamByName('STEP').AsShort:=1;
    StoredProc.ExecProc;
    IdReportSession:=StoredProc.FieldByName('Ret_Value').AsInt64;
    StoredProc.Transaction.Commit;
    BsReportDSet.Close;
    BsReportDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_DT_REPORTS WHERE ID_REPORT=:ID_REPORT';
    BsReportDSet.ParamByName('ID_REPORT').AsInteger:=IdReport;
    BsReportDSet.Open;
    Self.Caption:=BsReportDSet['NAME_REPORT'];
    FilterDSetCloseOpen;
  except on E:Exception
         do begin
               bsShowMessage('Увага!', E.Message, mtInformation, [mbOK])
            end;
  end;
end;


procedure TfrmUnivReport.FilterValueDel;
begin
    StoredProc.StoredProcName:='BS_REPORT_PARAMS_VALUE_DEL';
    StoredProc.Transaction.StartTransaction;
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_REPORT_SESSION').AsInt64:=IdReportSession;
    StoredProc.ParamByName('ID_FILTER').AsInteger:=FilterSet['ID_FILTER'];
    try
       StoredProc.ExecProc;
       StoredProc.Transaction.Commit;
    except on E:Exception do
           begin
              bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
              StoredProc.Transaction.Rollback;
           end;
    end;
end;

procedure TfrmUnivReport.SaveValueFilter(IdFilter, ValueFilter:Integer);
begin
   StoredProc.StoredProcName:='BS_REPORT_PARAM_VALUE_INIT';
   StoredProc.Transaction.StartTransaction;
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_REPORT_SESSION').AsInt64:=IdReportSession;
   StoredProc.ParamByName('ID_FILTER').AsInteger:=IdFilter;
   StoredProc.ParamByName('VALUE_PARAM').AsInteger:=ValueFilter;
   StoredProc.ExecProc;
   StoredProc.Transaction.Commit;
end;


procedure TfrmUnivReport.FilterDSetCloseOpen;
begin
   if FilterSet.Active then FilterSet.Close;
   FilterSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_REPORT_FILTER(:ID_REPORT, :ID_REPORT_SESSION)';
   FilterSet.ParamByName('ID_REPORT').AsInteger:=IdReport;
   FilterSet.ParamByName('ID_REPORT_SESSION').AsInt64:=IdReportSession;
   FilterSet.Open;
end;

procedure TfrmUnivReport.CloseConnect;
var i:Integer;
begin
   for i:=0 to RepDB.TransactionCount-1 do
   begin
      if RepDB.Transactions[i].Active then RepDB.Transactions[i].Rollback;
   end;
   RepDB.Close;
end;


procedure TfrmUnivReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CloseConnect;
   if FormStyle = fsMDIChild then action:=caFree;
end;

procedure TfrmUnivReport.btnCloseClick(Sender: TObject);
begin
   Close
end;

procedure TfrmUnivReport.ReportGridDBViewDblClick(Sender: TObject);
var Id:Integer;
    frmFilter:TfrmReportFilter;
    frm:TfrmSprav;
    sParam:TSpravParams;
begin
   if FilterSet.IsEmpty then Exit;
   Id:=FilterSet['ID_FILTER'];
   if FilterSet['IS_CHECKED']=1 then
   begin
      FilterValueDel;
      FilterDSetCloseOpen;
      FilterSet.Locate('ID_FILTER', Id, []);
   end
   else
   begin
      FilterValueDel;
      if FilterSet['USE_BPL']=1 then
      begin
          sParam.FormCaption := FilterSet['Form_Caption'];
          sParam.SelectText := 'SELECT DISTINCT * FROM '+FilterSet['Table_Name'];
          sParam.NameFields := FilterSet['Fields'];
          sParam.FieldsCaption := FilterSet['Fields_Name'];
          sParam.KeyField := FilterSet['Keyfield'];
          sParam.ReturnFields := FilterSet['Return_Fields'];
          sParam.FilterFields:=FilterSet['Name_Filter_Fields'];
          sParam.FilterCaptions:=FilterSet['Fields_Name'];
          sParam.DbHandle:=RepDB.Handle;
          sParam.NameClass:='TfrmEditCountry';
          sParam.DeleteProcName:='ADR_COUNTRY_D';
          sParam.frmButtons:=[fbSelect,fbExit];
          sParam.IsMultiSelect:=True;
          frm:=TfrmSprav.Create(Self, sParam);
          if frm.ShowModal=mrOk then
          begin
                frm.OutPutDS.First;
                while not frm.OutPutDS.Eof do
                begin
                   SaveValueFilter(FilterSet['ID_FILTER'], frm.OutPutDS[FilterSet['Keyfield']]);
                   frm.OutPutDS.Next;
                end;
          end;
          frm.Free;
          FilterDSetCloseOpen;
          FilterSet.Locate('ID_FILTER', Id, []);
      end
      else
      begin
         frmFilter:=TfrmReportFilter.Create(Self, FilterSet['Name_Functions'], FilterSet['Form_Caption']);
         if frmFilter.ShowModal=mrOk then
         begin
            case frmFilter.IdFunc of
                 0: begin
                       StoredProc.StoredProcName:='BS_REPORT_PARAM_VALUE_INIT';
                       StoredProc.Transaction.StartTransaction;
                       StoredProc.Prepare;
                       StoredProc.ParamByName('ID_REPORT_SESSION').AsInt64:=IdReportSession;
                       StoredProc.ParamByName('ID_FILTER').AsInteger:=Id;
                       StoredProc.ParamByName('DATE_BEG').AsDate:=frmFilter.ResFilter[0];
                       StoredProc.ParamByName('DATE_END').AsDate:=frmFilter.ResFilter[1];
                       StoredProc.ExecProc;
                       StoredProc.Transaction.Commit;
                    end;
                 1: begin
                       StoredProc.StoredProcName:='BS_REPORT_PARAM_VALUE_INIT';
                       StoredProc.Transaction.StartTransaction;
                       StoredProc.Prepare;
                       StoredProc.ParamByName('ID_REPORT_SESSION').AsInt64:=IdReportSession;
                       StoredProc.ParamByName('ID_FILTER').AsInteger:=FilterSet['ID_FILTER'];
                       StoredProc.ParamByName('DATE_BEG').AsDate:=frmFilter.ResFilter;
                       StoredProc.ExecProc;
                       StoredProc.Transaction.Commit;
                    end;
                 2: begin
                       SaveValueFilter(FilterSet['ID_FILTER'], frmFilter.ResFilter);
                    end;
                 3: begin
                       SaveValueFilter(FilterSet['ID_FILTER'], frmFilter.ResFilter);
                    end;
            end;
         end;
         FilterDSetCloseOpen;
         FilterSet.Locate('ID_FILTER', Id, []);
      end;
   end;
end;

procedure TfrmUnivReport.btnSelectClick(Sender: TObject);
begin
   try
      if PrintDSet.Active then PrintDSet.Close;
      PrintDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM '+BsReportDSet['NAME_PROCEDURE']+'('+IntToStr(IdReportSession)+')';
      if not VarIsNull(BsReportDSet['ADD_INFO']) then
         PrintDSet.SQLs.SelectSQL.Text:=PrintDSet.SQLs.SelectSQL.Text+BsReportDSet['ADD_INFO'];
      PrintDSet.Open;

      if PrintDSet.IsEmpty then
      begin
         bsShowMessage('Увага!', 'За обраними настройками фільтру не знайдено жодного запису!', mtInformation, [mbOK]);
         Exit;
      end;
      frReport.Clear;
      frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\'+BsReportDSet['Name_Fr3'], True);
      frReport.ShowReport(True);
   except on E:Exception do
          begin
             bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
          end;
   end;
end;

end.
