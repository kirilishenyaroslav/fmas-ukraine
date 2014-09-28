//***********************************************************************
//* Проект "Студгородок"                                                *
//* Справочник проживающих                                              *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit St_sp_BUILD_LIVERS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, Menus,
  ImgList, dxBarExtItems, dxBar, FIBQuery, pFIBQuery, pFIBStoredProc,
  ActnList, FIBDataSet, pFIBDataSet, cxContainer, cxTextEdit, StdCtrls,
  cxRadioGroup, cxButtons, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, IBase,
  cxGridCustomView, cxGrid, ExtCtrls, cxCalendar, FIBDatabase, pFIBDatabase, St_Proc,
  cxLabel, dxStatusBar, cxCurrencyEdit, NotNullSumma_Unit, cxGroupBox,
  cxCheckBox;

type
  TSt_sp_build_livers_Form = class(TForm)
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    END_REGISTRATION_FLAG: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    DataSource: TDataSource;
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    Filtration: TAction;
    dxBarManager1: TdxBarManager;
    EditButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    DisabledLargeImages: TImageList;
    LargeImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    id_kod: TcxGridDBColumn;
    DataSet: TpFIBDataSet;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    Panel1: TPanel;
    Bevel4: TBevel;
    cxLabel3: TcxLabel;
    PIB_Label: TEdit;
    WriteProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    ReadDataSet: TpFIBDataSet;
    dxBarStatic1: TdxBarStatic;
    SelectButton: TdxBarLargeButton;
    SearchAction: TAction;
    PopupImageList: TImageList;
    SelectAction: TAction;
    HotKey_StatusBar: TdxStatusBar;
    ViewRegistration_LargeButton: TdxBarLargeButton;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButton1: TdxBarButton;
    ViewAction: TAction;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    ChooseAction: TAction;
    Refresh_Action: TAction;
    Exit_ec: TAction;
    Osnovanie_Label: TcxLabel;
    Summa_Label: TcxLabel;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    Filter_Button: TcxButton;
    CancelFiltr_Button: TcxButton;
    FIO_CheckBox: TcxRadioButton;
    BarCode_CheckBox: TcxRadioButton;
    Filter_BarEdit: TcxTextEdit;
    column_order_num: TcxGridDBColumn;
    dxBarLargeButton1: TdxBarLargeButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure CancelFiltr_ButtonClick(Sender: TObject);
    procedure Filter_BarEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Filter_ButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSetAfterOpen(DataSet: TDataSet);
    procedure DataSetAfterScroll(DataSet: TDataSet);
    procedure cxGridDBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure SearchActionExecute(Sender: TObject);
    procedure cxGridDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure N1Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure ExitAction1Click(Sender: TObject);
    procedure ViewRegistration_LargeButtonClick(Sender: TObject);
    procedure cxGridDBTableView1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ViewActionExecute(Sender: TObject);
    procedure ChooseActionExecute(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure Refresh_ActionExecute(Sender: TObject);
    procedure Exit_ecExecute(Sender: TObject);
    procedure Filter_BarEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxBarLargeButton1Click(Sender: TObject);
  private
    In_Summa : Currency;
    In_IsWithSumma: Boolean;
    BarCode : String;
  public
    KeyField    : string;
    id_session_calc,
    id_session_pay,
    id_session_smet: int64;
    constructor Create (AOwner: TComponent; DB_Handle:TISC_DB_HANDLE;IsChild: Boolean; BarCode:String);reintroduce;
    procedure SelectAll;
  end;


function View_st_BuildLivers_Sp(AOwner : TComponent; DB:TISC_DB_HANDLE; ShowModal: boolean; Osnovanie: string; Summa: Currency; IsWithSumma: Boolean; BarCode : String):Variant;stdcall;
exports View_st_BuildLivers_Sp;

   var  res:Variant;


implementation

uses St_sp_build_livers_Form_Oplata_unit,
  St_sp_Build_livers_registration_view,
  St_sp_build_livers_calculation_oplata;

{$R *.dfm}
function View_st_BuildLivers_Sp(AOwner : TComponent; DB:TISC_DB_HANDLE; ShowModal: boolean; Osnovanie: string; Summa: Currency; IsWithSumma: Boolean; BarCode : String):Variant;stdcall;
var ViewForm:TSt_sp_build_livers_Form;
begin
  if not IsMDIChildFormShow(TSt_sp_build_livers_Form) then
   begin
    if (( ShowModal=false) or (ShowModal=null)) then
     begin
      ViewForm:=TSt_sp_build_livers_Form.Create(AOwner,DB, true, BarCode);
      ViewForm.In_Summa:= Summa;
      ViewForm.In_IsWithSumma:= IsWithSumma;
      ViewForm.Osnovanie_Label.Caption:=ViewForm.Osnovanie_Label.Caption+Osnovanie;
      if IsWithSumma then
       begin
        ViewForm.Summa_Label.Caption:=ViewForm.Summa_Label.Caption+CurrToStr(Summa);
        ViewForm.Summa_Label.Visible:=true;
       end;
      View_st_BuildLivers_Sp:=res;
     end
    else
     begin
      ViewForm:=TSt_sp_build_livers_Form.Create(AOwner,DB, false, BarCode); 
      ViewForm.In_Summa:= Summa;
      ViewForm.In_IsWithSumma:= IsWithSumma;
      ViewForm.Osnovanie_Label.Caption:=ViewForm.Osnovanie_Label.Caption+Osnovanie;
      if IsWithSumma then
       begin
        ViewForm.Summa_Label.Caption:=ViewForm.Summa_Label.Caption+CurrToStr(Summa);
        ViewForm.Summa_Label.Visible:=true;
       end;
      ViewForm.ShowModal;
      View_st_BuildLivers_Sp:=res;
      ViewForm.Free;
     end;
   end;
end;


constructor TSt_sp_build_livers_Form.Create(AOwner: TComponent; DB_Handle:TISC_DB_HANDLE; IsChild: boolean; BarCode:string);
begin
  inherited Create(AOwner);
  if IsChild
   then Formstyle:=fsMDIChild
   else Formstyle:=fsNormal;
  DB.Handle:=DB_Handle;
  Dataset.Open;

  self.BarCode:=BarCode;
//  FIO_CheckBox.Checked := True;
end;


procedure TSt_sp_build_livers_Form.SelectAll;
begin
if DataSet.Active then DataSet.CloseOpen(True)
else DataSet.Open;
end;

procedure TSt_sp_build_livers_Form.ExitButtonClick(Sender: TObject);
begin
res:=null;
close;
end;

procedure TSt_sp_build_livers_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
Action:=caFree;
end;

procedure TSt_sp_build_livers_Form.FormCreate(Sender: TObject);
begin
  KeyField := 'ID_KOD';
end;

procedure TSt_sp_build_livers_Form.CancelFiltr_ButtonClick(
  Sender: TObject);
begin
  self.RefreshButtonClick(Sender);
  Filter_BarEdit.Text:='';
end;

procedure TSt_sp_build_livers_Form.Filter_BarEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if  key=VK_RETURN then Filter_ButtonClick(Self);
end;

function StringPrepareToApostrofText(AText:string):string;
var I:integer;
    TStr:string;
begin
 i:=1;
 While i<>Length(AText)+1 do
  begin
   if copy(Atext,i,1)='''' then
    begin
     TStr:=copy(Atext,i+1,Length(Atext)-i);
     delete(Atext,i+1,Length(Atext)-i);
     AText:=AText+''''+ TStr;
     inc(i);
     inc(i);
     inc(i);
    end;
    inc(i);
  end;
 result:=Atext;
end;

procedure TSt_sp_build_livers_Form.Filter_ButtonClick(Sender: TObject);
var
  persent : string;
  FIO_Search : string;
  Len_FIO, p : Integer;
begin
  If Filter_BarEdit.Text = '' then Exit;

  persent:='%';
  DataSet.Close;
  DataSet.SelectSQL.Clear;

  If FIO_CheckBox.Checked then
   begin
    FIO_Search := Filter_BarEdit.Text;
    Len_FIO := length(FIO_Search);
    p:=1;
    while p<=len_FIO do
     Begin
      If FIO_Search[p]=' '
       then
        Begin
         Insert('%',FIO_Search,p);
         p:=p+1;
         Len_fio:=len_fio+1;
        End;
      p:=p+1;
     End;
    DataSet.SelectSQL.Text:='select * from ST_SP_BUILD_LIVERS_FILTER ('+ ''''
                                                                       + StringPrepareToApostrofText(FIO_Search)
                                                                       +''''+',1)';
   End; 

  if BarCode_CheckBox.Checked
   then DataSet.SelectSQL.Text:='select * from ST_SP_BUILD_LIVERS_FILTER ('+ ''''+Filter_BarEdit.Text + persent+''''+',2)';

  DataSet.Open;
  cxGrid2.SetFocus;
