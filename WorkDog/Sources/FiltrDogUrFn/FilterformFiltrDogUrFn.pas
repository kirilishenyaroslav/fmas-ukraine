unit FilterformFiltrDogUrFn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxPC, cxControls,
  ExtCtrls, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  ActnList, Menus, cxCurrencyEdit, cxLabel, cxDropDownEdit, cxCalendar,
  cxMaskEdit, cxButtonEdit, cxTextEdit, cxContainer, cxEdit, cxCheckBox,iBase,DogLoaderUnit,
  DB, FIBDataSet, pFIBDataSet;

type
  TFilterForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    FiltrParamPageControl: TcxPageControl;
    FiltrParamMainTabSheet: TcxTabSheet;
    FiltrParamUrFnTabSheet: TcxTabSheet;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Bevel1: TBevel;
    Label1: TLabel;
    fltRegNumCheck: TcxCheckBox;
    fltRegNumEdit: TcxTextEdit;
    chNumDog: TcxCheckBox;
    NumDogEdit: TcxTextEdit;
    fltCustCheck: TcxCheckBox;
    fltCustEdit: TcxButtonEdit;
    fltTipDogCheck: TcxCheckBox;
    fltTipDogEdit: TcxButtonEdit;
    fltDatePeriodCheck: TcxCheckBox;
    fltDateBegEdit: TcxDateEdit;
    fltDateEndEdit: TcxDateEdit;
    cxLabel10: TcxLabel;
    fltSumFromEdit: TcxCurrencyEdit;
    fltSumCheck: TcxCheckBox;
    fltSumToEdit: TcxCurrencyEdit;
    depCheck: TcxCheckBox;
    depEdit: TcxButtonEdit;
    dateactCheck: TcxCheckBox;
    DateActBegEdit: TcxDateEdit;
    DateActEndEdit: TcxDateEdit;
    cxLabel1: TcxLabel;
    NomnCheck: TcxCheckBox;
    nomnEdit: TcxTextEdit;
    DateNomnEndEdit: TcxDateEdit;
    cxLabel2: TcxLabel;
    DateNomnBegEdit: TcxDateEdit;
    DateNomnCheck: TcxCheckBox;
    ShowClosedCheck: TcxCheckBox;
    chSumPayFulfil1: TcxCheckBox;
    chSumPayFulfil2: TcxCheckBox;
    MatEdit: TcxButtonEdit;
    cbMat: TcxCheckBox;
    cbRateAccNative: TcxCheckBox;
    RateAccNativeEdit: TcxButtonEdit;
    cbNote: TcxCheckBox;
    eNote: TcxTextEdit;
    cbEnds: TcxCheckBox;
    deEnds: TcxDateEdit;
    cxClassEdit: TcxButtonEdit;
    cbClass: TcxCheckBox;
    fltClassBox: TcxCheckBox;
    EditDateBegNarah: TcxDateEdit;
    CheckBoxPeriodNarah: TcxCheckBox;
    cxLabel3: TcxLabel;
    EditDateEndNarah: TcxDateEdit;
    CheckBoxNotNarah: TcxCheckBox;
    CheckBoxNotSch: TcxCheckBox;
    PopupMenu1: TPopupMenu;
    i1: TMenuItem;
    N8: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    ActionList1: TActionList;
    Action1: TAction;
    StoredProc: TpFIBStoredProc;
    PeriodGroupBox: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    cxDateBegIn: TcxDateEdit;
    cxDateEndIn: TcxDateEdit;
    UrFnGroupBox: TGroupBox;
    UrObCheckBox: TcxCheckBox;
    FnObCheckBox: TcxCheckBox;
    FactPlCheckBox: TcxCheckBox;
    PerDogCheckBox: TcxCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DataSet: TpFIBDataSet;
    RadioGroup1: TRadioGroup;
    GroupByRazdRadioButton: TRadioButton;
    GroupByKEKVRadioButton: TRadioButton;
    GroupBox1: TGroupBox;
    CheckBoxRazdel: TCheckBox;
    CheckBoxKEKV: TCheckBox;
    cxButtonEditRazdel: TcxButtonEdit;
    cxButtonEditKEKV: TcxButtonEdit;
    procedure cxButton2Click(Sender: TObject);
    procedure fltCustEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure fltCustEditPropertiesChange(Sender: TObject);
    procedure fltTipDogEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure fltRegNumCheckClick(Sender: TObject);
    procedure chNumDogClick(Sender: TObject);
    procedure cbEndsClick(Sender: TObject);
    procedure fltCustCheckClick(Sender: TObject);
    procedure fltTipDogCheckClick(Sender: TObject);
    procedure fltDatePeriodCheckClick(Sender: TObject);
    procedure fltSumCheckClick(Sender: TObject);
    procedure depCheckClick(Sender: TObject);
    procedure depEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure dateactCheckClick(Sender: TObject);
    procedure NomnCheckClick(Sender: TObject);
    procedure CheckBoxPeriodNarahClick(Sender: TObject);
    procedure DateNomnCheckClick(Sender: TObject);
    procedure ShowClosedCheckClick(Sender: TObject);
    procedure chSumPayFulfil1Click(Sender: TObject);
    procedure chSumPayFulfil2Click(Sender: TObject);
    procedure cbMatClick(Sender: TObject);
    procedure cbClassPropertiesChange(Sender: TObject);
    procedure MatEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxClassEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cbRateAccNativeClick(Sender: TObject);
    procedure RateAccNativeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure cbNoteClick(Sender: TObject);
    procedure SelectDogUrFn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonEditRazdelPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditKEKVPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CheckBoxRazdelClick(Sender: TObject);
    procedure CheckBoxKEKVClick(Sender: TObject);

  private

  public
    zayav_id_session : Int64;
    id_Group : integer;
    search_str:string;
    fltShowClosed : integer;
    fltId_tip_dog : integer;
    flt_id_Customer : int64;
    fltCustEdited : boolean;
    flt_id_department : Integer;
    id_class : Integer;
    flt_id_session_type : int64;
    id_otdel : int64;
    fltId_material : int64;
    flt_id_rate_acc_native : int64;
    report_class : integer;
    isFirstCell  : boolean;
    input        : TDogInput;
    Res          : Variant;
    key_session  : Int64;
    //-------------------
    id_razd    : Integer;
    nomer_razd : Integer;
    id_KEKV    : Integer;
    nomer_KEKV : Integer;
    //-------------------
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;

  end;
 TSpravFuncNom = function (aOwner:TComponent;
                     DBHANDLE : TISC_DB_HANDLE;
                     aFS: TFormStyle;   {стиль формы: fsModal или fsMDIChild}
                     aID_USER : INT64; {ид.пользователя}
                     aID_NOMN: int64;  {ид.номенклатуры, если >0, то пытаемся позицироваться}
                     aID_PROP: int64;  {ид. свойства, если >0, то фильтруем записи по свойству, (пока не реализовано!)}
                     aNType: integer;  {фильтр на тип записей: 0 - все, 1 -  ТМЦ, 2 - услуги}
                     aMView: integer;  {пока не используется }
                     aMSelect:integer; {тип выбора записей: 0 - выбор одной записи, 1 - мультивыбор записей, 2 - выбор группы }
                     aLang: integer =0 {язык интерфейса: 0 - русский (по умолчанию), 1 - украинский}
  ):Variant;stdcall;
