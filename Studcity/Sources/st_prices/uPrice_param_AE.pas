unit uPrice_param_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, ImgList,
  StdCtrls, cxButtons, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxGroupBox, cxCurrencyEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxContainer, cxLabel, St_Loader_Unit, iBase, uPrices_DM, cxCheckBox,
  st_ConstUnit, st_common_funcs;

type
  Tfrmprice_param_AE = class(TForm)
    Label_builds: TcxLabel;
    ButtonEdit_Builds: TcxButtonEdit;
    cxLabel1: TcxLabel;
    ButtonEdit_type_room: TcxButtonEdit;
    cxLabel2: TcxLabel;
    ButtonEdit_category_class: TcxButtonEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    CurrencyEdit_living: TcxCurrencyEdit;
    CurrencyEdit_all_living: TcxCurrencyEdit;
    CurrencyEdit_square_room: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DB_name_services: TcxGridDBColumn;
    cxGrid1DB_tariff: TcxGridDBColumn;
    cxGrid1DB_NORMA_INDICATOR: TcxGridDBColumn;
    cxGrid1DB_Summa: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Button_cancel: TcxButton;
    Button_ok: TcxButton;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageListOfCategory: TImageList;
    PopupImageList: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    Cash_Style: TcxStyle;
    Button_add_services: TcxButton;
    Button_edit_services: TcxButton;
    Button_del_services: TcxButton;
    cxLabel6: TcxLabel;
    CurrencyEdit_living_space: TcxCurrencyEdit;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxLabel7: TcxLabel;
    CurrencyEdit_kod_kat: TcxCurrencyEdit;
    cxLabel8: TcxLabel;
    TextEdit_name_kat: TcxTextEdit;
    cxLabel9: TcxLabel;
    TextEdit_short_name: TcxTextEdit;
    CheckBox_all_month: TcxCheckBox;
    cxLabel10: TcxLabel;
    ButtonEdit_type_stud: TcxButtonEdit;
    Grid1DBTableView_name_type_norma: TcxGridDBColumn;
    procedure ButtonEdit_BuildsPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Button_cancelClick(Sender: TObject);
    procedure ButtonEdit_type_roomPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Button_add_servicesClick(Sender: TObject);
    procedure Button_del_servicesClick(Sender: TObject);
    procedure Button_edit_servicesClick(Sender: TObject);
    procedure recalc_norm;
    procedure Button_okClick(Sender: TObject);
    procedure CurrencyEdit_kod_katExit(Sender: TObject);
    procedure ButtonEdit_type_studPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
  private
    PLanguageIndex : byte;
    tarif, norma, HeadCount : Double;
  public
    Id_Builds    : Int64;
    id_type_room : Int64;
    id_type_stud : Int64;
    id_category  : Int64;
    id_price     : Int64;
    DM           : Tfrm_price_DM;
    is_add       : Boolean;
    id_kat_pay   : Int64;
    effective_area, S_room : Double;
    kol_live : Integer;
    constructor create(aOwner : TComponent; aHandle : TISC_DB_HANDLE); reintroduce;
  end;

var
  frmprice_param_AE: Tfrmprice_param_AE;

implementation

uses uGetParam, uPrices_services_AE, FIBDataSet, cxDropDownEdit;

{$R *.dfm}

procedure Tfrmprice_param_AE.ButtonEdit_BuildsPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  ViewForm : TfrmGetFacult;
begin
  ViewForm := TfrmGetFacult.Create(Self, DM.DB.Handle, 3, -1);
  ViewForm.ShowModal;
  if ViewForm.ModalResult = mrOk then
   Begin
    Id_Builds := ViewForm.id_;
    ButtonEdit_Builds.Text := ViewForm.Name;

    DM.DataSet_read.close;
    DM.DataSet_read.SQLs.SelectSQL.Text := 'select * from st_sp_effective_area a where id_build = :id_build and current_date between a.date_beg and a.date_end';
    DM.DataSet_read.ParamByName('ID_BUILD').AsInt64 := Id_Builds;
    DM.DataSet_read.Open;

    if DM.DataSet_read['KOEF'] <> null
     then CurrencyEdit_living_space.EditValue := DM.DataSet_read['KOEF']
     else CurrencyEdit_living_space.EditValue := 0;

    effective_area := CurrencyEdit_living_space.EditValue;

    DM.DataSet_read.Close;

    recalc_norm;
   end;
  ViewForm.Free; 
