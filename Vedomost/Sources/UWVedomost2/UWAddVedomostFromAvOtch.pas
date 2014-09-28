unit UWAddVedomostFromAvOtch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, cxButtons,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, cxGridTableView, cxGridCustomTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, cxCheckBox, cxTextEdit, cxContainer, cxMaskEdit, cxDropDownEdit,
  cxCalendar, StdCtrls, Buttons, ExtCtrls, cxLabel, cxSplitter,UWAddOtch,UWSelectCardMen,
  ImgList, Un_Progress_form;

type
  TAddVedomostFromAvOtch = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtnFilter: TBitBtn;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    RadioButtonFIO: TRadioButton;
    RadioButtonNumOtch: TRadioButton;
    cxDateBegEdit: TcxDateEdit;
    cxDateEndEdit: TcxDateEdit;
    cxTextEditFilter: TcxTextEdit;
    cxGridAllOtchetDBTableView1: TcxGridDBTableView;
    cxGridAllOtchetLevel1: TcxGridLevel;
    cxGridAllOtchet: TcxGrid;
    cxGridAllOtchetDBTableView1DB_NUM_DOC: TcxGridDBColumn;
    cxGridAllOtchetDBTableView1DB_R_DATE_AO: TcxGridDBColumn;
    cxGridAllOtchetDBTableView1DB_R_FIO: TcxGridDBColumn;
    cxGridAllOtchetDBTableView1DB_R_SUM_AO: TcxGridDBColumn;
    StyleRepository: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    DSetAll: TpFIBDataSet;
    DSetVibr: TpFIBDataSet;
    Database: TpFIBDatabase;
    TransRead: TpFIBTransaction;
    TransWrite: TpFIBTransaction;
    pFIBStoredProc: TpFIBStoredProc;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    DSourceAll: TDataSource;
    DSourceVibr: TDataSource;
    CheckBox_Is_Skrit: TCheckBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxGridAllOtchetDBTableView1DB_IS_VIBRALI: TcxGridDBColumn;
    DataSet: TpFIBDataSet;
    Panel7: TPanel;
    Panel5: TPanel;
    BitBtnAdd: TBitBtn;
    BitBtnDel: TBitBtn;
    Panel4: TPanel;
    cxGridVibrOtchet: TcxGrid;
    cxGridVibrOtchetDBTableView1: TcxGridDBTableView;
    cxGridVibrOtchetDBTableView1DB_num_doc: TcxGridDBColumn;
    cxGridVibrOtchetDBTableView1DB_date_ao: TcxGridDBColumn;
    cxGridVibrOtchetDBTableView1DB_fio: TcxGridDBColumn;
    cxGridVibrOtchetDBTableView1DB_sum_ao: TcxGridDBColumn;
    cxGridVibrOtchetLevel1: TcxGridLevel;
    cxSplitter2: TcxSplitter;
    cxGridVibrOtchetDBTableView1DB_NUM_DOG: TcxGridDBColumn;
    cxGridVibrOtchetDBTableView1DB_DATE_DOG: TcxGridDBColumn;
    DSet: TpFIBDataSet;
    ImageList: TImageList;
    Image1: TImage;
    Image2: TImage;
    cxGridAllOtchetDBTableView1DB_NAME_TYPE_DOC: TcxGridDBColumn;
    CheckBox_SKRIT_VED_R_REG: TCheckBox;
    cxGridAllOtchetDBTableView1DB_IS_IN_VED_RUCH_REGIM: TcxGridDBColumn;
    procedure cxButton2Click(Sender: TObject);
    procedure BitBtnFilterClick(Sender: TObject);
    procedure cxTextEditFilterKeyPress(Sender: TObject; var Key: Char);
    procedure cxCheckBoxFilterClick(Sender: TObject);
    procedure BitBtnAddClick(Sender: TObject);
    procedure BitBtnDelClick(Sender: TObject);
    procedure cxGridAllOtchetDBTableView1DblClick(Sender: TObject);
    procedure cxGridVibrOtchetDBTableView1DblClick(Sender: TObject);
    procedure cxGridAllOtchetDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxButton1Click(Sender: TObject);
    procedure cxGridAllOtchetDBTableView1DB_IS_VIBRALICustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    { Private declarations }
  public
    SearchText  : string;
    key_session : Int64;
    id_user     : Integer;
    id_system : Integer;
    id_type_viplat : Int64;
    id_bank_dogovor : Int64;
    id_real_bank_dogovor : Int64;
  end;

