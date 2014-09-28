unit uEditOperations;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, pFibDataSet,
  pFibStoredProc,Ibase, cxLookAndFeelPainters, cxButtons, ActnList,
  cxMaskEdit, cxButtonEdit, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxRadioGroup, cxCheckBox, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, FIBDataSet{, uMainSchSprav};


type
  TfrmEditOper = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    cbCR_PROV: TComboBox;
    cbCR_DOC: TComboBox;
    cbDB_PROV: TComboBox;
    cbDB_DOC: TComboBox;
    moComents: TMemo;
    ActionList1: TActionList;
    Esc: TAction;
    Label1: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    DbSchTitle: TEdit;
    KrSchTitle: TEdit;
    cxDB_DOC: TcxCheckBox;
    cxCR_DOC: TcxCheckBox;
    rbDB_PROV: TcxRadioButton;
    rbKR_PROV: TcxRadioButton;
    ConfirmButton: TcxButton;
    CancelButton: TcxButton;
    CALC_IN_DB_OBOR: TcxRadioGroup;
    DbRegDataSet: TpFIBDataSet;
    KrRegDataSet: TpFIBDataSet;
    DbDataSource: TDataSource;
    KrDataSource: TDataSource;
    Label7: TLabel;
    DbMOrders: TcxLookupComboBox;
    KrMOrders: TcxLookupComboBox;
    Label9: TLabel;
    Enter: TAction;
    cxButton1: TcxButton;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure cxDB_DOCPropertiesChange(Sender: TObject);
    procedure cxCR_DOCPropertiesChange(Sender: TObject);
    procedure rbDB_PROVClick(Sender: TObject);
    procedure rbKR_PROVClick(Sender: TObject);
    procedure ConfirmButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure CALC_IN_DB_OBORPropertiesChange(Sender: TObject);
    procedure EnterExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    IsEdit:Boolean;
    IsView:Boolean;
    min_date:TDateTime;
    max_date:TDateTime;
    id_sch:int64;
    sch_title:String;
    sch_type:Integer;
    sch_number:String;
    sch_system:integer;
    function CheckInputData:Boolean;
    procedure InsertData;
    procedure UpdateData;
    procedure UpdateIsPerioEqual;
    procedure UpdateIsPerioNotEqual;
    procedure getDefaults;
    { Public declarations }
  end;


implementation

{$R *.dfm}
uses uOperations, FIBQuery, Resources_unitb, GlobalSpr, UpKernelUnit;

procedure TfrmEditOper.FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
  Resize:=false;
end;

procedure TfrmEditOper.FormCreate(Sender: TObject);
begin
    Label2.Caption:=IS_KR_CR_PROV;
    Label3.Caption:=IS_KR_CR_DOC;
    Label4.Caption:=IS_DB_CR_PROV;
    Label5.Caption:=IS_DB_CR_DOC;
    ConfirmButton.Caption:=PUB_BUTTON_OK_CONST;
    CancelButton.Caption:=PUB_BUTTON_CANCEL_CONST;

    IsEdit:=false;
    IsView:=false;

    DbRegDataSet.Database   :=TfrmSchOperations(self.Owner).WorkDatabase;
    DbRegDataSet.Transaction:=TfrmSchOperations(self.Owner).ReadTransaction;

    KrRegDataSet.Database   :=TfrmSchOperations(self.Owner).WorkDatabase;
    KrRegDataSet.Transaction:=TfrmSchOperations(self.Owner).ReadTransaction;

    if (TfrmSchOperations(self.Owner).use_mo=1)
    then begin
              CALC_IN_DB_OBOR.Visible:=true;
              label7.Visible         :=true;
              label9.Visible         :=true;
              DbMOrders.Visible      :=true;
              KrMOrders.Visible      :=true;
    end
    else begin
              CALC_IN_DB_OBOR.Visible:=false;
              label7.Visible         :=false;
              label9.Visible         :=false;
              DbMOrders.Visible      :=false;
              KrMOrders.Visible      :=false;
    end; 
end;

