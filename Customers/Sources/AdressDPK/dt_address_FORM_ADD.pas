unit dt_address_FORM_ADD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Variants,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxLookAndFeelPainters, cxButtons, GlobalSPR, ExtCtrls;

type
  TFdt_address_form_add = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    LabelZip: TLabel;
    CountryEdit: TcxButtonEdit;
    RegionEdit: TcxButtonEdit;
    PlaceEdit: TcxButtonEdit;
    DistrictEdit: TcxButtonEdit;
    TypeStreetEdit: TcxButtonEdit;
    StreetEdit: TcxTextEdit;
    KorpusEdit: TcxTextEdit;
    HouseEdit: TcxTextEdit;
    FlatEdit: TcxTextEdit;
    ZipEdit: TcxTextEdit;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    Bevel1: TBevel;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FullNameEditKeyPress(Sender: TObject; var Key: Char);
    procedure CountryEditButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure PlaceEditButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure DistrictEditButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure TypeStreetEditButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure RegionEditButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ZipEditKeyPress(Sender: TObject; var Key: Char);
  public
    id_country  : integer;
    id_place    : integer;
    id_district : integer;
    id_type_street : integer;
    id_region   : integer;
    id_type_region : integer;
    id_type_place : integer;
  end;



implementation
uses BaseTypes, dt_address_FORM;

{$R *.DFM}
procedure TFdt_address_form_add.CancelButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TFdt_address_form_add.OKButtonClick(Sender: TObject);
begin
 if not isInteger(ZipEdit.Text) then begin
  agShowMessage('Необходимо ввести индекс');
  exit;
 end;
 ModalResult := mrOK;
end;

procedure TFdt_address_form_add.FullNameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key  = #13 then begin
  Key := #0;
  OKButton.SetFocus;
 end;
end;

procedure TFdt_address_form_add.CountryEditButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetCountries(self.Owner, TFdt_address(self.Owner).WorkDatabase.Handle,fsnormal, TFdt_address(self.Owner).ActualDate);
    if VarArrayDimCount(id)>0
    then begin
     if id[0]<>NULL
     then begin
            id_country  := id[0];
            CountryEdit.Text  := id[1];
     end;
   end;

end;

procedure TFdt_address_form_add.PlaceEditButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetPlaces(self.Owner, TFdt_address(self.Owner).WorkDatabase.Handle,fsnormal, TFdt_address(self.Owner).ActualDate);
    if VarArrayDimCount(id)>0
    then begin
     if id[0]<>NULL
     then begin
            id_place  := id[0];
            PlaceEdit.Text:=id[1];
            id_type_place:=id[2];
     end;
   end;
end;

procedure TFdt_address_form_add.DistrictEditButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetDistincts(self.Owner, TFdt_address(self.Owner).WorkDatabase.Handle,fsnormal, TFdt_address(self.Owner).ActualDate);
    if VarArrayDimCount(id)>0
    then begin
     if id[0]<>NULL
     then begin
            id_district  := id[0];
            DistrictEdit.Text:=id[1];
     end;
   end;
end;

procedure TFdt_address_form_add.TypeStreetEditButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetIniTypeStreet(self.Owner, TFdt_address(self.Owner).WorkDatabase.Handle,fsnormal, TFdt_address(self.Owner).ActualDate);
    if VarArrayDimCount(id)>0
    then begin
     if id[0]<>NULL
     then begin
            id_type_street  := id[0];
            TypeStreetEdit.Text:=id[1];
     end;
   end;
end;

procedure TFdt_address_form_add.FormCreate(Sender: TObject);
begin
    id_country  := -1;
    id_place    := -1;
    id_district := -1;
    id_type_street := -1;
end;

procedure TFdt_address_form_add.RegionEditButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetRegions(self.Owner, TFdt_address(self.Owner).WorkDatabase.Handle,fsnormal, TFdt_address(self.Owner).ActualDate);
    if VarArrayDimCount(id)>0
    then begin
     if id[0]<>NULL
     then begin
            id_region  := id[0];
            RegionEdit.Text:=id[1];
            id_type_region:=id[2]
     end;
   end;
end;

procedure TFdt_address_form_add.ZipEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 CheckInteger(Key);
end;

end.
