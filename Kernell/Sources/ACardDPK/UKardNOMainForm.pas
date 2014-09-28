unit UKardNOMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, ibase, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxTextEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ComCtrls, ToolWin, ImgList, FIBDataSet,
  pFIBDataSet, StdCtrls, ExtCtrls, pFibStoredProc;

type
  TfrmKardNOMainForm = class(TForm)
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    SmallImages: TImageList;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton2: TToolButton;
    ToolButton6: TToolButton;
    ToolButton1: TToolButton;
    ToolButton5: TToolButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    columnst: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxGrid3: TcxGrid;
    PlanView: TcxGridDBBandedTableView;
    cxGridLevel2: TcxGridLevel;
    PlanViewDBBandedColumn3: TcxGridDBBandedColumn;
    PlanViewDBBandedColumn6: TcxGridDBBandedColumn;
    KartDataSet: TpFIBDataSet;
    KartDataSource: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PlanViewDBBandedColumn1: TcxGridDBBandedColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
    id_pkv    :Int64;
    id_tfin   :Int64;
    ThruKekv  :Integer;
    fid_param_set:Integer;
    key_session:Int64;
    procedure GetData;
    procedure ConfigureGrid;
    procedure getFactValuesSql;
    procedure fillTmpTable;
    procedure clearTmpTable;
  public
    { Public declarations }
    DateBeg:TDateTime;
    organization:string;
    KOD_EDRPOU:string;
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64; id_param_set:Integer);reintroduce;
  end;

implementation

uses UACConfigureForm, DateUtils, UProgress, ACardPrintReport, ACardsDocsInfo;

{$R *.dfm}                                          
procedure TfrmKardNOMainForm.getFactValuesSql;
var  Res:String;
     GetKekvInfo:TpFibDataSet;
     i:Integer;
     digit:string;
begin
     if KartDataSet.Active then KartDataSet.Close;
     KartDataSet.SelectSQL.Text:='';


     GetKekvInfo               :=TpFibDataSet.Create(self);
     GetKekvInfo.Database      :=WorkDatabase;
     GetKekvInfo.Transaction   :=WriteTransaction;
     GetKekvInfo.SelectSQL.Text:=' SELECT * '+
                                 '   FROM ACARD_NO_GET_COLUMNS( '+
                                 ''''+DateToStr(StartOfTheMonth(datebeg))+''''+','+IntToStr(self.fid_param_set)+')';

     GetKekvInfo.Open;
     GetKekvInfo.FetchAll;

     if (GetKekvInfo.RecordCount>0)
     then begin
              Res:='SELECT A.*, ';

              for i:=0 to GetKekvInfo.RecordCount-2 do
              begin
                    digit:=IntToStr(i+1);
                    if Length(digit)=1 then digit:='0'+digit;

                    Res:=Res+ ' (SELECT NO_VALUE FROM ACARDS_NO_GET_VALUE('+IntToStr(self.key_session)+','+
                                                                            ''''+GetKekvInfo.FieldByName('kassa_date').AsString+''''+','+
                                                                            '0,'+IntToStr(Integer(self.ThruKekv))+',A.ROW_ID'+','+
                                                                            IntToStr(self.fid_param_set)+','+''''+DateToStr(DateBeg)+''''+')) AS KASSA_DAY_'+digit+'_PRIH,';
                    Res:=Res+ ' (SELECT NO_VALUE FROM ACARDS_NO_GET_VALUE('+IntToStr(self.key_session)+','+
                                                                            ''''+GetKekvInfo.FieldByName('kassa_date').AsString+''''+','+
                                                                            '1,'+IntToStr(Integer(self.ThruKekv))+',A.ROW_ID'+','+
                                                                            IntToStr(self.fid_param_set)+','+''''+DateToStr(DateBeg)+''''+')) AS KASSA_DAY_'+digit+'_RASH,';
                    Res:=Res+ ' (SELECT NO_VALUE FROM ACARDS_NO_GET_VALUE('+IntToStr(self.key_session)+','+
                                                                            ''''+GetKekvInfo.FieldByName('kassa_date').AsString+''''+','+
                                                                            '2,'+IntToStr(Integer(self.ThruKekv))+',A.ROW_ID'+','+
                                                                            IntToStr(self.fid_param_set)+','+''''+DateToStr(DateBeg)+''''+')) AS KASSA_DAY_'+digit+'_OUT_REST,';
                    GetKekvInfo.Next;
              end;

              digit:=IntToStr(i+1);
              if Length(digit)=1 then digit:='0'+digit;

              Res:=Res+ ' (SELECT NO_VALUE FROM ACARDS_NO_GET_VALUE('+IntToStr(self.key_session)+','+
                                                                      ''''+GetKekvInfo.FieldByName('kassa_date').AsString+''''+','+
                                                                      '0,'+IntToStr(Integer(self.ThruKekv))+',A.ROW_ID'+','+
                                                                      IntToStr(self.fid_param_set)+','+''''+DateToStr(DateBeg)+''''+')) AS KASSA_DAY_'+digit+'_PRIH,';
              Res:=Res+ ' (SELECT NO_VALUE FROM ACARDS_NO_GET_VALUE('+IntToStr(self.key_session)+','+
                                                                      ''''+GetKekvInfo.FieldByName('kassa_date').AsString+''''+','+
                                                                      '1,'+IntToStr(Integer(self.ThruKekv))+',A.ROW_ID'+','+
                                                                      IntToStr(self.fid_param_set)+','+''''+DateToStr(DateBeg)+''''+')) AS KASSA_DAY_'+digit+'_RASH,';
              Res:=Res+ ' (SELECT NO_VALUE FROM ACARDS_NO_GET_VALUE('+IntToStr(self.key_session)+','+
                                                                      ''''+GetKekvInfo.FieldByName('kassa_date').AsString+''''+','+
                                                                      '2,'+IntToStr(Integer(self.ThruKekv))+',A.ROW_ID'+','+
                                                                      IntToStr(self.fid_param_set)+','+''''+DateToStr(DateBeg)+''''+')) AS KASSA_DAY_'+digit+'_OUT_REST';
     end
     else begin
               Res:='SELECT A.* ';
     end;

     Res:=Res+' FROM ACARDS_NO_GET_ROWS ('+IntToStr(self.id_pkv)+','+IntToStr(self.id_tfin)+','+
     ''''+DateToStr(datebeg)+''''+','+IntToStr(Integer(self.ThruKekv))+','+IntToStr(self.key_session)+') A ORDER BY A.ROW_NUM ASC, A.ROW_CODE ASC';

     KartDataSet.SelectSQL.Text:=Res;
