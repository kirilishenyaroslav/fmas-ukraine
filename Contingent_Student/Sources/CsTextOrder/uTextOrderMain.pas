unit uTextOrderMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ucs_Types, dxBar, dxBarExtItems, ImgList, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMemo,ibase, DogLoaderUnit,uCs_loader,uCS_Kernel;

type
  TfmTextOrderMain = class(TForm)
    PopupImageList: TImageList;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    DisabledLargeImages: TImageList;
    LargeImages: TImageList;
    MemoTextOrder: TcxMemo;
    function AddNewItem(id_item:Int64): Boolean;
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitButtonClick(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
  private
    AParam:TcsParamPacks;
  public
    res : Variant;
    id_shablon : variant;
    id_session, id_order, id_order_item : int64;
    function SaveData:Boolean;
    procedure GetData;
    procedure ShowErrors;
    constructor  Create(AParameter:TcsParamPacks);reintroduce;
  end;

var
  fmTextOrderMain: TfmTextOrderMain;

implementation

uses DM_TextOrder;

{$R *.dfm}

constructor TfmTextOrderMain.Create(AParameter:TcsParamPacks);
begin
  Screen.Cursor := crHourGlass;

  inherited Create(AParameter.Owner);

  DM := TDM.Create(Self);
  DM.DB.Handle:=AParameter.DB_Handle;
  DM.DB.Connected := True;
  AParam          := AParameter;
  id_order        := AParam.ID_Locate_1;
  id_order_item   := AParam.ID_Locate;
  id_session      :=DM.Db.Gen_Id('GEN_CS_ORDER_TEXT_ID_SES',1);
  GetData;

  Screen.Cursor:=crDefault;
end;

procedure TfmTextOrderMain.dxBarLargeButton3Click(Sender: TObject);
var
    AParameter: TcsParamPacks;
    res : variant;
begin
    AParameter := TcsParamPacks.Create;
    AParameter.Owner := self;
    AParameter.Db_Handle := dm.Db.Handle;
    AParameter.Formstyle := fsNormal;
    res := DoFunctionFromPackage(AParameter, ['Contingent_Student\CsSpTextOrder.bpl', 'ShowSpTextOrder']);
    AParameter.Free;

    if VarArrayDimCount(res)>0 then
    begin
        id_shablon := res[0];
        MemoTextOrder.Text:= res[1];
    end;

end;

procedure TfmTextOrderMain.GetData;
begin
     dm.DataSetOrders.Close;
     
     if (Aparam.mode=0) //Добавление
     then begin
               dm.DataSetOrders.SelectSQL.Text:='SELECT * FROM CS_DT_TEXT_INST_SEL('+IntToStr(self.id_session)+')';
     end;

     if (Aparam.mode=1) //Редактирование
     then begin
               dm.DataSetOrders.SelectSQL.Text:='SELECT * FROM CS_DT_TEXT_INST_SEL('+IntToStr(self.id_session)+')';
     end;

     if (Aparam.mode=2) //Только просмотр
     then begin
               dm.DataSetOrders.SelectSQL.Text:='SELECT * FROM CS_DT_TEXT_INST_SEL('+IntToStr(self.id_session)+')';
     end;

     dm.DataSetOrders.Open;
     dm.DataSetOrders.FetchAll;

     if (dm.DataSetOrders.RecordCount>0)
     then
     begin
          MemoTextOrder.Lines.Add(dm.DataSetOrders.FieldByName('BODY').AsString);
     end;
end;


procedure TfmTextOrderMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then action:=caFree
end;

procedure TfmTextOrderMain.ExitButtonClick(Sender: TObject);
begin
    close;
end;

procedure TfmTextOrderMain.dxBarLargeButton4Click(Sender: TObject);
begin
     if SaveData
     then
     begin
         ShowMessage('Інформація за наказом успішно збережена!');
         ModalResult:=mrOk
     end
     else
     begin
         ShowMessage('Знайдені помилки під час проведення наказу через ядро системи!');
         ShowErrors;
         GetData;
     end;
end;

function TfmTextOrderMain.SaveData: Boolean;
 var i:Integer;
     ExistErrors:Boolean;
begin
     ExistErrors:=false;
     with DM do
     if (DataSetOrders.RecordCount>0)
     then begin
               WriteTransaction.StartTransaction;
               DataSetOrders.First;

               for i:=0 to DataSetOrders.RecordCount-1 do
               begin
                    if AddNewItem(VarAsType(DataSetOrders['ID_ORDER_ITEM'],varInt64)) //Сохраняем информацию по пункту
                    then else
                    begin
                        ExistErrors:=True;
                        Break;
                    end;
                    DataSetOrders.Next;
               end;

               if ExistErrors
               then WriteTransaction.Rollback
               else begin
                         WriteTransaction.Commit;
               end;
     end;

     Result:=not ExistErrors;
end;

function TfmTextOrderMain.AddNewItem(id_item:Int64): Boolean;
var AddItem:TCSKernelMode;
begin
     DM.StProc.Database   := DM.DB;
     DM.StProc.Transaction:=DM.WriteTransaction;
     DM.WriteTransaction.StartTransaction;
    // StartHistory(WriteTransaction);
     DM.StProc.StoredProcName:='CS_DT_TEXT_DATA_INST_I';
     DM.StProc.Prepare;
     DM.StProc.ParamByName('ID_ORDER_ITEM').AsInt64    :=id_order_item;
     DM.StProc.ParamByName('BODY').Value               :=MemoTextOrder.Lines.Text;
     DM.StProc.ParamByName('ID_SESSION').Value         :=id_session;
     DM.StProc.ExecProc;
     DM.StProc.Close;
     DM.WriteTransaction.Commit;

     AddItem:=TCSKernelMode.Create;
     AddItem.Owner                :=self;
     AddItem.ID_ORDER             :=id_order;
     AddItem.ID_ORDER_ITEM_IN     :=id_order_item;

     AddItem.id_SESSION           :=id_session;
     AddItem.DB_Handle            :=DM.DB.Handle;
     AddItem.TR_HANDLE            :=DM.WriteTransaction.Handle;
     Result                       :=CSKernelDo(AddItem);
     AddItem.free;
end;

procedure TfmTextOrderMain.ShowErrors;
begin
     //CSKernelDo.GetUpSessionErrors(self,WorkDatabase.Handle,id_session,StrToInt64(dm.MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString));
end;

end.