procedure TfrmEditOper.FormShow(Sender: TObject);
begin
    if IsEdit
    then begin
              //TfrmSchOperations(self.Owner).PageControl1.ActivePageIndex=0 главный счет в дебете  операции
              //TfrmSchOperations(self.Owner).PageControl1.ActivePageIndex=1 главный счет в кредите операции
              if TfrmSchOperations(self.Owner).PageControl1.ActivePageIndex=1
              then begin
                        DbRegDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_REG_UCH WHERE ID_FORM_UCH='+TfrmSchOperations(self.Owner).krDataSet.FieldByName('DB_ID_FORM').AsString;
                        DbRegDataSet.Open;
                        DbMOrders.EditValue:=TfrmSchOperations(self.Owner).krDataSet.FieldByName('DB_ID_MO').Value;

                        KrRegDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_REG_UCH WHERE ID_FORM_UCH='+TfrmSchOperations(self.Owner).krDataSet.FieldByName('KR_ID_FORM').AsString;
                        KrRegDataSet.Open;
                        KrMOrders.EditValue:=TfrmSchOperations(self.Owner).krDataSet.FieldByName('KR_ID_MO').Value;

                        DbMOrders.Enabled:=true;
                        KrMOrders.Enabled:=true;
                        id_sch:=StrToInt64(TfrmSchOperations(self.Owner).krDataSet.FieldByName('DB_ID_SCH').AsString);

                        dbSchTitle.Color:=clInfoBk;

                        KrSchTitle.Text:=TfrmSchOperations(self.Owner).krDataSet.FieldByName('KR_SCH_NUMBER').AsString+' "'+TfrmSchOperations(self.Owner).krDataSet.FieldByName('KR_SCH_TITLE').AsString+'"';
                        DbSchTitle.Text:=TfrmSchOperations(self.Owner).krDataSet.FieldByName('DB_SCH_NUMBER').AsString+' "'+TfrmSchOperations(self.Owner).krDataSet.FieldByName('DB_SCH_TITLE').AsString+'"';

                        cxDB_DOC.Checked  :=Boolean(TfrmSchOperations(self.Owner).krDataSet.FieldByName('DB_CR_DOC').AsInteger);
                        rbDB_PROV.Checked :=Boolean(TfrmSchOperations(self.Owner).krDataSet.FieldByName('DB_CR_PROV').AsInteger);

                        cxCR_DOC.Checked  :=Boolean(TfrmSchOperations(self.Owner).krDataSet.FieldByName('KR_CR_DOC').AsInteger);
                        rbKR_PROV.Checked :=Boolean(TfrmSchOperations(self.Owner).krDataSet.FieldByName('KR_CR_PROV').AsInteger);

                        CALC_IN_DB_OBOR.ItemIndex:=TfrmSchOperations(self.Owner).krDataSet.FieldByName('CALC_OBOR_IN_DB').AsInteger;
                        CALC_IN_DB_OBOR.Properties.OnChange(self);
                        moComents.Text:=TfrmSchOperations(self.Owner).krDataSet.FieldByName('COMMENT').Value;
              end
              else begin
                        DbRegDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_REG_UCH WHERE ID_FORM_UCH='+TfrmSchOperations(self.Owner).dbDataSet.FieldByName('DB_ID_FORM').AsString;
                        DbRegDataSet.Open;
                        DbMOrders.EditValue:=TfrmSchOperations(self.Owner).DbDataSet.FieldByName('DB_ID_MO').Value;

                        KrRegDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_REG_UCH WHERE ID_FORM_UCH='+TfrmSchOperations(self.Owner).dbDataSet.FieldByName('KR_ID_FORM').AsString;
                        KrRegDataSet.Open;
                        KrMOrders.EditValue:=TfrmSchOperations(self.Owner).DbDataSet.FieldByName('Kr_ID_MO').Value;

                        DbMOrders.Enabled:=true;
                        KrMOrders.Enabled:=true;
                        id_sch:=StrToInt64(TfrmSchOperations(self.Owner).dbDataSet.FieldByName('KR_ID_SCH').AsString);

                        krSchTitle.Color:=clInfoBk;

                        KrSchTitle.Text:=TfrmSchOperations(self.Owner).dbDataSet.FieldByName('KR_SCH_NUMBER').AsString+' "'+TfrmSchOperations(self.Owner).dbDataSet.FieldByName('KR_SCH_TITLE').AsString+'"';
                        DbSchTitle.Text:=TfrmSchOperations(self.Owner).dbDataSet.FieldByName('DB_SCH_NUMBER').AsString+' "'+TfrmSchOperations(self.Owner).dbDataSet.FieldByName('DB_SCH_TITLE').AsString+'"';

                        cxDB_DOC.Checked  :=Boolean(TfrmSchOperations(self.Owner).dbDataSet.FieldByName('DB_CR_DOC').AsInteger);
                        cxCR_DOC.Checked  :=Boolean(TfrmSchOperations(self.Owner).dbDataSet.FieldByName('KR_CR_DOC').AsInteger);

                        rbDB_PROV.Checked :=Boolean(TfrmSchOperations(self.Owner).dbDataSet.FieldByName('DB_CR_PROV').AsInteger);
                        rbKR_PROV.Checked :=Boolean(TfrmSchOperations(self.Owner).dbDataSet.FieldByName('KR_CR_PROV').AsInteger);

                        CALC_IN_DB_OBOR.ItemIndex:=TfrmSchOperations(self.Owner).dbDataSet.FieldByName('CALC_OBOR_IN_DB').AsInteger;
                        CALC_IN_DB_OBOR.Properties.OnChange(self);
                        moComents.Text:=TfrmSchOperations(self.Owner).dbDataSet.FieldByName('COMMENT').Value;
              end;

    end
    else begin
              //TfrmSchOperations(self.Owner).PageControl1.ActivePageIndex=0 главный счет в дебете  операции
              //TfrmSchOperations(self.Owner).PageControl1.ActivePageIndex=1 главный счет в кредите операции
              if TfrmSchOperations(self.Owner).PageControl1.ActivePageIndex=0
              then begin
                        KrSchTitle.Color:=clInfoBk;
                        DbSchTitle.Text:=TfrmSchOperations(self.Owner).Curr_Sch_number+' "'+TfrmSchOperations(self.Owner).Curr_Sch_title;
                        DbRegDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_REG_UCH WHERE ID_FORM_UCH='+IntTostr(TfrmSchOperations(self.Owner).cur_id_system);
                        DbRegDataSet.Open;
                        DbMOrders.EditValue:=TfrmSchOperations(self.Owner).cur_id_reg_uch; {DbRegDataSet.FieldByName('ID_REG').Value}
                        DbMOrders.Enabled:=true;
              end
              else begin
                        DBSchTitle.Color:=clInfoBk;
                        KrSchTitle.Text:=TfrmSchOperations(self.Owner).Curr_Sch_number+' "'+TfrmSchOperations(self.Owner).Curr_Sch_title;
                        KrRegDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_REG_UCH WHERE ID_FORM_UCH='+IntTostr(TfrmSchOperations(self.Owner).cur_id_system);
                        KrRegDataSet.Open;
                        KrMOrders.EditValue:=TfrmSchOperations(self.Owner).cur_id_reg_uch; {KrRegDataSet.FieldByName('ID_REG').Value}
                        KrMOrders.Enabled:=true;
              end;
    end;

    if IsView
    then begin
              ConfirmButton.Visible:=false;
    end;         
