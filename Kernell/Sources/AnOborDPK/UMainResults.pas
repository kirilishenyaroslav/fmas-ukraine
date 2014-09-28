unit UMainResults;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, ComCtrls, ToolWin, ImgList, cxStyles,
  Ibase, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  DB, cxDBData, cxTextEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid,pFibDataSet, ExtCtrls, cxGridBandedTableView,
  cxGridDBBandedTableView, cxContainer, cxCheckBox, FIBDataSet,
  cxExportGrid4Link, cxExport, {ActnList,} Placemnt, cxCalc, frxClass,
  frxDBSet,Printers, GlobalSpr, AppStruClasses, Menus, PrintReport,
  dxStatusBar, ActnList;

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
    TB_Update: TToolButton;
    TB_Close: TToolButton;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    WorkDatabase: TpFIBDatabase;
    cxGrid3: TcxGrid;
    cxGridLevel2: TcxGridLevel;
    Panel1: TPanel;
    OborView: TcxGridDBBandedTableView;
    SchColumn:      TcxGridDBBandedColumn;
    SmGrColumn:     TcxGridDBBandedColumn;
    SmColumn:       TcxGridDBBandedColumn;
    RzColumn:       TcxGridDBBandedColumn;
    StColumn:       TcxGridDBBandedColumn;
    KvColumn:       TcxGridDBBandedColumn;
    KrColumn:       TcxGridDBBandedColumn;
    DbInSldColumn:  TcxGridDBBandedColumn;
    KrInSldColumn:  TcxGridDBBandedColumn;
    DbColumn:       TcxGridDBBandedColumn;
    PkvColumn:      TcxGridDBBandedColumn;
    DbOutSldColumn: TcxGridDBBandedColumn;
    KrOutSldColumn: TcxGridDBBandedColumn;
    cxCheckBox1: TcxCheckBox;
    ResultsDataSet: TpFIBDataSet;
    ResultsDataSource: TDataSource;
    TB_Print: TToolButton;
    TB_Export: TToolButton;
    Panel2: TPanel;
    SaveDialog1: TSaveDialog;
    FormStorage1: TFormStorage;
    ToolButton6: TToolButton;
    frxDBDataset1: TfrxDBDataset;
    PrintDataSet: TpFIBDataSet;
    TB_Documents: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    PopupMenu2: TPopupMenu;
    OldVersion: TMenuItem;
    NewVersion: TMenuItem;
    frxReport1: TfrxReport;
    dxStatusBar1: TdxStatusBar;
    ActionList1: TActionList;
    Esc: TAction;
    Update: TAction;
    PrintF6: TAction;
    Print_CtrlP: TAction;
    AnColumn: TcxGridDBBandedColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TB_UpdateClick(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure TB_CloseClick(Sender: TObject);
    procedure TB_ExportClick(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure TB_DocumentsClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure OldVersionClick(Sender: TObject);
    procedure TB_PrintClick(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure UpdateExecute(Sender: TObject);
    procedure PrintF6Execute(Sender: TObject);
    procedure Print_CtrlPExecute(Sender: TObject);
  private
    { Private declarations }
    LTS:Char;
    KEY_SESSION : Int64;
    ShowSch:Boolean;
    ShowSmGr:Boolean;
    ShowSm:Boolean;
    ShowRz:Boolean;
    ShowSt:Boolean;
    ShowKv:Boolean;
    ShowAn:Boolean;
    ShowPKV:Boolean;
    ShowInSaldo:Boolean;
    ShowOutSaldo:Boolean;
    TypeSchInfo:Integer;
    TypeSmGrInfo:Integer;
    TypeSmInfo:Integer;
    TypeRzInfo:Integer;
    TypeStInfo:Integer;
    TypeKvInfo:Integer;
    TypeAnInfo:Integer;
    TypePKVInfo:Integer;
    ID_SMETA   : Int64;
    ID_RAZDEL  : Int64;
    ID_STAT    : Int64;
    ID_KEKV    : Int64;
    DSCH       : Int64;
    CSCH       : Int64;
  public
    { Public declarations }
    MBookDate:TDateTime;
    DateBeg:TDateTIme;
    DateEnd:TDateTIme;
    id_sch:Int64;
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer;fs:TformStyle;id_s:Int64;act_date:TDateTime);overload;
    procedure ConfigureGrid;
    procedure deCodeDoc(D_or_K: smallint);
  end;

  procedure GetOborAnalize(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer);stdcall;
  procedure GetOborAnalizeEx(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer;id_sch:Int64;act_date:Tdatetime);stdcall;
  exports GetOborAnalize, GetOborAnalizeEx;

implementation


uses UConfigureForm, cxRadioGroup, cxGridDBDataDefinitions;
{$R *.dfm}

procedure GetOborAnalize(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer);
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
    if f then TfrmMainResults.Create(AOwner,DBHandle,Id_User,fsMDIChild,-1,date);
end;

procedure GetOborAnalizeEx(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer;id_sch:Int64;act_date:Tdatetime);
var T:TfrmMainResults;
begin
     T:=TfrmMainResults.Create(AOwner,DBHandle,Id_User,fsNormal,id_sch,act_date);
     T.ShowModal;
     T.Free;
end;


procedure TfrmMainResults.ConfigureGrid;
var SQLText:String;
    SeleSch,  SeleSmGr,  SeleSm,  SeleRz,       SeleInSld,    SeleOutSld,
    SeleSt,   SeleKV,    SeleAn,  SelePKV,      is_in_saldo,  is_out_saldo  :String;
    OredrSch:String;
    SortOrder:Array of String;
begin
     Screen.Cursor:=crSQLWait;

     OredrSch:='   DUMMY_FIELD ';
     SeleSch :=' , DUMMY_FIELD ';


     if ShowSch then begin
               SchColumn.Visible:=true;
               OborView.Bands[0].Visible:=true;
               if TypeSchInfo=0  then begin
                                           SeleSch :=' , CORR_SCH_NUM, CORR_ID_SCH';
                                           OredrSch:='   CORR_SCH_NUM, CORR_ID_SCH';
                                           SchColumn.DataBinding.FieldName:='CORR_SCH_NUM';
                                 end;
               if TypeSchInfo=1  then begin
                                           SeleSch :=' , CORR_SCH_FULL, CORR_ID_SCH';
                                           SchColumn.DataBinding.FieldName:='CORR_SCH_FULL';
                                           OredrSch:='   CORR_SCH_FULL, CORR_ID_SCH';

                                 end;
     end
     else begin
               SchColumn.Visible:=false;
               OborView.Bands[0].Visible:=false;
     end;

     if ShowInSaldo then begin
              OborView.Bands[4].Visible:=true;
              DbInSldColumn.Visible:=true;
              KrInSldColumn.Visible:=true;
              SeleInSld:=' , CORR_DB_IN_SALDO , CORR_KR_IN_SALDO';
              DbInSldColumn.DataBinding.FieldName:='CORR_DB_IN_SALDO';
              KrInSldColumn.DataBinding.FieldName:='CORR_KR_IN_SALDO';
              is_in_saldo:='1';
     end
     else begin
              OborView.Bands[4].Visible:=false;
              DbInSldColumn.Visible:=false;
              KrInSldColumn.Visible:=false;
              SeleInSld:='';
              is_in_saldo:='0';
     end;

     if ShowOutSaldo then begin
              OborView.Bands[6].Visible:=true;
              DbOutSldColumn.Visible:=true;
              KrOutSldColumn.Visible:=true;
              SeleOutSld:=' , CORR_DB_OUT_SALDO , CORR_KR_OUT_SALDO';
              DbOutSldColumn.DataBinding.FieldName:='CORR_DB_OUT_SALDO';
              KrOutSldColumn.DataBinding.FieldName:='CORR_KR_OUT_SALDO';
              is_out_saldo:='1';
     end
     else begin
              OborView.Bands[6].Visible:=false;
              DbOutSldColumn.Visible:=false;
              KrOutSldColumn.Visible:=false;
              SeleOutSld:='';
              is_out_saldo:='0';
     end;

     if ShowSmGr then begin
               SmGrColumn.Visible:=true;
               if TypeSmGrInfo=0 then begin
                                           SeleSmGr :=' , CORR_SM_GR_NUM';
                                           SmGrColumn.DataBinding.FieldName:='CORR_SM_GR_NUM';
                                 end;
               if TypeSmGrInfo=1 then begin
                                           SeleSmGr :=' , CORR_SM_GR_FULL';
                                           SmGrColumn.DataBinding.FieldName:='CORR_SM_GR_FULL';
                                 end;
     end
     else begin
               SmGrColumn.Visible:=false;
               SeleSmGr :='';
     end;

     if ShowPKV then begin
               PKVColumn.Visible:=true;
               if TypePKVInfo=0 then begin
                                           SelePKV :=' , CORR_PKV_NUM';
                                           PKVColumn.DataBinding.FieldName:='CORR_PKV_NUM';
                                 end;
               if TypePKVInfo=1 then begin
                                           SelePKV :=' , CORR_PKV_TITLE';
                                           PKVColumn.DataBinding.FieldName:='CORR_PKV_TITLE';
                                 end;
     end
     else begin
               PKVColumn.Visible:=false;
               SelePKV :='';
     end;

     if (Integer(ShowSmGr)+Integer(ShowPKV)=0)
       then OborView.Bands[2].Visible:=false
       else OborView.Bands[2].Visible:=true;


     if ShowSm then begin
               SmColumn.Visible:=true;
               if TypeSmInfo=0 then begin
                                         SeleSm:=' , CORR_SM_NUM';
                                         SmColumn.DataBinding.FieldName  :='CORR_SM_NUM';
                               end;
               if TypeSmInfo=1 then begin
                                         SeleSm:=' , CORR_SM_FULL';
                                         SmColumn.DataBinding.FieldName  :='CORR_SM_FULL';
                               end;
     end
     else begin
               SmColumn.Visible:=false;
               SeleSm:='';
     end;

     if ShowRz then begin
               RzColumn.Visible:=true;
               if TypeRzInfo=0 then begin
                                         SeleRz:=' , CORR_RZ_NUM';
                                         RzColumn.DataBinding.FieldName  :='CORR_RZ_NUM';
                               end;
               if TypeRzInfo=1 then begin
                                         SeleRz:=' , CORR_RZ_FULL';
                                         RzColumn.DataBinding.FieldName  :='CORR_RZ_FULL';
                               end;
     end
     else begin
               RzColumn.Visible:=false;
               SeleRz:='';
     end;

     if ShowSt then begin
               StColumn.Visible:=true;
               if TypeStInfo=0 then begin
                                         SeleSt:=' , CORR_ST_NUM';
                                         StColumn.DataBinding.FieldName  :='CORR_ST_NUM';
                               end;
               if TypeStInfo=1 then begin
                                         SeleSt:=' , CORR_ST_FULL';
                                         StColumn.DataBinding.FieldName  :='CORR_ST_FULL';
                               end;
     end
     else begin
               StColumn.Visible:=false;
               SeleSt:='';
     end;

     if (Integer(ShowSt)+Integer(ShowRz)+Integer(ShowSm)=0)
        then OborView.Bands[1].Visible:=false
        else OborView.Bands[1].Visible:=true;

     if ShowKv then begin
               KvColumn.Visible:=true;
               OborView.Bands[3].Visible:=true;
               if TypeKvInfo=0 then begin
                                         SeleKv:=' , CORR_KV_NUM';
                                         KvColumn.DataBinding.FieldName  :='CORR_KV_NUM';
                               end;
               if TypeKvInfo=1 then begin
                                         SeleKv:=' , CORR_KV_FULL';
                                         KvColumn.DataBinding.FieldName  :='CORR_KV_FULL';
                               end;
     end
     else begin
               KvColumn.Visible:=false;
               SeleKV:='';
     end;

     if ShowAn then begin
               AnColumn.Visible:=true;
               OborView.Bands[3].Visible:=true;
               if TypeAnInfo=0 then begin
                                         SeleAn:=' , corr_enum_num';
                                         AnColumn.DataBinding.FieldName  :='corr_enum_num';
                               end;
               if TypeAnInfo=1 then begin
                                         SeleAn:=' , corr_enum_full';
                                         AnColumn.DataBinding.FieldName  :='corr_enum_full';
                               end;
     end
     else begin
               AnColumn.Visible:=false;
               SeleAn:='';
     end;

     if (Integer(ShowKv)+Integer(ShowAn)=0)
     then OborView.Bands[3].Visible:=false
     else OborView.Bands[3].Visible:=true;


     if ResultsDataSet.Active then ResultsDataSet.Close;

     SQLText:='SELECT SUM(DB_SUMMA) AS DB_SUMMA, SUM(KR_SUMMA) AS KR_SUMMA'+SeleSch + SeleSmGr + SeleSm + SeleRz + SeleSt + SeleKV + SelePKV + SeleInSld + SeleOutSld+ SeleAn+
              ' FROM MBOOK_GET_SCH_OBOR_EXT('+IntToStr(id_sch)+','+''''+DateToStr(DateBeg)+''''+','+''''+DateToStr(DateEnd)+''''+','+IntToStr(KEY_SESSION)+','+''''+is_in_saldo+''''+','+''''+is_out_saldo+''''+')'+
              ' GROUP BY '+OredrSch+ SeleSmGr + SeleSm + SeleRz + SeleSt + SeleKV + SelePKV + SeleInSld + SeleOutSld + SeleAn;

     ResultsDataSet.SelectSQL.Text:=SQLText;
     ResultsDataSet.Open;

     Screen.Cursor:=crDefault;
end;

constructor TfrmMainResults.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; Id_User: Integer; fs:TFormStyle;id_s:Int64;act_date:TDateTime);
var T:TfrmGetConfInfo;
    TempdataSet:TpFibDataSet;
