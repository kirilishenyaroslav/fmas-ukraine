unit frmPfio_AE_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxGroupBox, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxTextEdit, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView,
  cxGrid, dxBar, ImgList, cxContainer, cxMaskEdit, cxButtonEdit, ibase, St_Loader_Unit,
  frmIstochniki_Unit, st_ConstUnit, DB, FIBDataSet, pFIBDataSet, Buttons,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase;

type
  TfrmPfio_AE = class(TForm)
    cxGroupBox1: TcxGroupBox;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
    footer: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    SuperStyling_Header: TcxStyle;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DexExpress_Style_AE: TcxGridTableViewStyleSheet;
    Istochniki_GroupBox: TcxGroupBox;
    dxBarDockControl2: TdxBarDockControl;
    Grid_istochniki: TcxGrid;
    Grid_istochnikiTableView: TcxGridTableView;
    smeta: TcxGridColumn;
    razdel: TcxGridColumn;
    statya: TcxGridColumn;
    kekv: TcxGridColumn;
    persent_prov: TcxGridColumn;
    id_smeta: TcxGridColumn;
    id_razdel: TcxGridColumn;
    id_statya: TcxGridColumn;
    id_kekv: TcxGridColumn;
    Grid_istochnikiLevel: TcxGridLevel;
    PopupImageList: TImageList;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarButton;
    EditButton: TdxBarButton;
    DeleteButton: TdxBarButton;
    Studer_Edit: TcxButtonEdit;
    SummaEdit: TcxCurrencyEdit;
    Summa_Label: TLabel;
    PIB_Label: TLabel;
    ReadDataSet: TpFIBDataSet;
    SpeedButton1: TSpeedButton;
    WriteProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    readdataset2: TpFIBDataSet;
    procedure Studer_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Studer_EditKeyPress(Sender: TObject; var Key: Char);
    procedure SummaEditKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_istochnikiTableViewKeyPress(Sender: TObject;
      var Key: Char);
    procedure Grid_istochnikiTableViewDblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SummaEditExit(Sender: TObject);
  private
    procedure FormIniLanguage();
  public
    id_kod : int64;
    DB_Handle : TISC_DB_HANDLE;
    PLanguageIndex : byte;
  end;

var
  frmPfio_AE: TfrmPfio_AE;

implementation

uses st_Spisanie_Unit;

{$R *.dfm}

procedure TfrmPfio_AE.FormIniLanguage;
begin
Grid_istochnikiTableView.Columns[0].Caption:=     st_ConstUnit.st_Smeta[PLanguageIndex];
Grid_istochnikiTableView.Columns[1].Caption:=     st_ConstUnit.st_Razdel[PLanguageIndex];
Grid_istochnikiTableView.Columns[2].Caption:=     st_ConstUnit.st_Stat[PLanguageIndex];
Grid_istochnikiTableView.Columns[3].Caption:=     st_ConstUnit.st_KEKV[PLanguageIndex];
Grid_istochnikiTableView.Columns[4].Caption:=     st_ConstUnit.st_Sum[PLanguageIndex];
Istochniki_GroupBox.Caption                :=     st_ConstUnit.st_IstFinance[PLanguageIndex];

PIB_Label.Caption     :=   st_ConstUnit.st_grid_FIO_Column[PLanguageIndex];
Summa_Label.Caption   :=   st_ConstUnit.st_Sum[PLanguageIndex];

AddButton.Hint        :=   st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
EditButton.Hint       :=   st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
DeleteButton.Hint     :=   st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];

OkButton.Caption:=        st_ConstUnit.st_Accept[PLanguageIndex];
CancelButton.Caption:=    st_ConstUnit.st_Cancel[PLanguageIndex];
end;

procedure TfrmPfio_AE.Studer_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res: Variant;
  id_session_pay, id_session_calc : int64;
  stUplSum, stSNeed : Currency;
