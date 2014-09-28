unit BankNichAddSprav;

interface

uses
  {Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxDropDownEdit, cxControls, cxContainer, cxEdit,
  cxMaskEdit, cxButtonEdit, dxBarExtItems, dxBar, StdCtrls, ExtCtrls,
  FIBDatabase, pFIBDatabase, GlobalSpr, PfibStoredProc, FIBQuery, pFIBQuery, DB, Ibase; }
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ToolWin, ComCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, ExtCtrls,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  FIBDataSet, pFIBDataSet, cxContainer, cxLabel, cxCheckBox,
  FIBQuery, pFIBQuery, pFIBStoredProc, cxCalendar, cxCurrencyEdit, dxBar,
  dxBarExtItems, StdCtrls, ActnList, IBase, FIBDatabase, pFIBDatabase,
  cxTextEdit, cxMemo, cxFilterControl, cxDBFilterControl, cxDBEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, LoadDogManedger, ImgList, cxTL, frxClass, frxDBSet,
  cxGroupBox, Halcn6db, Registry, DogLoaderUnit, FR_DSet, FR_Class, Grids,
  DBGrids, FR_PTabl, frxCross, dxStatusBar, frxDesgn, Accmgmt, AArray, FileCtrl,
  Menus, cxButtonEdit, GlobalSpr, Un_R_file_Alex, cxLookAndFeelPainters,
  cxButtons, cxCalc;

type
  //TfmModeProv = (AddProv, ChangeProv, ClonProv, ShowProv);

  TfmBankNichAddSprav = class(TForm)
    pnl1: TPanel;
    lblGrSmt: TLabel;
    lblSum: TLabel;
    cxSmEdit: TcxButtonEdit;
    pnl2: TPanel;
    lblRozd: TLabel;
    lblDog: TLabel;
    cxRazdEdit: TcxButtonEdit;
    cxDogEdit: TcxButtonEdit;
    Transaction: TpFIBTransaction;
    DB1: TpFIBDatabase;
    lblMonth: TLabel;
    lblYear: TLabel;
    cxMonthEdit: TcxComboBox;
    cxYearEdit: TcxTextEdit;
    pFIBDataSet1: TpFIBDataSet;
    ds1: TDataSource;
    TransactionWrite: TpFIBTransaction;
    cxMemoEdit: TcxMemo;
    pnl3: TPanel;
    cxExitButton: TcxButton;
    cxOkButton: TcxButton;
    cxRazdEditNum: TcxTextEdit;
    cxSmEditNum: TcxTextEdit;
    cxSumEdit: TcxCurrencyEdit;
    procedure cxSmEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxMonthEditPropertiesChange(Sender: TObject);
    procedure cxRazdEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure cxDogEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    function SelectDogovor(all_summa : double):boolean;
    procedure FormCreate(Sender: TObject);
    procedure cxExitButtonClick(Sender: TObject);
    procedure cxOkButtonClick(Sender: TObject);

  private
    id_man, id_smeta, id_stat, id_r, id_k, id_sch, id_kor_sch, id_dog_add, kod_dog_add : int64;
    name_fio, name_smeta, kod_stat_, kod_r_, name_k, name_sch, name_kor_sch, title_sm, name_raz_, name_st_, title_kekv, date_dog, num_dog, name_cust, t_dog, r_dog, note_prov  : string;
    //mm : TfmBankOrder;
  public
      year, month : Word;
      kod_razd, sm_group_text, razd_text, d_n_dog, d_d_dog, d_reg_nomer, d_name_cust : string;
      kod_sm_group : Integer;
      id_sm_group, id_razd : Integer;
      summa : string;
      dog_flag : Int64;
      sum_d, sum_raz : Double;
  constructor Create (Aowner:TComponent ; DBHANDLE : TpFIBDatabase; id_us : Integer; date_d : TDateTime; sum_doc, sum_r : string); reintroduce; overload;
    { Public declarations }
  end;

var
  fmBankNichAddSprav: TfmBankNichAddSprav;
  id_user : Integer;
  allOnlyRazd : TRazdStViewMode;
  date_doc : TDateTime;


implementation
uses
    //BankAddChangeProv,
    //LoadDogManedger,
    dateutils;

{$R *.dfm}