begin
     inherited Create(AOwner);
     self.FormStyle:=fs;
     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;
     self.KEY_SESSION:= WorkDataBase.Gen_Id('GEN_MBOOK_OBOR_INFO',1);

     TempdataSet:=TpFibDataSet.Create(self);
     TempdataSet.Database:=WorkDatabase;
     TempdataSet.Transaction:=ReadTransaction;
     TempdataSet.SQLs.SelectSQL.Text:='SELECT * FROM PUB_SYS_DATA';
     TempdataSet.Open;
     MBookDate:=TempdataSet.FieldByName('MAIN_BOOK_DATE').AsDateTime;
     TempdataSet.Close;
     TempdataSet.Free;

     if fs=fsNormal
     then begin
               T:=TfrmGetConfInfo.Create(self,act_date,act_date,id_s, WorkDatabase.Handle);
     end
     else begin
               T:=TfrmGetConfInfo.Create(self,MBookDate,MBookDate,-1, WorkDatabase.Handle);
     end;

     if T.ShowModal=mrYes
     then begin
               DateBeg :=T.DateBeg;
               DateEnd :=T.DateEnd;
               id_sch  :=T.id_sch;
               TB_Documents.Visible:=T.ShowSch.Checked;

               ShowSch :=T.ShowSch.Checked;
               if (T.ShowInSaldo.Enabled) and (T.ShowOutSaldo.Enabled)
               then begin
                         ShowInSaldo   :=T.ShowInSaldo.Checked;
                         ShowOutSaldo  :=T.ShowOutSaldo.Checked;
               end
               else begin
                  ShowInSaldo   :=false;
                  ShowOutSaldo  :=false;
               end;

               ShowSmGr:=T.ShowSmGr.Checked;
               ShowSm  :=T.ShowSm.Checked;
               ShowRz  :=T.ShowRz.Checked;
               ShowSt  :=T.ShowSt.Checked;
               ShowKv  :=T.ShowKv.Checked;
               ShowPKV :=T.ShowProgram.Checked;
               ShowAn  :=T.ShowAn.Checked;

               TypeSchInfo  :=T.edTypeSchInfo.ItemIndex;
               TypeSmGrInfo :=T.edTypeSmGrInfo.ItemIndex;
               TypeSmInfo   :=T.edTypeSmInfo.ItemIndex;
               TypeRzInfo   :=T.edTypeRzInfo.ItemIndex;
               TypeStInfo   :=T.edTypeStInfo.ItemIndex;
               TypeKvInfo   :=T.edTypeKvInfo.ItemIndex;
               TypePKVInfo  :=T.edProgramInfo.ItemIndex;
               TypeAnInfo   :=T.edTypeAnInfo.ItemIndex;
               ConfigureGrid;
      end
      else PostMessage(Self.Handle,WM_CLOSE,0,0);

      T.Free;

      LTS:=ThousandSeparator;
      ThousandSeparator:=#0;
