unit USmRestMainResults;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, ComCtrls, ToolWin, ImgList, cxStyles,
  Ibase, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  DB, cxDBData, cxTextEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid,pFibDataSet, ExtCtrls, cxGridBandedTableView,
  cxGridDBBandedTableView, cxContainer, cxCheckBox, FIBDataSet,
  cxExportGrid4Link, cxExport, ActnList, Placemnt, frxClass, frxDBSet;

type
  TColumnGroupInfo = record
         GroupIndex:Integer;
         FieldName :String;
  end;


  TfrmMainResults = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    columnst: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    SmallImages: TImageList;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    WorkDatabase: TpFIBDatabase;
    cxGrid3: TcxGrid;
    cxGridLevel2: TcxGridLevel;
    OstView: TcxGridDBBandedTableView;
    SmGrColumn: TcxGridDBBandedColumn;
    SmColumn: TcxGridDBBandedColumn;
    cxCheckBox1: TcxCheckBox;
    ToolButton1: TToolButton;
    ResultsDataSet: TpFIBDataSet;
    ResultsDataSource: TDataSource;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    Panel2: TPanel;
    SaveDialog1: TSaveDialog;
    DbColumn: TcxGridDBBandedColumn;
    ActionList1: TActionList;
    Action1: TAction;
    PkvColumn: TcxGridDBBandedColumn;
    FormStorage1: TFormStorage;
    ToolButton6: TToolButton;
    DbzColumn: TcxGridDBBandedColumn;
    KrzColumn: TcxGridDBBandedColumn;
    MatColumn: TcxGridDBBandedColumn;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    PrintDataSet: TpFIBDataSet;
    SchColumn: TcxGridDBBandedColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton3Click(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
    KEY_SESSION : Int64;
    ShowSmGr:Boolean;
    ShowSm:Boolean;
    ShowPKV:Boolean;
    ShowSch:Boolean;
    TypeSchInfo:Integer;
    TypeSmGrInfo:Integer;
    TypeSmInfo:Integer;
    TypePKVInfo:Integer;
  public
    { Public declarations }
    MBookDate:TDateTime;
    DateBeg:TDateTIme;
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer);overload;
    procedure ConfigureGrid;
  end;

  procedure GetSmRest(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer);stdcall;
  exports GetSmRest;

implementation


uses USmRestConfigureForm, cxRadioGroup, cxCalendar;
{$R *.dfm}

procedure GetSmRest(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer);
var f:Boolean;
    i:Integer;
begin
    f :=true;
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    begin
         if (Application.MainForm.MDIChildren[i] is TfrmMainResults)
         then begin
                           Application.MainForm.MDIChildren[i].BringToFront;
                           f:=false;
         end;
    end;
    if f then TfrmMainResults.Create(AOwner,DBHandle,Id_User);
end;


procedure TfrmMainResults.ConfigureGrid;
var SQLText:String;
    SeleSmGr,SeleSm, SelePKV, SeleSch:String;
    OredrSch:String;
