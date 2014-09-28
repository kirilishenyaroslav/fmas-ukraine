unit UpPremiaFOrderForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormControl, ComCtrls, DB, FIBDataSet, pFIBDataSet, RxMemDS,
  FIBDatabase, pFIBDatabase, ActnList, StdCtrls, Buttons, uFControl,
  uInvisControl, uLabeledFControl, uSpravControl, uCommonSP, uCharControl,
  uDateControl, uFloatControl, ExtCtrls, cxControls, cxSplitter,
  qFTools, uSelectForm, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, uLogicCheck,
  uSimpleCheck,  uBoolControl, GlobalSPR, uShtatUtils,
  Math, Ibase, cxLookAndFeelPainters, cxButtons, cxMemo, cxDBEdit,
  cxContainer, cxTextEdit, AppStruClasses, pFibStoredProc, Placemnt,
  uEnumControl, dxBar, dxBarExtItems, ImgList, DateUtils, cxCheckBox,
  AppEvnts, cxLabel, cxDBLabel, cxCurrencyEdit, UpPremiaFOrderReasonForm,
  cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfmPremiaOrder = class(TForm)
    KeyList: TActionList;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    CancelAction: TAction;
    BottomPanel: TPanel;
    GetRaiseCalcType: TpFIBDataSet;
    GetRaiseCalcTypeID_CALC_TYPE: TFIBIntegerField;
    GetRaiseCalcTypeCALC_TYPE_NAME: TFIBStringField;
    GetDefaultPercent: TpFIBDataSet;
    GetDefaultPercentRAISE_DEFAULT: TFIBFloatField;
    Reform_Smet: TAction;
    MainOrderDataSet: TpFIBDataSet;
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
    qizzStyle: TcxGridTableViewStyleSheet;
    SmetsDataSet: TpFIBDataSet;
    SmetsDataSource: TDataSource;
    MainOrderDataSource: TDataSource;
    ContentError: TcxStyle;
    FormStorage1: TFormStorage;
    FormPlacement1: TFormPlacement;
    TopPanel: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Panel4: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    cxGrid1: TcxGrid;
    SmView: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Panel9: TPanel;
    ItemsGrid: TcxGrid;
    ReportDataView: TcxGridDBTableView;
    ReportDataViewDBColumn1: TcxGridDBColumn;
    ReportDataViewDBColumn2: TcxGridDBColumn;
    ReportDataViewDBColumn6: TcxGridDBColumn;
    ReportDataViewDBColumn3: TcxGridDBColumn;
    ReportDataViewDBColumn4: TcxGridDBColumn;
    ReportDataViewDBColumn5: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    Panel10: TPanel;
    Panel2: TPanel;
    IdRaise: TqFSpravControl;
    dxBarManager1: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    dxBarPopupMenu1: TdxBarPopupMenu;
    IL_OrdAcc: TImageList;
    dxBarDockControl2: TdxBarDockControl;
    dxAddPositionButton: TdxBarLargeButton;
    dxDelPositionButton: TdxBarLargeButton;
    dxEditPositionButton: TdxBarLargeButton;
    dxReasonButton: TdxBarLargeButton;
    dxErrorButton: TdxBarLargeButton;
    dxAddPositionButtonW: TdxBarLargeButton;
    dxAddPositionButtonNW: TdxBarLargeButton;
    dxSmAddButton: TdxBarLargeButton;
    dxSmDelButton: TdxBarLargeButton;
    Panel3: TPanel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    ReportDataViewDBColumn7: TcxGridDBColumn;
    cxCheckBox1: TcxCheckBox;
    Panel11: TPanel;
    cxGrid2: TcxGrid;
    SalaryView: TcxGridDBTableView;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    SalaryViewDBColumn1: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    SalarySmDataSet: TpFIBDataSet;
    SalaryFinanceDataSource: TDataSource;
    dxBarPopupMenu2: TdxBarPopupMenu;
    dxDelPositionButtonOne: TdxBarLargeButton;
    dxDelPositionButtonAll: TdxBarLargeButton;
    dxBarPopupMenu3: TdxBarPopupMenu;
    dxSmDelButtonOne: TdxBarLargeButton;
    dxSmDelButtonAll: TdxBarLargeButton;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel2: TcxDBLabel;
    Panel12: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    IsPercentBox: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    LabelIdType: TcxLabel;
    IdType: TcxComboBox;
    Percent: TcxTextEdit;
    dxSmEditPositionButton: TdxBarLargeButton;
    dxCloneButton: TdxBarLargeButton;
    SelRaise: TpFIBDataSet;
    ReportDataViewDBColumn8: TcxGridDBColumn;
    lblDateStart: TcxLabel;
    DateStart: TcxDateEdit;
    procedure CancelActionExecute(Sender: TObject);
    procedure IdRaiseOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure IdRaiseChange(Sender: TObject);
    procedure ShowBuPanelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure dxSmDelButtonClick(Sender: TObject);
    procedure dxAddPositionButtonClick(Sender: TObject);
    procedure dxDelPositionButtonClick(Sender: TObject);
    procedure dxEditPositionButtonClick(Sender: TObject);
    procedure dxReasonButtonClick(Sender: TObject);
    procedure dxErrorButtonClick(Sender: TObject);
    procedure dxSmAddButtonClick(Sender: TObject);
    procedure dxAddPositionButtonNWClick(Sender: TObject);
    procedure IdTypeChange(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure dxDelPositionButtonAllClick(Sender: TObject);
    procedure dxSmDelButtonAllClick(Sender: TObject);
    procedure dxSummButtonClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure ReportDataViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SmViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SalaryViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IdTypeClick(Sender: TObject);
    procedure PercentKeyPress(Sender: TObject; var Key: Char);
    procedure PercentPropertiesChange(Sender: TObject);
    procedure PercentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxSmEditPositionButtonClick(Sender: TObject);
    procedure SmViewDblClick(Sender: TObject);
    procedure ReportDataViewDblClick(Sender: TObject);
    procedure PercentContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure dxCloneButtonClick(Sender: TObject);
  private
         { Private declarations }
         ErrorForm:TForm;
         only_save_in_buff:Integer;
         ItemLinkTo:Integer;
         EditMode:Integer;
         EditIdOrderItem:Int64;
         LocalasFrame:Boolean;
         procedure LoadDataFromFilter;
         procedure GetData;
         procedure CreateBuffInfoByIdItem;
         function CheckData:Boolean;
         function SaveData:Boolean;
         function AddNewItem(id_item:int64):Boolean;
         procedure ShowErrors;
         procedure GetErrorTexts(id_item:int64);
         procedure SetControls(Enable:Boolean);
  public
         PC: TFMASAppModule;
         Key_session:int64;
         id_user:Integer;
         Id_Calc_Type : Integer; // Тип расчета разбивки надбавок
         dmShtatUtils : TdmShtatUtils;
         DateOrder : TDate;
         IdManPremia, SpType : Integer;
         IdOrder:Int64;
         id_order_type : Integer;
         base_num_item:Integer;
         base_num_sub_item:Integer;
         outer_hwnd:HWND;
         update_raise_info:boolean;
         constructor Create(AOwner:TComponent;
                           Db_Handle:TISC_DB_HANDLE;
                           id_order:int64;
                           id_order_type:Integer;
                           num_item:Integer;
                           num_sub_item:Integer;
                           only_save_in_buff:Variant;
                           ItemLinkTo:Variant;
                           id_order_item:Variant;
                           mode:integer;
                           ViewKeySession:Variant;
                           asFrame:Boolean;
                           outer_hwnd:Variant); reintroduce;
  end;
var Reas: TfrmReasonForm;
implementation

uses BaseTypes, AccMgmt, UpPremFOrdFormEditSm, UPremiaFOrderAddNW, FIBQuery,
     UpPremiaFOrderEditPeriod, UpKernelUnit, UPremiaFOrderShowErrors;

{$R *.dfm}



procedure TfmPremiaOrder.CancelActionExecute(Sender: TObject);
begin
     if LocalasFrame
     then SendMessage(outer_hwnd,FMAS_MESS_CLOSE_FRAME,0,0)
     else Close;
end;

procedure TfmPremiaOrder.IdRaiseOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
    DeleteSP:TpFibStoredProc;
    I:Integer;
begin
    // создать справочник
    sp :=  GetSprav('ASUP\SpRaise');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(WorkDatabase.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;

            if IdType.ItemIndex=0 then FieldValues['Raise_Select_Kind'] := 3;
            if IdType.ItemIndex=1 then FieldValues['Raise_Select_Kind'] := 4;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;

        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Raise'];
            DisplayText := sp.Output['Name'];

            if (MainOrderDataSet.RecordCount>0) then
            begin
                 MainOrderDataSet.First;
                 for i:=0 to MainOrderDataSet.RecordCount-1 do
                 begin
                      DeleteSP:=TpFibStoredProc.Create(self);
                      DeleteSP.Database    :=WorkDatabase;
                      DeleteSP.Transaction :=WriteTransaction;
                      WriteTransaction.StartTransaction;
                      StartHistory(WriteTransaction);
                      DeleteSP.StoredProcName:='UP_DT_MAN_PREMIA_BUFF_DEL';
                      DeleteSP.Prepare;
                      DeleteSP.ParamByName('KEY_SESSION').asInt64  :=self.Key_session;
                      DeleteSP.ParamByName('ID_ORDER_ITEM').AsInt64:=StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                      DeleteSP.ExecProc;
                      DeleteSP.Close;
                      DeleteSP.Free;
                      WriteTransaction.Commit;
                      MainOrderDataSet.Next;
                 end;

                 GetData;

                 if (MainOrderDataSet.RecordCount=0)
                 then begin
                          //SetControls(false);
                          IdRaise.Blocked:=False;
                          IdType.Enabled:=False;
                          LabelIdType.Left:=3;
                          LabelIdType.Caption:='* Тип:';
                          OkButton.Enabled:=False;
                 end;
            end;



            dxAddPositionButton.Enabled:=true;
            dxAddPositionButtonW.Enabled:=true;
            dxAddPositionButtonNW.Enabled:=true;
            dxDelPositionButton.Enabled  :=false;
            dxEditPositionButton.Enabled  :=false;
            dxReasonButton.Enabled  :=false;
           // dxErrorButton.Enabled  :=false;
           // dxErrorButton.Visible:=ivNever;
            dxSmAddButton.Enabled  :=false;
            dxSmEditPositionButton.Enabled  :=false;
            dxSmDelButton.Enabled  :=false;
            IdType.Enabled:=False;
            LabelIdType.Left:=11;
            LabelIdType.Caption:='Тип:';

           { try
                GetDefaultPercent.Close;
                GetDefaultPercent.ParamByName('ID_RAISE').AsInteger := Value;
                GetDefaultPercent.Open;
                //Percent.Value := GetDefaultPercentRAISE_DEFAULT.Value;
            except
            end; }
        end;
        sp.Free;
    end;
end;

procedure TfmPremiaOrder.IdRaiseChange(Sender: TObject);
var UpdateRaise:TpFibStoredProc;
begin
    if varIsNull(IdRaise.Value) then exit;
    
    GetRaiseCalcType.Close;
    GetRaiseCalcType.ParamByName('ID_RAISE').AsInteger := IdRaise.Value;
    GetRaiseCalcType.ParamByName('CUR_DATE').AsDate := Date;
    GetRaiseCalcType.Open;

    if not GetRaiseCalcType.IsEmpty
    then begin
              Id_Calc_Type := GetRaiseCalcTypeID_CALC_TYPE.Value;
    end
    else begin
              Id_Calc_Type := 0;
    end;
    GetRaiseCalcType.Close;

    {if update_raise_info
    then begin
              UpdateRaise:=TpFibStoredProc.Create(self);
              UpdateRaise.Database:=WorkDatabase;
              UpdateRaise.Transaction:=WriteTransaction;
              WriteTransaction.StartTransaction;
              StartHistory(WriteTransaction);
              UpdateRaise.StoredProcName:='UP_DT_MAN_PREMIA_BUFF_UPD_RAISE';
              UpdateRaise.Prepare;
              UpdateRaise.ParamByName('KEY_SESSION').AsInt64:=self.Key_session;

              if RadioButton1.Checked
              then begin
                        UpdateRaise.ParamByName('PERCENT').Value      :=StrToFloat(Percent.Text);
              end
              else begin
                        UpdateRaise.ParamByName('PERCENT').Value      :=NULL;
              end;
              UpdateRaise.ParamByName('ID_RAISE').Value     :=IdRaise.Value;

              if (MainOrderDataSet.RecordCount>0)
              then UpdateRaise.ParamByName('ID_ORDER_ITEM').AsInt64:=StrToInt64(MainOrderDataSet.FBN('ID_ORDER_ITEM').AsString)
              else UpdateRaise.ParamByName('ID_ORDER_ITEM').Value  :=null;

              UpdateRaise.ExecProc;
              UpdateRaise.Close;
              WriteTransaction.Commit;

              UpdateRaise.Free;
    end
    else update_raise_info:=true;   }
end;

constructor TfmPremiaOrder.Create(AOwner: TComponent; Db_Handle: TISC_DB_HANDLE; id_order:int64;
                                 id_order_type:integer;num_item:Integer; num_sub_item:Integer;
                                 only_save_in_buff:Variant;ItemLinkTo:Variant;
                                 id_order_item:Variant;mode:integer;ViewKeySession:Variant;
                                  asFrame:Boolean;outer_hwnd:Variant);
begin
     if asFrame
     then inherited Create(AOwner)
     else inherited Create(AOwner);
     update_raise_info:=false;

     self.outer_hwnd:=outer_hwnd;
     Percent.TabStop:=False;
     if IdType.ItemIndex=1 Then IsPercentBox.Visible:=False
                           Else IsPercentBox.Visible:=True;
  {   if asFrame
     then inherited Create(nil)
     else inherited Create(Application.MainForm);}
    // outer_hwnd_var:=outer_hwnd;
    { SendMessage(outer_hwnd, FMAS_MESS_GET_BUTTON_OK,OkButton.Handle,OkButton.Handle);
     SendMessage(outer_hwnd, FMAS_MESS_GET_BUTTON_CANCEL,CancelButton.Handle,CancelButton.Handle);
   }  self.LocalasFrame:=asFrame;
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
     self.only_save_in_buff:=0;

     self.EditMode         :=Mode;

    // if IdType.Value=1 Then IsPercentBox.Visible:=True;
    //                   Else IsPercentBox.Visible:=False;

     if (EditMode<>3)
     then Key_session      :=WorkDatabase.Gen_Id('GEN_UP_ID_SESSION',1)
     else begin
               if (only_save_in_buff<>null)
               then self.only_save_in_buff:=only_save_in_buff;

               if (ItemLinkTo<>null)
               then self.ItemLinkTo       :=VarAsType(ItemLinkTo,varInt64);

               if (ViewKeySession<>null)
               then self.Key_session      :=VarAsType(ViewKeySession,varInt64);

               if (id_order_item<>null)
               then self.EditIdOrderItem  :=VarAsType(id_order_item,varInt64);
          end;

     if (self.EditMode in [1,2]) //Необходимо сгенерить информацию в буфера
     then begin
               self.EditIdOrderItem  :=VarAsType(id_order_item,varInt64);

               CreateBuffInfoByIdItem;
     end;

     if self.EditMode=2 //then OkButton.Visible:=false;
     then begin
               BottomPanel.Visible:=false;
               Panel10.Visible:=false;
               Panel8.Visible:=false;
               IdType.Enabled:=False;
               IdRaise.Blocked:=True;
               RadioButton1.Enabled:=False;
               RadioButton2.Enabled:=False;
               Percent.Enabled:=False;               
     end;
     //Отображение информации о премиях в приказе

     GetData;

     if (MainOrderDataSet.RecordCount>0)
     then begin
               SetControls(true);

               if (Id_Calc_Type=4)
               then begin
                      //   ExtInfoButton.Enabled:=true;
               end;

               if (Id_Calc_Type<>2)
               then begin
                         //dxSmAddButton.Enabled:=True;
                         //dxSmEditPositionButton.Enabled:=True;
                         //dxSmDelButton.Enabled:=True;
               end;
     end;

     if (self.EditMode=1 {in [1,2]})
     then begin
              if VarIsNull(IdType.ItemIndex) then
              begin
                 IdRaise.Blocked:=True;
                 LabelIdType.Left:=3;
                 LabelIdType.Caption:='* Тип:';
              end
              else
              begin
                  IdRaise.Blocked:=False;
                  LabelIdType.Left:=11;
                  LabelIdType.Caption:='Тип:';
              end;
     end;

     if (self.EditMode=2 {in [1,2]})
     then begin
                dxAddPositionButton.Enabled:=false;
                dxAddPositionButtonW.Enabled:=false;
                dxAddPositionButtonNW.Enabled:=false;
                dxDelPositionButton.Enabled  :=false;
                dxEditPositionButton.Enabled  :=false;
                dxReasonButton.Enabled  :=false;
               // dxErrorButton.Enabled  :=false;
                dxErrorButton.Visible:=ivNever;
                dxSmAddButton.Enabled  :=false;
                dxSmEditPositionButton.Enabled:=False;
                dxSmDelButton.Enabled  :=false;
                IdType.Enabled:=False;
                LabelIdType.Left:=11;
                LabelIdType.Caption:='Тип:';
     end;
     DateStart.Date:=EncodeDate(YearOf(Date), MonthOf(Date), 1);
     if OkButton.HandleAllocated
     then SendMessage(self.outer_hwnd, FMAS_MESS_GET_BUTTON_OK,OkButton.Handle,OkButton.Handle);

     if CancelButton.HandleAllocated
     then SendMessage(self.outer_hwnd, FMAS_MESS_GET_BUTTON_OK,CancelButton.Handle,CancelButton.Handle);
end;

procedure TfmPremiaOrder.ShowBuPanelButtonClick(Sender: TObject);
begin
     if (MainOrderDataSet.RecordCount>0)
     then begin
               Panel4.Width:=200;
               Splitter1.Left:=Panel4.Left-1;
     end;
end;

procedure TfmPremiaOrder.FormCreate(Sender: TObject);
var UpdateRaise:TpFIBStoredProc;
begin
     ErrorForm:=TfrmGetErrors.Create(self);

     id_user:=AccMgmt.GetUserId;
     with TFMASAppModuleCreator.Create do
     begin
          PC :=CreateFMASModule(ExtractFilePath(Application.ExeName)+'up\','up_filter');
          if (PC=nil)
          then agMessageDlg('Увага!','Помилка при роботі з модулем up_filter.bpl',mtError,[mbOk]);
     end;
     Panel4.Width:=0;
     IdType.ItemIndex:=0;
     SelRaise.Close;
     SelRaise.SQLs.SelectSQL.Text:='select ORDER_PREMIA_RAISE, ORDER_PREMIA_PERCENT from UP_SYS_INI_CONSTS';
     SelRaise.Open;
     IdRaise.Value:=SelRaise['ORDER_PREMIA_RAISE'];
     Percent.Text:=FloatToStr(SelRaise['ORDER_PREMIA_PERCENT']);
         GetRaiseCalcType.Close;
    GetRaiseCalcType.ParamByName('ID_RAISE').AsInteger := IdRaise.Value;
    GetRaiseCalcType.ParamByName('CUR_DATE').AsDate := Date;
    GetRaiseCalcType.Open;

    if not GetRaiseCalcType.IsEmpty
    then begin
              Id_Calc_Type := GetRaiseCalcTypeID_CALC_TYPE.Value;
    end
    else begin
              Id_Calc_Type := 0;
    end;
    GetRaiseCalcType.Close;

   { if update_raise_info
    then begin
              UpdateRaise:=TpFibStoredProc.Create(self);
              UpdateRaise.Database:=WorkDatabase;
              UpdateRaise.Transaction:=WriteTransaction;
              WriteTransaction.StartTransaction;
              StartHistory(WriteTransaction);
              UpdateRaise.StoredProcName:='UP_DT_MAN_PREMIA_BUFF_UPD_RAISE';
              UpdateRaise.Prepare;
              UpdateRaise.ParamByName('KEY_SESSION').AsInt64:=self.Key_session;

              if RadioButton1.Checked
              then begin
                        UpdateRaise.ParamByName('PERCENT').Value      :=StrToFloat(Percent.Text);
              end
              else begin
                        UpdateRaise.ParamByName('PERCENT').Value      :=NULL;
              end;
              UpdateRaise.ParamByName('ID_RAISE').Value     :=IdRaise.Value;

              if (MainOrderDataSet.RecordCount>0)
              then UpdateRaise.ParamByName('ID_ORDER_ITEM').AsInt64:=StrToInt64(MainOrderDataSet.FBN('ID_ORDER_ITEM').AsString)
              else UpdateRaise.ParamByName('ID_ORDER_ITEM').Value  :=null;

              UpdateRaise.ExecProc;
              UpdateRaise.Close;
              WriteTransaction.Commit;

              UpdateRaise.Free;
    end
    else update_raise_info:=true;}
    update_raise_info:=false;
end;

procedure TfmPremiaOrder.FormDestroy(Sender: TObject);
var ClearSP:TpFibStoredProc;
begin
     if (self.EditMode<>4)
     then begin
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
     end;

     if Assigned(PC) then PC.Free;
     if Assigned(ErrorForm) then ErrorForm.Free;
end;

procedure TfmPremiaOrder.LoadDataFromFilter;
var GetFilterDS:TpFibDataSet;
    InsertBuffer:TpFibStoredProc;
    GetId_order_itemSP:TpFibStoredProc;
    i:Integer;
    id_order_item:Int64;
    y, m, d : Word;
begin
    //Забираем данные из фильтра
    GetFilterDS:=TpFibDataSet.Create(nil);
    GetFilterDS.Database   :=WorkDatabase;
    GetFilterDS.Transaction:=ReadTransaction;
    GetFilterDS.SelectSQL.Text:='SELECT * FROM UP_KER_GET_FILTER_DATA_EX('+IntToStr(self.Key_session)+')';
    GetFilterDS.Open;
    GetFilterDS.FetchAll;
    GetFilterDS.First;

    //Если есть данные по фильтру
    if (GetFilterDS.RecordCount>0)
    then begin
               InsertBuffer:=TpFibStoredProc.Create(nil);
               InsertBuffer.Database:=WorkDatabase;
               InsertBuffer.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               StartHistory(WriteTransaction);
               InsertBuffer.StoredProcName:='UP_DT_MAN_PREMIA_BUFF_INS_EX_1';
               GetId_order_itemSP:=TpFibStoredProc.Create(nil);
               GetId_order_itemSP.Database:=WorkDatabase;
               GetId_order_itemSP.Transaction:=WriteTransaction;
               GetId_order_itemSP.StoredProcName:='UP_KER_GET_NEW_ID_ORDER_ITEM';

               for i:=0 to GetFilterDS.RecordCount-1 do
               begin
                    //Добавляем данные в буфферные таблицы по шапке
                    GetId_order_itemSP.Prepare;
                    GetId_order_itemSP.ParamByName('KEY_SESSION').AsInt64:=self.Key_session;
                    GetId_order_itemSP.ParamByName('NOTE').Value         :=NULL;
                    GetId_order_itemSP.ParamByName('NUM_ITEM').Value     :=self.base_num_item;
                    GetId_order_itemSP.ParamByName('NUM_SUB_ITEM').Value :=self.base_num_sub_item;
                    GetId_order_itemSP.ParamByName('ID_ORDER').AsInt64   :=self.IdOrder;
                    GetId_order_itemSP.ParamByName('ID_ORDER_TYPE').Value:=self.id_order_type;
                    if IdType.ItemIndex=0 then
                    GetId_order_itemSP.ParamByName('REASON').Value       :='' //NULL;
                    else
                    begin
                        GetId_order_itemSP.ParamByName('REASON').Value       :='Заява '+GetFilterDS.FieldByName('FAMILIA').AsString;
                        if GetFilterDS.FieldByName('IMYA').AsString<>'' then
                        GetId_order_itemSP.ParamByName('REASON').Value       :=GetId_order_itemSP.ParamByName('REASON').Value+' '+copy(GetFilterDS.FieldByName('IMYA').AsString,1,1)+'.';
                        if GetFilterDS.FieldByName('OTCHESTVO').AsString<>'' then
                        GetId_order_itemSP.ParamByName('REASON').Value       :=GetId_order_itemSP.ParamByName('REASON').Value+' '+copy(GetFilterDS.FieldByName('OTCHESTVO').AsString,1,1)+'.';
                    end;

                    if (self.only_save_in_buff=1)
                    then GetId_order_itemSP.ParamByName('LINKTO').Value  :=Self.ItemLinkTo
                    else GetId_order_itemSP.ParamByName('LINKTO').Value  :=NULL;

                    GetId_order_itemSP.ExecProc;

                    id_order_item :=GetId_order_itemSP.FieldByName('ID_ITEM').AsInt64;

                    //Нарашиваем информацию по номеру подпункта
                    self.base_num_sub_item:=self.base_num_sub_item+1;

                    DecodeDate(Date, y, m, d);

                    //Добавляем данные в буфферные таблицы по основыным данным
                    InsertBuffer.Prepare;
                    InsertBuffer.ParamByName('KEY_SESSION').AsInt64 := self.Key_session;
                    InsertBuffer.ParamByName('DATE_BEG').Value := DateStart.Date;
                    InsertBuffer.ParamByName('DATE_END_in').Value := EncodeDate(YearOf(DateStart.Date), MonthOf(DateStart.Date), DaysInMonth(DateStart.Date));
                    InsertBuffer.ParamByName('ID_MAN_MOVING').AsInt64 := StrToInt64(GetFilterDS.FieldByName('ID_MAN_MOVING').AsString);
                    InsertBuffer.ParamByName('NUM_ITEM').Value := self.base_num_item;
                    InsertBuffer.ParamByName('NUM_SUB_ITEM').Value := self.base_num_sub_item;
                    InsertBuffer.ParamByName('PERCENT').Value := Percent.Text;
                    InsertBuffer.ParamByName('ID_ORDER_ITEM').asInt64 := id_order_item;
                    InsertBuffer.ParamByName('ID_ORDER').AsInt64 := self.IdOrder;
                    InsertBuffer.ParamByName('ID_RAISE').Value := IdRaise.Value;
                    InsertBuffer.ParamByName('ID_ORDER_TYPE').Value := self.id_order_type;
                    InsertBuffer.ParamByName('SOVM_ID_DEPARTMENT').Value := GetFilterDS['ID_DEPARTMENT'];
                    InsertBuffer.ParamByName('SOVM_ID_POST_SALARY').Value := NULL;
                    InsertBuffer.ParamByName('SOVM_ID_TYPE_POST').Value := NULL;
                    InsertBuffer.ParamByName('SOVM_KOEFF_PPS').Value := NULL;
                    InsertBuffer.ParamByName('SOVM_ID_PCARD').Value := NULL;
                    InsertBuffer.ParamByName('ID_CALC_TYPE').Value := 2;
                    InsertBuffer.ParamByName('IS_PERCENT').Value := Integer(RadioButton1.checked);
                    InsertBuffer.ExecProc;

                    GetFilterDS.Next;
               end;

               WriteTransaction.Commit;
               SendMessage(outer_hwnd,FMAS_MESS_ITEM_INFO_CHANGED,0,0);
               GetId_order_itemSP.Close;
               GetId_order_itemSP.Free;

               InsertBuffer.Close;
               InsertBuffer.Free;
    end;
    GetFilterDS.Close;
    GetFilterDS.Free;
end;


procedure TfmPremiaOrder.GetData;
  var IdOrderItem:Int64;
begin
     IdOrderItem:=-1;
     if SmetsDataSet.Active then SmetsDataSet.Close;

     if MainOrderDataSet.Active
     then begin
               if MainOrderDataSet.RecordCount>0 then IdOrderItem:=StrToInt64(MainOrderDataSet.FieldByName('Id_order_item').AsString);
               MainOrderDataSet.Close;
     end
     else IdOrderItem:=-1;

     if (self.EditMode=0) //Добавление
     then begin
               MainOrderDataSet.SelectSQL.Text:='SELECT * FROM UP_DT_MAN_PREMIA_BUFF_SEL('+IntToStr(self.Key_session)+',-1)';
     end;

     if (self.EditMode=1) //Редактирование
     then begin
               MainOrderDataSet.SelectSQL.Text:='SELECT * FROM UP_DT_MAN_PREMIA_BUFF_SEL('+IntToStr(self.Key_session)+',-1)';
     end;

     if (self.EditMode=2) //Только просмотр
     then begin
               MainOrderDataSet.SelectSQL.Text:='SELECT * FROM UP_DT_MAN_PREMIA_BUFF_SEL('+IntToStr(self.Key_session)+',-1)';
     end;

     if (self.EditMode=3) //Редактирование на основании id_item и key_session
     then begin
               MainOrderDataSet.SelectSQL.Text:='SELECT * FROM UP_DT_MAN_PREMIA_BUFF_SEL('+IntToStr(self.Key_session)+','+IntToStr(self.EditIdOrderItem)+')';
     end;


     MainOrderDataSet.Open;
     MainOrderDataSet.FetchAll;

     MainOrderDataSet.Locate('Id_order_item',IdOrderItem,[]);


     SmetsDataSet.SelectSQL.Text:='SELECT * FROM  UP_DT_MAN_PREMIA_SMET_BUFF_SEL(?ID_ORDER_ITEM,'+IntToStr(self.Key_session)+')';
     SmetsDataSet.Open;

     SalarySmDataSet.SelectSQL.Text:='SELECT * FROM UP_DT_MAN_PREMIA_BUFF_SM_SEL(?ID_ORDER_ITEM,'+IntToStr(self.Key_session)+')';
     SalarySmDataSet.Open;

     SmView.ViewData.Expand(true);

     SalaryView.ViewData.Expand(true);
end;

procedure TfmPremiaOrder.CreateBuffInfoByIdItem;
var StoredProc:TpFibStoredProc;
begin
     //Создаем новый пункт приказа в буфферной таблице
     StoredProc            :=TpFibStoredProc.Create(nil);
     StoredProc.Database   :=WorkDatabase;
     StoredProc.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     StartHistory(WriteTransaction);
     StoredProc.StoredProcName:='UP_KER_GET_NEW_ID_ORDER_ITEM_EX';
     StoredProc.Prepare;
     StoredProc.ParamByName('KEY_SESSION').AsInt64      :=self.Key_session;
     StoredProc.ParamByName('OLD_ID_ORDER_ITEM').AsInt64:=self.EditIdOrderItem;
     StoredProc.ExecProc;
     StoredProc.Close;

     StoredProc.StoredProcName:='UP_DT_MAN_PREMIA_CREATE_INFO';
     StoredProc.Prepare;
     StoredProc.ParamByName('KEY_SESSION').AsInt64      :=self.Key_session;
     StoredProc.ParamByName('OLD_ID_ORDER_ITEM').AsInt64:=self.EditIdOrderItem;
     StoredProc.ExecProc;


     WriteTransaction.Commit;

     if (StoredProc.ParamByName('PERCENTOUT').Value=null)
     then begin
               RadioButton2.Checked:=true;
               Percent.Text :='';


     end
     else begin
               RadioButton1.Checked:=true;
               Percent.Text:=StoredProc.ParamByName('PERCENTOUT').Value;


     end;
     IdType.ItemIndex       :=StoredProc.ParamByName('ID_TYPE').Value-1;
     IdRaise.Value      :=StoredProc.ParamByName('ID_RAISEOUT').Value;
     IdRaise.DisplayText:=StoredProc.ParamByName('RASE_NAME').ASString;

     if IdType.ItemIndex=1 Then IsPercentBox.Visible:=False
                           Else IsPercentBox.Visible:=True;

     ID_CALC_TYPE:=StoredProc.ParamByName('ID_CALC_TYPE').Value;



     StoredProc.Close;
     StoredProc.Free;
end;

procedure TfmPremiaOrder.OkButtonClick(Sender: TObject);
begin
     if self.EditMode in [0,1]
     then begin
               dxErrorButton.Visible:=ivNever;
               if CheckData
               then begin
                         if SaveData
                         then begin
                                   agShowMessage('Інформація по наказу успішно збережена!');
                                   if not LocalasFrame
                                   then
                                   begin
                                       if (IdRaise.DisplayText<>'') then
                                       ModalResult:=mrOk;
                                   end
                                   else SendMessage(outer_hwnd,FMAS_MESS_SAVE_ITEM_OK,0,0);
                         end
                         else begin
                                   agShowMessage('Знайдені помилки під час проведення наказу через ядро системи!');
                                   ShowErrors;
                                   GetData;
                         end
               end
               else agShowMessage('Знайдені помилки в інформації по наказу!');
     end
     else
     begin
         if (IdRaise.DisplayText<>'') then
         ModalResult:=mrOk;
     end;
end;

function TfmPremiaOrder.CheckData: Boolean;
begin
     //Необходимо проверить на корректность данные в буфферах
     Result:=true;
end;

function TfmPremiaOrder.SaveData: Boolean;
 var i:Integer;
     ExistErrors:Boolean;
begin
     ExistErrors:=false;

     if (MainOrderDataSet.RecordCount>0)
     then begin
               WriteTransaction.StartTransaction;
               StartHistory(WriteTransaction);
               MainOrderDataSet.First;

               for i:=0 to MainOrderDataSet.RecordCount-1 do
               begin
                    if AddNewItem(VarAsType(MainOrderDataSet['ID_ORDER_ITEM'],varInt64)) //Сохраняем информацию по пункту
                    then
                    else begin
                              showmessage('s1');
                              GetErrorTexts(VarAsType(MainOrderDataSet['ID_ORDER_ITEM'],varInt64));
                              ExistErrors:=true;
                              Break;
                              showmessage('s2');
                    end;
                    MainOrderDataSet.Next;
               end;

               if ExistErrors
               then WriteTransaction.Rollback
               else begin
                         WriteTransaction.Commit;
                         if self.EditMode=0 then self.EditMode:=1;
               end;
     end;

     Result:=not ExistErrors;
end;

function TfmPremiaOrder.AddNewItem(id_item:Int64): Boolean;
var AddStru:UP_KERNEL_MODE_STRUCTURE;
begin
     AddStru.AOWNER      :=self;
     AddStru.ID_ORDER    :=self.IdOrder;
     AddStru.ID_ORDER_ITEM_IN    := id_item;
     //StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
     AddStru.KEY_SESSION :=self.Key_session;
     AddStru.DBHANDLE    :=WorkDatabase.Handle;
     AddStru.TRHANDLE    :=WriteTransaction.Handle;
     Result:=UpKernelDo(@AddStru);
end;

procedure TfmPremiaOrder.ShowErrors;
begin
     dxErrorButton.Visible:=ivAlways;

     if not Assigned(ErrorForm)
     then begin
               ErrorForm:=TfrmGetErrors.Create(self);
     end;
     //Показываем ошибки по пункту
     ErrorForm.ShowModal;
end;

procedure TfmPremiaOrder.GetErrorTexts(id_item:int64);
var GetErrorTextsDS:TpFibDataSet;
begin
   GetErrorTextsDS:=TpFibDataSet.Create(self);
   GetErrorTextsDS.Database:=WorkDatabase;
   GetErrorTextsDS.Transaction:=ReadTransaction;
   GetErrorTextsDS.SelectSQL.Text:=' SELECT * FROM UP_KER_UTILS_GET_ORDER_ERRORS('
   +IntToStr(self.Key_session)+','+IntToStr(Id_item)+') ';

  { if (self.EditMode=1)
   then begin
             GetDropErrorDS:=TpFibDataSet.Create(self);
             GetDropErrorDS.Database:=WorkDatabase;
             GetDropErrorDS.Transaction:=ReadTransaction;
             GetDropErrorDS.SelectSQL.Text:=' SELECT * FROM UP_KER_UTILS_GET_ORDER_ERRORS('
             +IntToStr(self.Key_session)+','+MainOrderDataSet.FBN('ID_DROP_ITEM').AsString+') ';
             GetDropErrorDS.Open;
             GetDropErrorDS.FetchAll;
   end;  }

   GetErrorTextsDS.Open;
   GetErrorTextsDS.FetchAll;

   if (GetErrorTextsDS.RecordCount>0)
   then begin

             if Assigned(ErrorForm)
             then begin
                       if TfrmGetErrors(ErrorForm).ErrorTextsMemoryData.Active
                       then TfrmGetErrors(ErrorForm).ErrorTextsMemoryData.Close;

                       TfrmGetErrors(ErrorForm).ErrorTextsMemoryData.CopyStructure(GetErrorTextsDS);
                       TfrmGetErrors(ErrorForm).ErrorTextsMemoryData.LoadFromDataSet(GetErrorTextsDS,GetErrorTextsDS.RecordCount,lmCopy);

             end;
   end;
   GetErrorTextsDS.Close;
   GetErrorTextsDS.Free;
end;

procedure TfmPremiaOrder.SetControls(Enable: Boolean);
begin
      OkButton.Enabled             :=Enable;
      dxAddPositionButton.Enabled  :=Enable;
      dxAddPositionButtonW.Enabled :=Enable;
      dxAddPositionButtonNW.Enabled:=Enable;
      dxDelPositionButton.Enabled  :=Enable;
      dxEditPositionButton.Enabled :=Enable;
      //dxSmAddButton.Enabled        :=Enable;
      //dxSmEditPositionButton.Enabled:=Enable;
      //dxSmDelButton.Enabled        :=Enable;
      dxReasonButton.Enabled       :=Enable;
end;

procedure TfmPremiaOrder.dxSmDelButtonClick(Sender: TObject);
var DeleteSP:TpFibStoredProc;
begin
     if (SmetsDataSet.RecordCount>0)
     then begin
               if (agMessageDlg('Увага!','Ви хочете видалити запис?',mtConfirmation,[mbYes,mbNo])=mrYes)
               then begin
                         DeleteSP:=TpFibStoredProc.Create(self);
                         DeleteSP.Database    :=WorkDatabase;
                         DeleteSP.Transaction :=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         StartHistory(WriteTransaction);
                         DeleteSP.StoredProcName:='UP_DT_MAN_PREMIA_SMET_BUFF_DEL';
                         DeleteSP.Prepare;
                         DeleteSP.ParamByName('ID_REC').asInt64  :=StrToInt64(SmetsDataSet.FieldByName('ID_REC').AsString);
                         DeleteSP.ExecProc;
                         DeleteSP.Close;
                         DeleteSP.Free;
                         WriteTransaction.Commit;
                         GetData;
               end;
     end;
     if (SmetsDataSet.RecordCount=0)
     then begin
                dxSmEditPositionButton.Enabled:=False;
                dxSmDelButton.Enabled         :=False;
     end;
end;

procedure TfmPremiaOrder.dxAddPositionButtonClick(Sender: TObject);
var P:TParamsContainer;
    CPC:Variant;
    PCV:Variant;
    PAD:Variant;
    PC1:Variant;
    CheckDate:TDate;
begin
      if DateStart.Text='' then
      begin
         DateStart.SetFocus;
         DateStart.Style.Color:=clRed;
         agMessageDlg('Увага!', 'Треба обрати дату!', mtInformation, [mbOK]);
         Exit;
      end
      else
        try
          CheckDate:=DateStart.Date;
        except
           DateStart.SetFocus;
           DateStart.Style.Color:=clRed;
           agMessageDlg('Увага!', 'Не вірний формат дати!', mtInformation, [mbOK]);
           Exit;
        end;
      Screen.Cursor:=crHourGlass;

      Panel12.Visible:=true;
      self.Update;
      Application.ProcessMessages;
      //ReportDataView.ViewData.BeginUpdate;
      if IdType.ItemIndex=1 then Percent.Text:='';
      IdRaise.Blocked:=True;
      //Запускаем фильтр для работы
      PC.InParams.Items['AOwner']        :=@self;
      PC.InParams.Items['DbHandle']      :=PInteger(@WorkDatabase.Handle);
      PC.InParams.Items['Id_User']       :=PInteger(@id_user);
      PC.InParams.Items['Id_order_type'] :=PInteger(@id_order_type);
      PC.InParams.Items['KEY_SESSION']   :=PInt64(@Key_session);

      //Проверка блока связанного с предустановками фильтра
      P:=TParamsContainer.Create(true);
      CPC:=1;
      PCV:=1;
      PAD:=Date;
      PC1:=299;
      P.Items['CHECK_ID_WORK_REASON']:=PVariant(@CPC);
      P.Items['ID_WORK_REASON']      :=PVariant(@PCV);
      P.Items['CHECK_MMDATE_VALUE']  :=PVariant(@CPC);
      P.Items['MMDATE_VALUE']        :=PVariant(@PAD);
      P.Items['CHECK_CATEGORY_VALUE']:=PVariant(@CPC);
      P.Items['CATEGORY_VALUE']      :=PVariant(@PC1);
      (PC as IFMASFilterControl).SetFilterParams(P);

      (PC as IFMASTemporaryDataStorage).ClearTmpData;

      (PC as IFMASModule).Run;

      if (PInteger(PC.OutParams.Items['Count'])^)=0
      then begin
                agMessageDlg('Увага!', 'За встановленими настройками фільтра не знайдено жодної позиції! Спробуйте ще раз!', mtInformation, [mbOk]);
      end;

      if (PInteger(PC.OutParams.Items['Count'])^)>0
      then begin
                //Загружаем данные из результатов работы фильтра
                LoadDataFromFilter;

                GetData;

                if (MainOrderDataSet.RecordCount>0)
                then begin
                          SetControls(true);


                          if (Id_Calc_Type=4)
                          then begin
                                  //  ExtInfoButton.Enabled:=true;
                                  //  TabSheet2.TabVisible :=true;
                          end;
                          if (Id_Calc_Type<>2)
                          then begin
                                    //dxSmAddButton.Enabled:=true;
                                    //dxSmEditPositionButton.Enabled:=true;
                                    //dxSmDelButton.Enabled:=true;
                          end;
                end;
      end;
      Screen.Cursor:=crDefault;
      //ReportDataView.ViewData.EndUpdate;
      Panel12.Visible:=False;
      //Application.ProcessMessages;
end;

procedure TfmPremiaOrder.dxDelPositionButtonClick(Sender: TObject);
var DeleteSP:TpFibStoredProc;
begin
     if (MainOrderDataSet.RecordCount>0)
     then begin
               if (agMessageDlg('Увага!','Ви хочете видалити запис?',mtConfirmation,[mbYes,mbNo])=mrYes)
               then begin
                         DeleteSP:=TpFibStoredProc.Create(self);
                         DeleteSP.Database    :=WorkDatabase;
                         DeleteSP.Transaction :=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         StartHistory(WriteTransaction); 
                         DeleteSP.StoredProcName:='UP_DT_MAN_PREMIA_BUFF_DEL';
                         DeleteSP.Prepare;
                         DeleteSP.ParamByName('KEY_SESSION').asInt64  :=self.Key_session;
                         DeleteSP.ParamByName('ID_ORDER_ITEM').AsInt64:=StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                         DeleteSP.ExecProc;
                         DeleteSP.Close;
                         DeleteSP.Free;
                         WriteTransaction.Commit;
                        
                         GetData;

                         if (MainOrderDataSet.RecordCount=0)
                         then begin
                                    //SetControls(false);
                                    IdRaise.Blocked:=False;
                                    IdType.Enabled:=False;
                                    LabelIdType.Left:=3;
                                    LabelIdType.Caption:='* Тип:';
                                    OkButton.Enabled:=False;

                                    OkButton.Enabled             :=False;
                                    dxAddPositionButton.Enabled  :=True;
                                    dxAddPositionButtonW.Enabled :=True;
                                    dxAddPositionButtonNW.Enabled:=True;
                                    dxDelPositionButton.Enabled  :=False;
                                    dxEditPositionButton.Enabled :=False;
                                    dxSmAddButton.Enabled        :=False;
                                    dxSmEditPositionButton.Enabled:=False;
                                    dxSmDelButton.Enabled        :=False;
                                    dxReasonButton.Enabled       :=False;


                         end;
               end;
     end;
end;

procedure TfmPremiaOrder.dxEditPositionButtonClick(Sender: TObject);
var UpdateSP:TpFibStoredProc;  i, rnd_value:integer;
begin
     with  TfrmEditPeriod.Create(self) do
     begin
           DateBeg.Date:=MainOrderDataSet.FieldByName('DATE_BEG').Value;
           DateEnd.Date:=MainOrderDataSet.FieldByName('DATE_END').Value;
           Per_Department.Value:=MainOrderDataSet.FieldByName('ID_DEPARTMENT').Value;
           if not(VarIsNull(MainOrderDataSet.FieldByName('NAME_DEPARTMENT').Value)) then
           Per_Department.DisplayText:=MainOrderDataSet.FieldByName('NAME_DEPARTMENT').ASString;

           if ShowModal=mrOk
           then begin
                     Panel12.Visible:=true;
                     Screen.Cursor:=crHourGlass;
                     self.Update;
                     Application.ProcessMessages;
                     if EditForAllPeriod.Checked
                     then begin
                               MainOrderDataSet.First;
                               UpdateSP:=TpFibStoredProc.Create(self);
                               UpdateSP.Database    :=WorkDatabase;
                               UpdateSP.Transaction :=WriteTransaction;
                               WriteTransaction.StartTransaction;
                               StartHistory(WriteTransaction);
                               for i:=0 to MainOrderDataSet.RecordCount-1 do
                               begin
                                     UpdateSP.StoredProcName:='UP_DT_MAN_PREMIA_BUFF_UPD_DATES';
                                     UpdateSP.Prepare;
                                     UpdateSP.ParamByName('KEY_SESSION').asInt64  :=self.Key_session;
                                     UpdateSP.ParamByName('DATE_BEG').Value       :=DateBeg.Date;
                                     UpdateSP.ParamByName('DATE_END').Value       :=DateEnd.Date;
                                     UpdateSP.ParamByName('ID_DEPARTMENT').Value  :=Per_Department.Value;
                                     UpdateSP.ParamByName('ID_ORDER_ITEM').AsInt64:=StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                                     UpdateSP.ExecProc;
                                     UpdateSP.Close;
                                     MainOrderDataSet.Next;
                               end;
                               UpdateSP.Free;
                               WriteTransaction.Commit;
                     end
                     else begin
                               UpdateSP:=TpFibStoredProc.Create(self);
                               UpdateSP.Database    :=WorkDatabase;
                               UpdateSP.Transaction :=WriteTransaction;
                               WriteTransaction.StartTransaction;
                               StartHistory(WriteTransaction);
                               UpdateSP.StoredProcName:='UP_DT_MAN_PREMIA_BUFF_UPD_DATES';
                               UpdateSP.Prepare;
                               UpdateSP.ParamByName('KEY_SESSION').asInt64  :=self.Key_session;
                               UpdateSP.ParamByName('DATE_BEG').Value       :=DateBeg.Date;
                               UpdateSP.ParamByName('DATE_END').Value       :=DateEnd.Date;
                               UpdateSP.ParamByName('ID_DEPARTMENT').Value  :=Per_Department.Value;
                               UpdateSP.ParamByName('ID_ORDER_ITEM').AsInt64:=StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                               UpdateSP.ExecProc;
                               UpdateSP.Close;
                               UpdateSP.Free;
                               WriteTransaction.Commit;
                     end;

                     if EditForRecalc.Checked
                     then begin
                               UpdateSP:=TpFibStoredProc.Create(self);
                               UpdateSP.Database    :=WorkDatabase;
                               UpdateSP.Transaction :=WriteTransaction;
                               WriteTransaction.StartTransaction;
                               StartHistory(WriteTransaction);
                               UpdateSP.StoredProcName:='UP_DT_MAN_PREMIA_RECALC';
                               UpdateSP.Prepare;
                               UpdateSP.ParamByName('KEY_SESSION').asInt64  :=self.Key_session;
                               UpdateSP.ParamByName('SUMMA_RECALC').AsExtended       :=RecalcEdit.Value;
                               UpdateSP.ExecProc;
                               UpdateSP.Close;
                               UpdateSP.Free;
                               WriteTransaction.Commit;
                    end;

                     if EditForRound.Checked
                     then begin
                               UpdateSP:=TpFibStoredProc.Create(self);
                               UpdateSP.Database    :=WorkDatabase;
                               UpdateSP.Transaction :=WriteTransaction;
                               WriteTransaction.StartTransaction;
                               StartHistory(WriteTransaction);
                               UpdateSP.StoredProcName:='UP_DT_MAN_PREMIA_ROUND';
                               UpdateSP.Prepare;
                               UpdateSP.ParamByName('KEY_SESSION').asInt64  :=self.Key_session;
                               rnd_value:=RndComboBox.ItemIndex;
                               if rnd_value=-1 then rnd_value:=0;
                               UpdateSP.ParamByName('RND').AsInteger        :=rnd_value;
                               UpdateSP.ExecProc;
                               UpdateSP.Close;
                               UpdateSP.Free;
                               WriteTransaction.Commit;
                    end;

                     SendMessage(outer_hwnd,FMAS_MESS_ITEM_INFO_CHANGED,0,0);
                     Screen.Cursor:=crDefault;
                     Panel12.Visible:=False;
                     GetData;
           end;
          Free;
     end;
end;

procedure TfmPremiaOrder.dxReasonButtonClick(Sender: TObject);
var UpdateSP:TpFibStoredProc;
    i:Integer;
begin
     with  TfrmReasonForm.Create(self) do
     begin
           Reason.Text:=MainOrderDataSet.FieldByName('REASON').AsString;
           Note.Lines.Text  :=MainOrderDataSet.FieldByName('NOTE').AsString;
           if  ShowModal=mrOk
           then begin
                     if EditForAll.Checked
                     then begin
                               MainOrderDataSet.First;
                               UpdateSP:=TpFibStoredProc.Create(self);
                               UpdateSP.Database    :=WorkDatabase;
                               UpdateSP.Transaction :=WriteTransaction;
                               WriteTransaction.StartTransaction;
                               StartHistory(WriteTransaction);
                               for i:=0 to MainOrderDataSet.RecordCount-1 do
                               begin
                                     UpdateSP.StoredProcName:='UP_DT_ORDER_ITEMS_BUFF_UPD_EINF';
                                     UpdateSP.Prepare;
                                     UpdateSP.ParamByName('KEY_SESSION').asInt64  :=self.Key_session;
                                     UpdateSP.ParamByName('NOTE').Value           :=Note.Text;
                                     if VarIsNull(Reason.Text) then Reason.Text:='';
                                     UpdateSP.ParamByName('REASON').Value         :=Reason.Text;
                                     UpdateSP.ParamByName('ID_ITEM').AsInt64      :=StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                                     UpdateSP.ExecProc;
                                     UpdateSP.Close;
                                     MainOrderDataSet.Next;
                               end;
                               UpdateSP.Free;
                               WriteTransaction.Commit;
                     end
                     else begin

                               UpdateSP:=TpFibStoredProc.Create(self);
                               UpdateSP.Database    :=WorkDatabase;
                               UpdateSP.Transaction :=WriteTransaction;
                               WriteTransaction.StartTransaction;
                               StartHistory(WriteTransaction);
                               UpdateSP.StoredProcName:='UP_DT_ORDER_ITEMS_BUFF_UPD_EINF';
                               UpdateSP.Prepare;
                               UpdateSP.ParamByName('KEY_SESSION').asInt64  :=self.Key_session;
                               UpdateSP.ParamByName('NOTE').Value        :=Note.Text;
                               if VarIsNull(Reason.Text) then Reason.Text:='';
                               UpdateSP.ParamByName('REASON').Value      :=Reason.Text;
                               UpdateSP.ParamByName('ID_ITEM').AsInt64:=StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                               UpdateSP.ExecProc;
                               UpdateSP.Close;
                               UpdateSP.Free;
                               WriteTransaction.Commit;
                     end;

                     SendMessage(outer_hwnd,FMAS_MESS_ITEM_INFO_CHANGED,0,0);

                     GetData;
           end;
           Free;
     end;
end;

procedure TfmPremiaOrder.dxErrorButtonClick(Sender: TObject);
begin
     if Assigned(ErrorForm) then ErrorForm.ShowModal;
end;

procedure TfmPremiaOrder.dxSmAddButtonClick(Sender: TObject);
var InsertSP:TpFibStoredProc;
    id_rec:int64;
    i:integer;
begin
     id_rec:=0;
     if (MainOrderDataSet.RecordCount>0)
     then begin
               with TfmChangeSmeta.Create(self) do
               begin
                if RadioButton1.Checked
                   then
                   begin
                       Summa.Visible:=false;
                       Summa.Required:=false;
                   end;
                  if RadioButton2.Checked
                   then
                   begin
                       Summa.Required:=true;
                   end;
                   EditForAllPeople.Visible:=True;
                   EditBudgetForAll.Visible:=False;
                   EditSumaForAll.Visible:=False;

                   if ShowModal=mrOk
                   then begin
                           if EditForAllPeople.Checked
                           then begin
                               MainOrderDataSet.First;
                               InsertSP:=TpFibStoredProc.Create(self);
                               InsertSP.Database    :=WorkDatabase;
                               InsertSP.Transaction :=WriteTransaction;
                               WriteTransaction.StartTransaction;
                               StartHistory(WriteTransaction);
                               for i:=0 to MainOrderDataSet.RecordCount-1 do
                               begin
                                     InsertSP.StoredProcName:='UP_DT_MAN_PREMIA_SMET_BUFF_INS';
                                     InsertSP.Prepare;
                                     InsertSP.ParamByName('KEY_SESSION').asInt64  :=self.Key_session;
                                     InsertSP.ParamByName('ID_SMET').Value        :=Smeta.Value;
                                     InsertSP.ParamByName('SUMMA').Value          :=Summa.Value;
                                     InsertSP.ParamByName('ID_ORDER_ITEM').AsInt64:=StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                                     InsertSP.ParamByName('UPDATE_HSUM').Value    :=1;
                                     InsertSP.ExecProc;
                                     id_rec:=InsertSP.ParamByName('ID_REC').AsInt64;
                                     InsertSP.Close;
                                     MainOrderDataSet.Next;
                               end;
                               InsertSP.Free;
                               WriteTransaction.Commit;
                           end
                           else
                           begin
                              InsertSP:=TpFibStoredProc.Create(self);
                              InsertSP.Database    :=WorkDatabase;
                              InsertSP.Transaction :=WriteTransaction;
                              WriteTransaction.StartTransaction;
                              StartHistory(WriteTransaction);
                              InsertSP.StoredProcName:='UP_DT_MAN_PREMIA_SMET_BUFF_INS';
                              InsertSP.Prepare;

                              InsertSP.ParamByName('KEY_SESSION').asInt64  :=self.Key_session;
                              showmessage('key= '+inttostr(self.Key_session));
                              InsertSP.ParamByName('ID_SMET').Value        :=Smeta.Value;
                              showmessage('smeta= '+inttostr(Smeta.Value));
                              InsertSP.ParamByName('SUMMA').Value          :=Summa.Value;
                              showmessage('Summa= '+vartostr(Summa.Value));
                              InsertSP.ParamByName('ID_ORDER_ITEM').AsInt64:=StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                              showmessage('ID_ORDER_ITEM= '+MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                              InsertSP.ParamByName('UPDATE_HSUM').Value    :=1;
                              InsertSP.ExecProc;
                              id_rec:=InsertSP.ParamByName('ID_REC').AsInt64;

                              InsertSP.Close;
                              InsertSP.Free;
                              WriteTransaction.Commit;
                           end;

                           GetData;
                           if id_rec<>0 then
                           SmetsDataSet.Locate('ID_REC',id_rec,[]);
                    end;
                    Free;
               end;
     end;
     if (SmetsDataSet.RecordCount>0)
     then begin
              dxSmEditPositionButton.Enabled:=True;
              dxSmDelButton.Enabled         :=True;
          end;
end;

procedure TfmPremiaOrder.dxAddPositionButtonNWClick(Sender: TObject);
var
    InsertBuffer:TpFibStoredProc;
    GetId_order_itemSP:TpFibStoredProc;
    id_order_item:Int64;
    y, m, d : Word;
begin
    IdRaise.Blocked:=False;
    //Забираем данные из формы
    with TfrmAddNW.Create(self) do
    begin
        Panel12.Visible:=true;
        Screen.Cursor:=crHourGlass;
        self.Update;
        Application.ProcessMessages;

        if ShowModal=mrOk
        then
        begin
            InsertBuffer:=TpFibStoredProc.Create(nil);
            InsertBuffer.Database:=WorkDatabase;
            InsertBuffer.Transaction:=WriteTransaction;
            WriteTransaction.StartTransaction;
            StartHistory(WriteTransaction);
            InsertBuffer.StoredProcName:='UP_DT_MAN_PREMIA_BUFF_INS_EX';

            GetId_order_itemSP:=TpFibStoredProc.Create(nil);
            GetId_order_itemSP.Database:=WorkDatabase;
            GetId_order_itemSP.Transaction:=WriteTransaction;
            GetId_order_itemSP.StoredProcName:='UP_KER_GET_NEW_ID_ORDER_ITEM';

            //Добавляем данные в буфферные таблицы по шапке
            GetId_order_itemSP.Prepare;
            GetId_order_itemSP.ParamByName('KEY_SESSION').AsInt64:=self.Key_session;
            GetId_order_itemSP.ParamByName('NOTE').Value         :=NULL;
            GetId_order_itemSP.ParamByName('NUM_ITEM').Value     :=self.base_num_item;
            GetId_order_itemSP.ParamByName('NUM_SUB_ITEM').Value :=self.base_num_sub_item;
            GetId_order_itemSP.ParamByName('ID_ORDER').AsInt64     :=self.IdOrder;
            GetId_order_itemSP.ParamByName('ID_ORDER_TYPE').Value:=self.id_order_type;
            if IdType.ItemIndex=0 then
            GetId_order_itemSP.ParamByName('REASON').Value       :='' //NULL;
            else GetId_order_itemSP.ParamByName('REASON').Value  :='Заява ' + FIOText;

            if (self.only_save_in_buff=1)
            then GetId_order_itemSP.ParamByName('LINKTO').Value  :=Self.ItemLinkTo
            else GetId_order_itemSP.ParamByName('LINKTO').Value  :=NULL;

            GetId_order_itemSP.ExecProc;

            id_order_item :=GetId_order_itemSP.FieldByName('ID_ITEM').AsInt64;

            //Нарашиваем информацию по номеру подпункта
            self.base_num_sub_item:=self.base_num_sub_item+1;

            DecodeDate(Date, y, m, d);

            //Добавляем данные в буфферные таблицы по основыным данным
            InsertBuffer.Prepare;

            InsertBuffer.ParamByName('KEY_SESSION').AsInt64        :=self.Key_session;
            InsertBuffer.ParamByName('DATE_BEG').Value             := EncodeDate(y, m, 1);
            d:=DaysInAMonth(y, m);
            InsertBuffer.ParamByName('DATE_END').Value             :=EncodeDate(y, m, d);
            InsertBuffer.ParamByName('ID_MAN_MOVING').Value        :=NULL;
            if IdType.ItemIndex=0 then
            InsertBuffer.ParamByName('PERCENT').Value              :=StrToFloat(Percent.Text);
            InsertBuffer.ParamByName('ID_ORDER_ITEM').asInt64      :=id_order_item;
            InsertBuffer.ParamByName('ID_RAISE').Value             :=IdRaise.Value;
            InsertBuffer.ParamByName('ID_DEPARTMENT').Value        :=Department.Value;
            InsertBuffer.ParamByName('ID_POST_SALARY').Value       :=NULL;
            InsertBuffer.ParamByName('ID_MAN').Value               :=Fio.Value;
            //InsertBuffer.ParamByName('ID_TYPE_LINK_WITH_SM').Value :=Id_Calc_Type;
            InsertBuffer.ExecProc;

            WriteTransaction.Commit;

            GetId_order_itemSP.Close;
            GetId_order_itemSP.Free;

            InsertBuffer.Close;
            InsertBuffer.Free;
            

            GetData;


            if (MainOrderDataSet.RecordCount>0)
            then
            begin
              SetControls(true);
              if (Id_Calc_Type<>2)
              then begin
                        //dxSmAddButton.Enabled:=true;
                        //dxSmEditPositionButton.Enabled:=true;
                        //dxSmDelButton.Enabled:=true;
              end;
            end;
        end;
        Free;
        Panel12.Visible:=false;
        Screen.Cursor:=crDefault;
     end;
end;

procedure TfmPremiaOrder.IdTypeChange(Sender: TObject);
begin
   IdRaise.Blocked:=False;
   LabelIdType.Left:=11;
   LabelIdType.Caption:='Тип:';
   IdRaise.Value:=Null;
   IdRaise.DisplayText:='';
   if IdType.ItemIndex=0 Then IsPercentBox.Visible:=True
                     Else
                     Begin
                         IsPercentBox.Visible:=False;
                         RadioButton2.Checked:=True;
                     End
{   if IdType.Value=2 then
   TfrmReasonForm.Create(self).Note.Lines.Text:='у зв''язку з  відповідно до п.  Положення "Про порядок і умови надання матеріальної допомоги"';
}
end;

procedure TfmPremiaOrder.cxCheckBox1PropertiesChange(Sender: TObject);
begin
     Panel11.Visible:=cxCheckBox1.Checked;
     Splitter3.Visible:=cxCheckBox1.Checked;

     if Panel11.Visible
     then Splitter3.Top:=Panel11.Top-1;
end;

procedure TfmPremiaOrder.dxDelPositionButtonAllClick(Sender: TObject);
var DeleteSP:TpFibStoredProc;
    I:Integer;
begin
    if (MainOrderDataSet.RecordCount>0)
    then begin
               if (agMessageDlg('Увага!','Ви бажаете видалити всі записи?',mtConfirmation,[mbYes,mbNo])=mrYes)
               then begin
                         Panel12.Visible:=true;
                         Screen.Cursor:=crHourGlass;
                         self.Update;
                         Application.ProcessMessages;
                         MainOrderDataSet.First;
                         for i:=0 to MainOrderDataSet.RecordCount-1 do
                         begin
                              DeleteSP:=TpFibStoredProc.Create(self);
                              DeleteSP.Database    :=WorkDatabase;
                              DeleteSP.Transaction :=WriteTransaction;
                              WriteTransaction.StartTransaction;
                              StartHistory(WriteTransaction);
                              DeleteSP.StoredProcName:='UP_DT_MAN_PREMIA_BUFF_DEL';
                              DeleteSP.Prepare;
                              DeleteSP.ParamByName('KEY_SESSION').asInt64  :=self.Key_session;
                              DeleteSP.ParamByName('ID_ORDER_ITEM').AsInt64:=StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                              DeleteSP.ExecProc;
                              DeleteSP.Close;
                              DeleteSP.Free;
                              WriteTransaction.Commit;
                              MainOrderDataSet.Next;
                         end;
                         Panel12.Visible:=false;
                         Screen.Cursor:=crDefault;
                         GetData;

                         if (MainOrderDataSet.RecordCount=0)
                         then begin
                                  IdRaise.Blocked:=False;
                                  IdType.Enabled:=False;
                                  LabelIdType.Left:=3;
                                  LabelIdType.Caption:='* Тип:';
                                  OkButton.Enabled:=False;
                                  
                                  OkButton.Enabled             :=False;
                                  dxAddPositionButton.Enabled  :=True;
                                  dxAddPositionButtonW.Enabled :=True;
                                  dxAddPositionButtonNW.Enabled:=True;
                                  dxDelPositionButton.Enabled  :=False;
                                  dxEditPositionButton.Enabled :=False;
                                  dxSmAddButton.Enabled        :=False;
                                  dxSmEditPositionButton.Enabled:=False;
                                  dxSmDelButton.Enabled        :=False;
                                  dxReasonButton.Enabled       :=False;
                         end;
               end;
     end;
end;

procedure TfmPremiaOrder.dxSmDelButtonAllClick(Sender: TObject);
 var DeleteSP:TpFibStoredProc;
    I:Integer;
begin
    Panel12.Visible:=true;
    Screen.Cursor:=crHourGlass;
    self.Update;
    Application.ProcessMessages;

    if (SmetsDataSet.RecordCount>0)
    then begin
               if (agMessageDlg('Увага!','Ви бажаете видалити всі записи?',mtConfirmation,[mbYes,mbNo])=mrYes)
               then begin
                         SmetsDataSet.First;
                         for i:=0 to SmetsDataSet.RecordCount-1 do
                         begin
                              DeleteSP:=TpFibStoredProc.Create(self);
                              DeleteSP.Database    :=WorkDatabase;
                              DeleteSP.Transaction :=WriteTransaction;
                              WriteTransaction.StartTransaction;
                              StartHistory(WriteTransaction);
                              DeleteSP.StoredProcName:='UP_DT_MAN_PREMIA_SMET_BUFF_DEL';
                              DeleteSP.Prepare;
                              DeleteSP.ParamByName('ID_REC').asInt64  :=StrToInt64(SmetsDataSet.FieldByName('ID_REC').AsString);
                              DeleteSP.ExecProc;
                              DeleteSP.Close;
                              DeleteSP.Free;
                              WriteTransaction.Commit;
                              SmetsDataSet.Next;
                         end;

                         GetData;
               end;
     end;
     Panel12.Visible:=false;
     Screen.Cursor:=crDefault;
end;

procedure TfmPremiaOrder.dxSummButtonClick(Sender: TObject);
begin
//
end;

procedure TfmPremiaOrder.RadioButton1Click(Sender: TObject);
var UpdateRaise:TpFibStoredProc;
begin
    Percent.TabStop:=True;
    if MainOrderDataSet.Active  and (EditMode in [0,1]) and (Percent.Text<>'0') and (Percent.Text<>'')
    then begin
              if MainOrderDataSet.RecordCount>0
              then begin
                        if update_raise_info
                        then begin
                                  UpdateRaise:=TpFibStoredProc.Create(self);
                                  UpdateRaise.Database:=WorkDatabase;
                                  UpdateRaise.Transaction:=WriteTransaction;
                                  WriteTransaction.StartTransaction;
                                  StartHistory(WriteTransaction);
                                  UpdateRaise.StoredProcName:='UP_DT_MAN_PREMIA_BUFF_UPD_RAISE';
                                  UpdateRaise.Prepare;

                                  UpdateRaise.ParamByName('KEY_SESSION').AsInt64:=self.Key_session;
                                  if RadioButton1.Checked
                                  then begin
                                            UpdateRaise.ParamByName('PERCENT').Value      :=StrToFloat(Percent.Text);
                                  end
                                  else begin
                                            UpdateRaise.ParamByName('PERCENT').Value      :=NULL;
                                  end;
                                  UpdateRaise.ParamByName('ID_RAISE').Value     :=IdRaise.Value;
                                  if (MainOrderDataSet.RecordCount>0)
                                  then UpdateRaise.ParamByName('ID_ORDER_ITEM').AsInt64:=StrToInt64(MainOrderDataSet.FBN('ID_ORDER_ITEM').AsString)
                                  else UpdateRaise.ParamByName('ID_ORDER_ITEM').Value  :=null;

                                  UpdateRaise.ExecProc;
                                  UpdateRaise.Close;
                                  WriteTransaction.Commit;

                                  //SendMessage(outer_hwnd,FMAS_MESS_ITEM_INFO_CHANGED,0,0);

                                  UpdateRaise.Free;
                        end;
              end;

              GetData;
    end;
     if (SmetsDataSet.RecordCount=0)
     then begin
                dxSmEditPositionButton.Enabled:=False;
                dxSmDelButton.Enabled         :=False;
     end;
end;

procedure TfmPremiaOrder.RadioButton2Click(Sender: TObject);
var UpdateRaise:TpFibStoredProc;
begin
    Percent.TabStop:=False;
    if MainOrderDataSet.Active and (EditMode in [0,1])
    then begin
              if MainOrderDataSet.RecordCount>0
              then begin
                        if update_raise_info
                        then begin
                                  UpdateRaise:=TpFibStoredProc.Create(self);
                                  UpdateRaise.Database:=WorkDatabase;
                                  UpdateRaise.Transaction:=WriteTransaction;
                                  WriteTransaction.StartTransaction;
                                  StartHistory(WriteTransaction);
                                  UpdateRaise.StoredProcName:='UP_DT_MAN_PREMIA_BUFF_UPD_RAISE';
                                  UpdateRaise.Prepare;

                                  UpdateRaise.ParamByName('KEY_SESSION').AsInt64:=self.Key_session;
                                  if RadioButton1.Checked
                                  then begin
                                            UpdateRaise.ParamByName('PERCENT').Value      :=StrToFloat(Percent.Text);
                                  end
                                  else begin
                                            UpdateRaise.ParamByName('PERCENT').Value      :=NULL;
                                  end;
                                  UpdateRaise.ParamByName('ID_RAISE').Value     :=IdRaise.Value;

                                  if (MainOrderDataSet.RecordCount>0)
                                  then UpdateRaise.ParamByName('ID_ORDER_ITEM').AsInt64:=StrToInt64(MainOrderDataSet.FBN('ID_ORDER_ITEM').AsString)
                                  else UpdateRaise.ParamByName('ID_ORDER_ITEM').Value  :=null;

                                  UpdateRaise.ExecProc;
                                  UpdateRaise.Close;
                                  WriteTransaction.Commit;

                                  //SendMessage(outer_hwnd,FMAS_MESS_ITEM_INFO_CHANGED,0,0);

                                  UpdateRaise.Free;
                        end;
              end;

              GetData;
     end;
    if (SmetsDataSet.RecordCount=0)
     then begin
                dxSmEditPositionButton.Enabled:=False;
                dxSmDelButton.Enabled         :=False;
     end;


end;


procedure TfmPremiaOrder.ReportDataViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
       if MainOrderDataSet.RecordCount>0
       then begin
           if (((Key=VK_F2) or (Key=VK_RETURN)) and (dxEditPositionButton.Enabled))
           then dxEditPositionButton.Click;

           if ((Key=VK_INSERT) and (dxAddPositionButton.Enabled))
           then dxAddPositionButton.Click;

           if ((Key=VK_DELETE) and (dxDelPositionButton.Enabled))
           then dxDelPositionButton.Click;

           if ((Key=ord('P')) and ((GetAsyncKeyState(VK_CONTROL) and $8000) <> 0)
               and (dxErrorButton.Enabled)) then dxReasonButton.Click;

           if ((Key=ord('E')) and ((GetAsyncKeyState(VK_CONTROL) and $8000) <> 0)
               and (dxErrorButton.Enabled) and (dxErrorButton.Visible=ivAlways))
           then dxErrorButton.Click;

           if ((Key=ord('L')) and ((GetAsyncKeyState(VK_CONTROL) and $8000) <> 0)
               and (dxCloneButton.Enabled) and (dxCloneButton.Visible=ivAlways)
               and (Panel10.Visible))
           then dxCloneButton.Click;

           if (( Key = VK_F12) and (ssShift in Shift))
           then ShowInfo(MainOrderDataSet);
     end;
end;

procedure TfmPremiaOrder.SmViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If SmetsDataSet.RecordCount>0
     Then
     Begin
         If ((Key=VK_INSERT) and (dxSmAddButton.Enabled))
         Then dxSmAddButton.Click;

         If ((Key=VK_DELETE) and (dxSmDelButton.Enabled))
         Then dxSmDelButton.Click;

         If ((Key=VK_F2) and (dxSmEditPositionButton.Enabled))
         Then dxSmEditPositionButton.Click;

         If ((Key=VK_RETURN) and (dxSmEditPositionButton.Enabled))
         Then dxSmEditPositionButton.Click;

         If (( Key = VK_F12) and (ssShift in Shift))
         Then ShowInfo(SmetsDataSet);
     End
end;

procedure TfmPremiaOrder.SalaryViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if SalarySmDataSet.RecordCount>0
     then
        if (( Key = VK_F12) and (ssShift in Shift)) then ShowInfo(SalarySmDataSet);
end;

procedure TfmPremiaOrder.IdTypeClick(Sender: TObject);
begin
   IdRaise.Blocked:=False;
   LabelIdType.Left:=11;
   LabelIdType.Caption:='Тип:';
   IdRaise.Value:=Null;
   IdRaise.DisplayText:='';
   if IdType.ItemIndex=0 Then IsPercentBox.Visible:=True
                     Else
                     Begin
                         IsPercentBox.Visible:=False;
                         RadioButton2.Checked:=True;
                     End
end;

procedure TfmPremiaOrder.PercentKeyPress(Sender: TObject;
  var Key: Char);
var p, FPrecision, FBase:integer;
    FText:string;
begin
    FPrecision:=2;  FBase:=9;
    FText:='100,00';
    Case key of
      '0'..'9': Begin
                   //длина текста не более Основания+Точности+1 символа разделителя(,.)
                   p := Pos('.', Percent.Text);
                   If p = 0 Then p := Pos(',', Percent.Text);

                   If ( p = 0 ) and (Length(Percent.Text)>=FBase) Then Key := #0;

                   If ( p <> 0 ) and ((Length(Percent.Text)-p)>=FPrecision) and (Percent.SelStart >=p)
                   Then Key := #0;

                   If ( p <> 0 ) and (p-1>=FBase) and (Percent.SelStart < p)
                   Then Key := #0;
               End;

      #8:  Begin // забой
              If Length(Percent.Text)-Length(Percent.SelText)=0 Then
              Begin
                  Percent.Text:=FText;
                  Percent.SelStart:=0;
              End
              Else
                 Begin
                     p := Pos('.', Percent.Text);
                     If p = 0 Then p := Pos(',', Percent.Text);

                     //после удаления точки, не окажется ли  FBase больше, чем задано
                     //проверяем:1)разделитель в тексте есть; 2) пытаются удалить именно разделитель (или
                     //текст с разделителем); 3)число символов без удаляемого теста
                     //с разделителем не превышает FBase
                     If (p<>0) and ((Pos(',', Percent.SelText)<>0) or (Pos('.', Percent.SelText)<>0) or
                        ((Percent.Text[p]=',') or (Percent.Text[p]='.')))
                        and ((Length(Percent.Text)-Length(Percent.SelText))>FBase)
                     Then  Key := #0;
                 End;
             End;
      '.', ',': Begin
                    Key:=DecimalSeparator;
                   //находим первое вхождение ./, в тексте
                   p := Pos('.', Percent.Text);
                   If p = 0 Then p := Pos(',', Percent.Text);

                   //если ./, уже есть в тексте, то больше не надо ее вводить!
                   If ( p <> 0 ) and ( Key in ['.', ','] ) Then Key := #0;

                   //если ./, в тексте нет, и  Key=./,, но запятую хотят поставить в таком месте,
                   //где точность больше  FPrecision, то не надо ./, ставить
                   If ( p = 0 ) and ( Key in ['.', ','] ) and
                      ( Length(Percent.Text) - Percent.SelStart > FPrecision )
                      Then Key := #0;
                End
                Else key:=#0;
    End;
    
 {   if MainOrderDataSet.Active and  RadioButton1.Checked and (EditMode in [0,1]) and (Percent.Text<>'0') and (Percent.Text<>'')
    then begin
              if (MainOrderDataSet.RecordCount>0)
              then begin
                        UpdateRaise:=TpFibStoredProc.Create(self);
                        UpdateRaise.Database:=WorkDatabase;
                        UpdateRaise.Transaction:=WriteTransaction;
                        WriteTransaction.StartTransaction;
                        StartHistory(WriteTransaction);
                        UpdateRaise.StoredProcName:='UP_DT_MAN_PREMIA_BUFF_UPD_RAISE';
                        UpdateRaise.Prepare;

                        UpdateRaise.ParamByName('KEY_SESSION').AsInt64:=self.Key_session;
                        if RadioButton1.Checked
                        then begin
                                  UpdateRaise.ParamByName('PERCENT').Value      :=StrToFloat(Percent.Text);
                        end
                        else begin
                                  UpdateRaise.ParamByName('PERCENT').Value      :=NULL;
                        end;
                        UpdateRaise.ParamByName('ID_RAISE').Value     :=IdRaise.Value;

                        if (MainOrderDataSet.RecordCount>0)
                        then UpdateRaise.ParamByName('ID_ORDER_ITEM').AsInt64:=StrToInt64(MainOrderDataSet.FBN('ID_ORDER_ITEM').AsString)
                        else UpdateRaise.ParamByName('ID_ORDER_ITEM').Value  :=null;

                        UpdateRaise.ExecProc;
                        UpdateRaise.Close;
                        WriteTransaction.Commit;

                        //SendMessage(outer_hwnd,FMAS_MESS_ITEM_INFO_CHANGED,0,0);

                        UpdateRaise.Free;
              end;
              GetData;
     end;  }
end;

procedure TfmPremiaOrder.PercentPropertiesChange(Sender: TObject);
var UpdateRaise:TpFibStoredProc;
begin
     If Length(Percent.Text)-Length(Percent.SelText)=0 Then
      Begin
          Percent.Text:='100,00';
          Percent.SelStart:=0;
      End;
 {   If ((Percent.Text='') or (Percent.Text='0'))
    Then Percent.Text:='100';
                                }
    if MainOrderDataSet.Active and  RadioButton1.Checked and (EditMode in [0,1]) and (Percent.Text<>'0') and (Percent.Text<>'')
    then begin
              if (MainOrderDataSet.RecordCount>0)
              then begin
                        UpdateRaise:=TpFibStoredProc.Create(self);
                        UpdateRaise.Database:=WorkDatabase;
                        UpdateRaise.Transaction:=WriteTransaction;
                        WriteTransaction.StartTransaction;
                        StartHistory(WriteTransaction);
                        UpdateRaise.StoredProcName:='UP_DT_MAN_PREMIA_BUFF_UPD_RAISE';
                        UpdateRaise.Prepare;
                        UpdateRaise.ParamByName('KEY_SESSION').AsInt64:=self.Key_session;
                        if RadioButton1.Checked
                        then begin
                                  UpdateRaise.ParamByName('PERCENT').Value      :=StrToFloat(Percent.Text);
                        end
                        else begin
                                  UpdateRaise.ParamByName('PERCENT').Value      :=NULL;
                        end;
                        UpdateRaise.ParamByName('ID_RAISE').Value     :=IdRaise.Value;

                        if (MainOrderDataSet.RecordCount>0)
                        then UpdateRaise.ParamByName('ID_ORDER_ITEM').AsInt64:=StrToInt64(MainOrderDataSet.FBN('ID_ORDER_ITEM').AsString)
                        else UpdateRaise.ParamByName('ID_ORDER_ITEM').Value  :=null;

                        UpdateRaise.ExecProc;
                        UpdateRaise.Close;
                        WriteTransaction.Commit;

                        //SendMessage(outer_hwnd,FMAS_MESS_ITEM_INFO_CHANGED,0,0);

                        UpdateRaise.Free;
              end;
              GetData;
     end;
end;

procedure TfmPremiaOrder.PercentKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If ((Key = ord('V'))  and (ssCtrl in Shift))  Then Key:=0;
    If ((Key = VK_INSERT) and (ssShift in Shift)) Then Key:=0;
    If ((Key = VK_DELETE) and (ssShift in Shift)) Then Key:=0;
    If  (Key = VK_DELETE) Then Key:=0;
end;

procedure TfmPremiaOrder.dxSmEditPositionButtonClick(Sender: TObject);
var
 frm : TfmChangeSmeta;
 UpdateSP:TpFibStoredProc;
 id_rec:int64;
begin
    id_rec:=0;
    
    if (SmetsDataSet.RecordCount>0)
    then begin
            frm := TfmChangeSmeta.Create(Self);
            frm.EditForAllPeople.Visible:=False;
            frm.EditBudgetForAll.Visible:=True;
            if RadioButton1.Checked
            then
            begin
                frm.Summa.Visible:=False;
                frm.Summa.Required:=False;
                frm.EditSumaForAll.Visible:=False;
            end;
            if RadioButton2.Checked
            then
            begin
                frm.Summa.Required:=True;
                frm.EditSumaForAll.Visible:=True;
            end;
               frm.NumSm.Value := SmetsDataSet.FieldByName('sm_kod').AsInteger;
            try
                frm.PubSprSmet.Close;
                frm.PubSprSmet.ParamByName('smeta_kod').AsInteger := StrToInt(frm.NumSm.Value);
                frm.PubSprSmet.Open;
                frm.PubSprSmet.FetchAll;

                if frm.PubSprSmet.RecordCount = 1 then
                begin
                    frm.Smeta.Value := frm.PubSprSmet['ID_SMETA'];
                    frm.Smeta.DisplayText := IntToStr(frm.PubSprSmet['SMETA_KOD']) +
                        '. ' + frm.PubSprSmet['SMETA_TITLE'];
                end;

            except on e: Exception do
                    ShowMessage(e.Message);
            end;

            frm.Summa.Value:=SmetsDataSet['SUMMA'];

            if self.EditMode = 2 then
            begin
                qFBlock(true, frm);
                frm.NumSm.Blocked:=True;
            end
            else frm.NumSm.Blocked:=False;
            if (frm.ShowModal = mrOK) and (self.EditMode <> 2) then
            begin
                UpdateSP:=TpFibStoredProc.Create(self);
                UpdateSP.Database    :=  WorkDatabase;
                UpdateSP.Transaction :=WriteTransaction;
                WriteTransaction.StartTransaction;
                StartHistory(WriteTransaction);
                UpdateSP.StoredProcName:='UP_DT_MAN_PREMIA_SMET_BUFF_UPD';
                UpdateSP.Prepare;
                UpdateSP.ParamByName('ID_REC').asInt64  :=StrToInt64(SmetsDataSet.FieldByName('ID_REC').AsString);
                UpdateSP.ParamByName('ID_SMET').Value  :=frm.Smeta.Value;
                UpdateSP.ParamByName('SUMMA').Value  :=frm.Summa.Value;

                if frm.EditBudgetForAll.Checked then
                UpdateSP.ParamByName('ALLSMET').Value  :=1
                else
                UpdateSP.ParamByName('ALLSMET').Value  :=0;

                if frm.EditSumaForAll.Checked then
                UpdateSP.ParamByName('ALLSUMM').Value  :=1
                else
                UpdateSP.ParamByName('ALLSUMM').Value  :=0;

                UpdateSP.ExecProc;
                id_rec:=StrToInt64(SmetsDataSet.FieldByName('ID_REC').AsString);
                UpdateSP.Close;
                UpdateSP.Free;
                WriteTransaction.Commit;
             end;

             GetData;
             if id_rec<>0 then
             SmetsDataSet.Locate('ID_REC',id_rec,[]);
        frm.Free;
     end;
end;

procedure TfmPremiaOrder.SmViewDblClick(Sender: TObject);
begin
   if dxSmEditPositionButton.Enabled then
   dxSmEditPositionButton.Click;
end;

procedure TfmPremiaOrder.ReportDataViewDblClick(Sender: TObject);
begin
   if dxEditPositionButton.Enabled then
   dxEditPositionButton.Click;
end;

procedure TfmPremiaOrder.PercentContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
    Handled:=True;
end;

procedure TfmPremiaOrder.dxCloneButtonClick(Sender: TObject);
Var id_order_old: int64;
    StoredProc: TpFibStoredProc;
    y, m, d: Word;
Begin
    Panel12.Visible := true;
    Screen.Cursor := crHourGlass;
    self.Update;
    Application.ProcessMessages;

    id_order_old := UpKernelUnit.GetOrderByRegInfo(self, WorkDatabase.Handle);
    If id_order_old <> -1 Then
        Begin
        //Создаем новый пункт приказа в буфферной таблице
            StoredProc := TpFibStoredProc.Create(Nil);
            StoredProc.Database := WorkDatabase;
            StoredProc.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            StartHistory(WriteTransaction);
            StoredProc.StoredProcName := 'UP_DT_MAN_PREMIA_BUFF_CLONE';
            StoredProc.Prepare;
            StoredProc.ParamByName('OLD_ID_ORDER').AsInt64 := id_order_old;
            StoredProc.ParamByName('ID_ORDER_TYPE').AsInt64 := self.id_order_type;
            StoredProc.ParamByName('KEY_SESSION').AsInt64 := self.Key_session;
            StoredProc.ParamByName('NEW_ID_ORDER').AsInt64 := self.IdOrder;

            DecodeDate(Date, y, m, d);
            StoredProc.ParamByName('DATE_BEG_NEW').Value := EncodeDate(y, m, 1);
            d := DaysInAMonth(y, m);
            StoredProc.ParamByName('DATE_END_NEW').Value := EncodeDate(y, m, d);

            StoredProc.ExecProc;

            WriteTransaction.Commit;
            If (Not VarIsNull(StoredProc.ParamByName('ID_ITEM').Value))
                Then
                Begin
                    If (StoredProc.ParamByName('PERCENTOUT').Value = null)
                        Then Begin
                            RadioButton2.Checked := true;
                            Percent.Text := '';
                        End
                    Else Begin
                            RadioButton1.Checked := true;
                            Percent.Text := StoredProc.ParamByName('PERCENTOUT').Value;
                        End;

                    IdType.ItemIndex := StoredProc.ParamByName('ID_TYPE').Value - 1;
                    IdRaise.Value := StoredProc.ParamByName('ID_RAISEOUT').Value;
                    IdRaise.DisplayText := StoredProc.ParamByName('RASE_NAME').ASString;

                    If IdType.ItemIndex = 1 Then IsPercentBox.Visible := False
                    Else IsPercentBox.Visible := True;

                    ID_CALC_TYPE := StoredProc.ParamByName('ID_CALC_TYPE').Value;
                End
            Else
                Begin
                    If (Not (VarIsNull(StoredProc.ParamByName('ERR_STRING').Value)) And
                        (StoredProc.ParamByName('ERR_STRING').Value <> '')) Then
                        agShowMessage(StoredProc.ParamByName('ERR_STRING').Value)
                    Else agShowMessage('По введеним атрибутам не знайдено жодного пункту для клонування!');
          // agMessageDlg('Увага!', 'По введеним атрибутам не знайдено жодного пункту для клонування!', mtInformation, [mbOk]);
                End;

            StoredProc.Close;
            StoredProc.Free;

            GetData;
            If (MainOrderDataSet.RecordCount > 0)
                Then Begin
                    SetControls(true);

                    If (Id_Calc_Type = 4)
                        Then Begin
                          //  ExtInfoButton.Enabled:=true;
                          //  TabSheet2.TabVisible :=true;
                        End;
                    If (Id_Calc_Type <> 2)
                        Then Begin
                            dxSmAddButton.Enabled := true;
                            dxSmEditPositionButton.Enabled := true;
                            dxSmDelButton.Enabled := true;
                        End;
                End;

        End;
    Panel12.Visible := false;
    Screen.Cursor := crDefault;
end;    

end.