end;

procedure TfrmMainResults.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     ThousandSeparator:=LTS;
     Action:=caFree;
end;

procedure TfrmMainResults.TB_UpdateClick(Sender: TObject);
var T:TfrmGetConfInfo;
    i:short;
begin
     T:=TfrmGetConfInfo.Create(self,self.DateBeg, self.DateEnd,id_sch, WorkDatabase.Handle);
     T.edTypeSchInfo.ItemIndex :=TypeSchInfo;
     T.edTypeSmGrInfo.ItemIndex:=TypeSmGrInfo;
     T.edTypeSmInfo.ItemIndex  :=TypeSmInfo;
     T.edTypeRzInfo.ItemIndex  :=TypeRzInfo;
     T.edTypeStInfo.ItemIndex  :=TypeStInfo;
     T.edTypeKvInfo.ItemIndex  :=TypeKvInfo;
     T.edProgramInfo.ItemIndex :=TypePKVInfo;
     T.edTypeAnInfo.ItemIndex  :=TypeAnInfo;

     T.id_sch:=id_sch;

     T.ShowSch.Checked:=ShowSch;
     T.ShowSmGr.Checked:=ShowSmGr;
     T.ShowSm.Checked:=ShowSm;
     T.ShowRz.Checked:=ShowRz;
     T.ShowSt.Checked:=ShowSt;
     T.ShowKv.Checked:=ShowKv;
     T.ShowProgram.Checked:=ShowPKV;
     T.ShowAn.Checked:=ShowAn;

     if T.ShowModal=mrYes
     then begin
               DateBeg :=T.DateBeg;
               DateEnd :=T.DateEnd;
               id_sch  :=T.id_sch;
               TB_Documents.Visible:=T.ShowSch.Checked;

               //ShowSch :=T.ShowSch.Checked;
               if (T.ShowInSaldo.Enabled) and (T.ShowOutSaldo.Enabled) then begin
                  ShowInSaldo   :=T.ShowInSaldo.Checked;
                  ShowOutSaldo  :=T.ShowOutSaldo.Checked;
               end
               else begin
                  ShowInSaldo   :=false;
                  ShowOutSaldo  :=false;
               end;

               if      (ShowSch and not T.ShowSch.Checked)     or (ShowSmGr and not T.ShowSmGr.Checked)
                    or (ShowSm  and not T.ShowSm.Checked)      or (ShowRz   and not T.ShowRz.Checked)
                    or (ShowSt  and not T.ShowSt.Checked)      or (ShowKv   and not T.ShowKv.Checked)
                    or (ShowPKV and not T.ShowProgram.Checked) or (ShowAn and not T.ShowAn.Checked)
               then begin
                    OborView.OptionsView.GroupByBox:=false;
                    cxCheckBox1.Checked:=false;
                    for i:=0 to OborView.ColumnCount-1 do
                         OborView.Columns[i].GroupIndex:=-1;
               end;

               ShowSch :=T.ShowSch.Checked;
               ShowSmGr:=T.ShowSmGr.Checked;
               ShowSm  :=T.ShowSm.Checked;
               ShowRz  :=T.ShowRz.Checked;
               ShowSt  :=T.ShowSt.Checked;
               ShowKv  :=T.ShowKv.Checked;
               ShowPKV :=T.ShowProgram.Checked;
               ShowAn  :=T.ShowAn.Checked;

               TypeSchInfo  :=T.edTypeSchInfo.ItemIndex;
               TypeSmGrInfo :=T.edTypeSmGrInfo.ItemIndex;
               TypeSmInfo   :=T.edTypeSmInfo.ItemIndex;
               TypeRzInfo   :=T.edTypeRzInfo.ItemIndex;
               TypeStInfo   :=T.edTypeStInfo.ItemIndex;
               TypeKvInfo   :=T.edTypeKvInfo.ItemIndex;
               TypePKVInfo  :=T.edProgramInfo.ItemIndex;
               TypeAnInfo   :=T.edTypeAnInfo.ItemIndex;

               ConfigureGrid;
     end;
     T.Free;
