unit UCardGetUrO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, ComCtrls, ToolWin, ImgList, cxStyles, FIBDatabase,
  pFIBDatabase, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, pFibDataSet, ExtCtrls,
  FIBDataSet, StdCtrls , pFibStoredProc, AppStruClasses, Placemnt;

type
  TfrmGetUrOMain = class(TForm)
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
    SmetaSource: TDataSource;
    ReadTransaction: TpFIBTransaction;
    WorkDatabase: TpFIBDatabase;
    PlanDataSet: TpFIBDataSet;
    WriteTransaction: TpFIBTransaction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    cxGrid3: TcxGrid;
    PlanView: TcxGridDBBandedTableView;
    cxGridLevel2: TcxGridLevel;
    cxGrid1: TcxGrid;
    FactView: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedColumn3: TcxGridDBBandedColumn;
    cxGridLevel1: TcxGridLevel;
    PlanViewDBBandedColumn1: TcxGridDBBandedColumn;
    PlanViewDBBandedColumn2: TcxGridDBBandedColumn;
    PlanViewDBBandedColumn3: TcxGridDBBandedColumn;
    PlanViewDBBandedColumn4: TcxGridDBBandedColumn;
    FactDataSet: TpFIBDataSet;
    PlanDataSource: TDataSource;
    FactDataSource: TDataSource;
    FormStorage1: TFormStorage;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    SchDataSet: TpFIBDataSet;
    FactViewDBBandedColumn1: TcxGridDBBandedColumn;
    ToolButton6: TToolButton;
    FactViewDBBandedColumn2: TcxGridDBBandedColumn;
    FactViewDBBandedColumn3: TcxGridDBBandedColumn;
    FactViewDBBandedColumn4: TcxGridDBBandedColumn;
    FactViewDBBandedColumn5: TcxGridDBBandedColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
  private
    { Private declarations }
    id_pkv    :Int64;
    id_tfin   :Int64;

    ThruKekv:Boolean;
    key_session:Int64;
    fid_param_set:Integer;

    procedure ConfigureGrid;
    function getPlanQuerySql:String;
    function getFactQuerySql:String;
    procedure getReportData;
    procedure fillTmpTable;
    procedure clearTmpTable;
  public
    { Public declarations }
    date_beg: TDateTime;
    date_end: TDateTime;
    organization:string;
    KOD_EDRPOU:string;
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64;id_param_set:Integer);reintroduce;

  end;



implementation

uses UCardGetAssignConfigure, UACConfigureForm, DateUtils, UProgress,
     ACardsDocsInfo, ACardPrintReport;


{$R *.dfm}

procedure TfrmGetUrOMain.ConfigureGrid;
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

     i:=0;j:=FactView.ColumnCount;
     while i<=j-1 do
     begin
           if (FactView.Columns[i].Position.BandIndex=2)
           then begin
                     FactView.Columns[i].Free;
                     j:=j-1;
                     i:=i-1;
           end
           else i:=i+1;
     end;

     GetKekvInfo               :=TpFibDataSet.Create(self);
     GetKekvInfo.Database      :=WorkDatabase;
     GetKekvInfo.Transaction   :=WriteTransaction;
     GetKekvInfo.SelectSQL.Text:=' SELECT * '+
                                 '   FROM ACARDS_GET_KEKV5( '+ IntToStr(id_pkv)+','+IntToStr(id_tfin)+
                                 ' , '+''''+DateToStr(StartOfTheYear(date_beg))+''''+','+''''+DateToStr(date_end)+''''+','+IntToStr(Integer(Self.ThruKekv))+','+
                                 IntToStr(fid_param_set)+','+IntToStr(self.key_session)+')'+' ORDER BY KEKV_KODE ASC';

     GetKekvInfo.Open;
     GetKekvInfo.FetchAll;
     GetKekvInfo.First;

     if (GetKekvInfo.RecordCount>0)
     then begin
               SetLength(ArrColumns,GetKekvInfo.RecordCount);
               FactView.Bands[2].Width:=100*GetKekvInfo.RecordCount;

               for i:=0 to GetKekvInfo.RecordCount-1 do
               begin

                    ArrColumns[i-1]:= FactView.CreateColumn;
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

     if GetKekvInfo.Active then GetKekvInfo.Close;
     GetKekvInfo.SelectSQL.Text:=' SELECT * '+
                                 '   FROM ACARDS_GET_KEKV4( '+ IntToStr(id_pkv)+','+IntToStr(id_tfin)+
                                 ' , '+''''+DateToStr(StartOfTheYear(date_beg))+''''+','+''''+DateToStr(date_end)+''''+','+IntToStr(Integer(Self.ThruKekv))+','+
                                 IntToStr(fid_param_set)+','+IntToStr(self.key_session)+')'+' ORDER BY KEKV_KODE ASC';

     GetKekvInfo.Open;
     GetKekvInfo.FetchAll;

     if (GetKekvInfo.RecordCount>0)
     then begin
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