begin
  Res:= Load_Reestr(self, DB_Handle);
  if VarArrayDimCount(Res)>0
   then begin
    Screen.Cursor := crHourGlass;
     id_kod := Res[0];
     Studer_Edit.Text := Res[1]+' '+Res[2]+' '+Res[3];

     // --------------запуск процедуры st_pay------------------------------
              // расчет уже уплаченной суммы
       with WriteProc do
         begin
              StoredProcName := 'ST_PAY';
              Transaction.StartTransaction;
              Prepare;
              ParamByName('ID_DOG_STUD').AsInt64 := id_kod;
              ParamByName('DATE_PROV_CHECK').AsShort := 1;
              ParamByName('IS_DOC_GEN').AsShort := 0;
              ParamByName('IS_PROV_GEN').AsShort := 0;
              ParamByName('IS_SMET_GEN').AsShort := 0;
              ExecProc;
               stUplSum:=ParamByName('STUPLSUM').AsCurrency;
               id_session_pay:= ParamByName('ID_SESSION').AsInt64;
              Transaction.Commit;
              Close;
              // --------------запуск процедуры st_calc------------------------------
              StoredProcName := 'ST_CALC';
              Transaction.StartTransaction;
              Prepare;
              ParamByName('ID_KOD').AsInt64 := id_kod;
              ParamByName('STUPLSUM').AsCurrency := stUplSum; // это уже с уплаченной суммой
              ExecProc;

              stSNeed:= ParamByName('ST_SNEED').AsCurrency;      //  сумма, необходимая для уплаты за весь период
              id_session_calc:= ParamByName('ID_SESSION').AsInt64;
              Transaction.Commit;
              close;

              SummaEdit.Value := stSNeed-stUplSum; // это и есть разница, которую нужно уплатить !!!

            // чистка параметров
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

              if SummaEdit.Value <> 0 then SpeedButton1.Click;
         end;
         Screen.Cursor := crDefault;    
   end;
end;

procedure TfrmPfio_AE.OKButtonClick(Sender: TObject);
begin
if Studer_Edit.Text = '' then
 begin
  MessageBox(Handle,PChar(st_ConstUnit.st_NeedFio[PLanguageIndex]),PChar(st_ConstUnit.st_ErrorData[PLanguageIndex]),MB_OK or MB_ICONERROR);
  Studer_Edit.SetFocus;
  exit;
 end;

 if SummaEdit.Value = 0 then
 begin
  MessageBox(Handle,PChar(st_ConstUnit.st_NeedSumma[PLanguageIndex]),PChar(st_ConstUnit.st_ErrorData[PLanguageIndex]),MB_OK or MB_ICONERROR);
  SummaEdit.SetFocus;
  exit;
 end;


 if abs(SummaEdit.value - Grid_istochnikiTableView.DataController.Summary.FooterSummaryValues[0]) > 0.0001 then
 begin
  MessageBox(Handle,PChar(st_ConstUnit.st_SummaNotSumma[PLanguageIndex]),PChar(st_ConstUnit.st_ErrorData[PLanguageIndex]),MB_OK or MB_ICONERROR);
  SummaEdit.SetFocus;
  exit;
 end;

 ModalResult:= mrOk;
end;

procedure TfrmPfio_AE.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmPfio_AE.AddButtonClick(Sender: TObject);
var ViewForm : TfrmIstochniki;
begin
 ViewForm := TfrmIstochniki.create(self);
 ViewForm.DB_Handle := DB_Handle;
 ViewForm.PLanguageIndex := PLanguageIndex;
 ViewForm.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];

if Grid_istochnikiTableView.DataController.RecordCount >0 then
ViewForm.Persent_Edit.Value := SummaEdit.Value - StrToFloat(Grid_istochnikiTableView.DataController.Summary.FooterSummaryValues[0]);

if Grid_istochnikiTableView.DataController.RecordCount = 0 then ViewForm.Persent_Edit.Value := SummaEdit.Value;

 if ViewForm.ShowModal = mrOk then
  begin
    Grid_istochnikiTableView.DataController.RecordCount := Grid_istochnikiTableView.DataController.RecordCount + 1;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 0] := ViewForm.Smeta_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 1] := ViewForm.Razdel_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 2] := ViewForm.Stat_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 3] := ViewForm.Kekv_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 4] := ViewForm.Persent_Edit.Text;

    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 5] := ViewForm.id_smeta;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 6] := ViewForm.id_razdel;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 7] := ViewForm.id_stat;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 8] := ViewForm.id_kekv;

    Grid_istochnikiTableView.DataController.FocusedRecordIndex := Grid_istochnikiTableView.DataController.RecordCount-1;
    Grid_istochniki.SetFocus;
  end;
end;

procedure TfrmPfio_AE.FormShow(Sender: TObject);
begin
FormIniLanguage();
end;

procedure TfrmPfio_AE.EditButtonClick(Sender: TObject);
var ViewForm : TfrmIstochniki;
    cur_date: string;