end;

procedure TfrmMainResults.cxCheckBox1PropertiesChange(Sender: TObject);
var i:short;
begin
    OborView.OptionsView.GroupByBox:=cxCheckBox1.Checked;
    if cxCheckBox1.Checked=false then
          for i:=0 to OborView.ColumnCount-1 do
            OborView.Columns[i].GroupIndex:=-1;
end;

procedure TfrmMainResults.TB_CloseClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmMainResults.TB_ExportClick(Sender: TObject);
begin
      if SaveDialog1.Execute
      then begin
                ExportGrid4ToExcel(SaveDialog1.FileName, cxGrid3, false, true, false);
      end;
end;

procedure TfrmMainResults.ToolButton6Click(Sender: TObject);
var I:Integer;
begin
     for i:=0 to OborView.ColumnCount-1 do
        OborView.Columns[i].Options.Filtering:=ToolButton6.Down;
end;

procedure TfrmMainResults.OldVersionClick(Sender: TObject);
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


     for i:=0 to OborView.ColumnCount-1 do
     begin
           if (OborView.Columns[i].GroupIndex>-1) then Inc(GroupCount);
           if (OborView.Columns[i].Visible) then   Inc(VisibleColCnt);
     end;
     SetLength(GroupOrder,GroupCount);

     k:=0;
     for i:=0 to OborView.ColumnCount-1 do
     begin
          if (OborView.Columns[i].GroupIndex>-1) and (OborView.Columns[i].Visible)
          then begin
                    GroupOrder[k].GroupIndex:=OborView.Columns[i].GroupIndex;
                    GroupOrder[k].FieldName :=OborView.Columns[i].DataBinding.FieldName;
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


     SetLength(OrderFields,VisibleColCnt-2);

     k:=0;
     for i:=0 to OborView.ColumnCount-1 do
     begin
          if  (OborView.Columns[i].Visible)
          and (OborView.Columns[i].DataBinding.FieldName<>'DB_SUMMA')
          and (OborView.Columns[i].DataBinding.FieldName<>'KR_SUMMA')
          then begin
                    if (OborView.Columns[i].GroupIndex<>-1)
                    then OrderFields[k].GroupIndex:=-OborView.Columns[i].GroupIndex
                    else OrderFields[k].GroupIndex:=-200;
                    OrderFields[k].FieldName :=OborView.Columns[i].DataBinding.FieldName;
                    inc(k);
          end;
     end;


     if (Length(OrderFields)>2)
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

     if Length(OrderFields)>2
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
     SetLength(SummaryOrder,OborView.DataController.Summary.DefaultGroupSummaryItems.Count);
     for i:=0 to OborView.DataController.Summary.DefaultGroupSummaryItems.Count-1 do
     begin
           SummaryOrder[k].FieldName :=TcxGridDbTableSummaryItem(OborView.DataController.Summary.DefaultGroupSummaryItems.Items[i]).FieldName;
           SummaryOrder[k].GroupIndex:=TcxGridDbTableSummaryItem(OborView.DataController.Summary.DefaultGroupSummaryItems.Items[i]).Column.VisibleIndex;

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
     Memo.Text:=Panel1.Caption+' '+Panel2.Caption;
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
     for i:=0 to OborView.ColumnCount-1 do
     begin
          if OborView.Columns[i].Visible
          then begin
                     Memo:=TfrxMemoView.Create(PageHeader);
                     Memo.CreateUniqueName;
                     Memo.SetBounds(0+k*ColumnWidth,0,ColumnWidth,30);
                     Memo.Text:=OborView.Columns[i].Caption;;
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
           Memo.HAlign:=haCenter;
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
     for i:=0 to OborView.ColumnCount-1 do
     begin
          if OborView.Columns[i].Visible
          then begin
                     Memo:=TfrxMemoView.Create(DataBand);
                     Memo.CreateUniqueName;
                     Memo.SetBounds(0+k*ColumnWidth,0,ColumnWidth,20);
                     Memo.DataSet:=frxDBDataset1;
                     Memo.DataField:=OborView.Columns[i].DataBinding.FieldName;
                     Memo.HAlign:=haCenter;
                     Memo.VAlign:=TfrxVAlign(vaCenter);
                     Memo.Font.Size:=8;
                     Memo.Font.Style:=[];
                     Memo.Frame.Style:=fsSolid;
                     Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
                     Memo.StretchMode:=smMaxHeight;
                     Memo.WordWrap   :=true;

                     if (OborView.Columns[i].DataBinding.FieldName='DB_SUMMA')
                     or (OborView.Columns[i].DataBinding.FieldName='KR_SUMMA')
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
     frxReport1.ShowReport;
