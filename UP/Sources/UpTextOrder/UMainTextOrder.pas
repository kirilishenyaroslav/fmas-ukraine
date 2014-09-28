unit UMainTextOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, FIBDatabase, pFIBDatabase, StdCtrls, Buttons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo, DB, FIBDataSet,
  pFIBDataSet, AppStruClasses, pFibStoredProc, uFControl, uLabeledFControl,
  uSpravControl, uCommonSp, cxLookAndFeelPainters, cxButtons;

type
  TfrmMainTextOrder = class(TForm)
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    BottomPanel: TPanel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    cxMemo1: TcxMemo;
    MainOrderDataSet: TpFIBDataSet;
    Panel1: TPanel;
    PCardValue: TqFSpravControl;
    Label1: TLabel;
    cxButton1: TcxButton;
    Label2: TLabel;
    cxButton2: TcxButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PCardValueOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure cxButton1Click(Sender: TObject);
    procedure cxMemo1PropertiesChange(Sender: TObject);
    procedure cxMemo1PropertiesEditValueChanged(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    LocalasFrame:Boolean;
    outer_hwnd:HWND;
    id_order_type:Integer;
    base_num_item:Integer;
    base_num_sub_item:Integer;
    idorder:Int64;
    EditMode:Integer;
    Key_session:Int64;
    EditIdOrderItem:Int64;
    procedure CreateBuffInfoByIdItem;
    procedure GetData;
    procedure CreateEmptyTemplate;
    function SaveData:Boolean;
    procedure ShowErrors;
    constructor Create(AOwner:TComponent;
                           Db_Handle:TISC_DB_HANDLE;
                           id_order:int64;
                           id_order_type:Integer;
                           num_item:Integer;
                           num_sub_item:Integer;
                           id_order_item:Variant;
                           mode:integer;
                           asFrame:Boolean;
                           outer_hwnd:Variant); reintroduce;
  end;


implementation

{$R *.dfm}

uses UpKernelUnit, BaseTypes, RxMemDS, uUnivSprav, uSP_Text_Order;

{ TfrmMainTextOrder }

constructor TfrmMainTextOrder.Create(AOwner: TComponent;
  Db_Handle: TISC_DB_HANDLE; id_order: int64; id_order_type, num_item,
  num_sub_item: Integer; id_order_item: Variant; mode: integer;
  asFrame: Boolean; outer_hwnd: Variant);
begin
     if asFrame
     then inherited Create(AOwner)
     else inherited Create(AOwner);
     self.LocalasFrame:=asFrame;
     self.outer_hwnd:=outer_hwnd;
     //Если показываем форму как фрейм
     if self.LocalasFrame
     then begin
               self.BorderStyle:=bsNone;
               ///self.Align      :=alClient;
               self.BorderIcons:=[];
               self.Visible    :=true;
     end;

     WorkDatabase.Handle   :=Db_Handle;
     ReadTransaction.StartTransaction;
     StartHistory(ReadTransaction);     

     self.id_order_type    :=id_order_type;
     self.base_num_item    :=num_item;
     self.base_num_sub_item:=num_sub_item;
     self.idorder          :=id_order;

     self.EditMode         :=Mode;
     Key_session      :=WorkDatabase.Gen_Id('GEN_UP_ID_SESSION',1);

     if (self.EditMode=0) then CreateEmptyTemplate;

     if (self.EditMode in [1,2]) //Необходимо сгенерить информацию в буффера
     then begin
               self.EditIdOrderItem  :=VarAsType(id_order_item,varInt64);

               CreateBuffInfoByIdItem;
     end;

     if self.EditMode=2
     then begin
               BottomPanel.Visible:=false;
               cxMemo1.Properties.ReadOnly:=true;
               PCardValue.Blocked:=true;
     end;

     //Отображение информации о надбавках в приказе

     GetData;

     if (MainOrderDataSet.RecordCount>0)
     then begin
     
     end;

     if OkButton.HandleAllocated
     then SendMessage(self.outer_hwnd, FMAS_MESS_GET_BUTTON_OK,OkButton.Handle,OkButton.Handle);

     if CancelButton.HandleAllocated
     then SendMessage(self.outer_hwnd, FMAS_MESS_GET_BUTTON_OK,CancelButton.Handle,CancelButton.Handle);
end;

procedure TfrmMainTextOrder.CreateBuffInfoByIdItem;
var StoredProc:TpFibStoredProc;
begin
     StoredProc            :=TpFibStoredProc.Create(nil);
     StoredProc.Database   :=WorkDatabase;
     StoredProc.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     StartHistory(WriteTransaction);     
     StoredProc.StoredProcName:='UP_DT_TEXT_ORDER_BUFF_INS_EX';
     StoredProc.Prepare;
     StoredProc.ParamByName('KEY_SESSION').AsInt64      :=self.Key_session;
     StoredProc.ParamByName('ID_ORDER_ITEM').asInt64    :=self.EditIdOrderItem;
     StoredProc.ExecProc;
     StoredProc.Close;
     WriteTransaction.Commit;
     StoredProc.Free;
end;

procedure TfrmMainTextOrder.GetData;

begin
     MainOrderDataSet.Close;
     
     if (self.EditMode=0) //Добавление
     then begin
               MainOrderDataSet.SelectSQL.Text:='SELECT * FROM UP_DT_TEXT_BUFF_SEL('+IntToStr(self.Key_session)+')';
     end;

     if (self.EditMode=1) //Редактирование
     then begin
               MainOrderDataSet.SelectSQL.Text:='SELECT * FROM UP_DT_TEXT_BUFF_SEL('+IntToStr(self.Key_session)+')';
     end;

     if (self.EditMode=2) //Только просмотр
     then begin
               MainOrderDataSet.SelectSQL.Text:='SELECT * FROM UP_DT_TEXT_BUFF_SEL('+IntToStr(self.Key_session)+')';
     end;

     MainOrderDataSet.Open;
     MainOrderDataSet.FetchAll;

     if (MainOrderDataSet.RecordCount>0)
     then begin
               cxMemo1.Lines.Add(MainOrderDataSet.FieldByName('BODY').AsString);

               if (MainOrderDataSet.FieldByName('ID_PCARD').Value<>null)
               then begin
                         PCardValue.Value:=MainOrderDataSet.FieldByName('ID_PCARD').Value;
                         PCardValue.DisplayText:=MainOrderDataSet.FieldByName('FIO').ASstring;

                         if (self.EditMode in [0,1])
                         then begin
                                   Label2.Enabled:=true;
                                   cxButton1.Enabled:=true;
                                   cxButton2.Enabled:=true;
                         end;
               end;
     end;
end;

procedure TfrmMainTextOrder.CancelButtonClick(Sender: TObject);
begin
     if LocalasFrame
     then SendMessage(outer_hwnd,FMAS_MESS_CLOSE_FRAME,0,0)
     else Close;
end;

procedure TfrmMainTextOrder.CreateEmptyTemplate;
var StoredProc:TpFibStoredProc;
begin
     StoredProc            :=TpFibStoredProc.Create(nil);
     StoredProc.Database   :=WorkDatabase;
     StoredProc.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     StartHistory(WriteTransaction);     
     StoredProc.StoredProcName:='UP_DT_TEXT_ORDER_BUFF_INS';
     StoredProc.Prepare;
     StoredProc.ParamByName('KEY_SESSION').AsInt64      :=self.Key_session;
     StoredProc.ParamByName('NUM_ITEM').Value           :=self.base_num_item;
     StoredProc.ParamByName('NUM_SUB_ITEM').Value       :=self.base_num_sub_item;
     StoredProc.ParamByName('ID_ORDER').AsInt64         :=self.idorder;
     StoredProc.ParamByName('ID_ORDER_TYPE').Value      :=self.id_order_type;
     StoredProc.ExecProc;
     StoredProc.Close;
     WriteTransaction.Commit;
     StoredProc.Free;
end;

procedure TfrmMainTextOrder.OkButtonClick(Sender: TObject);
begin
     if SaveData
     then begin
               agShowMessage('Інформація по наказу успішно збережена!');
               if not LocalasFrame
               then ModalResult:=mrOk
               else SendMessage(outer_hwnd,FMAS_MESS_SAVE_ITEM_OK,0,0);
     end
     else begin
               agShowMessage('Знайдені помилки під час проведення наказу через ядро системи!');
               ShowErrors;
               GetData;
     end;
end;

function TfrmMainTextOrder.SaveData: Boolean;
var AddStru:UP_KERNEL_MODE_STRUCTURE;
    StoredProc:TpFibStoredProc;
begin
     StoredProc            :=TpFibStoredProc.Create(nil);
     StoredProc.Database   :=WorkDatabase;
     StoredProc.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     StartHistory(WriteTransaction);     
     StoredProc.StoredProcName:='UP_DT_TEXT_ORDER_BUFF_UPD';
     StoredProc.Prepare;
     StoredProc.ParamByName('ID_ORDER_ITEM').AsInt64    :=StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
     StoredProc.ParamByName('BODY').Value               :=self.cxMemo1.Lines.Text;
     StoredProc.ExecProc;
     StoredProc.Close;
     WriteTransaction.Commit;
     StoredProc.Free;

     WriteTransaction.StartTransaction;
     StartHistory(WriteTransaction);     

     AddStru.AOWNER              :=self;
     AddStru.ID_ORDER            :=self.IdOrder;
     AddStru.ID_ORDER_ITEM_IN    :=StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
     AddStru.KEY_SESSION         :=self.Key_session;
     AddStru.DBHANDLE            :=WorkDatabase.Handle;
     AddStru.TRHANDLE            :=WriteTransaction.Handle;
     Result:=UpKernelDo(@AddStru);

     if Result
     then WriteTransaction.Commit;
end;

procedure TfrmMainTextOrder.ShowErrors;
begin
     UpKernelUnit.GetUpSessionErrors(self,WorkDatabase.Handle,Key_session,StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString));