var
  AddVedomostFromAvOtch: TAddVedomostFromAvOtch;

implementation

{$R *.dfm}

procedure TAddVedomostFromAvOtch.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TAddVedomostFromAvOtch.BitBtnFilterClick(Sender: TObject);
var
  T : TfmUn_Progress_form;
begin
  T := TfmUn_Progress_form.Create(self, wait_, 'Зачекайте, йде відбір даних...');
  T.Show;
  T.Update;
  DSetAll.Close;
  DSetAll.SelectSQL.Text := 'select * from UW_SEL_AV_OTCH_FOR_ADD_VEDOM(:DATE_BEG,:DATE_END,:FLAG_SKRIT_VIBRANNOE,:ID_SYSTEM,:key,:FLAG_FIO,:FIO_VAL,:FLAG_NUM_OTCH,:NUM_OTCH_VAL, :FLAG_SKRIT_VED_R_REG)';
  DSetAll.ParamByName('DATE_BEG').Value          := cxDateBegEdit.Date;
  DSetAll.ParamByName('DATE_END').Value          := cxDateEndEdit.Date;
  DSetAll.ParamByName('ID_SYSTEM').Value         := ID_SYSTEM;
  DSetAll.ParamByName('key').AsInt64             := key_session;

  if (CheckBox_Is_Skrit.Checked = True) then
    DSetAll.ParamByName('FLAG_SKRIT_VIBRANNOE').Value := 1
  else
    DSetAll.ParamByName('FLAG_SKRIT_VIBRANNOE').Value := 0;

  if (CheckBox_SKRIT_VED_R_REG.Checked = True) then
    DSetAll.ParamByName('FLAG_SKRIT_VED_R_REG').Value := 1
  else
    DSetAll.ParamByName('FLAG_SKRIT_VED_R_REG').Value := 0;

  if ((RadioButtonFIO.Checked = True) and (cxTextEditFilter.Text <> '')) then
    begin
      DSetAll.ParamByName('FLAG_FIO').asInteger := 1;
      DSetAll.ParamByName('FIO_VAL').AsString   := cxTextEditFilter.Text;
    end
  else
    begin
      DSetAll.ParamByName('FLAG_FIO').asInteger      := 0;
      DSetAll.ParamByName('FIO_VAL').AsString        := '';
    end;

  if ((RadioButtonNumOtch.Checked = True) and (cxTextEditFilter.Text <> '')) then
    begin
      DSetAll.ParamByName('FLAG_NUM_OTCH').asInteger := 1;
      DSetAll.ParamByName('NUM_OTCH_VAL').AsString   := cxTextEditFilter.Text;
    end
  else
    begin
      DSetAll.ParamByName('FLAG_NUM_OTCH').asInteger      := 0;
      DSetAll.ParamByName('NUM_OTCH_VAL').AsString        := '';
    end;

  DSetAll.Open;

  DSetVibr.Close;
  DSetVibr.SelectSQL.Text := 'select * from UW_ADD_VEDOMOST_TMP_SEL(2) where KEY_SESSION = :KEY';
  DSetVibr.ParamByName('KEY').asInteger := key_session;
  DSetVibr.Open;

  cxGridAllOtchetDBTableView1.DataController.DataSource := DSourceAll;
  cxGridVibrOtchetDBTableView1.DataController.DataSource := DSourceVibr;
  T.Free;