end;

procedure TfrmMainResults.deCodeDoc(D_or_K: smallint);
var   PC: TFMASAppModule;
      D_OR_K_OBOROT, Id_Lang, i :Integer;
      Date_Beg, Date_End :TDate;
      str: string;
begin
  if ResultsDataSet.RecordCount>0 then begin
      with TFMASAppModuleCreator.Create do
      begin
             PC := CreateFMASModule(ExtractFilePath(Application.ExeName)+'Kernell\','obranalize_ex');
              if (PC<>nil)
              then begin
                  if D_OR_K=0 then begin
                      DSCH:=ID_SCH;
                      CSCH:=StrToInt64(ResultsDataSet.FBN('CORR_ID_SCH').AsString);
                  end;
                  if D_OR_K=1 then begin
                      DSCH:=StrToInt64(ResultsDataSet.FBN('CORR_ID_SCH').AsString);
                      CSCH:=ID_SCH;
                  end;
                  if  SmColumn.Visible=false
                       then ID_SMETA   :=-1
                       else begin
                          if TypeSmInfo=0 then  ID_SMETA  :=ResultsDataSet.FieldByName('CORR_SM_NUM').Value;
                          if TypeSmInfo=1 then begin
                                i := 1;
                                str := ResultsDataSet.FieldByName('CORR_SM_FULL').Value;
                                while (str[i] in ['0'..'9']) and (i<Length(str)) do
                                      inc(i);
                                setlength(str,i-1);
                                ID_SMETA := strtoint(str);
                          end;
                       end;
                  if  RzColumn.Visible=false
                       then ID_RAZDEL  :=-1
                       else begin
                          if TypeRzInfo=0 then  ID_RAZDEL :=ResultsDataSet.FieldByName('CORR_RZ_NUM').Value;
                          if TypeRzInfo=1 then begin
                                i := 1;
                                str := ResultsDataSet.FieldByName('CORR_RZ_FULL').Value;
                                while (str[i] in ['0'..'9']) and (i<Length(str)) do
                                      inc(i);
                                setlength(str,i-1);
                                ID_RAZDEL := strtoint(str);
                          end;
                       end;
                  if StColumn.Visible=false
                       then ID_STAT    :=-1
                       else begin
                          if TypeStInfo=0 then  ID_STAT   :=ResultsDataSet.FieldByName('CORR_ST_NUM').Value;
                          if TypeStInfo=1 then begin
                                i := 1;
                                str := ResultsDataSet.FieldByName('CORR_ST_FULL').Value;
                                while (str[i] in ['0'..'9']) and (i<Length(str)) do
                                      inc(i);
                                setlength(str,i-1);
                                ID_STAT   := strtoint(str);
                          end;
                       end;
                  if KvColumn.Visible=false
                       then ID_KEKV    :=-1
                       else begin
                          if TypeKvInfo=0 then  ID_KEKV   :=ResultsDataSet.FieldByName('CORR_KV_NUM').Value;
                          if TypeKvInfo=1 then begin
                                i:=1;
                                str:=ResultsDataSet.FieldByName('CORR_KV_FULL').Value;
                                while (str[i] in ['0'..'9']) and (i<Length(str)) do
                                      inc(i);
                                setlength(str,i-1);
                                ID_KEKV   := strtoint(str);
                          end;
                       end;

                  D_OR_K_OBOROT:=D_or_K;
                  Date_Beg     :=DateBeg;
                  Date_End     :=DateEnd;
                  Id_Lang      :=1;

                  PC.InParams.Items['AOwner']         := @self;
                  PC.InParams.Items['AhConnection']   :=PInteger(@WorkDatabase.Handle);
                  PC.InParams.Items['AD_ID_SCH']      :=PInt64(@DSCH);
                  PC.InParams.Items['AK_ID_SCH']      :=PInt64(@CSCH);
                  PC.InParams.Items['AD_ID_SMETA']     :=PInt64(@ID_SMETA);
                  PC.InParams.Items['AD_ID_RAZDEL']    :=PInt64(@ID_RAZDEL);
                  PC.InParams.Items['AD_ID_STAT']      :=PInt64(@ID_STAT);
                  PC.InParams.Items['AD_ID_KEKV']      :=PInt64(@ID_KEKV);
                  PC.InParams.Items['AD_OR_K_OBOROT'] :=PInteger(@D_OR_K_OBOROT);
                  PC.InParams.Items['ADate_Beg']      :=PDateTime(@Date_Beg);
                  PC.InParams.Items['ADate_End']      :=PDateTime(@Date_End);
                  PC.InParams.Items['AId_Lang']       :=PInteger(@Id_Lang);

                  (PC as IFMASModule).Run;
              end
              else MessageDlg('Помилка при роботі з модулем obranalize_ex.bpl',mtError,[mbOk], 0);
      end;
  end;
end;

procedure TfrmMainResults.TB_DocumentsClick(Sender: TObject);
begin
  deCodeDoc(0);
end;

procedure TfrmMainResults.N1Click(Sender: TObject);
begin
  deCodeDoc(0);
end;

procedure TfrmMainResults.N2Click(Sender: TObject);
begin
  deCodeDoc(1);
end;

procedure TfrmMainResults.TB_PrintClick(Sender: TObject);
var
  sortindex     :array of short;
  GroupColCnt   :Integer;
  OtherColCnt   :Integer;
  i,j,n,m,sumwidth:integer;
  str           :string;
  t             :Real48;
  form          :TPrintReport;
begin
  GroupColCnt:=0;
  OtherColCnt:=0;
  sumwidth:=0;
  m:=0;
  n:=0;

  PrintDataSet.Close;
  PrintDataSet.SQLs.SelectSQL.text:=ResultsDataSet.SQLs.SelectSQL.text;

  form:=TPrintReport.Create(self);
  form.inquiry:=ResultsDataSet.SQLs.SelectSQL.text;

  form.FIBDataSet:=PrintDataSet;
  form.frxReport:=frxReport1;
  form.frxDBDataSet:=frxDBDataset1;
  form.strTitle:=Panel1.Caption+' '+Panel2.Caption;

  for i:=0 to OborView.ColumnCount-1 do begin
    if  (OborView.Columns[i].DataBinding.FieldName<>'DB_SUMMA')
    and (OborView.Columns[i].DataBinding.FieldName<>'KR_SUMMA')
    and (OborView.Columns[i].GroupIndex>-1) then begin
      Inc(GroupColCnt);
      sumwidth:=sumwidth+OborView.Columns[i].Width;
    end
    else if (OborView.Columns[i].Visible) then begin
      Inc(OtherColCnt);
      sumwidth:=sumwidth+OborView.Columns[i].Width;
    end;
  end;
  form.n:=GroupColCnt;
  form.m:=OtherColCnt;
  SetLength(sortindex,GroupColCnt);
  SetLength(form.FieldstoOrder,GroupColCnt);
  SetLength(form.OtherFields,OtherColCnt);

  for i:=0 to OtherColCnt-1 do form.OtherFields[i].aggregative_function:='';
  for i:=0 to GroupColCnt-1 do form.FieldstoOrder[i].aggregative_function:='';

  for i:=0 to OborView.ColumnCount-1 do begin
    if (OborView.Columns[i].GroupIndex>-1)
{        and (OborView.Columns[i].DataBinding.FieldName<>'DB_SUMMA')
        and (OborView.Columns[i].DataBinding.FieldName<>'KR_SUMMA')
}    then begin
      sortindex[n]:=OborView.Columns[i].GroupIndex;
      form.FieldstoOrder[n].fieldname:=OborView.Columns[i].DataBinding.FieldName;
      form.FieldstoOrder[n].caption:=OborView.Columns[i].Caption;
      form.FieldstoOrder[n].width:=OborView.Columns[i].Width/sumwidth;
      if OborView.Columns[i].SortOrder=soAscending then form.FieldstoOrder[n].order:=1
      else form.FieldstoOrder[n].order:=0;
      Inc(n);
    end
    else if (OborView.Columns[i].Visible) then begin
      form.OtherFields[m].fieldname:=OborView.Columns[i].DataBinding.FieldName;
      form.OtherFields[m].caption:=OborView.Columns[i].Caption;
      form.OtherFields[m].width:=OborView.Columns[i].Width/sumwidth;
      form.OtherFields[m].alignment:=OborView.Columns[i].FooterAlignmentHorz;

      if (OborView.Columns[i].DataBinding.FieldName='DB_SUMMA') or
         (OborView.Columns[i].DataBinding.FieldName='KR_SUMMA') then
           form.OtherFields[m].aggregative_function:='SUM';
      Inc(m);
    end;
  end;
  for i:=0 to GroupColCnt-2 do begin
    for j:=i+1 to GroupColCnt-1 do begin
      if sortindex[i]>sortindex[j] then begin
        sortindex[i]:=sortindex[i]+sortindex[j];
        sortindex[j]:=sortindex[i]-sortindex[j];
        sortindex[i]:=sortindex[i]-sortindex[j];

        str:=form.FieldstoOrder[i].fieldname;
        form.FieldstoOrder[i].fieldname:=form.FieldstoOrder[j].fieldname;
        form.FieldstoOrder[j].fieldname:=str;
        str:=form.FieldstoOrder[i].Caption;
        form.FieldstoOrder[i].Caption:=form.FieldstoOrder[j].Caption;
        form.FieldstoOrder[j].Caption:=str;
        str:=form.FieldstoOrder[i].aggregative_function;
        form.FieldstoOrder[i].aggregative_function:=form.FieldstoOrder[j].aggregative_function;
        form.FieldstoOrder[j].aggregative_function:=str;
        t:=form.FieldstoOrder[i].Width;
        form.FieldstoOrder[i].Width:=form.FieldstoOrder[j].Width;
        form.FieldstoOrder[j].Width:=t;
        form.FieldstoOrder[i].Order:=form.FieldstoOrder[i].Order+form.FieldstoOrder[j].Order;
        form.FieldstoOrder[j].Order:=form.FieldstoOrder[i].Order-form.FieldstoOrder[j].Order;
        form.FieldstoOrder[i].Order:=form.FieldstoOrder[i].Order-form.FieldstoOrder[j].Order;
      end;
    end;
  end;
  form.ShowModal;
  form.Free;
end;

procedure TfrmMainResults.EscExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMainResults.UpdateExecute(Sender: TObject);
begin
  TB_Update.OnClick(self);
end;

procedure TfrmMainResults.PrintF6Execute(Sender: TObject);
begin
  TB_Print.OnClick(self);
end;

procedure TfrmMainResults.Print_CtrlPExecute(Sender: TObject);
begin
  TB_Print.OnClick(self);
end;

end.