end;

function TfrmEditOper.CheckInputData: Boolean;
var ResChecking:Boolean;
    CrossperiodCheck:TpFibStoredProc;
begin
        CrossperiodCheck:=nil;
        ResChecking:=true;
        if (cbCR_PROV.itemIndex=-1) and ResChecking
        then begin
                   cbCR_PROV.SetFocus;
                   ResChecking:=false;
                   MessageBox(Application.Handle,PChar(BU_OperPropError),PChar(BU_ErrorCaption),MB_OK or MB_ICONERROR);
        end;
        if (cbCR_DOC.itemIndex=-1) and ResChecking
        then begin
                   cbCR_DOC.SetFocus;
                   ResChecking:=false;
                   MessageBox(Application.Handle,PChar(BU_OperPropError),PChar(BU_ErrorCaption),MB_OK or MB_ICONERROR);
        end;
        if (cbDB_PROV.itemIndex=-1) and ResChecking
        then begin
                   cbDB_PROV.SetFocus;
                   ResChecking:=false;
                   MessageBox(Application.Handle,PChar(BU_OperPropError),PChar(BU_ErrorCaption),MB_OK or MB_ICONERROR);
        end;
        if (cbDB_DOC.itemIndex=-1) and ResChecking
        then begin
                   cbDB_DOC.SetFocus;
                   ResChecking:=false;
                   MessageBox(Application.Handle,PChar(BU_OperPropError),PChar(BU_ErrorCaption),MB_OK or MB_ICONERROR);
        end;

        if (TfrmSchOperations(self.Owner).PageControl1.ActivePageIndex=1)
        then begin
             if (KrSchTitle.Text='') and ResChecking
             then begin
                       KrSchTitle.SetFocus;
                       ResChecking:=false;
                       MessageBox(Application.Handle,PChar(BU_OperPropError),PChar(BU_ErrorCaption),MB_OK or MB_ICONERROR);
             end;
        end
        else begin
             if (DbSchTitle.Text='') and ResChecking
             then begin
                       DbSchTitle.SetFocus;
                       ResChecking:=false;
                       MessageBox(Application.Handle,PChar(BU_OperPropError),PChar(BU_ErrorCaption),MB_OK or MB_ICONERROR);
             end;
        end;

        if ((DbSchTitle.Text='') or (KrSchTitle.Text='')) and ResChecking
        then begin
                  ResChecking:=false;
                  MessageBox(Application.Handle,PChar('Не введено всі рахунки операції'),PChar(BU_ErrorCaption),MB_OK or MB_ICONERROR);
        end;


        if ((1-cbDB_PROV.itemIndex)+((1-cbCR_PROV.itemIndex))<>1) and ResChecking
        then begin
                   ResChecking:=false;
                   MessageBox(Application.Handle,PChar('Операція може створювати проводку лише в одній частині'),PChar(BU_ErrorCaption),MB_OK or MB_ICONERROR);
        end;

        if ((1-cbDB_DOC.itemIndex)+((1-cbCR_DOC.itemIndex))<1) and ResChecking
        then begin
                   ResChecking:=false;
                   MessageBox(Application.Handle,PChar('Операція повинна створювати документ'),PChar(BU_ErrorCaption),MB_OK or MB_ICONERROR);
        end;

        if  (   cxDB_DOC.Checked
            and (not rbDB_PROV.Checked)

            and rbKR_PROV.Checked
            and (not cxCR_DOC.Checked) )

            and ResChecking
        then begin
                   ResChecking:=false;
                   MessageBox(Application.Handle,PChar('Операція повинна створювати документ в кредиті.'),PChar(BU_ErrorCaption),MB_OK or MB_ICONERROR);
        end;

        if (cxCR_DOC.Checked
           and (not rbKR_PROV.Checked)

           and rbDB_PROV.Checked
           and (not cxDB_DOC.Checked))

           and ResChecking
        then begin
                   ResChecking:=false;
                   MessageBox(Application.Handle,PChar('Операція повинна створювати документ в дебеті.'),PChar(BU_ErrorCaption),MB_OK or MB_ICONERROR);
        end;

        if (Id_sch<>0)
        then begin
                    CrossperiodCheck:=TpFibStoredProc.Create(self);
                    CrossperiodCheck.Database:=TfrmSchOperations(self.Owner).WorkDatabase;
                    CrossperiodCheck.Transaction:=TfrmSchOperations(self.Owner).ReadTransaction;
                    CrossperiodCheck.StoredProcName:='PUB_GET_CROSS_DATES';
                    CrossperiodCheck.Prepare;
                    CrossperiodCheck.ParamByName('P_BOOK_DATE').Value  :=TfrmSchOperations(self.Owner).Curr_data;
                    CrossperiodCheck.ParamByName('P_DB_SCH_ID').AsInt64:=TfrmSchOperations(self.Owner).Curr_Id_Sch;
                    CrossperiodCheck.ParamByName('P_CR_SCH_ID').AsInt64:=Id_sch;
                    CrossperiodCheck.ExecProc;

                    if (CrossperiodCheck.ParamByName('IS_CROSSED').AsInteger=0)
                    then begin
                               ResChecking:=false;
                               MessageBox(Application.Handle,PChar(BU_CROSSERROR),PChar(BU_ErrorCaption),MB_OK or MB_ICONERROR);
                    end
                    else begin
                               min_date:=CrossperiodCheck.ParamByName('MIN_DATE').AsDateTime;
                               max_date:=CrossperiodCheck.ParamByName('MAX_DATE').AsDateTime;
                    end;
        end;

        if Assigned(CrossperiodCheck) then CrossperiodCheck.Free;
        CheckInputData:=ResChecking;