end;

procedure TfrmKardNOMainForm.ConfigureGrid;
var GetKekvInfo:TpFibDataSet;
    i,j,k:Integer;
    ArrBands: array of TcxGridBand;
    ArrColumns: array of TcxGridDBBandedColumn;
    digit:string;
begin
     Screen.Cursor:=crHourGlass;
     i:=0;j:=PlanView.Bands.Count;
     while i<=j-1 do
     begin
           if (PlanView.Bands[i].Index>0)
           then begin
                     for k:=PlanView.Bands[i].ColumnCount-1 downto 0 do
                     begin
                          PlanView.Bands[i].Columns[k].Free;
                     end;
                     PlanView.Bands[i].Free;
                     j:=j-1;
                     i:=i-1;
           end
           else i:=i+1;
     end;

     GetKekvInfo               :=TpFibDataSet.Create(self);
     GetKekvInfo.Database      :=WorkDatabase;
     GetKekvInfo.Transaction   :=WriteTransaction;
     GetKekvInfo.SelectSQL.Text:=' SELECT * '+
                                 '   FROM ACARD_NO_GET_COLUMNS( '+
                                 ''''+DateToStr(StartOfTheMonth(datebeg))+''''+','+IntToStr(self.fid_param_set)+')';
     GetKekvInfo.Open;
     GetKekvInfo.FetchAll;
     GetKekvInfo.First;

     if (GetKekvInfo.RecordCount>0)
     then begin
               SetLength(ArrBands,GetKekvInfo.RecordCount);

               for i:=0 to GetKekvInfo.RecordCount-1 do
               begin

                    ArrBands[i-1]:= PlanView.Bands.add;
                    ArrBands[i-1].Caption:='За звітом касира за '+GetKekvInfo.FieldByName('kassa_date').AsString;
                    ArrBands[i-1].Width:=300;
                    digit:=IntToStr(i+1);
                    if Length(digit)=1 then digit:='0'+digit;

                    SetLength(ArrColumns,3);
                    ArrColumns[0]:= PlanView.CreateColumn;
                    ArrColumns[0].HeaderAlignmentHorz:=taCenter;
                    ArrColumns[0].Caption:='Надходження';
                    ArrColumns[0].PropertiesClass:=TcxTextEditProperties;
                    TcxTextEditProperties(ArrColumns[0].Properties).Alignment.Vert:=taVCenter;
                    TcxTextEditProperties(ArrColumns[0].Properties).Alignment.Horz:=taRightJustify;
                    ArrColumns[0].Position.BandIndex:=ArrBands[i-1].Index;
                    ArrColumns[0].Width:=100;
                    ArrColumns[0].Options.Filtering:=false;
                    ArrColumns[0].Options.Sorting:=false;
                    ArrColumns[0].DataBinding.FieldName:='KASSA_DAY_'+digit+'_PRIH';
                    ArrColumns[0].Tag:=10*i+1;
                    ArrColumns[0].Options.Filtering:=false;
                    ArrColumns[0].SortOrder:=TcxDataSortOrder(soNone);

                    ArrColumns[1]:= PlanView.CreateColumn;
                    ArrColumns[1].HeaderAlignmentHorz:=taCenter;
                    ArrColumns[1].PropertiesClass:=TcxTextEditProperties;
                    ArrColumns[1].Caption:='Видаток';
                    TcxTextEditProperties(ArrColumns[1].Properties).Alignment.Vert:=taVCenter;
                    TcxTextEditProperties(ArrColumns[1].Properties).Alignment.Horz:=taRightJustify;
                    ArrColumns[1].Position.BandIndex:=ArrBands[i-1].Index;
                    ArrColumns[1].Width:=100;
                    ArrColumns[1].Options.Filtering:=false;
                    ArrColumns[1].DataBinding.FieldName:='KASSA_DAY_'+digit+'_RASH';
                    ArrColumns[1].Tag:=10*i+2;
                    ArrColumns[1].Options.Filtering:=false;
                    ArrColumns[1].Options.Sorting:=false;
                    ArrColumns[1].SortOrder:=TcxDataSortOrder(soNone);

                    ArrColumns[2]:= PlanView.CreateColumn;
                    ArrColumns[2].HeaderAlignmentHorz:=taCenter;
                    ArrColumns[2].Caption:='Залишок на кінець дня';
                    ArrColumns[2].PropertiesClass:=TcxTextEditProperties;
                    TcxTextEditProperties(ArrColumns[2].Properties).Alignment.Vert:=taVCenter;
                    TcxTextEditProperties(ArrColumns[2].Properties).Alignment.Horz:=taRightJustify;
                    ArrColumns[2].Position.BandIndex:=ArrBands[i-1].Index;
                    ArrColumns[2].Width:=100;
                    ArrColumns[2].Options.Filtering:=false;
                    ArrColumns[2].DataBinding.FieldName:='KASSA_DAY_'+digit+'_OUT_REST';
                    ArrColumns[2].Tag:=10*i+3;
                    ArrColumns[2].Options.Filtering:=false;
                    ArrColumns[2].Options.Sorting:=false;
                    ArrColumns[2].SortOrder:=TcxDataSortOrder(soNone);

                    GetKekvInfo.Next;
               end;
     end;
     GetKekvInfo.Close;
     GetKekvInfo.Free;

     Screen.Cursor:=crDefault;
