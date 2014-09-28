unit UMainSetNameOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, FIBDatabase, pFIBDatabase, StdCtrls, Buttons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo, DB, FIBDataSet,
  pFIBDataSet, AppStruClasses, pFibStoredProc, uFControl, uLabeledFControl,
  uSpravControl, uCommonSp, cxLookAndFeelPainters, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxButtonEdit;

type
  TfrmMainTextOrder = class(TForm)
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    BottomPanel: TPanel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    MainOrderDataSet: TpFIBDataSet;
    Panel1: TPanel;
    Label1: TLabel;
    PCardValue: TqFSpravControl;
    OldRuImya: TcxTextEdit;
    OldRuOtchestvo: TcxTextEdit;
    OldUaFamilia: TcxTextEdit;
    OldUaImya: TcxTextEdit;
    OldUaOtchestvo: TcxTextEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    NewUaFamilia: TcxTextEdit;
    NewRuFamilia: TcxTextEdit;
    NewRusImya: TcxTextEdit;
    NewUaImya: TcxTextEdit;
    NewUaOtchestvo: TcxTextEdit;
    NewRusOtchestvo: TcxTextEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    OldRuFamilia: TcxTextEdit;
    REASON: TcxTextEdit;
    Label11: TLabel;
    Label12: TLabel;
    Seria: TcxTextEdit;
    Label13: TLabel;
    Number: TcxTextEdit;
    Label14: TLabel;
    DateStart: TcxDateEdit;
    Label15: TLabel;
    Label16: TLabel;
    Vidan: TcxButtonEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxMemo1PropertiesChange(Sender: TObject);
    procedure cxMemo1PropertiesEditValueChanged(Sender: TObject);
    procedure ManValueOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure VidanPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    id_man:Integer;
    isBlockSpr:Boolean;
    function CheckData:Boolean;
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

uses UpKernelUnit, BaseTypes, RxMemDS, uUnivSprav, AllPeopleUnit, USprPassOrg;

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
     isBlockSpr:=False;
     if (self.EditMode=0)
     then begin
               CreateEmptyTemplate;
               DateStart.Date:=Date;
     end;

     if (self.EditMode in [1,2]) //Необходимо сгенерить информацию в буффера
     then begin
               self.EditIdOrderItem  :=VarAsType(id_order_item,varInt64);

               CreateBuffInfoByIdItem;
     end;

     if self.EditMode=2
     then begin
               BottomPanel.Visible:=false;
               PCardValue.Blocked:=true;
               isBlockSpr:=True;
     end;


     GetData;


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
     StoredProc.StoredProcName:='UP_DT_SET_NAME_BUFF_INS_EX';
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
               MainOrderDataSet.SelectSQL.Text:='SELECT * FROM UP_DT_MAN_SET_NAME_BUFF_SEL('+IntToStr(self.Key_session)+')';
     end;

     if (self.EditMode=1) //Редактирование
     then begin
               MainOrderDataSet.SelectSQL.Text:='SELECT * FROM UP_DT_MAN_SET_NAME_BUFF_SEL('+IntToStr(self.Key_session)+')';
     end;

     if (self.EditMode=2) //Только просмотр
     then begin
               MainOrderDataSet.SelectSQL.Text:='SELECT * FROM UP_DT_MAN_SET_NAME_BUFF_SEL('+IntToStr(self.Key_session)+')';
     end;

     MainOrderDataSet.Open;
     MainOrderDataSet.FetchAll;

     if (MainOrderDataSet.RecordCount>0)
     then begin

               if (MainOrderDataSet.FieldByName('ID_MAN').Value<>null)
               then begin
                         OldRuFamilia.Text   :=MainOrderDataSet.FieldByName('OLD_RU_FAMILIA').Value;
                         OldRuImya.Text      :=MainOrderDataSet.FieldByName('OLD_RU_IMYA').Value;
                         OldRuOtchestvo.Text :=MainOrderDataSet.FieldByName('OLD_RU_OTCHESTVO').Value;
                         OldUaFamilia.Text   :=MainOrderDataSet.FieldByName('OLD_UA_FAMILIA').Value;
                         OldUaImya.Text      :=MainOrderDataSet.FieldByName('OLD_UA_IMYA').Value;
                         OldUaOtchestvo.Text :=MainOrderDataSet.FieldByName('OLD_UA_OTCHESTVO').Value;

                         NewRuFamilia.Text   :=MainOrderDataSet.FieldByName('NEW_RU_FAMILIA').Value;
                         NewRusImya.Text     :=MainOrderDataSet.FieldByName('NEW_RU_IMYA').Value;
                         NewRusOtchestvo.Text:=MainOrderDataSet.FieldByName('NEW_RU_OTCHESTVO').Value;
                         NewUaFamilia.Text   :=MainOrderDataSet.FieldByName('NEW_UA_FAMILIA').Value;
                         NewUaImya.Text      :=MainOrderDataSet.FieldByName('NEW_UA_IMYA').Value;
                         NewUaOtchestvo.Text :=MainOrderDataSet.FieldByName('NEW_UA_OTCHESTVO').Value;
                         REASON.Text         :=MainOrderDataSet.FieldByName('REASON').Value;
                         id_man              :=MainOrderDataSet.FieldByName('ID_MAN').Value;
                         id_man              :=MainOrderDataSet.FieldByName('ID_MAN').Value;

                         Seria.Text          :=MainOrderDataSet.FieldByName('SERIA').Value;
                         Number.Text         :=MainOrderDataSet.FieldByName('NUMBER').Value;
                         Vidan.Text          :=MainOrderDataSet.FieldByName('VIDAN').Value;
                         DateStart.Date      :=MainOrderDataSet.FieldByName('DATE_BEG').Value;

                         PCardValue.Value    :=id_man;

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
     //StartHistory(WriteTransaction);
     StoredProc.StoredProcName:='UP_DT_SET_NAME_ORDER_BUFF_INS';
     StoredProc.Prepare;
     StoredProc.ParamByName('KEY_SESSION').AsInt64      :=self.Key_session;
     StoredProc.ParamByName('NUM_ITEM').Value           :=self.base_num_item;
     StoredProc.ParamByName('NUM_SUB_ITEM').Value       :=self.base_num_sub_item;
     StoredProc.ParamByName('ID_ORDER').AsInt64         :=self.idorder;
     StoredProc.ParamByName('ID_ORDER_TYPE').Value      :=self.id_order_type;
     StoredProc.ExecProc;
     self.EditIdOrderItem:=StoredProc.ParamByName('ID_ORDER_ITEM').AsInt64;
     StoredProc.Close;
     WriteTransaction.Commit;
     StoredProc.Free;