end;

procedure TAddVedomostFromAvOtch.cxTextEditFilterKeyPress(Sender: TObject;
  var Key: Char);
begin
 { with cxGridAllOtchetDBTableView1.DataController.Filter.Root do
  begin
    Clear;
    SearchText:='%'+StringReplace(AnsiUpperCase(cxTextEditFilter.Text),' ','%',[rfReplaceAll])+'%';
    if (cxTextEditFilter.Text <> '') and (cxTextEditFilter.Enabled = true) then
    begin
      if(RadioButtonFIO.Checked = true)then
        AddItem(cxGridAllOtchetDBTableView1DB_R_FIO, foLike, SearchText, cxTextEditFilter.Text);
      if(RadioButtonNumOtch.Checked = true)then
        AddItem(cxGridAllOtchetDBTableView1DB_NUM_DOC, foLike, SearchText, cxTextEditFilter.Text)
    end;
    cxGridAllOtchetDBTableView1.DataController.Filter.Active:=true;
    cxGridAllOtchetDBTableView1.DataController.FocusedRowIndex:=0;
  end;  }
end;

procedure TAddVedomostFromAvOtch.cxCheckBoxFilterClick(Sender: TObject);
begin
 { RadioButtonFIO.Enabled     := cxCheckBoxFilter.Checked;
  RadioButtonNumOtch.Enabled := cxCheckBoxFilter.Checked;
  cxTextEditFilter.Enabled   := cxCheckBoxFilter.Checked; }
end;

procedure TAddVedomostFromAvOtch.BitBtnAddClick(Sender: TObject);
var
  id_add_vedomost_tmp : Integer;
  viewform            : TFormAddOtch;
  id_ao               : Int64;
  ViewFormCard        : TfmSelectCardMen;
  i                   : Integer;
  id_active_bank_card : Int64;
  id_dt_doc           : Int64;
