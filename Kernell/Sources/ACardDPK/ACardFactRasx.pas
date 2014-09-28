unit ACardFactRasx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, ComCtrls, ToolWin, ImgList, cxStyles, FIBDatabase,
  pFIBDatabase, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, pFibDataSet, ExtCtrls,
  FIBDataSet, StdCtrls, pFibStoredProc ;

type
  TfrmGetFactRsx = class(TForm)
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
    ToolButton2: TToolButton;
    ToolButton6: TToolButton;
    SchFDataSet: TpFIBDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
  private
    { Private declarations }
    id_pkv    :Int64;
    id_tfin   :Int64;
    fid_param_set:Integer;
    ThruKekv  :Boolean;
    Key_session:Int64;
    with_dates:Boolean;
    with_reg :Integer;
    procedure ConfigureGrid;
    procedure getFactValuesSql;
    procedure getFactValuesSqlV;
    procedure getReportData;
    procedure clearTmpTable;
    procedure fillTmpTable;
  public
    { Public declarations }
    date_beg  :TDateTime;
    date_end  :TDateTime;
    organixation:String;
    KOD_EDRPOU:string;
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64;id_param_set:Integer);reintroduce;
    procedure OnGetContentStyleRed(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  end;



implementation

uses UACConfigureForm, dateUtils, ACardsDocsInfo, UProgress, ACardPrintReport;
{$R *.dfm}
procedure TfrmGetFactRsx.getFactValuesSql;
var  Res:String;
     GetKekvInfo:TpFibDataSet;
     i:Integer;
begin
     if FactDataSet.Active then FactDataSet.Close;
     FactDataSet.SelectSQL.Text:='';


     GetKekvInfo               :=TpFibDataSet.Create(self);
     GetKekvInfo.Database      :=WorkDatabase;
     GetKekvInfo.Transaction   :=WriteTransaction;
     GetKekvInfo.SelectSQL.Text:=' SELECT * '+
                                 '   FROM ACARDS_GET_KEKVF2( '+ IntToStr(id_pkv)+','+IntToStr(id_tfin)+
                                 ' , '+''''+DateToStr(StartOfTheYear(date_beg))+''''+','+''''+DateToStr(date_end)+''''+','+IntToStr(Integer(Self.ThruKekv))+','+
                                 IntToStr(fid_param_set)+','+IntToStr(self.Key_session)+')'+' ORDER BY KEKV_KODE ASC';
     GetKekvInfo.Open;
     GetKekvInfo.FetchAll;
     GetKekvInfo.First;

     if (GetKekvInfo.RecordCount>0)
     then begin
               Res:='SELECT A.* , ';

               for i:=0 to GetKekvInfo.RecordCount-2 do
               begin
                    Res:=Res+ ' (SELECT RASX_SUMMA FROM ACARD_GET_RASX_FACT_VAL_ITEM('+IntToStr(id_pkv)+','+IntToStr(id_tfin)+','+IntToStr(fid_param_set)+
                    ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+' , A.RASX_DATE ,'+GetKekvInfo.FieldByName('ID_KEKV').AsString+','+IntToStr(Integer(ThruKekv))+', A.ID_REG_UCH, A.ID_TYPE_REC,'+IntToStr(self.Key_session)+
                    ','+IntToStr(Integer(with_dates))+','+IntToStr(with_reg)+' )) AS KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString+' , ';
                    GetKekvInfo.Next;
               end;

               Res:=Res+ ' (SELECT RASX_SUMMA FROM ACARD_GET_RASX_FACT_VAL_ITEM('+IntToStr(id_pkv)+','+IntToStr(id_tfin)+','+IntToStr(fid_param_set)+
               ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+' , A.RASX_DATE ,'+GetKekvInfo.FieldByName('ID_KEKV').AsString+','+IntToStr(Integer(ThruKekv))+', A.ID_REG_UCH, A.ID_TYPE_REC,'+IntToStr(self.Key_session)+
               ','+IntToStr(Integer(with_dates))+','+IntToStr(with_reg)+')) AS KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString;
     end
     else begin
               Res:='SELECT A.*  ';
     end;

     Res:=Res+'  FROM ACARD_GET_RASX_FACT_VALUES_EX ('+IntToStr(id_pkv)+','+IntTostr(id_tfin)+','+IntToStr(fid_param_set)+
     ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+','+IntToStr(Integer(ThruKekv))+','+IntToStr(self.Key_session)+','+
     IntTostr(Integer(self.with_dates))+','+IntToStr(with_reg)+') A ORDER BY A.id_type_rec ASC, A.RASX_DATE ASC';

     FactDataSet.SelectSQL.Text:=Res;
end;


constructor TfrmGetFactRsx.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE;
  Id_user: Int64; id_param_set:Integer);
