unit ACardFactRasx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, ComCtrls, ToolWin, ImgList, cxStyles, FIBDatabase,
  pFIBDatabase, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, pFibDataSet, ExtCtrls,
  FIBDataSet, StdCtrls ;

type
  TfrmGetFactRasx = class(TForm)
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
    PlanViewDBBandedColumn4: TcxGridDBBandedColumn;
    cxGridLevel2: TcxGridLevel;
    TabSheet2: TTabSheet;
    PlanViewDBBandedColumn3: TcxGridDBBandedColumn;
    Panel1: TPanel;
    FactDataSet: TpFIBDataSet;
    FactDataSource: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    cxGrid1: TcxGrid;
    VView: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDBBandedColumn3: TcxGridDBBandedColumn;
    cxGridDBBandedColumn4: TcxGridDBBandedColumn;
    cxGridLevel1: TcxGridLevel;
    FactDataSetV: TpFIBDataSet;
    FactDataSourceV: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
    id_pkv    :Int64;
    pkv_kod   :String;
    pkv_title :String;
    id_tfin   :Int64;
    tfin_kod  :String;
    tfin_title:String;
    date_beg  :TDateTime;
    date_end  :TDateTime;
    procedure ConfigureGrid;
    procedure getFactValuesSql;
    procedure getFactValuesSqlV;
    procedure getReportData;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64);reintroduce;
  end;



implementation

uses UCardGetfactrasxconfigure;

{$R *.dfm}
procedure TfrmGetFactRasx.getFactValuesSql;
var  Res:String;
     GetKekvInfo:TpFibDataSet;
     i:Integer;
begin
     GetKekvInfo               :=TpFibDataSet.Create(self);
     GetKekvInfo.Database      :=WorkDatabase;
     GetKekvInfo.Transaction   :=ReadTransaction;
     GetKekvInfo.SelectSQL.Text:=' SELECT DISTINCT * '+
                                 '   FROM ACARDS_GET_RASX_FACT_KEKV( '+ IntToStr(id_pkv)+','+IntToStr(id_tfin)+
                                 ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+') ORDER BY KEKV_KODE ASC';
     GetKekvInfo.Open;
     GetKekvInfo.Open;
     GetKekvInfo.FetchAll;
     GetKekvInfo.First;

     if (GetKekvInfo.RecordCount>0)
     then begin
               Res:='SELECT A.* , ';

               for i:=0 to GetKekvInfo.RecordCount-2 do
               begin
                    Res:=Res+ ' (SELECT RASX_SUMMA FROM ACARD_GET_RASX_FACT_VALUES_ITEM('+IntToStr(id_pkv)+','+IntToStr(id_tfin)+
                    ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+' , A.RASX_DATE ,'+GetKekvInfo.FieldByName('ID_KEKV').AsString+',A.ID_REG_UCH)) AS KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString+' , ';
                    GetKekvInfo.Next;
               end;

               Res:=Res+ ' (SELECT RASX_SUMMA FROM ACARD_GET_RASX_FACT_VALUES_ITEM('+IntToStr(id_pkv)+','+IntToStr(id_tfin)+
               ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+' , A.RASX_DATE ,'+GetKekvInfo.FieldByName('ID_KEKV').AsString+',A.ID_REG_UCH)) AS KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString;
     end
     else begin
               Res:='SELECT A.*  ';
     end;

     Res:=Res+'  FROM ACARD_GET_RASX_FACT_VALUES_EX('+IntToStr(id_pkv)+','+IntTostr(id_tfin)+
     ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+') A';

     FactDataSet.SelectSQL.Text:=Res;
end;


constructor TfrmGetFactRasx.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE;
  Id_user: Int64);
var T:TfrmFactrasxConfigureFrm;
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;


     T:=TfrmFactrasxConfigureFrm.Create(self);
     if T.ShowModal=mrYes
     then begin
               id_pkv    :=T.id_pkv;
               pkv_kod   :=T.pkv_kod;
               pkv_title :=T.pkv_title;
               id_tfin   :=T.id_tfin;
               tfin_kod  :=T.tfin_kod;
               tfin_title:=T.tfin_title;
               date_beg:=t.date_beg;
               date_end:=t.date_end;
               label1.Caption:='Програма: '+pkv_kod+' "'+pkv_title +'"';
               label2.Caption:='Тип коштів: '+tfin_kod+' "'+tfin_title +'"';

               ConfigureGrid;

               getReportData;

               PlanView.ViewData.Expand(true);
               VView.ViewData.Expand(true);               
     end
     else begin
               PostMessage(self.Handle,WM_CLOSE,0,0);
     end;
     T.Free;