begin
  if (DSetAll.IsEmpty = False) and (DSetAll['IS_VIBRALI'] = 0) then
  begin
    id_ao                            := DSetAll['id_ao'];
    id_dt_doc                        := StrToInt64(DSetAll.fieldbyname('r_id_dt_doc').AsString);
    viewform                         := TFormAddOtch.Create(Self);
    viewform.cxDateDogEdit.Date      := Now;
    viewform.EditNumDog.Text         := '';
    viewform.Database                := Database;
    viewform.Trans.DefaultDatabase   := Database;
    viewform.id_type_viplat          := id_type_viplat;
    viewform.LabelPIB.Caption        := DSetAll['R_FIO'];
    viewform.LabelTypeDoc.Caption    := DSetAll['NAME_TYPE_DOC'];
    viewform.LabelSummaDoc.Caption   := DSetAll['R_SUM_AO'];
    viewform.LabelNumDateDoc.Caption := '№'+DSetAll['NUM_DOC']+' від '+ DateToStr(DSetAll['R_DATE_AO']);
    //------------тип выплат------------
    dset.Database    := Database;
    DSet.Transaction := TransRead;
    DSet.Close;
    DSet.SelectSQL.Text := 'select * from UW_SP_TYPE_VED_FOR_INS_VED_SEL where ID_TYPE_VEDOMOST = 2';
    DSet.Open;
    id_type_viplat := StrToInt64(DSet.fbn('id_type_viplat').AsString);
    viewform.cxButtonEditTypeViplat.Text := DSet['NAME_TYPE_VIPLAT'];
    //------------банковская карточка------------
    id_bank_dogovor := 0;
    id_real_bank_dogovor := 0;

    ViewFormCard := TfmSelectCardMen.Create(Self);
    ViewFormCard.Database := Database;
    ViewFormCard.Trans.DefaultDatabase := Database;
    ViewFormCard.DSetCardMen.Database := Database;
    ViewFormCard.DSetCardMen.Transaction := ViewFormCard.Trans;
    ViewFormCard.DSetActiveCard.Database := Database;
    ViewFormCard.DSetActiveCard.Transaction := ViewFormCard.Trans;
    ViewFormCard.DSetCardMen.Close;
    ViewFormCard.DSetCardMen.SelectSQL.Text := 'select * from PEOPLE_DOG_BANKCARD_SELECT(:id_man,:date,0)';
    ViewFormCard.DSetCardMen.ParamByName('id_man').AsInt64 := StrToInt64(DSetAll.fieldbyname('R_ID_MAN').AsString);
    ViewFormCard.DSetCardMen.ParamByName('date').asdate := Now;
    ViewFormCard.DSetCardMen.Open;
    //отбор активной карточки контрагента
    ViewFormCard.DSetActiveCard.Close;
    ViewFormCard.DSetActiveCard.SelectSQL.Text := 'Select * from z_get_bankcard_by_id_man(:id_man)';
    ViewFormCard.DSetActiveCard.ParamByName('id_man').AsInt64 := StrToInt64(DSetAll.fieldbyname('R_ID_MAN').AsString);
    ViewFormCard.DSetActiveCard.Open;
    id_active_bank_card := ViewFormCard.DSetActiveCard['ID_DOG_BANKCARD'];
    ViewFormCard.DSetCardMen.Locate('ID_DOG_BANKCARD',IntToStr(id_active_bank_card),[]);
    ViewFormCard.cxGrid1DBTableView1.ViewData.Expand(true);
    if (ViewFormCard.DSetCardMen.RecordCount = 0)then
    begin
      ShowMessage('У контрагента нeмає банківської картки. Операція не зроблена.');
      Exit;
    end;

    if (ViewFormCard.DSetCardMen.RecordCount = 1)then
    begin
      id_bank_dogovor := StrToInt64(ViewFormCard.DSetCardMen.fbn('ID_DOG_BANKCARD').AsString);
      id_real_bank_dogovor := StrToInt64(ViewFormCard.DSetCardMen.fbn('ID_TYPE_PAYMENT').AsString);
      //--поиск по банковской карточке название банка и СКД
      if (id_bank_dogovor <> 0) then
      begin
        DSet.Close;
        DSet.SelectSQL.Text := 'select * from UW_SELECT_INFO_CARD_MAN(:id_man,:id_bank_dogovor,:id_real_bank_dogovor)';
        DSet.ParamByName('id_bank_dogovor').AsInt64 := id_bank_dogovor;
        DSet.ParamByName('id_real_bank_dogovor').AsInt64 := id_real_bank_dogovor;
        DSet.ParamByName('id_man').AsInt64 := StrToInt64(DSetAll.fieldbyname('R_ID_MAN').AsString);
        DSet.Open;
        viewform.LabelCard.Caption := DSet['SHORT_NAME_TYPE_PAYMENT']+' СКД '+ DSet['NUM_LIC_ACCAUNT'];
      end;
    end
    else
    begin
      ViewFormCard.LabelPIB.Caption := DSetAll['R_FIO'];


      ViewFormCard.ShowModal;
      if (ViewFormCard.ModalResult = mrok) then
      begin
        id_bank_dogovor := StrToInt64(ViewFormCard.DSetCardMen.fbn('ID_DOG_BANKCARD').AsString);
        id_real_bank_dogovor := StrToInt64(ViewFormCard.DSetCardMen.fbn('ID_TYPE_PAYMENT').AsString);

        //--поиск по банковской карточке название банка и СКД
        if (id_bank_dogovor <> 0) then
        begin
          DSet.Close;
          DSet.SelectSQL.Text := 'select * from UW_SELECT_INFO_CARD_MAN(:id_man,:id_bank_dogovor,:id_real_bank_dogovor)';
          DSet.ParamByName('id_bank_dogovor').AsInt64 := id_bank_dogovor;
          DSet.ParamByName('id_real_bank_dogovor').AsInt64 := id_real_bank_dogovor;
          DSet.ParamByName('id_man').AsInt64 := StrToInt64(DSetAll.fieldbyname('R_ID_MAN').AsString);
          DSet.Open;
          viewform.LabelCard.Caption := DSet['SHORT_NAME_TYPE_PAYMENT']+' СКД '+ DSet['NUM_LIC_ACCAUNT'];
        end;

      end;
    end;

    if (id_bank_dogovor = 0)then
    begin
      ShowMessage('У контрагента не була обрана картка');
      Exit;
    end;

    //-------------показ формы с отбором проводок------------------------------
    viewform.DSetBudget.Database            := Database;
    viewform.DSetBudget.Transaction         := TransRead;
    viewform.DSetBudget.Close;
    viewform.DSetBudget.SQLs.SelectSQL.Text := 'Select * from J4_SELECT_ALL_PROV(:ID_DT_DOC)';
    viewform.DSetBudget.ParamByName('ID_DT_DOC').AsInt64 := StrToInt64(DSetAll.fieldbyname('r_id_dt_doc').AsString);
    viewform.DSetBudget.open;
      //отобразим их в гриде
    viewform.SelectAll;

    viewform.ShowModal;

    //---------------------вставка в темповую таблицу---------------------------
    if (viewform.ModalResult = mrok)then
    begin
      TransWrite.StartTransaction;
      pFIBStoredProc.StoredProcName := 'UW_ADD_VEDOMOST_TMP_INS';
      pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64 := key_session;
      pFIBStoredProc.ParamByName('id_ao').AsInt64 := DSetAll['id_ao'];
      pFIBStoredProc.ParamByName('ID_DT_DOC').AsInt64 := StrToInt64(DSetAll.fieldbyname('r_id_dt_doc').AsString);
      pFIBStoredProc.ParamByName('ID_MAN').AsInt64 := StrToInt64(DSetAll.fieldbyname('r_id_man').AsString);

      if (viewform.cxDateDogEdit.Text = '') then
         pFIBStoredProc.ParamByName('DATE_DOG').Value := null
      else

      pFIBStoredProc.ParamByName('DATE_DOG').Value := viewform.cxDateDogEdit.Date;
      pFIBStoredProc.ParamByName('NUM_DOG').Value := viewform.EditNumDog.Text;
      pFIBStoredProc.ParamByName('ID_TYPE_VIPLAT').AsInt64 := id_type_viplat;
      pFIBStoredProc.ParamByName('id_bank_dogovor').AsInt64 := id_bank_dogovor;
      pFIBStoredProc.ParamByName('id_real_bank_dogovor').AsInt64 := id_real_bank_dogovor;
      pFIBStoredProc.ExecProc;

      id_add_vedomost_tmp := pFIBStoredProc.ParamByName('id_add_vedomost_tmp_').AsInt64;
      //вставка бюджетов
      for i :=0 to viewform.cxGridBudgetiTableView1.DataController.RecordCount - 1 do
      begin
        pFIBStoredProc.StoredProcName := 'UW_ADD_VEDOMOST_BUDGET_TMP_INS';
        pFIBStoredProc.ParamByName('ID_DT_DOC').AsInt64   := StrToInt64(DSetAll.fieldbyname('r_id_dt_doc').AsString);
        pFIBStoredProc.ParamByName('key_session').AsInt64 := key_session;
        pFIBStoredProc.ParamByName('id_sm').AsInt64       := viewform.cxGridBudgetiTableView1_id_sm.DataBinding.DataController.Values[i, 4];
        pFIBStoredProc.ParamByName('id_razd').AsInt64     := viewform.cxGridBudgetiTableView1_id_razd.DataBinding.DataController.Values[i, 5];
        pFIBStoredProc.ParamByName('id_st').AsInt64       := viewform.cxGridBudgetiTableView1_id_st.DataBinding.DataController.Values[i, 6];
        pFIBStoredProc.ParamByName('id_kekv').AsInt64     := viewform.cxGridBudgetiTableView1_ID_KEKV.DataBinding.DataController.Values[i, 7];
        pFIBStoredProc.ParamByName('summa').value         := viewform.cxGridBudgetiTableView1_SUMMA.DataBinding.DataController.Values[i, 2];
        pFIBStoredProc.ParamByName('id_ao').AsInt64       := StrToInt64(DSetAll.fieldbyname('id_ao').AsString);
        pFIBStoredProc.ParamByName('ID_ALL_PROV').AsInt64 := viewform.cxGridBudgetiTableView1_ID_ALL_PROV.DataBinding.DataController.Values[i, 3];
        pFIBStoredProc.ExecProc;
      end;
      TransWrite.Commit;

      BitBtnFilter.Click;
      DSetAll.Locate('id_dt_doc',IntToStr(id_dt_doc),[]);
      DSetVibr.Locate('id_add_vedomost_tmp',IntToStr(id_add_vedomost_tmp),[]);
      cxGridAllOtchetDBTableView1.DataController.DataSource := DSourceAll;
      cxGridVibrOtchetDBTableView1.DataController.DataSource := DSourceVibr;
    end;
  end;