end;

procedure TfrmEditOper.InsertData;
var Proc:TpFibStoredProc;
begin
      Proc:=TpFibStoredProc.Create(self);
      Proc.Database:=TfrmSchOperations(self.Owner).WorkDatabase;
      Proc.Transaction:=TfrmSchOperations(self.Owner).WriteTransaction;
      proc.StoredProcName:='PUB_SP_MAIN_OPER_INSERT_V2';
      TfrmSchOperations(self.Owner).WriteTransaction.StartTransaction;

      StartHistory(TfrmSchOperations(self.Owner).WriteTransaction);

      try
            proc.Prepare;
            if (TfrmSchOperations(self.Owner).PageControl1.ActivePageIndex=0)
            then begin
                      proc.ParamByName('P_DATE_BEG').value        :=TfrmSchOperations(self.Owner).Curr_data;
                      proc.ParamByName('P_DATE_END').value        :=max_date;
                      proc.ParamByName('P_OPER_DB_ID_SCH').AsInt64:=TfrmSchOperations(self.Owner).Curr_Id_Sch;
                      proc.ParamByName('P_OPER_KR_ID_SCH').AsInt64:=Id_sch;
            end
            else begin
                      proc.ParamByName('P_DATE_BEG').value        :=TfrmSchOperations(self.Owner).Curr_data;
                      proc.ParamByName('P_DATE_END').value        :=max_date;
                      proc.ParamByName('P_OPER_DB_ID_SCH').AsInt64:=Id_sch;
                      proc.ParamByName('P_OPER_KR_ID_SCH').AsInt64:=TfrmSchOperations(self.Owner).Curr_Id_Sch;
            end;
            proc.ParamByName('P_OPER_DB_CR_PROV').value :=not Boolean(cbDB_PROV.itemIndex);
            proc.ParamByName('P_OPER_DB_CR_DOC').value  :=not Boolean(cbDB_DOC.itemIndex);
            proc.ParamByName('P_OPER_KR_CR_PROV').value :=not Boolean(cbCR_PROV.itemIndex);
            proc.ParamByName('P_OPER_KR_CR_DOC').value  :=not Boolean(cbCR_DOC.itemIndex);
            proc.ParamByName('P_OPER_COMMENT').value    :=moComents.Lines.Text;

            proc.ParamByName('P_KR_ID_MO').Value        :=KrMOrders.EditValue;
            proc.ParamByName('P_DB_ID_MO').Value        :=DbMOrders.EditValue;
            proc.ParamByName('P_CALC_OBOR_IN_DB').Value  :=CALC_IN_DB_OBOR.ItemIndex;

            proc.ExecProc;
      except on E:Exception do
            begin
                      if TfrmSchOperations(self.Owner).WriteTransaction.InTransaction
                      then TfrmSchOperations(self.Owner).WriteTransaction.Rollback;
                      ShowMessage(E.Message);
            end;
      end;
      max_date:=0;
      min_date:=0;
      TfrmSchOperations(self.Owner).WriteTransaction.Commit;
      TfrmSchOperations(self.Owner).RefreshButtonClick(nil);
end;

procedure TfrmEditOper.UpdateData;
  var Date1,Date2:TDateTime;