var  ACardsParamsDataSet:TpFIBDataSet;
     T:TfrmGetConfInfo;
begin
     inherited Create(AOwner);
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
               label1.Caption:='КПКВК: '+ACardsParamsDataSet.fieldbyname('PKV_TEXT').AsString;
               label2.Caption:='вид коштів: '+ACardsParamsDataSet.fieldbyname('TF_TEXT').AsString;
               id_pkv        :=ACardsParamsDataSet.fieldbyname('id_pkv').value;
               id_tfin       :=ACardsParamsDataSet.fieldbyname('id_tf').value;
               fid_param_set :=ACardsParamsDataSet.fieldbyname('id_param_set').value;
               organixation  :=ACardsParamsDataSet.fieldbyname('organization').value;
               KOD_EDRPOU    :=ACardsParamsDataSet.fieldbyname('KOD_EDRPOU').value;
               SchFDataSet.SelectSQL.Text:='select * from ACARDS_PRE_FORMS_SCHF_SEL2('+IntTostr(id_param_set)+','+''''+DateToStr(StartOfTheMonth(date))+''''+','+''''+DateToStr(EndOfTheMonth(date))+''''+','+IntTostr(id_pkv)+','+IntToStr(id_tfin)+',0)';
               SchFDataSet.Open;
               SchFDataSet.FetchAll;               
     end;


     T:=TfrmGetConfInfo.Create(self,WorkDatabase.Handle, StartOfTheMonth(IncMonth(date,-1)), EndOfTheMonth(date),false);
     if T.ShowModal=mrYes
     then begin
               date_beg  :=t.DateBeg;
               date_end  :=t.DateEnd;
               with_dates:=t.cbWithDates.Checked;
               with_reg  :=t.ThruFR.ItemIndex;
               ThruKekv:=t.ShowKv.Checked;

               Screen.Cursor:=crHourGlass;
               with TfrmACardProgress.Create(self) do
               begin
               Update;
               Show;

               getReportData;
               Free;
               end;
               Screen.Cursor:=crDefault;

               PlanView.ViewData.Expand(true);
               VView.ViewData.Expand(true);
     end
     else begin
               PostMessage(self.Handle,WM_CLOSE,0,0);
     end;
     T.Free;
end;

procedure TfrmGetFactRsx.ConfigureGrid;
var GetKekvInfo:TpFibDataSet;
    i,j:Integer;
    ArrColumns: array of TcxGridDBBandedColumn;
