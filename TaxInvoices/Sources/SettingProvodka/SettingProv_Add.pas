unit SettingProv_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, cxButtons, ExtCtrls,Ibase,TiCommonProc,TICommonLoader,
  cxCurrencyEdit, TiMessages, cxMaskEdit, cxButtonEdit,DogLoaderUnit,SettingProv_DM,Globalspr;

type
  TSettingProvAddForm = class(TForm)
    InsertPanel: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    dogLabel: TcxLabel;
    DogButtonEdit: TcxButtonEdit;
    SchetPDVButtonEdit: TcxButtonEdit;
    SchetButtonEdit: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure DogButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SchetButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SchetPDVButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    PRes           : Variant;
    PDb_Handle     : TISC_DB_HANDLE;
  public
    //******************параметры для добавления настойки в проводках*********//
    id_dog       : Int64;
    kod_dog      : Int64;
    //reg_num_dog  : string;
    id_sch       : Int64;
    //name_sch     : string;
    id_sch_nds   : Int64;
    //name_sch_nds : string;
    //************************************************************************//

    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
    property Res:Variant read PRes;

  end;

var
  SettingProvAddForm: TSettingProvAddForm;

implementation

{$R *.dfm}

constructor TSettingProvAddForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  PDb_Handle := Db_Handle;
end;

procedure TSettingProvAddForm.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TSettingProvAddForm.cxButton1Click(Sender: TObject);
begin
  if (DogButtonEdit.Text = '')then
  begin
   TiShowMessage('Увага!','Заповніть договір!',mtWarning,[mbOK]);
   DogButtonEdit.SetFocus;
   Exit;
  end;

  if (SchetPDVButtonEdit.Text = '')then
  begin
   TiShowMessage('Увага!','Заповніть рахунок ПДВ!',mtWarning,[mbOK]);
   SchetPDVButtonEdit.SetFocus;
   Exit;
  end;

  if (SchetButtonEdit.Text = '')then
  begin
   TiShowMessage('Увага!','Заповніть рахунок проводки!',mtWarning,[mbOK]);
   SchetButtonEdit.SetFocus;
   Exit;
  end;

  ModalResult := mrOk;
end;

procedure TSettingProvAddForm.DogButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  inputDog : TDogInput;
  res   : TDogResult;
  SelectDogovor : Boolean;
  id_user : Int64;
begin
  //информация про пользователя
  SettingProvDM.UserDSet.Close;
  SettingProvDM.UserDSet.SelectSQL.Text := 'select * from TI_USER_INFO';
  SettingProvDM.UserDSet.Open;
  id_user  := SettingProvDM.UserDSet['ID_USER'];
  SelectDogovor := true;
  LoadSysData(SettingProvDM.ReadTransaction);
  SYS_ID_USER          := id_user;
  decimalseparator := ',';
  inputDog              := SYS_DEFAULT_DOG_INPUT;
  inputDog.Owner        := Self;
  inputDog.DBHandle     := SettingProvDM.DB.Handle;
  inputDog.ReadTrans    := SettingProvDM.ReadTransaction.Handle;
  inputDog.WriteTrans   := SettingProvDM.WriteTransaction.Handle;
  inputDog.FormStyle    := fsNormal;
  inputDog.Summa        := 1;
  inputDog.filter.bShowFilterForm := true;
  inputDog.isZayav     := false;
  inputDog.arndGetPay  := 1;
  inputDog.shablon_data.bUse     := true;
  inputDog.filter.bSumma         := true;
  inputDog.filter.bNameCust      := true;
  inputDog.filter.bID_Cust       := true;
  res := ShowDogMain(inputDog);
  if res.ModalResult = 1 then
  begin
    id_dog  := res.id_dog;
    kod_dog := res.kod_dog;
    DogButtonEdit.Text := VarToStr(res.regest_num);
    // kod_dog_add := res.kod_dog;
    // name_cust   := VarToStr(res.name_customer);
    // date_dog    := VarToStr(res.d_dog);
    // num_dog     := VarToStr(res.n_dog);
    // t_dog       := VarToStr(res.name_tip_dog);
    // cxMemoEdit.Text := '? '+VarToStr(res.n_dog)+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +VarToStr(res.d_dog) + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + VarToStr(res.regest_num)+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + VarToStr(res.name_customer);
  end;

end;


procedure TSettingProvAddForm.SchetButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 schet :variant;
begin
  schet := GlobalSpr.GetSch(self, SettingProvDM.DB.Handle, fsStayOnTop, Now, DEFAULT_ROOT_ID, 0, 0);
  if VarArrayDimCount(schet)=1 then
  begin
    id_sch               := schet[0][0];
    SchetButtonEdit.Text := schet[0][3];
    {PParameter.id_sch    := schet[0][0];
    PParameter.sch_title := schet[0][1];
    BankSchetEdit.Text   := schet[0][3] +' '+ schet[0][1];}
    {sch_type   := schet[0][2];
    sch_number := schet[0][3];
    sch_system := schet[0][4]; }
  end;
end;

procedure TSettingProvAddForm.SchetPDVButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 schet :variant;
begin
  schet := GlobalSpr.GetSch(self, SettingProvDM.DB.Handle, fsStayOnTop, Now, DEFAULT_ROOT_ID, 0, 0);
  if VarArrayDimCount(schet)=1 then
  begin
    id_sch_nds              := schet[0][0];
    SchetPDVButtonEdit.Text := schet[0][3];
    {PParameter.id_sch    := schet[0][0];
    PParameter.sch_title := schet[0][1];
    BankSchetEdit.Text   := schet[0][3] +' '+ schet[0][1];}
    {sch_type   := schet[0][2];
    sch_number := schet[0][3];
    sch_system := schet[0][4]; }
  end;
end;

end.
