unit UKardKVMainForm;

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
  TfrmKardKVMainForm = class(TForm)
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
    PlanViewDBBandedColumn2: TcxGridDBBandedColumn;
    cxGridLevel2: TcxGridLevel;
    PlanViewDBBandedColumn3: TcxGridDBBandedColumn;
    PlanViewDBBandedColumn6: TcxGridDBBandedColumn;
    PlanViewDBBandedColumn23: TcxGridDBBandedColumn;
    KartDataSet: TpFIBDataSet;
    KartDataSource: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    PlanViewDBBandedColumn1: TcxGridDBBandedColumn;
    PlanViewDBBandedColumn4: TcxGridDBBandedColumn;
    PlanViewDBBandedColumn5: TcxGridDBBandedColumn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    PlanViewDBBandedColumn7: TcxGridDBBandedColumn;
    PlanViewDBBandedColumn8: TcxGridDBBandedColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
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
    fOnly_ch_period:Boolean;
    DateBeg:TDateTime;
    DateEnd:TDateTime;
    organization:string;
    KOD_EDRPOU:string;
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64; id_param_set:Integer);reintroduce;

  end;



implementation

uses UACConfigureForm, DateUtils, UProgress, ACardPrintReport, ACardsDocsInfo;

{$R *.dfm}                                          
procedure TfrmKardKVMainForm.getFactValuesSql;
var  Res:String;
     GetKekvInfo:TpFibDataSet;
     i:Integer;
begin
     if KartDataSet.Active then KartDataSet.Close;
     KartDataSet.SelectSQL.Text:='';


     GetKekvInfo               :=TpFibDataSet.Create(self);
     GetKekvInfo.Database      :=WorkDatabase;
     GetKekvInfo.Transaction   :=WriteTransaction;
     GetKekvInfo.SelectSQL.Text:=' SELECT * '+
                                 '   FROM ACARDS_GET_COLUMNS_KKV_EX( '+
                                 ''''+DateToStr(StartOfTheYear(datebeg))+''''+','+''''+DateToStr(dateend)+''''+','+IntToStr(self.key_session)+')';

     GetKekvInfo.Open;
     GetKekvInfo.FetchAll;

     if (GetKekvInfo.RecordCount>0)
     then begin
               Res:='SELECT A.* , ';

               for i:=0 to GetKekvInfo.RecordCount-2 do
               begin
                    Res:=Res+ ' (SELECT card_value FROM ACARDS_GET_VALUE(A.row_id, A.row_type,'+GetKekvInfo.FieldByName('COL_GROUP').AsString+','+
                               ''''+DateToStr(datebeg)+''''+','+''''+DateToStr(dateend)+''''+' , '+IntToStr(fid_param_set)+','+IntToStr(self.key_session)+','+
                               IntToStr(ThruKekv)+')) AS SCH_'+GetKekvInfo.FieldByName('COL_GROUP').AsString+' , ';
                    GetKekvInfo.Next;
               end;

               Res:=Res+ ' (SELECT card_value FROM ACARDS_GET_VALUE(A.row_id, A.row_type,'+GetKekvInfo.FieldByName('COL_GROUP').AsString+','+
                         ''''+DateToStr(datebeg)+''''+','+''''+DateToStr(dateend)+''''+' , '+IntToStr(fid_param_set)+','+IntToStr(self.key_session)+','+
                         IntToStr(ThruKekv)+')) AS SCH_'+GetKekvInfo.FieldByName('COL_GROUP').AsString;
     end
     else begin
               Res:='SELECT A.*  ';
     end;

     Res:=Res+'  FROM ACARDS_GET_ROWS_FOR_KKV ('+''''+DateToStr(datebeg)+''''+','+''''+DateToStr(dateend)+''''+','+
     IntToStr(self.fid_param_set)+','+IntToStr(self.key_session)+','+IntToStr(ThruKekv)+') A ';

     if fOnly_ch_period
     then begin
               Res:=Res+' WHERE A.ROW_TYPE=1';
     end;


     KartDataSet.SelectSQL.Text:=Res;
end;

procedure TfrmKardKVMainForm.ConfigureGrid;
var GetKekvInfo:TpFibDataSet;
    i,j:Integer;
    ArrColumns: array of TcxGridDBBandedColumn;
