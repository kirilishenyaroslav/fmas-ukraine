unit uDogOrders_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, cxLookAndFeelPainters, StdCtrls, cxButtons,
  uConsts, cxButtonEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxContainer, cxEdit, cxTextEdit, cxControls, cxGroupBox,
  uCommon_Types, uCommon_Loader, uCommon_Funcs, Registry, Buttons, Placemnt;
  
type
  TfrmDogOrders_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    ord_ae_GroupBox: TcxGroupBox;
    ord_ae_TypeOrder_Label: TLabel;
    ord_ae_NomOrder_Label: TLabel;
    ord_ae_DateOrder_Label: TLabel;
    ord_ae_Comments_Label: TLabel;
    ord_ae_Nom_Ord: TcxTextEdit;
    ord_ae_Comments: TcxTextEdit;
    ord_ae_Date_Ord: TcxDateEdit;
    ord_ae_Type_Ord: TcxButtonEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure ord_ae_Type_OrdKeyPress(Sender: TObject; var Key: Char);
    procedure ord_ae_Nom_OrdKeyPress(Sender: TObject; var Key: Char);
    procedure ord_ae_Date_OrdKeyPress(Sender: TObject; var Key: Char);
    procedure ord_ae_CommentsKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ord_ae_Type_OrdPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure OkButtonClick(Sender: TObject);
  private
    PLanguageIndex : byte;
    DB_Handle : TISC_DB_HANDLE;
    procedure FormIniLanguage();
  public
    id_order : int64;
    is_admin : boolean;
    constructor Create(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; LanguageIndex : byte);reintroduce;
  end;

var
  frmDogOrders_AE: TfrmDogOrders_AE;

implementation

{$R *.dfm}

constructor TfrmDogOrders_AE.Create(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; LanguageIndex : byte);
begin
  Screen.Cursor:=crHourGlass;

  inherited Create(AOwner);
  PLanguageIndex:= LanguageIndex;
  DB_Handle := DBHandle;

  FormIniLanguage();

  Screen.Cursor:=crDefault;
end;

procedure TfrmDogOrders_AE.FormIniLanguage();
begin
  ord_ae_TypeOrder_Label.Caption := uConsts.bs_OrderType[PLanguageIndex];
  ord_ae_NomOrder_Label.Caption  := uConsts.bs_NumOrd[PLanguageIndex];
  ord_ae_DateOrder_Label.Caption := uConsts.bs_DateOrd[PLanguageIndex];
  ord_ae_Comments_Label.Caption  := uConsts.bs_CommentDiss[PLanguageIndex];
  OkButton.Caption       :=  uConsts.bs_Accept[PLanguageIndex];
  CancelButton.Caption   :=  uConsts.bs_Cancel[PLanguageIndex];
end;

procedure TfrmDogOrders_AE.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmDogOrders_AE.ord_ae_Type_OrdKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then ord_ae_Nom_Ord.SetFocus;
end;

procedure TfrmDogOrders_AE.ord_ae_Nom_OrdKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then ord_ae_Date_Ord.SetFocus;
end;

procedure TfrmDogOrders_AE.ord_ae_Date_OrdKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then ord_ae_Comments.SetFocus;
end;

procedure TfrmDogOrders_AE.ord_ae_CommentsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then OkButton.SetFocus;
end;

procedure TfrmDogOrders_AE.FormShow(Sender: TObject);
begin
  ord_ae_Type_Ord.SetFocus;
end;

procedure TfrmDogOrders_AE.ord_ae_Type_OrdPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AParameter:TbsSimpleParams;
  res: Variant;
begin
  AParameter:= TbsSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:=DB_Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin := is_admin;
  res:=RunFunctionFromPackage(AParameter, 'bs\bs_sp_Orders.bpl','ShowSPOrders');
  AParameter.Free;

  if VarArrayDimCount(Res)>0 then
   begin
    id_order := res[0];
    ord_ae_Type_Ord.Text := res[2];
   end;
end;

procedure TfrmDogOrders_AE.OkButtonClick(Sender: TObject);
begin
  If CheckControls(self, PLanguageIndex) then exit;

  ModalResult := MrOk;
end;

end.