begin
     if (TfrmSchOperations(self.Owner).PageControl1.ActivePageIndex=0)
     then begin
               Date1:=TfrmSchOperations(self.Owner).DbDataSet.FieldByName('DATE_BEG').Value;
               Date2:=TfrmSchOperations(self.Owner).Curr_data;
     end
     else begin
               Date1:=TfrmSchOperations(self.Owner).KrDataSet.FieldByName('DATE_BEG').Value;
               Date2:=TfrmSchOperations(self.Owner).Curr_data;
     end;
     if(Date1=Date2)
     then UpdateIsPerioEqual
     else UpdateIsPerioNotEqual;
end;


procedure TfrmEditOper.UpdateIsPerioEqual;
var Proc:TpFibStoredProc;
begin
      Proc:=TpFibStoredProc.Create(self);
      Proc.Database:=TfrmSchOperations(self.Owner).WorkDatabase;
      Proc.Transaction:=TfrmSchOperations(self.Owner).WriteTransaction;
      proc.StoredProcName:='PUB_SP_MAIN_OPER_UPDATE_V2';
      TfrmSchOperations(self.Owner).WriteTransaction.StartTransaction;

      StartHistory(TfrmSchOperations(self.Owner).WriteTransaction);

      try
            proc.Prepare;
            if (TfrmSchOperations(self.Owner).PageControl1.ActivePageIndex=0)
            then begin
                      proc.ParamByName('P_ID_OPER').asInt64 :=StrToInt64(TfrmSchOperations(self.Owner).DbDataSet.FieldByName('ID_OPER').asString);
                      proc.ParamByName('P_DATE_BEG').value  :=TfrmSchOperations(self.Owner).Curr_data;
                      proc.ParamByName('P_DATE_END').Value  :=TfrmSchOperations(self.Owner).DbDataSet.FieldByName('DATE_END').Value;
                      proc.ParamByName('P_OPER_DB_ID_SCH').AsInt64:=TfrmSchOperations(self.Owner).Curr_Id_Sch;
                      proc.ParamByName('P_OPER_KR_ID_SCH').AsInt64:=Id_sch;
            end
            else begin
                      proc.ParamByName('P_ID_OPER').asInt64 :=StrToInt64(TfrmSchOperations(self.Owner).KrDataSet.FieldByName('ID_OPER').asString);
                      proc.ParamByName('P_DATE_BEG').Value  :=TfrmSchOperations(self.Owner).Curr_data;
                      proc.ParamByName('P_DATE_END').Value  :=TfrmSchOperations(self.Owner).KrDataSet.FieldByName('DATE_END').Value;
                      proc.ParamByName('P_OPER_DB_ID_SCH').AsInt64:=Id_sch;
                      proc.ParamByName('P_OPER_KR_ID_SCH').AsInt64:=TfrmSchOperations(self.Owner).Curr_Id_Sch;
            end;
            proc.ParamByName('P_OPER_DB_CR_PROV').value   :=not Boolean(cbDB_PROV.itemIndex);
            proc.ParamByName('P_OPER_DB_CR_DOC').value    :=not Boolean(cbDB_DOC.itemIndex);
            proc.ParamByName('P_OPER_KR_CR_PROV').value   :=not Boolean(cbCR_PROV.itemIndex);
            proc.ParamByName('P_OPER_KR_CR_DOC').value    :=not Boolean(cbCR_DOC.itemIndex);
            proc.ParamByName('P_OPER_COMMENT').Value      :=moComents.Lines.Text;
            proc.ParamByName('P_KR_ID_MO').AsInt64        :=KrMOrders.EditValue;
            proc.ParamByName('P_DB_ID_MO').AsInt64        :=DbMOrders.EditValue;
            proc.ParamByName('P_CALC_OBOR_IN_DB').Value   :=CALC_IN_DB_OBOR.ItemIndex;
            proc.ExecProc;
      except on E:Exception do
            begin
                  if TfrmSchOperations(self.Owner).WriteTransaction.InTransaction
                  then TfrmSchOperations(self.Owner).WriteTransaction.Rollback;
                  ShowMessage(E.Message);
            end;
      end;
      TfrmSchOperations(self.Owner).WriteTransaction.Commit;
      TfrmSchOperations(self.Owner).RefreshButtonClick(nil);
end;