end;

procedure TfrmMainTextOrder.OkButtonClick(Sender: TObject);
begin
     if CheckData
     then begin
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
end;

function TfrmMainTextOrder.SaveData: Boolean;
var AddStru:UP_KERNEL_MODE_STRUCTURE;
    StoredProc:TpFibStoredProc;
begin
  try
     StoredProc            :=TpFibStoredProc.Create(nil);
     StoredProc.Database   :=WorkDatabase;
     StoredProc.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     //StartHistory(WriteTransaction);
     StoredProc.StoredProcName:='UP_DT_MAN_SET_NAME_BUFF_INS';
     StoredProc.Prepare;
     StoredProc.ParamByName('ID_ORDER_ITEM').AsInt64 :=self.EditIdOrderItem;
     StoredProc.ParamByName('KEY_SESSION').AsInt64   :=Key_session;
     StoredProc.ParamByName('OLD_RU_FAMILIA').Value  :=OldRuFamilia.EditValue;
     StoredProc.ParamByName('OLD_RU_IMYA').Value     :=OldRuImya.EditValue;
     StoredProc.ParamByName('OLD_RU_OTCHESTVO').Value:=OldRuOtchestvo.EditValue;
     StoredProc.ParamByName('OLD_UA_FAMILIA').Value  :=OldUaFamilia.EditValue;
     StoredProc.ParamByName('OLD_UA_IMYA').Value     :=OldUaImya.EditValue;
     StoredProc.ParamByName('OLD_UA_OTCHESTVO').Value:=OldUaOtchestvo.EditValue;
     StoredProc.ParamByName('NEW_RU_FAMILIA').Value  :=NewRuFamilia.EditValue;
     StoredProc.ParamByName('NEW_RU_IMYA').Value     :=NewRusImya.EditValue;
     StoredProc.ParamByName('NEW_RU_OTCHESTVO').Value:=NewRusOtchestvo.EditValue;
     StoredProc.ParamByName('NEW_UA_FAMILIA').Value  :=NewUaFamilia.EditValue;
     StoredProc.ParamByName('NEW_UA_IMYA').Value     :=NewUaImya.EditValue;
     StoredProc.ParamByName('NEW_UA_OTCHESTVO').Value:=NewUaOtchestvo.EditValue;
     StoredProc.ParamByName('REASON').Value          :=REASON.EditValue;
     StoredProc.ParamByName('SERIA').Value           :=Seria.Text;
     StoredProc.ParamByName('NUMBER').Value          :=Number.Text;
     StoredProc.ParamByName('VIDAN').Value           :=Vidan.Text;
     StoredProc.ParamByName('DATE_BEG').Value        :=DateStart.Date;
     StoredProc.ParamByName('ID_MAN').Value:=id_man;
     StoredProc.ExecProc;
     StoredProc.Close;
     WriteTransaction.Commit;
     StoredProc.Free;;

     WriteTransaction.StartTransaction;
     StartHistory(WriteTransaction);
     AddStru.AOWNER              :=self;
     AddStru.ID_ORDER            :=self.IdOrder;
     AddStru.ID_ORDER_ITEM_IN    :=EditIdOrderItem;
     AddStru.KEY_SESSION         :=self.Key_session;
     AddStru.DBHANDLE            :=WorkDatabase.Handle;
     AddStru.TRHANDLE            :=WriteTransaction.Handle;
     Result:=UpKernelDo(@AddStru);

     if Result
     then begin
               WriteTransaction.Commit;
               if (self.EditMode=0) then self.EditMode:=1;
     end;
  except on E:Exception do
         begin
            agMessageDlg(Application.Title, E.Message, mtInformation, [mbOK]);
            WriteTransaction.Rollback;
         end;
  end;
