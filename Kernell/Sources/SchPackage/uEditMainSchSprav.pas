unit uEditMainSchSprav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, ComCtrls, DB, FIBDataSet,
  pFIBDataSet,uMainSchSprav, FIBQuery, pFIBQuery, pFIBStoredProc, ActnList,
  Mask, Resources_unitb, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxMRUEdit, cxDBEdit,
  cxLookAndFeelPainters, cxButtons, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxRadioGroup, cxCheckBox, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, dxStatusBar;




type
  TfrmEditSch = class(TForm)
    SchTypeDataSet: TpFIBDataSet;
    SchTypeObjDataSet: TpFIBDataSet;
    ObjectTypeDataSource: TDataSource;
    SchTypeDataSource: TDataSource;
    ActionList1: TActionList;
    cancelAction: TAction;
    RegDataSet: TpFIBDataSet;
    RegDataSource: TDataSource;
    ConfirmButton: TcxButton;
    cancelButton: TcxButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    CheckChangeOperLinks: TLabel;
    EdTitle: TEdit;
    EdObjKod: TEdit;
    meDateBeg: TMaskEdit;
    cxRadioGroup1: TcxRadioGroup;
    dbcbObjectType: TcxLookupComboBox;
    dbcbSchType: TcxLookupComboBox;
    SysReg: TcxLookupComboBox;
    dbcbReg: TcxLookupComboBox;
    CheckChangeOperDBLinks: TcxCheckBox;
    CheckChangeOperKrLinks: TcxCheckBox;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    EditPeriodsDataSet: TpFIBDataSet;
    EditDataSource: TDataSource;
    Enter: TAction;
    dxStatusBar1: TdxStatusBar;
    ConfirmAction: TAction;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dbcbObjectTypeexClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ConfirmActionExecute(Sender: TObject);
    procedure cancelActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SysRegPropertiesChange(Sender: TObject);
    procedure ConfirmButtonClick(Sender: TObject);
    procedure cancelButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure EnterExecute(Sender: TObject);
  private
    ActualdataQuery:TpFIBDataSet;
    FIdSession:Int64;
    { Private declarations }
  public

    IsEdit:Boolean;
    IsView:Boolean;

    NewItem:Integer;
    procedure SetControlsState(ObjType:Integer);
    procedure InsertData;
    procedure UpdateData;
    procedure UpdateIfPeriodEqual;
    procedure UpdateIfPeriodnotEqual;
    function  CheckInputData:Boolean;
    { Public declarations }
    constructor Create(AOwner:TComponent;Id_session:Int64);reintroduce;
    destructor Destroy; reintroduce;
  end;

implementation

Uses BaseTypes, HSDialogs, UpKernelUnit;

{$R *.dfm}


procedure TfrmEditSch.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
     Resize:=false;
end;