procedure TfrmEditOper.UpdateIsPerioNotEqual;
var Proc:TpFibStoredProc;
begin
    Proc:=TpFibStoredProc.Create(self);
    Proc.Database:=TfrmSchOperations(self.Owner).WorkDatabase;
    Proc.Transaction:=TfrmSchOperations(self.Owner).WriteTransaction;
    proc.StoredProcName:='PUB_SP_MAIN_OPER_UPDATE_EX_V2';
    TfrmSchOperations(self.Owner).WriteTransaction.StartTransaction;

    StartHistory(TfrmSchOperations(self.Owner).WriteTransaction);


    try
          //Сохранение истории по операции
          proc.Prepare;
          proc.ParamByName('P_DATE_END').Value  :=TfrmSchOperations(self.Owner).Curr_data-1;
          if (TfrmSchOperations(self.Owner).PageControl1.ActivePageIndex=0)
          then begin
                    proc.ParamByName('P_ID_OPER').Value         :=TfrmSchOperations(self.Owner).DbDataSet.FieldByName('ID_OPER').Value;
                    proc.ParamByName('P_DATE_BEG').value        :=TfrmSchOperations(self.Owner).DbDataSet.FieldByName('DATE_BEG').Value;
                    proc.ParamByName('P_OPER_DB_ID_SCH').asInt64:=StrToInt64(TfrmSchOperations(self.Owner).DbDataSet.FieldByName('DB_ID_SCH').AsString);
                    proc.ParamByName('P_OPER_KR_ID_SCH').asInt64:=StrToInt64(TfrmSchOperations(self.Owner).DbDataSet.FieldByName('KR_ID_SCH').AsString);
                    proc.ParamByName('P_OPER_DB_CR_PROV').value :=TfrmSchOperations(self.Owner).DbDataSet.FieldByName('DB_CR_PROV').Value;
                    proc.ParamByName('P_OPER_DB_CR_DOC').value  :=TfrmSchOperations(self.Owner).DbDataSet.FieldByName('DB_CR_DOC').Value;
                    proc.ParamByName('P_OPER_KR_CR_PROV').value :=TfrmSchOperations(self.Owner).DbDataSet.FieldByName('KR_CR_PROV').Value;
                    proc.ParamByName('P_OPER_KR_CR_DOC').value  :=TfrmSchOperations(self.Owner).DbDataSet.FieldByName('KR_CR_DOC').Value;
                    proc.ParamByName('P_OPER_COMMENT').Value    :=TfrmSchOperations(self.Owner).DbDataSet.FieldByName('COMMENT').Value;

                    proc.ParamByName('P_KR_ID_MO').AsInt64      :=TfrmSchOperations(self.Owner).DbDataSet.FieldByName('KR_ID_MO').Value;
                    proc.ParamByName('P_DB_ID_MO').AsInt64      :=TfrmSchOperations(self.Owner).DbDataSet.FieldByName('DB_ID_MO').Value;
                    proc.ParamByName('P_CALC_OBOR_IN_DB').Value :=TfrmSchOperations(self.Owner).DbDataSet.FieldByName('CALC_OBOR_IN_DB').Value;
          end
          else begin
                    proc.ParamByName('P_ID_OPER').Value         :=TfrmSchOperations(self.Owner).KrDataSet.FieldByName('ID_OPER').Value;
                    proc.ParamByName('P_DATE_BEG').value        :=TfrmSchOperations(self.Owner).KrDataSet.FieldByName('DATE_BEG').Value;
                    proc.ParamByName('P_OPER_DB_ID_SCH').asInt64:=StrToInt64(TfrmSchOperations(self.Owner).KrDataSet.FieldByName('DB_ID_SCH').AsString);
                    proc.ParamByName('P_OPER_KR_ID_SCH').asInt64:=StrToInt64(TfrmSchOperations(self.Owner).KrDataSet.FieldByName('KR_ID_SCH').AsString);
                    proc.ParamByName('P_OPER_DB_CR_PROV').value :=TfrmSchOperations(self.Owner).KrDataSet.FieldByName('DB_CR_PROV').Value;
                    proc.ParamByName('P_OPER_DB_CR_DOC').value  :=TfrmSchOperations(self.Owner).KrDataSet.FieldByName('DB_CR_DOC').Value;
                    proc.ParamByName('P_OPER_KR_CR_PROV').value :=TfrmSchOperations(self.Owner).KrDataSet.FieldByName('KR_CR_PROV').Value;
                    proc.ParamByName('P_OPER_KR_CR_DOC').value  :=TfrmSchOperations(self.Owner).KrDataSet.FieldByName('KR_CR_DOC').Value;
                    proc.ParamByName('P_OPER_COMMENT').Value    :=TfrmSchOperations(self.Owner).KrDataSet.FieldByName('COMMENT').Value;

                    proc.ParamByName('P_KR_ID_MO').AsInt64      :=TfrmSchOperations(self.Owner).KrDataSet.FieldByName('KR_ID_MO').Value;
                    proc.ParamByName('P_DB_ID_MO').AsInt64      :=TfrmSchOperations(self.Owner).KrDataSet.FieldByName('DB_ID_MO').Value;
                    proc.ParamByName('P_CALC_OBOR_IN_DB').Value :=TfrmSchOperations(self.Owner).KrDataSet.FieldByName('CALC_OBOR_IN_DB').Value;
          end;
          proc.ExecProc;

          proc.StoredProcName:='PUB_SP_MAIN_OPER_INSERT_ID_V2';
          proc.Prepare;
          //Добавление новых данных
          proc.ParamByName('P_DATE_BEG').value                  :=TfrmSchOperations(self.Owner).Curr_data;

          if (TfrmSchOperations(self.Owner).PageControl1.ActivePageIndex=0)
          then begin
                    proc.ParamByName('P_ID_OPER').value         :=TfrmSchOperations(self.Owner).DbDataSet.FieldByName('ID_OPER').Value;
                    proc.ParamByName('P_DATE_END').value        :=TfrmSchOperations(self.Owner).DbDataSet.FieldByName('DATE_END').Value;
                    proc.ParamByName('P_OPER_DB_ID_SCH').AsInt64:=TfrmSchOperations(self.Owner).Curr_Id_Sch;
                    proc.ParamByName('P_OPER_KR_ID_SCH').AsInt64:=Id_sch;
          end
          else begin
                    proc.ParamByName('P_ID_OPER').value         :=TfrmSchOperations(self.Owner).KrDataSet.FieldByName('ID_OPER').Value;
                    proc.ParamByName('P_DATE_END').value        :=TfrmSchOperations(self.Owner).KrDataSet.FieldByName('DATE_END').Value;
                    proc.ParamByName('P_OPER_DB_ID_SCH').AsInt64:=Id_sch;
                    proc.ParamByName('P_OPER_KR_ID_SCH').AsInt64:=TfrmSchOperations(self.Owner).Curr_Id_Sch;
          end;

          proc.ParamByName('P_OPER_DB_CR_PROV').value          :=not Boolean(cbDB_PROV.itemIndex);
          proc.ParamByName('P_OPER_DB_CR_DOC').value           :=not Boolean(cbDB_DOC.itemIndex);
          proc.ParamByName('P_OPER_KR_CR_PROV').value          :=not Boolean(cbCR_PROV.itemIndex);
          proc.ParamByName('P_OPER_KR_CR_DOC').value           :=not Boolean(cbCR_DOC.itemIndex);
          proc.ParamByName('P_OPER_COMMENT').value             :=moComents.Lines.Text;
          proc.ParamByName('P_KR_ID_MO').AsInt64               :=KrMOrders.EditValue;
          proc.ParamByName('P_DB_ID_MO').AsInt64               :=DbMOrders.EditValue;
          proc.ParamByName('P_CALC_OBOR_IN_DB').Value          :=CALC_IN_DB_OBOR.ItemIndex;
          proc.ExecProc;

          TfrmSchOperations(self.Owner).WriteTransaction.Commit;
          TfrmSchOperations(self.Owner).RefreshButtonClick(nil);
          proc.Free;
    except on E:Exception do
        begin
              if TfrmSchOperations(self.Owner).WriteTransaction.InTransaction
              then TfrmSchOperations(self.Owner).WriteTransaction.Rollback;
              ShowMessage(E.Message);
        end;
    end;