end;

procedure TfrmMainTextOrder.ShowErrors;
begin
     UpKernelUnit.GetUpSessionErrors(self,WorkDatabase.Handle,Key_session,EditIdOrderItem);
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

procedure TfrmMainTextOrder.cxMemo1PropertiesChange(Sender: TObject);
begin
     SendMessage(outer_hwnd,FMAS_MESS_ITEM_INFO_CHANGED,0,0);
end;

procedure TfrmMainTextOrder.cxMemo1PropertiesEditValueChanged(
  Sender: TObject);
begin
      SendMessage(outer_hwnd,FMAS_MESS_ITEM_INFO_CHANGED,0,0);
end;

procedure TfrmMainTextOrder.ManValueOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var result:Variant;
    PeopleInfoDS:TpFIBDataSet;
    fam,im, otch:string;
begin
        result := AllPeopleUnit.GetManForASUP(Self, WorkDatabase.Handle, False, True);
        if (not VarIsNull(result)) and not (VarType(result) = varNull) and
        not (VarArrayDimCount(result) = 0)
        then begin
                   Value := result[0];
                   id_man:=Value;
                   DisplayText := result[1];

                   PeopleInfoDS:=TpFIBDataSet.Create(self);
                   PeopleInfoDS.Database:=WorkDatabase;
                   PeopleInfoDS.Transaction:=ReadTransaction;
                   PeopleInfoDS.SelectSQL.Text:='SELECT * FROM PEOPLE WHERE ID_MAN='+VarToStr(Value);
                   PeopleInfoDS.Open;
                   PeopleInfoDS.FetchAll;
                   if (PeopleInfoDS.RecordCount>0)
                   then begin
                              OldUaFamilia.EditValue  :=PeopleInfoDS.FieldByName('FAMILIA').Value;
                              OldUaImya.EditValue     :=PeopleInfoDS.FieldByName('IMYA').Value;
                              OldUaOtchestvo.EditValue:=PeopleInfoDS.FieldByName('OTCHESTVO').Value;

                              OldRuFamilia.EditValue  :=PeopleInfoDS.FieldByName('RUS_FAMILIA').Value;
                              OldRuImya.EditValue     :=PeopleInfoDS.FieldByName('RUS_IMYA').Value;
                              OldRuOtchestvo.EditValue:=PeopleInfoDS.FieldByName('RUS_OTCHESTVO').Value;


                              NewUaImya.EditValue     :=PeopleInfoDS.FieldByName('IMYA').Value;
                              NewUaOtchestvo.EditValue:=PeopleInfoDS.FieldByName('OTCHESTVO').Value;


                              NewRusImya.EditValue     :=PeopleInfoDS.FieldByName('RUS_IMYA').Value;
                              NewRusOtchestvo.EditValue:=PeopleInfoDS.FieldByName('RUS_OTCHESTVO').Value;

                              fam :=PeopleInfoDS.FieldByName('FAMILIA').AsString;
                              im  :=PeopleInfoDS.FieldByName('IMYA').AsString;
                              otch:=PeopleInfoDS.FieldByName('OTCHESTVO').AsString;

                              Reason.Text       :=' Заява '+fam+' '+im[1]+'.'+otch[1]+'.';

                   end;
                   PeopleInfoDS.Close;
                   PeopleInfoDS.Free;
        end;
end;

function TfrmMainTextOrder.CheckData: Boolean;
var Res:Boolean;
begin
     Res:=True;
end;

procedure TfrmMainTextOrder.VidanPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var frm:TfrmPassOrg;
begin
   if isBlockSpr then Exit;
   frm:=TfrmPassOrg.Create(Self, '');
   if frm.ShowModal=mrOk then
   begin
      Vidan.Text:=frm.PassVidan;
      Vidan.SelStart:=Length(Vidan.Text);
   end;
end;

end.