begin
     

     Screen.Cursor:=crSQLWait;

     OredrSch:='   DUMMY_FIELD ';

     if ShowSmGr
     then begin
               SmGrColumn.Visible:=true;
               OstView.Bands[0].Visible:=true;
               if TypeSmGrInfo=0 then begin
                                           SeleSmGr :=' , CORR_SM_GR_NUM';
                                           SmGrColumn.DataBinding.FieldName:='CORR_SM_GR_NUM';
                                 end;
               if TypeSmGrInfo=1 then begin
                                           SeleSmGr :=' , CORR_SM_GR_TITLE';
                                           SmGrColumn.DataBinding.FieldName:='CORR_SM_GR_TITLE';
                                 end;
               if TypeSmGrInfo=2 then begin
                                           SeleSmGr :=' , CORR_SM_GR_FULL';
                                           SmGrColumn.DataBinding.FieldName:='CORR_SM_GR_FULL';
                                 end;
     end
     else begin
               SmGrColumn.Visible:=false;
               SeleSmGr :='';
     end;

     if ShowPKV
     then begin
               PKVColumn.Visible:=true;
               OstView.Bands[0].Visible:=true;
               if TypePKVInfo=0 then begin
                                           SelePKV :=' , CORR_PKV_NUM';
                                           PKVColumn.DataBinding.FieldName:='CORR_PKV_NUM';
                                 end;
               if TypeSmGrInfo=1 then begin
                                           SelePKV :=' , CORR_PKV_NUM';
                                           PKVColumn.DataBinding.FieldName:='CORR_PKV_NUM';
                                 end;
               if TypeSmGrInfo=2 then begin
                                           SelePKV :=' , CORR_PKV_NUM';
                                           PKVColumn.DataBinding.FieldName:='CORR_PKV_NUM';
                                 end;
     end
     else begin
               PKVColumn.Visible:=false;
               SelePKV :='';
     end;


     if ShowSm
     then begin
               SmColumn.Visible:=true;
               OstView.Bands[0].Visible:=true;
               if TypeSmInfo=0 then begin
                                         SeleSm:=' , CORR_SM_NUM';
                                         SchColumn.DataBinding.FieldName  :='CORR_SM_NUM';
                               end;
               if TypeSmInfo=1 then begin
                                         SeleSm:=' , CORR_SM_TITLE';
                                         SchColumn.DataBinding.FieldName  :='CORR_SM_TITLE';
                               end;
               if TypeSmInfo=2 then begin
                                         SeleSm:=' , CORR_SM_TITLE';
                                         SchColumn.DataBinding.FieldName  :='CORR_SM_TITLE';
                               end;
     end
     else begin
               SmColumn.Visible:=false;
               SeleSm:='';
     end;

     if ShowSch
     then begin
               SchColumn.Visible:=true;
               OstView.Bands[0].Visible:=true;
               if TypeSchInfo=0 then begin
                                         SeleSch:=' , CORR_SCH_NUM';
                                         SchColumn.DataBinding.FieldName  :='CORR_SCH_NUM';
                               end;
               if TypeSchInfo=1 then begin
                                         SeleSch:=' , CORR_SCH_TITLE';
                                         SchColumn.DataBinding.FieldName  :='CORR_SCH_TITLE';
                               end;
               if TypeSchInfo=2 then begin
                                         SeleSch:=' , CORR_SM_FULL';
                                         SchColumn.DataBinding.FieldName  :='CORR_SM_FULL';
                               end;
     end
     else begin
               SchColumn.Visible:=false;
               SeleSch:='';
     end;


     if (Integer(ShowSm)+Integer(ShowSmGr)+Integer(ShowPKV)+Integer(ShowSch)=0)
     then OstView.Bands[0].Visible:=false
     else OstView.Bands[0].Visible:=true;


     if ResultsDataSet.Active then ResultsDataSet.Close;

     SQLText:='SELECT SUM(K_SUMMA)  AS K_SUMMA,  '+
              '       SUM(DZ_SUMMA) AS DZ_SUMMA, '+
              '       SUM(KZ_SUMMA) AS KZ_SUMMA, '+
              '       SUM(MZ_SUMMA) AS MZ_SUMMA  '+SeleSmGr + SeleSm +  SelePKV+ SeleSch+
              '  FROM BU_GET_REST_ANALIZE('+''''+DateToStr(DateBeg)+''''+')'+
              ' GROUP BY '+OredrSch+ SeleSmGr + SeleSm +  SelePKV +SeleSch;

     ResultsDataSet.SelectSQL.Text:=SQLText;
     ResultsDataSet.Open;

     Screen.Cursor:=crDefault;
end;

constructor TfrmMainResults.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE;
  Id_User: Integer);
var T:TfrmGetConfInfo;
    TempdataSet:TpFibDataSet;
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;
     self.KEY_SESSION:= WorkDataBase.Gen_Id('GEN_MBOOK_OBOR_INFO',1);

     TempdataSet:=TpFibDataSet.Create(self);
     TempdataSet.Database:=WorkDatabase;
     TempdataSet.Transaction:=ReadTransaction;
     TempdataSet.SQLs.SelectSQL.Text:='SELECT * FROM PUB_SYS_DATA';
     TempdataSet.Open;
     MBookDate:=TempdataSet.FieldByName('MAIN_BOOK_DATE').AsDateTime;
     self.DateBeg:=MBookDate;
     TempdataSet.Close;
     TempdataSet.Free;

     T       :=TfrmGetConfInfo.Create(self,DateBeg);
     if T.ShowModal=mryes
     then begin
                 DateBeg :=T.cxDateEdit1.Date;
                 ShowSmGr:=T.ShowSmGr.Checked;
                 ShowSm  :=T.ShowSm.Checked;
                 ShowPKV :=T.ShowProgram.Checked;
                 ShowSch :=T.ShowSch.Checked;
                 TypeSmGrInfo :=T.edTypeSmGrInfo.ItemIndex;
                 TypeSmInfo   :=T.edTypeSmInfo.ItemIndex;
                 TypePKVInfo  :=T.edProgramInfo.ItemIndex;
                 TypeSchInfo  :=T.edTypeSchInfo.ItemIndex;

                 ConfigureGrid;
     end
     else PostMessage(handle,WM_CLOSE,0,0);
     T.Free;