constructor TfrmGetUrOMain.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; Id_user: Int64;id_param_set:Integer);
var ACardsParamsDataSet:TpFIBDataSet;
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
               label1.Caption:='ÊÏÊ: '+ACardsParamsDataSet.fieldbyname('PKV_TEXT').AsString;
               label2.Caption:='âèä êîøò³â: '+ACardsParamsDataSet.fieldbyname('TF_TEXT').AsString;
               id_pkv        :=ACardsParamsDataSet.fieldbyname('id_pkv').value;
               id_tfin       :=ACardsParamsDataSet.fieldbyname('id_tf').value;
               fid_param_set  :=ACardsParamsDataSet.fieldbyname('id_param_set').value;
               organization  :=ACardsParamsDataSet.fieldbyname('organization').value;
               KOD_EDRPOU    :=ACardsParamsDataSet.fieldbyname('KOD_EDRPOU').value;
     end;

     Self.Update;

     T:=TfrmGetConfInfo.Create(self,WorkDatabase.Handle, StartOfTheYear(date), EndOfTheMonth(date),true);
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
               FactView.ViewData.Expand(true);
     end
     else begin
               PostMessage(self.Handle,WM_CLOSE,0,0);
     end;
     T.Free;
     
end;

procedure TfrmGetUrOMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;



function TfrmGetUrOMain.getFactQuerySql: String;
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
                                 '   FROM ACARDS_GET_KEKV5( '+ IntToStr(id_pkv)+','+IntToStr(id_tfin)+
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
                    Res:=Res+ ' (SELECT KASSA_SUMMA FROM ACARD_GET_URO_VAL_ITEM('+IntToStr(id_pkv)+','+IntToStr(id_tfin)+','+IntToStr(fid_param_set)+
                    ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+' , A.ID_DOG ,'+GetKekvInfo.FieldByName('ID_KEKV').AsString+','+IntToStr(Integer(ThruKekv))+', A.ID_TYPE_REC,'+IntToStr(self.key_session)+')) AS KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString+' , ';
                    GetKekvInfo.Next;
               end;

               Res:=Res+ ' (SELECT KASSA_SUMMA FROM ACARD_GET_URO_VAL_ITEM('+IntToStr(id_pkv)+','+IntToStr(id_tfin)+','+IntToStr(fid_param_set)+
               ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+' , A.ID_DOG ,'+GetKekvInfo.FieldByName('ID_KEKV').AsString+','+IntToStr(Integer(ThruKekv))+', A.ID_TYPE_REC,'+IntToStr(self.key_session)+')) AS KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString;
     end
     else begin
               Res:='SELECT A.*  ';
     end;

     Res:=Res+'  FROM ACARD_GET_URO_VALUES_EX ('+IntToStr(id_pkv)+','+IntTostr(id_tfin)+','+IntToStr(fid_param_set)+
     ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+','+IntToStr(Integer(ThruKekv))+','+Inttostr(self.key_session)+') A ORDER BY A.ID_TYPE_REC ASC';

     FactDataSet.SelectSQL.Text:=Res;