begin
     FreeAndNil(ArrColumns);
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
                     VView.Columns[i].Free;
                     j:=j-1;
                     i:=i-1;
           end
           else i:=i+1;
     end;

     GetKekvInfo               :=TpFibDataSet.Create(self);
     GetKekvInfo.Database      :=WorkDatabase;
     GetKekvInfo.Transaction   :=WriteTransaction;
     GetKekvInfo.SelectSQL.Text:=' SELECT * '+
                                 '   FROM ACARDS_GET_KEKVF2( '+ IntToStr(id_pkv)+','+IntToStr(id_tfin)+
                                 ' , '+''''+DateToStr(StartOfTheYear(date_beg))+''''+','+''''+DateToStr(date_end)+''''+','+IntToStr(Integer(Self.ThruKekv))+','+
                                 IntToStr(fid_param_set)+','+IntToStr(self.Key_session)+')'+' ORDER BY KEKV_KODE ASC';

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
                    ArrColumns[i-1].Tag:=GetKekvInfo.FieldByName('ID_KEKV').Value;
                    ArrColumns[i-1].Caption:=GetKekvInfo.FieldByName('KEKV_KODE').AsString;
                    ArrColumns[i-1].Options.Filtering:=false;
                    ArrColumns[i-1].SortOrder:=soNone;

                    if (GetKekvInfo.FieldByName('profitable').Value=1)
                    then begin
                              ArrColumns[i-1].Styles.OnGetContentStyle:=OnGetContentStyleRed;
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
                    ArrColumns[i-1].Tag:=GetKekvInfo.FieldByName('ID_KEKV').Value;
                    ArrColumns[i-1].Caption:=GetKekvInfo.FieldByName('KEKV_KODE').AsString;
                    ArrColumns[i-1].Options.Filtering:=false;
                    ArrColumns[i-1].SortOrder:=soNone;


                    GetKekvInfo.Next;
               end;
     end;
     GetKekvInfo.Close;
     GetKekvInfo.Free;

     Screen.Cursor:=crDefault;
end;


procedure TfrmGetFactRsx.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action :=caFree;
end;

procedure TfrmGetFactRsx.getReportData;
begin
     Screen.Cursor:=crHourGlass;

     if WriteTransaction.InTransaction then WriteTransaction.Rollback;
     WriteTransaction.StartTransaction;

     fillTmpTable;
     ConfigureGrid;

     if FactDataSet.Active then FactDataSet.Close;
     getFactValuesSql;
     FactDataSet.Open;

     if FactDataSetV.Active then FactDataSetV.Close;
     getFactValuesSqlV;
     FactDataSetV.Open;

     clearTmpTable;

     Screen.Cursor:=crDefault;
end;

procedure TfrmGetFactRsx.ToolButton5Click(Sender: TObject);
begin
         Close;
end;

procedure TfrmGetFactRsx.getFactValuesSqlV;
var  Res:String;
     GetKekvInfo:TpFibDataSet;
     i:Integer;
begin
     if FactDataSetV.Active then FactDataSet.Close;
     FactDataSetV.SelectSQL.Text:='';


     GetKekvInfo               :=TpFibDataSet.Create(self);
     GetKekvInfo.Database      :=WorkDatabase;
     GetKekvInfo.Transaction   :=WriteTransaction;
     GetKekvInfo.SelectSQL.Text:=' SELECT * '+
                                 '   FROM ACARDS_GET_KEKVF2( '+ IntToStr(id_pkv)+','+IntToStr(id_tfin)+
                                 ' , '+''''+DateToStr(StartOfTheYear(date_beg))+''''+','+''''+DateToStr(date_end)+''''+','+IntToStr(Integer(Self.ThruKekv))+','+
                                 IntToStr(fid_param_set)+','+IntToStr(self.Key_session)+')'+' ORDER BY KEKV_KODE ASC';
     GetKekvInfo.Open;
     GetKekvInfo.FetchAll;
     GetKekvInfo.First;

     if (GetKekvInfo.RecordCount>0)
     then begin
               Res:='SELECT A.* , ';

               for i:=0 to GetKekvInfo.RecordCount-2 do
               begin
                    Res:=Res+ ' (SELECT RASX_SUMMA FROM ACARD_GET_RASX_FACT_VAL_ITEM_V('+IntToStr(id_pkv)+','+IntToStr(id_tfin)+','+IntToStr(fid_param_set)+
                    ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+' , A.RASX_DATE ,'+GetKekvInfo.FieldByName('ID_KEKV').AsString+','+
                    IntToStr(Integer(ThruKekv))+', A.ID_REG_UCH, a.id_type_rec,'+IntTostr(self.Key_session)+','+IntToSTR(Integer(with_dates))+','+
                    IntToStr(with_reg)+')) AS KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString+' , ';
                    GetKekvInfo.Next;
               end;

               Res:=Res+ ' (SELECT RASX_SUMMA FROM ACARD_GET_RASX_FACT_VAL_ITEM_V('+IntToStr(id_pkv)+','+IntToStr(id_tfin)+','+IntToStr(fid_param_set)+
               ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+' , A.RASX_DATE ,'+GetKekvInfo.FieldByName('ID_KEKV').AsString+','+
               IntToStr(Integer(ThruKekv))+', A.ID_REG_UCH, a.id_type_rec,'+IntTostr(self.Key_session)+','+IntToStr(Integer(with_dates))+','+
               IntToStr(with_reg)+')) AS KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString;
     end
     else begin
               Res:='SELECT A.*  ';
     end;

     Res:=Res+'  FROM ACARD_GET_RASX_FACT_VALUES_EX_V ('+IntToStr(id_pkv)+','+IntTostr(id_tfin)+','+IntToStr(fid_param_set)+
     ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+','+IntToStr(Integer(ThruKekv))+','+IntToStr(self.Key_session)+
     ','+IntToStr(Integer(with_dates))+','+IntToStr(with_reg)+') A order by a.id_type_rec asc, A.RASX_DATE asc';

     FactDataSetV.SelectSQL.Text:=Res;
