unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, cxGridBandedTableView, cxGridTableView,
  cxGridCustomTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridLevel, cxGrid, FIBDatabase, pFIBDatabase,
  pFibDataSet,PFibStoredProc, FIBDataSet, cxDBEdit, cxContainer, cxCheckBox,
  cxSplitter, ComCtrls, ToolWin, ImgList;

type
  TfrmGetSaldo = class(TForm)
    Panel1: TPanel;
    WriteTransaction: TpFIBTransaction;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    SmGrid: TcxGrid;
    SmLevel: TcxGridLevel;
    SmView: TcxGridDBBandedTableView;
    SmColumn: TcxGridDBBandedColumn;
    IN_DB_SALDO: TcxGridDBBandedColumn;
    IN_KR_SALDO: TcxGridDBBandedColumn;
    DB_OBOR: TcxGridDBBandedColumn;
    KR_OBOR: TcxGridDBBandedColumn;
    OUT_DB_SALDO: TcxGridDBBandedColumn;
    OUT_KR_SALDO: TcxGridDBBandedColumn;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
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
    cxStyle15: TcxStyle;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    ResultsDataSet: TpFIBDataSet;
    SmDataSource: TDataSource;
    SmGrColumn: TcxGridDBBandedColumn;
    RzColumn: TcxGridDBBandedColumn;
    StColumn: TcxGridDBBandedColumn;
    KvColumn: TcxGridDBBandedColumn;
    SmallImages: TImageList;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ToolButton1: TToolButton;
    cxCheckBox1: TcxCheckBox;
    ToolButton5: TToolButton;
    ToolButton2: TToolButton;
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton5Click(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
    ID_SCH:Int64;
    ACTUAL_DATE:TDateTime;
    KEY_SESSION:Int64;
    ShowSmGr:Boolean;
    ShowSm:Boolean;
    ShowRz:Boolean;
    ShowSt:Boolean;
    ShowKv:Boolean;
    TypeSmGrInfo:Integer;
    TypeSmInfo:Integer;
    TypeRzInfo:Integer;
    TypeStInfo:Integer;
    TypeKvInfo:Integer;
    procedure GetData;
  public
    { Public declarations }
    Constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Int64;ActualDate:TDateTime);reintroduce;
    procedure ConfigureGrid;
  end;

  procedure GetJO5SchSaldo(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Int64;ActualDate:TDateTime);stdcall;
  exports GetJO5SchSaldo;

implementation

uses jo5saldoConfigure;

{$R *.dfm}
procedure GetJO5SchSaldo(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Int64;ActualDate:TDateTime);
begin
     TfrmGetSaldo.Create(AOwner,DBHandle,id_user,ActualDate);
end;

constructor TfrmGetSaldo.Create(AOwner: TComponent;DBHandle: TISC_DB_HANDLE; id_user: Int64;ActualDate:TDateTime);
var InfoDS:TpFibDataSet;
    T:TfrmJO5GetConfInfo;
begin
     inherited Create(AOwner);

     self.ID_SCH:=id_user;
     self.ACTUAL_DATE:=ActualDate;
     TForm(Owner).Update;

     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;


     T:=TfrmJO5GetConfInfo.Create(self);
     if T.ShowModal=mrYes
     then begin
               {Поднимаем информацию по счету}
               InfoDS:=TpFibDataSet.Create(self);
               InfoDS.Database:=WorkDatabase;
               InfoDS.Transaction:=ReadTransaction;
               InfoDS.SelectSQL.Text:='SELECT * '+
                                      '  FROM PUB_SP_MAIN_SCH '+
                                      ' WHERE ID_SCH='+IntToStr(ID_SCH)+
                                      '   AND DATE_BEG<='+''''+DateToStr(ACTUAL_DATE)+''''+
                                      '   AND DATE_END>='+''''+DateToStr(ACTUAL_DATE)+'''';
               InfoDS.Open;
               if (InfoDS.RecordCount>0)
               then begin
                         Caption:='Розшифровка сальдо по рахунку '+InfoDS.FieldByName('SCH_NUMBER').AsString+
                         ' "'+InfoDS.FieldByName('SCH_TITLE').AsString+'"';
               end;
               InfoDS.Close;
               InfoDS.Free;


               {Получение данных по расшифровке сальдо}
               GetData;

               ShowSmGr   :=T.ShowSmGr.Checked;
               ShowSm     :=T.ShowSm.Checked;
               ShowRz     :=T.ShowRz.Checked;
               ShowSt     :=T.ShowSt.Checked;
               ShowKv     :=T.ShowKv.Checked;

               TypeSmGrInfo :=T.edTypeSmGrInfo.ItemIndex;
               TypeSmInfo   :=T.edTypeSmInfo.ItemIndex;
               TypeRzInfo   :=T.edTypeRzInfo.ItemIndex;
               TypeStInfo   :=T.edTypeStInfo.ItemIndex;
               TypeKvInfo   :=T.edTypeKvInfo.ItemIndex;


               ConfigureGrid;
     end
     else PostMessage(Handle,WM_CLOSE,0,0);
     T.Free;