begin
if Grid_istochnikiTableView.DataController.RecordCount = 0 then exit;
 ViewForm := TfrmIstochniki.create(self);
 ViewForm.DB_Handle := DB_Handle;
 ViewForm.PLanguageIndex := PLanguageIndex;
 ViewForm.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];

 cur_date:= datetostr(now);
 ViewForm.id_smeta:=  Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 5];
 ViewForm.id_razdel:= Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 6];
 ViewForm.id_stat:=   Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 7];
 ViewForm.id_kekv:=   Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 8];

 // нужно пихнуть номера смет, разд... извлечь по ид
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text := 'select KOD_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_ID('+ inttostr(ViewForm.id_smeta)+ ','+kav+cur_date+kav+','+'1'+')';
 ReadDataSet.Open;
 ViewForm.Smeta_description_Label.Caption:=ReadDataSet['TITLE_OBJECT'] ;
 ViewForm.Smeta_Edit.Text:= ReadDataSet['KOD_OBJECT'];
 ReadDataSet.Close;

 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Text := 'select KOD_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_ID('+ inttostr(ViewForm.id_razdel)+ ','+ kav+ cur_date +kav+','+'2'+')';
 ReadDataSet.Open;
 ViewForm.Razdel_description_Label.Caption:=ReadDataSet['TITLE_OBJECT'] ;
 ViewForm.Razdel_Edit.Text:= ReadDataSet['KOD_OBJECT'] ;
 ReadDataSet.Close;

 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Text := 'select KOD_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_ID('+ inttostr(ViewForm.id_stat)+ ','+ kav+ cur_date +kav+','+'3'+')';
 ReadDataSet.Open;
 ViewForm.Stat_description_Label.Caption:=ReadDataSet['TITLE_OBJECT'] ;
 ViewForm.Stat_Edit.Text:= ReadDataSet['KOD_OBJECT'] ;
 ReadDataSet.Close;

 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Text := 'select KEKV_KODE, KEKV_TITLE from PUB_SPR_KEKV_INFO('+ inttostr(ViewForm.id_kekv)+ ','+ kav+ cur_date +kav+')';
 ReadDataSet.Open;
 ViewForm.Kekv_description_Label.Caption:=ReadDataSet['KEKV_TITLE'] ;
 ViewForm.Kekv_Edit.Text:= ReadDataSet['KEKV_KODE'] ;
 ReadDataSet.Close;

 ViewForm.Persent_Edit.Value := Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 4];

  if ViewForm.ShowModal = mrOk then
  begin
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 0] := ViewForm.Smeta_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 1] := ViewForm.Razdel_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 2] := ViewForm.Stat_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 3] := ViewForm.Kekv_Edit.Text;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 4] := ViewForm.Persent_Edit.Text;

    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 5] := ViewForm.id_smeta;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 6] := ViewForm.id_razdel;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 7] := ViewForm.id_stat;
    Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.FocusedRecordIndex, 8] := ViewForm.id_kekv;
  end;
end;

procedure TfrmPfio_AE.DeleteButtonClick(Sender: TObject);
begin
if Grid_istochnikiTableView.DataController.RecordCount = 0 then exit;
  if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
  Grid_istochnikiTableView.DataController.DeleteFocused;
end;

procedure TfrmPfio_AE.FormCreate(Sender: TObject);
begin
 Grid_istochnikiTableView.Items[0].DataBinding.ValueTypeClass := TcxFloatValueType;
 Grid_istochnikiTableView.Items[1].DataBinding.ValueTypeClass := TcxFloatValueType;
 Grid_istochnikiTableView.Items[2].DataBinding.ValueTypeClass := TcxFloatValueType;
 Grid_istochnikiTableView.Items[3].DataBinding.ValueTypeClass := TcxFloatValueType;
 Grid_istochnikiTableView.Items[4].DataBinding.ValueTypeClass := TcxFloatValueType;
 Grid_istochnikiTableView.Items[5].DataBinding.ValueTypeClass := TcxLargeIntValueType;
 Grid_istochnikiTableView.Items[6].DataBinding.ValueTypeClass := TcxLargeIntValueType;
 Grid_istochnikiTableView.Items[7].DataBinding.ValueTypeClass := TcxLargeIntValueType;
 Grid_istochnikiTableView.Items[8].DataBinding.ValueTypeClass := TcxLargeIntValueType;
end;

procedure TfrmPfio_AE.Studer_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then  SummaEdit.SetFocus;
end;

procedure TfrmPfio_AE.SummaEditKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
  Grid_istochniki.SetFocus;
  SpeedButton1.Click;
 end;
end;

procedure TfrmPfio_AE.Grid_istochnikiTableViewKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then  OKButton.SetFocus;
end;

procedure TfrmPfio_AE.Grid_istochnikiTableViewDblClick(Sender: TObject);
begin
  EditButtonClick(Sender);
end;