constructor TfmBankNichAddSprav.Create(Aowner:TComponent; DBHANDLE : TpFIBDatabase; id_us : Integer; date_d : TDateTime; sum_doc, sum_r : string);
begin
   inherited Create (nil);
   DB1 := DBHANDLE;
   Transaction.DefaultDatabase := DB1;
   DB1.DefaultTransaction := Transaction;
   cxMonthEdit.Properties.Items.Add('Січень');
   cxMonthEdit.Properties.Items.Add('Лютий');
   cxMonthEdit.Properties.Items.Add('Березень');
   cxMonthEdit.Properties.Items.Add('Квітень');
   cxMonthEdit.Properties.Items.Add('Травень');
   cxMonthEdit.Properties.Items.Add('Червень');
   cxMonthEdit.Properties.Items.Add('Липень');
   cxMonthEdit.Properties.Items.Add('Серпень');
   cxMonthEdit.Properties.Items.Add('Вересень');
   cxMonthEdit.Properties.Items.Add('Жовтень');
   cxMonthEdit.Properties.Items.Add('Листопад');
   cxMonthEdit.Properties.Items.Add('Грудень');
   id_user:=id_us;
   date_doc:=date_d;
   sum_d:=StrToFloat(sum_doc);
   sum_raz:=StrToFloat(sum_r);
end;



procedure TfmBankNichAddSprav.cxOkButtonClick(Sender: TObject);
var
  format: TFormatSettings;
  flag: Integer;
  s : Currency;
begin
  flag:=1;

  if ((cxSmEdit.Text = '') or (cxSmEditNum.Text = '')) then
  begin
    ShowMessage('Всі поля повинні бути заповнені! Оберіть бюджет!');
    flag:=0;
  end;

  //format.DecimalSeparator := '.';
  summa:=cxSumEdit.Text;
  //s:=StrToFloat(summa);
  if (summa = '') then
    begin
      ShowMessage('Всі поля повинні бути заповнені! Введіть суму!');
      flag:=0;
    end
    else if (cxSumEdit.Value <= 0) then
    begin
      ShowMessage('Сума не може бути від`ємною або дорівнювати 0! Введіть правильну суму!');
      flag:=0;
    end;

  if (cxMonthEdit.Text = '') then
  begin
    ShowMessage('Всі поля повинні бути заповнені! Введіть місяць!');
    flag:=0;
  end;

  if (cxYearEdit.Text = '') then
  begin
    ShowMessage('Всі поля повинні бути заповнені! Введіть рік!');
    flag:=0;
  end;

  if ((cxRazdEdit.Text = '') or (cxRazdEditNum.Text = '')) then
  begin
    ShowMessage('Всі поля повинні бути заповнені! Оберіть розділ!');
    flag:=0;
  end;

  if (cxMemoEdit.Text = '') then
  begin
    ShowMessage('Всі поля повинні бути заповнені! Оберіть договір!');
    flag:=0;
  end;

  if (flag = 1) then ModalResult:=mrOk;
end;



procedure TfmBankNichAddSprav.cxSmEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Add,Res : Variant;
begin
  //LoadDogManedger.AddKosht(self, DB.Handle, 0, 1, 0, 0, 0, 0, 0, Date);   //Это справочник как в договорах (не то)
  Res:=GlobalSpr.GetSmGrp(self,DB1.Handle,fsNormal,0,id_user);
  if VarArrayDimCount(Res)>0
  then begin
    id_sm_group :=Res[0];
    sm_group_text :=VarToStr(Res[1]);
    kod_sm_group := Res[2];
  end;
  if (id_sm_group = 0) then
  begin
    cxSmEditNum.Text:='';
    cxSmEdit.Text:='';
  end
  else
  begin
    cxSmEditNum.Text:=VarToStr(kod_sm_group);
    cxSmEdit.Text:=VarToStr(sm_group_text);
  end;
  cxSumEdit.SetFocus();
end;



procedure TfmBankNichAddSprav.cxMonthEditPropertiesChange(Sender: TObject);
begin
  if(cxMonthEdit.ItemIndex = 0) then month:=1;
  if(cxMonthEdit.ItemIndex = 1) then month:=2;
  if(cxMonthEdit.ItemIndex = 2) then month:=3;
  if(cxMonthEdit.ItemIndex = 3) then month:=4;
  if(cxMonthEdit.ItemIndex = 4) then month:=5;
  if(cxMonthEdit.ItemIndex = 5) then month:=6;
  if(cxMonthEdit.ItemIndex = 6) then month:=7;
  if(cxMonthEdit.ItemIndex = 7) then month:=8;
  if(cxMonthEdit.ItemIndex = 8) then month:=9;
  if(cxMonthEdit.ItemIndex = 9) then month:=10;
  if(cxMonthEdit.ItemIndex = 10) then month:=11;
  if(cxMonthEdit.ItemIndex = 11) then month:=12;
