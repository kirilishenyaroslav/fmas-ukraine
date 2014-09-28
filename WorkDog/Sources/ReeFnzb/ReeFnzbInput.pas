unit ReeFnzbInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxMemo, cxTextEdit, cxContainer, cxEdit, cxMaskEdit,
  cxButtonEdit, StdCtrls, cxControls, cxGroupBox,LoadDogManedger,DogLoaderUnit,
  FIBDataSet, pFIBDataSet, cxDropDownEdit, cxCalendar,
  cxLookAndFeelPainters, cxButtons, ActnList,GlobalSPR, cxCurrencyEdit,
  FIBDatabase, pFIBDatabase,ReeFnzbDogProsm, pFIBStoredProc, Mask,
  ToolEdit, CurrEdit, FIBQuery, pFIBQuery;

type
  TTfrmInputData = class(TForm)
    DogGroupBox: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    DogNameEdit: TcxButtonEdit;
    NameCustEdit: TcxTextEdit;
    NoteMemo: TcxMemo;
    RegNumEdit: TcxTextEdit;
    cxGroupBox1: TcxGroupBox;
    KekvEdit: TcxButtonEdit;
    Label6: TLabel;
    Label5: TLabel;
    Num_edit: TcxTextEdit;
    Label7: TLabel;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    ActionList1: TActionList;
    Action1: TAction;
    Db1: TpFIBDatabase;
    Ft1: TpFIBTransaction;
    Ft2: TpFIBTransaction;
    SumEdit: TCurrencyEdit;
    StProc: TpFIBStoredProc;
    procedure DogNameEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Action1Execute(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ApplyButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function SelectDogovor(all_summa : double):boolean;
  private
    { Private declarations }
  public
   id_Dog      : int64;
   kod_Dog     : int64;
   id_Tip_Dog  : integer;
   id_Customer : Int64;
   id_rate_acc : integer;
   n_dog       : String;
   id_Sch_DB   : integer;
   id_kekv     : integer;
   kod_kekv    : integer;
   date_dog    : TDate;
   reg_num     : string;
   id_group:integer;
  end;

var
  TfrmInputData: TTfrmInputData;
  hwn : THandle;

implementation
  uses ReeFnzbData, ReeFnzbUnit;


{$R *.dfm}
function TTfrmInputData.SelectDogovor(all_summa : double) : boolean;
var
    inputDog : TDogInput;
    res   : TDogResult;
    id_dog_add, kod_dog_add: Double;
    name_cust, r_dog, num_dog, mfo: string;
    GetNameSP:TPfibStoredProc;
    pFIBDataSet1 : TPfibDataset;
    myYear, myMonth, myDay : Word;
    mydate_beg, mydate_end : TDate;
    date_beg, date_end : string;
begin
        DecodeDate(now, myYear, myMonth, myDay);
        if (myMonth <= 9) then
         begin
          date_beg := '01.0'+IntToStr(myMonth)+'.'+IntToStr(myYear);
          if ((myMonth=1) or (myMonth=3) or (myMonth=5) or (myMonth=7) or (myMonth=8) or (myMonth=10) or (myMonth=12))  then
          date_end := '31.0'+IntToStr(myMonth)+'.'+IntToStr(myYear)
          else  date_end := '30.0'+IntToStr(myMonth)+'.'+IntToStr(myYear)
         end else
        date_beg := '01.'+IntToStr(myMonth)+'.'+IntToStr(myYear);
        if ((myMonth=1) or (myMonth=3) or (myMonth=5) or (myMonth=7) or (myMonth=8) or (myMonth=10) or (myMonth=12))  then
          date_end := '31.'+IntToStr(myMonth)+'.'+IntToStr(myYear)
        else  date_end := '30.'+IntToStr(myMonth)+'.'+IntToStr(myYear);
        if (myMonth = 2) then date_end:='28.'+IntToStr(myMonth)+'.'+IntToStr(myYear);
        mydate_beg:= StrToDate(date_beg);
        mydate_end:= StrToDate(date_end);

        SelectDogovor := true;
        LoadSysData(Ft1);
        //SYS_ID_USER          := SYS_ID_USER;
        decimalseparator := ',';
        inputDog              := SYS_DEFAULT_DOG_INPUT;
        inputDog.Owner        := Self;
        inputDog.DBHandle     := Db1.Handle;
        inputDog.ReadTrans    := Ft1.Handle;
        inputDog.WriteTrans   := Ft2.Handle;
        inputDog.FormStyle    := fsNormal;
        pFIBDataSet1:=TPfibDataset.Create(self);
        pFIBDataSet1.Database:=Db1;
        pFIBDataSet1.Transaction:=Ft1;
        Ft1.StartTransaction;
        pFIBDataSet1.Close;
        pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from dog_ini_def_group g WHERE g.id=9';
        pFIBDataSet1.Open;
        //mm.prih = 1
         // then inputDog.id_Group_add := pFIBDataSet1.FieldByName('ID_GROUP_ADD_PR').AsInteger
         // else inputDog.id_Group_add := pFIBDataSet1.FieldByName('ID_GROUP_ADD_RAS').AsInteger;
        inputDog.id_Group     := pFIBDataSet1.FieldByName('ID_GROUP').AsInteger;
        inputDog.DateSys:=Now;
        pFIBDataSet1.Close;
        inputDog.Summa        := 1;
        inputDog.filter.bShowFilterForm:=true;
        inputDog.filter.bUseFilter:=true;
        inputDog.filter.bDate:=true;
        inputDog.filter.DateBeg := mydate_beg;
        inputDog.filter.DateEnd := mydate_end;
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
        //inputDog.filter.bSumma         := true;
        //inputDog.filter.NameCust       := mm.myform.name_cust;
        //inputDog.filter.bNameCust      := true;
        //inputDog.filter.id_cust        := mm.myform.id_customer;
        //inputDog.filter.bID_Cust       := true;

        res := ShowDogMain(inputDog);
        if res.ModalResult = 1 then
        begin
            id_dog  := res.id_dog;
            kod_dog_add := res.kod_dog;
            id_rate_acc:=res.id_rate_acc;
            n_dog:=res.n_dog;
            date_dog:=res.d_dog;
            reg_num:=res.regest_num;
            NameCustEdit.Text:=VarToStr(res.name_customer);
            DogNameEdit.Text:=VarToStr(res.n_dog);
            RegNumEdit.Text:=VarToStr(res.regest_num);
            NoteMemo.Text:=VarToStr(res.dog_note);
            SumEdit.Text:=VarToStr(res.summa);
            Num_edit.Text:=VarToStr((Owner as TfrmFnzbData).cxGrid2TableView1.DataController.RecordCount+1);

            //Процедура, которая по id договора (тип кошторис) вытаскивает КЕКВ
            StProc.Close;
            StProc.Transaction.StartTransaction;
            StProc.StoredProcName:='DOG_REE_FNZB_KEKV_INS';
            StProc.Prepare;
            StProc.ParamByName('id_dog').Value := res.id_dog;
            try
              StProc.ExecProc;
              KekvEdit.Text:=StProc.FldByName['NAME_KEKV'].AsString;
              id_kekv:=StProc.FldByName['ID_KEKV'].AsInteger;
              StProc.Close;
            except on e: Exception do
            begin
              ShowMessage(e.Message);
              StProc.Transaction.Rollback;
              Exit;
            end;
          end;
          StProc.Transaction.Commit;

            //cxMemoEdit.Text := '№ '+VarToStr(res.n_dog)+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +VarToStr(res.d_dog) + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + VarToStr(res.regest_num)+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + VarToStr(res.name_customer);
         end else
         begin
             SelectDogovor := false;
         end;
end;



procedure TTfrmInputData.DogNameEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 Res : TDogResult;
 input : TDogInput;
 id_rate_acc: Int64;
 DataSet_Bank : TpFIBDataSet;
 formDogFind: TReeFnzbDogView;
begin
 //formDogFind:= TReeFnzbDogView.Create(self);
 //Db1.Open;
 //if (formDogFind.ShowModal <> mrOk) then Exit;
 //formDogFind.Free;
 //Db1.Close;
 SelectDogovor(0);
end;

procedure TTfrmInputData.Action1Execute(Sender: TObject);
begin
 Close();
end;

procedure TTfrmInputData.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 res : variant;
begin
  res := GlobalSPR.GetKEKVSpr(self,(Owner as TfrmFnzbData).WorkDB.Handle, fsNormal, now, 1);
  if VarArrayDimCount(res) > 0 then
  begin
      if (res[0][0]<>null) and (res[0][1]<>null) then
      begin
          id_kekv := res[0][0];
          kod_kekv := res[0][2];
          KekvEdit.Text:= IntToStr(kod_kekv);
      end;
  end;
end;

procedure TTfrmInputData.ApplyButtonClick(Sender: TObject);
begin
  if (DogNameEdit.Text = '') or (KekvEdit.Text = '') or (Num_edit.Text = '') or (SumEdit.Text = '')
  then ShowMessage('Всі поля форми повинні бути заповнені!')
  else ModalResult:=mrOk;
end;

procedure TTfrmInputData.CancelButtonClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TTfrmInputData.FormShow(Sender: TObject);
begin
  //DateEdit.Date:=now;
end;



end.