end;

procedure TfrmGetSaldo.ConfigureGrid;
var SQLText:String;
    SeleSch,SeleSmGr,SeleSm,SeleRz,SeleSt,SeleKV, SelePKV:String;
    OredrSch:String;
begin
     Screen.Cursor:=crSQLWait;

     OredrSch:='   DUMMY_FIELD ';
     SeleSch :=' , DUMMY_FIELD ';


     if ShowSmGr
     then begin
               SmGrColumn.Visible:=true;
               SmView.Bands[0].Visible:=true;
               if TypeSmGrInfo=0 then begin
                                           SeleSmGr :=' , GROUP_KOD';
                                           SmGrColumn.DataBinding.FieldName:='GROUP_KOD';
                                 end;
               if TypeSmGrInfo=1 then begin
                                           SeleSmGr :=' , GROUP_TITLE';
                                           SmGrColumn.DataBinding.FieldName:='GROUP_TITLE';
                                 end;
     end
     else begin
               SmGrColumn.Visible:=false;
               SeleSmGr :='';
     end;


     if ShowSm
     then begin
               SmColumn.Visible:=true;
               SmView.Bands[0].Visible:=true;
               if TypeSmInfo=0 then begin
                                         SeleSm:=' , SMETA_KOD';
                                         SmColumn.DataBinding.FieldName  :='SMETA_KOD';
                               end;
               if TypeSmInfo=1 then begin
                                         SeleSm:=' , SMETA_TITLE';
                                         SmColumn.DataBinding.FieldName  :='SMETA_TITLE';
                               end;
     end
     else begin
               SmColumn.Visible:=false;
               SeleSm:='';
     end;

     if ShowRz
     then begin
               RzColumn.Visible:=true;
               SmView.Bands[0].Visible:=true;
               if TypeRzInfo=0 then begin
                                         SeleRz:=' , RAZD_KOD';
                                         RzColumn.DataBinding.FieldName  :='RAZD_KOD';
                               end;
               if TypeRzInfo=1 then begin
                                         SeleRz:=' , RAZD_TITLE';
                                         RzColumn.DataBinding.FieldName  :='RAZD_TITLE';
                               end;
     end
     else begin
               RzColumn.Visible:=false;
               SeleRz:='';
     end;

     if ShowSt
     then begin
               StColumn.Visible:=true;
               SmView.Bands[0].Visible:=true;
               if TypeStInfo=0 then begin
                                         SeleSt:=' , ST_KOD';
                                         StColumn.DataBinding.FieldName  :='ST_KOD';
                               end;
               if TypeStInfo=1 then begin
                                         SeleSt:=' , ST_TITLE';
                                         StColumn.DataBinding.FieldName  :='ST_TITLE';
                               end;
     end
     else begin
               StColumn.Visible:=false;
               SeleSt:='';
     end;

     if ShowKv
     then begin
               KvColumn.Visible:=true;
               SmView.Bands[0].Visible:=true;
               if TypeKvInfo=0 then begin
                                         SeleKv:=' , KEKV_KOD';
                                         KvColumn.DataBinding.FieldName  :='KEKV_KOD';
                               end;
               if TypeKvInfo=1 then begin
                                         SeleKv:=' , KEKV_TITLE';
                                         KvColumn.DataBinding.FieldName  :='KEKV_TITLE';
                               end;
     end
     else begin
               KvColumn.Visible:=false;
               SeleKV:='';
     end;

     if ResultsDataSet.Active then ResultsDataSet.Close;

     SQLText:='SELECT SUM(IN_DB_SALDO)  AS IN_DB_SALDO,  '+
              '       SUM(IN_KR_SALDO)  AS IN_KR_SALDO,  '+
              '       SUM(DB_OBOR)      AS DB_OBOR,      '+
              '       SUM(KR_OBOR)      AS KR_OBOR,      '+
              '       SUM(OUT_DB_SALDO) AS OUT_DB_SALDO, '+
              '       SUM(OUT_KR_SALDO) AS OUT_KR_SALDO  '+
              SeleSch + SeleSmGr + SeleSm + SeleRz + SeleSt + SeleKV +
              '  FROM JO5_SHOW_SALDO('+IntToStr(KEY_SESSION)+','+''''+DateToStr(ACTUAL_DATE)+''''+')'+
              ' GROUP BY '+OredrSch+ SeleSmGr + SeleSm + SeleRz + SeleSt + SeleKV;

     ResultsDataSet.SelectSQL.Text:=SQLText;
     ResultsDataSet.Open;

     SmView.ViewData.Expand(true);

     Screen.Cursor:=crDefault;