end;

procedure TfrmGetFactRsx.ToolButton3Click(Sender: TObject);
var  T:TfrmGetConfInfo;
begin
     T:=TfrmGetConfInfo.Create(self,WorkDatabase.Handle,date_beg,date_end, false);
     t.cbWithDates.Checked:=with_dates;
     t.ShowKv.Checked:=ThruKekv;
     t.ThruFR.ItemIndex:=with_reg;

     if T.ShowModal=mrYes
     then begin
               date_beg:=t.datebeg;
               date_end:=t.DateEnd;
               with_dates:=t.cbWithDates.Checked;
               ThruKekv:=t.ShowKv.Checked;
               with_reg  :=t.ThruFR.ItemIndex;

               Screen.Cursor:=crHourGlass;
               with TfrmACardProgress.Create(self) do
               begin
               Update;
               Show;


               getReportData;
               Free;
               end;
               Screen.Cursor:=crDefault;

               PlanView.ViewData.Expand(true);
               VView.ViewData.Expand(true);

     end;
     T.Free;
end;

procedure TfrmGetFactRsx.ToolButton2Click(Sender: TObject);
var T:TfrmACDocsInfo;
    id_razdel, id_kekv :Integer;
begin
     if PageControl1.ActivePageIndex=0
     then begin
               if (FactDataSet.RecordCount>0)
               then begin
                         if (FactDataSet.FieldByName('id_type_rec').Value<3)
                         then begin
                                   if ThruKekv
                                   then begin
                                             id_razdel:=-1;
                                             id_kekv  :=PlanView.Controller.FocusedColumn.Tag;
                                   end
                                   else begin
                                             id_razdel:=PlanView.Controller.FocusedColumn.Tag;
                                             id_kekv  :=-1
                                   end;


                                   if FactDataSet.FieldByName('id_type_rec').Value=1
                                   then begin
                                             T:=TfrmACDocsInfo.Create(Self,
                                                                      WorkDatabase.Handle,
                                                                      fid_param_set,
                                                                      id_razdel,
                                                                      id_kekv,
                                                                      date_beg,
                                                                      date_end,
                                                                      FactDataSet.fieldbyname('RASX_DATE').Value,
                                                                      1,
                                                                      FactDataSet.fieldbyname('ID_REG_UCH').Value,
                                                                      'ACARD_GET_RASX_FACT_DOC_INFO',
                                                                      self.with_dates,
                                                                      self.with_reg);
                                   end
                                   else begin
                                             if with_dates
                                             then begin
                                                       T:=TfrmACDocsInfo.Create(Self,
                                                                                WorkDatabase.Handle,
                                                                                fid_param_set,
                                                                                id_razdel,
                                                                                id_kekv,
                                                                                date_beg,
                                                                                date_end,
                                                                                FactDataSet.fieldbyname('RASX_DATE').Value,
                                                                                1,
                                                                                FactDataSet.fieldbyname('ID_REG_UCH').Value,
                                                                                'ACARD_GET_RASX_FACT_DOC_INFO',
                                                                                self.with_dates,
                                                                                self.with_reg);
                                             end
                                             else begin
                                                       T:=TfrmACDocsInfo.Create(Self,
                                                                                WorkDatabase.Handle,
                                                                                fid_param_set,
                                                                                id_razdel,
                                                                                id_kekv,
                                                                                date_beg,
                                                                                date_end,
                                                                                Date,
                                                                                1,
                                                                                FactDataSet.fieldbyname('ID_REG_UCH').Value,
                                                                                'ACARD_GET_RASX_FACT_DOC_INFO',
                                                                                self.with_dates,
                                                                                self.with_reg);

                                             end;
                                   end;
                                   T.ShowModal;
                                   T.Free;
                         end
                         else ShowMessage('Не можливо розшифрувати, ці показники розраховуються!');
               end;
     end
     else begin
              if (FactDataSetV.RecordCount>0)
              then begin
                         if (FactDataSetV.FieldByName('id_type_rec').Value<3)
                         then begin
                                   if ThruKekv
                                   then begin
                                             id_razdel:=-1;
                                             id_kekv  :=VView.Controller.FocusedColumn.Tag;
                                   end
                                   else begin
                                             id_razdel:=VView.Controller.FocusedColumn.Tag;
                                             id_kekv  :=-1
                                   end;


                                   if FactDataSet.FieldByName('id_type_rec').Value=1
                                   then begin
                                             T:=TfrmACDocsInfo.Create(Self,
                                                                      WorkDatabase.Handle,
                                                                      fid_param_set,
                                                                      id_razdel,
                                                                      id_kekv,
                                                                      date_beg,
                                                                      date_end,
                                                                      FactDataSetV.fieldbyname('RASX_DATE').Value,
                                                                      1,
                                                                      FactDataSetV.fieldbyname('ID_REG_UCH').Value,
                                                                      'ACARD_GET_RASX_FACT_DOC_INFO_V',
                                                                      self.with_dates,
                                                                      self.with_reg);
                                   end
                                   else begin
                                             if with_dates
                                             then begin
                                                       T:=TfrmACDocsInfo.Create(Self,
                                                                                WorkDatabase.Handle,
                                                                                fid_param_set,
                                                                                id_razdel,
                                                                                id_kekv,
                                                                                date_beg,
                                                                                date_end,
                                                                                FactDataSetV.fieldbyname('RASX_DATE').Value,
                                                                                1,
                                                                                FactDataSetV.fieldbyname('ID_REG_UCH').Value,
                                                                                'ACARD_GET_RASX_FACT_DOC_INFO_V',
                                                                                self.with_dates,
                                                                                self.with_reg);
                                             end
                                             else begin
                                                       T:=TfrmACDocsInfo.Create(Self,
                                                                                WorkDatabase.Handle,
                                                                                fid_param_set,
                                                                                id_razdel,
                                                                                id_kekv,
                                                                                date_beg,
                                                                                date_end,
                                                                                date,
                                                                                1,
                                                                                FactDataSetV.fieldbyname('ID_REG_UCH').Value,
                                                                                'ACARD_GET_RASX_FACT_DOC_INFO_V',
                                                                                self.with_dates,
                                                                                self.with_reg);
                                             end;
                                   end;
                                   T.ShowModal;
                                   T.Free;
                         end
                         else ShowMessage('Не можливо розшифрувати, ці показники розраховуються!');
              end;
     end;
end;

procedure TfrmGetFactRsx.ToolButton6Click(Sender: TObject);
var T:TAcardPrintReportForm;
begin
     T:=TAcardPrintReportForm.Create(self,2);
     T.ShowModal;
     T.Free;
end;


procedure TfrmGetFactRsx.clearTmpTable;
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

procedure TfrmGetFactRsx.fillTmpTable;
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
     fillSP.ParamByName('form_type').Value:=3;
     fillSP.ExecProc;
     fillSP.close;
     fillSP.Free;
end;

procedure TfrmGetFactRsx.OnGetContentStyleRed(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin

end;



end.