end;

procedure TfrmMainResults.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmMainResults.ToolButton3Click(Sender: TObject);
var T:TfrmGetConfInfo;
begin
     T:=TfrmGetConfInfo.Create(self,self.DateBeg);
     T.cxDateEdit1.Date:=self.DateBeg;
     T.edTypeSmGrInfo.ItemIndex:=TypeSmGrInfo;
     T.edTypeSmInfo.ItemIndex  :=TypeSmInfo;
     T.edProgramInfo.ItemIndex :=TypePKVInfo;
     T.edTypeSchInfo.ItemIndex :=TypeSchInfo;

     T.ShowSmGr.Checked:=ShowSmGr;
     T.ShowSm.Checked:=ShowSm;
     T.ShowProgram.Checked:=ShowPKV;
     T.ShowSch.Checked:=ShowSch;
     if T.ShowModal=mrYes
     then begin
               DateBeg :=T.cxDateEdit1.Date;

               ShowSmGr   :=T.ShowSmGr.Checked;
               ShowSm     :=T.ShowSm.Checked;
               ShowPKV    :=T.ShowProgram.Checked;
               ShowSch    :=T.ShowSch.Checked;

               TypeSmGrInfo :=T.edTypeSmGrInfo.ItemIndex;
               TypeSmInfo   :=T.edTypeSmInfo.ItemIndex;
               TypeSchInfo  :=T.edProgramInfo.ItemIndex;
               TypeSchInfo  :=T.edTypeSchInfo.ItemIndex;

               ConfigureGrid;

     end;
     T.Free;

end;

procedure TfrmMainResults.cxCheckBox1PropertiesChange(Sender: TObject);
begin
     OstView.OptionsView.GroupByBox:=cxCheckBox1.Checked;
end;

procedure TfrmMainResults.ToolButton5Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmMainResults.ToolButton4Click(Sender: TObject);
begin
if SaveDialog1.Execute
then begin
     ExportGrid4ToExcel(SaveDialog1.FileName,cxGrid3, false, true, false);
end;

end;

procedure TfrmMainResults.Action1Execute(Sender: TObject);
begin
     ToolButton3.OnClick(self);
end;

procedure TfrmMainResults.ToolButton6Click(Sender: TObject);
var I:Integer;
begin
     for i:=0 to OstView.ColumnCount-1 do OstView.Columns[i].Options.Filtering:=ToolButton6.Down;
end;

procedure TfrmMainResults.ToolButton2Click(Sender: TObject);
var Page            :TfrxReportPage;
    Band            :TfrxBand;
    ReportSummary   :TfrxReportSummary;
    PageHeader      :TfrxPageHeader;
    DataBand        :TfrxMasterData;
    GroupHeaderBand :TfrxGroupHeader;
    GroupFoterBand  :TfrxGroupFooter;
    Memo            :TfrxMemoView;
    SysMemo         :TfrxSysMemoView;
    i,k             :Integer;
    ColumnWidth     :Extended;
    GroupOrder      :array of TColumnGroupInfo;
    SummaryOrder    :array of TColumnGroupInfo;
    OrderFields     :array of TColumnGroupInfo;
    GroupCount      :Integer;
    tempGI          :Integer;
    tempFN          :String;
    MinSummaryItem  :Integer;
    VisibleColCnt   :Integer;