procedure TfrmEditSch.FormShow(Sender: TObject);
var date_str,date_str1,date_str2: string;
begin
     SchTypeObjDataSet.Database     :=TfrmSchMain(self.Owner).WorkDatabase;
     SchTypeObjDataSet.Transaction  :=TfrmSchMain(self.Owner).ReadTransaction;
     SchTypeObjDataSet.Open;
     SchTypeObjDataSet.FetchAll;

     SchTypeDataSet.Database        :=TfrmSchMain(self.Owner).WorkDatabase;
     SchTypeDataSet.Transaction     :=TfrmSchMain(self.Owner).ReadTransaction;
     SchTypeDataSet.Open;
     SchTypeDataSet.FetchAll;

     RegDataSet.Database        :=TfrmSchMain(self.Owner).WorkDatabase;
     RegDataSet.Transaction     :=TfrmSchMain(self.Owner).ReadTransaction;

     TfrmSchMain(self.Owner).SysDataSet.Open;
     TfrmSchMain(self.Owner).SysDataSet.FetchAll;

     if TfrmSchMain(self.Owner).Use_mo=1
     then begin
               CheckChangeOperLinks.Visible:=true;
               CheckChangeOperDBLinks.Visible:=true;
               CheckChangeOperKrLinks.Visible:=true;
     end;


     RegDataSet.SelectSQL.Text  :='SELECT * FROM PUB_SP_REG_UCH_SELECT WHERE ID_FORM_UCH='+TfrmSchMain(self.Owner).SysDataSet.fieldByName('ID_SYSTEM').AsString;
     RegDataSet.Open;
     RegDataSet.FetchAll;

     if IsEdit
     then begin
               Label4.Enabled:=true;
               Label6.Enabled:=true;
               Label7.Enabled:=true;
               meDateBeg.Enabled:=true;
               EdObjKod.Enabled:=true;
               dbcbSchType.Enabled:=true;
               {Забираем информацияю по счету для редактирования}
               ActualdataQuery:=TpFIBDataSet.Create(self);
               ActualdataQuery.Database:=TfrmSchMain(self.Owner).WorkDatabase;
               ActualdataQuery.Transaction:=TfrmSchMain(self.Owner).ReadTransaction;
               dateTimetostring(date_str,'dd.mm.yyyy', TfrmSchMain(self.Owner).ActualDate);
               ActualdataQuery.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SP_MAIN_SCH_SELECT('+''''+date_str+''''+','+IntToStr(TfrmSchMain(self.Owner).Root)+')'+
                                              ' WHERE ID_SCH='+TfrmSchMain(self.Owner).SchTreeDataSet.FieldByName('ID_SCH').AsString;
               ActualdataQuery.Open;
               If ActualdataQuery.RecordCount>0
               then begin
                           EdTitle.Text           :=ActualdataQuery.FieldByName('SCH_TITLE').AsString;
                           EdObjKod.Text          :=ActualdataQuery.FieldByName('SCH_NUMBER').AsString;
                           dbcbSchType.EditValue   :=ActualdataQuery.FieldByName('SCH_TYPE').AsInteger;
                           SysReg.EditValue        :=ActualdataQuery.FieldByName('ID_SYSTEM').AsInteger;
                           dbcbObjectType.EditValue:=ActualdataQuery.FieldByName('TYPE_OBJECT').AsInteger;

                           DateTimeToString(date_str1,'mm.yyyy',ActualdataQuery.FieldByName('DATE_BEG').AsDateTime);
                           DateTimeToString(date_str2,'mm.yyyy',ActualdataQuery.FieldByName('DATE_END').AsDateTime);
                           meDateBeg.Text:=date_str1;
                           SetControlsState(Integer(dbcbObjectType.EditValue));
                           dbcbReg.EditValue:=ActualdataQuery.FieldByName('ID_REG_UCH').AsInteger;
               end;
               cxRadioGroup1.Visible:=true;
  end
  else begin
               {Забираем некоторые настройки из счета родителя}
               ActualdataQuery:=TpFIBDataSet.Create(self);
               ActualdataQuery.Database:=TfrmSchMain(self.Owner).WorkDatabase;
               ActualdataQuery.Transaction:=TfrmSchMain(self.Owner).ReadTransaction;
               dateTimetostring(date_str,'dd.mm.yyyy', TfrmSchMain(self.Owner).ActualDate);
               ActualdataQuery.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SP_MAIN_SCH_SELECT('+''''+date_str+''''+','+IntToStr(TfrmSchMain(self.Owner).Root)+')'+
                                              ' WHERE ID_SCH='+TfrmSchMain(self.Owner).SchTreeDataSet.FieldByName('ID_SCH').AsString;
               ActualdataQuery.Open;
               If ActualdataQuery.RecordCount>0
               then begin
                           EdTitle.Text           :=ActualdataQuery.FieldByName('SCH_TITLE').AsString;
                           EdObjKod.Text          :=ActualdataQuery.FieldByName('SCH_NUMBER').AsString;
                           SysReg.EditValue        :=ActualdataQuery.FieldByName('ID_SYSTEM').AsInteger;
                           dbcbSchType.EditValue   :=ActualdataQuery.FieldByName('SCH_TYPE').AsInteger;
                           DateTimeToString(date_str1,'mm.yyyy',ActualdataQuery.FieldByName('DATE_BEG').AsDateTime);
                           DateTimeToString(date_str2,'mm.yyyy',ActualdataQuery.FieldByName('DATE_END').AsDateTime);
                           meDateBeg.Text:=date_str1;
               end;
               dbcbObjectType.EditValue:=TfrmSchMain(self.Owner).SchTreeDataSet.FieldByName('TYPE_OBJECT').AsInteger+1;
               if TfrmSchMain(self.Owner).SchTreeDataSet.FieldByName('TYPE_OBJECT').AsInteger=3 then dbcbObjectType.EditValue:=3;
               SetControlsState(Integer(dbcbObjectType.EditValue));

               cxRadioGroup1.Visible:=false;
  end;

  if IsView
  then begin
        Label4.Enabled:=true;
        meDateBeg.Enabled:=false;
        EdObjKod.Enabled:=false;
        EdTitle.Enabled:=false;
        dbcbSchType.Enabled:=false;
        dbcbObjectType.Enabled:=false;
        ConfirmButton.Visible:=false;
  end;