procedure TfrmPfio_AE.SpeedButton1Click(Sender: TObject);
var SmLining : byte; i: integer;
 id_session_smet, ST_CUR_SMET_record_count : int64;

 function GetCodeBudjet (Id_pk : int64; StProcName: string; OutParamName: string; SecondParam: string) : integer;
  var
     SQLText: string;
  begin
     if SecondParam = '' then
      SQLText:= 'select * from ' + StProcName + '(' + inttostr(Id_pk) + ')'
     else
      SQLText:= 'select * from ' + StProcName + '(' + inttostr(Id_pk) + ',' + ''''+ SecondParam +''''+ ')';

     ReadDataSet2.Close;
     ReadDataSet2.SelectSQL.Clear;
     ReadDataSet2.SelectSQL.Text := SQLText;
     ReadDataSet2.Open;
     Result := ReadDataSet2[OutParamName];
     ReadDataSet2.Close;
  end;

begin
           // расчитываю сумму автоматом
           // сначала чищу таблицу
           for i:= Grid_istochnikiTableView.DataController.RecordCount-1 downto 0 do
           Grid_istochnikiTableView.DataController.DeleteRecord(i);

           SummaEdit.Value := StrToCurr(SummaEdit.text);
            // проверка лининга
            ReadDataSet.Close;
            ReadDataSet.SelectSQL.Clear;
            ReadDataSet.SelectSQL.Text:='select ST_SMLINING from sys_options';
            ReadDataSet.Open;
            if ReadDataSet['ST_SMLINING']<> null then
            SmLining:=ReadDataSet['ST_SMLINING']
            else SmLining:=0;
            ReadDataSet.close;

               // --------------запуск процедуры st_smet------------------------------

              WriteProc.StoredProcName := 'ST_SMET';
              WriteProc.Transaction.StartTransaction;
              WriteProc.Prepare;
              WriteProc.ParamByName('ID_KOD').AsInt64 := id_kod;
              WriteProc.ParamByName('DSUM').AsFloat := SummaEdit.Value;
              WriteProc.ParamByName('SMLINING').AsInteger:= SmLining;
              WriteProc.ParamByName('STDONACH').AsShort := 0;
              WriteProc.ParamByName('BEG_CHECK').AsVariant := Null;
              WriteProc.ParamByName('END_CHECK').AsVariant := Null;
              WriteProc.ParamByName('STDATEUSE').AsVariant := Null;
              WriteProc.ExecProc;
                id_session_smet:= WriteProc.ParamByName('ID_SESSION').AsInt64;
              ST_CUR_SMET_record_count:= WriteProc.ParamByName('TOTAL').AsInteger;
              try
              begin
              WriteProc.Transaction.Commit;
              ReadDataSet.SelectSQL.Clear;
              ReadDataSet.selectsql.text:='select * from ST_CUR_SMET_SELECT('+ IntToStr(id_session_smet)+')';
              ReadDataSet.open;
              ReadDataSet.fetchall;
              // разбивка внесенной суммы по сметам
              for i:=1 to ST_CUR_SMET_record_count do begin
                Grid_istochnikiTableView.DataController.RecordCount := Grid_istochnikiTableView.DataController.RecordCount + 1;

                Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 0] := GetCodeBudjet(ReadDataSet['KOD_SM'],   'PUB_SPR_SMETA_INFO', 'SMETA_KOD', '');
                Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 1] := GetCodeBudjet(ReadDataSet['KOD_RAZD'], 'PUB_SPR_RAZD_ST_INFO', 'RAZD_ST_NUM', '');
                Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 2] := GetCodeBudjet(ReadDataSet['KOD_ST'],   'PUB_SPR_RAZD_ST_INFO', 'RAZD_ST_NUM', '');
                Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 3] := GetCodeBudjet(ReadDataSet['KOD_KEKV'], 'PUB_SPR_KEKV_INFO',    'KEKV_KODE', datetostr(now));
                Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 4] := ReadDataSet['SUMMA'];

                Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 5] := ReadDataSet['KOD_SM'];
                Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 6] := ReadDataSet['KOD_RAZD'];
                Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 7] := ReadDataSet['KOD_ST'];
                Grid_istochnikiTableView.DataController.Values[Grid_istochnikiTableView.DataController.RecordCount - 1, 8] := ReadDataSet['KOD_KEKV'];

               ReadDataSet.next;
              end;
               ReadDataSet.close;
              end
              except
               WriteProc.Transaction.Rollback;
              raise;
            end;


  Grid_istochniki.SetFocus;
  Grid_istochnikiTableView.DataController.FocusedRecordIndex := 0;

  WriteProc.StoredProcName := 'ST_SMET_TMP_CLEAR';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_SESSION').AsInt64 := id_session_smet;
  WriteProc.ExecProc;
  WriteProc.Transaction.Commit;
  WriteProc.Close;

end;

procedure TfrmPfio_AE.SummaEditExit(Sender: TObject);
begin
 SpeedButton1Click(Sender);
end;

end.
