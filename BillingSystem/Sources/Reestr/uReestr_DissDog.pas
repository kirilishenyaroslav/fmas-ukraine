unit uReestr_DissDog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxButtonEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxContainer, cxEdit, cxTextEdit,
  cxControls, cxGroupBox, uCommon_Types, uReestr_DM, uCommon_Funcs, uConsts,
  uCommon_Messages, uConsts_Messages, uCommon_Loader, iBase;

type
  TfrmReestr_DissDog = class(TForm)
    GroupBox: TcxGroupBox;
    OrderNum_Label: TLabel;
    Comments_Label: TLabel;
    DateDiss_Label: TLabel;
    OrderDate_Label: TLabel;
    TypeDiss_Label: TLabel;
    OrderNum_Edit: TcxTextEdit;
    Comments_Edit: TcxTextEdit;
    DateDiss: TcxDateEdit;
    OrderDate: TcxDateEdit;
    TypeDiss_Edit: TcxButtonEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure TypeDiss_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    DateStart : TDate;
    DM : TfrmReestr_DM;
    PLanguageIndex : Byte;
    procedure FormIniLanguage;
  public
    ID_TYPE_DISS : Int64;
    ID_ORDER : Int64;
    is_admin : Boolean;
    constructor Create(aOwner:TComponent; aHandle:TISC_DB_HANDLE; is_admin:Boolean);reintroduce;
  end;

var
  frmReestr_DissDog: TfrmReestr_DissDog;

implementation

{$R *.dfm}

constructor TfrmReestr_DissDog.create(aOwner:TComponent; aHandle:TISC_DB_HANDLE; is_admin:Boolean);
begin
  inherited create(aOwner);
  DM := TfrmReestr_DM.Create(self);
  DM.DB.Handle := aHandle;
  DM.DB.Connected := True;
  DM.ReadTransaction.StartTransaction;

  // проверяем дату старта системы
  Dm.ReadDataSet.Close;
  Dm.ReadDataSet.SelectSQL.Clear;
  Dm.ReadDataSet.SelectSQL.Text := 'select GVK_DATE_START from GVK_PUB_SYS_DATA_GET_ALL';
  Dm.ReadDataSet.Open;
  if Dm.ReadDataSet['GVK_DATE_START'] <> null
   then DateStart:= Dm.ReadDataSet['GVK_DATE_START']
   else DateStart:= strtodate('01.01.1900');
  Dm.ReadDataSet.Close;

  self.is_admin := is_admin;
  FormIniLanguage;
end;

procedure TfrmReestr_DissDog.FormIniLanguage;
begin
  PLanguageIndex          := bsLanguageIndex();
  Caption                 := uConsts.bs_InfoDiss[PLanguageIndex];
  DateDiss_Label.Caption  := uConsts.bs_DateDiss[PLanguageIndex];
  OrderDate_Label.Caption := uConsts.bs_DateOrderDiss[PLanguageIndex];
  OrderNum_Label.Caption  := uConsts.bs_NumOrderDiss[PLanguageIndex];
  Comments_Label.Caption  := uConsts.bs_CommentDiss[PLanguageIndex];
  TypeDiss_Label.Caption  := uConsts. bs_TypeDiss[PLanguageIndex];
  OkButton.Caption        := uConsts.bs_Accept[PLanguageIndex];
  CancelButton.Caption    := uConsts.bs_Cancel[PLanguageIndex];
end;

procedure TfrmReestr_DissDog.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmReestr_DissDog.OkButtonClick(Sender: TObject);
begin
  if DateDiss.Text = '' then
   begin
     bsShowMessage(PChar(uConsts_Messages.bs_Error[PLanguageIndex]),
                    PChar(uConsts_Messages.bs_DateDiss_Need[PLanguageIndex]) ,
                    mtError,[mbYes]);
     DateDiss.SetFocus;
     exit;
   end;
  if OrderDate.Text = '' then
   begin
    bsShowMessage(PChar(uConsts_Messages.bs_Error[PLanguageIndex]),
                   PChar(uConsts_Messages.bs_DateOrder_Need[PLanguageIndex]) ,
                   mtError,[mbYes]);
    OrderDate.SetFocus;
    exit;
   end;
  if OrderNum_Edit.Text = '' then
   begin
    bsShowMessage(PChar(uConsts_Messages.bs_Error[PLanguageIndex]),
                   PChar(uConsts_Messages.bs_NumOrder_Need[PLanguageIndex]) ,
                   mtError,[mbYes]);
    OrderNum_Edit.SetFocus;
    exit;
   end;

  // проверяю период- не даю добавлять до даты старта
  if (DateDiss.Date < DateStart) then
   begin
    showmessage(bs_PeriodsLessDateStart[PLanguageIndex]);
    DateDiss.SetFocus;
    exit;
   end;
  ModalResult := mrOk; 
end;

procedure TfrmReestr_DissDog.TypeDiss_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AParameter : TbsSimpleParams;
  resUlt: Variant;
begin
  AParameter:= TbsSimpleParams.Create;
  AParameter.Owner           := self;
  AParameter.Db_Handle       := DM.DB.Handle;
  AParameter.Formstyle       := fsNormal;
  AParameter.WaitPakageOwner := self;
  AParameter.is_admin        := is_admin;
  if ID_TYPE_DISS <> -1 then AParameter.ID_Locate :=  ID_TYPE_DISS;
  resUlt := RunFunctionFromPackage(AParameter, 'bs\bs_sp_TypeDiss.bpl','ShowSPTypeDiss');

  if VarArrayDimCount(resUlt)>0 then
   begin
    ID_TYPE_DISS := resUlt[0];
    TypeDiss_Edit.Text := resUlt[1];
    ID_ORDER := resUlt[2];
   end;
  AParameter.Free;
end;

end.
