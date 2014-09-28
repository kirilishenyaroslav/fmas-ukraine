unit UCardKassaRasx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, ComCtrls, ToolWin, ImgList, cxStyles, FIBDatabase,
  pFIBDatabase, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, pFibDataSet, ExtCtrls,
  FIBDataSet, StdCtrls , pFibStoredProc, AppStruClasses;

type
  TfrmGetKassaRasx = class(TForm)
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
    Panel1: TPanel;
    FactDataSet: TpFIBDataSet;
    FactDataSource: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    cxGrid1: TcxGrid;
    VView: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedColumn2: TcxGridDBBandedColumn;
    cxGridLevel1: TcxGridLevel;
    FactDataSetV: TpFIBDataSet;
    FactDataSourceV: TDataSource;
    ToolButton2: TToolButton;
    ToolButton6: TToolButton;
    SchDataSet: TpFIBDataSet;
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
  private
    { Private declarations }
    id_pkv    :Int64;
    id_tfin   :Int64;
    ThruKekv  :Boolean;
    fid_param_set:Integer;
    key_session:Int64;


    procedure ConfigureGrid;
    procedure getFactValuesSql;
    procedure getFactValuesSqlV;
    procedure getReportData;
    procedure fillTmpTable;
    procedure clearTmpTable;

  public
    { Public declarations }
    date_beg  :TDateTime;
    date_end  :TDateTime;
    organization:string;
    KOD_EDRPOU:string;
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64; id_param_set:integer);reintroduce;
    procedure OnGetContentStyleRed(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure OnGetContentStyleRedH(Sender: TcxGridTableView; AColumn: TcxGridColumn; out AStyle: TcxStyle);
  end;

implementation

uses UCardGetKassaRasxConfigure, UACConfigureForm, dateUtils, ACardsDocsInfo,
     UProgress,  ACardPrintReport;

{$R *.dfm}


procedure TfrmGetKassaRasx.getFactValuesSql;
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
                                 '   FROM ACARDS_GET_KEKV2( '+ IntToStr(id_pkv)+','+IntToStr(id_tfin)+
                                 ' , '+''''+DateToStr(StartOfTheYear(date_beg))+''''+','+''''+DateToStr(date_end)+''''+','+IntToStr(Integer(Self.ThruKekv))+','+
                                 IntToStr(fid_param_set)+','+IntTostr(self.key_session)+')'+' ORDER BY KEKV_KODE ASC';
     GetKekvInfo.Open;
     GetKekvInfo.FetchAll;
     GetKekvInfo.First;

     if (GetKekvInfo.RecordCount>0)
     then begin
               Res:='SELECT A.* , ';

               for i:=0 to GetKekvInfo.RecordCount-2 do
               begin
                    Res:=Res+ ' (SELECT KASSA_SUMMA FROM ACARD_GET_KASSA_FACT_VAL_ITEM('+IntToStr(id_pkv)+','+IntToStr(id_tfin)+','+IntToStr(fid_param_set)+
                    ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+' , A.KASSA_DATE ,'+GetKekvInfo.FieldByName('ID_KEKV').AsString+','+IntToStr(Integer(ThruKekv))+', A.ID_TYPE_REC,'+IntToStr(self.key_session)+')) AS KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString+' , ';
                    GetKekvInfo.Next;
               end;

               Res:=Res+ ' (SELECT KASSA_SUMMA FROM ACARD_GET_KASSA_FACT_VAL_ITEM('+IntToStr(id_pkv)+','+IntToStr(id_tfin)+','+IntToStr(fid_param_set)+
               ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+' , A.KASSA_DATE ,'+GetKekvInfo.FieldByName('ID_KEKV').AsString+','+IntToStr(Integer(ThruKekv))+', A.ID_TYPE_REC,'+IntToStr(self.key_session)+')) AS KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString;
     end
     else begin
               Res:='SELECT A.*  ';
     end;

     Res:=Res+'  FROM ACARD_GET_KASSA_FACT_VALUES_EX ('+IntToStr(id_pkv)+','+IntTostr(id_tfin)+','+IntToStr(fid_param_set)+
     ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+','+IntToStr(Integer(ThruKekv))+','+Inttostr(self.key_session)+') A ORDER BY A.ID_TYPE_REC ASC, A.KASSA_DATE ASC';

     FactDataSet.SelectSQL.Text:=Res;
end;


constructor TfrmGetKassaRasx.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; Id_user: Int64; id_param_set:Integer);
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
     SchDataSet.SelectSQL.Text:='select * from ACARDS_PRE_FORMS_SCH_SEL('+IntTostr(id_param_set)+')';
     SchDataSet.Open;
     SchDataSet.FetchAll;

     if (ACardsParamsDataSet.RecordCount>0)
     then begin
               label1.Caption:='КПКВК: '+ACardsParamsDataSet.fieldbyname('PKV_TEXT').AsString;
               label2.Caption:='вид коштів: '+ACardsParamsDataSet.fieldbyname('TF_TEXT').AsString;
               id_pkv        :=ACardsParamsDataSet.fieldbyname('id_pkv').value;
               id_tfin       :=ACardsParamsDataSet.fieldbyname('id_tf').value;
               fid_param_set  :=ACardsParamsDataSet.fieldbyname('id_param_set').value;
               organization  :=ACardsParamsDataSet.fieldbyname('organization').value;
               KOD_EDRPOU    :=ACardsParamsDataSet.fieldbyname('KOD_EDRPOU').value;
     end;

     Self.Update;

     T:=TfrmGetConfInfo.Create(self,WorkDatabase.Handle, StartOfTheMonth(IncMonth(date,-1)), EndOfTheMonth(date),true);
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

