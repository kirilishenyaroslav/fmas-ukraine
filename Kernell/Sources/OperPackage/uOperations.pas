unit uOperations;

interface

uses
  Windows, Messages, SysUtils,Resources_unitb,
  Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Fibdatabase,pFibdatabase, ComCtrls, ToolWin,
  ExtCtrls,pFibDataSet, ImgList, Menus, StdCtrls,
  pFibStoredProc,DateUtils,Ibase, GlobalSpr,
  cxControls, cxContainer, cxEdit, cxCheckBox, ActnList, Placemnt,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxInplaceContainer, cxTLData, cxDBTL, DB, FIBDataSet, dxStatusBar;

type
  TfrmSchOperations = class(TForm)
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    InsertButton: TToolButton;
    DeleteButton: TToolButton;
    UpdateButton: TToolButton;
    OperPopup: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    SmallImages: TImageList;
    WorkDatabase: TpFIBDatabase;
    ActionList1: TActionList;
    Action1: TAction;
    FormStorage1: TFormStorage;
    Panel2: TPanel;
    ToolBar3: TToolBar;
    PropButton: TToolButton;
    RefreshButton: TToolButton;
    ChooseButton: TToolButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBTreeList: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn;
    DbDataSet: TpFIBDataSet;
    KrDataSet: TpFIBDataSet;
    DbDataSource: TDataSource;
    KrDataSource: TDataSource;
    DBTreeListcxDBTreeListColumn1: TcxDBTreeListColumn;
    DBTreeListcxDBTreeListColumn2: TcxDBTreeListColumn;
    DBTreeListcxDBTreeListColumn3: TcxDBTreeListColumn;
    DBTreeListcxDBTreeListColumn4: TcxDBTreeListColumn;
    DBTreeListcxDBTreeListColumn5: TcxDBTreeListColumn;
    DBTreeListcxDBTreeListColumn6: TcxDBTreeListColumn;
    DBTreeListcxDBTreeListColumn7: TcxDBTreeListColumn;
    DBTreeListcxDBTreeListColumn8: TcxDBTreeListColumn;
    KrTreeList: TcxDBTreeList;
    cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeListColumn3: TcxDBTreeListColumn;
    cxDBTreeListColumn4: TcxDBTreeListColumn;
    cxDBTreeListColumn5: TcxDBTreeListColumn;
    cxDBTreeListColumn6: TcxDBTreeListColumn;
    cxDBTreeListColumn7: TcxDBTreeListColumn;
    cxDBTreeListColumn8: TcxDBTreeListColumn;
    cxDBTreeListColumn9: TcxDBTreeListColumn;
    cxDBTreeListColumn10: TcxDBTreeListColumn;
    cxDBTreeListColumn11: TcxDBTreeListColumn;
    Label1: TLabel;
    cbMonth: TComboBox;
    ToolButton1: TToolButton;
    cbYear: TComboBox;
    Panel1: TPanel;
    cxCheckBox1: TcxCheckBox;
    DelPopupMenu: TPopupMenu;
    N12: TMenuItem;
    N13: TMenuItem;
    Ins: TAction;
    Change: TAction;
    Update: TAction;
    Esc: TAction;
    Del: TAction;
    dxStatusBar1: TdxStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DeleteButtonClick(Sender: TObject);
    procedure cbMonthChange(Sender: TObject);
    procedure PropButtonClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure ChooseButtonClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure InsExecute(Sender: TObject);
    procedure ChangeExecute(Sender: TObject);
    procedure UpdateExecute(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure DelExecute(Sender: TObject);
 public
      CurChooseDB:Boolean;
      ResultValue:Variant;
      Curr_data:TdateTime;
      Curr_Id_Sch:Int64;
      Curr_Sch_title:string;
      Curr_Sch_number:string;
      Cur_sch_type:integer;
      cur_id_system:integer;
      cur_id_reg_uch:integer;
      INFINITY_DATE:TdateTime;
      CHECK_OPER_ID_EQUALITY:Integer;
      use_mo:integer;
      constructor Create(AOwner:TComponent; DBHandle:TISC_DB_HANDLE; Id_Sch:Integer; Curr_Date:TdateTime;FS:TFormStyle); overload;
  end;

  function GetSprMdi  (AOwner:TComponent; DBHandle:TISC_DB_HANDLE; Id_Sch:Integer; Curr_Date:TdateTime):integer;stdcall;
  function GetSprModal(AOwner:TComponent; DBHandle:TISC_DB_HANDLE; Id_Sch:Integer; Curr_Date:TdateTime; ChooseDB:Boolean):Variant;stdcall;

  exports GetSprMdi, GetSprModal;

implementation

uses  uEditOperations, BaseTypes, UpKernelUnit;

{$R *.dfm}

function GetSprMdi(AOwner:TComponent; DBHandle:TISC_DB_HANDLE; Id_Sch:Integer; Curr_Date:TdateTime):integer;stdcall;
begin
    GetSprMdi:=Integer(TfrmSchOperations.Create(AOwner,DBHandle,Id_Sch,Curr_Date,fsMdiChild));
end;

function GetSprModal(AOwner:TComponent; DBHandle:TISC_DB_HANDLE; Id_Sch:Integer; Curr_Date:TdateTime;
                     ChooseDB:Boolean):Variant;stdcall;
var T:TfrmSchOperations;
    Res:Variant;
begin
    T:=TfrmSchOperations.Create(AOwner,DBHandle,Id_Sch,Curr_Date,fsNormal);
    T.ChooseButton.Enabled:=true;
    T.CurChooseDB:=ChooseDB;
    if T.ShowModal=mryes  then  Res := T.ResultValue
                          else  Res := NULL;
    T.Free;
    GetSprModal:=Res;
end;

constructor TfrmSchOperations.Create(AOwner: TComponent; DBHandle:TISC_DB_HANDLE; Id_Sch: Integer;
                                     Curr_Date: TdateTime; FS: TFormStyle);
var D,M,Y:Word;
    SysDataSet:TpFibDataSet;
begin
     inherited Create(AOwner);
     formstyle:=FS;
     self.WorkDatabase.Handle:=DBHandle;
     DecodeDate(Curr_Date,Y,M,D);
     self.Curr_data:=EncodeDate(Y,M,1);
     self.Curr_Id_Sch:=Id_Sch;

     PageControl1.ActivePageIndex:=0;
     
     DbDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_MAIN_OPER_SELECT_V2('+
                               ''''+DateToStr(self.Curr_data)+''''+','+
                               IntToStr(self.Curr_Id_Sch)+',1)';
     DbDataSet.Open;

     KrDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_MAIN_OPER_SELECT_V2('+
                               ''''+DateToStr(self.Curr_data)+''''+','+
                               IntToStr(self.Curr_Id_Sch)+',0)';
     KrDataSet.Open;

     if DBTreeList.FocusedNode<>nil
     then DBTreeList.FocusedNode.Expand(true);

     if KrTreeList.FocusedNode<>nil
     then KrTreeList.FocusedNode.Expand(true);


     SysDataSet:=TpFibDataSet.Create(self);
     SysDataSet.Database:=WorkDatabase;
     SysDataSet.Transaction:=ReadTransaction;
     SysDataSet.SelectSQL.Text:='select use_mo from pub_sys_data ';
     SysDataSet.Open;
     if (SysDataSet.recordcount>0)
     then begin
               if SysDataSet.FieldByName('use_mo').value<>null
               then use_mo:=SysDataSet.FieldByName('use_mo').value
               else use_mo:=0;

     end;
     SysDataSet.close;
     SysDataSet.free;


     if (use_mo=0)
     then begin
               DBTreeList.Bands[3].Visible:=false;
               KrTreeList.Bands[3].Visible:=false;
               DBTreeList.Bands[2].Visible:=true;
               KrTreeList.Bands[2].Visible:=true;
     end
     else begin
               DBTreeList.Bands[3].Visible:=true;
               KrTreeList.Bands[3].Visible:=true;
               DBTreeList.Bands[2].Visible:=false;
               KrTreeList.Bands[2].Visible:=false;
     end;
end;


procedure TfrmSchOperations.FormCreate(Sender: TObject);
var  temp_dataset,ConfigDataSet:TpFibDataSet;
     date_str:string;
     i:integer;
begin
       cbMonth.Items.Add(TRIM(BU_Month_01));
       cbMonth.Items.Add(TRIM(BU_Month_02));
       cbMonth.Items.Add(TRIM(BU_Month_03));
       cbMonth.Items.Add(TRIM(BU_Month_04));
       cbMonth.Items.Add(TRIM(BU_Month_05));
       cbMonth.Items.Add(TRIM(BU_Month_06));
       cbMonth.Items.Add(TRIM(BU_Month_07));
       cbMonth.Items.Add(TRIM(BU_Month_08));
       cbMonth.Items.Add(TRIM(BU_Month_09));
       cbMonth.Items.Add(TRIM(BU_Month_10));
       cbMonth.Items.Add(TRIM(BU_Month_11));
       cbMonth.Items.Add(TRIM(BU_Month_12));

       for i:=0 to YEARS_COUNT do
       begin
            cbYear.Items.Add(TRIM(IntToStr(1996+i)));
       end;

       cbMonth.ItemIndex:=MonthOf(Curr_data)-1;
       for i:=0 to cbYear.Items.Count-1 do
       begin
           if pos(cbYear.Items[i],IntToStr(YearOf(Curr_data)))>0
           then begin
                     cbYear.ItemIndex:=i;
                     break;
           end;
       end;

      ConfigDataSet                    :=TpFibDataSet.Create(self);
      ConfigDataSet.Database           :=WorkDatabase;
      ConfigDataSet.Transaction        :=ReadTransaction;
      ConfigDataSet.SQLs.SelectSQL.Text:='select * from PUB_SYS_DATA';
      ConfigDataSet.Open;
      //заполнение настроек системы
      INFINITY_DATE                    :=ConfigDataSet.FieldByName('INFINITY_DATE').AsDateTime;
      CHECK_OPER_ID_EQUALITY           :=ConfigDataSet.FieldByName('CHECK_OPER_ID_EQUALITY').AsInteger;
      ConfigDataSet.Close;
      ConfigDataSet.Free;


      dateTimetostring(date_str,'dd.mm.yyyy', Curr_data);
      temp_dataset                    :=TpFibDataSet.Create(self);
      temp_dataset.Database           :=WorkDatabase;
      temp_dataset.Transaction        :=ReadTransaction;
      temp_dataset.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SP_MAIN_SCH_SELECT('+''''+date_str+''''+','+IntToStr(DEFAULT_ROOT_ID)+')'+
                                        ' WHERE ID_SCH='+IntToStr(Curr_Id_Sch);
      temp_dataset.Open;
      temp_dataset.FetchAll;
      if (temp_dataset.RecordCount>0)
      then begin
                Label1.Caption:='Опреації по рахунку: "'+temp_dataset.FieldByName('SCH_TITLE').AsString+' '+temp_dataset.FieldByName('SCH_NUMBER').AsString+'" на '+date_str;
                Curr_Sch_title:=temp_dataset.FieldByName('SCH_TITLE').AsString;
                Curr_Sch_number:=temp_dataset.FieldByName('SCH_NUMBER').AsString;
                Cur_sch_type:=temp_dataset.FieldByName('SCH_TYPE').AsInteger;
                cur_id_system:=temp_dataset.FieldByName('ID_SYSTEM').AsInteger;
                cur_id_reg_uch:=temp_dataset.FieldByName('ID_REG_UCH').AsInteger;
      end;
      temp_dataset.Free;

      TabSheet1.Caption:=Curr_Sch_number + ' в дебеті';
      TabSheet2.Caption:=Curr_Sch_number + ' в кредиті';
end;

procedure TfrmSchOperations.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmSchOperations.DeleteButtonClick(Sender: TObject);
begin
  N12.OnClick(self);
end;

procedure TfrmSchOperations.cbMonthChange(Sender: TObject);
begin
     DateSeparator:='.';
     Curr_data:=StrToDate('01.'+IntToStr(cbMonth.ItemIndex+1)+'.'+cbYear.Items[cbYear.ItemIndex]);
     RefreshButton.OnClick(self);
end;

procedure TfrmSchOperations.PropButtonClick(Sender: TObject);
begin
     if (PageControl1.ActivePageIndex=0)
     then begin
               if (DbDataSet.RecordCount>0)
               then GetPropByObj(self.owner,
                                 WorkDatabase.Handle,
                                 DbDataSet.FieldByName('ID_OPER').Value,
                                 Curr_data,ptOper);
     end
     else begin
               if (KrDataSet.RecordCount>0)
               then GetPropByObj(self.owner,
                                 WorkDatabase.Handle,
                                 KrDataSet.FieldByName('ID_OPER').Value,
                                 Curr_data,ptOper);
     end;
end;

procedure TfrmSchOperations.N1Click(Sender: TObject);
begin
     InsertButton.OnClick(self);
end;

procedure TfrmSchOperations.N2Click(Sender: TObject);
begin
     DeleteButton.OnClick(self);
end;

procedure TfrmSchOperations.N3Click(Sender: TObject);
begin
     UpdateButton.OnClick(self);
end;

procedure TfrmSchOperations.N4Click(Sender: TObject);
begin
     PropButton.OnClick(self);
end;

procedure TfrmSchOperations.N5Click(Sender: TObject);
begin
     RefreshButton.OnClick(self);
end;

procedure TfrmSchOperations.N8Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmSchOperations.ChooseButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmSchOperations.Action1Execute(Sender: TObject);
begin
    if self.WindowState=wsMaximized
    then self.WindowState:=wsNormal
    else self.WindowState:=wsMaximized;
end;

procedure TfrmSchOperations.RefreshButtonClick(Sender: TObject);
var id:integer;
begin
     id:=0;
     if DbDataSet.RecordCount>0 then id:=DbDataSet.FieldByName('ID_OPER').Value;
     DbDataSet.Close;
     DbDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_MAIN_OPER_SELECT_V2('+
                               ''''+DateToStr(self.Curr_data)+''''+','+
                               IntToStr(self.Curr_Id_Sch)+',1)';
     DbDataSet.Open;
     DbDataSet.Locate('id_oper',id,[]);

     id:=0;
     if KrDataSet.RecordCount>0 then id:=krDataSet.FieldByName('ID_OPER').Value;
     krDataSet.Close;
     krDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_MAIN_OPER_SELECT_V2('+
                               ''''+DateToStr(self.Curr_data)+''''+','+
                               IntToStr(self.Curr_Id_Sch)+',0)';
     krDataSet.Open;
     krDataSet.Locate('id_oper',id,[]);
end;

procedure TfrmSchOperations.InsertButtonClick(Sender: TObject);
var T:TfrmEditOper;
    RES: Variant;
    temp_dataset: TpFibDataSet;
    i: integer;
    date_str: string;
    default_id: integer;
begin
      Res:=GlobalSpr.GetSch( self, WorkDatabase.handle, fsNormal, Curr_data, DEFAULT_ROOT_ID, 0, 0);

      if VarArrayDimCount(RES)>0 then begin

            for i:=0 to VarArrayHighBound(RES,1) do begin
                 T:=TfrmEditOper.Create(self);
                 T.IsEdit:=false;
                 T.IsView:=false;

                 T.id_sch:=RES[i][0];
                 if (TfrmSchOperations(self).CHECK_OPER_ID_EQUALITY=1) and (T.id_sch=TfrmSchOperations(self).Curr_Id_Sch)
                 then begin
                           MessageBox(Handle,PChar(BU_CHECK_OPER_ID_EQUALITY_ERROR),PChar(BU_WarningCaption),MB_OK and MB_ICONWARNING);
                           T.id_sch:=0;
                           Exit;
                 end;

                 T.sch_title :=RES[i][1];
                 T.sch_type  :=RES[i][2];
                 T.sch_number:=RES[i][3];
                 T.sch_system:=RES[i][4];

                 dateTimetostring(date_str,'dd.mm.yyyy', TfrmSchOperations(self).Curr_data);
                 temp_dataset:=TpFibDataSet.Create(self);
                 temp_dataset.Database:=TfrmSchOperations(self).WorkDatabase;
                 temp_dataset.Transaction:=TfrmSchOperations(self).ReadTransaction;
                 temp_dataset.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SP_MAIN_SCH_SELECT('+''''+date_str+''''+','+IntToStr(DEFAULT_ROOT_ID)+')'+
                                                   ' WHERE ID_SCH='+IntToStr(T.id_sch);
                 temp_dataset.Open;
                 temp_dataset.FetchAll;
                 if temp_dataset.RecordCount>0
                 then begin
                            default_id:=temp_dataset.FieldByName('ID_REG_UCH').Value;
                            if (TfrmSchOperations(self).PageControl1.ActivePageIndex=0)
                            then begin
                                       T.KrSchTitle.Text:=temp_dataset.FieldByName('SCH_NUMBER').AsString+' '+temp_dataset.FieldByName('SCH_TITLE').AsString;
                                       if T.krRegDataSet.Active then T.krRegDataSet.Close;
                                       T.krRegDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_REG_UCH WHERE ID_FORM_UCH='+IntTostr(T.sch_system);
                                       T.krRegDataSet.Open;
                                       T.KrMOrders.Enabled:=true;
                                       T.krMOrders.EditValue:=default_id;{krRegDataSet.FieldByName('ID_REG').Value}
                                       T.cxButton1.Left:=610;
                                       T.KrSchTitle.Width:=268;
                            end
                            else begin
                                       T.DbSchTitle.Text:=temp_dataset.FieldByName('SCH_NUMBER').AsString+' '+temp_dataset.FieldByName('SCH_TITLE').AsString;
                                       if T.dbRegDataSet.Active then T.dbRegDataSet.Close;
                                       T.dbRegDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_REG_UCH WHERE ID_FORM_UCH='+IntTostr(T.sch_system);
                                       T.dbRegDataSet.Open;
                                       T.DbMOrders.Enabled:=true;
                                       T.dbMOrders.EditValue:=default_id;{dbRegDataSet.FieldByName('ID_REG').Value}
                                       T.cxButton1.Left:=291;
                                       T.DbSchTitle.Width:=268;
                           end;
                 end;


                 try
                   T.getDefaults;
                   except on E:Exception do
                   begin
                        T.Free;
                        ShowMessage('Виникла помилка!'+#13+E.Message);
                        Exit;
                   end;
                 end;
                 T.ShowModal;
                 T.Free;

            end;
     end;
end;

procedure TfrmSchOperations.UpdateButtonClick(Sender: TObject);
var T:TfrmEditOper;
begin
     //TfrmSchOperations(self.Owner).PageControl1.ActivePageIndex=0 главный счет в дебете  операции
     //TfrmSchOperations(self.Owner).PageControl1.ActivePageIndex=1 главный счет в кредите операции
     T       :=TfrmEditOper.Create(self);
     T.IsEdit:=true;
     T.IsView:=false;
     T.ShowModal;
     T.Free;
end;

procedure TfrmSchOperations.cxCheckBox1PropertiesChange(Sender: TObject);
begin
     DBTreeList.Bands[1].Visible:=cxCheckBox1.Checked;
     KrTreeList.Bands[1].Visible:=cxCheckBox1.Checked;
end;

procedure TfrmSchOperations.N12Click(Sender: TObject);
var Proc:TpFibStoredProc;
begin
     if (PageControl1.ActivePageIndex=0)
     then begin
               if (DbDataSet.RecordCount>0)
               then begin
                          if (agMessageDlg('Увага!','Ви хочете видалити запис?',mtConfirmation,[mbYes,mbNo])=mrYes)
                          then begin
                                    Proc:=TpFibStoredProc.Create(self);
                                    Proc.Database:=WorkDatabase;
                                    Proc.Transaction:=WriteTransaction;
                                    proc.StoredProcName:='PUB_SP_MAIN_OPER_DELETE';
                                    WriteTransaction.StartTransaction;

                                    StartHistory(WriteTransaction);
                                    try
                                          proc.Prepare;
                                          proc.ParamByName('P_ID_OPER').AsInt64 :=StrToInt64(DbDataSet.FieldByName('ID_OPER').AsString);
                                          proc.ParamByName('P_DATE_END').value  :=Curr_data-1;
                                          proc.ExecProc;
                                          WriteTransaction.Commit;
                                          RefreshButtonClick(Self);
                                    except on E:Exception do
                                           begin
                                              ShowMessage(E.Message);
                                              WriteTransaction.Rollback;
                                           end;
                                    end;
                           end;
               end;
     end
     else begin
               if (krDataSet.RecordCount>0)
               then begin
                          if (agMessageDlg('Увага!','Ви хочете видалити запис?',mtConfirmation,[mbYes,mbNo])=mrYes)
                          then begin
                                    Proc:=TpFibStoredProc.Create(self);
                                    Proc.Database:=WorkDatabase;
                                    Proc.Transaction:=WriteTransaction;
                                    proc.StoredProcName:='PUB_SP_MAIN_OPER_DELETE';
                                    WriteTransaction.StartTransaction;

                                    StartHistory(WriteTransaction);
                                    try
                                          proc.Prepare;
                                          proc.ParamByName('P_ID_OPER').AsInt64 :=StrToInt64(KrDataSet.FieldByName('ID_OPER').Value);
                                          proc.ParamByName('P_DATE_END').value:=Curr_data-1;
                                          proc.ExecProc;
                                          WriteTransaction.Commit;
                                          RefreshButtonClick(Self);
                                    except on E:Exception do
                                           begin
                                              ShowMessage(E.Message);
                                              WriteTransaction.Rollback;
                                           end;
                                    end;
                          end;
               end;
     end;

end;

procedure TfrmSchOperations.N13Click(Sender: TObject);
var Proc:TpFibStoredProc;
    i:Integer;
begin
     if (PageControl1.ActivePageIndex=0)
     then begin
               if (DbDataSet.RecordCount>0)
               then begin
                          if (agMessageDlg('Увага!','Ви хочете видалити всі операції?',mtConfirmation,[mbYes,mbNo])=mrYes)
                          then begin
                                    DBTreeList.BeginUpdate;

                                    Proc:=TpFibStoredProc.Create(self);
                                    Proc.Database:=WorkDatabase;
                                    Proc.Transaction:=WriteTransaction;
                                    proc.StoredProcName:='PUB_SP_MAIN_OPER_DELETE';
                                    WriteTransaction.StartTransaction;

                                    StartHistory(WriteTransaction);

                                    DbDataSet.First;

                                    try
                                          for i:=0 to DbDataSet.RecordCount-1 do
                                          begin
                                                proc.Prepare;
                                                proc.ParamByName('P_ID_OPER').AsInt64 :=StrToInt64(DbDataSet.FieldByName('ID_OPER').AsString);
                                                proc.ParamByName('P_DATE_END').value  :=Curr_data-1;
                                                proc.ExecProc;

                                                DbDataSet.Next;
                                          end;

                                    WriteTransaction.Commit;
                                    RefreshButtonClick(Self);

                                    except on E:Exception do
                                           begin
                                                ShowMessage(E.Message);
                                                WriteTransaction.Rollback;
                                           end;
                                    end;

                                    DBTreeList.EndUpdate;
                           end;
               end;
     end
     else begin
               if (krDataSet.RecordCount>0)
               then begin
                          if (agMessageDlg('Увага!','Ви хочете видалити всі записи?',mtConfirmation,[mbYes,mbNo])=mrYes)
                          then begin
                                    KrTreeList.BeginUpdate;

                                    Proc:=TpFibStoredProc.Create(self);
                                    Proc.Database:=WorkDatabase;
                                    Proc.Transaction:=WriteTransaction;
                                    proc.StoredProcName:='PUB_SP_MAIN_OPER_DELETE';
                                    WriteTransaction.StartTransaction;

                                    StartHistory(WriteTransaction);

                                    KrDataSet.First;
                                    try
                                          for i:=0 to KrDataSet.RecordCount-1 do
                                          begin
                                                proc.Prepare;
                                                proc.ParamByName('P_ID_OPER').AsInt64 :=StrToInt64(KrDataSet.FieldByName('ID_OPER').Value);
                                                proc.ParamByName('P_DATE_END').value:=Curr_data-1;
                                                proc.ExecProc;


                                                KrDataSet.Next;
                                          end;

                                          WriteTransaction.Commit;
                                          RefreshButtonClick(Self);
                                    except on E:Exception do
                                           begin
                                              ShowMessage(E.Message);
                                              WriteTransaction.Rollback;
                                           end;
                                    end;

                                    KrTreeList.EndUpdate;
                          end;
               end;
     end;
end;

procedure TfrmSchOperations.InsExecute(Sender: TObject);
begin
  InsertButtonClick(self);
end;

procedure TfrmSchOperations.ChangeExecute(Sender: TObject);
begin
  UpdateButtonClick(self);
end;

procedure TfrmSchOperations.UpdateExecute(Sender: TObject);
begin
  RefreshButtonClick(self);
end;

procedure TfrmSchOperations.EscExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmSchOperations.DelExecute(Sender: TObject);
begin
  N12Click(self);
end;

end.