end;

procedure TfrmEditSch.dbcbObjectTypeexClick(Sender: TObject);
begin
     SetControlsState(Integer(dbcbObjectType.EditValue));
end;

procedure TfrmEditSch.FormCreate(Sender: TObject);
begin
     IsEdit:=false;
     IsView:=false;
     PageControl1.ActivePageIndex:=0;
end;

procedure TfrmEditSch.SetControlsState(ObjType: Integer);
begin
       if (ObjType>=2)
       then begin
                  Label4.Enabled:=true;
                  Label6.Visible:=true;
                  Label7.Visible:=true;
                  meDateBeg.Enabled:=true;
                  EdObjKod.Visible:=true;
                  dbcbSchType.Visible:=true;
       end
       else begin
                  Label4.Enabled:=true{false};
                  Label6.Visible:=true;
                  Label7.Visible:=true{false};
                  meDateBeg.Enabled:=true;
                  EdObjKod.Visible:=true;
                  //dbcbSchType.KeyValue:=null;
                  dbcbSchType.Visible:=true{false};
       end;

end;


procedure TfrmEditSch.InsertData;
var Proc:TpFibStoredProc;
    data1_str,str_d:String;
    new_id:int64;
begin
            data1_str:='01.'+meDateBeg.Text;
            DateSeparator:='.';
            DateTimeToString(str_d,'dd.mm.yyyy', TfrmSchMain(self.Owner).ActualDate);


            Proc:=TpFibStoredProc.Create(self);
            Proc.Database:=TfrmSchMain(self.Owner).WorkDatabase;
            Proc.Transaction:=TfrmSchMain(self.Owner).WriteTransaction;

            StartHistory(TfrmSchMain(self.Owner).WriteTransaction);

            proc.StoredProcName:='PUB_SP_MAIN_SCH_INSERT';
            TfrmSchMain(self.Owner).WriteTransaction.StartTransaction;


            try
                  proc.Prepare;
                  proc.ParamByName('P_SCH_TITLE').value:=Trim(EdTitle.Text);
                  proc.ParamByName('P_SCH_NUMBER').Value:=EdObjKod.Text;
                  proc.ParamByName('P_ID_SYSTEM').Value:=SysReg.EditValue;
                  if dbcbSchType.EditValue=null
                  then proc.ParamByName('P_SCH_TYPE').Value:=0
                  else proc.ParamByName('P_SCH_TYPE').Value:=dbcbSchType.EditValue;


                  if (dbcbObjectType.EditValue<>1)
                  then proc.ParamByName('P_LINK_TO').Value :=TfrmSchMain(self.Owner).SchTreeDataSet.FieldByName('ID_SCH').Value
                  else proc.ParamByName('P_LINK_TO').Value :=1;
                  
                  proc.ParamByName('P_DATE_BEG').Value:=TfrmSchMain(self.Owner).ActualDate;

                  if TfrmSchMain(self.Owner).SchTreeView.FocusedNode.Parent<>nil
                  then begin
                           if  TfrmSchMain(self.Owner).SchTreeDataSet.FieldByName('TYPE_OBJECT').AsInteger>0
                               then  proc.ParamByName('P_DATE_END').Value:=TfrmSchMain(self.Owner).SchTreeDataSet.FieldByName('DATE_END').Value
                               else  proc.ParamByName('P_DATE_END').Value:=TfrmSchMain(self.Owner).INFINITY_DATE;
                  end
                  else proc.ParamByName('P_DATE_END').Value:=TfrmSchMain(self.Owner).INFINITY_DATE;

                  proc.ParamByName('P_TYPE_OBJECT').Value:=dbcbObjectType.EditValue;
                  proc.ParamByName('P_ID_REG_UCH').Value :=dbcbReg.EditValue;

                  proc.ExecProc;
                  new_id:=proc.ParamByName('P_ID_SCH').Value;

            except on E:Exception do
                  begin
                     MessageBox(Handle,PChar(E.Message),PChar(BU_WarningCaption),MB_OK and MB_ICONWARNING);
                     if TfrmSchMain(self.Owner).WriteTransaction.InTransaction then TfrmSchMain(self.Owner).WriteTransaction.Rollback;
                     Exit;
                  end;
            end;

            TfrmSchMain(self.Owner).WriteTransaction.Commit;

            Proc.Free;

            TfrmSchMain(self.Owner).SchTreeView.BeginUpdate;
            TfrmSchMain(self.Owner).RefreshToolButtonClick(owner);
            TfrmSchMain(self.Owner).LocateSch(new_id);
            TfrmSchMain(self.Owner).SchTreeView.EndUpdate;