end;



procedure TfmBankNichAddSprav.cxRazdEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  ResCount, i : Integer;
  GetNameSP:TPfibStoredProc;
begin
  Res:=GlobalSpr.GetRazdStSpr(self, DB1.Handle, fsNormal, Date, 0, allOnlyRazd, cmRazd);
  if Res<>null
  then begin
            id_razd := Res;
            GetNameSP:=TPfibStoredProc.Create(self);
            GetNameSP.Database:=DB1;
            GetNameSP.Transaction:=Transaction;
            Transaction.StartTransaction;
            GetNameSP.StoredProcName:='PUB_SPR_RAZD_ST_INFO';
            GetNameSP.Prepare;
            GetNameSP.ParamByName('ID_RAZD_ST_IN').Value:=Res;
            GetNameSP.ExecProc;
            kod_razd:=GetNameSP.ParamByName('RAZD_ST_NUM').AsString;
            razd_text:=GetNameSP.ParamByName('RAZD_ST_TITLE').AsString;
            if (kod_razd = '') then
            begin
              cxRazdEditNum.Text:='';
              cxRazdEdit.Text:='';
            end
            else
            begin
              cxRazdEditNum.Text:=kod_razd;
              cxRazdEdit.Text:=razd_text;
            end;
            GetNameSP.Close;
            GetNameSP.Free;
            Transaction.Commit;
  end;
end;



procedure TfmBankNichAddSprav.FormShow(Sender: TObject);
begin
      cxSmEditNum.SetFocus();
end;



function TfmBankNichAddSprav.SelectDogovor(all_summa : double) : boolean;
var
    inputDog : TDogInput;
    res   : TDogResult;
begin
        SelectDogovor := true;
        LoadSysData(Transaction);
        SYS_ID_USER          := id_user;
        decimalseparator := ',';
        inputDog              := SYS_DEFAULT_DOG_INPUT;
        inputDog.Owner        := Self;
        inputDog.DBHandle     := DB1.Handle;
        inputDog.ReadTrans    := Transaction.Handle;
        inputDog.WriteTrans   := TransactionWrite.Handle;
        inputDog.FormStyle    := fsNormal;
        pFIBDataSet1.Close;
        pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from BANK_INI';
        pFIBDataSet1.Open;
        //mm.prih = 1
         // then inputDog.id_Group_add := pFIBDataSet1.FieldByName('ID_GROUP_ADD_PR').AsInteger
         // else inputDog.id_Group_add := pFIBDataSet1.FieldByName('ID_GROUP_ADD_RAS').AsInteger;
        inputDog.id_Group     := pFIBDataSet1.FieldByName('ID_GROUP').AsInteger;
        pFIBDataSet1.Close;
        inputDog.Summa        := 1;
        inputDog.filter.bShowFilterForm := true;
        inputDog.isZayav     := false;
        inputDog.arndGetPay  := 1;
        inputDog.shablon_data.bUse     := true;
        //putDog.shablon_data.num      := mm.cxTextEditNum.Text;
        //putDog.shablon_data.date_dog := mm.DateTimePicker2.Date;
        //S_CURRENT_DATE      := mm.DateTimePicker2.Date;
        //putDog.shablon_data.note     := mm.cxMemo1.Text;
        //putDog.shablon_data.summa    := StrToCurr(mm.cxTextEditSumma.Text);
        //putDog.shablon_data.id_rate_account    := mm.myform.id_account_customer;
        //putDog.shablon_data.id_rate_acc_native := mm.myform.id_ras;
        //inputDog.filter.SummaFrom      := null;
        //inputDog.filter.SummaTo        := n;
        inputDog.filter.bSumma         := true;
        //inputDog.filter.NameCust       := mm.myform.name_cust;
        inputDog.filter.bNameCust      := true;
        //inputDog.filter.id_cust        := mm.myform.id_customer;
        inputDog.filter.bID_Cust       := true;

        res := ShowDogMain(inputDog);
        if res.ModalResult = 1 then
        begin
            dog_flag  := res.id_dog;
            //kod_dog_add := res.kod_dog;
            //name_cust   := VarToStr(res.name_customer);
    //      date_dog    := VarToStr(res.d_dog);
            //num_dog     := VarToStr(res.n_dog);
            //r_dog       := VarToStr(res.regest_num);
    //      t_dog       := VarToStr(res.name_tip_dog);
          d_n_dog:=res.n_dog;
          d_d_dog:=res.d_dog;
          d_name_cust:=res.name_customer;
          d_reg_nomer:=res.regest_num;
          cxMemoEdit.Text := '№ '+VarToStr(res.n_dog)+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +VarToStr(res.d_dog) + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + VarToStr(res.regest_num)+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + VarToStr(res.name_customer);
         end else
         begin
             SelectDogovor := false;
         end;
