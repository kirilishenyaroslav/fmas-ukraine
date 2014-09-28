unit PriceAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, cxLookAndFeelPainters,
  cxCurrencyEdit, cxButtons,LoaderUnit,dogLoaderUnit,LoadDogManedger,IBAse,
  ActnList, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,DateUtils,
  cxButtonEdit,GlobalSPR, cxGridTableView, cxClasses, cxStyles, cxTL, DB,
  FIBDataSet, pFIBDataSet, Mask, ToolEdit, CurrEdit;

type
  TPriceAddForm = class(TForm)
    MainDB: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    pFIBStoredProc1: TpFIBStoredProc;
    ActionList1: TActionList;
    Action1: TAction;
    SaveProc: TpFIBStoredProc;
    pFIBTransaction2: TpFIBTransaction;
    ActionList2: TActionList;
    Action2: TAction;
    Panel1: TPanel;
    ApplyButton: TcxButton;
    cxButton_cancel: TcxButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    cxButtonEdit_name_smet: TcxButtonEdit;
    NewSumEdit: TCurrencyEdit;
    cxMaskEdit_kod_smeti: TcxMaskEdit;
    cxTextEdit_name_razd: TcxTextEdit;
    cxMaskEdit_n_razd: TcxMaskEdit;
    cxMaskEdit_n_stat: TcxMaskEdit;
    cxMaskEdit_kekv: TcxMaskEdit;
    cxButtonEdit_name_kekv: TcxButtonEdit;
    cxTextEdit_stat: TcxTextEdit;
    pFIBStoredProc: TpFIBStoredProc;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBDataSet_default_smet: TpFIBDataSet;
    pFIBDataSet_razd_st: TpFIBDataSet;
    pFIBDataSet_smeta: TpFIBDataSet;
    pFIBDataSet_kekv: TpFIBDataSet;
    DataSource1: TDataSource;
    pFIBDataSet_stat: TpFIBDataSet;
    pFIBDatabase: TpFIBDatabase;
    pFIBTransactionRead: TpFIBTransaction;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    Label3: TLabel;
    Label4: TLabel;
    DateBeg: TcxDateEdit;
    DateEnd: TcxDateEdit;
    procedure FormShow(Sender: TObject);
    procedure InflEditKeyPress(Sender: TObject; var Key: Char);
    procedure NewSumEditKeyPress(Sender: TObject; var Key: Char);
    procedure DateBegKeyPress(Sender: TObject; var Key: Char);
    procedure DateEndKeyPress(Sender: TObject; var Key: Char);
    procedure Action2Execute(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure SumEditButtonClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButtonEdit_name_smetPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit_name_kekvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxMaskEdit_kod_smetiExit(Sender: TObject);
    procedure cxMaskEdit_kod_smetiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxMaskEdit_n_razdExit(Sender: TObject);
    procedure cxMaskEdit_n_razdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
     id_S     : integer;
     id_R     : integer;
     id_St    : integer;
//     id_kekv  : integer;
     Sum      : extended;
     id_edizm : integer;
     PrCall   : String;
     id_type_f: Integer;
     id_fav   : Integer;
     id_fav_price : Integer;
     id_type_f_loc: Integer;
     Rn_       : string;
     Sn_       : string;
     id_out_fav:integer;
     id_smet, id_razd, id_stat: Variant;
     name_smet, name_razd, name_stat: String;
     nomer_razd, nomer_stat, kod_smet: Integer;
     sum_smet: Variant;
     default_values: Integer;
     default_kekv: Integer;
     def_name_smet, def_name_razd, def_name_st, def_name_kekv : String;
     def_kod_smet, def_n_razd, def_n_st, def_n_kekv : Integer;
     def_id_smet, def_id_razd, def_id_st, def_id_kekv : Variant;
     id_kekv: Variant; //Идентификатор кеква
     kod_kekv: Integer;
     name_kekv: String;
     stat_old: Integer;
     summa_doc: Currency;
     _mode: Integer;

    { Public declarations }
    procedure  InitConnection(DBhandle : TISC_DB_HANDLE);
    constructor Create(AOwner:TComponent; DBhandle : TISC_DB_HANDLE;frmStyle: TFormStyle;Pr_vizova: String;id_favour:Integer); overload;

  end;

var
  PriceAddForm: TPriceAddForm;

implementation

{$R *.dfm}

constructor TPriceAddForm.Create(AOwner: TComponent;DBhandle : TISC_DB_HANDLE;frmStyle: TFormStyle;Pr_vizova: String;id_favour:Integer);
begin
 inherited Create (Aowner);
 InitConnection(DBHandle); // Инициализируем связь с БД
 PrCall:=Pr_vizova;
 // Инициализация базовых параметров формы.
 FormStyle  := frmStyle;
 id_fav:=id_favour;
end;
// -----------------------------------------------------------------------------
// Инициализация соединения с БД
procedure TPriceAddForm.InitConnection(DBhandle : TISC_DB_HANDLE);
begin
 MainDB.Handle:= DBhandle;
 pFIBTransaction1.StartTransaction;
// pFIBDataSet_spr.Database:=pFIBDatabase;
end;


procedure TPriceAddForm.FormShow(Sender: TObject);
begin
 // -- Настройка даты
 DateBeg.Date := date;
 DateBeg.Date := EncodeDate(YearOf(now), MonthOf(now),1);
 DateEnd.Date := EncodeDate(YearOf(now), MonthOf(now),DayOf(EndOfAMonth(YearOf(now), MonthOf(now))));
// InflEditPropertiesChange(self);
end;

procedure TPriceAddForm.InflEditKeyPress(Sender: TObject; var Key: Char);
begin
 if (Key = #13) then begin
  Key := #0;
  ApplyButton.SetFocus;
 end;
end;

procedure TPriceAddForm.NewSumEditKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then begin
  Key := #0;
  ApplyButton.SetFocus;
 end;
end;

procedure TPriceAddForm.DateBegKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then begin
  Key := #0;
  DateEnd.SetFocus;
 end;
end;

procedure TPriceAddForm.DateEndKeyPress(Sender: TObject; var Key: Char);
begin
 if (Key = #13) then begin
  Key := #0;
  NewSumEdit.SetFocus;
 end;
end;

procedure TPriceAddForm.Action2Execute(Sender: TObject);
begin
 ModalResult:=mrNone;
 Close;
end;

procedure TPriceAddForm.ApplyButtonClick(Sender: TObject);
begin

 if (id_S = null) or (id_S = 0) then begin
  ShowMessage('Ви не ввели кошторис!');
  NewSumEdit.SetFocus;
  Exit;
 end;


 if DateBeg.Text = '' then begin
  ShowMessage('Ви не ввели дату початка функціювання тарифу!');
  DateBeg.SetFocus;
  Exit;
 end;

 if DateEnd.Text = '' then begin
  ShowMessage('Ви не ввели дату закінчення функціювання тарифу!');
  DateEnd.SetFocus;
  Exit;
 end;

 if NewSumEdit.Text = '' then begin
  ShowMessage('Ви не ввели сумму та кошториси!');
  NewSumEdit.SetFocus;
  Exit;
 end;

 ModalResult:=mrOk;
end;

procedure TPriceAddForm.SumEditButtonClick(Sender: TObject);
var
 Add : variant;
 cnt : integer;
 k   : integer;
begin
      //вызов формы добавления см/з/ст/к

 if ((id_S <> 0) and (id_S <> null)) then // Для редактирования
    Add := LoadDogManedger.AddKoshtPr(self,MainDB.Handle, -1, 2, id_S, id_R, id_St, id_kekv, Sum, Date,Date,Date)
 else              // Для просмотра
    Add := LoadDogManedger.AddKoshtPr(self,MainDB.Handle, -1, 0, 0 , 0, 0, 0, 0, Date,Date,Date);

// SumEdit.Properties.

 if VarArrayDimCount(Add) <= 0 then
 begin
   Exit
 end;

 Cnt := VarArrayHighBound(Add, 1);

 for k := 0 to Cnt do
 begin
   id_S      := Add[k][7];
   id_R      := Add[k][8];
   id_St     := Add[k][9];
   id_kekv   := Add[k][10];
   sum       := Add[k][3];
   NewSumEdit.Value:= sum;

 end;
 if (NewSumEdit.Text <> '' ) then
 begin
   ApplyButton.SetFocus;
 end;

end;

procedure TPriceAddForm.cxButton1Click(Sender: TObject);
var
  smet:variant;
begin
   smet := GlobalSPR.GetSmets(self, MainDB.Handle, sys_current_date, psmrazdst);
end;

procedure TPriceAddForm.cxButtonEdit_name_smetPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  smet:Variant;
begin
  if default_values = 1 then
  begin
    Exit;
  end
  else
  begin
  smet := GlobalSPR.GetSmets(self, MainDB.Handle, sys_current_date, psmrazdst);
  if VarArrayDimCount(smet) > 0 then
      begin
      if smet[0] <> 0 then
          begin
            id_smet := smet[0];
            id_razd := smet[1];
            id_stat := smet[2];
            name_smet := smet[6];
            name_razd := smet[4];
            name_stat := smet[5];
            nomer_razd := smet[7];
            nomer_stat := smet[8];
            kod_smet := smet[9];
            cxButtonEdit_name_smet.Text := smet[6];
            cxTextEdit_name_razd.Text := smet[4];
            cxTextEdit_stat.Text := smet[5];
            cxMaskEdit_kod_smeti.Text := smet[9];
            cxMaskEdit_n_razd.Text := smet[7];
            cxMaskEdit_n_stat.Text := smet[8];
          end;
         cxMaskEdit_kekv.SetFocus;
      end;
  end;
end;

procedure TPriceAddForm.cxButtonEdit_name_kekvPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  res : variant;
begin
  if default_kekv = 1 then
  begin
    Exit;
  end
  else
  begin
  res := GlobalSPR.GetKEKVSpr(self,MainDB.Handle, fsNormal, SYS_CURRENT_DATE, 1);
  if VarArrayDimCount(res) > 0 then
  begin
      if (res[0][0]<>null) and (res[0][1]<>null) then
      begin
          id_kekv := res[0][0];               //Id
          kod_kekv := res[0][2];
          name_kekv := res[0][1];
          cxMaskEdit_kekv.Text := res[0][2]; //Kod
          cxButtonEdit_name_kekv.Text := res[0][1]; //Title
      end;
  end;
  end;
end;

procedure TPriceAddForm.cxMaskEdit_kod_smetiExit(Sender: TObject);
begin
if  trim(cxMaskEdit_kod_smeti.Text) <> '' then
 begin
  pFIBStoredProc.Database.Handle := MainDB.Handle;
//  pFIBTransactionWrite.Handle:=MainDB.Handle;
//  pFIBTransactionWrite.Active:=true;
  pFIBStoredProc.Transaction := pFIBTransaction1;
  pFIBTransaction1.DefaultDatabase := MainDB;
  pFIBTransaction1.StartTransaction;
  pFIBStoredProc.StoredProcName := 'PUB_GET_NAME_BUDG_BY_KOD';
  pFIBStoredProc.Prepare;
  pFIBStoredProc.ParamByName('NUM_OBJECT').Value := cxMaskEdit_kod_smeti.Text;
  pFIBStoredProc.ParamByName('ACTUAL_DATE').Value := SYS_CURRENT_DATE;
  pFIBStoredProc.ParamByName('TYPE_OBJECT').Value := 1;
   try
   pFIBStoredProc.ExecProc;
   except  on e:Exception do
      begin
        ShowMessage(e.Message);
        pFIBTransaction1.Rollback;
        Exit;
      end;
    end;
   pFIBTransaction1.Commit;
   cxButtonEdit_name_smet.Text := pFIBStoredProc.FieldByName('TITLE_OBJECT').AsString;
   id_smet := pFIBStoredProc.FieldByName('ID_OBJECT').AsInteger;
   kod_smet := StrToInt(cxMaskEdit_kod_smeti.text);
   name_smet := pFIBStoredProc.FieldByName('TITLE_OBJECT').AsString;
 end;
end;

procedure TPriceAddForm.cxMaskEdit_kod_smetiKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    cxMaskEdit_kod_smetiExit(Self);
    cxMaskEdit_n_razd.SetFocus;
  end;
end;

procedure TPriceAddForm.cxMaskEdit_n_razdExit(Sender: TObject);

var
  new_razd, old_razd: Integer;
begin
if Trim(cxMaskEdit_n_razd.Text) <> '' then
 begin
 //если меняется раздел, то меняется и статья
  new_razd := StrToInt(cxMaskEdit_n_razd.Text);
//  if new_razd=old_razd then Exit else cxMaskEdit_n_statExit(Self);
  pFIBStoredProc.Database.Handle := MainDB.Handle;
//  pFIBTransactionWrite.Handle:=MainDB.Handle;
//  pFIBTransactionWrite.Active:=true;
  pFIBStoredProc.Transaction := pFIBTransaction1;
  pFIBTransaction1.DefaultDatabase := MainDB;
  pFIBTransaction1.StartTransaction;
  pFIBStoredProc.StoredProcName := 'PUB_GET_NAME_BUDG_BY_KOD';
  pFIBStoredProc.Prepare;
  pFIBStoredProc.ParamByName('NUM_OBJECT').Value := cxMaskEdit_n_razd.Text;
  pFIBStoredProc.ParamByName('ACTUAL_DATE').Value := SYS_CURRENT_DATE;
  pFIBStoredProc.ParamByName('TYPE_OBJECT').Value := 2;
   try
   pFIBStoredProc.ExecProc;
   except  on e:Exception do
      begin
        ShowMessage(e.Message);
        pFIBTransaction1.Rollback;
        Exit;
      end;
    end;
   pFIBTransaction1.Commit;
   cxTextEdit_name_razd.Text := pFIBStoredProc.FieldByName('TITLE_OBJECT').AsString;
   id_razd := pFIBStoredProc.FieldByName('ID_OBJECT').AsInteger;
   name_razd := pFIBStoredProc.FieldByName('TITLE_OBJECT').AsString;
   nomer_razd := StrToInt(cxMaskEdit_n_razd.Text);
   old_razd := nomer_razd;
 end;
end;

procedure TPriceAddForm.cxMaskEdit_n_razdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    cxMaskEdit_n_razdExit(Self);
    cxMaskEdit_n_stat.SetFocus;
  end;
end;

end.
