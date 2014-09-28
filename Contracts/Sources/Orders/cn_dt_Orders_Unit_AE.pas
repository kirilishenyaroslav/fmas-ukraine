unit cn_dt_Orders_Unit_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cnConsts, cxButtonEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxContainer, cxEdit, cxTextEdit, cxControls, cxGroupBox,
  cn_Common_Types, cn_Common_Loader, cn_Common_Funcs, Registry, Buttons;
  
type TOrderCookies = record
 OrderDate     : TDate;
 ORDER_NUM     : String;
 OrderType     : String;
 id_order      : Int64;
 Comments      : String;
end;

type
  TfrmOrdersAE = class(TForm)
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
    SpeedButton: TSpeedButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure ord_ae_Type_OrdKeyPress(Sender: TObject; var Key: Char);
    procedure ord_ae_Nom_OrdKeyPress(Sender: TObject; var Key: Char);
    procedure ord_ae_Date_OrdKeyPress(Sender: TObject; var Key: Char);
    procedure ord_ae_CommentsKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ord_ae_Type_OrdPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure OkButtonClick(Sender: TObject);
    procedure SpeedButtonClick(Sender: TObject);
  private
    PLanguageIndex : byte;
    DB_Handle : TISC_DB_HANDLE;
    procedure FormIniLanguage();
    procedure SaveCookies (OrderCookies: TOrderCookies);
    function  LoadCookies (): TOrderCookies;
  public
    id_order : int64;
    is_admin : boolean;
    constructor Create(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; LanguageIndex : byte);reintroduce;
  end;

var
  frmOrdersAE: TfrmOrdersAE;

implementation

{$R *.dfm}

procedure TfrmOrdersAE.SaveCookies (OrderCookies: TOrderCookies);
var
  reg: TRegistry;
begin
     reg := TRegistry.Create;
      try
       reg.RootKey:=HKEY_CURRENT_USER;
       if  reg.OpenKey('\Software\Contracts\Cookies\Orders',True) then
       begin
         reg.WriteString('OrderDate',    DateToStr(OrderCookies.OrderDate));
         reg.WriteString('ORDER_NUM',    OrderCookies.ORDER_NUM);
         reg.WriteString('OrderType',    OrderCookies.OrderType);
         reg.WriteString('id_order', IntToStr(OrderCookies.id_order));
         reg.WriteString('Comments',     OrderCookies.Comments);
       end
      finally
       reg.Free;
     end;
end;

function  TfrmOrdersAE.LoadCookies (): TOrderCookies;
var
  reg: TRegistry;
  OrderCookies : TOrderCookies;
begin
     reg := TRegistry.Create;
      try
       reg.RootKey:=HKEY_CURRENT_USER;
       if  reg.OpenKey('\Software\Contracts\Cookies\Orders',False) then
       begin
         OrderCookies.OrderDate := StrToDate(reg.ReadString('OrderDate')) ;
         OrderCookies.ORDER_NUM :=           reg.ReadString('ORDER_NUM') ;
         OrderCookies.OrderType :=           reg.ReadString('OrderType') ;
         OrderCookies.id_order  := StrToInt (reg.ReadString('id_order')) ;
         OrderCookies.Comments  :=           reg.ReadString('Comments') ;
         Result := OrderCookies;
       end
      finally
       reg.Free;
     end;
end;

constructor TfrmOrdersAE.Create(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; LanguageIndex : byte);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 DB_Handle := DBHandle;
 FormIniLanguage();
 Screen.Cursor:=crDefault;
 end;

procedure TfrmOrdersAE.FormIniLanguage();
begin
  ord_ae_TypeOrder_Label.Caption := cnConsts.cn_OrderType[PLanguageIndex];
  ord_ae_NomOrder_Label.Caption  := cnConsts.cn_NumOrd[PLanguageIndex];
  ord_ae_DateOrder_Label.Caption := cnConsts.cn_DateOrd[PLanguageIndex];
  ord_ae_Comments_Label.Caption  := cnConsts.cn_CommentDiss[PLanguageIndex];
  OkButton.Caption       :=  cnConsts.cn_Accept[PLanguageIndex];
  CancelButton.Caption   :=  cnConsts.cn_Cancel[PLanguageIndex];
end;

procedure TfrmOrdersAE.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmOrdersAE.ord_ae_Type_OrdKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then ord_ae_Nom_Ord.SetFocus;
end;

procedure TfrmOrdersAE.ord_ae_Nom_OrdKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then ord_ae_Date_Ord.SetFocus;
end;

procedure TfrmOrdersAE.ord_ae_Date_OrdKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then ord_ae_Comments.SetFocus;
end;

procedure TfrmOrdersAE.ord_ae_CommentsKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then OkButton.SetFocus;
end;

procedure TfrmOrdersAE.FormShow(Sender: TObject);
begin
ord_ae_Type_Ord.SetFocus;
end;

procedure TfrmOrdersAE.ord_ae_Type_OrdPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:=DB_Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin := is_admin;
  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_OrderTypes.bpl','ShowSPOrderTypes');
  AParameter.Free;

  if VarArrayDimCount(Res)>0 then
   begin
    id_order := res[0];
    ord_ae_Type_Ord.Text := res[2];
   end;

 end;

procedure TfrmOrdersAE.OkButtonClick(Sender: TObject);
var OrderCookies : TOrderCookies;
begin
if CheckControls(self, PLanguageIndex) then exit;

         OrderCookies.OrderDate    :=  ord_ae_Date_Ord.Date;
         OrderCookies.ORDER_NUM    :=  ord_ae_Nom_Ord.Text;
         OrderCookies.OrderType    :=  ord_ae_Type_Ord.Text;
         OrderCookies.id_order     :=  id_order;
         OrderCookies.Comments     :=  ord_ae_Comments.Text;
         SaveCookies(OrderCookies);

 ModalResult := MrOk;
end;

procedure TfrmOrdersAE.SpeedButtonClick(Sender: TObject);
var
 Cookies : TOrderCookies;
begin
Cookies := LoadCookies();
ord_ae_Date_Ord.Date := Cookies.OrderDate;
ord_ae_Nom_Ord.Text  := Cookies.ORDER_NUM;
ord_ae_Type_Ord.Text := Cookies.OrderType;
ord_ae_Comments.Text := Cookies.Comments;
id_order             := Cookies.id_order;
end;

end.