var
  FilterForm: TFilterForm;

implementation

uses FiltrDogUrFn_DM,  GlobalSPR, LoadDogManedger, DateUtils,uCommonSp,AArray,
LoaderUnit, WSUnit,RezultFilterDogUrFn;

{$R *.dfm}
function IsMDIChildFormShow(AClass:TClass):boolean;
var IsFormShow:boolean;
    i:integer;
begin
IsFormShow:=False;
for i:=Application.MainForm.MDIChildCount-1 downto 0 do
 if (Application.MainForm.MDIChildren[i].ClassType = AClass) then
  begin
     IsFormShow:=True;
     Application.MainForm.MDIChildren[i].BringToFront;
     Application.MainForm.MDIChildren[i].SetFocus;
     FlashWindow(Application.MainForm.MDIChildren[i].Handle, true);
     break;
  end;
IsMDIChildFormShow:=IsFormShow;
end;

constructor TFilterForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
var
 input : DogLoaderUnit.TDogInput;
 res   : TDogResult;
begin
  inherited Create(AOwner);

  FiltrDogUrFnDM     := TFiltrDogUrFnDM.Create(AOwner,Db_Handle);

  FiltrDogUrFnDM.pFIBStoredProc1.Transaction.StartTransaction;
  FiltrDogUrFnDM.pFIBStoredProc1.ExecProcedure('PROC_DOG_DT_DOC_ZAYAV_GET_SES');
  zayav_id_session := FiltrDogUrFnDM.pFIBStoredProc1['ID_SESSION'].AsInt64;
  FiltrDogUrFnDM.pFIBStoredProc1.Transaction.Commit;

  input              := SYS_DEFAULT_DOG_INPUT;
  input.Owner        := Self;
  input.DBHandle     := FiltrDogUrFnDM.DB.Handle;
  input.ReadTrans    := FiltrDogUrFnDM.TransRead.Handle;
  input.WriteTrans   := FiltrDogUrFnDM.TransWrite.Handle;
  input.id_Group_add := SYS_ID_GROUP_ZAYAV;
  input.id_Group     := SYS_ID_GROUP_ZAYAV_VIEW;
  input.isZayav      := true;
  input.Values       := DogLoaderUnit.TSpravParams.Create;
  input.Values['ZAYAV_ID_SESSION'] := zayav_id_session;
  flt_id_department := dogLoaderUnit.SYS_DEF_ID_DEPARTMENT;
  depEdit.Text := dogLoaderUnit.SYS_DEF_NAME_DEPARTMENT;
  depCheck.Checked := true;
  id_Group := 399;
  GroupByKEKVRadioButton.Checked := true;
  GroupByRazdRadioButton.Checked := false;
  cxButtonEditRazdel.Text        := '';
  cxButtonEditKEKV.Text          := '';
  cxButtonEditRazdel.Enabled     := false;
  cxButtonEditKEKV.Enabled       := false;
  //id_Group := -1;
end;

procedure TFilterForm.cxButton2Click(Sender: TObject);
begin
  Close;
end;



procedure TFilterForm.fltCustEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 i, o  : TSpravParams;
begin 
 if not Visible then Exit;
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase']     := Integer(FiltrDogUrFnDM.DB.Handle);
 i['FormStyle']    := fsNormal;
 i['bMultiSelect'] := false;
 i['id_session']   := -1;
 i['SelectMode']   := selCustomer;
 i['id_cistomer']   := flt_id_Customer;
 i['show_all']     := 1;
 //LoadSysData(FiltrDogUrFnDM.TransRead);
 DogLoaderUnit.LoadSprav('Customer\CustPackage.bpl', Self, i, o);
// LoadSprav('Customer\CustPackage.bpl', Self, i, o);
 if o['ModalResult'] = mrOk then begin
  flt_id_Customer :=  {int64(StrToInt(}o['id_customer']{))};
  fltCustEdit.Text := o['name_customer'];
  fltCustCheck.Checked := true;
  fltCustEdited := false;
 end
 else
 begin
   fltCustCheck.Checked := false;
   flt_id_Customer := -1;
 end;{var
 Res : Variant;
begin
 if not Visible then Exit;
 Res := ShowCustomers(Self, pFIBDatabase1.Handle, fsNormal, now, csmCustomers, flt_id_Customer, -1);
 if VarArrayDimCount(Res) <> 0 then begin
  flt_id_Customer := Res[0];
  fltCustEdit.Text := Res[2];
  fltCustCheck.Checked := true;
  fltCustEdited := false;
 end
 else
 begin
   fltCustCheck.Checked := false;
   flt_id_Customer := -1;
 end; }
end;

procedure TFilterForm.fltCustEditPropertiesChange(Sender: TObject);
begin
 if fltCustEdit.Text = '' then fltCustEdited := False;
end;

procedure TFilterForm.fltTipDogEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 res : Variant;
 CNT : integer;
 i   : integer;
