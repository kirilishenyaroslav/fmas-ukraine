unit UpBonusRemoveMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, FIBDatabase, pFIBDatabase, cxClasses, cxStyles,
  cxGridTableView, StdCtrls, Buttons, ExtCtrls, cxLookAndFeelPainters,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxTextEdit, uFControl, uLabeledFControl, uSpravControl,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, cxButtons, uCommonSP, AppStruClasses,
  FIBDataSet, pFIBDataSet, AccMgmt, cxContainer, cxMaskEdit,
  cxDropDownEdit, cxCalendar, pFibStoredProc, cxSplitter, cxMemo, cxDBEdit,
  Placemnt, cxCheckBox;

type
  TfrmRemoveBonus = class(TForm)
    Panel1: TPanel;
    OkButton: TBitBtn;
    Panel2: TPanel;
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
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    Panel10: TPanel;
    AddPositionButton: TcxButton;
    DelPositionButton: TcxButton;
    EditPositionButton: TcxButton;
    ReasonButton: TcxButton;
    ERrorButton: TcxButton;
    ItemsGrid: TcxGrid;
    ReportDataView: TcxGridDBTableView;
    ReportDataViewDBColumn1: TcxGridDBColumn;
    ReportDataViewDBColumn2: TcxGridDBColumn;
    ReportDataViewDBColumn6: TcxGridDBColumn;
    ReportDataViewDBColumn3: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    Panel3: TPanel;
    IdRaise: TqFSpravControl;
    OnDate: TcxDateEdit;
    Label1: TLabel;
    MainDataDataSet: TpFIBDataSet;
    MainDataDataSource: TDataSource;
    Panel6: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxSplitter1: TcxSplitter;
    FormStorage1: TFormStorage;
    FormPlacement1: TFormPlacement;
    CancelButton: TBitBtn;
    ReportDataViewDBColumn4: TcxGridDBColumn;
    ReportDataViewDBColumn5: TcxGridDBColumn;
    cxCheckBox1: TcxCheckBox;
    ReportDataViewDBColumn8: TcxGridDBColumn;
    pnl1: TPanel;
    cxSplitter2: TcxSplitter;
    cxGrid1: TcxGrid;
    SmView: TcxGridDBTableView;
    SmViewDBColumn2: TcxGridDBColumn;
    cxGridDBColumn1: TcxGridDBColumn;
    SmViewDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    SmetsDataSet: TpFIBDataSet;
    SmetsDataSource: TDataSource;
    cxDBMemo1: TcxDBMemo;
    procedure IdRaiseOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure AddPositionButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DelPositionButtonClick(Sender: TObject);
    procedure EditPositionButtonClick(Sender: TObject);
    procedure ReasonButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure ReportDataViewDblClick(Sender: TObject);
  private
     ErrorForm:TForm;
     id_user:Int64;
     id_order:int64;
     id_order_type:Integer;
     EditIdItem:Int64;
     Key_session:Int64;
     base_num_item:Integer;
     base_num_Sub_item:Integer;
     WorkMode:Integer;
     procedure GetData;
     procedure LoadDataFromFilter;
     procedure CreateDataByIdItem;
     function CheckData:Boolean;
     function SaveData:Boolean;
     procedure ShowErrors;
     function AddNewItem(id_item:int64):Boolean;
     procedure GetErrorTexts(id_item:int64);
  public
     PC: TFMASAppModule;
     LocalasFrame:Boolean;
     outer_hwnd:HWND;
     procedure SetControls(Enable: Boolean);
     constructor Create(AOwner:TComponent;
                       DBHandle:TISC_DB_HANDLE;
                       ID_ORDER:Int64;
                       ID_ORDER_TYPE:Integer;
                       NUM_ITEM:Integer;
                       NUM_SUB_ITEM:Integer;
                       ID_ITEM:Variant;
                       MODE:Integer;
                       isFrame:Boolean;
                       outer_hwnd:Variant);reintroduce;
  end;



implementation