end;

constructor Tfrmprice_param_AE.create(aOwner: TComponent;
  aHandle: TISC_DB_HANDLE);
begin
  inherited Create(aOwner);

  DM := Tfrm_price_DM.Create(self);
  DM.DB.Handle := aHandle;
  DM.DB.Connected := True;
  DM.Transaction_Read.StartTransaction;

  cxGrid1DBTableView1.DataController.DataSource := DM.DataSource_services;

  PLanguageIndex := stLanguageIndex;

  DM.MemoryData_services.Open;
end;

procedure Tfrmprice_param_AE.Button_cancelClick(Sender: TObject);
begin
  close;
end;

procedure Tfrmprice_param_AE.ButtonEdit_type_roomPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  ViewForm : TfrmGetFacult;
begin
  ViewForm := TfrmGetFacult.Create(Self, DM.DB.Handle, 4, -1);
  ViewForm.ShowModal;
  if ViewForm.ModalResult = mrOk then
   Begin
    id_type_room := ViewForm.id_;
    ButtonEdit_type_room.Text := ViewForm.Name;

    DM.DataSet_read.Close;
    DM.DataSet_read.SQLs.SelectSQL.Text := 'Select * from st_ini_type_room where id_type_room = :id_type_room';
    DM.DataSet_read.ParamByName('id_type_room').AsInt64 := id_type_room;
    DM.DataSet_read.Open;

    if DM.DataSet_read['sizes'] <> null
     then CurrencyEdit_square_room.EditValue := strtofloat(DM.DataSet_read.FieldByName('sizes').asstring)
     else CurrencyEdit_square_room.EditValue := 0;

    DM.DataSet_read.close;

    S_room := CurrencyEdit_square_room.EditValue;
    
    recalc_norm;
   end;
  ViewForm.Free; 
end;

procedure Tfrmprice_param_AE.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  ViewForm : TfrmGetFacult;
begin
  ViewForm := TfrmGetFacult.Create(Self, DM.DB.Handle, 6, -1);
  ViewForm.ShowModal;
  if ViewForm.ModalResult = mrOk then
   Begin
    id_category := ViewForm.id_;
    ButtonEdit_category_class.Text := ViewForm.Name;

    DM.DataSet_read.Close;
    DM.DataSet_read.SQLs.SelectSQL.Text := 'Select * from ST_INI_CATEGORY_CLASS where id_CATEGORY_CLASS = :id_CATEGORY_CLASS';
    DM.DataSet_read.ParamByName('id_CATEGORY_CLASS').AsInt64 := id_category;
    DM.DataSet_read.Open;

    if DM.DataSet_read['PLACES'] <> null
     then CurrencyEdit_all_living.EditValue := strtofloat(DM.DataSet_read.FieldByName('PLACES').asstring)
     else CurrencyEdit_all_living.EditValue := 0;

    if DM.DataSet_read['PEOPLES'] <> null
     then CurrencyEdit_living.EditValue := strtofloat(DM.DataSet_read.FieldByName('PEOPLES').asstring)
     else CurrencyEdit_living.EditValue := 0;

    DM.DataSet_read.close;

    kol_live := CurrencyEdit_living.EditValue;

    recalc_norm;
   end;
  ViewForm.Free; 
end;

procedure Tfrmprice_param_AE.Button_add_servicesClick(Sender: TObject);
Var
  ViewForm : TfrmPrices_services_AE;
  i : Integer;
  st_options : integer;