begin
     //Подготавливаем данные
     GroupCount   :=0;
     VisibleColCnt:=0;
     GroupOrder   :=nil;
     SummaryOrder :=nil;
     OrderFields  :=nil;


     for i:=0 to OstView.ColumnCount-1 do
     begin
           if (OstView.Columns[i].GroupIndex>-1) then Inc(GroupCount);
           if (OstView.Columns[i].Visible) then   Inc(VisibleColCnt);
     end;
     SetLength(GroupOrder,GroupCount);

     k:=0;
     for i:=0 to OstView.ColumnCount-1 do
     begin
          if (OstView.Columns[i].GroupIndex>-1) and (OstView.Columns[i].Visible)
          then begin
                    GroupOrder[k].GroupIndex:=OstView.Columns[i].GroupIndex;
                    GroupOrder[k].FieldName :=OstView.Columns[i].DataBinding.FieldName;
                    Inc(k);
          end;
     end;

     for i:=0 to Length(GroupOrder)-1 do
     begin
          for k:=i+1 to Length(GroupOrder)-1 do
          begin
                if GroupOrder[i].GroupIndex>GroupOrder[k].GroupIndex
                then begin
                          tempGI:=GroupOrder[i].GroupIndex;
                          tempFN:=GroupOrder[i].FieldName;

                          GroupOrder[i].GroupIndex:=GroupOrder[k].GroupIndex;
                          GroupOrder[i].FieldName :=GroupOrder[k].FieldName;

                          GroupOrder[k].GroupIndex:=tempGI;
                          GroupOrder[k].FieldName :=tempFN;
                end;
          end;
     end;

     SetLength(OrderFields,VisibleColCnt-4);

     k:=0;
     for i:=0 to OstView.ColumnCount-1 do
     begin
          if  (OstView.Columns[i].Visible)
          and (OstView.Columns[i].DataBinding.FieldName<>'K_SUMMA')
          and (OstView.Columns[i].DataBinding.FieldName<>'DZ_SUMMA')
          and (OstView.Columns[i].DataBinding.FieldName<>'KZ_SUMMA')
          and (OstView.Columns[i].DataBinding.FieldName<>'MZ_SUMMA')
          then begin
                    if OstView.Columns[i].GroupIndex<>-1
                    then OrderFields[k].GroupIndex:=-OstView.Columns[i].GroupIndex
                    else OrderFields[k].GroupIndex:=-200;
                    OrderFields[k].FieldName :=OstView.Columns[i].DataBinding.FieldName;
                    inc(k);
          end;
     end;

     if (Length(OrderFields)>4)
     then begin
               for i:=0 to Length(OrderFields)-1 do
               begin
                    for k:=i+1 to Length(OrderFields)-1 do
                    begin
                          if OrderFields[i].GroupIndex<OrderFields[k].GroupIndex
                          then begin
                                    tempGI:=OrderFields[i].GroupIndex;
                                    tempFN:=OrderFields[i].FieldName;

                                    OrderFields[i].GroupIndex:=OrderFields[k].GroupIndex;
                                    OrderFields[i].FieldName :=OrderFields[k].FieldName;

                                    OrderFields[k].GroupIndex:=tempGI;
                                    OrderFields[k].FieldName :=tempFN;
                          end;
                    end;
               end;
     end;

     Screen.Cursor:=crSQLWait;
     if PrintDataSet.Active then PrintDataSet.Close;
     PrintDataSet.SelectSQL.Text:=ResultsDataSet.SelectSQL.Text + 'ORDER BY  ';

     if (Length(OrderFields)>2)
     then begin
                 for i:=0 to Length(OrderFields)-2 do
                 begin
                      PrintDataSet.SelectSQL.Text:=PrintDataSet.SelectSQL.Text+OrderFields[i].FieldName+',';
                 end;
                 PrintDataSet.SelectSQL.Text:=PrintDataSet.SelectSQL.Text+OrderFields[i].FieldName;
     end
     else PrintDataSet.SelectSQL.Text:=PrintDataSet.SelectSQL.Text+OrderFields[0].FieldName;
     PrintDataSet.Open;

     Screen.Cursor:=crDefault;

     //Подготавливаем данные о суммированиях
     k:=0; MinSummaryItem:=999999;
     SetLength(SummaryOrder,OstView.DataController.Summary.DefaultGroupSummaryItems.Count);
     for i:=0 to OstView.DataController.Summary.DefaultGroupSummaryItems.Count-1 do
     begin
           SummaryOrder[k].FieldName :=TcxGridDbTableSummaryItem(OstView.DataController.Summary.DefaultGroupSummaryItems.Items[i]).FieldName;
           SummaryOrder[k].GroupIndex:=TcxGridDbTableSummaryItem(OstView.DataController.Summary.DefaultGroupSummaryItems.Items[i]).Column.VisibleIndex;

           if (MinSummaryItem>SummaryOrder[k].GroupIndex) then MinSummaryItem:=SummaryOrder[k].GroupIndex;
           Inc(k);
     end;

     //Предваиптельно очищаем отчет
     frxReport1.Clear;

     //Добавляем источник данных
     frxReport1.DataSets.Add(frxDBDataset1);

     //Создаем страницу
     Page:=TfrxReportPage.Create(frxReport1);
     Page.CreateUniqueName;
     Page.SetDefaults;

     //Page.Orientation:=poLandscape;

     //Создаем и настраиваем заголовок
     Band:=TfrxReportTitle.Create(Page);
     Band.CreateUniqueName;
     Band.Top:=0;
     Band.Height:=60;

     Memo:=TfrxMemoView.Create(Band);
     Memo.CreateUniqueName;
     Memo.Text:=Panel2.Caption;
     Memo.HAlign:=haCenter;
     Memo.VAlign:=TfrxVAlign(vaCenter);
     Memo.Font.Size:=12;
     Memo.Font.Style:=[fsBold];
     Memo.Height:=40;
     Memo.Align:=baWidth;

     PageHeader      :=TfrxPageHeader.Create(Page);
     PageHeader.Top  :=100;
     PageHeader.Height:=30;
     PageHeader.Stretched:=true;


     ColumnWidth:=(Page.Width- fr01in*Page.LeftMargin)/(VisibleColCnt);

     k:=0;
     for i:=0 to OstView.ColumnCount-1 do
     begin
          if OstView.Columns[i].Visible
          then begin
                     Memo:=TfrxMemoView.Create(PageHeader);
                     Memo.CreateUniqueName;
                     Memo.SetBounds(0+k*ColumnWidth,0,ColumnWidth,30);
                     Memo.Text:=OstView.Columns[i].Caption;;
                     Memo.Color:=clGradientInactiveCaption;
                     Memo.HAlign:=haCenter;
                     Memo.VAlign:=TfrxVAlign(vaCenter);
                     Memo.Font.Size:=10;
                     Memo.Font.Style:=[];
                     Memo.Frame.Style:=fsSolid;
                     Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
                     Memo.StretchMode:=smMaxHeight;
                     Memo.WordWrap   :=true;
                     inc(k);
          end;
     end;


     for i:=0 to Length(GroupOrder)-1 do
     begin
           GroupHeaderBand:=TfrxGroupHeader.Create(Page);
           GroupHeaderBand.CreateUniqueName;
           GroupHeaderBand.Top       :=130+i*30;
           GroupHeaderBand.Height    :=20;
           GroupHeaderBand.Condition :=frxDBDataset1.UserName+'."'+GroupOrder[i].FieldName+'"';
           GroupHeaderBand.Stretched:=true;

           Memo:=TfrxMemoView.Create(GroupHeaderBand);
           Memo.CreateUniqueName;
           Memo.DataSet:=frxDBDataset1;
           Memo.DataField:=GroupOrder[i].FieldName;
           Memo.SetBounds(0,0,(i+1)*ColumnWidth,20);
           Memo.HAlign:=haLeft;
           Memo.Color :=clGradientInactiveCaption;
           Memo.VAlign:=TfrxVAlign(vaCenter);
           Memo.Font.Size:=8;
           Memo.Font.Style:=[fsBold];
           Memo.Frame.Style:=fsSolid;
           Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
           Memo.StretchMode:=smMaxHeight;
           Memo.WordWrap   :=true;
     end;

     Databand:=TfrxMasterData.Create(Page);
     Databand.Name:='MasterData1';
     Databand.DataSet:=frxDBDataset1;
     Databand.Top:=500;
     Databand.Height:=20;
     Databand.Stretched:=true;

     k:=0;
     for i:=0 to OstView.ColumnCount-1 do
     begin
          if OstView.Columns[i].Visible
          then begin
                     Memo:=TfrxMemoView.Create(DataBand);
                     Memo.CreateUniqueName;
                     Memo.SetBounds(0+k*ColumnWidth,0,ColumnWidth,20);
                     Memo.DataSet:=frxDBDataset1;
                     Memo.DataField:=OstView.Columns[i].DataBinding.FieldName;
                     Memo.HAlign:=haCenter;
                     Memo.VAlign:=TfrxVAlign(vaCenter);
                     Memo.Font.Size:=8;
                     Memo.Font.Style:=[];
                     Memo.Frame.Style:=fsSolid;
                     Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
                     Memo.StretchMode:=smMaxHeight;
                     Memo.WordWrap   :=true;

                     if (OstView.Columns[i].DataBinding.FieldName='K_SUMMA')
                     or (OstView.Columns[i].DataBinding.FieldName='DZ_SUMMA')
                     or (OstView.Columns[i].DataBinding.FieldName='KZ_SUMMA')
                     or (OstView.Columns[i].DataBinding.FieldName='MZ_SUMMA')
                     then begin
                               Memo.DisplayFormat.FormatStr:='%2.2f';
                               Memo.DisplayFormat.Kind:=fkNumeric;
                               Memo.HAlign:=haRight;
                     end;
                     inc(k);
            end;
     end;

     if (Length(GroupOrder)>0)
     then begin
          for k:=0 to Length(GroupOrder)-1 do
          begin
                     GroupFoterBand:=TfrxGroupFooter.Create(Page);
                     GroupFoterBand.CreateUniqueName;
                     GroupFoterBand.Top       :=700+k*30;
                     GroupFoterBand.Height    :=20;

                     for i:=0 to Length(SummaryOrder)-1 do
                     begin
                           SysMemo:=TfrxSysMemoView.Create(GroupFoterBand);
                           SysMemo.CreateUniqueName;
                           SysMemo.Text:='[SUM(<'+frxDBDataset1.UserName+'."'+SummaryOrder[i].FieldName+'">,MasterData1)]';
                           SysMemo.SetBounds(0+SummaryOrder[i].GroupIndex*ColumnWidth,0,ColumnWidth,20);
                           SysMemo.HAlign:=haRight;
                           SysMemo.VAlign:=TfrxVAlign(vaCenter);
                           SysMemo.Font.Size:=8;
                           SysMemo.Font.Style:=[fsBold];
                           SysMemo.Frame.Style:=fsSolid;
                           SysMemo.DisplayFormat.FormatStr:='%2.2f';
                           SysMemo.DisplayFormat.Kind:=fkNumeric;
                           SysMemo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
                           SysMemo.Color:=clGradientInactiveCaption;
                     end;

                     if (MinSummaryItem<>999999) and (MinSummaryItem<>0)
                     then begin
                               Memo:=TfrxMemoView.Create(GroupFoterBand);
                               Memo.CreateUniqueName;
                               Memo.SetBounds(0+(MinSummaryItem-1)*ColumnWidth,0,ColumnWidth,20);
                               Memo.Text:='Сума :';
                               Memo.Color:=clGradientInactiveCaption;
                               Memo.HAlign:=haRight;
                               Memo.VAlign:=TfrxVAlign(vaCenter);
                               Memo.Font.Size:=8;
                               Memo.Font.Style:=[];
                               Memo.Frame.Style:=fsSolid;
                               Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
                     end;
          end;
     end;

     ReportSummary   :=TfrxReportSummary.Create(Page);
     ReportSummary.CreateUniqueName;
     ReportSummary.Top:=1000;
     ReportSummary.Height:=30;

     for i:=0 to Length(SummaryOrder)-1 do
     begin
           SysMemo:=TfrxSysMemoView.Create(ReportSummary);
           SysMemo.CreateUniqueName;
           SysMemo.Text:='[SUM(<'+frxDBDataset1.UserName+'."'+SummaryOrder[i].FieldName+'">,MasterData1)]';
           SysMemo.SetBounds(0+SummaryOrder[i].GroupIndex*ColumnWidth,10,ColumnWidth,20);
           SysMemo.HAlign:=haRight;
           SysMemo.VAlign:=TfrxVAlign(vaCenter);
           SysMemo.Font.Size:=8;
           SysMemo.Font.Style:=[fsBold];
           SysMemo.Frame.Style:=fsSolid;
           SysMemo.DisplayFormat.FormatStr:='%2.2f';
           SysMemo.DisplayFormat.Kind:=fkNumeric;
           SysMemo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
           Sysmemo.Color:=clGradientInactiveCaption;
     end;

     if (MinSummaryItem<>999999) and (MinSummaryItem<>0)
     then begin
               Memo:=TfrxMemoView.Create(ReportSummary);
               Memo.CreateUniqueName;
               Memo.SetBounds(0+(MinSummaryItem-1)*ColumnWidth,10,ColumnWidth,20);
               Memo.Text:='Загалом по звіту:';
               Memo.Color:=clGradientInactiveCaption;
               Memo.HAlign:=haRight;
               Memo.VAlign:=TfrxVAlign(vaCenter);
               Memo.Font.Size:=10;
               Memo.Font.Style:=[];
               Memo.Frame.Style:=fsSolid;
               Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
     end;

     //Показываем отчет
     frxReport1.ShowReport;
end;

end.