begin
     FreeAndNil(ArrColumns);
     Screen.Cursor:=crHourGlass;
     i:=0;j:=PlanView.ColumnCount;
     while i<=j-1 do
     begin
           if (PlanView.Columns[i].Position.BandIndex=1)
           then begin
                     PlanView.Columns[i].Free;
                     j:=j-1;
                     i:=i-1;
           end
           else i:=i+1;
     end;

     GetKekvInfo               :=TpFibDataSet.Create(self);
     GetKekvInfo.Database      :=WorkDatabase;
     GetKekvInfo.Transaction   :=WriteTransaction;
     GetKekvInfo.SelectSQL.Text:=' SELECT * '+
                                 '   FROM ACARDS_GET_COLUMNS_KKV_EX( '+
                                 ''''+DateToStr(StartOfTheYear(datebeg))+''''+','+''''+DateToStr(dateend)+''''+','+IntToStr(self.key_session)+')';

     GetKekvInfo.Open;
     GetKekvInfo.FetchAll;
     GetKekvInfo.First;

     if (GetKekvInfo.RecordCount>0)
     then begin
               SetLength(ArrColumns,GetKekvInfo.RecordCount);
               PlanView.Bands[1].Width:=100*GetKekvInfo.RecordCount;

               for i:=0 to GetKekvInfo.RecordCount-1 do
               begin

                    ArrColumns[i-1]:= PlanView.CreateColumn;
                    ArrColumns[i-1].HeaderAlignmentHorz:=taCenter;
                    ArrColumns[i-1].PropertiesClass:=TcxTextEditProperties;
                    TcxTextEditProperties(ArrColumns[i-1].Properties).Alignment.Vert:=taVCenter;
                    TcxTextEditProperties(ArrColumns[i-1].Properties).Alignment.Horz:=taRightJustify;

                    ArrColumns[i-1].Position.BandIndex:=1;
                    ArrColumns[i-1].Width:=100;
                    ArrColumns[i-1].Options.Filtering:=false;
                    ArrColumns[i-1].DataBinding.FieldName:='SCH_'+GetKekvInfo.FieldByName('COL_GROUP').AsString;
                    ArrColumns[i-1].Tag:=GetKekvInfo.FieldByName('COL_GROUP').Value;
                    ArrColumns[i-1].Caption:=GetKekvInfo.FieldByName('COL_GROUP').AsString;
                    ArrColumns[i-1].Options.Filtering:=false;
                    ArrColumns[i-1].SortOrder:=TcxDataSortOrder(soNone);

                    GetKekvInfo.Next;
               end;
     end;
     GetKekvInfo.Close;
     GetKekvInfo.Free;

     Screen.Cursor:=crDefault;
end;


constructor TfrmKardKVMainForm.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; Id_user: Int64; id_param_set:Integer);
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

               if (ACardsParamsDataSet.fieldbyname('type_kazn_kod').value=1)
               then begin
                         PlanViewDBBandedColumn3.Caption:=PlanViewDBBandedColumn3.Caption+' (загальний фонд)';
                         PlanViewDBBandedColumn6.Caption:=PlanViewDBBandedColumn6.Caption+' (загальний фонд)';
                         PlanViewDBBandedColumn7.Caption:=PlanViewDBBandedColumn7.Caption+' (загальний фонд)';
               end
               else begin
                         PlanViewDBBandedColumn3.Caption:=PlanViewDBBandedColumn3.Caption+' (спеціальний фонд)';
                         PlanViewDBBandedColumn6.Caption:=PlanViewDBBandedColumn6.Caption+' (спеціальний фонд)';
                         PlanViewDBBandedColumn7.Caption:=PlanViewDBBandedColumn7.Caption+' (спеціальний фонд)';
               end;
    end;


    T:=TfrmGetConfInfo.Create(self,WorkDatabase.Handle, StartOfTheMonth(IncMonth(date,-1)), EndOfTheMonth(date),true);
    T.Only_ch_period.Visible:=true;
    if T.ShowModal=mrYes
    then begin
               fOnly_ch_period:=T.Only_ch_period.Checked;
               datebeg:=t.DateBeg;
               dateend:=t.DateEnd;
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

procedure TfrmKardKVMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmKardKVMainForm.GetData;
var i,k:Integer;
    not_null_value_flag:Boolean;
    vcc:Integer;