begin
{ res := LoadDogManedger.WorkTypeDogSPR(Self, pFIBDatabase1.Handle, fsNormal, 'select', Nil, id_Group, Nil);
 if VarArrayDimCount(res) > 0 then begin
  fltTipDogCheck.Checked := true;
  fltId_tip_dog := res[0][0];
  fltTipDogEdit.Text := res[0][2];
 end else fltTipDogCheck.Checked := false;}
 res := LoadDogManedger.WorkTypeDogSPR(Self, FiltrDogUrFnDM.DB.Handle, fsNormal, 'select2', Nil, id_Group, Nil);
 if VarArrayDimCount(res) = 0 then
 begin
   fltTipDogCheck.Checked := false;
   exit;
 end;
 Cnt := VarArrayHighBound(res, 1);
 if cnt = 0 then
 begin
   fltTipDogCheck.Checked := true;
   fltId_tip_dog := res[0][0];
   fltTipDogEdit.Text := res[0][2];
 end
 else
 begin
   fltTipDogEdit.Text := '< ДЕКІЛЬКА >'; 
   StoredProc.StoredProcName := 'DOG_DT_DOCUMENT_GET_FILTER_SES';
   StoredProc.Transaction.StartTransaction;
   StoredProc.Prepare;
   StoredProc.ExecProc;
   flt_id_session_type := StoredProc['ID_SESSION'].AsInt64;
   StoredProc.Transaction.Commit;
   StoredProc.Close;
   for i := 0 to Cnt do
   begin
     StoredProc.StoredProcName := 'DOG_DT_DOCUMENT_FILTER_TYPE_ADD';
     StoredProc.Transaction.StartTransaction;
     StoredProc.Prepare;
     StoredProc.ParamByName('ID_SESSION').AsInt64 := flt_id_session_type;
     StoredProc.ParamByName('ID_TYPE_DOG').AsInt64 := res[i][0];
     StoredProc.ExecProc;
     StoredProc.Transaction.Commit;
     StoredProc.Close;
//     t_id_tip_dog := Tip_dog[i][0];
//     t_tip_dog := Tip_dog[i][1];
   end;
 end;
end;

procedure TFilterForm.fltRegNumCheckClick(Sender: TObject);
begin
 fltRegNumEdit.Enabled := fltRegNumCheck.Checked;
 if fltRegNumEdit.Enabled and visible then fltRegNumEdit.SetFocus;
end;

procedure TFilterForm.chNumDogClick(Sender: TObject);
begin
try
 NumDogEdit.Enabled := chNumDog.Checked;
 if NumDogEdit.Enabled then NumDogEdit.SetFocus;
Except
end
end;

procedure TFilterForm.cbEndsClick(Sender: TObject);
begin
  deEnds.Enabled := cbEnds.Checked;
  if Visible and deEnds.Enabled then deEnds.SetFocus;
end;

procedure TFilterForm.fltCustCheckClick(Sender: TObject);
begin
// if (flt_id_Customer = -1) and (fltCustCheck.Checked) and (not fltCustEdited) then fltCustEditPropertiesButtonClick(Self, 0);
 fltCustEdit.Enabled := fltCustCheck.Checked;
 if not visible then exit;
 if fltCustEdit.Enabled and visible then fltCustEdit.SetFocus;
end;

procedure TFilterForm.fltTipDogCheckClick(Sender: TObject);
begin
 if (fltId_tip_dog = -1) and (fltTipDogCheck.Checked) then fltTipDogEditPropertiesButtonClick(Self, 0);
 fltTipDogEdit.Enabled := fltTipDogCheck.Checked;
end;

procedure TFilterForm.fltDatePeriodCheckClick(Sender: TObject);
begin
 fltDateBegEdit.Enabled := fltDatePeriodCheck.Checked;
 fltDateEndEdit.Enabled := fltDatePeriodCheck.Checked;
// if fltDateCheck.Checked then fltDatePeriodCheck.Checked := false;
 if fltDateBegEdit.Enabled and visible then fltDateBegEdit.SetFocus;
end;

procedure TFilterForm.fltSumCheckClick(Sender: TObject);
begin
 fltSumFromEdit.Enabled := fltSumCheck.Checked;
 fltSumToEdit.Enabled := fltSumCheck.Checked;
 if fltSumFromEdit.Enabled and visible then fltSumFromEdit.SetFocus;
end;

procedure TFilterForm.depCheckClick(Sender: TObject);
begin
 if (flt_id_department = -1) and (depCheck.Checked) then depEditPropertiesButtonClick(Self, 0);
 depEdit.Enabled := depCheck.Checked;
end;