begin
  ViewForm := TfrmPrices_services_AE.Create(self);
  ViewForm.aHandle := DM.DB.Handle;
  ViewForm.id_type_norma := -1;

  DM.DataSet_read.Close;
  DM.DataSet_read.SelectSQL.Clear;
  DM.DataSet_read.SelectSQL.Text := 'select * from ST_PROV_DEFAULT_SELECT';
  DM.DataSet_read.Open;
  DM.DataSet_read.FetchAll;

  if DM.DataSet_read['DEF_SMETA'] <> null then ViewForm.Smeta_Edit.Text:= inttostr(DM.DataSet_read['DEF_SMETA']);
  if DM.DataSet_read['DEF_KEKV'] <> null  then ViewForm.KEKV_Edit.Text:= inttostr(DM.DataSet_read['DEF_KEKV']);

  DM.DataSet_read.Close;

  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrOK then
   Begin
    //получаем тариф
    DM.DataSet_read.close;
    DM.DataSet_read.SQLs.SelectSQL.Text := 'select * from st_sp_tarif t where t.id_build = :id_build and t.id_service = :id_service and current_date between t.date_beg and t.date_end';
    DM.DataSet_read.ParamByName('id_build').AsInt64   := Id_Builds;
    DM.DataSet_read.ParamByName('id_service').AsInt64 := ViewForm.id_serves;
    DM.DataSet_read.open;
    if DM.DataSet_read['TARIF'] <> null
     then tarif := DM.DataSet_read['TARIF']
     else tarif := 0;
    DM.DataSet_read.close;

    //получаем норму
    DM.DataSet_read.close;
    DM.DataSet_read.SQLs.SelectSQL.Text := 'select * from st_sp_norma n where n.id_build = :id_build and n.id_service = :id_service and n.id_type_norma = :id_type_norma and current_date between n.date_beg and n.date_end';
    DM.DataSet_read.ParamByName('id_build').AsInt64      := Id_Builds;
    DM.DataSet_read.ParamByName('id_service').AsInt64    := ViewForm.id_serves;
    DM.DataSet_read.ParamByName('id_type_norma').AsInt64 := ViewForm.ComboBox_type_norm.ItemIndex + 1;
    DM.DataSet_read.open;

    if DM.DataSet_read['NORMA'] <> null
     then norma := DM.DataSet_read['NORMA']
     else norma := 0;

    if DM.DataSet_read['HEAD_COUNT'] <> null
     then HeadCount := DM.DataSet_read['HEAD_COUNT']
     else HeadCount := 0;

    DM.DataSet_read.close;

    case ViewForm.ComboBox_type_norm.ItemIndex + 1 of
     1 : begin norma := S_room * effective_area; end;
     3 : begin If kol_live <> 0 then norma := S_room * effective_area / kol_live; end;
     4 : begin norma := norma * (1 + ((kol_live - 1) * HeadCount)) end;
    end;

    norma := Round(norma * 1000) / 1000;

    DM.DataSet_main.close;
    DM.DataSet_main.SQLs.SelectSQL.Text := 'select * from ST_GET_RAZD_STAT_SERVES(:id_service)';

    DM.DataSet_main.ParamByName('ID_SERVICE').AsInt64 := ViewForm.id_serves;
    DM.DataSet_main.Open;
    DM.DataSet_main.FetchAll;
    If DM.DataSet_main.RecordCount = 0 then
     Begin
      ShowMessage('Обрана послуга не має вказаних параметрів з ПДВ або без ПДВ!');
      Exit;
     End;

    DM.DataSet_main.First;

    for i := 0 to Dm.DataSet_main.RecordCount - 1 do
     Begin
       if DM.DataSet_main['ST_OPTIONS'] <> null
        then st_options := DM.DataSet_main['ST_OPTIONS']
        else st_options := -1;

       if (((ViewForm.id_options = 0) and (st_options = 0))
         or((ViewForm.id_options in [1,2]) and (st_options in [1,2]))) then
        Begin
         DM.MemoryData_services.Insert;
         DM.MemoryData_services['MemoryData_id']              := ViewForm.id_serves;
         DM.MemoryData_services['MemoryData_id_type_norma']   := ViewForm.ComboBox_type_norm.ItemIndex + 1;
         DM.MemoryData_services['MemoryData_name_type_norma'] := ViewForm.ComboBox_type_norm.Text;
         DM.MemoryData_services['MemoryData_name']            := ViewForm.serves_ButtonEdit.Text;
         DM.MemoryData_services['MemoryData_buget']           := ViewForm.sm_kod + '.' + IntToStr(DM.DataSet_main['KOD_RAZD']) + '.' + IntToStr(DM.DataSet_main['KOD_STAT']) + '.' + ViewForm.kekv_kod;
         DM.MemoryData_services['MemoryData_tariff']          := tarif;
         DM.MemoryData_services['MemoryData_norma']           := norma;
         DM.MemoryData_services['MemoryData_norma']:=formatfloat('0.00', DM.MemoryData_services['MemoryData_norma']);

         case DM.DataSet_main['ST_OPTIONS'] of
          0: DM.MemoryData_services['MemoryData_summa'] := DM.MemoryData_services['MemoryData_norma'] * DM.MemoryData_services['MemoryData_tariff'];
          1: DM.MemoryData_services['MemoryData_summa'] := DM.MemoryData_services['MemoryData_norma'] * DM.MemoryData_services['MemoryData_tariff'];
          2: DM.MemoryData_services['MemoryData_summa'] := DM.MemoryData_services['MemoryData_norma'] * DM.MemoryData_services['MemoryData_tariff'] / 5;
         end;

         DM.MemoryData_services['MemoryData_id_sm']       := ViewForm.id_smeta;
         DM.MemoryData_services['MemoryData_Id_rz']       := DM.DataSet_main['ID_RAZD'];
         DM.MemoryData_services['MemoryData_id_st']       := DM.DataSet_main['ID_STAT'];
         DM.MemoryData_services['MemoryData_id_KEKV']     := ViewForm.id_kekv;
         DM.MemoryData_services['MemoryData_sm_tittle']   := ViewForm.sm_kod;
         DM.MemoryData_services['MemoryData_rz_tittle']   := DM.DataSet_main['KOD_RAZD'];
         DM.MemoryData_services['MemoryData_st_tittle']   := DM.DataSet_main['KOD_STAT'];
         DM.MemoryData_services['MemoryData_KEKV_tittle'] := ViewForm.kekv_kod;
         DM.MemoryData_services['MemoryData_st_options']  := DM.DataSet_main['ST_OPTIONS'];
         DM.MemoryData_services.Post;


        end;
        DM.DataSet_main.Next;
     end;
   end;

  ViewForm.Free;
