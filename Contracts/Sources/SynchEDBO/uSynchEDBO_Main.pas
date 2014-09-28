unit uSynchEDBO_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  DM_SynchEDBO, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, uSynchEDBO_Facul_AE, Placemnt, Menus, cn_Common_Messages,
  cnConsts_Messages, cn_Common_Types, cxPC, RxMemDS, AppEvnts, AppStruClasses,
  Grids, DBGrids, cn_Common_WaitForm ,uSynchEDBO_Spec_AE, uSynchEDBO_OKR_AE,
  uSynchEDBO_Kurs, uSynchEDBO_Group, cxLabel, ExtCtrls, cxCheckBox,
  AllpeopleUnit;

type
  TfrmSynchEDBO_Main = class(TForm)
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    CnFormStorage: TFormStorage;
    PageControl: TcxPageControl;
    TabSheet_link_facul: TcxTabSheet;
    TabSheet_link_spec: TcxTabSheet;
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    GridDBViewDB_id_facul: TcxGridDBColumn;
    GridDBViewDB_Name_facul: TcxGridDBColumn;
    GridDBViewDB_id_facul_edbo: TcxGridDBColumn;
    GridDBViewDB_name: TcxGridDBColumn;
    MemoryData_EDBO: TRxMemoryData;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn_id_spec: TcxGridDBColumn;
    cxGridDBColumn_name_spec: TcxGridDBColumn;
    cxGridDBColumn_id_spec_edbo: TcxGridDBColumn;
    cxGridDBColumn_name_spec_edbo: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    TabSheet_link_kat_stud: TcxTabSheet;
    cxGrid3: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    GridDBColumn_id_form_stud: TcxGridDBColumn;
    cxGridDBColumn_id_kat_stud: TcxGridDBColumn;
    GridDBColumn_name_form_stud: TcxGridDBColumn;
    cxGridDBColumn_name_kat_stud: TcxGridDBColumn;
    cxGridDBColumn_id_kat_stud_edbo: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    cxGridDBTableView_name_kat_stud_edbo: TcxGridDBColumn;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    cxGridDBTableView_form_stud_edbo: TcxGridDBColumn;
    TabSheet_kurs: TcxTabSheet;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn_id_kurs_edbo: TcxGridDBColumn;
    cxGridDBColumn_name_kurs: TcxGridDBColumn;
    cxGridDBColumnname_kurs_edbo: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTableView_IS_NOT_USE: TcxGridDBColumn;
    GridDBTableView_is_not_use_spec: TcxGridDBColumn;
    GridDBViewDBColumn_is_not_use_facul: TcxGridDBColumn;
    cxGridDBTableView_is_not_use_kurs: TcxGridDBColumn;
    GridDBViewDBColumn_change_name_edbo: TcxGridDBColumn;
    cxGridDBTableView_change_name_edbo_spec: TcxGridDBColumn;
    cxGridDBTableView_change_name_edbo_okr: TcxGridDBColumn;
    cxGridDBTableView_change_name_Edbo: TcxGridDBColumn;
    TabSheet_group: TcxTabSheet;
    cxGrid4: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    GridDBColumn_group_id_group: TcxGridDBColumn;
    GridDBColumn_group_name_group: TcxGridDBColumn;
    GridDBColumn_group_name_group_edbo: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    GridDBTableView_group_name_facul: TcxGridDBColumn;
    GridDBTableView_form_stud: TcxGridDBColumn;
    GridDBTableView_kurs_edbo: TcxGridDBColumn;
    GridDBTableView_kat_stud: TcxGridDBColumn;
    dxBarColorCombo1: TdxBarColorCombo;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxGridDBTableView_kurs_beg: TcxGridDBColumn;
    cxGridDBTableView_term_stud: TcxGridDBColumn;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    dxBarButton4: TdxBarButton;
    dxBarLargeButton3: TdxBarLargeButton;
    cxGridDBTableView3DBColumn1: TcxGridDBColumn;
    cxGridDBTableView3DBColumn2: TcxGridDBColumn;
    dxBarLargeButton4: TdxBarLargeButton;
    cxGridDBTableView1DBColumn_ID_KAT_Stud: TcxGridDBColumn;
    cxGridDBTableView1DBColumn_name_kat_stud_EDBO: TcxGridDBColumn;
    cxGridDBTableView1DBColumn_name_kat_stud: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure GridDBViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormShow(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure cxGridDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView2CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView3CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure DeleteButtonClick(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM:TDM_synch;
    procedure FormIniLanguage;
  public
    res:Variant;
    Is_admin:Boolean;
    constructor  Create(AParameter:TcnSimpleParams);reintroduce;
  end;


implementation

uses uSynchEDBO_Settings, uSynchEDBO_select;

{$R *.dfm}

constructor TfrmSynchEDBO_Main.Create(AParameter:TcnSimpleParams);
begin
  Screen.Cursor := crHourGlass;

  inherited Create(AParameter.Owner);

  DM := TDM_synch.Create(Self);
  DM.DB.Handle:=AParameter.DB_Handle;
  DM.DB.Connected := True;

  FormIniLanguage();
  Is_admin := AParameter.is_admin;

  PageControl.ActivePageIndex := 0;

  Screen.Cursor:=crDefault;

  CnFormStorage.RestoreFormPlacement;
end;

procedure TfrmSynchEDBO_Main.FormIniLanguage;
begin
  PLanguageIndex := cn_Common_Funcs.cnLanguageIndex();
end;

procedure TfrmSynchEDBO_Main.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSynchEDBO_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CnFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild
   then action:=caFree
   else DM.Free;
end;

procedure TfrmSynchEDBO_Main.AddButtonClick(Sender: TObject);
var
  SelectSynchEDBO : TSelectSynchEDBO;
  ViewForm : TfrmSynchEDBO_select;
begin
  if not Is_Admin then
   if CheckPermission('/ROOT/CS/CS_Menu/CS_Menu_Service/CS_Menu_SynchEDBO','Add') <> 0
    then
     begin
      messagebox(handle,
      pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
      +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
      pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  ViewForm := TfrmSynchEDBO_select.Create(self);
  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrOk then
   Begin
    SelectSynchEDBO.SynchEDBO_facul := ViewForm.CheckBox_facul.Checked;
    SelectSynchEDBO.SynchEDBO_spec  := ViewForm.CheckBox_spec.Checked;
    SelectSynchEDBO.SynchEDBO_okr   := ViewForm.CheckBox_okr.Checked;
    SelectSynchEDBO.SynchEDBO_kurs  := ViewForm.CheckBox_kurs.Checked;
    SelectSynchEDBO.SynchEDBO_group := ViewForm.CheckBox_group.Checked;

    cn_Common_Funcs.SynchEDBO(Self, DM.DB.Handle, 1, SelectSynchEDBO);

    refreshButtonClick(Self);
   end;
end;

procedure TfrmSynchEDBO_Main.EditButtonClick(Sender: TObject);
var
  ViewForm_facul  : TfrmSynchEDBO_facul_AE;
  ViewForm_spec   : TfrmSynchEDBO_Spec_AE;
  ViewForm_OKR    : TfrmSynchEDBO_OKR_AE;
  ViewForm_kurs   : TfrmSynchEDBO_kurs;
  ViewForm_group  : TfrmSynchEDBO_Group;
  Row_group       : Integer;
  id_group_locate : Int64;
  id_facul, id_facul_edbo : Int64;
  f_settings      : TFormatSettings;
  KOD_SPEC_edbo : string;
  ID_FORM_STUD_EDBO, ID_KAT_STUD_EDBO : int64;
  ID_KURS_EDBO : Integer;
  durationeducation : string;
begin
  if not Is_Admin then
   if CheckPermission('/ROOT/CS/CS_Menu/CS_Menu_Service/CS_Menu_SynchEDBO','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
      +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
      pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  id_facul := 0;
  f_settings.DecimalSeparator := DecimalSeparator;  

  case PageControl.ActivePageIndex of
   0:begin
      if DM.DataSet_facul.RecordCount = 0 then Exit;

      ViewForm_facul := TfrmSynchEDBO_facul_AE.Create(self);
      ViewForm_facul.DB_handle := DM.DB.Handle;
      ViewForm_facul.TextEdit_facul_edbo.Text := DM.DataSet_facul['Name_facul_edbo'];
      ViewForm_facul.ButtonEdit_facul.Text    := DM.DataSet_facul['NAME_FACUL'];

      if DM.DataSet_facul['ID_FACUL'] <> null
       then ViewForm_facul.id_faculty := DM.DataSet_facul['ID_FACUL'];

      ViewForm_facul.is_admin := Is_admin;
      ViewForm_facul.ShowModal;

      if ViewForm_facul.ModalResult = mrOk then
       begin
        DM.StProc.StoredProcName := 'CN_WEB_SP_FACUL_LINK_EDBO_INS';
        DM.WriteTransaction.StartTransaction;
        DM.StProc.Prepare;
        DM.StProc.ParamByName('id_facul').AsInt64 := ViewForm_facul.id_faculty;
        DM.StProc.ParamByName('id_facul_edbo').AsInt64 := DM.DataSet_FACUL['id_facul_edbo'];
        DM.StProc.ExecProc;
        try
          DM.WriteTransaction.Commit;
         except
          DM.WriteTransaction.Rollback;
          ShowMessage('Возникли ошибки при работе процедуры CN_WEB_SP_FACUL_LINK_EDBO_INS!');
          raise;
        end;

        id_facul_edbo := DM.DataSet_FACUL['id_facul_edbo'];
        RefreshButtonClick(self);

        DM.DataSet_facul.Locate('ID_FACUL;ID_FACUL_EDBO', vararrayof([ViewForm_facul.id_faculty, id_facul_edbo]), []);
       end;
      ViewForm_facul.Free; 
     end;

   //Специальность  
   1:begin
      if DM.DataSet_SPEC.RecordCount = 0 then Exit;

      ViewForm_spec := TfrmSynchEDBO_spec_AE.Create(self);
      ViewForm_spec.DB_handle := DM.DB.Handle;

      if DM.DataSet_SPEC['Name_SPEC_edbo'] <> null
       then ViewForm_spec.TextEdit_facul_edbo.Text := DM.DataSet_SPEC['Name_SPEC_edbo']
       else ViewForm_spec.TextEdit_facul_edbo.Text := '';

      if DM.DataSet_SPEC['Direction_name_edbo'] <> null
       then ViewForm_spec.TextEdit_Direction_Name_EDBO.Text := DM.DataSet_SPEC['Direction_name_edbo']
       else ViewForm_spec.TextEdit_Direction_Name_EDBO.Text := '';

      ViewForm_spec.ButtonEdit_Spec.Text := DM.DataSet_spec['NAME_SPEC'];

      if DM.DataSet_spec['ID_SPEC'] <> null
       then ViewForm_spec.id_spec := DM.DataSet_spec['ID_SPEC'];

      if DM.DataSet_spec['ID_Kat_stud'] <> null
       then ViewForm_spec.id_kat_stud := DM.DataSet_spec['ID_KAT_STUD'];

      if DM.DataSet_spec['NAME_KAT_STUD'] <> null
       then ViewForm_spec.ButtonEdit_kat_stud.Text := DM.DataSet_spec['NAME_KAT_STUD']
       else ViewForm_spec.ButtonEdit_kat_stud.Text := '';

      if DM.DataSet_spec['NAME_KAT_STUD_EDBO'] <> null
       then ViewForm_spec.TextEdit_kat_stud_edbo.Text := DM.DataSet_spec['NAME_KAT_STUD_EDBO']
       else ViewForm_spec.TextEdit_kat_stud_edbo.Text := '';

      ViewForm_spec.is_admin := Is_admin;
      ViewForm_spec.ShowModal;

      if ViewForm_spec.ModalResult = mrOk then
       begin
        DM.StProc.StoredProcName := 'CN_WEB_SP_SPEC_LINK_EDBO_INS';
        DM.WriteTransaction.StartTransaction;
        DM.StProc.Prepare;
        DM.StProc.ParamByName('id_SPEC').AsInt64             := ViewForm_spec.id_spec;
        DM.StProc.ParamByName('KOD_SPEC_edbo').AsString      := DM.DataSet_SPEC['KOD_SPEC_edbo'];
        DM.StProc.ParamByName('CLASIFIER_CODE').AsString     := ViewForm_spec.code;
        DM.StProc.ParamByName('CLASIFIERCODE_EDBO').AsString := DM.DataSet_SPEC['CLASIFIERCODE_EDBO'];
        DM.StProc.ParamByName('ID_KAT_STUD').AsInt64         := ViewForm_spec.id_kat_stud;
        DM.StProc.ExecProc;
        try
          DM.WriteTransaction.Commit;
         except
          DM.WriteTransaction.Rollback;
          ShowMessage('Возникли ошибки при работе процедуры CN_WEB_SP_SPEC_LINK_EDBO_INS!');
          raise;
        end;

        KOD_SPEC_edbo := DM.DataSet_SPEC['KOD_SPEC_edbo'];
        RefreshButtonClick(self);

        DM.DataSet_Spec.Locate('ID_SPEC;KOD_SPEC_edbo', vararrayof([ViewForm_spec.id_spec, KOD_SPEC_edbo]), []);
       end;
       ViewForm_spec.Free;
     end;

   2:begin
      if DM.DataSet_OKR.RecordCount = 0 then Exit;

      ViewForm_OKR := TfrmSynchEDBO_OKR_AE.Create(self);
      ViewForm_OKR.DB_handle := DM.DB.Handle;

      If DM.DataSet_OKR['Name_FORM_STUD_edbo'] <> null
       then ViewForm_OKR.TextEdit_FORM_STUD_edbo.Text := DM.DataSet_OKR['Name_FORM_STUD_edbo']
       else ViewForm_OKR.TextEdit_FORM_STUD_edbo.Text := '';

      If DM.DataSet_OKR['Name_kat_STUD_edbo'] <> null
       then ViewForm_OKR.TextEdit_OKR_edbo.Text := DM.DataSet_OKR['Name_kat_stud_edbo']
       else ViewForm_OKR.TextEdit_OKR_edbo.Text := '';

      ViewForm_OKR.ButtonEdit_form_stud.Text    := DM.DataSet_OKR['NAME_FORM_STUD'];
      ViewForm_OKR.ButtonEdit_kat_stud.Text     := DM.DataSet_OKR['NAME_KAT_STUD'];
      ViewForm_OKR.CurrencyEdit_kurs_beg.Text   := DM.DataSet_OKR['KURS_BEG'];

      if (DM.DataSet_OKR['TERM_STUD'] <> null)
       then ViewForm_OKR.CurrencyEdit_term_stud.value := DM.DataSet_OKR['TERM_STUD'];

      if DM.DataSet_OKR['id_form_stud'] <> null
       then ViewForm_OKR.id_form_stud := DM.DataSet_OKR['id_form_stud'];

      if DM.DataSet_OKR['id_kat_stud'] <> null
       then ViewForm_OKR.id_kat_stud := DM.DataSet_OKR['id_kat_stud'];

      ViewForm_OKR.is_admin := Is_admin;
      ViewForm_OKR.ShowModal;

      if ViewForm_OKR.ModalResult = mrOk then
       begin
        DM.StProc.StoredProcName := 'CN_WEB_SP_OKR_LINK_EDBO_INS';
        DM.WriteTransaction.StartTransaction;
        DM.StProc.Prepare;
        DM.StProc.ParamByName('ID_FORM_STUD').AsInt64          := ViewForm_OKR.id_form_stud;
        DM.StProc.ParamByName('ID_KAT_STUD').AsInt64           := ViewForm_OKR.id_kat_stud;
        DM.StProc.ParamByName('ID_FORM_STUD_edbo').AsInt64     := DM.DataSet_OKR['ID_FORM_STUD_EDBO'];
        DM.StProc.ParamByName('ID_KAT_STUD_edbo').AsInt64      := DM.DataSet_OKR['ID_KAT_STUD_EDBO'];
        DM.StProc.ParamByName('KURS_BEG').AsInt64              := StrToInt(ViewForm_OKR.CurrencyEdit_kurs_beg.text);
        DM.StProc.ParamByName('TERM_STUD').AsFloat             := ViewForm_OKR.CurrencyEdit_term_stud.value;
        DM.StProc.ParamByName('durationeducation').AsVariant   := DM.DataSet_OKR['durationeducation'];
        DM.StProc.ParamByName('IS_SECOND_EDUCATION').Asinteger := DM.DataSet_OKR['IS_SECOND_EDUCATION'];

        DM.StProc.ExecProc;
        try
          DM.WriteTransaction.Commit;
         except
          DM.WriteTransaction.Rollback;
          ShowMessage('Возникли ошибки при работе процедуры CN_WEB_SP_OKR_LINK_EDBO_INS!');
          raise;
        end;

        ID_FORM_STUD_EDBO := DM.DataSet_OKR['ID_FORM_STUD_EDBO'];
        ID_KAT_STUD_EDBO  := DM.DataSet_OKR['ID_KAT_STUD_EDBO'];
        durationeducation := DM.DataSet_OKR['durationeducation'];
        RefreshButtonClick(self);

        DM.DataSet_OKR.Locate('id_form_stud;id_kat_stud;ID_FORM_STUD_EDBO;ID_KAT_STUD_EDBO;durationeducation',
                               vararrayof([ViewForm_OKR.id_form_stud, ViewForm_OKR.id_kat_stud, ID_FORM_STUD_EDBO, ID_KAT_STUD_EDBO, durationeducation]), []);
       end;
       ViewForm_OKR.Free;
     end;

   3:begin
      if DM.DataSet_kurs.RecordCount = 0 then Exit;

      ViewForm_kurs := TfrmSynchEDBO_kurs.Create(self);

      If DM.DataSet_kurs['Name_kurs_edbo'] <> null
       then ViewForm_kurs.TextEdit_kurs_edbo.Text := DM.DataSet_kurs['Name_kurs_edbo']
       else ViewForm_kurs.TextEdit_kurs_edbo.Text := '';

      If DM.DataSet_kurs['Name_kurs'] <> null
       then ViewForm_kurs.TextEdit_kurs.Text := DM.DataSet_kurs['Name_kurs']
       else ViewForm_kurs.TextEdit_kurs.Text := '';

      ViewForm_kurs.ShowModal;

      if ViewForm_kurs.ModalResult = mrOk then
       begin
        DM.StProc.StoredProcName := 'CN_WEB_SP_KURS_LINK_EDBO_INS';
        DM.WriteTransaction.StartTransaction;
        DM.StProc.Prepare;
        DM.StProc.ParamByName('NAME_KURS').AsString   := ViewForm_kurs.TextEdit_kurs.Text;
        DM.StProc.ParamByName('ID_kurs_edbo').AsInt64 := DM.DataSet_kurs['ID_KURS_EDBO'];
        DM.StProc.ExecProc;
        try
          DM.WriteTransaction.Commit;
         except
          DM.WriteTransaction.Rollback;
          ShowMessage('Возникли ошибки при работе процедуры CN_WEB_SP_KURS_LINK_EDBO_INS!');
          raise;
        end;

        ID_KURS_EDBO := DM.DataSet_kurs['ID_KURS_EDBO'];
        RefreshButtonClick(self);

        DM.DataSet_kurs.Locate('NAME_KURS;ID_KURS_EDBO',
                               vararrayof([ViewForm_kurs.TextEdit_kurs.Text, ID_KURS_EDBO]), []);
       end;
       ViewForm_kurs.Free;
     end;

   4:begin
      if DM.DataSet_group.RecordCount = 0 then Exit;

      //группы
      ViewForm_group := TfrmSynchEDBO_Group.Create(self);
      ViewForm_group.is_admin := Is_admin;
      ViewForm_group.DB_Handle := DM.DB.Handle;

      if DM.DataSet_group['id_facul'] <> null
       then ViewForm_group.id_facul := DM.DataSet_group['id_facul']
       else ViewForm_group.id_facul := -1;

      id_facul := ViewForm_group.id_facul; 

      If DM.DataSet_group['Name_group_edbo'] <> null
       then ViewForm_group.TextEdit_name_group_edbo.Text := DM.DataSet_group['Name_group_edbo']
       else ViewForm_group.TextEdit_name_group_edbo.Text := '';

      If DM.DataSet_group['Name_group'] <> null
       then ViewForm_group.ButtonEdit_name_group.Text := DM.DataSet_group['Name_group']
       else ViewForm_group.ButtonEdit_name_group.Text := '';

      id_group_locate := DM.DataSet_group['ID_GROUP_EDBO'];

      ViewForm_group.ShowModal;

      if ViewForm_group.ModalResult = mrOk then
       begin
        DM.StProc.StoredProcName := 'CN_WEB_SP_GROUP_LINK_EDBO_INS';
        DM.WriteTransaction.StartTransaction;
        DM.StProc.Prepare;
        DM.StProc.ParamByName('ID_GROUP').AsInt64      := ViewForm_group.id_group;
        DM.StProc.ParamByName('ID_GROUP_edbo').AsInt64 := DM.DataSet_group['ID_GROUP_EDBO'];
        DM.StProc.ExecProc;
        try
          DM.WriteTransaction.Commit;
         except
          DM.WriteTransaction.Rollback;
          ShowMessage('Возникли ошибки при работе процедуры CN_WEB_SP_GROUP_LINK_EDBO_INS!');
          raise;
        end;

        if ((DM.DataSet_group.RecordCount <> 0) and (PageControl.ActivePageIndex = 4)) then
         Begin
          DM.DataSet_group.Locate('ID_GROUP_EDBO', id_group_locate, []);
          Row_Group := cxGridDBTableView4.DataController.FocusedRowIndex;
          cxGridDBTableView4.ViewData.Records[Row_group].Expand(True);
         End;
       end;
       ViewForm_group.Free;
     end;
  end;
end;

procedure TfrmSynchEDBO_Main.RefreshButtonClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;

  DM.DataSet_facul.Close;
  DM.DataSet_facul.SQLs.SelectSQL.Text := 'select * from CN_WEB_SP_FACUL_LINK_EDBO_SEL order by name_facul_edbo';
  DM.DataSet_facul.Open;
  if DM.DataSet_facul.Locate('id_facul', '', [])
   then TabSheet_link_facul.Caption := 'Факультети * '
   else TabSheet_link_facul.Caption := 'Факультети';

  DM.DataSet_spec.Close;
  DM.DataSet_spec.SQLs.SelectSQL.Text := 'select * from CN_WEB_SP_SPEC_LINK_EDBO_SEL order by name_spec_edbo';
  DM.DataSet_spec.Open;
  if DM.DataSet_spec.Locate('id_spec', '', [])
   then TabSheet_link_spec.Caption := 'Спеціальності * '
   else TabSheet_link_spec.Caption := 'Спеціальності';

  DM.DataSet_OKR.Close;
  DM.DataSet_OKR.SQLs.SelectSQL.Text := 'select * from cn_web_sp_okr_link_edbo_sel order by ID_FORM_STUD_EDBO, id_kat_stud_edbo';
  DM.DataSet_OKR.Open;
  if (DM.DataSet_OKR.Locate('id_form_stud', '', []))
   then TabSheet_link_kat_stud.Caption := 'ОКР * '
   else TabSheet_link_kat_stud.Caption := 'ОКР';

  DM.DataSet_kurs.Close;
  DM.DataSet_kurs.SQLs.SelectSQL.Text := 'select * from CN_WEB_SP_KURS_LINK_EDBO_SEL order by name_kurs_edbo';
  DM.DataSet_kurs.Open;
  if DM.DataSet_kurs.Locate('NAME_KURS', '', [])
   then TabSheet_kurs.Caption := 'Курси * '
   else TabSheet_kurs.Caption := 'Курси';


  DM.DataSet_Read.Close;
  DM.DataSet_Read.SQLs.SelectSQL.Text := 'select * from cn_web_ini';
  DM.DataSet_Read.Open;
  if DM.DataSet_Read['DATE_TIME_LAST_SYNCH_EDBO'] <> null
   then dxBarButton1.Caption := 'Остання сінхронізація : '+DateTimeToStr(DM.DataSet_Read.FieldByName('DATE_TIME_LAST_SYNCH_EDBO').AsDateTime)
   else dxBarButton1.Caption := 'Сінхронізація не виконувалась';

  DM.DataSet_group.Close;
  DM.DataSet_group.SQLs.SelectSQL.Text := 'select * from CN_WEB_SP_GROUP_LINK_EDBO_SEL order by name_facul, name_group_edbo';
  DM.DataSet_group.Open;
  if DM.DataSet_group.Locate('NAME_GROUP', '', [])
   then TabSheet_group.Caption := 'Группы * '
   else TabSheet_group.Caption := 'Группы';

  Screen.Cursor := crDefault;
end;

procedure TfrmSynchEDBO_Main.GridDBViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
Var
  Arect:TRect;
begin
  if (((AViewInfo.GridRecord.Values[1] = '') or (AViewInfo.GridRecord.Values[4] = '1')) and (not AViewInfo.GridRecord.Focused )) then
   begin
    Arect:=AViewInfo.Bounds;
    ACanvas.Canvas.Brush.Color:=$00AEA4DF;
    ACanvas.Canvas.FillRect(Arect);
   end;

  if (((AViewInfo.GridRecord.Values[1] = '') or (AViewInfo.GridRecord.Values[4] = '1')) and (AViewInfo.GridRecord.Focused )) then
   begin
    Arect:=AViewInfo.Bounds;
    ACanvas.Canvas.Brush.Color:=$007968CA;
    ACanvas.Canvas.FillRect(Arect);
   end;

  if ((AViewInfo.GridRecord.Values[5] = '1') and (not AViewInfo.GridRecord.Focused )) then
   begin
    Arect:=AViewInfo.Bounds;
    ACanvas.Canvas.Brush.Color:=$0024FBF5;
    ACanvas.Canvas.FillRect(Arect);
   end;

  if ((AViewInfo.GridRecord.Values[5] = '1') and (AViewInfo.GridRecord.Focused )) then
   begin
    Arect:=AViewInfo.Bounds;
    ACanvas.Canvas.Brush.Color:=$0004DDD8;
    ACanvas.Canvas.FillRect(Arect);
   end;
end;

procedure TfrmSynchEDBO_Main.FormShow(Sender: TObject);
begin
  RefreshButtonClick(self);
end;

procedure TfrmSynchEDBO_Main.GridDBViewDblClick(Sender: TObject);
begin
  EditButtonClick(self);
end;

procedure TfrmSynchEDBO_Main.cxGridDBTableView1DblClick(Sender: TObject);
begin
  EditButtonClick(Self);
end;

procedure TfrmSynchEDBO_Main.PageControlChange(Sender: TObject);
begin
  RefreshButtonClick(self);
end;

procedure TfrmSynchEDBO_Main.cxGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
Var
  Arect:TRect;
begin
  if (((AViewInfo.GridRecord.Values[2] = '') or (AViewInfo.GridRecord.Values[6] = '1') or (AViewInfo.GridRecord.Values[9] = ''))
      and (not AViewInfo.GridRecord.Focused )) then
   begin
    Arect:=AViewInfo.Bounds;
    ACanvas.Canvas.Brush.Color:=$00AEA4DF;
    ACanvas.Canvas.FillRect(Arect);
   end;

  if (((AViewInfo.GridRecord.Values[2] = '')or (AViewInfo.GridRecord.Values[6] = '1') or (AViewInfo.GridRecord.Values[9] = ''))
      and (AViewInfo.GridRecord.Focused )) then
   begin
    Arect:=AViewInfo.Bounds;
    ACanvas.Canvas.Brush.Color:=$007968CA;
    ACanvas.Canvas.FillRect(Arect);
   end;

  if ((AViewInfo.GridRecord.Values[7] = '1') and (not AViewInfo.GridRecord.Focused )) then
   begin
    Arect:=AViewInfo.Bounds;
    ACanvas.Canvas.Brush.Color:=$0024FBF5;
    ACanvas.Canvas.FillRect(Arect);
   end;

  if ((AViewInfo.GridRecord.Values[7] = '1') and (AViewInfo.GridRecord.Focused )) then
   begin
    Arect:=AViewInfo.Bounds;
    ACanvas.Canvas.Brush.Color:=$0004DDD8;
    ACanvas.Canvas.FillRect(Arect);
   end;
end;

procedure TfrmSynchEDBO_Main.cxGridDBTableView2CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
Var
  Arect:TRect;
begin
  if (((AViewInfo.GridRecord.Values[1] = '') or (AViewInfo.GridRecord.Values[3] = '1')) and (not AViewInfo.GridRecord.Focused )) then
   begin
    Arect:=AViewInfo.Bounds;
    ACanvas.Canvas.Brush.Color:=$00AEA4DF;
    ACanvas.Canvas.FillRect(Arect);
   end;

  if (((AViewInfo.GridRecord.Values[1] = '') or (AViewInfo.GridRecord.Values[3] = '1')) and (AViewInfo.GridRecord.Focused )) then
   begin
    Arect:=AViewInfo.Bounds;
    ACanvas.Canvas.Brush.Color:=$007968CA;
    ACanvas.Canvas.FillRect(Arect);
   end;

  if ((AViewInfo.GridRecord.Values[4] = '1') and (not AViewInfo.GridRecord.Focused )) then
   begin
    Arect:=AViewInfo.Bounds;
    ACanvas.Canvas.Brush.Color:=$0024FBF5;
    ACanvas.Canvas.FillRect(Arect);
   end;

  if ((AViewInfo.GridRecord.Values[4] = '1') and (AViewInfo.GridRecord.Focused )) then
   begin
    Arect:=AViewInfo.Bounds;
    ACanvas.Canvas.Brush.Color:=$0004DDD8;
    ACanvas.Canvas.FillRect(Arect);
   end; 
end;

procedure TfrmSynchEDBO_Main.cxGridDBTableView3CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
Var
  Arect:TRect;
begin
  if (((AViewInfo.GridRecord.Values[0] = '') or
       (AViewInfo.GridRecord.Values[1] = '0') or
       (AViewInfo.GridRecord.Values[4] = '') or
       (AViewInfo.GridRecord.Values[5] = '') or
       (AViewInfo.GridRecord.Values[9] = '1'))
      and (not AViewInfo.GridRecord.Focused )) then
   begin
    Arect:=AViewInfo.Bounds;
    ACanvas.Canvas.Brush.Color:=$00AEA4DF;
    ACanvas.Canvas.FillRect(Arect);
   end;

  if (((AViewInfo.GridRecord.Values[0] = '') or
       (AViewInfo.GridRecord.Values[1] = '0') or
       (AViewInfo.GridRecord.Values[4] = '') or
       (AViewInfo.GridRecord.Values[5] = '') or
       (AViewInfo.GridRecord.Values[9] = '1'))
      and (AViewInfo.GridRecord.Focused )) then
   begin
    Arect:=AViewInfo.Bounds;
    ACanvas.Canvas.Brush.Color:=$007968CA;
    ACanvas.Canvas.FillRect(Arect);
   end;

  if ((AViewInfo.GridRecord.Values[10] = '1') and
      (not AViewInfo.GridRecord.Focused )) then
   begin
    Arect:=AViewInfo.Bounds;
    ACanvas.Canvas.Brush.Color:=$0024FBF5;
    ACanvas.Canvas.FillRect(Arect);
   end;

  if ((AViewInfo.GridRecord.Values[10] = '1') and (AViewInfo.GridRecord.Focused )) then
   begin
    Arect:=AViewInfo.Bounds;
    ACanvas.Canvas.Brush.Color:=$0004DDD8;
    ACanvas.Canvas.FillRect(Arect);
   end;  
end;

procedure TfrmSynchEDBO_Main.DeleteButtonClick(Sender: TObject);
var
  i : Byte;
  Row_group : Integer;
begin
  if not Is_Admin then
   if CheckPermission('/ROOT/CS/CS_Menu/CS_Menu_Service/CS_Menu_SynchEDBO','Del') <> 0
    then
     begin
      messagebox(handle,
      pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
      +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
      pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  case PageControl.ActivePageIndex of
   0 : Begin
        if DM.DataSet_FACUL.RecordCount = 0 then exit;

        i := cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
        if ((i = 7) or (i= 2)) then exit;

        DM.StProc.StoredProcName := 'CN_WEB_SP_FACUL_LINK_EDBO_DEL';
        DM.WriteTransaction.StartTransaction;
        DM.StProc.Prepare;
        DM.StProc.ParamByName('ID_FACUL_EDBO').AsInt64 := DM.DataSet_FACUL['ID_FACUL_EDBO'];
        DM.StProc.ExecProc;

        try
         Dm.WriteTransaction.Commit;
        except
         DM.WriteTransaction.Rollback;
         ShowMessage('Возникли ошибки при работе процедуры CN_WEB_SP_FACUL_LINK_EDBO_DEL!');
         raise;
        End;
       end;
   1 : Begin
        if DM.DataSet_SPEC.RecordCount = 0 then exit;

        i := cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
        if ((i = 7) or (i= 2)) then exit;

        DM.StProc.StoredProcName := 'CN_WEB_SP_SPEC_LINK_EDBO_DEL';
        DM.WriteTransaction.StartTransaction;
        DM.StProc.Prepare;
        DM.StProc.ParamByName('KOD_SPEC_EDBO').AsString := DM.DataSet_SPEC['KOD_SPEC_EDBO'];
        DM.StProc.ExecProc;

        try
         Dm.WriteTransaction.Commit;
        except
         DM.WriteTransaction.Rollback;
         ShowMessage('Возникли ошибки при работе процедуры CN_WEB_SP_SPEC_LINK_EDBO_DEL!');
         raise;
        End;
       end;
   2 : Begin
        if DM.DataSet_OKR.RecordCount = 0 then exit;

        i := cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
        if ((i = 7) or (i= 2)) then exit;

        DM.StProc.StoredProcName := 'CN_WEB_SP_OKR_LINK_EDBO_DEL';
        DM.WriteTransaction.StartTransaction;
        DM.StProc.Prepare;
        DM.StProc.ParamByName('ID_FORM_STUD_EDBO').AsInt64 := DM.DataSet_OKR['ID_FORM_STUD_EDBO'];
        DM.StProc.ParamByName('ID_KAT_STUD_EDBO').AsInt64 := DM.DataSet_OKR['ID_KAT_STUD_EDBO'];

        DM.StProc.ExecProc;

        try
         Dm.WriteTransaction.Commit;
        except
         DM.WriteTransaction.Rollback;
         ShowMessage('Возникли ошибки при работе процедуры CN_WEB_SP_OKR_LINK_EDBO_DEL!');
         raise;
        End;
       end;
   3 : Begin
        //курсы
        if DM.DataSet_kurs.RecordCount = 0 then exit;

        i := cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
        if ((i = 7) or (i= 2)) then exit;

        DM.StProc.StoredProcName := 'CN_WEB_SP_KURS_LINK_EDBO_DEL';
        DM.WriteTransaction.StartTransaction;
        DM.StProc.Prepare;
        DM.StProc.ParamByName('ID_KURS_EDBO').AsInt64 := DM.DataSet_kurs['ID_KURS_EDBO'];
        DM.StProc.ExecProc;

        try
         Dm.WriteTransaction.Commit;
        except
         DM.WriteTransaction.Rollback;
         ShowMessage('Возникли ошибки при работе процедуры CN_WEB_SP_KURS_LINK_EDBO_DEL!');
         raise;
        End;
       end;

   4 : Begin
        //группы
        if DM.DataSet_group.RecordCount = 0 then exit;

        i := cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
        if ((i = 7) or (i= 2)) then exit;

        DM.StProc.StoredProcName := 'CN_WEB_SP_GROUP_LINK_EDBO_DEL';
        DM.WriteTransaction.StartTransaction;
        DM.StProc.Prepare;
        DM.StProc.ParamByName('ID_GROUP_EDBO').AsInt64 := DM.DataSet_group['ID_GROUP_EDBO'];
        DM.StProc.ExecProc;

        try
         Dm.WriteTransaction.Commit;
        except
         DM.WriteTransaction.Rollback;
         ShowMessage('Возникли ошибки при работе процедуры CN_WEB_SP_GROUP_LINK_EDBO_DEL!');
         raise;
        End;
       end;
  end;

  Row_Group := cxGridDBTableView4.DataController.FocusedRowIndex;

  RefreshButtonClick(self);

  cxGridDBTableView4.ViewData.Records[Row_group - 1].Expand(True);
end;

procedure TfrmSynchEDBO_Main.dxBarLargeButton3Click(Sender: TObject);
var
   ViewForm : TfrmSynchEDBO_Settings;
begin
   ViewForm := TfrmSynchEDBO_Settings.Create(self, DM.DB.Handle);
   ViewForm.ShowModal;
   ViewForm.Free;
end;

end.
