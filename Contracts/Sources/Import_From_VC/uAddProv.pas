unit uAddProv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxMaskEdit, cxButtonEdit,
  USvyazivaniya, Show_first_import, cxGroupBox, ActnList, ibase,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, cxGraphics,
  dxStatusBar;

type
  TfmAddProv = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxButtonAdd: TcxButton;
    cxButtonCansel: TcxButton;
    ActionList1: TActionList;
    Action1: TAction;
    ButtonEdit_DB_SM: TcxButtonEdit;
    ButtonEdit_DB_RZ: TcxButtonEdit;
    ButtonEdit_DB_ST: TcxButtonEdit;
    ButtonEdit_DB_Kekv: TcxButtonEdit;
    Label41: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    pFIBDatabaseTranslyator: TpFIBDatabase;
    LabelFuc: TLabel;
    LabelSpec: TLabel;
    LabelKat: TLabel;
    LabelForm: TLabel;
    Label4: TLabel;
    LabelGragd: TLabel;
    cxTextEditFuc: TcxTextEdit;
    cxTextEditSpec: TcxTextEdit;
    cxTextEditKat: TcxTextEdit;
    cxTextEditForm: TcxTextEdit;
    cxTextEditKurs: TcxTextEdit;
    cxTextEditGragd: TcxTextEdit;
    FIBDataSetGetIdByKod: TpFIBDataSet;
    pFIBTransactionR: TpFIBTransaction;
    DataSetGetData: TpFIBDataSet;
    cxTextEditSm_title: TcxTextEdit;
    cxTextEditRz_title: TcxTextEdit;
    cxTextEditSt_title: TcxTextEdit;
    cxTextEditKekv_title: TcxTextEdit;
    Action2: TAction;
    ButtonClear: TcxButton;
    ButtonStop: TcxButton;
    dxStatusBar1: TdxStatusBar;
    Action3: TAction;
    Action4: TAction;
    procedure cxButtonCanselClick(Sender: TObject);
    procedure cxButtonEditDebetKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEditKredetKeyPress(Sender: TObject; var Key: Char);
    procedure Action1Execute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonEdit_DB_SMPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEdit_DB_KekvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEdit_DB_SMExit(Sender: TObject);
    procedure ButtonEdit_DB_RZExit(Sender: TObject);
    procedure ButtonEdit_DB_STExit(Sender: TObject);
    procedure ButtonEdit_DB_KekvExit(Sender: TObject);
    procedure cxTextEditSm_titleKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditRz_titleKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditKekv_titleKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditSt_titleKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditFucKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditSpecKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditGragdKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditFormKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditKatKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditKursKeyPress(Sender: TObject; var Key: Char);
    procedure Action2Execute(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
  private
        FlagNaAdd : boolean;
        haed_form : TfmSvyazki;
        uchet     : integer;
        id_debet, id_kredit : int64;
        deb_name, kred_name, summ_value : string;
        mayachok  : Integer;
        mode_on   : integer;
        date_doc  : Tdate;
        id_db_smeta  : int64;
        id_db_razdel : int64;
        id_db_statya : int64;

        DB_ID_KEKV   : int64;
        DB_NAME_KEKV : string;
        DB_KOD_KEKV  : Integer;

        DB_NAME_SM   : string;
        DB_NAME_RZ   : string;
        DB_NAME_ST   : string;

        DB_KOD_SM    : Integer;
        DB_KOD_RZ    : Integer;
        DB_KOD_ST    : Integer;

        KR_ID_KEKV   : int64;
        KR_NAME_KEKV : string;
        KR_KOD_KEKV  : Integer;

        KR_ID_SM     : int64;
        KR_ID_RZ     : int64;
        KR_ID_ST     : int64;

        KR_NAME_SM   : string;
        KR_NAME_RZ   : string;
        KR_NAME_ST   : string;
        ndv          : string;

        KR_KOD_SM    : Integer;
        KR_KOD_RZ    : Integer;
        KR_KOD_ST    : Integer;

        id_fac, id_spec, id_gragd, id_forma, id_kat, id_stage : int64;
  public
    ResultArray : Variant;
  end;

function GetProv(AOwner:TComponent; Basic: TISC_DB_HANDLE;  sm, rz, st, kekv, ndv : String; Date_doc : Tdate; id_sm, id_rz, id_st, id_kek, fuc, spec, gragd, forma, kat, stage : int64; type_fin, sm_t, rz_t, st_t, kekv_t: string):Variant;

implementation
uses GlobalSPR, Kernel;
{$R *.dfm}
function GetProv(AOwner:TComponent; Basic: TISC_DB_HANDLE;  sm, rz, st, kekv, ndv : String; Date_doc : Tdate; id_sm, id_rz, id_st, id_kek, fuc, spec, gragd, forma, kat, stage : int64; type_fin, sm_t, rz_t, st_t, kekv_t : string):Variant;
var
 form : TfmAddProv;
 ds   : integer;
begin
      form           := TfmAddProv.Create(AOwner);
      form.pFIBDatabaseTranslyator.Handle := Basic;
      form.Date_doc  := Date_doc;

      form.DB_NAME_SM   := '';
      form.DB_NAME_RZ   := '';
      form.DB_NAME_ST   := '';
      form.DB_NAME_KEKV := '';

      form.mode_on                := 1;
      form.Caption                := 'Визначення джерела фiнансування:: '+ type_fin+' дог. № '+ndv;
      form.cxButtonCansel.Caption := 'Розглянули';
      form.cxButtonAdd.Caption    := 'Зберегти';
      form.ButtonClear.Caption    := 'Пропустити';
      form.ButtonStop.Caption     := 'Зупинити iмпорт';
      form.Label4.Caption         := 'Бюджет';
      form.Label5.Caption         := 'Роздiл';
      form.Label6.Caption         := 'Стаття';
      form.Label7.Caption         := 'Кекв';
      form.LabelFuc.Caption       := 'Факультет';
      form.LabelSpec.Caption      := 'Спецiальнiсть';
      form.LabelKat.Caption       := 'Категорiя';
      form.LabelForm.Caption      := 'Форма';
      //form.LabelKurs.Caption      := 'Тип сплати';
      form.LabelGragd.Caption     := 'Громадянство';
      form.Label41.Caption        := 'Курс';
      form.mayachok               := 1;
      ds := 0;
      form.uchet := ds;

      form.ButtonEdit_DB_SM.Text    := sm;
      form.ButtonEdit_DB_RZ.Text    := rz;
      form.ButtonEdit_DB_ST.Text    := st;
      form.ButtonEdit_DB_KEKV.Text  := kekv;

      form.cxTextEditSm_title.Text   := sm_t;
      form.cxTextEditRz_title.Text   := rz_t;
      form.cxTextEditSt_title.Text   := st_t;
      form.cxTextEditKekv_title.Text := kekv_t;

      form.ndv                    := ndv;

      //****  Передача данніх на получение віборки ***********
      form.DataSetGetData.Close;
      form.DataSetGetData.SQLs.SelectSQL.Text := 'select * from cn_get_all_names('''+form.ndv+''','+IntToStr(fuc)+','+IntToStr(spec)+','+IntToStr(kat)+','+IntToStr(forma)+','+IntToStr(stage)+','+IntToStr(gragd)+')';
      form.DataSetGetData.Open;


      form.cxTextEditFuc.Text     := form.DataSetGetData.FieldByName('fuc').AsString;
      form.cxTextEditSpec.Text    := form.DataSetGetData.FieldByName('spec').AsString;
      form.cxTextEditKat.Text     := form.DataSetGetData.FieldByName('kat').AsString;
      form.cxTextEditForm.Text    := form.DataSetGetData.FieldByName('forma').AsString;
      //form.cxTextEditStage.Text   := form.DataSetGetData.FieldByName('stage').AsString;
      form.cxTextEditGragd.Text   := form.DataSetGetData.FieldByName('gragd').AsString;
      form.cxTextEditKurs.Text    := form.DataSetGetData.FieldByName('kurs').AsString;

      form.ShowModal;
      GetProv := form.ResultArray;
      form.Free;
end;

procedure TfmAddProv.cxButtonCanselClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,22], varVariant);

    ResultArray[6]  := DB_KOD_SM;
    ResultArray[7]  := DB_KOD_RZ;
    ResultArray[8]  := DB_KOD_ST;
    ResultArray[9]  := DB_KOD_KEKV;
    ResultArray[10] := id_db_smeta;
    ResultArray[11] := id_db_razdel;
    ResultArray[12] := id_db_statya;
    ResultArray[13] := DB_ID_KEKV;
    ResultArray[14] := 0;
    Close;
end;

procedure TfmAddProv.cxButtonEditDebetKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := Chr(0);
end;

procedure TfmAddProv.cxButtonEditKredetKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := Chr(0);
end;

procedure TfmAddProv.Action1Execute(Sender: TObject);
var
   if_ok : integer;
   sho : string;
begin
    sho := '1';
    FIBDataSetGetIdByKod.Close;
    FIBDataSetGetIdByKod.SQLs.SelectSQL.Text := 'select * from CN_BUDG_PO_KODU('''+sho+''','''+ButtonEdit_DB_SM.Text+''')';
    FIBDataSetGetIdByKod.Open;

    if_ok := FIBDataSetGetIdByKod.FieldByName('OTVET').AsInteger;

    if (if_ok = 1) then
    begin
        id_db_smeta := FIBDataSetGetIdByKod.FieldByName('ID_OBJ').AsVariant;
        cxTextEditSM_title.Text := FIBDataSetGetIdByKod.FieldByName('title_obj').AsString;
    end else
    begin
        showMessage('Такий бюджет не було знайдено!');
        ButtonEdit_DB_SM.Text   := '';
        cxTextEditSM_title.Text := '';
        id_db_razdel            := 0;
    end;
    sho := '2';
    FIBDataSetGetIdByKod.Close;
    FIBDataSetGetIdByKod.SQLs.SelectSQL.Text := 'select * from CN_BUDG_PO_KODU('''+sho+''','''+ButtonEdit_DB_RZ.Text+''')';
    FIBDataSetGetIdByKod.Open;

    if_ok := FIBDataSetGetIdByKod.FieldByName('OTVET').AsInteger;

    if (if_ok = 1) then
    begin
        id_db_razdel := FIBDataSetGetIdByKod.FieldByName('ID_OBJ').AsVariant;
        cxTextEditRz_title.Text := FIBDataSetGetIdByKod.FieldByName('title_obj').AsString;
    end else
    begin
        showMessage('Такий розділ не було знайдено!');
        ButtonEdit_DB_RZ.Text   := '';
        cxTextEditRz_title.Text := '';
        id_db_razdel            := 0;
    end;
    sho := '3';
    FIBDataSetGetIdByKod.Close;
    FIBDataSetGetIdByKod.SQLs.SelectSQL.Text := 'select * from CN_BUDG_PO_KODU('''+sho+''','''+ButtonEdit_DB_ST.Text+''')';
    FIBDataSetGetIdByKod.Open;

    if_ok := FIBDataSetGetIdByKod.FieldByName('OTVET').AsInteger;

    if (if_ok = 1) then
    begin
        id_db_statya := FIBDataSetGetIdByKod.FieldByName('ID_OBJ').AsVariant;
        cxTextEditSt_title.Text := FIBDataSetGetIdByKod.FieldByName('title_obj').AsString;
    end else
    begin
        showMessage('Така cтаття не була знайдена!');
        ButtonEdit_DB_ST.Text   := '';
        cxTextEditSt_title.Text := '';
        id_db_statya            := 0;
    end;
    sho := '4';
    FIBDataSetGetIdByKod.Close;
    FIBDataSetGetIdByKod.SQLs.SelectSQL.Text := 'select * from CN_BUDG_PO_KODU('''+sho+''','''+ButtonEdit_DB_Kekv.Text+''')';
    FIBDataSetGetIdByKod.Open;

    if_ok := FIBDataSetGetIdByKod.FieldByName('OTVET').AsInteger;

    if (if_ok = 1) then
    begin
        DB_ID_KEKV := FIBDataSetGetIdByKod.FieldByName('ID_OBJ').AsVariant;
        cxTextEditKekv_title.Text := FIBDataSetGetIdByKod.FieldByName('title_obj').AsString;
    end else
    begin
        showMessage('Такий кекв не було знайдено!');
        ButtonEdit_DB_Kekv.Text   := '';
        cxTextEditKekv_title.Text := '';
        DB_ID_KEKV                := 0;
    end;

    DB_KOD_SM    := StrToInt(ButtonEdit_DB_SM.Text);
    DB_KOD_RZ    := StrToInt(ButtonEdit_DB_RZ.Text);
    DB_KOD_ST    := StrToInt(ButtonEdit_DB_ST.Text);
    DB_KOD_KEKV  := StrToInt(ButtonEdit_DB_KEKV.Text);

        ResultArray     := VarArrayCreate([0,22], varVariant);


        ResultArray[6]  := DB_KOD_SM;
        ResultArray[7]  := DB_KOD_RZ;
        ResultArray[8]  := DB_KOD_ST;
        ResultArray[9]  := DB_KOD_KEKV;
        ResultArray[10] := id_db_smeta;
        ResultArray[11] := id_db_razdel;
        ResultArray[12] := id_db_statya;
        ResultArray[13] := DB_ID_KEKV;
        ResultArray[14] := 1;
        Close;
end;

procedure TfmAddProv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    {ResultArray := VarArrayCreate([0,22], varVariant);

    ResultArray[6]  := DB_KOD_SM;
    ResultArray[7]  := DB_KOD_RZ;
    ResultArray[8]  := DB_KOD_ST;
    ResultArray[9]  := DB_KOD_KEKV;
    ResultArray[10] := id_db_smeta;
    ResultArray[11] := id_db_razdel;
    ResultArray[12] := id_db_statya;
    ResultArray[13] := DB_ID_KEKV; }
end;

procedure TfmAddProv.ButtonEdit_DB_SMPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
  id:=GlobalSPR.GetSmets(self, pFIBDatabaseTranslyator.Handle, Date_doc, psmRazdSt);
  if VarArrayDimCount(id)>0
  then begin
   if id[0]<>NULL
   then begin
    id_db_smeta:=id[0];
    id_db_razdel:=id[1];
    id_db_statya:=id[2];
    DB_NAME_SM:=id[6];
    DB_NAME_RZ:=id[4];
    DB_NAME_ST:=id[5];
    DB_KOD_SM:=id[9];
    DB_KOD_RZ:=id[7];
    DB_KOD_ST:=id[8];
    ButtonEdit_DB_SM.text := IntToStr(DB_KOD_SM);
    ButtonEdit_DB_RZ.text := IntToStr(DB_KOD_RZ);
    ButtonEdit_DB_ST.text := IntToStr(DB_KOD_ST);
  end;
 end;
end;


procedure TfmAddProv.ButtonEdit_DB_KekvPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  id:variant;
begin
 id:=GlobalSPR.GetKEKVSpr(self, pFIBDatabaseTranslyator.Handle, fsNormal, Date_doc, DEFAULT_ROOT_ID);
 if VarArrayDimCount(id)>0 then
 begin
  if id[0][0]<>NULL then begin
   DB_ID_KEKV:=id[0][0];
   DB_NAME_KEKV:=id[0][1];
   DB_KOD_KEKV:=id[0][2];
   ButtonEdit_DB_Kekv.Text:=IntToStr(DB_KOD_KEKV);
  end;
 end;
end;

procedure TfmAddProv.ButtonEdit_DB_SMExit(Sender: TObject);
var
   if_ok : integer;
   sho : string;
begin
    sho := '1';
    FIBDataSetGetIdByKod.Close;
    FIBDataSetGetIdByKod.SQLs.SelectSQL.Text := 'select * from CN_BUDG_PO_KODU('''+sho+''','''+ButtonEdit_DB_SM.Text+''')';
    FIBDataSetGetIdByKod.Open;

    if_ok := FIBDataSetGetIdByKod.FieldByName('OTVET').AsInteger;

    if (if_ok = 1) then
    begin
        id_db_smeta := FIBDataSetGetIdByKod.FieldByName('ID_OBJ').AsVariant;
        cxTextEditSm_title.Text := FIBDataSetGetIdByKod.FieldByName('title_obj').AsString;
    end else
    begin
        showMessage('Такий бюджет не було знайдено!');
        ButtonEdit_DB_SM.Text   := '';
        cxTextEditSm_title.Text := '';
        id_db_razdel            := 0;
    end;
end;

procedure TfmAddProv.ButtonEdit_DB_RZExit(Sender: TObject);
var
   if_ok : integer;
   sho : string;
begin
    sho := '2';
    FIBDataSetGetIdByKod.Close;
    FIBDataSetGetIdByKod.SQLs.SelectSQL.Text := 'select * from CN_BUDG_PO_KODU('''+sho+''','''+ButtonEdit_DB_RZ.Text+''')';
    FIBDataSetGetIdByKod.Open;

    if_ok := FIBDataSetGetIdByKod.FieldByName('OTVET').AsInteger;

    if (if_ok = 1) then
    begin
        id_db_razdel := FIBDataSetGetIdByKod.FieldByName('ID_OBJ').AsVariant;
        cxTextEditRz_title.Text := FIBDataSetGetIdByKod.FieldByName('title_obj').AsString;
    end else
    begin
        showMessage('Такий розділ не було знайдено!');
        ButtonEdit_DB_RZ.Text   := '';
        cxTextEditRz_title.Text := '';
        id_db_razdel            := 0;
    end;
end;

procedure TfmAddProv.ButtonEdit_DB_STExit(Sender: TObject);
var
   if_ok : integer;
   sho : string;
begin
    sho := '3';
    FIBDataSetGetIdByKod.Close;
    FIBDataSetGetIdByKod.SQLs.SelectSQL.Text := 'select * from CN_BUDG_PO_KODU('''+sho+''','''+ButtonEdit_DB_ST.Text+''')';
    FIBDataSetGetIdByKod.Open;

    if_ok := FIBDataSetGetIdByKod.FieldByName('OTVET').AsInteger;

    if (if_ok = 1) then
    begin
        id_db_statya := FIBDataSetGetIdByKod.FieldByName('ID_OBJ').AsVariant;
        cxTextEditSt_title.Text := FIBDataSetGetIdByKod.FieldByName('title_obj').AsString;
    end else
    begin
        showMessage('Така cтаття не була знайдена!');
        ButtonEdit_DB_ST.Text   := '';
        cxTextEditSt_title.Text := '';
        id_db_statya            := 0;
    end;
end;

procedure TfmAddProv.ButtonEdit_DB_KekvExit(Sender: TObject);
var
   if_ok : integer;
   sho : string;
begin
    sho := '4';
    FIBDataSetGetIdByKod.Close;
    FIBDataSetGetIdByKod.SQLs.SelectSQL.Text := 'select * from CN_BUDG_PO_KODU('''+sho+''','''+ButtonEdit_DB_Kekv.Text+''')';
    FIBDataSetGetIdByKod.Open;

    if_ok := FIBDataSetGetIdByKod.FieldByName('OTVET').AsInteger;

    if (if_ok = 1) then
    begin
        DB_ID_KEKV := FIBDataSetGetIdByKod.FieldByName('ID_OBJ').AsVariant;
        cxTextEditKekv_title.Text := FIBDataSetGetIdByKod.FieldByName('title_obj').AsString;
    end else
    begin
        showMessage('Такий кекв не було знайдено!');
        ButtonEdit_DB_Kekv.Text   := '';
        cxTextEditKekv_title.Text := '';
        DB_ID_KEKV                := 0;
    end;
end;

procedure TfmAddProv.cxTextEditSm_titleKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := chr(0);
end;

procedure TfmAddProv.cxTextEditRz_titleKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := chr(0);
end;

procedure TfmAddProv.cxTextEditKekv_titleKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := chr(0);
end;

procedure TfmAddProv.cxTextEditSt_titleKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := chr(0);
end;

procedure TfmAddProv.cxTextEditFucKeyPress(Sender: TObject; var Key: Char);
begin
    key := chr(0);
end;

procedure TfmAddProv.cxTextEditSpecKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := chr(0);
end;

procedure TfmAddProv.cxTextEditGragdKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := chr(0);
end;

procedure TfmAddProv.cxTextEditFormKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := chr(0);
end;

procedure TfmAddProv.cxTextEditKatKeyPress(Sender: TObject; var Key: Char);
begin
    key := chr(0);
end;

procedure TfmAddProv.cxTextEditKursKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := chr(0);
end;

procedure TfmAddProv.Action2Execute(Sender: TObject);
begin
    if ButtonEdit_DB_SM.IsFocused   then begin ButtonEdit_DB_RZ.SetFocus; Exit; end;
    if ButtonEdit_DB_RZ.IsFocused   then begin ButtonEdit_DB_ST.SetFocus; Exit; end;
    if ButtonEdit_DB_ST.IsFocused   then begin ButtonEdit_DB_Kekv.SetFocus; Exit; end;
    if ButtonEdit_DB_Kekv.IsFocused then begin cxButtonAdd.SetFocus; Exit; end;
    if cxButtonAdd.Focused          then begin cxButtonAdd.Click; Exit; end;
end;

procedure TfmAddProv.ButtonClearClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,22], varVariant);

    ResultArray[14] := 3;
    Close;
end;

procedure TfmAddProv.ButtonStopClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,22], varVariant);

    ResultArray[14] := 4;
    Close;
end;

procedure TfmAddProv.Action3Execute(Sender: TObject);
begin
    cxButtonCanselClick(nil);
end;

procedure TfmAddProv.Action4Execute(Sender: TObject);
begin
    ButtonClearClick(nil);
end;

end.