end;

procedure Tfrmprice_param_AE.Button_del_servicesClick(Sender: TObject);
var
  i : Integer;
  id_services : Int64;
begin
  if DM.MemoryData_services.RecordCount = 0 then exit;

  If MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo
   then exit;

  id_services := DM.MemoryData_services['MemoryData_id'];

  DM.MemoryData_services.First;
  For i := 0 to DM.MemoryData_services.RecordCount - 1 do
   Begin
    if DM.MemoryData_services['MemoryData_id'] = id_services
     then DM.MemoryData_services.Delete;
    DM.MemoryData_services.Next;
   End;  
end;

procedure Tfrmprice_param_AE.Button_edit_servicesClick(Sender: TObject);
var
  ViewForm : TfrmPrices_services_AE;
  i : Integer;
  id_services : int64;
  st_options : integer;
begin
  If DM.MemoryData_services.RecordCount = 0 then Exit;

  ViewForm := TfrmPrices_services_AE.Create(self);
  ViewForm.aHandle := DM.DB.Handle;

  id_services := DM.MemoryData_services['MemoryData_id'];

  ViewForm.id_serves              := DM.MemoryData_services['MemoryData_id'];
  ViewForm.id_type_norma          := DM.MemoryData_services['MemoryData_id_type_norma'];
  ViewForm.serves_ButtonEdit.Text := DM.MemoryData_services['MemoryData_name'];
  ViewForm.Smeta_Edit.Text        := DM.MemoryData_services['MemoryData_sm_tittle'];
  ViewForm.KEKV_Edit.Text         := DM.MemoryData_services['MemoryData_kekv_tittle'];
  ViewForm.id_options             := DM.MemoryData_services['MemoryData_st_options'];

  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrOK then
   Begin
    DM.MemoryData_services.First;
    For i := 0 to DM.MemoryData_services.RecordCount - 1 do
     Begin
      if DM.MemoryData_services['MemoryData_id'] = id_services
       then DM.MemoryData_services.Delete;
      DM.MemoryData_services.Next;
     End;

     ///////////////////////////////////////////////////////////////////////////
     //получаем тариф
    DM.DataSet_read.close;
    DM.DataSet_read.SQLs.SelectSQL.Text := 'select * from st_sp_tarif t where t.id_build = :id_build and t.id_service = :id_service and current_date between t.date_beg and t.date_end';
    DM.DataSet_read.ParamByName('id_build').AsInt64   := Id_Builds;
    DM.DataSet_read.ParamByName('id_service').AsInt64 := ViewForm.id_serves;
    DM.DataSet_read.open;
    if DM.DataSet_read['TARIF'] <> null
     then tarif := DM.DataSet_read['TARIF']
     else tarif := 0;
    DM.DataSet_read.close;

    //получаем норму
    DM.DataSet_read.close;
    DM.DataSet_read.SQLs.SelectSQL.Text := 'select * from st_sp_norma n where n.id_build = :id_build and n.id_service = :id_service and n.id_type_norma = :id_type_norma and current_date between n.date_beg and n.date_end';
    DM.DataSet_read.ParamByName('id_build').AsInt64      := Id_Builds;
    DM.DataSet_read.ParamByName('id_service').AsInt64    := ViewForm.id_serves;
    DM.DataSet_read.ParamByName('id_type_norma').AsInt64 := ViewForm.ComboBox_type_norm.ItemIndex + 1;
    DM.DataSet_read.open;

    if DM.DataSet_read['NORMA'] <> null
     then norma := DM.DataSet_read['NORMA']
     else norma := 0;

    if DM.DataSet_read['HEAD_COUNT'] <> null
     then HeadCount := DM.DataSet_read['HEAD_COUNT']
     else HeadCount := 0;

    DM.DataSet_read.close;

    case ViewForm.ComboBox_type_norm.ItemIndex + 1 of
     1 : begin norma := S_room * effective_area; end;
     3 : begin If kol_live <> 0 then norma := S_room * effective_area / kol_live; end;
     4 : begin norma := norma * (1 + ((kol_live - 1) * HeadCount)) end;
    end;

    DM.DataSet_main.close;
    DM.DataSet_main.SQLs.SelectSQL.Text := 'select * from ST_GET_RAZD_STAT_SERVES(:id_service)';

    DM.DataSet_main.ParamByName('ID_SERVICE').AsInt64 := ViewForm.id_serves;
    DM.DataSet_main.Open;
    DM.DataSet_main.FetchAll;

    If DM.DataSet_main.RecordCount = 0 then
     Begin
      ShowMessage('Обрана послуга не має вказаних параметрів з ПДВ або без ПДВ!');
      Exit;
     End;

    DM.DataSet_main.First;

    for i := 0 to Dm.DataSet_main.RecordCount - 1 do
     Begin
      if DM.DataSet_main['ST_OPTIONS'] <> null
       then st_options := DM.DataSet_main['ST_OPTIONS']
       else st_options := -1;

      if (((ViewForm.id_options = 0) and (st_options = 0))
        or((ViewForm.id_options in [1,2]) and (st_options in [1,2]))) then
       Begin
        DM.MemoryData_services.Insert;
        DM.MemoryData_services['MemoryData_id']              := ViewForm.id_serves;
        DM.MemoryData_services['MemoryData_id_type_norma']   := ViewForm.ComboBox_type_norm.ItemIndex + 1;
        DM.MemoryData_services['MemoryData_name_type_norma'] := ViewForm.ComboBox_type_norm.Text;
        DM.MemoryData_services['MemoryData_name']            := ViewForm.serves_ButtonEdit.Text;
        DM.MemoryData_services['MemoryData_buget']           := ViewForm.sm_kod + '.' + IntToStr(DM.DataSet_main['KOD_RAZD']) + '.' + IntToStr(DM.DataSet_main['KOD_STAT']) + '.' + ViewForm.kekv_kod;
        DM.MemoryData_services['MemoryData_tariff']          := tarif;
        DM.MemoryData_services['MemoryData_norma']           := norma;
        DM.MemoryData_services['MemoryData_norma']:=formatfloat('0.00', DM.MemoryData_services['MemoryData_norma']);

        case DM.DataSet_main['ST_OPTIONS'] of
         0: DM.MemoryData_services['MemoryData_summa'] := DM.MemoryData_services['MemoryData_norma'] * DM.MemoryData_services['MemoryData_tariff'];
         1: DM.MemoryData_services['MemoryData_summa'] := DM.MemoryData_services['MemoryData_norma'] * DM.MemoryData_services['MemoryData_tariff'];
         2: DM.MemoryData_services['MemoryData_summa'] := DM.MemoryData_services['MemoryData_norma'] * DM.MemoryData_services['MemoryData_tariff'] / 5;
        end;

        DM.MemoryData_services['MemoryData_id_sm']       := ViewForm.id_smeta;
        DM.MemoryData_services['MemoryData_Id_rz']       := DM.DataSet_main['ID_RAZD'];
        DM.MemoryData_services['MemoryData_id_st']       := DM.DataSet_main['ID_STAT'];
        DM.MemoryData_services['MemoryData_id_KEKV']     := ViewForm.id_kekv;
        DM.MemoryData_services['MemoryData_sm_tittle']   := ViewForm.sm_kod;
        DM.MemoryData_services['MemoryData_rz_tittle']   := DM.DataSet_main['KOD_RAZD'];
        DM.MemoryData_services['MemoryData_st_tittle']   := DM.DataSet_main['KOD_STAT'];
        DM.MemoryData_services['MemoryData_KEKV_tittle'] := ViewForm.kekv_kod;
        DM.MemoryData_services['MemoryData_st_options']  := DM.DataSet_main['ST_OPTIONS'];
        DM.MemoryData_services.Post;

        DM.DataSet_main.Next;
       end;
     end;  
   end;

  ViewForm.Free;