procedure TfrmGetKassaRasx.ConfigureGrid;
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
                                 '   FROM ACARDS_GET_KEKV2( '+ IntToStr(id_pkv)+','+IntToStr(id_tfin)+
                                 ' , '+''''+DateToStr(StartOfTheYear(date_beg))+''''+','+''''+DateToStr(date_end)+''''+','+IntToStr(Integer(Self.ThruKekv))+','+
                                 IntToStr(fid_param_set)+','+IntToStr(self.key_session)+')'+' ORDER BY KEKV_KODE ASC';

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


procedure TfrmGetKassaRasx.getReportData;
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

procedure TfrmGetKassaRasx.ToolButton5Click(Sender: TObject);
begin
         Close;
end;

procedure TfrmGetKassaRasx.ToolButton3Click(Sender: TObject);
var  T:TfrmGetConfInfo;
     F:TfrmACardProgress;
begin
     T:=TfrmGetConfInfo.Create(self,WorkDatabase.Handle,date_beg,date_end,true);
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


               getReportData;
               F.Free;
               Screen.Cursor:=crDefault;

               PlanView.ViewData.Expand(true);
     end;
     T.Free;
end;

procedure TfrmGetKassaRasx.getFactValuesSqlV;
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
                                 '   FROM ACARDS_GET_KEKV2( '+ IntToStr(id_pkv)+','+IntToStr(id_tfin)+
                                 ' , '+''''+DateToStr(StartOfTheYear(date_beg))+''''+','+''''+DateToStr(date_end)+''''+','+IntToStr(Integer(Self.ThruKekv))+','+
                                 IntToStr(fid_param_set)+','+IntTostr(self.key_session)+')'+' ORDER BY KEKV_KODE ASC';
     GetKekvInfo.Open;
     GetKekvInfo.FetchAll;
     GetKekvInfo.First;

     if (GetKekvInfo.RecordCount>0)
     then begin
               Res:='SELECT A.* , ';

               for i:=0 to GetKekvInfo.RecordCount-2 do
               begin
                    Res:=Res+ ' (SELECT KASSA_SUMMA FROM ACARD_GET_KASSA_FACT_VAL_ITEM_V('+IntToStr(id_pkv)+','+IntToStr(id_tfin)+','+IntToStr(fid_param_set)+
                    ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+' , A.KASSA_DATE ,'+GetKekvInfo.FieldByName('ID_KEKV').AsString+','+IntToStr(Integer(ThruKekv))+',A.ID_TYPE_REC,'+IntToStr(self.key_session)+')) AS KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString+' , ';
                    GetKekvInfo.Next;
               end;

               Res:=Res+ ' (SELECT KASSA_SUMMA FROM ACARD_GET_KASSA_FACT_VAL_ITEM_V('+IntToStr(id_pkv)+','+IntToStr(id_tfin)+','+IntToStr(fid_param_set)+
               ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+' , A.KASSA_DATE ,'+GetKekvInfo.FieldByName('ID_KEKV').AsString+','+IntToStr(Integer(ThruKekv))+',A.ID_TYPE_REC,'+IntToStr(self.key_session)+')) AS KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString;
     end
     else begin
               Res:='SELECT A.*  ';
     end;

     Res:=Res+'  FROM ACARD_GET_KASSA_FACT_VALUES_V_E ('+IntToStr(id_pkv)+','+IntTostr(id_tfin)+','+IntToStr(fid_param_set)+
     ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+','+IntToStr(Integer(ThruKekv))+','+IntToStr(self.key_session)+') A ORDER BY A.ID_TYPE_REC ASC, A.KASSA_DATE ASC';

     FactDataSetV.SelectSQL.Text:=Res;
end;

procedure TfrmGetKassaRasx.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmGetKassaRasx.ToolButton2Click(Sender: TObject);
var T:TfrmACDocsInfo;
    id_razdel, id_kekv :Integer;
begin
     if PageControl1.ActivePageIndex=0
     then begin
               //Кассовые рассходы
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

                                   T:=TfrmACDocsInfo.Create(Self,
                                                            WorkDatabase.Handle,
                                                            fid_param_set,
                                                            id_razdel,
                                                            id_kekv,
                                                            date_beg,
                                                            date_end,
                                                            FactDataSet.fieldbyname('KASSA_DATE').Value,
                                                            1,
                                                            'ACARD_GET_KASSA_DOC_INFO');
                                   T.ShowModal;
                                   T.Free;
                         end
                         else ShowMessage('Не можливо розшифрувати, ці показники розраховуються!');
               end;
     end
     else begin
              //Возмещение кассовых расходов
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



                                   T:=TfrmACDocsInfo.Create(Self,
                                                            WorkDatabase.Handle,
                                                            fid_param_set,
                                                            id_razdel,
                                                            id_kekv,
                                                            date_beg,
                                                            date_end,
                                                            FactDataSetV.fieldbyname('KASSA_DATE').Value,
                                                            1,
                                                            'ACARD_GET_KASSA_DOC_INFO_V');
                                   T.ShowModal;
                                   T.Free;
                        end
                        else ShowMessage('Не можливо розшифрувати, ці показники розраховуються!');
              end;
     end;
end;

procedure TfrmGetKassaRasx.ToolButton6Click(Sender: TObject);
var T:TAcardPrintReportForm;
begin
     T:=TAcardPrintReportForm.Create(self,1);
     T.ShowModal;
     T.Free;
end;

procedure TfrmGetKassaRasx.clearTmpTable;
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

procedure TfrmGetKassaRasx.fillTmpTable;
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

procedure TfrmGetKassaRasx.OnGetContentStyleRed(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
end;

procedure TfrmGetKassaRasx.OnGetContentStyleRedH(Sender: TcxGridTableView;
  AColumn: TcxGridColumn; out AStyle: TcxStyle);
begin
end;

end.