end;

procedure TfrmMainTextOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
var ClearSP:TpFibStoredProc;
begin
       ClearSP:=TpFibStoredProc.Create(nil);
       ClearSP.Database   :=WorkDatabase;
       ClearSP.Transaction:=WriteTransaction;
       WriteTransaction.StartTransaction;
       StartHistory(WriteTransaction);
       ClearSP.StoredProcName:='UP_KER_CLEAR_TMP_EX';
       ClearSP.Prepare;
       ClearSP.ParamByName('KEY_SESSION').AsInt64:=self.Key_session;
       ClearSP.ExecProc;
       WriteTransaction.Commit;
       ClearSP.Close;
       ClearSP.Free;

      Action:=caFree;
end;

procedure TfrmMainTextOrder.PCardValueOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
     sp: TSprav;
     UpdateSP:TpFibStoredProc;
begin
     if MainOrderDataSet.RecordCount>0
     then begin
                 sp := GetSprav('asup\PCardsList');
                 if sp <> nil then
                 begin
                        with sp.Input do
                        begin
                              Append;
                              FieldValues['DBHandle']   := Integer(workDatabase.Handle);
                              FieldValues['ActualDate'] := Date;
                              FieldValues['AdminMode']  := 0;
                              FieldValues['Select']     := 1;
                              FieldValues['ShowStyle']  := 0;

                              if FindField('NewVersion')<>nil
                              then begin
                                        FieldValues['NewVersion'] := 1;
                              end;
                              Post;
                        end;
                        sp.Show;

                        if ( sp.Output <> nil ) and not sp.Output.IsEmpty
                        then begin
                                  Value := sp.Output['ID_PCARD'];
                                  DisplayText := sp.Output['FIO'];
                                  UpdateSP:=TpFibStoredProc.Create(self);
                                  UpdateSP.Database:=WorkDatabase;
                                  UpdateSP.Transaction:=WriteTransaction;
                                  WriteTransaction.StartTransaction;
                                  StartHistory(WriteTransaction);                                  
                                  UpdateSP.StoredProcName:='UP_DT_ORDER_ITEMS_UPD_PCARD';
                                  UpdateSP.Prepare;
                                  UpdateSP.ParamByName('KEY_SESSION').AsInt64      :=self.Key_session;
                                  UpdateSP.ParamByName('ID_ITEM').AsInt64          :=StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                                  UpdateSP.ParamByName('ID_PCARD').Value           :=Value;
                                  UpdateSP.ExecProc;
                                  WriteTransaction.Commit;
                                  UpdateSP.Close;
                                  UpdateSP.Free;

                                  Label2.Enabled:=true;
                                  cxButton1.Enabled:=true;
                                  cxButton2.Enabled:=true;
                        end;
                 end;
     end;