uses BaseTypes, UpBonusRemoveEdit, UpRemoveBonusOrderReasonForm, UpKernelUnit,
     UBonusRemoveOrderShowErrors, RxMemDS;

{$R *.dfm}

{ TfrmRemoveBonus }

constructor TfrmRemoveBonus.Create(AOwner: TComponent;
  DBHandle: TISC_DB_HANDLE; ID_ORDER: Int64; ID_ORDER_TYPE, NUM_ITEM,
  NUM_SUB_ITEM: Integer; ID_ITEM: Variant; MODE: Integer;isFrame:Boolean;outer_hwnd:Variant);
begin
     if isFrame
     then inherited Create(AOwner)
     else inherited Create(Application.MainForm);
     
     self.LocalasFrame:=isFrame;
     self.outer_hwnd:=outer_hwnd;
     //Если показываем форму как фрейм
     if self.LocalasFrame
     then begin
               self.BorderStyle:=bsNone;
               //self.Align      :=alClient;
               self.BorderIcons:=[];
               self.Visible    :=true;
     end;

     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;
     StartHistory(ReadTransaction);
     Key_session           :=WorkDatabase.Gen_Id('GEN_UP_ID_SESSION',1);
     self.id_order         :=ID_ORDER;
     self.id_order_type    :=ID_ORDER_TYPE;
     self.base_num_item    :=NUM_ITEM;
     self.base_num_Sub_item:=NUM_SUB_ITEM;
     self.WorkMode         :=Mode;

     if (self.WorkMode in [1,2])
     then begin
               EditIdItem:=VarAsType(id_item, varInt64);
               CreateDataByIdItem;
     end;


     if self.WorkMode=2
     then begin
               OkButton.Visible:=false;
               Panel1.Visible:=false;
               Panel10.Visible:=false;
               OnDate.Enabled:=false;
               IdRaise.Enabled:=false;
               IdRaise.Block(true);

     end;
     
     GetData;

     if (MainDataDataSet.RecordCount>0) then SetControls(true);

     if (self.WorkMode=1)
     then begin
               IdRaise.Blocked:=true;
               AddPositionButton.Enabled:=false;
               DelPositionButton.Enabled:=false;
               Label1.Visible:=false;
               OnDate.Visible:=false;
     end;

     ErrorForm:=TfrmGetErrors.Create(self);

     SmetsDataSet.SelectSQL.Text:='SELECT * FROM UP_KER_GET_BONUS_SMET_INFO(?ID_MAN_BONUS)';
end;

procedure TfrmRemoveBonus.SetControls(Enable: Boolean);
begin
      OkButton.Enabled           :=Enable;
      DelPositionButton.Enabled  :=Enable;
      EditPositionButton.Enabled :=Enable;
      ReasonButton.Enabled       :=Enable;
end;


procedure TfrmRemoveBonus.IdRaiseOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
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

            FieldValues['Raise_Select_Kind'] := 0;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;

        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Raise'];
            DisplayText := sp.Output['Name'];
            AddPositionButton.Enabled:=true;
        end;
        sp.Free;
    end;
end;

procedure TfrmRemoveBonus.AddPositionButtonClick(Sender: TObject);
begin
      //Запускаем фильтр для работы
      PC.InParams.Items['AOwner']        :=@self;
      PC.InParams.Items['DbHandle']      :=PInteger(@WorkDatabase.Handle);
      PC.InParams.Items['Id_User']       :=PInteger(@id_user);
      PC.InParams.Items['Id_order_type'] :=PInteger(@id_order_type);
      PC.InParams.Items['KEY_SESSION']   :=PInt64(@Key_session);

      (PC as IFMASModule).Run;

      if (PInteger(PC.OutParams.Items['Count'])^)=0
      then begin
                agMessageDlg('Увага!', 'За встановленими настройками фільтра не знайдено жодної позиції! Спробуйте ще раз?', mtInformation, [mbOk]);
      end;

      if (PInteger(PC.OutParams.Items['Count'])^)>0
      then begin
                //Загружаем данные из результатов работы фильтра
                LoadDataFromFilter;

                GetData;

                if (MainDataDataSet.RecordCount>0)
                then begin
                          SetControls(true);
                end;
      end;