end;

procedure TSt_sp_build_livers_Form.RefreshButtonClick(Sender: TObject);
var
 RowSelected : int64;
begin
  Screen.Cursor:=crSQLWait;
  RowSelected := -1;
  if DataSet.RecordCount <> 0 then RowSelected := DataSet[KeyField];
  DataSet.close;
  DataSet.SelectSQL.Clear;
  DataSet.SelectSQL.Text:='select * from ST_SP_BUILD_LIVERS';
  SelectAll;
  Filter_BarEdit.Text:='';
  DataSet.Locate(KeyField, RowSelected, []);
  Screen.Cursor:=crDefault;
end;

procedure TSt_sp_build_livers_Form.FormResize(Sender: TObject);
begin
  FIO_CheckBox.BringToFront;
  //Filter_Button.BringToFront;
  //CancelFiltr_Button.BringToFront;
  //Filter_BarEdit.BringToFront;
  BarCode_CheckBox.BringToFront;
end;

procedure TSt_sp_build_livers_Form.EditButtonClick(Sender: TObject);
var
  Difference, absDifference : double;
  stSumDopl, stSNeed, stUplSum, stSumDoc, stOstSum: Currency;
  stBegSum, TnMinProj, stEndSum, TnMaxProj: TDateTime;
  STDATEOPL: TDateTIME;
  SmLining: Smallint;
  ST_CUR_SMET_record_count : integer;
  i: integer;
  k: Smallint;
  kod_dog_st: integer;
  ID_KOD_as_int: int64;
  frmNotNullSumma : TfrmNotNullSumma;
  kol_check_service, p : Integer;
  id_sm, id_rz, id_st, id_kekv : Int64;
  sum : Double;