end;


constructor TfrmKardNOMainForm.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; Id_user: Int64; id_param_set:Integer);
var
    ACardsParamsDataSet:TpFIBDataSet;
    T:TfrmGetConfInfo;
begin
    inherited Create(AOwner);
    WorkDatabase.Handle:=DBHandle;
    ReadTransaction.StartTransaction;
    self.fid_param_set:=id_param_set;
    key_session:=WorkDatabase.Gen_Id('ACARD_GEN_ID_SESSION',1);

    ACardsParamsDataSet:=TpFIBDataSet.Create(self);
    ACardsParamsDataSet.Database:=WorkDatabase;
    ACardsParamsDataSet.Transaction:=ReadTransaction;
    ACardsParamsDataSet.SelectSQL.Text:='select * from ACARDS_PRE_FORM_PARAMS_SEL(2) where id_param_set='+IntTostr(id_param_set);
    ACardsParamsDataSet.Open;

    if (ACardsParamsDataSet.RecordCount>0)
    then begin
               label1.Caption :='КПКВК: '+ACardsParamsDataSet.fieldbyname('PKV_TEXT').AsString;
               label2.Caption :='вид коштів: '+ACardsParamsDataSet.fieldbyname('TF_TEXT').AsString;
               id_pkv         :=ACardsParamsDataSet.fieldbyname('id_pkv').value;
               id_tfin        :=ACardsParamsDataSet.fieldbyname('id_tf').value;
               fid_param_set  :=ACardsParamsDataSet.fieldbyname('id_param_set').value;
               organization   :=ACardsParamsDataSet.fieldbyname('organization').value;
               KOD_EDRPOU     :=ACardsParamsDataSet.fieldbyname('KOD_EDRPOU').value;
    end;


    T:=TfrmGetConfInfo.Create(self,WorkDatabase.Handle, StartOfTheMonth(IncMonth(date,-1)), date,true, false);

    T.Label3.Visible      :=false;
    T.cbMonthEnd.Visible  :=false;
    T.cbYearEnd.Visible   :=false;
    T.cbWithDates.Visible :=false;
    T.ThruFR.Visible      :=false;
    T.Label2.Caption      :='';

    if T.ShowModal=mrYes
    then begin
               datebeg:=t.DateBeg;
               Label3.Caption:='За період '+DateToStr(StartOfTheMonth(datebeg))+'-'+DateToStr(EndOfTheMonth(datebeg));
               ThruKekv:=Integer(t.ShowKv.Checked);

               Screen.Cursor:=crHourGlass;
               with TfrmACardProgress.Create(self) do
               begin
                     Update;
                     Show;

                     GetData;
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