end;

procedure TfrmRemoveBonus.FormCreate(Sender: TObject);
begin
     id_user:=AccMgmt.GetUserId;
     with TFMASAppModuleCreator.Create do
     begin
          PC :=CreateFMASModule(ExtractFilePath(Application.ExeName)+'up\','up_filter');
          if (PC=nil)
          then agMessageDlg('Увага!','Помилка при роботі з модулем up_filter.bpl',mtError,[mbOk]);
     end;
     OnDate.Date:=Date;
end;

procedure TfrmRemoveBonus.GetData;
var id_:int64;
begin
     id_:=-1;
     if  MainDataDataSet.Active
     then begin
               if (MainDataDataSet.RecordCount>0)
               then begin
                         id_:=StrToInt64(MainDataDataSet.fbn('id_order_item').asstring);
               end;

               MainDataDataSet.Close;
     end;

     if (self.WorkMode=0)
     then begin
               MainDataDataSet.SelectSQL.Text:=' SELECT * FROM UP_DT_BONUS_REMOVE_BUFF_SEL('+IntToStr(self.Key_session)+',-1)';
     end
     else begin
               MainDataDataSet.SelectSQL.Text:=' SELECT * FROM UP_DT_BONUS_REMOVE_BUFF_SEL('+IntToStr(self.Key_session)+','+IntToStr(self.EditIdItem)+')';
     end;

     MainDataDataSet.Open;

     if (MainDataDataSet.RecordCount>0)
     then MainDataDataSet.Locate('ID_ORDER_ITEM',id_,[]);
end;

procedure TfrmRemoveBonus.LoadDataFromFilter;
var getCandidateDS:TpFibDataSet;
    GetId_order_itemSP, InsertBuffer:TpFibStoredProc;
    i:Integer;
    id_order_item:Int64;
    fam, im, otch: string[20];
begin
     getCandidateDS            :=TpFibDataSet.Create(self);
     getCandidateDS.Database   :=WorkDatabase;
     getCandidateDS.Transaction:=ReadTransaction;
     getCandidateDS.SelectSQL.Text:=' SELECT * FROM UP_DT_BONUS_REMOVE_GET_FIL_DATA('+IntToStr(self.Key_session)+','+VarToStr(Self.IdRaise.Value)+','+''''+DateToStr(OnDate.Date)+''''+')';
     getCandidateDS.Open;
     getCandidateDS.FetchAll;

     if (getCandidateDS.RecordCount>0)
     then begin
               InsertBuffer:=TpFibStoredProc.Create(nil);
               InsertBuffer.Database:=WorkDatabase;
               InsertBuffer.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               StartHistory(WriteTransaction);               
               InsertBuffer.StoredProcName:='UP_DT_BONUS_REMOVE_BUFF_INS';

               GetId_order_itemSP:=TpFibStoredProc.Create(nil);
               GetId_order_itemSP.Database:=WorkDatabase;
               GetId_order_itemSP.Transaction:=WriteTransaction;
               GetId_order_itemSP.StoredProcName:='UP_KER_GET_NEW_ID_ORDER_ITEM';

               for i:= 0 to getCandidateDS.RecordCount-1 do
               begin
                    //Добавляем данные в буфферные таблицы по шапке
                    GetId_order_itemSP.Prepare;
                    GetId_order_itemSP.ParamByName('KEY_SESSION').AsInt64:=self.Key_session;
                    GetId_order_itemSP.ParamByName('NOTE').Value         :=NULL;
                    GetId_order_itemSP.ParamByName('NUM_ITEM').Value     :=self.base_num_item;
                    GetId_order_itemSP.ParamByName('NUM_SUB_ITEM').Value :=self.base_num_sub_item;
                    GetId_order_itemSP.ParamByName('ID_ORDER').AsInt64   :=self.id_order;
                    GetId_order_itemSP.ParamByName('ID_ORDER_TYPE').Value:=self.id_order_type;
                    //GetId_order_itemSP.ParamByName('REASON').Value       :=NULL;
                    GetId_order_itemSP.ParamByName('LINKTO').Value       :=NULL;

                   fam := getCandidateDS.FieldByName('FAMILIA').AsString;
                    im := getCandidateDS.FieldByName('IMYA').AsString;
                    otch := getCandidateDS.FieldByName('OTCHESTVO').AsString;

                    GetId_order_itemSP.ParamByName('REASON').Value := ' Заява ' + fam +' ' + im[1] + '.' + otch[1] + '.';

                    GetId_order_itemSP.ExecProc;
                    id_order_item :=GetId_order_itemSP.FieldByName('ID_ITEM').AsInt64;


                    //Нарашиваем информацию по номеру подпункта
                    self.base_num_sub_item:=self.base_num_sub_item+1;

                    //Добавляем данные по снятию надбавки
                    InsertBuffer.Prepare;
                    InsertBuffer.ParamByName('KEY_SESSION').AsInt64      :=self.Key_session;
                    InsertBuffer.ParamByName('ID_ORDER_ITEM').asInt64    :=id_order_item;
                    InsertBuffer.ParamByName('ID_MAN_BONUS').asInt64     :=StrToInt64(getCandidateDS.FieldByName('ID_MAN_BONUS').AsString);
                    InsertBuffer.ParamByName('REMOVE_DATE').Value        :=OnDate.Date;
                    InsertBuffer.ExecProc;

                    getCandidateDS.Next;
               end;

               WriteTransaction.Commit;

               SendMessage(outer_hwnd,FMAS_MESS_ITEM_INFO_CHANGED,0,0);

               InsertBuffer.Close;
               InsertBuffer.Free;

               GetId_order_itemSP.Close;
               GetId_order_itemSP.Free;

               GetData;
     end
     else begin
               agMessageDlg('Увага!', 'За встановленими настройками фільтра не знайдено жодної позиції з вибраною надбавкою! Спробуйте ще раз?', mtInformation, [mbOk]);
     end;
     getCandidateDS.Close;
     getCandidateDS.Free;
