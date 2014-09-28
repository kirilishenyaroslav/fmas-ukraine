{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль печати мемориальных ордеров                    }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uMatasMO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, FIBDatabase, pFIBDatabase, ExtCtrls, cxGraphics,
  cxControls, dxStatusBar, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, cxLookAndFeelPainters, cxButtons, ActnList,
  FIBDataSet, pFIBDataSet, cxSpinEdit, FR_DSet, FR_DBSet, FR_Class,
  frxClass, frxDBSet, DateUtils,
  uMatasVars, uMatasUtils, cxCheckBox, frxDesgn, Menus, FIBQuery,
  pFIBQuery, pFIBStoredProc, cxButtonEdit, uSpMatSchMulti;

type
  TfmMatasMO = class(TForm)
    pFIBDatabaseMO: TpFIBDatabase;
    ActionList1: TActionList;
    ActionOk: TAction;
    ActionCancel: TAction;
    pFIBDataSetSelToGrid: TpFIBDataSet;
    DataSourceTransit: TDataSource;
    pFIBTransactionR: TpFIBTransaction;
    cxStyleRepositoryMO: TcxStyleRepository;
    cxStyleBG: TcxStyle;
    pFIBDataSetSelToGridREG_TITLE: TFIBStringField;
    pFIBDataSetSelToGridREG_SHORT: TFIBStringField;
    pFIBDataSetSelToGridID_REG: TFIBBCDField;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    pFIBDataSetSelMainInfo: TpFIBDataSet;
    DataSource1: TDataSource;
    frxDBDatasetMO: TfrxDBDataset;
    pFIBDataSetSelMainForKr: TpFIBDataSet;
    frxDBDatasetKr: TfrxDBDataset;
    frxDBDatasetDb: TfrxDBDataset;
    pFIBDataSetSelMainForDb: TpFIBDataSet;
    LabelPeriod: TLabel;
    cxComboBoxS: TcxComboBox;
    cxSpinEditS: TcxSpinEdit;
    LabelPo: TLabel;
    cxComboBoxPo: TcxComboBox;
    cxSpinEditPo: TcxSpinEdit;
    cxButtonOk: TcxButton;
    cxButtonCancel: TcxButton;
    Label4: TLabel;
    cxCopies: TcxSpinEdit;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    cxCheckBoxDis: TcxCheckBox;
    pm1: TPopupMenu;
    N1: TMenuItem;
    actParam: TAction;
    DS_Param: TpFIBDataSet;
    Tr_Params: TpFIBTransaction;
    StPr_Params: TpFIBStoredProc;
    lbl1: TLabel;
    cxSch: TcxButtonEdit;
    ds_11_12: TpFIBDataSet;
    cxButton1: TcxButton;
    frxDesigner1: TfrxDesigner;
    frxReportMO: TfrxReport;
    procedure ActionCancelExecute(Sender: TObject);
    procedure cxComboBoxPoKeyPress(Sender: TObject; var Key: Char);
    procedure cxComboBoxSKeyPress(Sender: TObject; var Key: Char);
    procedure ActionOkExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure actParamExecute(Sender: TObject);
    procedure cxSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
  private
    MyNowPeriod : TDateTime;
    PathDoPechati, path_to_shablon : String;
  public
     ResultArray : Variant;
     FILTER_ID_SESSION: integer;
     F_SCH: boolean;
  end;

  function ShowReport(AOwner:TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  exports ShowReport;

var
  fmMatasMO: TfmMatasMO;

implementation

{$R *.dfm}
uses uParamsMO;
function ShowReport(AOwner:TComponent;DB:TISC_DB_HANDLE):Integer;
var
    fm : TfmMatasMO;
     dy, dm, dd: Word;
begin
    fm := TfmMatasMO.Create(AOwner);
//    fm.FormStyle := fsMDIChild;
    fm.pFIBDatabaseMO.Handle := DB;
    fm.pFIBDatabaseMO.Connected := true;

    fm.pFIBDataSetSelToGrid.Close;
    fm.pFIBDataSetSelToGrid.SQLs.SelectSQL.Text := 'select * from MAT_SEL_INFO_FOR_MEMORD';
    fm.pFIBDataSetSelToGrid.Open;

    fm.LabelPeriod.Caption    := 'Перiод з';
    fm.LabelPo.Caption        := 'по';
    fm.cxButtonCancel.Caption := 'Вiдмiнити';
    fm.cxButtonOk.Caption     := 'Друк';
    fm.cxGrid1DBTableView1DBColumn1.Caption := 'Назва повна';
    fm.cxGrid1DBTableView1DBColumn2.Caption := 'Назва скорочено';
    fm.Caption                := 'Друк оборотних вiдомостей';
    fm.MyNowPeriod            := _MATAS_PERIOD;
    DecodeDate(fm.MyNowPeriod, dy, dm,  dd);
    fm.cxSpinEditS.Value      := dy;
    fm.cxSpinEditPo.Value      := dy;
    fm.PathDoPechati          := _PATH_REPORTS;

    fm.cxComboBoxS.ItemIndex  := dm-1;
    fm.cxComboBoxPo.ItemIndex := dm-1;

    ShowReport := fm.ResultArray;
    fm.cxCheckBoxDis.Visible:=IntToBool(_ALLOW_EDIT_TEMPLATE);
    fm.FILTER_ID_SESSION:=fm.pFIBDatabaseMO.Gen_Id('MAT_ID_SESSION',1, fm.pFIBTransactionR);
    fm.F_SCH:=false;
end;

procedure TfmMatasMO.ActionCancelExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmMatasMO.cxComboBoxPoKeyPress(Sender: TObject; var Key: Char);
begin
    key := chr(0);
end;

procedure TfmMatasMO.cxComboBoxSKeyPress(Sender: TObject; var Key: Char);
begin
    key := chr(0);
end;

procedure TfmMatasMO.ActionOkExecute(Sender: TObject);
var
    id_reg, DateBeg, DateEnd, Formeruem, Num_akt : string;
    startM, endM, change, tip : integer;
    w: TForm;
    s:string;
begin
    w:=ShowWaitWindow(self);
    if cxSch.text='' then F_SCH:=False;
    id_reg     := pFIBDataSetSelToGrid.FieldByName('ID_REG').AsString;
    //showmessage(id_reg);
    startM     := cxComboBoxS.ItemIndex + 1;
    endM       := cxComboBoxPo.ItemIndex + 1;
    DateBeg    := DateToStr(StrToDate('01.' + IntToStr(startM) + '.' + cxSpinEditS.Text));
    DateEnd    := DateToStr(EndOfTheMonth(StrToDate('01.' + IntToStr(endM) + '.' + cxSpinEditPo.Text)));

    DS_Param.Close;
    DS_Param.SelectSQL.Clear;
    DS_Param.SelectSQL.Add('SELECT * FROM MAT_INI_MO_REPORT WHERE ID_REG_UCH=:ID_REG');
    DS_Param.Prepare;
    DS_Param.ParamByName('ID_REG').AsInteger:=pFIBDataSetSelToGridID_REG.AsInteger;
    DS_Param.CloseOpen(False);
    tip:=DS_Param.FieldValues['TIP_FORM'];

   // if id_reg='31597' then
    if tip=16 then
    begin
    pFIBDataSetSelMainInfo.Close;
    pFIBDataSetSelMainInfo.SQLs.SelectSQL.Text := 'select * from MAT_SEL_PRINT_MEMORD_16('''+id_reg+''','''+DateBeg+''','''+DateEnd+''')';
    if F_SCH then
    begin
    pFIBDataSetSelMainInfo.SQLs.SelectSQL.Add(' WHERE ( OPER_KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    pFIBDataSetSelMainInfo.SQLs.SelectSQL.Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
    end;
    if _ORG_SHORT_NAME = 'КНУТД' then pFIBDataSetSelMainInfo.SQLs.SelectSQL.Add(' ORDER BY NAME_DOC, NUM_DOC, DATE_DOC, DB_SCH');
    pFIBDataSetSelMainInfo.Open;
    end
    else
    begin
     //if id_reg='32697' then
     if tip=11 then
     begin
       ds_11_12.Close;
       ds_11_12.SelectSQL.Text:='select first(1) id_reg_uch from MAT_INI_MO_REPORT WHERE tip_form=12';
       ds_11_12.CloseOpen(False);
       id_reg:=ds_11_12.FieldValues['id_reg_uch'];
     pFIBDataSetSelMainInfo.Close;
     pFIBDataSetSelMainInfo.SQLs.SelectSQL.Text := 'select * from MAT_PRINT_MEMORD_11('''+id_reg+''','''+DateBeg+''','''+DateEnd+''')';
     if F_SCH then
     begin
     pFIBDataSetSelMainInfo.SQLs.SelectSQL.Add(' WHERE ( OPER_DB_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
     pFIBDataSetSelMainInfo.SQLs.SelectSQL.Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
     end;
     pFIBDataSetSelMainInfo.Open;
     end
     else
     begin

      pFIBDataSetSelMainInfo.Close;
      pFIBDataSetSelMainInfo.SQLs.SelectSQL.Text := 'select * from MAT_PRINT_MEMORD('''+id_reg+''','''+DateBeg+''','''+DateEnd+''')';
      if F_SCH then
      begin
      pFIBDataSetSelMainInfo.SQLs.SelectSQL.Add(' WHERE ( OPER_KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
      pFIBDataSetSelMainInfo.SQLs.SelectSQL.Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
      end;
      if _ORG_SHORT_NAME = 'КНУТД' then pFIBDataSetSelMainInfo.SQLs.SelectSQL.Add(' ORDER BY NAME_DOC, NUM_DOC, DATE_DOC, DB_SCH');
      pFIBDataSetSelMainInfo.Open;
      
     end;
    end;

    //if id_reg='31597'then
    if tip=16 then
    begin
    pFIBDataSetSelMainForKr.Close;
    pFIBDataSetSelMainForKr.SQLs.SelectSQL.Text := 'select kr_sch, sum(summa_kr) as summa_kr from MAT_PRINT_MEMORD_SUM_KR_16('''+id_reg+''','''+DateBeg+''','''+DateEnd+''')';
    if F_SCH then
    begin
    pFIBDataSetSelMainForKr.SQLs.SelectSQL.Add(' WHERE ( OPER_KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    pFIBDataSetSelMainForKr.SQLs.SelectSQL.Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
    end;
    pFIBDataSetSelMainForKr.SQLs.SelectSQL.Add('GROUP BY 1 ORDER BY KR_SCH');
    pFIBDataSetSelMainForKr.Open;

    pFIBDataSetSelMainForDb.Close;
    pFIBDataSetSelMainForDb.SQLs.SelectSQL.Text := 'select db_sch, sum(summa_db) as summa_db from MAT_PRINT_MEMORD_SUM_DB_16('''+id_reg+''','''+DateBeg+''','''+DateEnd+''')';
    if F_SCH then
    begin
    pFIBDataSetSelMainForDb.SQLs.SelectSQL.Add(' WHERE ( OPER_KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    pFIBDataSetSelMainForDb.SQLs.SelectSQL.Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
    end;
    pFIBDataSetSelMainForDb.SQLs.SelectSQL.Add('GROUP BY 1 ORDER BY DB_SCH');
    pFIBDataSetSelMainForDb.Open;
    end
    else
    begin
      //if id_reg='32697' then
      if tip=11 then
      begin
       pFIBDataSetSelMainForKr.Close;
       pFIBDataSetSelMainForKr.SQLs.SelectSQL.Text := 'select  KR_SCH, sum(summa) As Summa_kr from MAT_PRINT_MEMORD_11('''+id_reg+''','''+DateBeg+''','''+DateEnd+''')';
       if F_SCH then
       begin
       pFIBDataSetSelMainForKr.SQLs.SelectSQL.Add(' WHERE ( OPER_DB_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
       pFIBDataSetSelMainForKr.SQLs.SelectSQL.Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
       end;
       pFIBDataSetSelMainForKr.SQLs.SelectSQL.Add('GROUP BY  KR_SCH  ORDER BY KR_SCH');
       pFIBDataSetSelMainForKr.Open;

       pFIBDataSetSelMainForDb.Close;
       pFIBDataSetSelMainForDb.SQLs.SelectSQL.Text := 'select DB_SCH, sum(summa) As summa_db from MAT_PRINT_MEMORD_11('''+id_reg+''','''+DateBeg+''','''+DateEnd+''')';
       if F_SCH then
       begin
       pFIBDataSetSelMainForDb.SQLs.SelectSQL.Add(' WHERE ( OPER_DB_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
       pFIBDataSetSelMainForDb.SQLs.SelectSQL.Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
       end;
       pFIBDataSetSelMainForDb.SQLs.SelectSQL.Add('GROUP BY Db_SCH  ORDER BY Db_SCH');
       pFIBDataSetSelMainForDb.Open;
      end
      else
      begin
       pFIBDataSetSelMainForKr.Close;
       pFIBDataSetSelMainForKr.SQLs.SelectSQL.Text := 'select  kr_sch, sum(summa_kr) as summa_kr from MAT_PRINT_MEMORD_SUM_KR('''+id_reg+''','''+DateBeg+''','''+DateEnd+''')';
       if F_SCH then
       begin
       pFIBDataSetSelMainForKr.SQLs.SelectSQL.Add(' WHERE ( OPER_KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
       pFIBDataSetSelMainForKr.SQLs.SelectSQL.Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
       end;
       pFIBDataSetSelMainForKr.SQLs.SelectSQL.Add('GROUP BY 1 ORDER BY KR_SCH');
       pFIBDataSetSelMainForKr.Open;

       pFIBDataSetSelMainForDb.Close;
       pFIBDataSetSelMainForDb.SQLs.SelectSQL.Text := 'select  db_sch, sum(summa_db) as summa_db from MAT_PRINT_MEMORD_SUM_DB('''+id_reg+''','''+DateBeg+''','''+DateEnd+''')';
       if F_SCH then
       begin
       pFIBDataSetSelMainForDb.SQLs.SelectSQL.Add(' WHERE ( OPER_KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
       pFIBDataSetSelMainForDb.SQLs.SelectSQL.Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
       end;
       pFIBDataSetSelMainForDb.SQLs.SelectSQL.Add('GROUP BY 1 ORDER BY DB_SCH');
       pFIBDataSetSelMainForDb.Open;
      end;
    end;
    //if id_reg='31597' then
    if tip=16 then
    begin
    if _ORG_SHORT_NAME = 'КНУТД' then path_to_shablon := 'Mat_memord_n16_KNUTD.fr3'
    else path_to_shablon                := 'Mat_memord_n16.fr3';
    end
    else
    //if id_reg='32697' then
    if tip=11 then
    path_to_shablon                := 'Mat_mem_ord_n11.fr3'
    else
    //if id_reg='32797' then
    if tip=12 then
    path_to_shablon                := 'Mat_mem_ord_n12.fr3'
    else
    path_to_shablon                := 'Mat_memord_n9.fr3';
    Formeruem                      := VarToStr(pFIBDataSetSelToGrid.FieldValues['REG_TITLE']);

    frxReportMO.LoadFromFile(ExtractFilePath(Application.ExeName)+ PathDoPechati + '\' + path_to_shablon);
    frxReportMO.Variables['USTANOVA']        := {'''DonNU''';  //}''''+_ORG_FULL_NAME+'''';
    frxReportMO.Variables['OKUD']            := {'''124758'''; //}''''+_ORG_KOD_OKPO+'''';
    frxReportMO.Variables['DKUD']            := '''''';
    frxReportMO.Variables['NAME_FORM']       := ''''+Formeruem+'''';
    if ((cxSch.Text<>'') and (F_SCH=True)) then
    s:='Фільтр за рахунками '+ cxSch.Text
    else s:='';

      frxReportMO.Variables['SCHS']            := ''''+s+'''';
    {if((id_reg = '11') or (id_reg = '29') or (id_reg = '14')) then
    begin
        Formeruem := 'Накопичувальна відомість про вибуття та переміщення необоротних активів';
        Num_akt   := '438';
    end;

    if((id_reg = '8') or (id_reg = '28')) then
    begin
        Formeruem := 'Накопичувальна відомість витрачення матеріалів';
        Num_akt   := '396';
    end;
    if ((id_reg = '13') or(id_reg = '3')) then
    begin
        Formeruem := 'Накопичувальна відомість про вибуття та переміщення малоцінних та швидкозношуванних предметів';
        Num_akt   := '439';
    end;
    if id_reg = '31597' then
    begin
        Formeruem := 'Накопичувальна відомість позабалансового обліку';
        Num_akt   := '';
    end;
    if id_reg = '32697' then
    begin
        Formeruem := 'Зведення накопичувальних відомостей про надходження продуктів харчування';
        Num_akt   := '398';
    end;
    if id_reg = '32797' then
    begin
        Formeruem := 'Зведення накопичувальних відомостей про витрачання продуктів харчування';
        Num_akt   := '411';
    end;    }
    if ((DS_Param.FieldValues['NAME_REP']<>null) and(DS_Param.FieldValues['NAME_REP']<>'')) then Formeruem:=DS_Param.FieldValues['NAME_REP'];
    if ((DS_Param.FieldValues['NUM_AKT']<>null) and(DS_Param.FieldValues['NUM_AKT']<>0)) then Num_Akt:=DS_Param.FieldValues['NUM_AKT'];
    frxReportMO.Variables['NAZVA']           := ''''+Formeruem+'''';
    frxReportMO.Variables['NUMAKT']          := ''''+Num_akt+'''';

    if ((cxComboBoxS.ItemIndex = cxComboBoxPo.ItemIndex) and (StrToInt(cxSpinEditS.Text) = StrToInt(cxSpinEditPo.Text))) then
    begin
    Formeruem                                := 'за '+cxComboBoxS.Text+ ' ' + cxSpinEditS.Text + 'p.';
    frxReportMO.Variables['PERIOD']          := ''''+Formeruem+'''';
    end else
    begin            
    Formeruem                                := 'з ' + cxComboBoxS.Text + ' ' + cxSpinEditS.Text + 'p. по ' + cxComboBoxPo.Text + ' ' + cxSpinEditPo.Text + 'p.';
    frxReportMO.Variables['PERIOD']          := ''''+Formeruem+'''';
    end;

    if not cxCheckBoxDis.Checked then
    begin
        frxReportMO.PrepareReport;
        frxReportMO.ShowProgress := true;
        if cxCopies.Value>1 then
        begin
            frxReportMO.PrintOptions.Copies := cxCopies.Value;
        end;


        if cxSelectPrinter.Checked = true then
        begin
            frxReportMO.PrintOptions.ShowDialog := true;
            frxReportMO.Print;
        end;

        if cxCheckOnPrinter.Checked then
        begin
            frxReportMO.PrintOptions.ShowDialog := false;
            frxReportMO.Print;
        end else
        if cxCheckBoxDis.Checked = true then frxReportMO.DesignReport else frxReportMO.ShowReport;
    end else
    begin
        frxReportMO.PrepareReport;
        frxReportMO.ShowReport;
        frxReportMO.DesignReport;
    end;
   CloseWaitWindow(w);
//    ShowMessage(IntToStr(pFIBDataSetSelMainInfo.RecordCount));
end;

procedure TfmMatasMO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 try
 StPr_Params.Close;
 StPr_Params.Transaction := Tr_Params;
 StPr_Params.Transaction.StartTransaction;
 StPr_Params.StoredProcName:='MAT_FILTER_CLEAR';
 StPr_Params.Prepare;
 StPr_Params.ParamByName('ID_SESSION').AsInteger:=FILTER_ID_SESSION;
 StPr_Params.ExecProc;
 StPr_Params.Transaction.Commit;
 except on E : Exception
 do begin
  ShowMessage(E.Message);
  StPr_Params.Transaction.Rollback;
  exit;
    end;
 end;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmMatasMO.FormCreate(Sender: TObject);
begin
 LoadMonthTocxComboBox(cxComboBoxS);
 LoadMonthTocxComboBox(cxComboBoxPo);
end;

procedure TfmMatasMO.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  ActionOk.Execute;
end;

procedure TfmMatasMO.actParamExecute(Sender: TObject);
var f:TParamsForm;
    state:string;
begin
  f:=TParamsForm.Create(Self);
  DS_Param.Close;
  DS_Param.SelectSQL.Clear;
  DS_Param.SelectSQL.Add('SELECT * FROM MAT_INI_MO_REPORT WHERE ID_REG_UCH=:ID_REG');
  DS_Param.Prepare;
  DS_Param.ParamByName('ID_REG').AsInteger:=pFIBDataSetSelToGridID_REG.AsInteger;
  DS_Param.CloseOpen(False);
  if DS_Param.FieldValues['ID_MO']=null then
  begin
  state:='Add';
  f.lbl1.Caption:= pFIBDataSetSelToGridREG_TITLE.AsString;
  f.cxNameRep.Text:= '';
  f.cxTipForm.ItemIndex:=0;
  end
  else
  begin
   state:='Edit';
   f.lbl1.Caption:= pFIBDataSetSelToGridREG_TITLE.AsString;
   f.cxNameRep.Text:=DS_Param.FieldValues['NAME_REP'];
   f.cxNumAkt.Text:=DS_Param.FieldValues['NUM_AKT'];
   f.cxTipForm.Text:= DS_Param.FieldValues['TIP_FORM'];
  end;
  f.ShowModal;
  if f.ModalResult=mrOK then
  begin
   if state='Add' then
   try
    StPr_Params.Close;
    StPr_Params.Transaction := Tr_Params;
    StPr_Params.Transaction.StartTransaction;
    StPr_Params.StoredProcName:='MAT_INI_MO_REPORT_INS';
    StPr_Params.Prepare;
    StPr_Params.ParamByName('ID_REG_UCH').AsInteger:=pFIBDataSetSelToGridID_REG.AsInteger;
    StPr_Params.ParamByName('TIP_FORM').AsInteger:=StrToInt(f.cxTipForm.Text);
    StPr_Params.ParamByName('NAME_REP').AsString:=f.cxNameRep.Text;
    if f.cxNumAkt.Text='' then
    StPr_Params.ParamByName('NUM_AKT').AsInteger:=0
    else
    StPr_Params.ParamByName('NUM_AKT').AsInteger:=StrToInt(f.cxNumAkt.Text);
    StPr_Params.ExecProc;
    StPr_Params.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StPr_Params.Transaction.Rollback;
     exit;
    end;
   end;

   if state='Edit' then
   try
    StPr_Params.Close;
    StPr_Params.Transaction := Tr_Params;
    StPr_Params.Transaction.StartTransaction;
    StPr_Params.StoredProcName:='MAT_INI_MO_REPORT_UPD';
    StPr_Params.Prepare;
    StPr_Params.ParamByName('TIP_FORM').AsInteger:=StrToInt(f.cxTipForm.Text);
    StPr_Params.ParamByName('NAME_REP').AsString:=f.cxNameRep.Text;
    if f.cxNumAkt.Text='' then
    StPr_Params.ParamByName('NUM_AKT').AsInteger:=0
    else
    StPr_Params.ParamByName('NUM_AKT').AsInteger:=StrToInt(f.cxNumAkt.Text);
    StPr_Params.ParamByName('ID_MO').AsInteger:=DS_Param.FieldValues['ID_MO'];
    StPr_Params.ExecProc;
    StPr_Params.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StPr_Params.Transaction.Rollback;
     exit;
    end;
   end;
  end;

  f.Free;
  DS_Param.Close;
end;

procedure TfmMatasMO.cxSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  mr: boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
 mr:=false;
 Res:=uSpMatSchMulti.GetMatSchMulti(self, pFIBDatabaseMO.Handle, 0, FILTER_ID_SESSION, mr);
 if mr then begin
  if  VarType(Res) <> varEmpty then begin
   VarDimCnt:=VarArrayHighBound(Res,  1);
   s:='';
   for i:=0 to VarDimCnt do begin
    s:=s+VarToStr(Res[i][1])+';';
   end;
   cxSch.Text := s;
   F_SCH:=true;
  end
 end
 else
 begin
  F_SCH:=false;
  cxSch.Text:='';
 end;

end;

procedure TfmMatasMO.cxButton1Click(Sender: TObject);
begin
try
 StPr_Params.Close;
 StPr_Params.Transaction := Tr_Params;
 StPr_Params.Transaction.StartTransaction;
 StPr_Params.StoredProcName:='MAT_FILTER_CLEAR';
 StPr_Params.Prepare;
 StPr_Params.ParamByName('ID_SESSION').AsInteger:=FILTER_ID_SESSION;
 StPr_Params.ExecProc;
 StPr_Params.Transaction.Commit;
 except on E : Exception
 do begin
  ShowMessage(E.Message);
  StPr_Params.Transaction.Rollback;
  exit;
    end;
 end;
 cxSch.Text:='';
end;

end.