end;

procedure TfrmEditOper.Action1Execute(Sender: TObject);
begin
     ConfirmButton.OnClick(self);
end;

procedure TfrmEditOper.EscExecute(Sender: TObject);
begin
     CancelButton.OnClick(self);
end;

procedure TfrmEditOper.getDefaults;
var DefStoredProc:TpFibStoredProc;
begin
     DefStoredProc:=TpFibStoredProc.Create(self);
     DefStoredProc.Database:=TfrmSchOperations(self.Owner).WorkDatabase;
     DefStoredProc.Transaction:=TfrmSchOperations(self.Owner).ReadTransaction;
     DefStoredProc.StoredProcName:='PUB_SP_MAIN_OPER_SET_DEFAULTS';
     DefStoredProc.Prepare;
     if TfrmSchOperations(self.Owner).PageControl1.ActivePageIndex=0
     then begin
                DefStoredProc.ParamByName('DB_ID_SCH').asInt64:=TfrmSchOperations(self.Owner).Curr_Id_Sch;
                DefStoredProc.ParamByName('KR_ID_SCH').AsInt64:=Id_sch;
     end
     else begin
                DefStoredProc.ParamByName('KR_ID_SCH').AsInt64:=TfrmSchOperations(self.Owner).Curr_Id_Sch;
                DefStoredProc.ParamByName('DB_ID_SCH').AsInt64:=Id_sch;
     end;
     DefStoredProc.ParamByName('DATE_REG').Value:=TfrmSchOperations(self.Owner).Curr_data;
     DefStoredProc.ExecProc;

     If DefStoredProc.ParamByName('OPER_KR_CR_DOC').AsInteger=1
     then cbCR_DOC.ItemIndex:=0
     else cbCR_DOC.ItemIndex:=1;

     If DefStoredProc.ParamByName('OPER_DB_CR_DOC').AsInteger=1
     then cbDB_DOC.ItemIndex:=0
     else cbDB_DOC.ItemIndex:=1;

     If DefStoredProc.ParamByName('OPER_KR_CR_PROV').AsInteger=1
     then cbCR_PROV.ItemIndex:=0
     else cbCR_PROV.ItemIndex:=1;

     If DefStoredProc.ParamByName('OPER_DB_CR_PROV').AsInteger=1
     then cbDB_PROV.ItemIndex:=0
     else cbDB_PROV.ItemIndex:=1;
 
     CALC_IN_DB_OBOR.ItemIndex:=cbDB_PROV.ItemIndex;

     cxDB_DOC.Checked  :=Boolean(1-cbDB_DOC.ItemIndex);
     cxCR_DOC.Checked  :=Boolean(1-cbCR_DOC.ItemIndex);
     rbDB_PROV.Checked :=Boolean(1-cbDB_PROV.ItemIndex);
     rbKR_PROV.Checked :=Boolean(1-cbCR_PROV.ItemIndex);

     DefStoredProc.Close;
     DefStoredProc.Free;
