unit Add_Edit_Order_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxButtonEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, StdCtrls, cxButtons, cxContainer, cxEdit, cxTextEdit,
  cxControls, cxGroupBox, ibase;

type
  Tfrm_Add_Edit_Prikaz = class(TForm)
    ord_ae_GroupBox: TcxGroupBox;
    ord_ae_TypeOrder_Label: TLabel;
    ord_ae_NomOrder_Label: TLabel;
    ord_ae_DateOrder_Label: TLabel;
    ord_ae_Comments_Label: TLabel;
    ord_ae_Nom_Ord: TcxTextEdit;
    ord_ae_Comments: TcxTextEdit;
    ord_ae_OkButton: TcxButton;
    ord_ae_CancelButton: TcxButton;
    ord_ae_Date_Ord: TcxDateEdit;
    ord_ae_Type_Ord: TcxButtonEdit;
    procedure FormShow(Sender: TObject);
    procedure ord_ae_Type_OrdKeyPress(Sender: TObject; var Key: Char);
    procedure ord_ae_Nom_OrdKeyPress(Sender: TObject; var Key: Char);
    procedure ord_ae_Date_OrdKeyPress(Sender: TObject; var Key: Char);
    procedure ord_ae_CommentsKeyPress(Sender: TObject; var Key: Char);
    procedure ord_ae_CancelButtonClick(Sender: TObject);
    procedure ord_ae_OkButtonClick(Sender: TObject);
    procedure ord_ae_Type_OrdPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private

  public
 //   ae_current_session_db_handle: TISC_DB_HANDLE;
 oe_Type_Order: integer;
  end;

var
  frm_Add_Edit_Prikaz: Tfrm_Add_Edit_Prikaz;

implementation

uses TypeOrd_Unit;

{$R *.dfm}

procedure Tfrm_Add_Edit_Prikaz.FormShow(Sender: TObject);
begin
ord_ae_Type_Ord.SetFocus;
end;

procedure Tfrm_Add_Edit_Prikaz.ord_ae_Type_OrdKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then ord_ae_Nom_Ord.SetFocus;
end;

procedure Tfrm_Add_Edit_Prikaz.ord_ae_Nom_OrdKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then ord_ae_Date_Ord.SetFocus;
end;

procedure Tfrm_Add_Edit_Prikaz.ord_ae_Date_OrdKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then ord_ae_Comments.SetFocus;
end;

procedure Tfrm_Add_Edit_Prikaz.ord_ae_CommentsKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then ord_ae_OkButton.SetFocus;
end;

procedure Tfrm_Add_Edit_Prikaz.ord_ae_CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure Tfrm_Add_Edit_Prikaz.ord_ae_OkButtonClick(Sender: TObject);
begin
 if ord_ae_Type_Ord.Text ='' then
  begin
   showmessage('Немає типу наказу!');
   ord_ae_Type_Ord.SetFocus;
   exit;
  end;
 if ord_ae_Nom_Ord.Text ='' then
  begin
   showmessage('Немає номеру наказу!');
   ord_ae_Nom_Ord.SetFocus;
   exit;
  end;
 if ord_ae_Date_Ord.Text ='' then
  begin
   showmessage('Немає дати наказу!');
   ord_ae_Date_Ord.SetFocus;
   exit;
  end;
  ModalResult:=mrOk;
end;

procedure Tfrm_Add_Edit_Prikaz.ord_ae_Type_OrdPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
frm_TypeOrd:=Tfrm_TypeOrd.create(self);
frm_TypeOrd.Caption:='Типи наказів';
//frm_TypeOrd.DB.Handle:=ae_current_session_db_handle;
frm_TypeOrd.DataSet.CloseOpen(true);
if frm_TypeOrd.showmodal = mrOk then
begin
 ord_ae_Type_Ord.Text:=frm_TypeOrd.DataSet['SHORT_NAME'];
 oe_Type_Order:= frm_TypeOrd.DataSet['ID_ORDER'];
 frm_TypeOrd.Free;
 end;
end;

end.