end;

procedure Tfrmprice_param_AE.recalc_norm;
var
  i : Integer;
  norma : Double;
begin
  If DM.MemoryData_services.RecordCount = 0 then Exit;

  DM.MemoryData_services.First;
  For i := 0 to DM.MemoryData_services.RecordCount - 1 do
   Begin
    DM.MemoryData_services.Edit;

    //получаем тариф
    DM.DataSet_read.close;
    DM.DataSet_read.SQLs.SelectSQL.Text := 'select * from st_sp_tarif t where t.id_build = :id_build and t.id_service = :id_service and current_date between t.date_beg and t.date_end';
    DM.DataSet_read.ParamByName('id_build').AsInt64   := Id_Builds;
    DM.DataSet_read.ParamByName('id_service').AsInt64 := DM.MemoryData_services['MemoryData_id'];
    DM.DataSet_read.open;
    if DM.DataSet_read['TARIF'] <> null
     then tarif := DM.DataSet_read['TARIF']
     else tarif := 0;
    DM.DataSet_read.close;

    //получаем норму
    DM.DataSet_read.close;
    DM.DataSet_read.SQLs.SelectSQL.Text := 'select * from st_sp_norma n where n.id_build = :id_build and n.id_service = :id_service and n.id_type_norma = :id_type_norma and current_date between n.date_beg and n.date_end';
    DM.DataSet_read.ParamByName('id_build').AsInt64      := Id_Builds;
    DM.DataSet_read.ParamByName('id_service').AsInt64    := DM.MemoryData_services['MemoryData_id'];
    DM.DataSet_read.ParamByName('id_type_norma').AsInt64 := DM.MemoryData_services['MemoryData_id_type_norma'];
    DM.DataSet_read.open;

    if DM.DataSet_read['NORMA'] <> null
     then norma := DM.DataSet_read['NORMA']
     else norma := 0;

    if DM.DataSet_read['HEAD_COUNT'] <> null
     then HeadCount := DM.DataSet_read['HEAD_COUNT']
     else HeadCount := 0;

    DM.DataSet_read.close;

    case DM.MemoryData_services['MemoryData_id_type_norma'] of
     1 : begin norma := S_room * effective_area; end;
     3 : begin if kol_live <> 0 then norma := S_room * effective_area / kol_live; end;
     4 : begin norma := norma * (1 + ((kol_live - 1) * HeadCount)) end;
    end;

    norma := Round(norma * 1000) / 1000;

    DM.MemoryData_services['MemoryData_tariff'] := tarif;
    DM.MemoryData_services['MemoryData_norma']  := norma;
    DM.MemoryData_services['MemoryData_norma']:=formatfloat('0.00', DM.MemoryData_services['MemoryData_norma']);

    case DM.MemoryData_services['MemoryData_st_options'] of
     0: DM.MemoryData_services['MemoryData_summa'] := DM.MemoryData_services['MemoryData_norma'] * DM.MemoryData_services['MemoryData_tariff'];
     1: DM.MemoryData_services['MemoryData_summa'] := DM.MemoryData_services['MemoryData_norma'] * DM.MemoryData_services['MemoryData_tariff'];
     2: DM.MemoryData_services['MemoryData_summa'] := DM.MemoryData_services['MemoryData_norma'] * DM.MemoryData_services['MemoryData_tariff'] / 5;
    end;

    DM.MemoryData_services.Post;
    DM.MemoryData_services.Next;
   end;