end;

procedure TfrmGetFactRasx.ConfigureGrid;
var GetKekvInfo:TpFibDataSet;
    i,j:Integer;
    ArrColumns: array of TcxGridDBBandedColumn;
begin
     Screen.Cursor:=crHourGlass;
     i:=0;j:=PlanView.ColumnCount;
     while i<=j-1 do
     begin
           if (PlanView.Columns[i].Position.BandIndex=2)
           then begin
                     PlanView.Columns[i].Free;
                     j:=j-1;
                     i:=i-1;
           end
           else i:=i+1;
     end;

     i:=0;j:=VView.ColumnCount;
     while i<=j-1 do
     begin
           if (VView.Columns[i].Position.BandIndex=2)
           then begin
                     PlanView.Columns[i].Free;
                     j:=j-1;
                     i:=i-1;
           end
           else i:=i+1;
     end;

     GetKekvInfo               :=TpFibDataSet.Create(self);
     GetKekvInfo.Database      :=WorkDatabase;
     GetKekvInfo.Transaction   :=ReadTransaction;
     GetKekvInfo.SelectSQL.Text:=' SELECT DISTINCT * '+
                                 '   FROM ACARDS_GET_RASX_FACT_KEKV( '+ IntToStr(id_pkv)+','+IntToStr(id_tfin)+
                                 ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+') ORDER BY KEKV_KODE ASC';
     GetKekvInfo.Open;
     GetKekvInfo.Open;
     GetKekvInfo.FetchAll;
     GetKekvInfo.First;

     if (GetKekvInfo.RecordCount>0)
     then begin
               SetLength(ArrColumns,GetKekvInfo.RecordCount);
               VView.Bands[2].Width:=100*GetKekvInfo.RecordCount;

               for i:=0 to GetKekvInfo.RecordCount-1 do
               begin

                    ArrColumns[i-1]:= VView.CreateColumn;
                    ArrColumns[i-1].HeaderAlignmentHorz:=taCenter;
                    ArrColumns[i-1].PropertiesClass:=TcxTextEditProperties;
                    TcxTextEditProperties(ArrColumns[i-1].Properties).Alignment.Vert:=taVCenter;
                    TcxTextEditProperties(ArrColumns[i-1].Properties).Alignment.Horz:=taRightJustify;

                    ArrColumns[i-1].Position.BandIndex:=2;
                    ArrColumns[i-1].Width:=100;
                    ArrColumns[i-1].Options.Filtering:=false;
                    ArrColumns[i-1].DataBinding.FieldName:='KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString;
                    ArrColumns[i-1].Caption:=GetKekvInfo.FieldByName('KEKV_KODE').AsString;

                    with VView.DataController.Summary.FooterSummaryItems.Add as TcxGridDBBandedTableSummaryItem do
                    begin
                        Column := ArrColumns[i-1];
                        FieldName:='KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString;
                        Kind := skSum;
                        Format := '0.00;-0.00';
                        Position:=spFooter;
                    end;

                    GetKekvInfo.Next;
               end;

               GetKekvInfo.First;
               SetLength(ArrColumns,GetKekvInfo.RecordCount);
               PlanView.Bands[2].Width:=100*GetKekvInfo.RecordCount;

               for i:=0 to GetKekvInfo.RecordCount-1 do
               begin

                    ArrColumns[i-1]:=PlanView.CreateColumn;
                    ArrColumns[i-1].HeaderAlignmentHorz:=taCenter;
                    ArrColumns[i-1].PropertiesClass:=TcxTextEditProperties;
                    TcxTextEditProperties(ArrColumns[i-1].Properties).Alignment.Vert:=taVCenter;
                    TcxTextEditProperties(ArrColumns[i-1].Properties).Alignment.Horz:=taRightJustify;
                    ArrColumns[i-1].Position.BandIndex:=2;
                    ArrColumns[i-1].Width:=100;
                    ArrColumns[i-1].Options.Filtering:=false;
                    ArrColumns[i-1].DataBinding.FieldName:='KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString;
                    ArrColumns[i-1].Caption:=GetKekvInfo.FieldByName('KEKV_KODE').AsString;


                    with PlanView.DataController.Summary.FooterSummaryItems.Add as TcxGridDBBandedTableSummaryItem do
                    begin
                        Column := ArrColumns[i-1];
                        FieldName:='KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString;
                        Kind := skSum;
                        Format := '0.00;-0.00';
                        Position:=spFooter;
                    end;

                    GetKekvInfo.Next;
               end;
     end;
     GetKekvInfo.Close;
     GetKekvInfo.Free;

     Screen.Cursor:=crDefault;