procedure TFilterForm.depEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            //if Assigned(FiltrDogUrFnDM.DB.Handle) then ShowMessage('OK')
            //else ShowMessage('not ok');

            FieldValues['DBHandle'] := Integer(FiltrDogUrFnDM.DB.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;

            //FieldValues['Root_Department'] := 2612;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
        // показать справочник и проанализировать результат (выбор одного подр.)
    sp.Show;
    if sp.Output = nil then ShowMessage('BUG: Output is NIL!!!')
                       else if not sp.Output.IsEmpty then
                            begin
                              flt_id_department := sp.Output['Id_Department'];
                              DepEdit.Text := sp.Output['Name_FULL'];
                            end;
    sp.Free;
end;

procedure TFilterForm.dateactCheckClick(Sender: TObject);
begin
 DateActBegEdit.Enabled := DateActCheck.Checked;
 DateActEndEdit.Enabled := DateActCheck.Checked;
 if DateActBegEdit.Enabled and visible then DateActBegEdit.SetFocus;
end;

procedure TFilterForm.NomnCheckClick(Sender: TObject);
begin
 NomnEdit.Enabled := NomnCheck.Checked;
 if NomnEdit.Enabled then NomnEdit.SetFocus;
end;

procedure TFilterForm.CheckBoxPeriodNarahClick(Sender: TObject);
begin
 EditDateBegNarah.Enabled := CheckBoxPeriodNarah.Checked;
 EditDateEndNarah.Enabled := CheckBoxPeriodNarah.Checked;
 CheckBoxNotNarah.Enabled := CheckBoxPeriodNarah.Checked;
 CheckBoxNotSch.Enabled   := CheckBoxPeriodNarah.Checked;
 if EditDateBegNarah.Enabled and visible then EditDateBegNarah.SetFocus;
end;

procedure TFilterForm.DateNomnCheckClick(Sender: TObject);
begin
 DateNomnBegEdit.Enabled := DateNomnCheck.Checked;
 DateNomnEndEdit.Enabled := DateNomnCheck.Checked;
 if DateNomnBegEdit.Enabled and visible then DateNomnBegEdit.SetFocus;
end;

procedure TFilterForm.ShowClosedCheckClick(Sender: TObject);
begin
 if ShowClosedCheck.Checked then fltShowClosed := 1 else fltShowClosed := 0;
end;

procedure TFilterForm.chSumPayFulfil1Click(Sender: TObject);
begin
 if ShowClosedCheck.Checked then fltShowClosed := 1 else fltShowClosed := 0;
end;

procedure TFilterForm.chSumPayFulfil2Click(Sender: TObject);
begin
 if ShowClosedCheck.Checked then fltShowClosed := 1 else fltShowClosed := 0;
end;

procedure TFilterForm.cbMatClick(Sender: TObject);
begin
 if (fltId_material = -1) and (cbMat.Checked) then MatEditPropertiesButtonClick(Self, 0);
 MatEdit.Enabled := cbMat.Checked;
end;

procedure TFilterForm.cbClassPropertiesChange(Sender: TObject);
begin
 cxClassEdit.Enabled := cbClass.Checked;

 if (cbClass.Checked) then
    cxButtonEdit1PropertiesButtonClick(Self,0)
 else
 begin
  id_class:=0;
 end;
end;

procedure TFilterForm.MatEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 hPack     : HModule;
 Res:Variant;
 SpravFunc : TSpravFuncNom;
// sResult: string;
begin
 hPack := GetModuleHandle('SpNom.bpl');
 if hPack < 32 then hPack := LoadPackage('SpNom.bpl');
 if hPack > 0 then begin
  @SpravFunc := GetProcAddress(hPack, PCHAR('GetNomnEx'));
  if @SpravFunc <> NIL then Res := SpravFunc(self, FiltrDogUrFnDM.DB.Handle, fsNormal, 0, 0, 0, 0, 0, 0, 0);
 end else begin
  ShowMessage(PChar('Ошибка загрузки номенклатора'));
 end;
 if  VarType(Res) <> varEmpty then
 begin
   fltid_material := Res[0];
   MatEdit.Text := Res[1];
 end;
end;

procedure TFilterForm.cxClassEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  i, o : TAArray;
begin
 i := TAArray.Create;
  o := TAArray.Create;
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsNormal;
  i['Caption'].AsString := 'Класiфiкатор продукцiї';
  i['CaptionEdit'].AsString := 'клас';
  i['TableName'].AsString := 'pub_SP_CLASS';
  i['KEY_FIELD'].AsString := 'id_ist';
  i['parent_field'].AsString := 'linkto';
  i['FIELDS'].AsString := 'shifr;name_ist;note_class';
  i['FIELDS_caption'].AsString := 'Шифр;Назва;Примітка';
  i['SearchField'].AsString := 'FIND_FIELD';
  i['AddProc'].AsString := 'PUB_SP_CLASS_ADD';
  i['DelProc'].AsString := 'PUB_SP_CLASS_DEL';
  i['UpdProc'].AsString := 'PUB_SP_CLASS_MOD';
  i['DBHandle'].AsInteger := integer(FiltrDogUrFnDM.DB.handle);

  LoaderUnit.LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivTree.bpl', i, o);
  if o['MoadResult'].AsVariant = mrOk then
  begin
    id_class := o['ID_IST'].asInt64;
    CxClassEdit.Text := o['SHIFR'].AsString+'.'+o['NAME_IST'].AsString;
  end;

  i.Free;
  o.Free;
end;

procedure TFilterForm.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  i, o : TAArray;
begin
 i := TAArray.Create;
  o := TAArray.Create;
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsNormal;
  i['Caption'].AsString := 'Класiфiкатор продукцiї';
  i['CaptionEdit'].AsString := 'клас';
  i['TableName'].AsString := 'pub_SP_CLASS';
  i['KEY_FIELD'].AsString := 'id_ist';
  i['parent_field'].AsString := 'linkto';
  i['FIELDS'].AsString := 'shifr;name_ist;note_class';
  i['FIELDS_caption'].AsString := 'Шифр;Назва;Примітка';
  i['SearchField'].AsString := 'FIND_FIELD';
  i['AddProc'].AsString := 'PUB_SP_CLASS_ADD';
  i['DelProc'].AsString := 'PUB_SP_CLASS_DEL';
  i['UpdProc'].AsString := 'PUB_SP_CLASS_MOD';
  i['DBHandle'].AsInteger := integer(FiltrDogUrFnDM.DB.handle);

  LoaderUnit.LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivTree.bpl', i, o);
  if o['MoadResult'].AsVariant = mrOk then
  begin
    id_class := o['ID_IST'].asInt64;
    CxClassEdit.Text := o['SHIFR'].AsString+'.'+o['NAME_IST'].AsString;
  end;

  i.Free;
  o.Free;
end;

procedure TFilterForm.FormCreate(Sender: TObject);
var
  year, month, day : Word;
begin
 isFirstCell:=true;
 id_class:=-1;
 cbRateAccNative.Properties.Caption := cbRateAccNative.Properties.Caption + ' ' + SYS_NAME_CUSTOMER_NATIVE;

 cbMat.Visible := SYS_IS_DNEPR;
 MatEdit.Visible := SYS_IS_DNEPR;
 flt_id_session_type := -1;

 //Height := 467;
// if isAdmin then
// begin
//   chId_dog.Visible := True;
//   id_dogEdit.Visible := True;
// end;
 fltShowClosed := 0;
 fltId_tip_dog := -1;
 fltId_material := -1;
 id_otdel := -1;
 flt_id_rate_acc_native := -1;
 fltDateBegEdit.Date := date - SYS_DOG_PERIOD;
 fltDateEndEdit.Date := date;
 DateActBegEdit.Date := EncodeDate(YearOf(now), 1, 1);
 DateActEndEdit.Date := EncodeDate(YearOf(now), 12, 31);
 EditDateBegNarah.Date := EncodeDate(YearOf(now), 1, 1);
 EditDateEndNarah.Date := EncodeDate(YearOf(now), 12, 31);
 deEnds.Date := date;
 flt_id_Customer := -1;
 //flt_id_department := -1;
 if ShowClosedCheck.Checked then fltShowClosed := 1 else fltShowClosed := 0;
 FiltrParamPageControl.ActivePageIndex := 1;
 UrObCheckBox.Checked := True;
 FnObCheckBox.Checked := True;
 FactPlCheckBox.Checked := True;
 PerDogCheckBox.Checked := True;
 DecodeDate(Now, year, Month, day);
 cxDateBegIn.Date := EncodeDate(year, 1, 1);
 cxDateEndIn.Date := Now;
 fltDatePeriodCheck.Checked := True;
 fltDateBegEdit.Date := EncodeDate(year, 1, 1);
 fltDateBegEdit.Enabled := True;
 fltDateEndEdit.Date := Now;
 fltDateEndEdit.Enabled := True;
end;

procedure TFilterForm.cbRateAccNativeClick(Sender: TObject);
begin
 if (flt_id_rate_acc_native = -1) and (cbRateAccNative.Checked) then RateAccNativeEditPropertiesButtonClick(Self, 0);
 RateAccNativeEdit.Enabled := cbRateAccNative.Checked;
end;

procedure TFilterForm.RateAccNativeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 ret : variant;
begin
  ret := LoadDogManedger.WorkSpMfoRsch(self, FiltrDogUrFnDM.db.Handle, fsNormal, 'get', flt_id_rate_acc_native);
  if VarArrayDimCount(ret) > 0 then
  begin
    if ret[0][0] > 0 then
    begin
      flt_id_rate_acc_native := ret[0][0];
//      ret_mfo := ret[0][2];
//      ret_schet := ret[0][3];
      RateAccNativeEdit.Text := ret[0][3] + '(' + ret[0][2] + ')';
//      cxTextEdit_mfo_un.Text := ret[0][2];
//      cxTextEdit_rsch_un.Text := ret[0][3];
//      cxTextEdit_bank_un.Text := ret[0][6];
//      cxButton_rsch.Enabled := true;
    end else cbRateAccNative.Checked := false;
  end else cbRateAccNative.Checked := false;
end;

procedure TFilterForm.cxButton1Click(Sender: TObject);
var
 f : TForm;
 s, s2 : string;
 ch : Char;
 id_grp : int64;
 ViewForm : TRezultFilterForm;
begin
 if dateactCheck.Checked then
 begin
   if (DateActBegEdit.Text = '') or (DateActEndEdit.Text = '') then
   begin
     ShowMessage('Укажіть термін дії повністю.');
     exit;
   end;
 end;
 if fltSumCheck.Checked then
 begin
   if (fltSumFromEdit.Text = '') or (fltSumToEdit.Text = '') then
   begin
     ShowMessage('Укажіть суми повністю.');
     exit;
   end;
 end;
 if fltDatePeriodCheck.Checked then
 begin
   if (fltDateBegEdit.Text = '') or (fltDateEndEdit.Text = '') then
   begin
     ShowMessage('Укажіть термін договору повністю.');
     exit;
   end;
 end;
 if DateNomnCheck.Checked then
 begin
   if (DateNomnBegEdit.Text = '') or (DateNomnEndEdit.Text = '') then
   begin
     ShowMessage('Укажіть термін номенклатурної дати повністю.');
     exit;
   end;
 end;

  if dateactCheck.Checked then
 begin
   if (DateActBegEdit.Text = '') or (DateActEndEdit.Text = '') then
   begin
     ShowMessage('Укажіть термін дії повністю.');
     exit;
   end;
 end;

 if CheckBoxRazdel.Checked then
 begin
   if (cxButtonEditRazdel.Text = '') then
   begin
     ShowMessage('Укажіть розділ.');
     cxButtonEditRazdel.SetFocus;
     exit;
   end;
 end;

 if CheckBoxKEKV.Checked then
 begin
   if (cxButtonEditKEKV.Text = '') then
   begin
     ShowMessage('Укажіть КЕКВ.');
     cxButtonEditKEKV.SetFocus;
     exit;
   end;
 end;

 SelectDogUrFn;
 ModalResult := mrYes;
{ if (FiltrDogUrFnDM.DSetDog.IsEmpty = false) then
 begin

   ViewForm := TRezultFilterForm.Create(Self);
   ViewForm.FormStyle := fsMDIChild;
   if IsMDIChildFormShow(TRezultFilterForm) then exit;
   ViewForm.show;
   Close;
 end; }
end;

procedure TFilterForm.cbNoteClick(Sender: TObject);
begin
  eNote.Enabled := cbNote.Checked;
  if Visible and eNote.Enabled then eNote.SetFocus;
end;

procedure TFilterForm.SelectDogUrFn;
var
 f : TForm;
 s, s2 : string;
 ch : Char;
 id_grp : int64;
 select_sql : string;
begin
 f := WaitScreenShow(Self);
 key_session := FiltrDogUrFnDM.DataSet.Database.Gen_Id('DOG_GEN_ID_SESSION_UR_FN', 1);
 FiltrDogUrFnDM.DSetDog.Close;
// FiltrDogUrFnDM.DSetDog.SelectSQL.Text := 'select * from PROC_DOG_DT_DOCUMENT_SEL3(:ID_GROUP, :ID_USER, :FLT_ID_TIP_DOG, :WHERE_COND, :WHERE_COND_FOR_MAN, :ID_OTDEL, :USE_SHORT, :ID_MATERIAL, :ID_SESSION_TYPE,:P_ID_CLASS) ORDER BY NAME_TIP_DOG,NAME_CUSTOMER';
 select_sql := 'select * from DOG_SELECT_UR_FN_OB(:D_B_IN,:D_E_IN,:ID_GROUP, :ID_USER, :FLT_ID_TIP_DOG, :W_COND, :W_COND_FOR_MAN, :ID_OTDEL, :USE_SHORT, :ID_MAT, :ID_SES_TYPE,:P_ID_CL,:FLAG_FIN,:FLAG_UR,:FLAG_PER,:FLAG_OPL,:KEY,:gr_by_KEKV,:gr_by_RZ,:F_R,:F_K,:I_R,:I_K)';
 FiltrDogUrFnDM.DSetDog.SelectSQL.Text := select_sql;

 FiltrDogUrFnDM.DSetDog.ParamByName('KEY').AsInt64 := key_session;
 FiltrDogUrFnDM.DSetDog.ParamByName('USE_SHORT').AsInteger := 0;
 FiltrDogUrFnDM.DSetDog.ParamByName('ID_GROUP').AsInteger := id_Group;
 FiltrDogUrFnDM.DSetDog.ParamByName('ID_USER').AsInteger := SYS_ID_USER;
 if (GroupByKEKVRadioButton.Checked = true) then
 begin
   FiltrDogUrFnDM.DSetDog.ParamByName('gr_by_KEKV').AsInteger := 1;
   FiltrDogUrFnDM.DSetDog.ParamByName('gr_by_RZ').AsInteger   := 0;
   FiltrDogUrFnDM.DSetDog.SelectSQL.Text := select_sql + ' order by ID_KEKV_NUM ';
 end;

 if (GroupByRazdRadioButton.Checked = true) then
 begin
   FiltrDogUrFnDM.DSetDog.ParamByName('gr_by_KEKV').AsInteger := 0;
   FiltrDogUrFnDM.DSetDog.ParamByName('gr_by_RZ').AsInteger   := 1;
   FiltrDogUrFnDM.DSetDog.SelectSQL.Text := select_sql + ' order by ID_RZ_NUM ';
 end;

 if fltTipDogCheck.Checked then FiltrDogUrFnDM.DSetDog.ParamByName('FLT_ID_TIP_DOG').AsInteger := fltId_tip_dog
                           else FiltrDogUrFnDM.DSetDog.ParamByName('FLT_ID_TIP_DOG').AsInteger := -1;
 if flt_id_session_type <> -1 then
 begin
   FiltrDogUrFnDM.DSetDog.ParamByName('ID_SES_TYPE').AsInt64 := flt_id_session_type;
   FiltrDogUrFnDM.DSetDog.ParamByName('FLT_ID_TIP_DOG').AsInteger := -1;
 end else FiltrDogUrFnDM.DSetDog.ParamByName('ID_SES_TYPE').AsInt64 := -1;
 if not fltTipDogCheck.Checked then FiltrDogUrFnDM.DSetDog.ParamByName('ID_SES_TYPE').AsInt64 := -1;


 if cbMat.Checked then FiltrDogUrFnDM.DSetDog.ParamByName('ID_MAT').AsInt64 := fltId_material
                  else FiltrDogUrFnDM.DSetDog.ParamByName('ID_MAT').AsInt64 := -1;
 if depCheck.Checked then FiltrDogUrFnDM.DSetDog.ParamByName('ID_OTDEL').AsInt64 := flt_id_department
                    else FiltrDogUrFnDM.DSetDog.ParamByName('ID_OTDEL').AsInt64 := -1;
 s := '';
 s2 := '';

 {if chId_dog.Checked then
 begin
   s := s + '(doc.id_dog = ' + id_dogEdit.Text + ') and ';
   s2 := s2 + '(doc.id_dog = ' + id_dogEdit.Text + ') and ';
 end; }

 if (cbRateAccNative.Checked) and (flt_id_rate_acc_native <> -1) then
 begin
   s := s + '(acc2.ID_RATE_ACCOUNT = ' + IntToStr(flt_id_rate_acc_native) + ') and ';
   s2 := s2 + '(acc2.ID_RATE_ACCOUNT = ' + IntToStr(flt_id_rate_acc_native) + ') and ';
 end;

 if NomnCheck.Checked then
 begin
   s := s + '(doc.nomn_dog like ''%' + nomnEdit.Text + '%'') and ';
   s2 := s2 + '(doc.nomn_dog like ''%' + nomnEdit.Text + '%'') and ';
 end;
 if cbNote.Checked then
 begin
   s := s + '(doc.dog_note like ''%' + eNote.Text + '%'') and ';
   s2 := s2 + '(doc.dog_note like ''%' + eNote.Text + '%'') and ';
 end;
 if DateNomnCheck.Checked then begin
  s := s + '(doc.nomd_dog >= ''' + DateToStr(DateNomnBegEdit.Date) + ''') and (doc.nomd_dog <= ''' + DateToStr(DateNomnEndEdit.Date) + ''') and ';
  s2 := s2 + '(doc.nomd_dog >= ''' + DateToStr(DateNomnBegEdit.Date) + ''') and (doc.nomd_dog <= ''' + DateToStr(DateNomnEndEdit.Date) + ''') and ';
 end;
 if DateActCheck.Checked then begin
   s := s + '(doc.date_end >= ''' + DateToStr(DateActBegEdit.Date) + ''') and (doc.date_beg <= ''' + DateToStr(DateActEndEdit.Date) + ''') and ';
   s2 := s2 + '(doc.date_end >= ''' + DateToStr(DateActBegEdit.Date) + ''') and (doc.date_beg <= ''' + DateToStr(DateActEndEdit.Date) + ''') and ';
 end;
 if CheckBoxPeriodNarah.Checked then begin
   s := s + 'doc.id_tip_dog = (select t.id_tip_dog from pub_sp_tip_dog t inner join dog_ini_shablon i on(i.id_ini_shablon = t.id_ini_shablon) where i.name_shablon = ''add_arnd_contract.bpl'' and t.id_tip_dog=doc.id_tip_dog) and ';
   s2 := s2 + 'doc.id_tip_dog = (select t.id_tip_dog from pub_sp_tip_dog t inner join dog_ini_shablon i on(i.id_ini_shablon = t.id_ini_shablon) where i.name_shablon = ''add_arnd_contract.bpl'' and t.id_tip_dog=doc.id_tip_dog) and ';

   if CheckBoxNotNarah.Checked then begin
      s := s + ' (select distinct d1.ID_DOG from DOG_DT_ARENDA_P d1 where d1.id_dog=doc.id_dog   and (( (d1.date_beg <='''+DateToStr(EditDateEndNarah.Date)+''') and (d1.date_end>= '''+DateToStr(EditDateBegNarah.Date)+''' ))))is null and ';
       s2 := s2 + ' (select distinct d1.ID_DOG from DOG_DT_ARENDA_P d1 where d1.id_dog=doc.id_dog   and (( (d1.date_beg <='''+DateToStr(EditDateEndNarah.Date)+''') and (d1.date_end>= '''+DateToStr(EditDateBegNarah.Date)+''' )))) is null and ';
   end else begin
      s := s + 'doc.id_dog = (select distinct d1.ID_DOG from DOG_DT_ARENDA_P d1 where d1.id_dog=doc.id_dog   and (( (d1.date_beg <='''+DateToStr(EditDateEndNarah.Date)+''') and (d1.date_end>= '''+DateToStr(EditDateBegNarah.Date)+''' ))))and ';
       s2 := s2 + 'doc.id_dog = (select distinct d1.ID_DOG from DOG_DT_ARENDA_P d1 where d1.id_dog=doc.id_dog   and (( (d1.date_beg <='''+DateToStr(EditDateEndNarah.Date)+''') and (d1.date_end>= '''+DateToStr(EditDateBegNarah.Date)+''' ))))and ';
   end;
   if CheckBoxNotSch.Checked then begin
       s := s + ' (select distinct d2.ID_DOG from DOG_DT_ARND_SCH d2 where d2.id_dog=doc.id_dog   and ( ( (d2.date_beg <='''+DateToStr(EditDateEndNarah.Date)+''') and (d2.date_end>= '''+DateToStr(EditDateBegNarah.Date)+''' )))) is null and ';
       s2 := s2 + ' (select distinct d2.ID_DOG from DOG_DT_ARND_SCH d2 where d2.id_dog=doc.id_dog   and (( (d2.date_beg <='''+DateToStr(EditDateEndNarah.Date)+''') and (d2.date_end>= '''+DateToStr(EditDateBegNarah.Date)+''' )))) is null and ';
 
   end
 end;

 if cbEnds.Checked then
 begin
   s := s + '(doc.date_end <= ''' + DateToStr(deEnds.Date) + ''') and ';
   s2 := s2 + '(doc.date_end <= ''' + DateToStr(deEnds.Date) + ''') and ';
 end;

 if depCheck.Checked then
 begin
  s := s + '(doc.id_department = ' + IntToStr(flt_id_department) + ') and ';
  s2 := s2 + '(doc.id_department = ' + IntToStr(flt_id_department) + ') and ';
 end;
 if chNumDog.Checked then
 begin
   s := s + '(doc.n_dog like ''%' + NumDogEdit.Text + '%'') and ';
   s2 := s2 + '(doc.n_dog like ''%' + NumDogEdit.Text + '%'') and ';
 end;
 if chSumPayFulfil1.Checked then
 begin
   s := s + '(doc.sum_pay <> doc.sum_fulfil) and ';
   s2 := s2 + '(doc.sum_pay <> doc.sum_fulfil) and ';
 end;
 if chSumPayFulfil2.Checked then
 begin
   s := s + '(doc.sum_pay = doc.sum_fulfil) and ';
   s2 := s2 + '(doc.sum_pay = doc.sum_fulfil) and ';
 end;

  s := s + '(doc.D_DOG >= ''' + DateToStr(cxDateBegIn.Date) + ''') and (doc.D_DOG <= ''' + DateToStr(cxDateEndIn.Date) + ''') and ';
  s2 := s2 + '(doc.D_DOG >= ''' + DateToStr(cxDateBegIn.Date) + ''') and (doc.D_DOG <= ''' + DateToStr(cxDateEndIn.Date) + ''') and ';

 if fltSumCheck.Checked then begin
  s := s + '(doc.SUMMA >= ' +  FormatFloat('0.00', fltSumFromEdit.Value) + ') and (doc.SUMMA <= ' + FormatFloat('0.00', fltSumToEdit.Value) + ') and ';
  s2 := s2 + '(doc.SUMMA >= ' + FormatFloat('0.00', fltSumFromEdit.Value) + ') and (doc.SUMMA <= ' + FormatFloat('0.00', fltSumToEdit.Value) + ') and ';
 end;
 if fltRegNumCheck.Checked then begin
   FiltrDogUrFnDM.pFIBQuery1.Close;
   FiltrDogUrFnDM.pFIBQuery1.SQL.Text := 'select * from PROC_DOG_DT_DOCUMENT_FIND_BYNUM(''' + fltRegNumEdit.Text + ''', ' + IntToStr(id_Group) + ')';
   FiltrDogUrFnDM.pFIBQuery1.ExecQuery;
   if FiltrDogUrFnDM.pFIBQuery1['TOP_LEVEL'].AsInteger = 1 then
   begin
     s := s + '(doc.REGEST_NUM like ' + QuotedStr('%'+fltRegNumEdit.Text+'%') + ') and ';
     s2 := s2 + '(doc.REGEST_NUM like ' + QuotedStr('%'+fltRegNumEdit.Text+'%') + ') and ';
   end
   else
   begin
     s := s + '(doc.ID_DOG = ' + IntToStr(FiltrDogUrFnDM.pFIBQuery1['ID_DOG'].ASInt64) + ') and ';
     s2 := s2 + '(doc.ID_DOG = ' + IntToStr(FiltrDogUrFnDM.pFIBQuery1['ID_DOG'].ASInt64) + ') and ';
   end;
   FiltrDogUrFnDM.pFIBQuery1.Close;
 end;
 s := s + '(doc.DOG_CLOSE <= ' + IntToStr(fltShowClosed) + ') and ';
 s2 := s2 + '(doc.DOG_CLOSE <= ' + IntToStr(fltShowClosed) + ') and ';

{Фильтрация по контрагентам}
 if fltCustCheck.Checked then begin
  if fltCustEdited then begin
   s := s + '(cust.NAME_CUSTOMER_UPPER like ' + QuotedStr(AnsiUpperCase('%' + fltCustEdit.Text + '%')) + ') and ';
   s2 := s2 + '(Upper(p.FAMILIA || '' '' || p.IMYA || '' '' || p.OTCHESTVO || ''('' || CAST(pc.TN as varchar(20)) || '')'') like ' + QuotedStr(AnsiUpperCase('%' + fltCustEdit.Text + '%')) + ') and ';
  end else
  s := s + '(cust.ID_CUSTOMER = ' + IntToStr(flt_id_Customer) + ') and ';
  s2:=s2+'p.ID_MAN=-999 and ';
 end;
try
       if (report_class = 1) then
       begin
         if cbClass.Checked then begin
            FiltrDogUrFnDM.DSetDog.ParamByName('P_ID_CL').AsInteger := id_class;
         end else
            FiltrDogUrFnDM.DSetDog.ParamByName('P_ID_CL').AsInteger := -1;
       end else
       begin
         if cbClass.Checked then begin
            FiltrDogUrFnDM.DSetDog.ParamByName('P_ID_CL').AsInteger := id_class;
         end else
            FiltrDogUrFnDM.DSetDog.ParamByName('P_ID_CL').AsInteger := -1;
       end;
except
end ;

 if s <> '' then s := Copy(s, 1, Length(s) - 4);
 if s2 <> '' then s2 := Copy(s2, 1, Length(s2) - 4);

 FiltrDogUrFnDM.DSetDog.ParamByName('ID_GROUP').AsInteger := id_group;
 FiltrDogUrFnDM.DSetDog.ParamByName('ID_USER').AsInteger := SYS_ID_USER;

 FiltrDogUrFnDM.DSetDog.ParamByName('W_COND').AsString := s;

 FiltrDogUrFnDM.DSetDog.ParamByName('W_COND_FOR_MAN').AsString := s2;

 //параметры юрфин
 FiltrDogUrFnDM.DSetDog.ParamByName('D_B_IN').AsDate := cxDateBegIn.Date;
 FiltrDogUrFnDM.DSetDog.ParamByName('D_E_IN').AsDate := cxDateEndIn.Date;

 if (UrObCheckBox.Checked = True) then
 begin
   FiltrDogUrFnDM.DSetDog.ParamByName('FLAG_UR').Value := 1;
 end
 else
 begin
   FiltrDogUrFnDM.DSetDog.ParamByName('FLAG_UR').Value := 0;
 end;

 if (FnObCheckBox.Checked = True) then
 begin
   FiltrDogUrFnDM.DSetDog.ParamByName('FLAG_FIN').Value := 1;
 end
 else
 begin
   FiltrDogUrFnDM.DSetDog.ParamByName('FLAG_FIN').Value := 0;
 end;

 if (PerDogCheckBox.Checked = True) then
 begin
   FiltrDogUrFnDM.DSetDog.ParamByName('FLAG_PER').Value := 1;
 end
 else
 begin
   FiltrDogUrFnDM.DSetDog.ParamByName('FLAG_PER').Value := 0;
 end;

 if (FactPlCheckBox.Checked = True) then
 begin
   FiltrDogUrFnDM.DSetDog.ParamByName('FLAG_OPL').Value := 1;
 end
 else
 begin
   FiltrDogUrFnDM.DSetDog.ParamByName('FLAG_OPL').Value := 0;
 end;

 if (CheckBoxRazdel.Checked = True) then
 begin
   FiltrDogUrFnDM.DSetDog.ParamByName('F_R').Value   := 1;
   FiltrDogUrFnDM.DSetDog.ParamByName('I_R').AsInt64 := id_razd;
 end
 else
 begin
   FiltrDogUrFnDM.DSetDog.ParamByName('F_R').Value   := 0;
   FiltrDogUrFnDM.DSetDog.ParamByName('I_R').AsInt64 := 0;
 end;

 if (CheckBoxKEKV.Checked = True) then
 begin
   FiltrDogUrFnDM.DSetDog.ParamByName('F_K').Value   := 1;
   FiltrDogUrFnDM.DSetDog.ParamByName('I_K').AsInt64 := id_KEKV;
 end
 else
 begin
   FiltrDogUrFnDM.DSetDog.ParamByName('F_K').Value   := 0;
   FiltrDogUrFnDM.DSetDog.ParamByName('I_K').AsInt64 := 0;
 end;
 //---------------

 FiltrDogUrFnDM.DSetDog.Open;

 FiltrDogUrFnDM.DSetSmet.Close;
 FiltrDogUrFnDM.DSetSmet.SelectSQL.Text := 'select * from DOG_SEL_ALL_SMET_SUMM_HEIGH_DOG(:id_dog, :DATE_BEG_IN,:DATE_END_IN,:SUMMA_UR_OB_ALL,1,:SUMMA_IN_ALL_PROV_ALL,:SUMMA_DOG,1)';
 FiltrDogUrFnDM.DSetSmet.ParamByName('DATE_BEG_IN').AsDate := cxDateBegIn.Date;
 FiltrDogUrFnDM.DSetSmet.ParamByName('DATE_END_IN').AsDate := cxDateEndIn.Date;
 FiltrDogUrFnDM.DSetSmet.Open;

 WaitScreenClose(f);
end;

procedure TFilterForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TFilterForm.cxButtonEditRazdelPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  razdel: Variant;
begin
  razdel := GlobalSPR.GetSmets(self, FiltrDogUrFnDM.DB.Handle, Now, psmrazdst);
  if VarArrayDimCount(razdel) > 0 then
    begin
      if razdel[0] <> 0 then
        begin
          id_razd                 := razdel[1];
          nomer_razd              := razdel[7];
          cxButtonEditRazdel.Text := razdel[7];
        end;
    end;
end;

procedure TFilterForm.cxButtonEditKEKVPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  res : variant;
begin
  res := GlobalSPR.GetKEKVSpr(self, FiltrDogUrFnDM.DB.Handle, fsNormal, SYS_CURRENT_DATE, 1);
  if VarArrayDimCount(res) > 0 then
  begin
      if (res[0][0]<>null) and (res[0][1]<>null) then
      begin
          id_kekv := res[0][0];               //Id
          nomer_kekv := res[0][2];
          cxButtonEditKEKV.Text := res[0][2]; //Title
      end;
  end;
end;

procedure TFilterForm.CheckBoxRazdelClick(Sender: TObject);
begin
  cxButtonEditRazdel.Enabled := CheckBoxRazdel.Checked;
end;

procedure TFilterForm.CheckBoxKEKVClick(Sender: TObject);
begin
  cxButtonEditKEKV.Enabled := CheckBoxKEKV.Checked;
end;

end.