end;

procedure TAddVedomostFromAvOtch.BitBtnDelClick(Sender: TObject);
var
  id_ao : Int64;
begin
  if (DSetVibr.IsEmpty = False) then
  begin
    id_ao := DSetVibr['ID_AO'];
    TransWrite.StartTransaction;
    pFIBStoredProc.StoredProcName                             := 'UW_ADD_VEDOMOST_TMP_DEL';
    pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64         := key_session;
    pFIBStoredProc.ParamByName('ID_DT_DOC').AsInt64           := StrToInt64(DSetVibr.fbn('ID_DT_DOC').asstring);
    pFIBStoredProc.ExecProc;
    TransWrite.Commit;
    BitBtnFilter.Click;
    DSetAll.Locate('ID_AO',IntToStr(id_ao),[]);
  end;    
end;

procedure TAddVedomostFromAvOtch.cxGridAllOtchetDBTableView1DblClick(
  Sender: TObject);
begin
  BitBtnAdd.Click;
end;

procedure TAddVedomostFromAvOtch.cxGridVibrOtchetDBTableView1DblClick(
  Sender: TObject);
begin
  BitBtnDel.Click;
end;

procedure TAddVedomostFromAvOtch.cxGridAllOtchetDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect:TRect;
begin
  if cxGridAllOtchetDBTableView1.DataController.RecordCount = 0 then exit;

  if ((AViewInfo.GridRecord.Values[0]= 1) and  (AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=clSilver;
      ACanvas.Canvas.FillRect(Arect);
   end;

   if ((AViewInfo.GridRecord.Values[0]= 1) and  (not AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00D4D4D4;
      ACanvas.Canvas.FillRect(Arect);
   end;

   if ((AViewInfo.GridRecord.Values[0]= 2) and  (AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00808040;
      ACanvas.Canvas.FillRect(Arect);
   end;

   if ((AViewInfo.GridRecord.Values[0]= 2) and  (not AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00ADAD5A;
      ACanvas.Canvas.FillRect(Arect);
   end;
end;

procedure TAddVedomostFromAvOtch.cxButton1Click(Sender: TObject);
begin
  Modalresult := mrok;
end;

procedure TAddVedomostFromAvOtch.cxGridAllOtchetDBTableView1DB_IS_VIBRALICustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ACanvas.FillRect(AViewInfo.Bounds);
  ImageList.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left+1, AViewInfo.Bounds.Top, AViewInfo.GridRecord.Values[cxGridAllOtchetDBTableView1DB_IS_VIBRALI.Index]);
  ADone := True;
end;

end.