end;

procedure TfrmRemoveBonus.FormDestroy(Sender: TObject);
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
end;

procedure TfrmRemoveBonus.DelPositionButtonClick(Sender: TObject);
var DeleteSP:TpFibStoredProc;
begin
     if (MainDataDataSet.RecordCount>0)
     then begin
               if (agMessageDlg('Увага!','Ви хочете видалити запис?',mtConfirmation,[mbYes,mbNo])=mrYes)
               then begin
                         DeleteSP:=TpFibStoredProc.Create(self);
                         DeleteSP.Database    :=WorkDatabase;
                         DeleteSP.Transaction :=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         StartHistory(WriteTransaction);                         
                         DeleteSP.StoredProcName:='UP_DT_BONUS_REMOVE_BUFF_DEL';
                         DeleteSP.Prepare;
                         DeleteSP.ParamByName('KEY_SESSION').asInt64  :=self.Key_session;
                         DeleteSP.ParamByName('ID_ORDER_ITEM').AsInt64:=StrToInt64(MainDataDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                         DeleteSP.ExecProc;
                         DeleteSP.Close;
                         DeleteSP.Free;
                         WriteTransaction.Commit;
                         SendMessage(outer_hwnd,FMAS_MESS_ITEM_INFO_CHANGED,0,0);

                         GetData;

                         if (MainDataDataSet.RecordCount=0)
                         then begin
                                    SetControls(false);
                         end;
               end;
     end;
end;

procedure TfrmRemoveBonus.EditPositionButtonClick(Sender: TObject);
var T:TfrmBonusRemoveChangeDate;
    UpdateSP:TpFibStoredProc;
    I:Integer;
begin
     if MainDataDataSet.RecordCount>0
     then begin
               T:=TfrmBonusRemoveChangeDate.Create(self);
               T.cxDateEdit1.Date:=MainDataDataSet.FieldByName('REMOVE_DATE').Value;
               if T.ShowModal=mrYes
               then begin
                         if not T.EditForAll.Checked
                         then begin
                                   UpdateSP:=TpFibStoredProc.Create(self);
                                   UpdateSP.Database    :=WorkDatabase;
                                   UpdateSP.Transaction :=WriteTransaction;
                                   WriteTransaction.StartTransaction;
                                   StartHistory(WriteTransaction);
                                   UpdateSP.StoredProcName:='UP_DT_BONUS_REMOVE_BUFF_UPD';
                                   UpdateSP.Prepare;
                                   UpdateSP.ParamByName('KEY_SESSION').asInt64  :=self.Key_session;
                                   UpdateSP.ParamByName('ID_ORDER_ITEM').AsInt64:=StrToInt64(MainDataDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                                   UpdateSP.ParamByName('REMOVE_DATE').Value    :=T.cxDateEdit1.date;
                                   UpdateSP.ExecProc;
                                   self.EditIdItem:=UpdateSP.ParamByName('NEW_ID_ORDER_ITEM').asInt64;
                                   UpdateSP.Close;
                                   UpdateSP.Free;
                                   WriteTransaction.Commit;
                         end
                         else begin
                                   MainDataDataSet.First;
                                   for i:=0 to MainDataDataSet.RecordCount-1 do
                                   begin
                                         UpdateSP:=TpFibStoredProc.Create(self);
                                         UpdateSP.Database    :=WorkDatabase;
                                         UpdateSP.Transaction :=WriteTransaction;
                                         WriteTransaction.StartTransaction;
                                         StartHistory(WriteTransaction);
                                         UpdateSP.StoredProcName:='UP_DT_BONUS_REMOVE_BUFF_UPD';
                                         UpdateSP.Prepare;
                                         UpdateSP.ParamByName('KEY_SESSION').asInt64  :=self.Key_session;
                                         UpdateSP.ParamByName('ID_ORDER_ITEM').AsInt64:=StrToInt64(MainDataDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                                         UpdateSP.ParamByName('REMOVE_DATE').Value    :=T.cxDateEdit1.date;
                                         UpdateSP.ExecProc;
                                         UpdateSP.Close;
                                         UpdateSP.Free;
                                         WriteTransaction.Commit;

                                         MainDataDataSet.Next;
                                   end;
                         end;
                         SendMessage(outer_hwnd,FMAS_MESS_ITEM_INFO_CHANGED,0,0);
                         GetData;
               end;
               T.Free;
     end;
end;

procedure TfrmRemoveBonus.ReasonButtonClick(Sender: TObject);
var UpdateSP:TpFibStoredProc;
    I:Integer;
begin
     with  TfrmReasonForm.Create(self) do
     begin
           Note.Text      :=MainDataDataSet.FieldByName('NOTE').AsString;
           Reason.Text  :=MainDataDataSet.FieldByName('REASON').AsString;
           if ShowModal=mrOk
           then begin
                     if not EditForAll.Checked
                     then begin
                               UpdateSP:=TpFibStoredProc.Create(self);
                               UpdateSP.Database    :=WorkDatabase;
                               UpdateSP.Transaction :=WriteTransaction;
                               WriteTransaction.StartTransaction;
                               StartHistory(WriteTransaction);
                               UpdateSP.StoredProcName:='UP_DT_ORDER_ITEMS_BUFF_UPD_EINF';
                               UpdateSP.Prepare;
                               UpdateSP.ParamByName('KEY_SESSION').asInt64  :=self.Key_session;
                               UpdateSP.ParamByName('NOTE').Value        :=Note.Text;
                               UpdateSP.ParamByName('REASON').Value      :=Reason.Text;
                               UpdateSP.ParamByName('ID_ITEM').AsInt64:=StrToInt64(MainDataDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                               UpdateSP.ExecProc;
                               UpdateSP.Close;
                               UpdateSP.Free;
                               WriteTransaction.Commit;
                               //cxDBTextEdit1.Text:=note.text;

                     end
                     else begin
                               MainDataDataSet.First;
                               for i:=0 to MainDataDataSet.RecordCount-1 do
                               begin
                                     UpdateSP:=TpFibStoredProc.Create(self);
                                     UpdateSP.Database    :=WorkDatabase;
                                     UpdateSP.Transaction :=WriteTransaction;
                                     WriteTransaction.StartTransaction;
                                     StartHistory(WriteTransaction);
                                     UpdateSP.StoredProcName:='UP_DT_ORDER_ITEMS_BUFF_UPD_EINF';
                                     UpdateSP.Prepare;
                                     UpdateSP.ParamByName('KEY_SESSION').asInt64  :=self.Key_session;
                                     UpdateSP.ParamByName('NOTE').Value        :=Note.Text;

                                     UpdateSP.ParamByName('REASON').Value      :=Reason.Text;


                                     UpdateSP.ParamByName('ID_ITEM').AsInt64:=StrToInt64(MainDataDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                                     UpdateSP.ExecProc;
                                     UpdateSP.Close;
                                     UpdateSP.Free;
                                     WriteTransaction.Commit;

                                     MainDataDataSet.Next;
                               end;
                     end;
                     SendMessage(outer_hwnd,FMAS_MESS_ITEM_INFO_CHANGED,0,0);
                     GetData;

           end;
           Free;
     end;
end;

procedure TfrmRemoveBonus.CreateDataByIdItem;
var StoredProc:TpFibStoredProc;
begin
     //Создаем новый пункт приказа в буфферной таблице
     StoredProc            :=TpFibStoredProc.Create(nil);
     StoredProc.Database   :=WorkDatabase;
     StoredProc.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     StartHistory(WriteTransaction);     
     StoredProc.StoredProcName:='UP_DT_BONUS_REMOVE_CREATE_INFO';
     StoredProc.Prepare;
     StoredProc.ParamByName('KEY_SESSION').AsInt64      :=self.Key_session;
     StoredProc.ParamByName('OLD_ID_ORDER_ITEM').AsInt64:=self.EditIdItem;
     StoredProc.ExecProc;
     IdRaise.Value      :=StoredProc.ParamByName('id_raise').Value;
     IdRaise.DisplayText:=StoredProc.ParamByName('raise_name').AsString;
     StoredProc.Close;
     WriteTransaction.Commit;
     StoredProc.Free;
end;

procedure TfrmRemoveBonus.OkButtonClick(Sender: TObject);
begin
     ERrorButton.Visible:=false;
     if CheckData
     then begin
               if SaveData
               then begin
                         agShowMessage('Інформація по наказу успішно збережена!');
                         if not self.LocalasFrame
                         then ModalResult:=mrOk
                         else SendMessage(outer_hwnd,FMAS_MESS_SAVE_ITEM_OK,0,0)
               end
               else begin
                         agShowMessage('Знайдені помилки під час проведення наказу через ядро системи!');
                         ShowErrors;
                         GetData;
               end
     end
     else agShowMessage('Знайдені помилки в інформації по наказу!');

end;

function TfrmRemoveBonus.CheckData: Boolean;
begin
     Result:=true;
end;

function TfrmRemoveBonus.SaveData:Boolean;
 var i,j:Integer;
     ExistErrors:Boolean;
     GetShadowItems:TpFibDataSet;
     ExistsShadowErorrs:Boolean;
begin
     ExistErrors:=false;
     ExistsShadowErorrs:=false;

     if (MainDataDataSet.RecordCount>0)
     then begin
               WriteTransaction.StartTransaction;
               StartHistory(WriteTransaction);
               MainDataDataSet.First;

               for i:=0 to MainDataDataSet.RecordCount-1 do
               begin
                    if AddNewItem(VarAsType(MainDataDataSet['ID_ORDER_ITEM'],varInt64)) //Сохраняем информацию по пункту
                    then begin
                              //Добавляем теневые пункты
                              GetShadowItems:=TpFibDataSet.Create(self);
                              GetShadowItems.Database   :=WorkDatabase;
                              GetShadowItems.Transaction:=ReadTransaction;
                              GetShadowItems.SelectSQL.Text:='SELECT ID_ITEM FROM UP_DT_ORDER_ITEMS_BUFF WHERE LINKTO='+MainDataDataSet.FieldByName('ID_ORDER_ITEM').AsString;
                              GetShadowItems.Open;
                              GetShadowItems.FetchAll;
                              GetShadowItems.First;
                              for j:=0 to GetShadowItems.RecordCount-1 do
                              begin
                                    if AddNewItem(StrToInt64(GetShadowItems.FieldByName('ID_ITEM').asString)) //Сохраняем информацию по пункту
                                    then begin

                                    end
                                    else begin
                                              //Выводим сообщения об ошибках
                                              GetErrorTexts(StrToInt64(GetShadowItems.FieldByName('ID_ITEM').asString));
                                              ExistsShadowErorrs:=true;
                                              Break;
                                    end;
                                    GetShadowItems.Next;
                              end;

                              if ExistsShadowErorrs
                              then begin
                                         ExistErrors:=true;
                                         break;
                              end;
                    end
                    else begin
                              //Выводим сообщения об ошибках
                              GetErrorTexts(VarAsType(MainDataDataSet['ID_ORDER_ITEM'],varInt64));
                              ExistErrors:=true;
                              Break;
                    end;
                    MainDataDataSet.Next;
               end;


               if ExistErrors
               then WriteTransaction.Rollback
               else begin
                         WriteTransaction.Commit;
                         if self.WorkMode=0 then self.WorkMode:=1;
               end;
     end;

     Result:=not ExistErrors;
end;

procedure TfrmRemoveBonus.ShowErrors;
begin
     ERrorButton.Visible:=true;

     if not Assigned(ErrorForm)
     then begin
               ErrorForm:=TfrmGetErrors.Create(self);
     end;
     //Показываем ошибки по пункту
     ErrorForm.ShowModal;
end;


function TfrmRemoveBonus.AddNewItem(id_item:int64): Boolean;
var AddStru:UP_KERNEL_MODE_STRUCTURE;
begin
     AddStru.AOWNER      :=self;
     AddStru.ID_ORDER    :=self.id_order;
     AddStru.ID_ORDER_ITEM_IN:=id_item;
     AddStru.KEY_SESSION :=self.Key_session;
     AddStru.DBHANDLE    :=WorkDatabase.Handle;
     AddStru.TRHANDLE    :=WriteTransaction.Handle;
     Result:=UpKernelDo(@AddStru);
end;

procedure TfrmRemoveBonus.GetErrorTexts(id_item:int64);
var GetErrorTextsDS:TpFibDataSet;
begin
     GetErrorTextsDS:=TpFibDataSet.Create(self);
     GetErrorTextsDS.Database:=WorkDatabase;
     GetErrorTextsDS.Transaction:=ReadTransaction;
     GetErrorTextsDS.SelectSQL.Text:=' SELECT * FROM UP_KER_UTILS_GET_ORDER_ERRORS('
     +IntToStr(self.Key_session)+','+IntTOStr(id_item)+') ';


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

procedure TfrmRemoveBonus.CancelButtonClick(Sender: TObject);
begin
     if not self.LocalasFrame
     then Close
     else SendMessage(outer_hwnd, FMAS_MESS_CLOSE_FRAME,0,0);
end;

procedure TfrmRemoveBonus.cxCheckBox1PropertiesChange(Sender: TObject);
begin
     pnl1.Visible       :=cxCheckBox1.Checked;
     cxSplitter2.Visible:=cxCheckBox1.Checked;
     cxSplitter2.Top:=pnl1.Top-1;
end;

procedure TfrmRemoveBonus.ReportDataViewDblClick(Sender: TObject);
begin
      {if (MainDataDataSet.RecordCount>0)
      then begin
                if MainDataDataSet.FieldByName('EXT_ITEMS').Value<>NULL
                then begin
                end;
      end;}
end;

end.