end;

procedure TfrmEditSch.UpdateData;
var Date1, Date2:TDateTime;
begin
     Date1:=TfrmSchMain(self.Owner).SchTreeDataSet.FieldByName('DATE_BEG').AsDateTime;
     Date2:=TfrmSchMain(self.Owner).ActualDate;

     if (Date1=Date2)
     then begin
          {Когда дата функционирования совпадает с датой текущего рабочего периода}
          UpdateIfPeriodEqual;
     end
     else begin
          {Когда дата функционирования не совпадает с датой текущего рабочего периода}
          UpdateIfPeriodnotEqual;
     end;
end;

function TfrmEditSch.CheckInputData: Boolean;
var ResChecking:Boolean;
    data1_str:String;
begin
        ResChecking:=true;
        data1_str:='01.'+meDateBeg.Text;
        DateSeparator:='.';

        if (meDateBeg.Text='') and ResChecking
        then begin
             EdTitle.SetFocus;
             ResChecking:=false;
             HSDialogs.HSShowWarning(BU_TypeError,EdTitle,0,0);
        end;

       if (EdTitle.Text='') and ResChecking
       then begin
             EdTitle.SetFocus;
             ResChecking:=false;
             HSDialogs.HSShowWarning(BU_TypeError,EdTitle,0,0);
       end;

       if  dbcbObjectType.EditValue=3
       then begin
                  if (dbcbSchType.EditValue=null) and ResChecking
                  then begin
                       dbcbSchType.SetFocus;
                       ResChecking:=false;
                       HSDialogs.HSShowWarning(BU_TypeError,dbcbSchType,0,0);
                  end;
                  if (EdObjKod.Text='') and ResChecking
                  then  begin
                       EdObjKod.SetFocus;
                       ResChecking:=false;
                       HSDialogs.HSShowWarning(BU_TypeError,EdObjKod,0,0);
                  end;
       end;

       if (dbcbObjectType.EditValue=null) and ResChecking
       then begin
             dbcbObjectType.SetFocus;
             ResChecking:=false;
             HSDialogs.HSShowWarning(BU_TypeError,dbcbObjectType,0,0);
       end;

       if (dbcbReg.EditValue=null) and ResChecking
       then begin
             dbcbReg.SetFocus;
             ResChecking:=false;
             HSDialogs.HSShowWarning(BU_TypeError,dbcbReg,0,0);
       end;

       CheckInputData:=ResChecking;
end;

procedure TfrmEditSch.UpdateIfPeriodEqual;
var Proc:TpFibStoredProc;
    data1_str:String;