end;

procedure TfrmMainTextOrder.cxButton1Click(Sender: TObject);
var GetSP:TpFibDataSet;
    Str:String;
begin
     Str:='';
     GetSP:=TpFibDataSet.Create(self);
     GetSP.Database:=WorkDatabase;
     GetSP.Transaction:=ReadTransaction;
     GetSP.SelectSQL.Text:=' SELECT * FROM UP_KER_MAN_ACTUAL_REGARD_SELECT('+varToStr(PCardValue.Value)+') ';
     GetSP.Open;
     if (GetSP.RecordCount>0)
     then begin
               while not GetSP.eof do
               begin
                    Str:=GetSp.FieldByName('FULL_NAME').AsString+' '+GetSp.FieldByName('NUM_DOC_REGARD').AsString;
                    cxMemo1.Lines.Add(Str);
                    GetSP.Next;
               end;
     end;
     GetSP.Close;
     GetSP.Free;

     SendMessage(outer_hwnd,FMAS_MESS_ITEM_INFO_CHANGED,0,0);
end;

procedure TfrmMainTextOrder.cxMemo1PropertiesChange(Sender: TObject);
begin
     SendMessage(outer_hwnd,FMAS_MESS_ITEM_INFO_CHANGED,0,0);
end;

procedure TfrmMainTextOrder.cxMemo1PropertiesEditValueChanged(
  Sender: TObject);
begin
      SendMessage(outer_hwnd,FMAS_MESS_ITEM_INFO_CHANGED,0,0);
end;

procedure TfrmMainTextOrder.cxButton2Click(Sender: TObject);
var
     sp: TSprav;
begin
     sp := GetSprav('UP\SPTextOrder');
     if sp <> nil then
     begin
     with sp.Input do
     begin
                    Append;
                    FieldValues['DBHandle']   := Integer(workDatabase.Handle);
                    //FieldValues['ActualDate'] := Date;
                    //FieldValues['AdminMode']  := 0;
                    FieldValues['Select']     := 1;
                    FieldValues['ShowStyle']  := 0;

                   // if FindField('NewVersion')<>nil
                    //then begin
                   //           FieldValues['NewVersion'] := 1;
                   // end;
                    Post;
              end;
              sp.Show;

              if ( sp.Output <> nil ) and not sp.Output.IsEmpty
              then begin
                        cxMemo1.Text:=(sp.output['Text1']);
              end;
       end;
     
end;

end.
