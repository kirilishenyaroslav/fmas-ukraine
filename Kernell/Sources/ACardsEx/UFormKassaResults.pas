unit UFormKassaResults;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, ComCtrls, ToolWin, ImgList, cxStyles, FIBDatabase,
  pFIBDatabase, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, pFibDataSet, ExtCtrls,
  FIBDataSet, StdCtrls , pFibStoredProc, AppStruClasses, cxExportGrid4Link,
  cxCalendar;

type
  TfrmGetResults = class(TForm)
    ReadTransaction: TpFIBTransaction;
    WorkDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    columnst: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    SmallImages: TImageList;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton1: TToolButton;
    ToolButton5: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    cxGrid3: TcxGrid;
    PlanView: TcxGridDBBandedTableView;
    PlanViewDBBandedColumn1: TcxGridDBBandedColumn;
    PlanViewDBBandedColumn2: TcxGridDBBandedColumn;
    cxGridLevel2: TcxGridLevel;
    Panel1: TPanel;
    FactDataSet: TpFIBDataSet;
    FactDataSource: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    ToolButton2: TToolButton;
    ToolButton6: TToolButton;
    NadColumn: TcxGridDBBandedColumn;
    PovernColumn: TcxGridDBBandedColumn;
    VidshkVColumn: TcxGridDBBandedColumn;
    SplachenoColumn: TcxGridDBBandedColumn;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    AllDColumn: TcxGridDBBandedColumn;
    AllRColumn: TcxGridDBBandedColumn;
    cxStyle6: TcxStyle;
    RestColumn: TcxGridDBBandedColumn;
    SaveDialog1: TSaveDialog;
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
  private
    { Private declarations }
    id_pkv    :Int64;
    id_tfin   :Int64;
    ThruKekv  :Boolean;
    fid_param_set:Integer;
    key_session:Int64;
    ArrColumns: array of array of TcxGridDBBandedColumn;
    ArrBands:       array of TcxGridBand;

    procedure ConfigureGrid;
    procedure getFactValuesSql;
    procedure getReportData;
    procedure fillTmpTable;
    procedure clearTmpTable;

  public
    { Public declarations }
    date_beg  :TDateTime;
    date_end  :TDateTime;
    organization:string;
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64; id_param_set:integer);reintroduce;
    procedure OnGetContentStyleRed(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure OnGetContentStyleRedH(Sender: TcxGridTableView; AColumn: TcxGridColumn; out AStyle: TcxStyle);
    procedure OnCustomDrawFooterCell(Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
  end;

implementation

uses UACConfigureFormEx, dateUtils, ACardsDocsInfoEx, UProgressEx,  ACardExPrintReport;

{$R *.dfm}


procedure TfrmGetResults.getFactValuesSql;
var  Res:String;
     GetKekvInfo:TpFibDataSet;
     i:Integer;
begin
     if FactDataSet.Active then FactDataSet.Close;
     FactDataSet.SelectSQL.Text:='';


     GetKekvInfo               :=TpFibDataSet.Create(self);
     GetKekvInfo.Database      :=WorkDatabase;
     GetKekvInfo.Transaction   :=ReadTransaction;
     GetKekvInfo.SelectSQL.Text:=' SELECT * '+
                                 '   FROM ACARDS_EX_GET_KEKV( '+ IntToStr(id_pkv)+','+IntToStr(id_tfin)+
                                 ' , '+''''+DateToStr(StartOfTheYear(date_beg))+''''+','+''''+DateToStr(date_end)+''''+','+IntToStr(Integer(Self.ThruKekv))+','+
                                 IntToStr(fid_param_set)+')'+' ORDER BY KEKV_KODE ASC';
     GetKekvInfo.Open;
     GetKekvInfo.FetchAll;
     GetKekvInfo.First;

     if (GetKekvInfo.RecordCount>0)
     then begin
               Res:='SELECT A.* , ';

               for i:=0 to GetKekvInfo.RecordCount-2 do
               begin
                    //Добавляем первое поле по разделу
                    Res:=Res+ ' (SELECT KASSA_SUMMA FROM ACARD_EX_GET_KASSA_ITEM('+IntToStr(id_pkv)+','+
                                                                                   IntToStr(id_tfin)+','+
                                                                                   IntToStr(fid_param_set)+' , '+
                                                                                   ''''+DateToStr(date_beg)+''''+','+
                                                                                   ''''+DateToStr(date_end)+''''+
                                                                                   ' , A.KASSA_DATE ,'+
                                                                                   GetKekvInfo.FieldByName('ID_KEKV').AsString+','+
                                                                                   IntToStr(Integer(ThruKekv))+
                                                                                   ', A.ID_TYPE_REC,'+
                                                                                   IntToStr(self.key_session)+')) AS KEKV_'+
                                                                                   GetKekvInfo.FieldByName('ID_KEKV').AsString+'_1 , ';

                    //Добавляем второе поле по разделу
                    Res:=Res+ ' (SELECT KASSA_SUMMA FROM ACARD_EX_GET_KASSA_ITEM('+IntToStr(id_pkv)+','+
                                                                                   IntToStr(id_tfin)+','+
                                                                                   IntToStr(fid_param_set)+' , '+
                                                                                   ''''+DateToStr(date_beg)+''''+','+
                                                                                   ''''+DateToStr(date_end)+''''+
                                                                                   ' , A.KASSA_DATE ,'+
                                                                                   GetKekvInfo.FieldByName('ID_KEKV').AsString+','+
                                                                                   IntToStr(Integer(ThruKekv))+
                                                                                   ', A.ID_TYPE_REC,'+
                                                                                   IntToStr(self.key_session)+')) AS KEKV_'+
                                                                                   GetKekvInfo.FieldByName('ID_KEKV').AsString+'_2 , ';

                    //Добавляем третье поле по разделу
                    Res:=Res+ ' (SELECT KASSA_SUMMA FROM ACARD_EX_GET_KASSA_ITEM('+IntToStr(id_pkv)+','+
                                                                                   IntToStr(id_tfin)+','+
                                                                                   IntToStr(fid_param_set)+' , '+
                                                                                   ''''+DateToStr(date_beg)+''''+','+
                                                                                   ''''+DateToStr(date_end)+''''+
                                                                                   ' , A.KASSA_DATE ,'+
                                                                                   GetKekvInfo.FieldByName('ID_KEKV').AsString+','+
                                                                                   IntToStr(Integer(ThruKekv))+
                                                                                   ', A.ID_TYPE_REC,'+
                                                                                   IntToStr(self.key_session)+')) AS KEKV_'+
                                                                                   GetKekvInfo.FieldByName('ID_KEKV').AsString+'_3 , ';

                    GetKekvInfo.Next;
               end;

               Res:=Res+ ' (SELECT KASSA_SUMMA FROM ACARD_EX_GET_KASSA_ITEM('+IntToStr(id_pkv)+','+
                                                                             IntToStr(id_tfin)+','+
                                                                             IntToStr(fid_param_set)+' , '+
                                                                             ''''+DateToStr(date_beg)+''''+','+
                                                                             ''''+DateToStr(date_end)+''''+
                                                                             ' , A.KASSA_DATE ,'+
                                                                             GetKekvInfo.FieldByName('ID_KEKV').AsString+','+
                                                                             IntToStr(Integer(ThruKekv))+
                                                                             ', A.ID_TYPE_REC,'+
                                                                             IntToStr(self.key_session)+')) AS KEKV_'+
                                                                             GetKekvInfo.FieldByName('ID_KEKV').AsString+'_1, ';

               Res:=Res+ ' (SELECT KASSA_SUMMA FROM ACARD_EX_GET_KASSA_ITEM('+IntToStr(id_pkv)+','+
                                                                             IntToStr(id_tfin)+','+
                                                                             IntToStr(fid_param_set)+' , '+
                                                                             ''''+DateToStr(date_beg)+''''+','+
                                                                             ''''+DateToStr(date_end)+''''+
                                                                             ' , A.KASSA_DATE ,'+
                                                                             GetKekvInfo.FieldByName('ID_KEKV').AsString+','+
                                                                             IntToStr(Integer(ThruKekv))+
                                                                             ', A.ID_TYPE_REC,'+
                                                                             IntToStr(self.key_session)+')) AS KEKV_'+
                                                                             GetKekvInfo.FieldByName('ID_KEKV').AsString+'_2, ';

               Res:=Res+ ' (SELECT KASSA_SUMMA FROM ACARD_EX_GET_KASSA_ITEM('+IntToStr(id_pkv)+','+
                                                                             IntToStr(id_tfin)+','+
                                                                             IntToStr(fid_param_set)+' , '+
                                                                             ''''+DateToStr(date_beg)+''''+','+
                                                                             ''''+DateToStr(date_end)+''''+
                                                                             ' , A.KASSA_DATE ,'+
                                                                             GetKekvInfo.FieldByName('ID_KEKV').AsString+','+
                                                                             IntToStr(Integer(ThruKekv))+
                                                                             ', A.ID_TYPE_REC,'+
                                                                             IntToStr(self.key_session)+')) AS KEKV_'+
                                                                             GetKekvInfo.FieldByName('ID_KEKV').AsString+'_3 ';

     end
     else begin
               Res:='SELECT A.*  ';
     end;

     Res:=Res+'  FROM ACARD_EX_GET_DATA ('+IntToStr(id_pkv)+','+IntTostr(id_tfin)+','+IntToStr(fid_param_set)+
     ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+','+IntToStr(Integer(ThruKekv))+','+Inttostr(self.key_session)+') A ORDER BY A.POS ASC, A.KASSA_DATE ASC, A.ID_TYPE_REC ASC';

     FactDataSet.SelectSQL.Text:=Res;
end;


constructor TfrmGetResults.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE;
  Id_user: Int64; id_param_set:Integer);
var  ACardsParamsDataSet:TpFIBDataSet;
     T:TfrmGetConfInfo;
begin
     inherited Create(AOwner);
     NadColumn.Styles.OnGetContentStyle:=OnGetContentStyleRed;
     PovernColumn.Styles.OnGetContentStyle:=OnGetContentStyleRed;

     NadColumn.Tag      :=1;
     PovernColumn.Tag   :=1;
     VidshkVColumn.Tag  :=-1;
     SplachenoColumn.Tag:=-1;
     AllDColumn.Tag     :=0;
     AllRColumn.Tag     :=0;
     RestColumn.Tag     :=0;


     PageControl1.ActivePageIndex:=0;
     ThruKekv:=False;
     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;
     key_session:=WorkDatabase.Gen_Id('ACARD_GEN_ID_SESSION',1);
     ACardsParamsDataSet:=TpFIBDataSet.Create(self);
     ACardsParamsDataSet.Database:=WorkDatabase;
     ACardsParamsDataSet.Transaction:=ReadTransaction;
     ACardsParamsDataSet.SelectSQL.Text:='select * from ACARDS_PRE_FORM_PARAMS_SEL(2) where id_param_set='+IntTostr(id_param_set);
     ACardsParamsDataSet.Open;

     if (ACardsParamsDataSet.RecordCount>0)
     then begin
               label1.Caption:='КПК: '+ACardsParamsDataSet.fieldbyname('PKV_TEXT').AsString;
               label2.Caption:='вид коштів: '+ACardsParamsDataSet.fieldbyname('TF_TEXT').AsString;
               id_pkv        :=ACardsParamsDataSet.fieldbyname('id_pkv').value;
               id_tfin       :=ACardsParamsDataSet.fieldbyname('id_tf').value;
               fid_param_set  :=ACardsParamsDataSet.fieldbyname('id_param_set').value;
               organization  :=ACardsParamsDataSet.fieldbyname('organization').value;
     end;

     Self.Update;

     T:=TfrmGetConfInfo.Create(self,WorkDatabase.Handle, StartOfTheMonth(IncMonth(date,-1)), EndOfTheMonth(date));
     if T.ShowModal=mrYes
     then begin
               date_beg:=t.DateBeg;
               date_end:=t.DateEnd;
               ThruKekv:=t.ShowKv.Checked;

               Screen.Cursor:=crHourGlass;

               with TfrmACardProgress.Create(self) do
               begin
               Update;
               Show;
               ConfigureGrid;

               getReportData;
               Free;
               end;

               Screen.Cursor:=crDefault;

               PlanView.ViewData.Expand(true);
     end
     else begin
               PostMessage(self.Handle,WM_CLOSE,0,0);
     end;
     T.Free;
end;

procedure TfrmGetResults.ConfigureGrid;
var GetKekvInfo:TpFibDataSet;
    i,j,k:Integer;
    isFull:Boolean;
begin

     Screen.Cursor:=crHourGlass;
     for j:=0 to Length(ArrColumns)-1 do
     begin
          for i:=0 to Length(ArrColumns[j])-1 do
          begin
                ArrColumns[j,i].Free;
          end;
     end;

     for j:=0 to Length(ArrBands)-1 do
     begin
          ArrBands[j].Free;
     end;

     ArrColumns:=nil;
     ArrBands  :=nil;

     GetKekvInfo               :=TpFibDataSet.Create(self);
     GetKekvInfo.Database      :=WorkDatabase;
     GetKekvInfo.Transaction   :=ReadTransaction;
     GetKekvInfo.SelectSQL.Text:=' SELECT * '+
                                 '   FROM ACARDS_EX_GET_KEKV( '+ IntToStr(id_pkv)+','+IntToStr(id_tfin)+
                                 ' , '+''''+DateToStr(StartOfTheYear(date_beg))+''''+','+''''+DateToStr(date_end)+''''+','+IntToStr(Integer(Self.ThruKekv))+','+
                                 IntToStr(fid_param_set)+')'+' ORDER BY KEKV_KODE ASC';

     GetKekvInfo.Open;
     GetKekvInfo.FetchAll;
     GetKekvInfo.First;

     if (GetKekvInfo.RecordCount>0)
     then begin
               GetKekvInfo.First;
               SetLength(ArrBands,  GetKekvInfo.RecordCount);
               SetLength(ArrColumns,GetKekvInfo.RecordCount);

               for i:=1 to GetKekvInfo.RecordCount do
               begin
                    ArrBands[i-1]:=PlanView.Bands.Add;
                    ArrBands[i-1].Caption:=GetKekvInfo.FieldByName('KEKV_KODE').AsString;
                    ArrBands[i-1].Width:=300;

                    SetLength(ArrColumns[i-1],3);

                    //1-колонка
                    ArrColumns[i-1,0]:=PlanView.CreateColumn;
                    ArrColumns[i-1,0].HeaderAlignmentHorz:=taCenter;
                    ArrColumns[i-1,0].PropertiesClass:=TcxTextEditProperties;
                    TcxTextEditProperties(ArrColumns[i-1,0].Properties).Alignment.Vert:=taVCenter;
                    TcxTextEditProperties(ArrColumns[i-1,0].Properties).Alignment.Horz:=taRightJustify;
                    ArrColumns[i-1,0].Position.BandIndex:=ArrBands[i-1].Index;
                    ArrColumns[i-1,0].Width:=100;
                    ArrColumns[i-1,0].Options.Filtering:=false;
                    ArrColumns[i-1,0].DataBinding.FieldName:='KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString+'_1';
                    ArrColumns[i-1,0].Tag:=GetKekvInfo.FieldByName('ID_KEKV').Value;
                    if GetKekvInfo.FieldByName('profitable').Value=0
                    then begin
                              ArrColumns[i-1,0].Tag:=-ArrColumns[i-1,0].Tag;
                              ArrColumns[i-1,0].Caption:='Сплачено';
                    end
                    else begin
                              ArrColumns[i-1,0].Caption:='Надійшло';
                    end;

                    ArrColumns[i-1,0].Options.Filtering:=false;
                    ArrColumns[i-1,0].SortOrder:=soNone;
                    with PlanView.DataController.Summary.DefaultGroupSummaryItems.Add as TcxGridDBBandedTableSummaryItem do
                    begin
                          Column := ArrColumns[i-1,0];
                          FieldName:='KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString;
                          Kind := skSum;
                          Format := '0.00;-0.00';
                          Position:=spFooter;
                    end;
                    if (GetKekvInfo.FieldByName('profitable').Value =1)
                    then begin
                              ArrColumns[i-1,0].Styles.OnGetContentStyle:=OnGetContentStyleRed;
                              ArrColumns[i-1,0].Styles.OnGetFooterStyle :=OnGetContentStyleRed;
                    end
                    else ArrColumns[i-1,0].Styles.Footer:=cxStyle1;
                    ArrColumns[i-1,0].OnCustomDrawFooterCell:=OnCustomDrawFooterCell;


                    //2-колонка
                    ArrColumns[i-1,1]:=PlanView.CreateColumn;
                    ArrColumns[i-1,1].HeaderAlignmentHorz:=taCenter;
                    ArrColumns[i-1,1].PropertiesClass:=TcxTextEditProperties;
                    TcxTextEditProperties(ArrColumns[i-1,1].Properties).Alignment.Vert:=taVCenter;
                    TcxTextEditProperties(ArrColumns[i-1,1].Properties).Alignment.Horz:=taRightJustify;
                    ArrColumns[i-1,1].Position.BandIndex:=ArrBands[i-1].Index;
                    ArrColumns[i-1,1].Width:=100;
                    ArrColumns[i-1,1].Options.Filtering:=false;
                    ArrColumns[i-1,1].DataBinding.FieldName:='KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString+'_2';
                    ArrColumns[i-1,1].Tag:=GetKekvInfo.FieldByName('ID_KEKV').Value;

                    if GetKekvInfo.FieldByName('profitable').Value=0
                    then begin
                              ArrColumns[i-1,1].Tag:=-ArrColumns[i-1,1].Tag;
                              ArrColumns[i-1,1].Caption:='Відшкодовано';

                    end
                    else begin
                              ArrColumns[i-1,1].Caption:='Повернено';
                    end;

                    ArrColumns[i-1,1].Options.Filtering:=false;
                    ArrColumns[i-1,1].SortOrder:=soNone;
                    with PlanView.DataController.Summary.DefaultGroupSummaryItems.Add as TcxGridDBBandedTableSummaryItem do
                    begin
                          Column := ArrColumns[i-1,1];
                          FieldName:='KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString;
                          Kind := skSum;
                          Format := '0.00;-0.00';
                          Position:=spFooter;
                    end;
                    if (GetKekvInfo.FieldByName('profitable').Value =1)
                    then begin
                              ArrColumns[i-1,1].Styles.OnGetContentStyle:=OnGetContentStyleRed;
                              ArrColumns[i-1,1].Styles.OnGetFooterStyle :=OnGetContentStyleRed;
                    end
                    else ArrColumns[i-1,1].Styles.Footer:=cxStyle1;
                    ArrColumns[i-1,1].OnCustomDrawFooterCell:=OnCustomDrawFooterCell;

                    //3-колонка
                    ArrColumns[i-1,2]:=PlanView.CreateColumn;
                    ArrColumns[i-1,2].HeaderAlignmentHorz:=taCenter;
                    ArrColumns[i-1,2].PropertiesClass:=TcxTextEditProperties;
                    TcxTextEditProperties(ArrColumns[i-1,2].Properties).Alignment.Vert:=taVCenter;
                    TcxTextEditProperties(ArrColumns[i-1,2].Properties).Alignment.Horz:=taRightJustify;
                    ArrColumns[i-1,2].Position.BandIndex:=ArrBands[i-1].Index;
                    ArrColumns[i-1,2].Width:=100;
                    ArrColumns[i-1,2].Options.Filtering:=false;
                    ArrColumns[i-1,2].DataBinding.FieldName:='KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString+'_3';
                    ArrColumns[i-1,2].Tag:=GetKekvInfo.FieldByName('ID_KEKV').Value;
                    if GetKekvInfo.FieldByName('profitable').Value=0
                    then ArrColumns[i-1,2].Tag:=-ArrColumns[i-1,2].Tag;
                    ArrColumns[i-1,2].Caption:='Всього';
                    ArrColumns[i-1,2].Options.Filtering:=false;
                    ArrColumns[i-1,2].SortOrder:=soNone;
                    with PlanView.DataController.Summary.DefaultGroupSummaryItems.Add as TcxGridDBBandedTableSummaryItem do
                    begin
                          Column := ArrColumns[i-1,2];
                          FieldName:='KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString;
                          Kind := skSum;
                          Format := '0.00;-0.00';
                          Position:=spFooter;
                    end;
                    if (GetKekvInfo.FieldByName('profitable').Value =1)
                    then begin
                              ArrColumns[i-1,2].Styles.OnGetContentStyle:=OnGetContentStyleRed;
                              ArrColumns[i-1,2].Styles.OnGetFooterStyle :=OnGetContentStyleRed;
                    end
                    else ArrColumns[i-1,2].Styles.Footer:=cxStyle1;
                    ArrColumns[i-1,2].OnCustomDrawFooterCell:=OnCustomDrawFooterCell;
                    
                    GetKekvInfo.Next;
               end;
     end;
     GetKekvInfo.Close;
     GetKekvInfo.Free;


     //Необходимо проанализировать и убрать пустные столбцы
     {for j:=0 to Length(ArrColumns)-1 do
     begin
          isFull:=true;
          for i:=0 to Length(ArrColumns[j])-1 do
          begin
                for k:=0 to PlanView.DataController.RowCount-1 do
                begin
                     if PlanView.DataController.Values[k,ArrColumns[j,i].Index]<>NULL
                     then begin
                               isFull:=false;
                               Break;
                     end;
                end;
                ArrColumns[j,i].Visible:=isFull;
          end;
     end;}

     Screen.Cursor:=crDefault;
end;


procedure TfrmGetResults.getReportData;
begin
     Screen.Cursor:=crHourGlass;

     if WriteTransaction.InTransaction then WriteTransaction.Rollback;
     WriteTransaction.StartTransaction;

     fillTmpTable;

     if FactDataSet.Active then FactDataSet.Close;
     getFactValuesSql;
     FactDataSet.Open;

     Screen.Cursor:=crDefault;
end;

procedure TfrmGetResults.ToolButton5Click(Sender: TObject);
begin
         Close;
end;

procedure TfrmGetResults.ToolButton3Click(Sender: TObject);
var  T:TfrmGetConfInfo;
     F:TfrmACardProgress;
begin
     T:=TfrmGetConfInfo.Create(self,WorkDatabase.Handle,date_beg,date_end);
     t.ShowKv.Checked:=ThruKekv;

     if T.ShowModal=mrYes
     then begin
               date_beg:=t.datebeg;
               date_end:=t.DateEnd;
               ThruKekv:=t.ShowKv.Checked;

               Screen.Cursor:=crHourGlass;
               F:=TfrmACardProgress.Create(self);

               F.Show;
               F.Update;
               ConfigureGrid;

               getReportData;
               F.Free;
               Screen.Cursor:=crDefault;

               PlanView.ViewData.Expand(true);
     end;
     T.Free;
end;


procedure TfrmGetResults.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmGetResults.ToolButton2Click(Sender: TObject);
var T:TfrmACDocsInfoEx;
    id_razdel, id_kekv, profitable :Integer;
begin
     if PageControl1.ActivePageIndex=0
     then begin
               if (FactDataSet.RecordCount>0)
               then begin
                         if ThruKekv
                         then begin
                                   id_razdel:=-1;
                                   id_kekv  :=abs(PlanView.Controller.FocusedColumn.Tag);
                                   if abs(id_kekv)=1 then id_kekv:=0;
                         end
                         else begin
                                   id_razdel:=abs(PlanView.Controller.FocusedColumn.Tag);
                                   if abs(id_razdel)=1 then id_razdel:=0;
                                   id_kekv  :=-1
                         end;

                         if PlanView.Controller.FocusedColumn.Tag>0
                         then profitable:=1
                         else if PlanView.Controller.FocusedColumn.Tag<0
                              then profitable:=0
                              else begin
                                   Exit;
                              end;

                         T:=TfrmACDocsInfoEx.Create(Self,
                                                  WorkDatabase.Handle,
                                                  fid_param_set,
                                                  id_razdel,
                                                  id_kekv,
                                                  date_beg,
                                                  date_end,
                                                  FactDataSet.Fieldbyname('KASSA_DATE').Value,
                                                  1,
                                                  'ACARD_GET_DOC_INFO_EX',
                                                  FactDataSet.FieldByName('ID_TYPE_REC').Value,
                                                  profitable,
                                                  ThruKekv);

                         T.ShowModal;
                         T.Free;
               end;
     end;
end;

procedure TfrmGetResults.ToolButton6Click(Sender: TObject);
var T:TAcExPrintReport;
begin
     T:=TAcExPrintReport.Create(self,1);
     T.ShowModal;
     T.Free;
end;

procedure TfrmGetResults.clearTmpTable;
var fillSP:TpFibStoredProc;
begin

     fillSP:=TpFibStoredProc.Create(self);
     fillSP.Database:=WorkDatabase;
     fillSP.Transaction:=WriteTransaction;
     fillSP.StoredProcName:='ACARDS_CLEAR_TMPTABLE';
     fillSP.Prepare;
     fillSP.ParamByName('ID_SESSION').AsInt64:=key_session;
     fillSP.ExecProc;
     fillSP.close;
     fillSP.Free;

end;

procedure TfrmGetResults.fillTmpTable;
var fillSP:TpFibStoredProc;
begin


     fillSP:=TpFibStoredProc.Create(self);
     fillSP.Database:=WorkDatabase;
     fillSP.Transaction:=WriteTransaction;
     fillSP.StoredProcName:='ACARDS_FILL_TMPTABLE';
     fillSP.Prepare;
     fillSP.ParamByName('ID_SESSION').AsInt64:=key_session;
     fillSP.ParamByName('date_beg').Value:=StartOfTheYear(self.date_beg);
     fillSP.ParamByName('date_end').Value:=self.date_end;
     fillSP.ParamByName('ID_SET_PARAM').Value:=self.fid_param_set;
     fillSP.ParamByName('form_type').Value:=1;
     fillSP.ExecProc;
     fillSP.close;
     fillSP.Free;
end;

procedure TfrmGetResults.OnGetContentStyleRed(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      AStyle:=cxStyle4;
end;

procedure TfrmGetResults.OnGetContentStyleRedH(Sender: TcxGridTableView;
  AColumn: TcxGridColumn; out AStyle: TcxStyle);
begin
      AStyle:=cxStyle5;
end;

procedure TfrmGetResults.ToolButton4Click(Sender: TObject);
begin
      if SaveDialog1.Execute
      then begin
                ExportGrid4ToExcel(SaveDialog1.FileName, cxGrid3, false, true, false);
      end;
end;

procedure TfrmGetResults.OnCustomDrawFooterCell(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
var
  AItem1: TcxGridColumn;
  i:Integer;
  Sum: Extended;
  AGridRecord, AGroupRecord: TcxCustomGridRecord;
  ALevel, ADataGroupIndex  : Integer;
begin

    { AItem1 := AViewInfo.Column;

     if AViewInfo is TcxGridRowFooterCellViewInfo
     then begin
               AGridRecord := TcxGridRowFooterCellViewInfo(AViewInfo).GridRecord;
               ALevel := TcxGridRowFooterCellViewInfo(AViewInfo).Container.GroupLevel;
               ADataGroupIndex := Sender.DataController.Groups.DataGroupIndexByRowIndex[AGridRecord.Index];

               Sum    := 12345.67;//PlanView.DataController.Summary.DefaultGroupSummaryItems.IndexOfItemLink(AItem1);

               if AViewInfo.Column.Tag>0
               then begin
                         //Доходный раздел

                         //По разделу расчатать суммы


                         AViewInfo.Text :=Format('Над.:%n / '+'Пов.:%n'+' / Всього:%n', [Sum,Sum,Sum]);
               end
               else begin
                         //Расходный раздел

                         //По разделу расчатать суммы

                         AViewInfo.Text :=Format('Спл.:%n / '+'Відш.:%n'+' / Всього:%n',[Sum,Sum,Sum]);
               end;
     end;  }       

end;

end.