end;


procedure TfrmGetSaldo.cxButton1Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmGetSaldo.GetData;
var GetDataSP:TPFibStoredProc;
begin
     GetDataSP:=TPFibStoredProc.Create(self);
     GetDataSP.Database:=WorkDatabase;
     GetDataSP.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     GetDataSP.StoredProcName:='JO5_GET_OUT_SALDO_BY_SMRZST_EX';
     GetDataSP.Prepare;
     GetDataSP.ParamByName('ID_SCH').asInt64:=self.ID_SCH;
     GetDataSP.ParamByName('DATE_REG').Value:=self.ACTUAL_DATE;
     GetDataSP.ExecProc;
     KEY_SESSION:=GetDataSP.ParamByName('LOCAL_KEY_SESSION').AsInt64;
     GetDataSP.Close;
     WriteTransaction.Commit;
     GetDataSP.Free;
end;

procedure TfrmGetSaldo.FormClose(Sender: TObject;
  var Action: TCloseAction);
var GetDataSP:TPFibStoredProc;
begin
     //Подчищаем таблицы с информацие по расшифровке счетов
     GetDataSP:=TPFibStoredProc.Create(self);
     GetDataSP.Database:=WorkDatabase;
     GetDataSP.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     GetDataSP.StoredProcName:='JO5_CLEAR_TMP';
     GetDataSP.Prepare;
     GetDataSP.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
     GetDataSP.ExecProc;
     GetDataSP.Close;
     WriteTransaction.Commit;
     GetDataSP.Free;


     Action:=caFree;
end;

procedure TfrmGetSaldo.ToolButton5Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmGetSaldo.cxCheckBox1PropertiesChange(Sender: TObject);
begin
     SmView.OptionsView.GroupByBox:=cxCheckBox1.Checked;
end;

procedure TfrmGetSaldo.ToolButton3Click(Sender: TObject);
var T:TfrmJO5GetConfInfo;
begin
     T:=TfrmJO5GetConfInfo.Create(self);
     T.edTypeSmGrInfo.ItemIndex:=TypeSmGrInfo;
     T.edTypeSmInfo.ItemIndex  :=TypeSmInfo;
     T.edTypeRzInfo.ItemIndex  :=TypeRzInfo;
     T.edTypeStInfo.ItemIndex  :=TypeStInfo;
     T.edTypeKvInfo.ItemIndex  :=TypeKvInfo;

     T.ShowSmGr.Checked:=ShowSmGr;
     T.ShowSm.Checked:=ShowSm;
     T.ShowRz.Checked:=ShowRz;
     T.ShowSt.Checked:=ShowSt;
     T.ShowKv.Checked:=ShowKv;
     if T.ShowModal=mrYes
     then begin
               ShowSmGr   :=T.ShowSmGr.Checked;
               ShowSm     :=T.ShowSm.Checked;
               ShowRz     :=T.ShowRz.Checked;
               ShowSt     :=T.ShowSt.Checked;
               ShowKv     :=T.ShowKv.Checked;

               TypeSmGrInfo :=T.edTypeSmGrInfo.ItemIndex;
               TypeSmInfo   :=T.edTypeSmInfo.ItemIndex;
               TypeRzInfo   :=T.edTypeRzInfo.ItemIndex;
               TypeStInfo   :=T.edTypeStInfo.ItemIndex;
               TypeKvInfo   :=T.edTypeKvInfo.ItemIndex;

               ConfigureGrid;
     end;
     T.Free;
end;

procedure TfrmGetSaldo.ToolButton2Click(Sender: TObject);
var I:Integer;
begin
     for i:=0 to SmView.ColumnCount-1 do SmView.Columns[i].Options.Filtering:=ToolButton2.Down;
end;

end.