begin
              data1_str:='01.'+meDateBeg.Text;

              DateSeparator:='.';

              Proc:=TpFibStoredProc.Create(self);
              Proc.Database:=TfrmSchMain(self.Owner).WorkDatabase;
              Proc.Transaction:=TfrmSchMain(self.Owner).WriteTransaction;


              proc.StoredProcName:='PUB_SP_MAIN_SCH_UPDATE';
              if not TfrmSchMain(self.Owner).WriteTransaction.InTransaction then TfrmSchMain(self.Owner).WriteTransaction.StartTransaction;

              StartHistory(TfrmSchMain(self.Owner).WriteTransaction);

              try
                    proc.Prepare;
                    proc.ParamByName('BOOK_DATE').Value       :=TfrmSchMain(self.Owner).ActualDate;
                    proc.ParamByName('P_ID_SCH').Value        :=TfrmSchMain(self.Owner).SchTreeDataSet.FieldByName('ID_SCH').Value;
                    proc.ParamByName('P_SCH_TITLE').value:=EdTitle.Text;
                    proc.ParamByName('P_SCH_NUMBER').Value:=EdObjKod.Text;
                    proc.ParamByName('P_ID_SYSTEM').Value:=SysReg.EditValue;
                    if dbcbSchType.EditValue=null
                    then proc.ParamByName('P_SCH_TYPE').Value:=0
                    else proc.ParamByName('P_SCH_TYPE').Value:=dbcbSchType.EditValue;
                    proc.ParamByName('P_LINK_TO').Value :=TfrmSchMain(self.Owner).SchTreeDataSet.FieldByName('LINK_TO').Value;
                    proc.ParamByName('P_DATE_BEG').Value:=TfrmSchMain(self.Owner).ActualDate;
                    proc.ParamByName('P_TYPE_OBJECT').Value:=dbcbObjectType.EditValue;
                    proc.ParamByName('UPDATE_BEHAVIOR').Value:=cxRadioGroup1.ItemIndex;
                    proc.ParamByName('P_ID_REG_UCH').Value :=dbcbReg.EditValue;
                    proc.ParamByName('CHANGE_DB_LINKS').Value :=CheckChangeOperDBLinks.Checked;
                    proc.ParamByName('CHANGE_KR_LINKS').Value :=CheckChangeOperKRLinks.Checked;
                    proc.ParamByName('EDIT_SESSION').AsInt64  :=FIdSession;
                    proc.ExecProc;
              except on E:Exception do
                    begin
                       if TfrmSchMain(self.Owner).WriteTransaction.InTransaction then TfrmSchMain(self.Owner).WriteTransaction.Rollback;
                       BaseTypes.agMessageDlg(BU_ErrorCaption,E.Message,mtError,[mbOK]);
                    end;
              end;
              TfrmSchMain(self.Owner).WriteTransaction.Commit;

              TfrmSchMain(self.Owner).SchTreeView.BeginUpdate;
              TfrmSchMain(self.Owner).RefreshToolButtonClick(owner);
              TfrmSchMain(self.Owner).SchTreeView.EndUpdate;

end;

procedure TfrmEditSch.UpdateIfPeriodnotEqual;
var      Proc:TpFibStoredProc;
         data1_str:String;