end;


procedure TfrmGetFactRasx.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action :=caFree;
end;

procedure TfrmGetFactRasx.getReportData;
begin
     Screen.Cursor:=crHourGlass;

     if FactDataSet.Active then FactDataSet.Close;
     getFactValuesSql;
     FactDataSet.Open;

     if FactDataSetV.Active then FactDataSetV.Close;
     getFactValuesSqlV;
     FactDataSetV.Open;


     Screen.Cursor:=crDefault;
end;

procedure TfrmGetFactRasx.ToolButton5Click(Sender: TObject);
begin
         Close;
end;

procedure TfrmGetFactRasx.ToolButton3Click(Sender: TObject);
var  T:TfrmFactrasxConfigureFrm;
begin
     T:=TfrmFactrasxConfigureFrm.Create(self);
     T.id_pkv    :=id_pkv;
     T.pkv_kod   :=pkv_kod;
     T.pkv_title :=pkv_title;
     T.id_tfin   :=id_tfin;
     T.tfin_kod  :=tfin_kod;
     T.tfin_title:=tfin_title;
     if T.ShowModal=mrYes
     then begin
               id_pkv    :=T.id_pkv;
               pkv_kod   :=T.pkv_kod;
               pkv_title :=T.pkv_title;
               id_tfin   :=T.id_tfin;
               tfin_kod  :=T.tfin_kod;
               tfin_title:=T.tfin_title;
               date_beg:=t.date_beg;
               date_end:=t.date_end;
               label1.Caption:='Програма: '+pkv_kod+' "'+pkv_title +'"';
               label2.Caption:='Тип коштів: '+tfin_kod+' "'+tfin_title +'"';

               ConfigureGrid;

               getReportData;

               PlanView.ViewData.Expand(true);
     end
end;

procedure TfrmGetFactRasx.getFactValuesSqlV;
var  Res:String;
     GetKekvInfo:TpFibDataSet;
     i:Integer;
begin
     GetKekvInfo               :=TpFibDataSet.Create(self);
     GetKekvInfo.Database      :=WorkDatabase;
     GetKekvInfo.Transaction   :=ReadTransaction;
     GetKekvInfo.SelectSQL.Text:=' SELECT DISTINCT * '+
                                 '   FROM ACARDS_GET_RASX_FACT_KEKV( '+ IntToStr(id_pkv)+','+IntToStr(id_tfin)+
                                 ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+') ORDER BY KEKV_KODE ASC';
     GetKekvInfo.Open;
     GetKekvInfo.Open;
     GetKekvInfo.FetchAll;
     GetKekvInfo.First;

     if GetKekvInfo.RecordCount>0
     then begin
               Res:='SELECT A.* , ';

               for i:=0 to GetKekvInfo.RecordCount-2 do
               begin
                    Res:=Res+ ' (SELECT RASX_SUMMA FROM ACARD_GET_RASX_FACT_VALUES_IT_V('+IntToStr(id_pkv)+','+IntToStr(id_tfin)+
                    ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+' , A.RASX_DATE ,'+GetKekvInfo.FieldByName('ID_KEKV').AsString+',A.ID_REG_UCH)) AS KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString+' , ';
                    GetKekvInfo.Next;
               end;
               Res:=Res+ ' (SELECT RASX_SUMMA FROM ACARD_GET_RASX_FACT_VALUES_IT_V('+IntToStr(id_pkv)+','+IntToStr(id_tfin)+
               ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+' , A.RASX_DATE ,'+GetKekvInfo.FieldByName('ID_KEKV').AsString+',A.ID_REG_UCH)) AS KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString;
     end
     else begin
               Res:='SELECT A.*  ';
     end;

     Res:=Res+'  FROM ACARD_GET_RASX_FACT_VALUES_EX_V('+IntToStr(id_pkv)+','+IntTostr(id_tfin)+
     ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+') A';

     FactDataSetV.SelectSQL.Text:=Res;end;

end.