procedure TfrmKardNOMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmKardNOMainForm.GetData;
var i:Integer;
begin
     Screen.Cursor:=crHourGlass;

     if WriteTransaction.InTransaction then WriteTransaction.Rollback;
     WriteTransaction.StartTransaction;

     fillTmpTable;
     ConfigureGrid;


     if KartDataSet.Active then KartDataSet.Close;
     self.getFactValuesSql;
     KartDataSet.Open;

     clearTmpTable;

     Screen.Cursor:=crDefault;
end;

procedure TfrmKardNOMainForm.ToolButton3Click(Sender: TObject);
var
      T:TfrmGetConfInfo;
begin
      T:=TfrmGetConfInfo.Create(self,WorkDatabase.Handle, self.DateBeg, date,true, false);

      T.Label3.Visible      :=false;
      T.cbMonthEnd.Visible  :=false;
      T.cbYearEnd.Visible   :=false;
      T.cbWithDates.Visible :=false;
      T.ThruFR.Visible      :=false;
      T.Label2.Caption      :='';
      
      if T.ShowModal=mrYes
      then begin
                 datebeg:=t.DateBeg;
                 ThruKekv:=integer(t.ShowKv.Checked);
                 Label3.Caption:='За період '+DateToStr(StartOfTheMonth(datebeg))+'-'+DateToStr(EndOfTheMonth(datebeg));

                 Screen.Cursor:=crHourGlass;
                 with TfrmACardProgress.Create(self) do
                 begin
                       Update;
                       Show;

                       GetData;
                       Free;
                 end;
                 Screen.Cursor:=crDefault;
                 PlanView.ViewData.Expand(true);
      end;
      T.Free;
end;

procedure TfrmKardNOMainForm.clearTmpTable;
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

procedure TfrmKardNOMainForm.fillTmpTable;
var fillSP:TpFibStoredProc;
begin
     fillSP:=TpFibStoredProc.Create(self);
     fillSP.Database:=WorkDatabase;
     fillSP.Transaction:=WriteTransaction;
     fillSP.StoredProcName:='ACARDS_FILL_TMPTABLE';
     fillSP.Prepare;
     fillSP.ParamByName('ID_SESSION').AsInt64:=key_session;
     fillSP.ParamByName('date_beg').Value:=self.datebeg;
     fillSP.ParamByName('date_end').Value:=self.datebeg;
     fillSP.ParamByName('ID_SET_PARAM').Value:=self.fid_param_set;
     fillSP.ParamByName('form_type').Value:=5;
     fillSP.ExecProc;
     fillSP.close;
     fillSP.Free;
end;



procedure TfrmKardNOMainForm.ToolButton5Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmKardNOMainForm.ToolButton6Click(Sender: TObject);
     var T:TAcardPrintReportForm;
begin
     T:=TAcardPrintReportForm.Create(self,4);
     T.ShowModal;
     T.Free;
end;

procedure TfrmKardNOMainForm.ToolButton2Click(Sender: TObject);
var T:TfrmACDocsInfo;
    id_razdel, id_kekv :Integer;
begin
       if (KartDataSet.RecordCount>0)
       then begin
                 if (PlanView.Controller.FocusedColumn.Tag>0)
                 and ((PlanView.Controller.FocusedColumn.Tag mod 10) in [1,2])
                 and (KartDataSet.FieldByName('ROW_ID').Value<>0)
                 then begin
                           T:=TfrmACDocsInfo.Create(Self,
                                                    WorkDatabase.Handle,
                                                    fid_param_set,
                                                    Self.DateBeg,
                                                    KartDataSet.FieldByName('row_id').Value,
                                                    PlanView.Controller.FocusedColumn.Tag,
                                                    self.ThruKekv,
                                                    'ACARD_GET_NO_DOC_INFO',
                                                    1,
                                                    self.key_session);
                           T.ShowModal;
                           T.Free;
                 end
                 else ShowMessage('Не можливо розшифрувати, ці показники розраховуються!');
       end;
end;

end.
