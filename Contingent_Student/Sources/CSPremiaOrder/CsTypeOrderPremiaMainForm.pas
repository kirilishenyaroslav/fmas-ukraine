unit CsTypeOrderPremiaMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCurrencyEdit,
  cxMaskEdit, cxDropDownEdit, cxLabel, uFControl, uLabeledFControl,
  uSpravControl, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, dxBar,
  cxContainer, cxDBLabel, StdCtrls, ExtCtrls, ImgList, dxBarExtItems,
  cxClasses, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, ActnList,
  Buttons, cxCheckBox, uCS_Types, CsTypeOrderPremiaDM, uCommonSp,
   pFibStoredProc, DateUtils, CsTypeOrderPremiaEdit, uCS_Proc, uCS_Kernel, uCS_Loader;

type
  TFCsTypeOrderPremiaMain = class(TForm)
    BottomPanel: TPanel;
    Panel3: TPanel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    TopPanel: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel4: TPanel;
    Panel9: TPanel;
    ItemsGrid: TcxGrid;
    ReportDataView: TcxGridDBTableView;
    ReportDataViewDBColumn1: TcxGridDBColumn;
    ReportDataViewDBColumn3: TcxGridDBColumn;
    ReportDataViewDBColumn4: TcxGridDBColumn;
    ReportDataViewDBColumn5: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    Panel10: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    Panel12: TPanel;
    KeyList: TActionList;
    StyleRepository: TcxStyleRepository;
    stBackground: TcxStyle;
    stContent: TcxStyle;
    stContentEven: TcxStyle;
    stContentOdd: TcxStyle;
    stFilterBox: TcxStyle;
    stFooter: TcxStyle;
    stGroup: TcxStyle;
    stGroupByBox: TcxStyle;
    stHeader: TcxStyle;
    stInactive: TcxStyle;
    stIncSearch: TcxStyle;
    stIndicator: TcxStyle;
    stPreview: TcxStyle;
    stSelection: TcxStyle;
    stHotTrack: TcxStyle;
    ContentError: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    dxBarManager1: TdxBarManager;
    dxAddPositionButton: TdxBarLargeButton;
    dxEditPositionButton: TdxBarLargeButton;
    dxReasonButton: TdxBarLargeButton;
    dxErrorButton: TdxBarLargeButton;
    BtnDelete: TdxBarLargeButton;
    dxCloneButton: TdxBarLargeButton;
    IL_OrdAcc: TImageList;
    dxBarPopupMenu2: TdxBarPopupMenu;
    ReportDataViewDBColumn2: TcxGridDBColumn;
    Panel6: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel2: TcxDBLabel;
    BtnRefreshe: TdxBarLargeButton;
    LBtnAddSmeta: TdxBarLargeButton;
    LbtnUpdateSmeta: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    BtnUpdate: TdxBarLargeButton;
    ReportDataViewDBColumn6: TcxGridDBColumn;
    ReportDataViewDBColumn8: TcxGridDBColumn;
    dxBarButton1: TdxBarButton;
    BtnDelSelect: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    ActionAdd: TAction;
    ActionUpd: TAction;
    ActionDelete: TAction;
    ActionRefreshe: TAction;
    ReportDataViewDBColumn9: TcxGridDBColumn;
    ActionSelect: TAction;
    procedure dxAddPositionButtonClick(Sender: TObject);
    procedure dxBtnDelAllClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    function SaveData: Boolean;
    function AddNewItem(id_item:Int64): Boolean;
    procedure BtnRefresheClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure ReportDataViewDBColumn6GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure BtnUpdateClick(Sender: TObject);
    procedure ReportDataViewDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function CHECK: Boolean;
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionUpdExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionRefresheExecute(Sender: TObject);
    procedure dxBarLargeButton8Click(Sender: TObject);
    procedure dxBarLargeButton11Click(Sender: TObject);
    procedure dxBarLargeButton10Click(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure ClearBuf;
    procedure CreateBufer;
    procedure BtnDelSelectClick(Sender: TObject);
    procedure ActionSelectExecute(Sender: TObject);

  private
    id_session:integer;
    ParamLoc:TcsTypeOrderParam;
    ID_PAYMENT_TYPE:integer;
  public
    constructor create(Param:TcsTypeOrderParam); reintroduce;
  end;

  const ID_ORDER_TYPE=299;  ///CsPremiaOrder

var
  FCsTypeOrderPremiaMain: TFCsTypeOrderPremiaMain;

implementation


{$R *.dfm}

constructor TFCsTypeOrderPremiaMain.create(Param: TcsTypeOrderParam);
begin
  inherited create(Param.Owner);
  ParamLoc:=Param;
  id_session      :=DMFCsTypeOrderPremiaMain.WorkDatabase.Gen_Id('GEN_CS_ORDER_PREIMIA_ID_SES',1);
  //if  Param.mode= CSUpdate then CreateBufer; после сохраения отлаживать можно 

  with DMFCsTypeOrderPremiaMain do
  begin

    MainOrderDataSet.Transaction:=ReadTransaction;
    ReadTransaction.StartTransaction;

    MainOrderDataSet.close;
    MainOrderDataSet.SelectSQL.Text:='SELECT * FROM CS_DT_PREMIA_INST_S('+IntToStr(id_session)+')';

    MainOrderDataSet.Open;
    MainOrderDataSet.FetchAll;
    MainOrderDataSet.first;
  end;
  ReportDataView.Focused:=True;
end;

procedure TFCsTypeOrderPremiaMain.dxAddPositionButtonClick(
  Sender: TObject);
var
    InsertBuffer:TpFibStoredProc;
    GetId_order_item:TpFibStoredProc;
    id_order_item:Int64;
    y, m, d, L, i: Word;
    AParameter: TcsParamPacks;
    res : variant;
begin
    AParameter := TcsParamPacks.Create;
    AParameter.Owner      := ParamLoc.Owner;
    AParameter.Db_Handle  := ParamLoc.DB_Handle;
    AParameter.Formstyle  := fsNormal;

    res:=DoFunctionFromPackage(AParameter, ['Contingent_Student\Cs_Stud.bpl', 'ShowCsStud']);
    AParameter.Free;
    if VarArrayDimCount(res)=0 then  exit;



    Screen.Cursor:=crHourGlass;
    self.Update;
    Application.ProcessMessages;



    L := VarArrayHighBound(res, 1)-VarArrayLowBound(res, 1);
    for i:=0 to L-1 do
    begin



      DMFCsTypeOrderPremiaMain.WriteTransaction.StartTransaction;



      GetId_order_item:=TpFibStoredProc.Create(nil);
      GetId_order_item.Database:=DMFCsTypeOrderPremiaMain.WorkDatabase;
      GetId_order_item.Transaction:=DMFCsTypeOrderPremiaMain.WriteTransaction;
      GetId_order_item.StoredProcName:='CS_KER_GET_NEW_ID_ORDER_ITEM';

      //Добавляем данные в буфферные таблицы по шапке

      GetId_order_item.Prepare;
      GetId_order_item.ParamByName('ID_SESSION').AsInt64    :=id_session;
      GetId_order_item.ParamByName('NOTE').Value            :=NULL;
      GetId_order_item.ParamByName('NUM_ITEM').Value        :=ParamLoc.Num_item;
      GetId_order_item.ParamByName('NUM_SUB_ITEM').Value    :=ParamLoc.Num_sub_item;
      GetId_order_item.ParamByName('ID_ORDER').AsInt64      :=ParamLoc.Id_order;
      GetId_order_item.ParamByName('ID_ORDER_TYPE').Value   :=id_order_type;

      GetId_order_item.ParamByName('REASON').Value        :=''; //NULL;
      {if IdType.ItemIndex=0 then
        GetId_order_item.ParamByName('REASON').Value        :='' //NULL;
      else GetId_order_item.ParamByName('REASON').Value     :='Заява ' + vartostrdef(res[i][1], '');}
      GetId_order_item.ParamByName('REASON').Value        :='';
      GetId_order_item.ParamByName('LINKTO').Value        :=NULL;

      GetId_order_item.ExecProc;

      id_order_item :=GetId_order_item.FieldByName('ID_ITEM').AsInt64;

            //Нарашиваем информацию по номеру подпункта
      ParamLoc.Num_sub_item:=ParamLoc.Num_sub_item+1;

      InsertBuffer:=TpFibStoredProc.Create(nil);
      InsertBuffer.Database:=DMFCsTypeOrderPremiaMain.WorkDatabase;
      InsertBuffer.Transaction:=DMFCsTypeOrderPremiaMain.WriteTransaction;

      //Добавляем данные в буфферные таблицы по основыным данным
      InsertBuffer.StoredProcName:='CS_DT_PREMIA_INST_I';
      InsertBuffer.Prepare;

      //DecodeDate(Date, y, m, d);

      //InsertBuffer.ParamByName('DATE_BEG').Value             := EncodeDate(y, m, 1);

      //d:=DaysInAMonth(y, m);

      //InsertBuffer.ParamByName('DATE_END').Value             :=EncodeDate(y, m, d);
      //if IdType.ItemIndex=0 then
      //InsertBuffer.ParamByName('PERCENT').Value              :=StrToFloat(Percent.Text);   процент пока опустим
      InsertBuffer.ParamByName('ID_ORDER_ITEM').asInt64      :=id_order_item;
      InsertBuffer.ParamByName('ID_PAYMENT_TYPE').Value      :=NULL; // т к нету еще справочника
      InsertBuffer.ParamByName('ID_VIDOPL').Value            :=NULL; // т к нету еще справочника
      InsertBuffer.ParamByName('ID_PERSON_EDUCATION').Value  :=res[i][0];
      InsertBuffer.ParamByName('ID_SMETA').Value             :=NULL;    //потом заполнить
      InsertBuffer.ParamByName('SUMMA').Value                :=NULL; //потом заполнить
      InsertBuffer.ParamByName('ID_EDUC_OPTIONS').Value      :=res[i][2];
      InsertBuffer.ParamByName('ICHECK').Value               :=   1; //сразу выделить



      //////////////////////////////////////////

      InsertBuffer.ExecProc;



      DMFCsTypeOrderPremiaMain.WriteTransaction.Commit;

      GetId_order_item.Close;
      GetId_order_item.Free;

      InsertBuffer.Close;
      InsertBuffer.Free;


    end;


    DMFCsTypeOrderPremiaMain.MainOrderDataSet.CloseOpen(True);

    Screen.Cursor:=crDefault;


end;

procedure TFCsTypeOrderPremiaMain.dxBtnDelAllClick(Sender: TObject);
var ST_PREMIA_INST_BUFF_D:TpFibStoredProc;
id:int64;
begin
  Screen.Cursor:=crHourGlass;
  self.Update;
  Application.ProcessMessages;

  with DMFCsTypeOrderPremiaMain do
  begin
    MainOrderDataSet.DisableControls;
    MainOrderDataSet.First;
    WriteTransaction.StartTransaction;
    ST_PREMIA_INST_BUFF_D:=TpFibStoredProc.Create(nil);
    ST_PREMIA_INST_BUFF_D.Database:=WorkDatabase;
    ST_PREMIA_INST_BUFF_D.Transaction:=WriteTransaction;
    ST_PREMIA_INST_BUFF_D.StoredProcName:='CS_DT_PREMIA_INST_D';

    ST_PREMIA_INST_BUFF_D.Prepare;
    while not MainOrderDataSet.eof do
    begin

      ID:=IfThen(MainOrderDataSet['ID_PREMIA_INST'],-1);


      ST_PREMIA_INST_BUFF_D.ParamByName('ID_PREMIA_INST').AsInt64                   :=ID;

      ST_PREMIA_INST_BUFF_D.ExecProc;
      MainOrderDataSet.Next;
    end;
    WriteTransaction.commit;
    ST_PREMIA_INST_BUFF_D.FREE;
    DMFCsTypeOrderPremiaMain.MainOrderDataSet.CloseOpen(True);
    MainOrderDataSet.EnableControls;
  end;
  Screen.Cursor:=crDefault;
end;

procedure TFCsTypeOrderPremiaMain.OkButtonClick(Sender: TObject);
begin
if CHECK then
    if ParamLoc.mode in [CSAdd,CSUpdate] then
    begin
      ShowMessage('Інформація по наказу успішно збережена!');
      ModalResult:=mrOk;
      close;
      {if SaveData then
      begin
        ShowMessage('Інформація по наказу успішно збережена!');
        ModalResult:=mrOk;
        close;
      end
      else
      begin
        ShowMessage('Знайдені помилки під час проведення наказу через ядро системи!');
        //ShowErrors;
        //GetData;
        DMFCsTypeOrderPremiaMain.MainOrderDataSet.CloseOpen(True);
      end
         }
    end
    else
    begin
      //ModalResult:=mrOk;
      close;
    end;

end;

function TFCsTypeOrderPremiaMain.SaveData: Boolean;
 var i:Integer;
     ExistErrors:Boolean;
begin
{     ExistErrors:=false;                        --на будущее
     with DMFCsTypeOrderPremiaMain do
     if (MainOrderDataSet.RecordCount>0)
     then begin
               WriteTransaction.StartTransaction;
               MainOrderDataSet.First;

               for i:=0 to MainOrderDataSet.RecordCount-1 do
               begin
                 if MainOrderDataSet['ICHECK']=1 then
                    if AddNewItem(VarAsType(MainOrderDataSet['ID_ORDER_ITEM'],varInt64)) //Сохраняем информацию по пункту
                    then
                    else begin
                              ExistErrors:=True;
                              Break;
                    end;
                    MainOrderDataSet.Next;
               end;

               if ExistErrors
               then WriteTransaction.Rollback
               else begin
                         WriteTransaction.Commit;
               end;
     end;

     Result:=not ExistErrors;      }
end;

function TFCsTypeOrderPremiaMain.AddNewItem(id_item:Int64): Boolean;
var AddItem:TCSKernelMode;
begin
     AddItem:=TCSKernelMode.Create;
     AddItem.Owner                :=self;
     AddItem.ID_ORDER             :=paramloc.Id_order;
     AddItem.ID_ORDER_ITEM_IN     :=id_item;

     AddItem.id_SESSION           :=id_session;
     AddItem.DB_Handle            :=DMFCsTypeOrderPremiaMain.WorkDatabase.Handle;
     AddItem.TR_HANDLE            :=DMFCsTypeOrderPremiaMain.WriteTransaction.Handle;
     Result                       :=CSKernelDo(AddItem);
     AddItem.free;
end;

procedure TFCsTypeOrderPremiaMain.BtnRefresheClick(Sender: TObject);
begin
    DMFCsTypeOrderPremiaMain.MainOrderDataSet.CloseOpen(True);
end;

procedure TFCsTypeOrderPremiaMain.BtnDeleteClick(
  Sender: TObject);
var ST_PREMIA_INST_BUFF_D:TpFibStoredProc;
ID_PREMIA_INST:int64;
begin
  Screen.Cursor:=crHourGlass;
  self.Update;
  Application.ProcessMessages;
  with DMFCsTypeOrderPremiaMain do
  begin
    ID_PREMIA_INST:=IfThen(MainOrderDataSet['ID_PREMIA_INST'],-1);
    WriteTransaction.StartTransaction;
    ST_PREMIA_INST_BUFF_D:=TpFibStoredProc.Create(nil);
    ST_PREMIA_INST_BUFF_D.Database:=WorkDatabase;
    ST_PREMIA_INST_BUFF_D.Transaction:=WriteTransaction;
    ST_PREMIA_INST_BUFF_D.StoredProcName:='CS_DT_PREMIA_INST_D';

    ST_PREMIA_INST_BUFF_D.Prepare;
    ST_PREMIA_INST_BUFF_D.ParamByName('ID_PREMIA_INST').AsInt64                   :=ID_PREMIA_INST;

    ST_PREMIA_INST_BUFF_D.ExecProc;
    WriteTransaction.commit;
  end;
  DMFCsTypeOrderPremiaMain.MainOrderDataSet.CloseOpen(True);
  Screen.Cursor:=crDefault;
end;

procedure TFCsTypeOrderPremiaMain.ReportDataViewDBColumn6GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if AText='0' then AText:='Премія';
  if AText='1' then AText:='Матдопомога';
end;

procedure TFCsTypeOrderPremiaMain.BtnUpdateClick(Sender: TObject);
var
    ST_PREMIA_INST_BUFF_U:TpFibStoredProc;
    ST_ORDER_ITEMS_BUFF_U:TpFibStoredProc;
    y, m, d : Word;
begin

    with  TFCsTypeOrderPremiaEdit.Create(self) do
    begin
        with DMFCsTypeOrderPremiaMain do
        begin
          IdType.ItemIndex:=        IfThen(MainOrderDataSet['ID_TYPE_CALC'],0);
          EditVidOpl.Text:=         VarToStrDef(MainOrderDataSet['NAME_VIDOPL_CONTINGENT'],'');
          PID_VIDOPL_CONTINGENT:=   ifThen(MainOrderDataSet['ID_VIDOPL_CONTINGENT'],-1);
          PID_VIDOPL:=              ifThen(MainOrderDataSet['ID_VIDOPL'],-1);

          BtnEditSmeta.Text:=       VarToStrDef(MainOrderDataSet['SMETA_KOD'],'');
          PID_SMETA:=               ifthen(MainOrderDataSet['ID_SMETA'],-1);
          LabelSmeta.Caption:=      VarToStrDef(MainOrderDataSet['SMETA_KOD'],'')+'.'+VarToStrDef(MainOrderDataSet['SMETA_TITLE'],'');

          if IdType.ItemIndex=0 then
          begin
            MENOTE.EditValue  :=    VarToStrDef(MainOrderDataSet['NOTE'],'');
            CBReason.Enabled  :=    False;
            MEReason.Enabled  :=    False;
          end
          else if IdType.ItemIndex=1 then
          begin
            CBReason.Checked  :=    False;
            MEReason.EditValue:=    VarToStrDef(MainOrderDataSet['REASON'],'');
            MENOTE.Enabled    :=    False;
          end;

          if (MainOrderDataSet['SUMMA'] <> NULL) then
          MaskEditSumma.Text:=      MainOrderDataSet['SUMMA'];

          if ShowModal=mrOk
          then
          begin
              Screen.Cursor:=crHourGlass;
              MainOrderDataSet.DisableControls;
              MainOrderDataSet.First;
              while not MainOrderDataSet.eof do
              begin
                if MainOrderDataSet['ICHECK']=1 then
                begin

                  WriteTransaction.StartTransaction;

                  ST_ORDER_ITEMS_BUFF_U:=TpFibStoredProc.Create(nil);
                  ST_ORDER_ITEMS_BUFF_U.Database:=WorkDatabase;
                  ST_ORDER_ITEMS_BUFF_U.Transaction:=WriteTransaction;
                  ST_ORDER_ITEMS_BUFF_U.StoredProcName:='CS_DT_ORDER_ITEMS_INST_U';

                  ST_ORDER_ITEMS_BUFF_U.Prepare;
                  ST_ORDER_ITEMS_BUFF_U.ParamByName('ID_ORDER_ITEM').AsInt64      :=IfThen(MainOrderDataSet['ID_ORDER_ITEM'],-1);


                  if IdType.ItemIndex=1 then    //mat
                  begin
                    if not CBReason.Checked then
                      ST_ORDER_ITEMS_BUFF_U.ParamByName('REASON').Value           :=MEReason.EditValue
                    else  ST_ORDER_ITEMS_BUFF_U.ParamByName('REASON').Value       :='Заява ' + VarToStrDef(MainOrderDataSet['FIO'],'');

                  end
                  else if IdType.ItemIndex=0 then
                    ST_ORDER_ITEMS_BUFF_U.ParamByName('NOTE').Value               :=MENote.EditValue;

                  ST_ORDER_ITEMS_BUFF_U.ExecProc;

                  ST_PREMIA_INST_BUFF_U:=TpFibStoredProc.Create(nil);
                  ST_PREMIA_INST_BUFF_U.Database:=WorkDatabase;
                  ST_PREMIA_INST_BUFF_U.Transaction:=WriteTransaction;

                  ST_PREMIA_INST_BUFF_U.StoredProcName:='CS_DT_PREMIA_INST_SET_SUM';
                  ST_PREMIA_INST_BUFF_U.Prepare;

                  DecodeDate(Date, y, m, d);

                  ST_PREMIA_INST_BUFF_U.ParamByName('DATE_BEG').Value               := EncodeDate(y, m, 1);

                  d:=DaysInAMonth(y, m);

                  ST_PREMIA_INST_BUFF_U.ParamByName('DATE_END').Value               :=EncodeDate(y, m, d);

                  ST_PREMIA_INST_BUFF_U.ParamByName('ID_PREMIA_INST').AsInt64       :=IfThen(MainOrderDataSet['ID_PREMIA_INST'],-1);

                  ST_PREMIA_INST_BUFF_U.ParamByName('ID_VIDOPL_CONTINGENT').AsInt64 :=PID_VIDOPL_CONTINGENT;
                  ST_PREMIA_INST_BUFF_U.ParamByName('ID_VIDOPL').AsInt64            :=PID_VIDOPL;
                  ST_PREMIA_INST_BUFF_U.ParamByName('ID_SMETA').AsInt64             :=PID_SMETA;
                  ST_PREMIA_INST_BUFF_U.ParamByName('SUMMA').Value                  :=StrToFloat(MaskEditSumma.Text);

                  ST_PREMIA_INST_BUFF_U.ParamByName('SUMMA').Value                  :=StrToFloat(MaskEditSumma.Text);


                  ST_PREMIA_INST_BUFF_U.ExecProc;

                  WriteTransaction.Commit;

                  ST_ORDER_ITEMS_BUFF_U.Close;
                  ST_ORDER_ITEMS_BUFF_U.Free;

                  ST_PREMIA_INST_BUFF_U.Close;
                  ST_PREMIA_INST_BUFF_U.Free;



                end;  //if MainOrderDataSet['ICHECK']=1 then
                  MainOrderDataSet.next;
              end;// while not MainOrderDataSet.eof do

              MainOrderDataSet.EnableControls;
              MainOrderDataSet.CloseOpen(true);
              Screen.Cursor:=crDefault;
          end; //if ShowModal=mrOk



        end;   //with DMFCsTypeOrderPremiaMain do

        Free;
    end; ///with  FCsTypeOrderPremiaEdit.Create(self) do
end;




procedure TFCsTypeOrderPremiaMain.ReportDataViewDblClick(Sender: TObject);
var
    ST_PROC:TpFibStoredProc;
    ICHECK:Integer;
    ID_PREMIA_INST:Int64;

begin

  try
  DMFCsTypeOrderPremiaMain.WriteTransaction.StartTransaction;

  ST_PROC:=TpFibStoredProc.Create(self);
  ST_PROC.Database:=DMFCsTypeOrderPremiaMain.WorkDatabase;
  ST_PROC.Transaction:=DMFCsTypeOrderPremiaMain.WriteTransaction;
  ST_PROC.StoredProcName:='CS_DT_PREMIA_INST_CHECK';
  ST_PROC.Prepare;
  ICHECK:= DMFCsTypeOrderPremiaMain.MainOrderDataSet['ICHECK'];
  if ICHECK= 0 then ICHECK:=1 else ICHECK:=0;
  ID_PREMIA_INST  := DMFCsTypeOrderPremiaMain.MainOrderDataSet['ID_PREMIA_INST'];
  ST_PROC.ParamByName('ICHECK').AsInteger                 :=ICHECK;
  ST_PROC.ParamByName('ID_PREMIA_INST').AsInteger         :=ID_PREMIA_INST;
  ST_PROC.ExecProc;
  DMFCsTypeOrderPremiaMain.WriteTransaction.Commit;
  ST_PROC.Free;

  DMFCsTypeOrderPremiaMain.MainOrderDataSet.RefreshSQL.Text:='SELECT * FROM CS_DT_PREMIA_INST_REF_S('+VarToStrDef(DMFCsTypeOrderPremiaMain.MainOrderDataSet['ID_PREMIA_INST'],'-1')+')';
  DMFCsTypeOrderPremiaMain.MainOrderDataSet.Refresh;
  except
  end;
end;

procedure TFCsTypeOrderPremiaMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    DMFCsTypeOrderPremiaMain.Free;
    Action:=CaFree;
end;

function TFCsTypeOrderPremiaMain.CHECK: Boolean;
var
ID_PREMIA_INST:int64;
begin
  result:=true;
  Screen.Cursor:=crHourGlass;
  with DMFCsTypeOrderPremiaMain do
  begin
    MainOrderDataSet.DisableControls;
    MainOrderDataSet.First;

    while not MainOrderDataSet.Eof do
    begin
      if MainOrderDataSet['ICHECK'] = 1 then
      begin
        if MainOrderDataSet['SUMMA']=NULL then
        begin
          result:=False;
          ShowMessage('Не всі дані введені');
          break;
        end;


      end;
      MainOrderDataSet.next;
    end;
    MainOrderDataSet.EnableControls;
  end;
  Screen.Cursor:=crDefault;
end;

procedure TFCsTypeOrderPremiaMain.ActionAddExecute(Sender: TObject);
begin
  dxAddPositionButtonClick(self);
end;

procedure TFCsTypeOrderPremiaMain.ActionUpdExecute(Sender: TObject);
begin
  BtnUpdateClick(self);
end;

procedure TFCsTypeOrderPremiaMain.ActionDeleteExecute(Sender: TObject);
begin
  BtnDeleteClick(self);
end;

procedure TFCsTypeOrderPremiaMain.ActionRefresheExecute(Sender: TObject);
begin
  BtnRefresheClick(self);
end;

procedure TFCsTypeOrderPremiaMain.dxBarLargeButton8Click(Sender: TObject);
begin
  ReportDataViewDblClick(self);
end;

procedure TFCsTypeOrderPremiaMain.dxBarLargeButton11Click(Sender: TObject);
var
    ST_PROC:TpFibStoredProc;


begin
try
  DMFCsTypeOrderPremiaMain.WriteTransaction.StartTransaction;
  ST_PROC:=TpFibStoredProc.Create(self);
  ST_PROC.Database:=DMFCsTypeOrderPremiaMain.WorkDatabase;
  ST_PROC.Transaction:=DMFCsTypeOrderPremiaMain.WriteTransaction;
  ST_PROC.StoredProcName:='CS_DT_PREMIA_INST_INVERT';
  ST_PROC.Prepare;
  ST_PROC.ParamByName('ID_SESSION').AsInt64         :=ID_SESSION;
  ST_PROC.ExecProc;
  DMFCsTypeOrderPremiaMain.WriteTransaction.Commit;
  ST_PROC.Free;
  DMFCsTypeOrderPremiaMain.MainOrderDataSet.CloseOpen(True);

except
end;
end;

procedure TFCsTypeOrderPremiaMain.dxBarLargeButton10Click(Sender: TObject);
var
    ST_PROC:TpFibStoredProc;

begin
try
  DMFCsTypeOrderPremiaMain.WriteTransaction.StartTransaction;
  ST_PROC:=TpFibStoredProc.Create(self);
  ST_PROC.Database:=DMFCsTypeOrderPremiaMain.WorkDatabase;
  ST_PROC.Transaction:=DMFCsTypeOrderPremiaMain.WriteTransaction;
  ST_PROC.StoredProcName:='CS_DT_PREMIA_INST_SELECT_VISUAL';
  ST_PROC.Prepare;
  ST_PROC.ParamByName('ID_SESSION').AsInt64         :=ID_SESSION;
  ST_PROC.ExecProc;
  DMFCsTypeOrderPremiaMain.WriteTransaction.Commit;
  ST_PROC.Free;
  DMFCsTypeOrderPremiaMain.MainOrderDataSet.CloseOpen(True);

except
end;
end;

procedure TFCsTypeOrderPremiaMain.CancelButtonClick(Sender: TObject);
begin
  ClearBuf;
  close;
end;

procedure TFCsTypeOrderPremiaMain.ClearBuf;
var
    ST_PROC:TpFibStoredProc;
begin
try
  DMFCsTypeOrderPremiaMain.WriteTransaction.StartTransaction;
  ST_PROC:=TpFibStoredProc.Create(self);
  ST_PROC.Database:=DMFCsTypeOrderPremiaMain.WorkDatabase;
  ST_PROC.Transaction:=DMFCsTypeOrderPremiaMain.WriteTransaction;
  ST_PROC.StoredProcName:='CS_DT_PREMIA_INST_D';
  ST_PROC.Prepare;
  ST_PROC.ParamByName('ID_PREMIA_INST').AsInt64       :=IfThen(DMFCsTypeOrderPremiaMain.MainOrderDataSet['ID_PREMIA_INST'],-1);
  ST_PROC.ExecProc;
  DMFCsTypeOrderPremiaMain.WriteTransaction.Commit;
  ST_PROC.Free;
except
  DMFCsTypeOrderPremiaMain.WriteTransaction.Rollback;
  ShowMessage('Буфер очищен с ошибками');
end;


end;

procedure TFCsTypeOrderPremiaMain.CreateBufer;
var
    ST_PROC:TpFibStoredProc;
begin
try
  DMFCsTypeOrderPremiaMain.WriteTransaction.StartTransaction;
  ST_PROC:=TpFibStoredProc.Create(self);
  ST_PROC.Database        :=DMFCsTypeOrderPremiaMain.WorkDatabase;
  ST_PROC.Transaction     :=DMFCsTypeOrderPremiaMain.WriteTransaction;
  ST_PROC.StoredProcName  :='CS_DT_PREMIA_INST_BUF_CREATE';
  ST_PROC.Prepare;
  ST_PROC.ParamByName('ID_ORDER').AsInt64       :=ParamLoc.Id_order;
  ST_PROC.ParamByName('ID_SESSION').AsInt64     :=ID_SESSION;
  ST_PROC.ExecProc;
  DMFCsTypeOrderPremiaMain.WriteTransaction.Commit;
  ST_PROC.Free;
except
  DMFCsTypeOrderPremiaMain.WriteTransaction.Rollback;
  ShowMessage('Буфер создан с ошибками');
end;
end;

procedure TFCsTypeOrderPremiaMain.BtnDelSelectClick(Sender: TObject);
var ST_PREMIA_INST_BUFF_D:TpFibStoredProc;
id:int64;
begin
  Screen.Cursor:=crHourGlass;
  self.Update;
  Application.ProcessMessages;

  with DMFCsTypeOrderPremiaMain do
  begin
    MainOrderDataSet.DisableControls;
    MainOrderDataSet.First;
    WriteTransaction.StartTransaction;
    ST_PREMIA_INST_BUFF_D:=TpFibStoredProc.Create(nil);
    ST_PREMIA_INST_BUFF_D.Database:=WorkDatabase;
    ST_PREMIA_INST_BUFF_D.Transaction:=WriteTransaction;
    ST_PREMIA_INST_BUFF_D.StoredProcName:='CS_DT_PREMIA_INST_D';
    ST_PREMIA_INST_BUFF_D.Prepare;

    while not MainOrderDataSet.EOF do
    begin
      if  MainOrderDataSet['ICHECK']=1 then
      begin
        ID:=IfThen(MainOrderDataSet['ID_PREMIA_INST'],-1);
        ST_PREMIA_INST_BUFF_D.ParamByName('ID_PREMIA_INST').AsInt64                   :=ID;

        ST_PREMIA_INST_BUFF_D.ExecProc;

      end;
      MainOrderDataSet.Next;
    end;

    WriteTransaction.commit;
    ST_PREMIA_INST_BUFF_D.FREE;
    DMFCsTypeOrderPremiaMain.MainOrderDataSet.CloseOpen(True);
    MainOrderDataSet.EnableControls;
  end;
  Screen.Cursor:=crDefault;
end;




procedure TFCsTypeOrderPremiaMain.ActionSelectExecute(Sender: TObject);
begin
    ReportDataViewDblClick(self);  
end;

end.