begin
              data1_str:='01.'+meDateBeg.Text;
              DateSeparator:='.';
              Proc:=TpFibStoredProc.Create(self);
              Proc.Database:=TfrmSchMain(self.Owner).WorkDatabase;
              Proc.Transaction:=TfrmSchMain(self.Owner).WriteTransaction;
              proc.StoredProcName:='PUB_SP_MAIN_SCH_DELETE_EX';
              if not TfrmSchMain(self.Owner).WriteTransaction.InTransaction then TfrmSchMain(self.Owner).WriteTransaction.StartTransaction;

              StartHistory(TfrmSchMain(self.Owner).WriteTransaction);

              try
                    {Закрытие пердыдущим периодом}
                    proc.Prepare;
                    proc.ParamByName('P_ID_SCH').Value        :=TfrmSchMain(self.Owner).SchTreeDataSet.FieldByName('ID_SCH').Value;
                    proc.ParamByName('P_DATE_END').Value      :=TfrmSchMain(self.Owner).ActualDate-1;
                    proc.ExecProc;
                    proc.StoredProcName:='PUB_SP_MAIN_SCH_INSERT_WITH_ID';
                    proc.Prepare;
                    proc.ParamByName('P_ID_SCH').value    :=TfrmSchMain(self.Owner).SchTreeDataSet.FieldByName('ID_SCH').Value;;
                    proc.ParamByName('P_SCH_TITLE').value :=Trim(EdTitle.Text);
                    proc.ParamByName('P_ID_SYSTEM').value :=SysReg.EditValue;
                    proc.ParamByName('P_SCH_NUMBER').Value:=EdObjKod.Text;
                    if (dbcbSchType.EditValue=null)
                    then proc.ParamByName('P_SCH_TYPE').Value:=0
                    else proc.ParamByName('P_SCH_TYPE').Value:=dbcbSchType.EditValue;
                    proc.ParamByName('P_LINK_TO').Value  :=TfrmSchMain(self.Owner).SchTreeDataSet.FieldByName('LINK_TO').Value;;
                    proc.ParamByName('P_DATE_BEG').Value :=TfrmSchMain(self.Owner).ActualDate;
                    proc.ParamByName('P_TYPE_OBJECT').Value:=dbcbObjectType.EditValue;
                    proc.ParamByName('P_ID_REG_UCH').Value :=dbcbReg.EditValue;
                    proc.ParamByName('CHANGE_DB_LINKS').Value :=CheckChangeOperDBLinks.Checked;
                    proc.ParamByName('CHANGE_KR_LINKS').Value :=CheckChangeOperKRLinks.Checked;
                    proc.ParamByName('EDIT_SESSION').AsInt64  :=FIdSession;
                    proc.ExecProc;
              except on E:Exception do
                      begin
                            BaseTypes.agMessageDlg(BU_ErrorCaption,E.Message,mtError,[mbOK]);
                            if TfrmSchMain(self.Owner).WriteTransaction.InTransaction then TfrmSchMain(self.Owner).WriteTransaction.Rollback;
                      end;
              end;

              if TfrmSchMain(self.Owner).WriteTransaction.InTransaction then TfrmSchMain(self.Owner).WriteTransaction.Commit;

              TfrmSchMain(self.Owner).SchTreeView.BeginUpdate;
              TfrmSchMain(self.Owner).RefreshToolButtonClick(owner);
              TfrmSchMain(self.Owner).SchTreeView.EndUpdate;
end;

procedure TfrmEditSch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     TfrmSchMain(self.Owner).SysDataSet.Close;
end;

procedure TfrmEditSch.SysRegPropertiesChange(Sender: TObject);
begin
     RegDataSet.Close;
     RegDataSet.SelectSQL.Text  :='SELECT * FROM PUB_SP_REG_UCH_SELECT WHERE ID_FORM_UCH='+TfrmSchMain(self.Owner).SysDataSet.fieldByName('ID_SYSTEM').AsString;
     RegDataSet.Open;
     RegDataSet.FetchAll;
end;

procedure TfrmEditSch.ConfirmButtonClick(Sender: TObject);
begin
      if CheckInputData then begin
            if IsEdit
            then UpdateData
            else InsertData;
            Modalresult:=mryes;
      end;
end;

procedure TfrmEditSch.ConfirmActionExecute(Sender: TObject);
begin
      ConfirmButton.OnClick(self);
end;

procedure TfrmEditSch.EnterExecute(Sender: TObject);
begin
      ConfirmButton.OnClick(self);
end;

procedure TfrmEditSch.cancelButtonClick(Sender: TObject);
begin
      ModalResult:=mrno;
end;

procedure TfrmEditSch.cancelActionExecute(Sender: TObject);
begin
      cancelButton.OnClick(self);
end;