end;



procedure TfmBankNichAddSprav.cxDogEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
      SelectDogovor(0);
end;

procedure TfmBankNichAddSprav.FormCreate(Sender: TObject);
var
      myDate : TDateTime;
      month, myDay: Word;
      GetNameSP:TPfibStoredProc;
      id_razd_temp : Integer;
      dog_flag_temp : Int64;
      temp : double;
begin
      cxSumEdit.Value:=FloatToCurr(sum_d - sum_raz);

      myDate:=date_doc;
      myDate:=IncMonth(myDate);
      DecodeDate(myDate, year, month, myDay);
      cxMonthEdit.ItemIndex:=month-2;
      cxYearEdit.Text:=VarToStr(year);

      pFIBDataSet1.Database:=DB1;
      pFIBDataSet1.Transaction:=Transaction;
      Transaction.StartTransaction;
      pFIBDataSet1.SQLs.SelectSQL.Text:='select * from BANK_INI';
      pFIBDataSet1.CloseOpen(False);
      id_razd_temp:= pFIBDataSet1.FieldByName('BANK_ID_RAZDEL_NICH').Value;
      dog_flag_temp:= pFIBDataSet1.FieldByName('BANK_ID_DOG_NICH').Value;
      Transaction.Commit;
      pFIBDataSet1.Close;


      if (id_razd = 0) then id_razd := id_razd_temp;
      if (dog_flag = 0) then dog_flag := dog_flag_temp;


    if (id_razd <> 0) then
    begin
      GetNameSP:=TPfibStoredProc.Create(self);
      GetNameSP.Database:=DB1;
      GetNameSP.Transaction:=Transaction;
      Transaction.StartTransaction;
      GetNameSP.StoredProcName:='PUB_SPR_RAZD_ST_INFO';
      GetNameSP.Prepare;
      GetNameSP.ParamByName('ID_RAZD_ST_IN').Value:=id_razd;
      GetNameSP.ExecProc;
      kod_razd:=GetNameSP.ParamByName('RAZD_ST_NUM').AsString;
      razd_text:=GetNameSP.ParamByName('RAZD_ST_TITLE').AsString;
      cxRazdEditNum.Text:=kod_razd;
      cxRazdEdit.Text:=razd_text;
      GetNameSP.Close;
      GetNameSP.Free;
      Transaction.Commit;
    end;

    if (dog_flag <> 0) then
    begin
      temp := dog_flag;
      GetNameSP:=TPfibStoredProc.Create(self);
      GetNameSP.Database:=DB1;
      GetNameSP.Transaction:=Transaction;
      Transaction.StartTransaction;
      GetNameSP.StoredProcName:='DOG_DT_DOCUMENT_INFO';
      GetNameSP.Prepare;
      GetNameSP.ParamByName('D_ID_DOG_VX').Value:=temp;
      GetNameSP.ExecProc;
      d_n_dog:=GetNameSP.ParamByName('D_N_DOG').AsString;
      d_d_dog:=GetNameSP.ParamByName('D_D_DOG').AsString;
      d_name_cust:=GetNameSP.ParamByName('D_NAME_CUSTOMER_K').AsString;
      d_reg_nomer:=GetNameSP.ParamByName('D_REG_NOMER').AsString;
      cxMemoEdit.Text := d_n_dog +  Un_R_file_Alex.BANK_NASTROYKA_VID  + d_d_dog + ' ' + d_name_cust + ' (рег. № ' + d_reg_nomer + ')';
      GetNameSP.Close;
      GetNameSP.Free;
      Transaction.Commit;
    end;
end;



procedure TfmBankNichAddSprav.cxExitButtonClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;



end.