end;

function TfrmGetUrOMain.getPlanQuerySql: String;
var  Res:String;
     GetKekvInfo:TpFibDataSet;
     i:Integer;
begin
     if PlanDataSet.Active then PlanDataSet.Close;
     PlanDataSet.SelectSQL.Text:='';


     GetKekvInfo               :=TpFibDataSet.Create(self);
     GetKekvInfo.Database      :=WorkDatabase;
     GetKekvInfo.Transaction   :=WriteTransaction;
     GetKekvInfo.SelectSQL.Text:=' SELECT * '+
                                 '   FROM ACARDS_GET_KEKV4( '+ IntToStr(id_pkv)+','+IntToStr(id_tfin)+
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
                    Res:=Res+ ' (SELECT KASSA_SUMMA FROM ACARD_GET_ASSIGN_PLAN_VAL_ITEM('+IntToStr(id_pkv)+','+IntToStr(id_tfin)+','+IntToStr(fid_param_set)+
                    ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+' , A.KASSA_DATE ,'+GetKekvInfo.FieldByName('ID_KEKV').AsString+','+IntToStr(Integer(ThruKekv))+', A.ID_TYPE_REC,'+IntToStr(self.key_session)+')) AS KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString+' , ';
                    GetKekvInfo.Next;
               end;

               Res:=Res+ ' (SELECT KASSA_SUMMA FROM ACARD_GET_ASSIGN_PLAN_VAL_ITEM('+IntToStr(id_pkv)+','+IntToStr(id_tfin)+','+IntToStr(fid_param_set)+
               ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+' , A.KASSA_DATE ,'+GetKekvInfo.FieldByName('ID_KEKV').AsString+','+IntToStr(Integer(ThruKekv))+', A.ID_TYPE_REC,'+IntToStr(self.key_session)+')) AS KEKV_'+GetKekvInfo.FieldByName('ID_KEKV').AsString;
     end
     else begin
               Res:='SELECT A.*  ';
     end;

     Res:=Res+'  FROM ACARD_GET_ASSIGN_PLAN_VALUES_EX ('+IntToStr(id_pkv)+','+IntTostr(id_tfin)+','+IntToStr(fid_param_set)+
     ' , '+''''+DateToStr(date_beg)+''''+','+''''+DateToStr(date_end)+''''+','+IntToStr(Integer(ThruKekv))+','+Inttostr(self.key_session)+') A ORDER BY A.ID_TYPE_REC ASC, A.KASSA_DATE ASC';

     PlanDataSet.SelectSQL.Text:=Res;
end;

procedure TfrmGetUrOMain.fillTmpTable;
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
     fillSP.ParamByName('form_type').Value:=6;
     fillSP.ExecProc;
     fillSP.close;
     fillSP.Free;
end;


procedure TfrmGetUrOMain.getReportData;
begin
     Screen.Cursor:=crHourGlass;

     if WriteTransaction.InTransaction then WriteTransaction.Rollback;
     WriteTransaction.StartTransaction;

     fillTmpTable;
     ConfigureGrid;

     if PlanDataSet.Active then PlanDataSet.Close;
     getPlanQuerySql;
     PlanDataSet.Open;

     if FactDataSet.Active then FactDataSet.Close;
     getFactQuerySql;
     FactDataSet.Open;

     clearTmpTable;

     Screen.Cursor:=crDefault;
end;


procedure TfrmGetUrOMain.clearTmpTable;
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

procedure TfrmGetUrOMain.ToolButton3Click(Sender: TObject);
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
               FactView.ViewData.Expand(true);
     end;
     T.Free;
end;

procedure TfrmGetUrOMain.ToolButton5Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmGetUrOMain.ToolButton6Click(Sender: TObject);

      var T:TAcardPrintReportForm;
begin
     T:=TAcardPrintReportForm.Create(self,6);
     T.ShowModal;
     T.Free;
end;

end.