end;

procedure TfrmEditOper.cxDB_DOCPropertiesChange(Sender: TObject);
begin
     cbDB_DOC.ItemIndex:=Integer(not cxDB_DOC.Checked);
end;

procedure TfrmEditOper.cxCR_DOCPropertiesChange(Sender: TObject);
begin
     cbCR_DOC.itemIndex:=Integer(not cxCR_DOC.Checked);
end;

procedure TfrmEditOper.rbDB_PROVClick(Sender: TObject);
begin
    cbDB_PROV.ItemIndex:=Integer(not rbDB_PROV.checked);
    cbCR_PROV.ItemIndex:=Integer(    rbDB_PROV.checked);
end;

procedure TfrmEditOper.rbKR_PROVClick(Sender: TObject);
begin
    cbDB_PROV.ItemIndex:=Integer(    rbKR_PROV.checked);
    cbCR_PROV.ItemIndex:=Integer(not rbKR_PROV.checked);
end;

procedure TfrmEditOper.ConfirmButtonClick(Sender: TObject);
begin
      if CheckInputData then begin
            if IsEdit then  UpdateData
            else            InsertData;
            Modalresult:=mryes;
      end;
end;

procedure TfrmEditOper.CancelButtonClick(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmEditOper.CALC_IN_DB_OBORPropertiesChange(Sender: TObject);
begin
     if (CALC_IN_DB_OBOR.ItemIndex=0)
     then begin
               KrMOrders.Style.Color:=clInfoBk;
               KrMOrders.Style.Font.Style:=[fsBold];

               DbMOrders.Style.Color     :=clInactiveCaptionText;
               DbMOrders.Style.Font.Style:=[];
     end
     else begin
               KrMOrders.Style.Color     :=clInactiveCaptionText;
               KrMOrders.Style.Font.Style:=[];


               DbMOrders.Style.Color:=clInfoBk;
               DbMOrders.Style.Font.Style:=[fsBold];
     end;
end;

procedure TfrmEditOper.EnterExecute(Sender: TObject);
begin
  ConfirmButton.OnClick(self);
end;

procedure TfrmEditOper.cxButton1Click(Sender: TObject);
var
  RES: Variant;
  date_str: string;
  temp_dataset: TpFibDataSet;
  default_id: integer;
begin
    Res:=GlobalSpr.GetSch( self, KrRegDataSet.Database.Handle, fsStayOnTop, TfrmSchOperations(Self.Owner).Curr_data, DEFAULT_ROOT_ID, 0, 0);

    if VarArrayDimCount(RES)=1 then
    begin
        id_sch    :=RES[0][0];
        sch_title :=RES[0][1];
        sch_type  :=RES[0][2];
        sch_number:=RES[0][3];
        sch_system:=RES[0][4];

        dateTimetostring(date_str,'dd.mm.yyyy', TfrmSchOperations(self.Owner).Curr_data);
        temp_dataset:=TpFibDataSet.Create(self.Owner);
        temp_dataset.Database:=TfrmSchOperations(self.Owner).WorkDatabase;
        temp_dataset.Transaction:=TfrmSchOperations(self.Owner).ReadTransaction;
        temp_dataset.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SP_MAIN_SCH_SELECT('+''''+date_str+''''+','+IntToStr(DEFAULT_ROOT_ID)+')'+
                                          ' WHERE ID_SCH='+IntToStr(id_sch);
        temp_dataset.Open;
        temp_dataset.FetchAll;
        if temp_dataset.RecordCount>0
        then begin
                default_id:=temp_dataset.FieldByName('ID_REG_UCH').Value;
                if (TfrmSchOperations(self.Owner).PageControl1.ActivePageIndex=0)
                then begin
                        KrSchTitle.Text:=temp_dataset.FieldByName('SCH_NUMBER').AsString+' '+temp_dataset.FieldByName('SCH_TITLE').AsString;
                        if krRegDataSet.Active then krRegDataSet.Close;
                        krRegDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_REG_UCH WHERE ID_FORM_UCH='+IntTostr(sch_system);
                        krRegDataSet.Open;
                        KrMOrders.Enabled:=true;
                        krMOrders.EditValue:=default_id;{krRegDataSet.FieldByName('ID_REG').Value}
                end
                else begin
                        DbSchTitle.Text:=temp_dataset.FieldByName('SCH_NUMBER').AsString+' '+temp_dataset.FieldByName('SCH_TITLE').AsString;
                        if dbRegDataSet.Active then dbRegDataSet.Close;
                        dbRegDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_REG_UCH WHERE ID_FORM_UCH='+IntTostr(sch_system);
                        dbRegDataSet.Open;
                        DbMOrders.Enabled:=true;
                        dbMOrders.EditValue:=default_id;{dbRegDataSet.FieldByName('ID_REG').Value}
                end;         
        end;


        try
                getDefaults;
                except on Exception do begin end;
        end;
    end;
end;

end.