begin
  if not cxGrid2.IsFocused then exit;
  if cxGridDBTableView1.DataController.RecordCount = 0 then exit;

  Screen.Cursor:=crHourGlass;
  //--------------------------------------------------------------------
  // формирование корректных счетов и операций на сегодня
  With WriteProc do
   begin
     StoredProcName:='ST_DATE_PROV_SYS_DATA_CHECK_UPT';
     Transaction.StartTransaction;
     Prepare;
     ExecProc;
    try
     Transaction.Commit;
     Close;
    except
      Transaction.Rollback;
      ShowMessage('Произошла ошибка при выполнении процедуры ST_DATE_PROV_SYS_DATA_CHECK_UPT!'+ #13+'Сбой в работе системы.');
      raise;
    end;
   end;

  //--------------------------------------------------------------------
  if not In_IsWithSumma then
   begin
    stSumDopl:=0;
    stSNeed:=0;
    stUplSum:=0;

    if Filter_BarEdit.InternalFocused then exit;

    With WriteProc do
     begin
      try
       St_sp_build_livers_Form_Oplata:= TSt_sp_build_livers_Form_Oplata.Create(Self);
       St_sp_build_livers_Form_Oplata.SheglovHandle:=db.Handle;
       St_sp_build_livers_Form_Oplata.SheglovItem_id:= self.DataSet[KeyField];
       St_sp_build_livers_Form_Oplata.Facultet:=Dataset['NAME_FAC'];
       if DataSet['KURS']<> null then St_sp_build_livers_Form_Oplata.Kurs:=Dataset['KURS'];

       Transaction.StartTransaction;

       StoredProcName:='ST_SO_DEF_BLIVERS_SELECT';
       Prepare;
       ExecProc;
       // -------------проверка оплаты по-умолчанию-------------------------
       if WriteProc.ParamByName('ST_DEFAULT_BL_PERIOD_SUMMA').AsShort = 1
        then St_sp_build_livers_Form_Oplata.PeriodCheck:=1
        else St_sp_build_livers_Form_Oplata.PeriodCheck:=0;

       // --------------запуск процедуры st_pay------------------------------
       // расчет уже уплаченной суммы

       StoredProcName := 'ST_PAY';
       Prepare;
       ParamByName('ID_DOG_STUD').AsInt64 := self.DataSet[KeyField];
       ParamByName('DATE_PROV_CHECK').AsShort := 1;
       ParamByName('IS_DOC_GEN').AsShort := 1;
       ParamByName('IS_PROV_GEN').AsShort := 1;
       ParamByName('IS_SMET_GEN').AsShort := 1;
       ExecProc;

       St_sp_build_livers_Form_Oplata.stInsOst:= ParamByName('STINSOST').AsCurrency;
       stUplSum:=ParamByName('STUPLSUM').AsCurrency;
       stSumDoc:=ParamByName('SUMMA_ALL').AsCurrency;
       id_session_pay:= ParamByName('ID_SESSION').AsInt64;

       // --------------запуск процедуры st_calc------------------------------
       //
       StoredProcName := 'ST_CALC';
       Prepare;
       ParamByName(KeyField).AsInt64 := self.DataSet[KeyField];
       ParamByName('STUPLSUM').AsCurrency := stUplSum; // это уже с уплаченной суммой
       ExecProc;

       St_sp_build_livers_Form_Oplata.KeyField := self.DataSet[KeyField];
       St_sp_build_livers_Form_Oplata.St_SNeed_Edit.Value:= ParamByName('ST_SNEED').AsCurrency;
       stSNeed:= ParamByName('ST_SNEED').AsCurrency;      //  сумма, необходимая для уплаты за весь период
       STDATEOPL:= ParamByName('STDATEOPL').AsDateTIME;   // дата, по которую оплачено
       TnMinProj:= ParamByName('TNMINPROJ').AsDateTime;   // дата начала проживания
       TnMaxProj:= ParamByName('TNMAXPROJ').AsDateTime;   // дата окончания проживания
       St_sp_build_livers_Form_Oplata.DateBegEdit_Oplata.date:=  STDATEOPL;
       St_sp_build_livers_Form_Oplata.St_UplSum_Edit.Value:=stUplSum; // уже уплачено

       id_session_calc:= ParamByName('ID_SESSION').AsInt64;

       stSumDopl:= stSNeed-stUplSum; // это и есть разница, которую нужно уплатить !!!

       StoredProcName := 'ST_CALC_TMP_CLEAR';
       Prepare;
       ParamByName('ID_SESSION').AsInt64 := id_session_calc;
       ExecProc;

       StoredProcName := 'ST_CALC';
       Prepare;
       ParamByName(KeyField).AsInt64 := self.DataSet[KeyField];
       ParamByName('BEG_CHECK').AsDateTime := TnMinProj;
       ParamByName('END_CHECK').AsDateTime := STDATEOPL;
       ExecProc;

       id_session_calc:= ParamByName('ID_SESSION').AsInt64;

       stOstSum:= stUplSum - ParamByName('ST_SNEED').AsCurrency;

       if ((STDATEOPL <> null) and (STDATEOPL>TNMINPROJ))
        then stBegSum:=STDATEOPL
        else stBegSum:=TNMINPROJ;

       stEndSum:= TnMaxProj;

       absDifference:= abs(stSumDopl);
       Difference:= stSumDopl;
       if absDifference >= 0.00001 then
        begin
         if Difference >= 0 then
          begin
           St_sp_build_livers_Form_Oplata.St_SumDopl_Edit.Value:= Difference;
           St_sp_build_livers_Form_Oplata.SummaEdit.Value:= Difference;
          end
         else
          begin
           if Difference<0 then
            begin
             k := -1;
             St_sp_build_livers_Form_Oplata.Label6.Caption:='Переплата';
            end
           else
            begin
             k:=1;
             St_sp_build_livers_Form_Oplata.Label6.Caption:='Задолженность';
            end;
           St_sp_build_livers_Form_Oplata.St_SumDopl_Edit.Value:= Difference*k;
           St_sp_build_livers_Form_Oplata.SummaEdit.Value:= 0;
          end;

        end
        else
         begin
          St_sp_build_livers_Form_Oplata.St_SumDopl_Edit.Visible:=false;
          St_sp_build_livers_Form_Oplata.cxLabel8.Visible:=false;
          St_sp_build_livers_Form_Oplata.Label6.Font.Style:=[fsBold];
          St_sp_build_livers_Form_Oplata.Label6.Caption:='Уплачено полностью';
          St_sp_build_livers_Form_Oplata.SummaEdit.Value:=0;
         end;

       St_sp_build_livers_Form_Oplata.DateBegEdit.Date:= TnMinProj;
       St_sp_build_livers_Form_Oplata.DateEndEdit.Date:= TnMaxProj;
       St_sp_build_livers_Form_Oplata.DateEndEdit_Oplata.Date:=TnMaxProj;
       if Difference <0
        then St_sp_build_livers_Form_Oplata.DateEndEdit_Oplata.Date:= TnMaxProj;

       Transaction.Commit; 
      except
       on e: Exception do
        Begin
         Transaction.Rollback;
         ShowMessage('Произошла непредвиденная ошибка! Сбой в работе системы.'+#13#10+E.Message);
         raise;
        end; 
      end;
     end;
    St_sp_build_livers_Form_Oplata.FIO_Edit.Text := DataSet['fio_combo'];
    Screen.Cursor:=crDefault;
    //------------------------------------------------------------------------
    St_sp_build_livers_Form_Oplata.id_session_calc:=id_session_calc;
    St_sp_build_livers_Form_Oplata.id_session_pay:=id_session_pay;

    // открытие справочника проживающих
    if St_sp_build_livers_Form_Oplata.ShowModal= mrOk then
     begin
      Screen.Cursor:=crHourGlass;

      // проверка лининга
      if ReadDataSet.Active
       then ReadDataSet.Close;

      ReadDataSet.SelectSQL.Clear;
      ReadDataSet.SelectSQL.Text:='select ST_SMLINING from sys_options';
      ReadDataSet.Open;
      if ReadDataSet['ST_SMLINING']<> null
       then SmLining := ReadDataSet['ST_SMLINING']
       else SmLining:=0;

      // --------------Разбивка по бюджетам------------------------------
      ReadDataSet.Close;
      ReadDataSet.SQLs.SelectSQL.Text := 'select kod_dog_st from sys_options';
      ReadDataSet.Open;
      kod_dog_st := ReadDataSet['KOD_DOG_ST'];

      if St_sp_build_livers_Form_Oplata.CheckBox_service.Checked then
       Begin
        St_sp_build_livers_Form_Oplata.MemoryData_service.First;
        kol_check_service := 0;
        // разбивка внесенной суммы по выбраным услугам(бюджетам)
        For i := 1 to St_sp_build_livers_Form_Oplata.MemoryData_service.RecordCount do
         Begin
          if St_sp_build_livers_Form_Oplata.MemoryData_service['md_check'] = 1 then kol_check_service := kol_check_service + 1;
          St_sp_build_livers_Form_Oplata.MemoryData_service.Next;
         End;

        Res := VarArrayCreate([0, kol_check_service + 1], varVariant);

        //общие сведения о проживающем
        res[0] := VarArrayOf([St_sp_build_livers_Form_Oplata.KeyField, St_sp_build_livers_Form_Oplata.DateBegEdit.Date,
                              St_sp_build_livers_Form_Oplata.DateEndEdit.Date, St_sp_build_livers_Form_Oplata.St_SNeed_Edit.Value,
                              St_sp_build_livers_Form_Oplata.St_UplSum_Edit.Value, St_sp_build_livers_Form_Oplata.St_SumDopl_Edit.Value,
                              St_sp_build_livers_Form_Oplata.DateBegEdit_Oplata.Date, St_sp_build_livers_Form_Oplata.DateEndEdit_Oplata.Date,
                              St_sp_build_livers_Form_Oplata.SummaEdit.Value, kol_check_service, St_sp_build_livers_Form_Oplata.FIO_Edit.Text,
                              kod_dog_st]);

        p := 1;
        St_sp_build_livers_Form_Oplata.MemoryData_service.First;
        For i := 1 to St_sp_build_livers_Form_Oplata.MemoryData_service.RecordCount do
         Begin
          if St_sp_build_livers_Form_Oplata.MemoryData_service.FieldByName('md_check').AsInteger = 1 then
           begin
            id_sm   := St_sp_build_livers_Form_Oplata.MemoryData_service.FieldByName('MD_ID_SM').AsInteger;
            id_rz   := St_sp_build_livers_Form_Oplata.MemoryData_service.FieldByName('MD_ID_RZ').AsInteger;
            id_st   := St_sp_build_livers_Form_Oplata.MemoryData_service.FieldByName('MD_ID_ST').AsInteger;
            id_kekv := St_sp_build_livers_Form_Oplata.MemoryData_service.FieldByName('MD_ID_KEKV').AsInteger;
            sum     := St_sp_build_livers_Form_Oplata.MemoryData_service.FieldByName('MD_SUM').AsFloat;

            //ShowMessage(Inttostr(p) + ' - ' + IntToStr(id_sm)+'/'+IntToStr(id_rz)+'/'+IntToStr(id_st)+'/'+IntToStr(id_kekv)+' = '+ FloatToStr(sum));

            res[p] := VarArrayOf([id_sm, id_rz, id_st, id_kekv, sum]);
            p := p + 1;
           end;
            
          St_sp_build_livers_Form_Oplata.MemoryData_service.Next;
         end;
       end
      else
       Begin
        ReadDataSet.close;
        ReadDataSet.SQLs.SelectSQL.Text := 'select * from ST_GET_FACT_BANK(:id_kod, :summa)';
        ReadDataSet.ParamByName('id_kod').AsInt64 := DataSet['ID_KOD'];
        ReadDataSet.ParamByName('Summa').AsFloat  := St_sp_build_livers_Form_Oplata.SummaEdit.Value;
        ReadDataSet.Open;
        ReadDataSet.FetchAll;
        ReadDataSet.First;

        Res := VarArrayCreate([0, ReadDataSet.RecordCount + 1], varVariant);

        //общие сведения о проживающем
        res[0] := VarArrayOf([St_sp_build_livers_Form_Oplata.KeyField, St_sp_build_livers_Form_Oplata.DateBegEdit.Date,
                              St_sp_build_livers_Form_Oplata.DateEndEdit.Date, St_sp_build_livers_Form_Oplata.St_SNeed_Edit.Value,
                              St_sp_build_livers_Form_Oplata.St_UplSum_Edit.Value, St_sp_build_livers_Form_Oplata.St_SumDopl_Edit.Value,
                              St_sp_build_livers_Form_Oplata.DateBegEdit_Oplata.Date, St_sp_build_livers_Form_Oplata.DateEndEdit_Oplata.Date,
                              St_sp_build_livers_Form_Oplata.SummaEdit.Value, ReadDataSet.RecordCount, St_sp_build_livers_Form_Oplata.FIO_Edit.Text,
                              kod_dog_st]);

        // разбивка внесенной суммы по бюджетам
        For i := 1 to ReadDataSet.RecordCount do
         begin
          res[i] := VarArrayOf([ReadDataSet['ID_SM'], ReadDataSet['ID_RZ'], ReadDataSet['ID_ST'], ReadDataSet['ID_KEKV'], ReadDataSet['SUMMA']]);
          ReadDataSet.next;
         end;

        ReadDataSet.close;
       end; 

      WriteProc.Transaction.StartTransaction;

      WriteProc.StoredProcName := 'ST_CALC_TMP_CLEAR';
      WriteProc.Prepare;
      WriteProc.ParamByName('ID_SESSION').AsInt64 := id_session_calc;
      WriteProc.ExecProc;

      WriteProc.StoredProcName := 'ST_PAY_TMP_CLEAR';
      WriteProc.Transaction.StartTransaction;
      WriteProc.Prepare;
      WriteProc.ParamByName('ID_SESSION').AsInt64 := id_session_pay;
      WriteProc.ExecProc;

      WriteProc.Transaction.Commit;
      WriteProc.Close;

      Screen.Cursor:=crDefault;
      St_sp_build_livers_Form_Oplata.Free;
      Close;
     end; // закрытие справочника проживающих
   end
  else
   if In_IsWithSumma then
    begin
     if In_Summa <=0 then
      begin
       frmNotNullSumma := TfrmNotNullSumma.Create(self);
       if frmNotNullSumma.ShowModal = mrOk
        then In_Summa:= frmNotNullSumma.cxCurrencyEdit1.Value;
      end;
     if In_Summa > 0 then
      begin
       // --------------запуск процедуры st_smet------------------------------
       ReadDataSet.Close;
       ReadDataSet.SelectSQL.Text := 'select kod_dog_st from sys_options';
       ReadDataSet.Open;
       kod_dog_st := ReadDataSet['KOD_DOG_ST'];

       ReadDataSet.close;
       ReadDataSet.SQLs.SelectSQL.Text := 'select * from ST_GET_FACT_BANK(:id_kod, :summa)';
       ReadDataSet.ParamByName('id_kod').AsInt64 := DataSet['ID_KOD'];
       ReadDataSet.ParamByName('Summa').AsFloat  := In_Summa;
       ReadDataSet.Open;
       ReadDataSet.FetchAll;
       ReadDataSet.First;

       Res := VarArrayCreate([0, ReadDataSet.RecordCount + 1], varVariant);

       //общие сведения о проживающем
       res[0]:=VarArrayOf([Dataset['ID_KOD'],
                           Null,
                           Null,
                           Null,
                           Null,
                           Null,
                           Null,
                           Null,
                           In_Summa,
                           ReadDataSet.RecordCount,
                           dataset['FIO_COMBO'],
                           kod_dog_st]);
       // разбивка внесенной суммы по сметам
       For i := 1 to ReadDataSet.RecordCount do
        begin
         res[i] := VarArrayOf([ReadDataSet['ID_SM'], ReadDataSet['ID_RZ'], ReadDataSet['ID_ST'], ReadDataSet['ID_KEKV'], ReadDataSet['SUMMA']]);
         ReadDataSet.next;
        end;
       ReadDataSet.close;

       WriteProc.Transaction.StartTransaction;

       WriteProc.StoredProcName := 'ST_CALC_TMP_CLEAR';
       WriteProc.Prepare;
       WriteProc.ParamByName('ID_SESSION').AsInt64 := id_session_calc;
       WriteProc.ExecProc;

       WriteProc.StoredProcName := 'ST_PAY_TMP_CLEAR';
       WriteProc.Prepare;
       WriteProc.ParamByName('ID_SESSION').AsInt64 := id_session_pay;
       WriteProc.ExecProc;

       WriteProc.Transaction.Commit;

       Screen.Cursor:=crDefault;
       St_sp_build_livers_Form_Oplata.Free;
       Close;
      end
     else
      begin
       if In_Summa = 0 then
        begin
         ShowMessage('Присланная сумма нулевая, что недопустимо!' +#13+
                     'Разбивка не будет произведена. Внесите изменения!');
         Screen.Cursor:=crDefault;
         St_sp_build_livers_Form_Oplata.Free;
         Close;
         exit;
        end;

       if In_Summa < 0 then
        begin
         ShowMessage('Присланная сумма отрицательна, что недопустимо!' +#13+
                     'Разбивка не будет произведена. Внесите изменения!');
         Screen.Cursor:=crDefault;
         St_sp_build_livers_Form_Oplata.Free;
         Close;
         exit;
        end;
      end;
    end;
end;


procedure TSt_sp_build_livers_Form.FormShow(Sender: TObject);
begin
  FIO_CheckBox.BringToFront;
  Filter_Button.BringToFront;
  CancelFiltr_Button.BringToFront;
  Filter_BarEdit.BringToFront;
  Filter_BarEdit.setfocus;
  BarCode_CheckBox.BringToFront;

  if Barcode<>'' then
   begin
    Filter_BarEdit.Text:=BarCode;
    BarCode_CheckBox.Checked := True;
    Filter_ButtonClick(self);
   end;
end;

procedure TSt_sp_build_livers_Form.DataSetAfterOpen(DataSet: TDataSet);
begin
if  DataSet.RecordCount<> 0 then
if DataSet['FIO_COMBO_UKR'] <> null then
PIB_Label.Text := DataSet['FIO_COMBO_UKR'];
end;

procedure TSt_sp_build_livers_Form.DataSetAfterScroll(DataSet: TDataSet);
begin
if  DataSet.RecordCount<> 0 then
if DataSet['FIO_COMBO_UKR'] <> null then
PIB_Label.Text := DataSet['FIO_COMBO_UKR'];
end;

procedure TSt_sp_build_livers_Form.cxGridDBTableView1KeyPress(
  Sender: TObject; var Key: Char);
begin
if cxGridDBTableView1.DataController.RecordCount = 0 then exit;
if key = #13 then EditButtonClick(self);
end;

procedure TSt_sp_build_livers_Form.cxGridDBTableView1DblClick(
  Sender: TObject);
begin
  if cxGridDBTableView1.DataController.RecordCount = 0 then exit;
  EditButtonClick(self);
end;

procedure TSt_sp_build_livers_Form.SearchActionExecute(Sender: TObject);
begin
Filter_BarEdit.SetFocus;
end;

procedure TSt_sp_build_livers_Form.cxGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect:TRect;
begin

  if ((AViewInfo.GridRecord.Values[5]= 1) and  (not AViewInfo.GridRecord.Focused ))
  then  begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Font.Color:= $00AE711E ;
      //ACanvas.Canvas.Brush.Color:=clRed;
      ACanvas.Canvas.FillRect(Arect);
   end;
end;

procedure TSt_sp_build_livers_Form.N1Click(Sender: TObject);
begin
EditButtonClick(Sender);
end;

procedure TSt_sp_build_livers_Form.MenuItem4Click(Sender: TObject);
begin
RefreshButtonClick(Sender);
end;

procedure TSt_sp_build_livers_Form.ExitAction1Click(Sender: TObject);
begin
close;
end;




//---------------------------------------- инфа о проживающем------------------------------------------------------

procedure TSt_sp_build_livers_Form.ViewRegistration_LargeButtonClick(Sender: TObject);
var
 ActionStr, ActionKeyStr      : string;
 i             : integer;
 edit_item_id: int64;
 begin
 if cxGridDBTableView1.DataController.RecordCount = 0 then exit;
 Screen.Cursor:=crHourGlass;
 edit_item_id := DataSet['id_kod'];
 ActionStr := 'Просмотр регистрации проживающего';
 ActionKeyStr:='Принять';
 Registration_Form := TRegistration_Form.Create(Self);
 Registration_Form.Caption := ActionStr ;
 Registration_Form.FIO_Label.Caption:= DataSet['fio_combo'];
 if  Dataset['NAME_FAC']<> null then
 Registration_Form.Fac_Label.Caption:= Registration_Form.Fac_Label.Caption + Dataset['NAME_FAC'];
 Registration_Form.DataRog_Label.Caption:= Registration_Form.DataRog_Label.Caption + datetostr(Dataset['DATA_R']);
 if  Dataset['KURS']<> null then
 Registration_Form.Kurs_Label.Caption:= Registration_Form.Kurs_Label.Caption + inttostr(Dataset['KURS']);
  // проверяю в sys_options - показывать ли вкладку Входящего остатка
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text:='select Show_ost from ST_INSOST_SHOW_CHECK';
 ReadDataSet.Open;
 if ReadDataSet['Show_ost']=0 then Registration_Form.cxPageControl1.Controls[5].Destroy
 else begin
 // выбираем историю по входящему остатку (если есть)
 ReadDataSet.close;
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text:='select * from ST_RELSM_SELECT('+ inttostr(edit_item_id)+')';
 ReadDataSet.Open;
 ReadDataSet.FetchAll;
 if ReadDataSet.RecordCount <> 0 then begin
  Registration_Form.cxGrid1TableView1.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do begin
  Registration_Form.cxGrid1TableView1.DataController.Values[i, 0] := inttostr(ReadDataSet['Number_sm'])+'.'+inttostr(ReadDataSet['Number_razd'])+'.'+inttostr(ReadDataSet['Number_st'])+'.'+inttostr(ReadDataSet['Number_kekv']);
  Registration_Form.cxGrid1TableView1.DataController.Values[i, 1] := ReadDataSet['SUMMA'];
  Registration_Form.cxGrid1TableView1.DataController.Values[i, 2]:=ReadDataSet['KOD_SM'];
  Registration_Form.cxGrid1TableView1.DataController.Values[i, 3]:=ReadDataSet['KOD_RAZD'];
  Registration_Form.cxGrid1TableView1.DataController.Values[i, 4]:=ReadDataSet['KOD_ST'];
  Registration_Form.cxGrid1TableView1.DataController.Values[i, 5]:=ReadDataSet['KOD_KEKV'];
  ReadDataSet.Next;
 end;
 ReadDataSet.close;
 ReadDataSet.SelectSQL.Clear;
 Registration_Form.Sum_Result.Value:=0;

  for i:=0 to  Registration_Form.cxGrid1TableView1.DataController.RecordCount-1 do begin
  Registration_Form.Sum_Result.Value:= Registration_Form.Sum_Result.Value + Registration_Form.cxGrid1TableView1.DataController.Values[i, 1];
  end; 
 end
 else begin
 ReadDataSet.close;
 ReadDataSet.SelectSQL.Clear;
 end;
 end;

 ReadDataSet.close;
 ReadDataSet.SelectSQL.Clear;

  // Выбираем историю категорий проживания
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_DT_PFKAT_SELECT(' + IntToStr(edit_item_id) + ')';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  Registration_Form.cxGridTableView1.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do
   begin
    Registration_Form.cxGridTableView1.DataController.Values[i, 0] := ReadDataSet['NUM_KATEGORIYA'];
    Registration_Form.cxGridTableView1.DataController.Values[i, 1] := ReadDataSet['BEG_DATE'];
    Registration_Form.cxGridTableView1.DataController.Values[i, 2] := ReadDataSet['END_DATE'];
    Registration_Form.cxGridTableView1.DataController.Values[i, 3] := ReadDataSet['KATEGORIYA'];
    Registration_Form.cxGridTableView1.DataController.Values[i, 4] := ReadDataSet['SHORT_NAME_CATEGORY'];
    Registration_Form.cxGridTableView1.DataController.Values[i, 6] := ReadDataSet['PAY_SUM'];
    
    ReadDataSet.Next;
   end;
  ReadDataSet.Close;
  Registration_Form.SortGridData;

  // Выбираем историю проживания
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_DT_HROOM_SELECT(' + IntToStr(edit_item_id) + ')';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  Registration_Form.cxGridTableView_of_Live.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do begin
  Registration_Form.cxGridTableView_of_Live.DataController.Values[i, 0] := ReadDataSet['NUM_BUILD'];
  Registration_Form.cxGridTableView_of_Live.DataController.Values[i, 1] := ReadDataSet['Room_Combo'];
  Registration_Form.cxGridTableView_of_Live.DataController.Values[i, 2] := ReadDataSet['BEG_DATE'];
  Registration_Form.cxGridTableView_of_Live.DataController.Values[i, 3] := ReadDataSet['END_DATE'];
  Registration_Form.cxGridTableView_of_Live.DataController.Values[i, 4] := ReadDataSet['Kod_Build'];
  Registration_Form.cxGridTableView_of_Live.DataController.Values[i, 5] := ReadDataSet['N_Room'];
  Registration_Form.cxGridTableView_of_Live.DataController.Values[i, 6] := ReadDataSet['Type_Room'];
  Registration_Form.cxGridTableView_of_Live.DataController.Values[i, 7] := ReadDataSet['SHORT_NAME'];
  ReadDataSet.Next;
 end;
 ReadDataSet.Close;
 Registration_Form.SortGridData_Live;

 // выбираем историю субсидий
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_DT_PFSUB_SELECT(' + IntToStr(edit_item_id) + ')';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  Registration_Form.cxGridTableView2.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do begin
  Registration_Form.cxGridTableView2.DataController.Values[i, 0] := ReadDataSet['BEG_DATE'];
  Registration_Form.cxGridTableView2.DataController.Values[i, 1] := ReadDataSet['END_DATE'];
  Registration_Form.cxGridTableView2.DataController.Values[i, 2] := ReadDataSet['SUMMA'];
  Registration_Form.cxGridTableView2.DataController.Values[i, 3] := ReadDataSet['CNT_MONTH'];
  Registration_Form.cxGridTableView2.DataController.Values[i, 4] := ReadDataSet['NAME_STATE'];
  Registration_Form.cxGridTableView2.DataController.Values[i, 5] := ReadDataSet['ID_SUBSIDY'];
  Registration_Form.cxGridTableView2.DataController.Values[i, 6] := ReadDataSet['ID_STATE'];
  Registration_Form.cxGridTableView2.DataController.Values[i, 7] := ReadDataSet['COMMENT'];
  Registration_Form.cxGridTableView2.DataController.Values[i, 8] := ReadDataSet['FULL_NAME'];
  Registration_Form.cxGridTableView2.DataController.Values[i, 9] := ReadDataSet['SHORT_NAME'];
  ReadDataSet.Next;
 end;
 ReadDataSet.Close;
// Registration_Form.SortGridData_Subsidy;
  // выбираем историю льгот
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_PFLGOT_SELECT(' + IntToStr(edit_item_id) + ')';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  Registration_Form.cxGridTableView3.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do
   begin
    Registration_Form.cxGridTableView3.DataController.Values[i, 0] := ReadDataSet['Num_Lg'];
    Registration_Form.cxGridTableView3.DataController.Values[i, 1] := ReadDataSet['BEG_DATE'];
    Registration_Form.cxGridTableView3.DataController.Values[i, 2] := ReadDataSet['END_DATE'];
    Registration_Form.cxGridTableView3.DataController.Values[i, 3] := ReadDataSet['ID_LG'];
    Registration_Form.cxGridTableView3.DataController.Values[i, 4] := ReadDataSet['NAME_LG'];
    ReadDataSet.Next;
   end;
  ReadDataSet.Close;

  Registration_Form.SortGridData_Lg;

  Registration_Form.cxGridTableView_of_Live.DataController.FocusedRowIndex := 0;

  if Registration_Form.cxGridTableView1.DataController.RecordCount >0 then
  begin
  Registration_Form.cxGridTableView1.DataController.FocusedRowIndex := 0;
  end;

  if Registration_Form.cxGridTableView_of_Live.DataController.RecordCount >0 then
  begin
  Registration_Form.cxGridTableView_of_Live.DataController.FocusedRowIndex := 0;
  end;

  if Registration_Form.cxGridTableView2.DataController.RecordCount >0 then
  begin
  Registration_Form.cxGridTableView2.DataController.FocusedRowIndex := 0;
  end;

  if Registration_Form.cxGridTableView3.DataController.RecordCount >0 then
  begin
  Registration_Form.cxGridTableView3.DataController.FocusedRowIndex := 0;
  end;
Registration_Form.ShowModal;
  Screen.Cursor:=crDefault;
end;

procedure TSt_sp_build_livers_Form.cxGridDBTableView1MouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  if button = mbRight then
  dxBarPopupMenu1.PopupFromCursorPos;
end;

procedure TSt_sp_build_livers_Form.ViewActionExecute(Sender: TObject);
begin
ViewRegistration_LargeButtonClick(Sender);
end;

procedure TSt_sp_build_livers_Form.ChooseActionExecute(Sender: TObject);
begin
if cxGridDBTableView1.DataController.RecordCount = 0 then exit;
EditButtonClick(Sender);
end;

procedure TSt_sp_build_livers_Form.dxBarButton4Click(Sender: TObject);
begin
close;
end;

procedure TSt_sp_build_livers_Form.Refresh_ActionExecute(Sender: TObject);
begin
RefreshButtonClick(Sender);
end;

procedure TSt_sp_build_livers_Form.Exit_ecExecute(Sender: TObject);
begin
close;
end;

procedure TSt_sp_build_livers_Form.Filter_BarEditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  i:Integer;
  Int : Boolean;
begin
  if Filter_BarEdit.Text = '' then
   Begin
    FIO_CheckBox.Checked := True;
    Exit;
   end;

  int:= true;
  For i:=1 to Length(Filter_BarEdit.Text) do
   If not (Filter_BarEdit.Text[i] in ['0'..'9']) then Int := false;

  If Int
   then BarCode_CheckBox.Checked := true
   else FIO_CheckBox.Checked := True;
end;

procedure TSt_sp_build_livers_Form.dxBarLargeButton1Click(Sender: TObject);
var
  stUplSum, stSumDoc, stSNeed, SegodnyaOpl : Currency;
  STDATEOPL : TDate;
  Cur_date  : string;
  edititem  : int64;
begin
  OplataSprav_Form := TOplataSprav_Form.Create(Self);
  if Dataset['NAME_FAC'] <> null
   then OplataSprav_Form.Fac_Label.Caption:=OplataSprav_Form.Fac_Label.Caption   + ': ' + Dataset['NAME_FAC']
   else OplataSprav_Form.Fac_Label.Caption:=OplataSprav_Form.Fac_Label.Caption   + ': ' + '';

  if Dataset['KURS'] <> null
   then OplataSprav_Form.Kurs_Label.Caption:=OplataSprav_Form.Kurs_Label.Caption + ': ' + inttostr(Dataset['KURS'])
   else OplataSprav_Form.Kurs_Label.Caption:=OplataSprav_Form.Kurs_Label.Caption + ': ' + '';

  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  edititem := DataSet[KeyField];
  ReadDataSet.SelectSQL.Text:='select Date_birn from ST_PFIO_BIRN_DATE('+ inttostr(edititem)+')' ;
  ReadDataSet.Open;
  OplataSprav_Form.DataRog_Label.Caption:=OplataSprav_Form.DataRog_Label.Caption+ ': '+ datetostr(ReadDataSet['Date_Birn']);
  ReadDataSet.Close;
  With WriteProc do
   begin
    try
     // --------------запуск процедуры st_pay------------------------------
     // расчет уже уплаченной суммы

     StoredProcName := 'ST_PAY_TMP_CLEAR';
     Transaction.StartTransaction;
     Prepare;
     ParamByName('ID_SESSION').AsInt64 := id_session_pay;
     ExecProc;
     Transaction.Commit;
     Close;

     StoredProcName := 'ST_PAY';
     Transaction.StartTransaction;
     Prepare;
     ParamByName('ID_DOG_STUD').AsInt64 := DataSet[KeyField];
     ParamByName('DATE_PROV_CHECK').AsShort := 1;
     ParamByName('IS_DOC_GEN').AsShort := 1;
     ParamByName('IS_PROV_GEN').AsShort := 1;
     ParamByName('IS_SMET_GEN').AsShort := 1;
     ExecProc;

     stUplSum := ParamByName('STUPLSUM').AsCurrency;
     stSumDoc := ParamByName('SUMMA_ALL').AsCurrency;

     id_session_pay:= ParamByName('ID_SESSION').AsInt64;

     Transaction.Commit;
     Close;
     if stUplSum > stSumDoc
      then OplataSprav_Form.St_UplSum_Edit.Value:= stUplSum
      else OplataSprav_Form.St_UplSum_Edit.Value:= stSumDoc;

     // --------------запуск процедуры st_calc------------------------------
     //
     WriteProc.StoredProcName := 'ST_CALC_TMP_CLEAR';
     WriteProc.Transaction.StartTransaction;
     WriteProc.Prepare;
     WriteProc.ParamByName('ID_SESSION').AsInt64 := id_session_calc;
     WriteProc.ExecProc;
     WriteProc.Transaction.Commit;
     WriteProc.Close;

     StoredProcName := 'ST_CALC';
     Transaction.StartTransaction;
     Prepare;
     ParamByName('ID_KOD').AsInt64 := DataSet[KeyField];
     if stUplSum > stSumDoc
      then ParamByName('STUPLSUM').AsCurrency := stUplSum
      else ParamByName('STUPLSUM').AsCurrency := stSumDoc; // это уже с уплаченной суммой
     ExecProc;

     OplataSprav_Form.St_SNeed_Edit.Value:= ParamByName('ST_SNEED').AsCurrency;
     stSNeed:= ParamByName('ST_SNEED').AsCurrency;      //  сумма, необходимая для уплаты за весь период
     STDATEOPL:= ParamByName('STDATEOPL').AsDateTime;   // дата, по которую оплачено
     OplataSprav_Form.DateOpl_Label.Caption:= OplataSprav_Form.DateOpl_Label.Caption + '  '+ datetostr(STDATEOPL);

     id_session_calc:= ParamByName('ID_SESSION').AsInt64;

     Transaction.Commit;
     Close;

     if stUplSum > stSumDoc
      then OplataSprav_Form.Zadolgnost_Edit.Value:= stSNeed - stUplSum
      else OplataSprav_Form.Zadolgnost_Edit.Value:= stSNeed - stSumDoc;

     StoredProcName := 'ST_CALC_TMP_CLEAR';
     Transaction.StartTransaction;
     Prepare;
     ParamByName('ID_SESSION').AsInt64 := id_session_calc;
     ExecProc;
     Transaction.Commit;
     Close;

     // --------------запуск процедуры st_calc------------------------------
     ReadDataSet.Close;
     ReadDataSet.SelectSQL.Clear;
     ReadDataSet.SelectSQL.Text := 'select CUR_DATE from ST_GET_CURRENT_DATE';
     ReadDataSet.Open;
     Cur_date:= ReadDataSet['CUR_DATE'];
     ReadDataSet.Close;

     //
     if (STDATEOPL <= strtodate(Cur_date)) then
      begin
       StoredProcName := 'ST_CALC';
       Transaction.StartTransaction;
       Prepare;
       ParamByName('ID_KOD').AsInt64 := DataSet[KeyField];
       ParamByName('BEG_CHECK').AsVariant := STDATEOPL;
       ParamByName('STUPLSUM').AsVariant := null;
       ParamByName('END_CHECK').AsDate := strtodate(Cur_date);
       ExecProc;
       SegodnyaOpl:=ParamByName('ST_SNEED').AsCurrency;

       id_session_calc:= ParamByName('ID_SESSION').AsInt64;

       Transaction.Commit;
       Close;
      end
     else SegodnyaOpl := 0;

     OplataSprav_Form.Today_Opl_Edit.Value:= SegodnyaOpl;
     if SegodnyaOpl > OplataSprav_Form.Zadolgnost_Edit.Value
      then OplataSprav_Form.Today_Opl_Edit.Value:= OplataSprav_Form.Zadolgnost_Edit.Value ;

     if ((OplataSprav_Form.Zadolgnost_Edit.Value = 0) or (OplataSprav_Form.Zadolgnost_Edit.Value<0))
      then OplataSprav_Form.Today_Opl_Edit.Value:= 0;

     StoredProcName := 'ST_CALC_TMP_CLEAR';
     Transaction.StartTransaction;
     Prepare;
     ParamByName('ID_SESSION').AsInt64 := id_session_calc;
     ExecProc;
     Transaction.Commit;
     Close;

     StoredProcName := 'ST_CALC';
     Transaction.StartTransaction;
     Prepare;
     ParamByName('ID_KOD').AsInt64 := edititem;
     ParamByName('BEG_CHECK').AsVariant := null;
     ParamByName('STUPLSUM').AsVariant := null;
     ParamByName('END_CHECK').AsVariant := null;

     ExecProc;
     id_session_calc:= ParamByName('ID_SESSION').AsInt64;
     Transaction.Commit;
     Close;
    except
     Transaction.Rollback;
     raise;
    end;
   end;

  OplataSprav_Form.FIOCOMBO_Label.Caption := DataSet['fio_combo'];
  Screen.Cursor:= crDefault;
  OplataSprav_Form.id_session_calc:= id_session_calc;
  OplataSprav_Form.id_session_pay:= id_session_pay;

  if OplataSprav_Form.ShowModal = mrOK then
   begin
    WriteProc.StoredProcName := 'ST_CALC_TMP_CLEAR';
    WriteProc.Transaction.StartTransaction;
    WriteProc.Prepare;
    WriteProc.ParamByName('ID_SESSION').AsInt64 := id_session_calc;
    WriteProc.ExecProc;
    WriteProc.Transaction.Commit;
    WriteProc.Close;

    WriteProc.StoredProcName := 'ST_PAY_TMP_CLEAR';
    WriteProc.Transaction.StartTransaction;
    WriteProc.Prepare;
    WriteProc.ParamByName('ID_SESSION').AsInt64 := id_session_pay;
    WriteProc.ExecProc;
    WriteProc.Transaction.Commit;
    WriteProc.Close;
   end;
end;

end.