constructor TfrmEditSch.Create(AOwner: TComponent; Id_session: Int64);
var PrepareSp:TpFIBStoredProc;
begin
     inherited Create(AOwner);
     FIdSession:=Id_session;

     PrepareSp            :=TpFIBStoredProc.Create(self);
     PrepareSp.Database   :=TfrmSchMain(self.Owner).WorkDatabase;
     PrepareSp.Transaction:=TfrmSchMain(self.Owner).WriteTransaction;
     TfrmSchMain(self.Owner).WriteTransaction.StartTransaction;
     PrepareSp.StoredProcName:='PUB_SP_MAIN_SCH_GET_UPD_SESSION';
     PrepareSp.Prepare;
     PrepareSp.ParamByName('ACTUAL_DATE').Value :=TfrmSchMain(self.Owner).ActualDate;
     PrepareSp.ParamByName('ID_SCH').Value      :=TfrmSchMain(self.Owner).SchTreeDataSet.FieldByName('ID_SCH').Value;
     PrepareSp.ParamByName('ID_SESSION').asInt64:=FIdSession;
     PrepareSp.ExecProc;
     TfrmSchMain(self.Owner).WriteTransaction.Commit;
     PrepareSp.Close;
     PrepareSp.Free;

     EditPeriodsDataSet.SelectSQL.Text:='Select * from PUB_SP_MAIN_SCH_EDIT_SESSION where id_session='+IntTostr(FIdSession);
     EditPeriodsDataSet.Open;
     EditPeriodsDataSet.FetchAll;

     if (EditPeriodsDataSet.RecordCount<=1) then TabSheet2.TabVisible:=False;
end;

destructor TfrmEditSch.Destroy;
begin
     inherited Destroy;
end;

procedure TfrmEditSch.FormDestroy(Sender: TObject);
var PrepareSp:TpFIBStoredProc;
begin
     PrepareSp            :=TpFIBStoredProc.Create(self);
     PrepareSp.Database   :=TfrmSchMain(self.Owner).WorkDatabase;
     PrepareSp.Transaction:=TfrmSchMain(self.Owner).WriteTransaction;
     TfrmSchMain(self.Owner).WriteTransaction.StartTransaction;
     PrepareSp.StoredProcName:='PUB_SP_MAIN_SCH_UPD_CLEAR';
     PrepareSp.Prepare;
     PrepareSp.ParamByName('ID_SESSION').asInt64:=FIdSession;
     PrepareSp.ExecProc;
     TfrmSchMain(self.Owner).WriteTransaction.Commit;
     PrepareSp.Close;
     PrepareSp.Free;
end;

procedure TfrmEditSch.cxGrid1DBTableView1DblClick(Sender: TObject);
var UpdateSP:TpFIBStoredProc;
begin
     if EditPeriodsDataSet.RecordCount>0
     then begin
               if (agMessageDlg('Увага!', 'Ви хочете змінити інфомацію про редагування періоду?',mtConfirmation,[mbYes,mbNo])=mrYes)
               then begin
                         UpdateSP               :=TpFIBStoredProc.Create(self);
                         UpdateSP.Database      :=TfrmSchMain(self.Owner).WorkDatabase;
                         UpdateSP.Transaction   :=TfrmSchMain(self.Owner).WriteTransaction;
                         TfrmSchMain(self.Owner).WriteTransaction.StartTransaction;
                         UpdateSP.StoredProcName:='PUB_SP_MAIN_SCH_EDIT_UPD';
                         UpdateSP.Prepare;
                         UpdateSP.ParamByName('ID_SESSION').asInt64:=FIdSession;
                         UpdateSP.ParamByName('DATE_BEG').Value:=EditPeriodsDataSet.FieldByName('DATE_BEG').Value;
                         UpdateSP.ParamByName('DATE_END').Value:=EditPeriodsDataSet.FieldByName('DATE_END').Value;
                         UpdateSP.ParamByName('MAY_EDIT').Value:=1-EditPeriodsDataSet.FieldByName('MAY_EDIT').Value;
                         UpdateSP.ExecProc;
                         TfrmSchMain(self.Owner).WriteTransaction.Commit;
                         EditPeriodsDataSet.CloseOpen(true);
                         UpdateSP.Close;
                         UpdateSP.Free;
               end;
     end;
end;

end.