end;

procedure Tfrmprice_param_AE.Button_okClick(Sender: TObject);
begin
  IF CurrencyEdit_kod_kat.EditValue = 0 then
   Begin
    ShowMessage('Необхідно заповнити код!');
    CurrencyEdit_kod_kat.SetFocus;
    exit;
   end;

  If TextEdit_short_name.Text = '' then
   Begin
    ShowMessage('Необхідно заповнити скороченну назву!');
    TextEdit_short_name.SetFocus;
    exit
   end;

  If TextEdit_name_kat.Text = '' then
   Begin
    ShowMessage('Необхідно заповнити назву!');
    TextEdit_name_kat.SetFocus;
    exit;
   end;
   
  if ButtonEdit_Builds.Text = '' then
   begin
    ShowMessage('Необхідно обрати гуртожиток!');
    ButtonEdit_Builds.SetFocus;
    Exit;
   end;

  if ButtonEdit_type_stud.Text = '' then
   begin
    ShowMessage('Необхідно обрати тип проживаючого!');
    ButtonEdit_type_stud.SetFocus;
    Exit;
   end;

  If ButtonEdit_type_room.Text = '' then
   begin
    ShowMessage('Необхідно обрати тип кімнати!');
    ButtonEdit_type_room.SetFocus;
    Exit;
   end;

  If ButtonEdit_category_class.Text = '' then
   begin
    ShowMessage('Необхідно обрати категорію проживаючого!');
    ButtonEdit_category_class.SetFocus;
    Exit;
   end;

  if DM.MemoryData_services.RecordCount = 0 then
   Begin
    ShowMessage('Необхідно обрати хоча б одну послугу!');
    exit;
   end;

  if is_add then
   Begin
    DM.DataSet_read.Close;
    DM.DataSet_read.SQLs.SelectSQL.Text := 'Select * from st_dt_price_param where ID_PRICES = :ID_PRICES and ID_BUILDS = :ID_BUILDS and ID_TYPE_ROOM = :ID_TYPE_ROOM and ID_TYPE_STUD = :ID_TYPE_STUD and ID_CATEGORY_CLASS = :ID_CATEGORY_CLASS';
    DM.DataSet_read.ParamByName('ID_PRICES').AsInt64 := id_price;
    DM.DataSet_read.ParamByName('ID_BUILDS').AsInt64 := ID_BUILDS;
    DM.DataSet_read.ParamByName('ID_TYPE_ROOM').AsInt64 := ID_TYPE_ROOM;
    DM.DataSet_read.ParamByName('ID_TYPE_STUD').AsInt64 := id_type_stud;
    DM.DataSet_read.ParamByName('ID_CATEGORY_CLASS').AsInt64 := id_category;
    DM.DataSet_read.Open;

    If DM.DataSet_read.RecordCount <> 0 then
     Begin
      ShowMessage('За таким набором параметрів в прийскуранті вже є ціна!');
      Exit;
     end;

    DM.DataSet_read.Close;
    DM.DataSet_read.SQLs.SelectSQL.Text := 'Select * from ST_SP_KATEGORY where (NUM_KATEGORIYA = :NUM_KATEGORIYA or SHORT_NAME = :NUM_KATEGORIYA) and not (exists(select * from st_dt_price_param where id_kat_pay = ID_KATEGORIYA))';
    DM.DataSet_read.ParamByName('NUM_KATEGORIYA').AsShort := CurrencyEdit_kod_kat.EditValue;
    DM.DataSet_read.Open;

    id_kat_pay := -1; 
    if DM.DataSet_read.RecordCount <> 0 then
     Begin
      If MessageBox(Handle,PChar('У довіднику категорій, з таким номером, вже є запис! Пов''язати його з параметрами прейскуранта?'),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo
       then exit
       else id_kat_pay := DM.DataSet_read['ID_KATEGORIYA'];
     end;
   end;

  ModalResult := mrOk;
end;

procedure Tfrmprice_param_AE.CurrencyEdit_kod_katExit(Sender: TObject);
begin
  if CurrencyEdit_kod_kat.Text = '' then CurrencyEdit_kod_kat.EditValue := 0;
end;

procedure Tfrmprice_param_AE.ButtonEdit_type_studPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  ViewForm : TfrmGetFacult;
begin
  ViewForm := TfrmGetFacult.Create(Self, DM.DB.Handle, 5, -1);
  ViewForm.ShowModal;
  if ViewForm.ModalResult = mrOk then
   Begin
    id_type_stud := ViewForm.id_;
    ButtonEdit_type_stud.Text := ViewForm.Name;
   end;
  ViewForm.Free; 
end;

procedure Tfrmprice_param_AE.FormCreate(Sender: TObject);
begin
  Id_Builds := 0;
  effective_area := 0;
  S_room := 0;
  kol_live := 0;
end;

end.