begin
     Screen.Cursor:=crHourGlass;

     if WriteTransaction.InTransaction then WriteTransaction.Rollback;
     WriteTransaction.StartTransaction;

     fillTmpTable;
     ConfigureGrid;


     if KartDataSet.Active then KartDataSet.Close;
     self.getFactValuesSql;
     KartDataSet.Open;


     vcc:=0;
     for i:=0 to PlanView.ColumnCount-1 do
     begin
          if (PlanView.Columns[i].Position.BandIndex=1)
          then begin
                    not_null_value_flag:=false;
                    for k:=0 to PlanView.DataController.RecordCount - 1 do
                    begin
                         if PlanView.DataController.Values[k, PlanView.Columns[i].Index]<>null
                         then not_null_value_flag:=true;
                    end;
                    if not not_null_value_flag
                    then PlanView.Columns[i].Visible:=false
                    else vcc:=vcc+1;

          end;
     end;
     PlanView.Bands[1].Width:=100*vcc;



     clearTmpTable;

     Screen.Cursor:=crDefault;
end;

procedure TfrmKardKVMainForm.ToolButton3Click(Sender: TObject);
var
      T:TfrmGetConfInfo;
begin
      T:=TfrmGetConfInfo.Create(self,WorkDatabase.Handle, self.DateBeg, self.DateEnd,true);
      T.Only_ch_period.Visible:=true;
      if T.ShowModal=mrYes
      then begin
                 fOnly_ch_period:=T.Only_ch_period.Checked;
                 datebeg:=t.DateBeg;
                 dateend:=t.DateEnd;
                 ThruKekv:=integer(t.ShowKv.Checked);

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

procedure TfrmKardKVMainForm.clearTmpTable;
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

procedure TfrmKardKVMainForm.fillTmpTable;
var fillSP:TpFibStoredProc;
begin
     fillSP:=TpFibStoredProc.Create(self);
     fillSP.Database:=WorkDatabase;
     fillSP.Transaction:=WriteTransaction;
     fillSP.StoredProcName:='ACARDS_FILL_TMPTABLE';
     fillSP.Prepare;
     fillSP.ParamByName('ID_SESSION').AsInt64:=key_session;
     fillSP.ParamByName('date_beg').Value:=StartOfTheYear(self.datebeg);
     fillSP.ParamByName('date_end').Value:=self.dateend;
     fillSP.ParamByName('ID_SET_PARAM').Value:=self.fid_param_set;
     fillSP.ParamByName('form_type').Value:=4;
     fillSP.ExecProc;
     fillSP.close;
     fillSP.Free;
end;



procedure TfrmKardKVMainForm.ToolButton5Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmKardKVMainForm.ToolButton6Click(Sender: TObject);
     var T:TAcardPrintReportForm;
begin
     T:=TAcardPrintReportForm.Create(self,3);
     T.ShowModal;
     T.Free;
end;

procedure TfrmKardKVMainForm.ToolButton2Click(Sender: TObject);
var T:TfrmACDocsInfo;
begin
       if (KartDataSet.RecordCount>0)
       then begin
                 if (KartDataSet.FieldByName('ROW_TYPE').Value<3) and
                    (PlanView.Controller.FocusedColumn.Tag<>201)  and
                    (PlanView.Controller.FocusedColumn.Tag<>202)
                 then begin
                           T:=TfrmACDocsInfo.Create(Self,
                                                    WorkDatabase.Handle,
                                                    fid_param_set,
                                                    Self.DateBeg,
                                                    Self.DateEnd,
                                                    KartDataSet.FieldByName('row_id').Value,
                                                    PlanView.Controller.FocusedColumn.Tag,
                                                    KartDataSet.FieldByName('row_type').Value,
                                                    self.ThruKekv,
                                                    'ACARD_GET_KKV_DOC_INFO',
                                                    1,
                                                    self.key_session);
                           T.ShowModal;
                           T.Free;
                 end
                 else ShowMessage('Не можливо розшифрувати, ці показники розраховуються!');
       end;
end;

procedure TfrmKardKVMainForm.CheckBox1Click(Sender: TObject);
begin
     PlanViewDBBandedColumn5.Visible:=CheckBox1.Checked;
end;

procedure TfrmKardKVMainForm.CheckBox2Click(Sender: TObject);
begin
     PlanViewDBBandedColumn4.Visible:=CheckBox2.Checked;
end;

end.
