unit AdressUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, CheckEditUnit, DB,
    IBCustomDataSet, IBQuery, uAddressCommon, SpCommon, AGCommon, sp_Country_Form,
    sp_Region_Form, sp_PLACE_FORM, sp_District_Form;

type
    TAdressForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        FullInfoQuery: TIBQuery;
        AdrPanel: TPanel;
        Label1: TLabel;
        CountryEdit: TCheckEdit;
        CountryButton: TSpeedButton;
        RegionButton: TSpeedButton;
        RegionEdit: TCheckEdit;
        PlaceButton: TSpeedButton;
        Label3: TLabel;
        Bevel1: TBevel;
        Label4: TLabel;
        DistrictEdit: TCheckEdit;
        DistrictButton: TSpeedButton;
        StreetEdit: TCheckEdit;
        Label6: TLabel;
        Label7: TLabel;
        KorpusEdit: TCheckEdit;
        Label8: TLabel;
        HouseEdit: TCheckEdit;
        Label9: TLabel;
        FlatEdit: TCheckEdit;
        Label10: TLabel;
        ZIPEdit: TCheckEdit;
        Label2: TLabel;
        PlaceEdit: TCheckEdit;
        FullInfoQueryNAME_DISTRICT: TIBStringField;
        FullInfoQueryID_ADDRESS: TIntegerField;
        FullInfoQuerySTREET: TIBStringField;
        FullInfoQueryNAME_REGION: TIBStringField;
        FullInfoQueryPLACE: TIBStringField;
        FullInfoQueryKORPUS: TIBStringField;
        FullInfoQueryHOUSE: TIBStringField;
        FullInfoQueryFLAT: TIBStringField;
        FullInfoQueryZIP: TIBStringField;
        FullInfoQueryID_REGION: TIntegerField;
        FullInfoQueryID_PLACE: TIntegerField;
        FullInfoQueryID_DISTRICT: TIntegerField;
        WorkQuery: TIBQuery;
        CountryCheck: TCheckBox;
        RegionCheck: TCheckBox;
        PlaceCheck: TCheckBox;
        DistrictCheck: TCheckBox;
        Label5: TLabel;
        PhoneEdit: TCheckEdit;
        FullInfoQueryPHONE: TIBStringField;
        FullInfoQueryID_COUNTRY: TIntegerField;
        FullInfoQueryNAME_COUNTRY: TIBStringField;
        procedure FormCreate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure CountryButtonClick(Sender: TObject);
        procedure RegionButtonClick(Sender: TObject);
        procedure PlaceButtonClick(Sender: TObject);
        procedure DistrictButtonClick(Sender: TObject);
        procedure FullInfoQueryNAME_DISTRICTGetText(Sender: TField;
            var Text: string; DisplayText: Boolean);
        procedure CountryCheckClick(Sender: TObject);
        procedure RegionCheckClick(Sender: TObject);
        procedure PlaceCheckClick(Sender: TObject);
        procedure DistrictCheckClick(Sender: TObject);
    private
    { Private declarations }
    public
        Mode: TEditMode;
        Id_Address: Integer;
        Id_Country: Variant;
        Id_Region: Variant;
        Id_Place: Variant;
        Id_District: Variant;
        Street: string;
        Korpus: string;
        House: string;
        Flat: string;
        Zip: string;
        Phone: string;
        AdrString: string;
        ab_priznak : string;

        procedure Prepare(PMode: TEditMode; adr_flag : string);
        procedure FillData();

    end;

var
    AdressForm: TAdressForm;

implementation

{$R *.dfm}

procedure TAdressForm.FillData();
begin
    FullInfoQuery.Close;
    FullInfoQuery.Params.ParamValues['ID'] := Id_Address;
    FullInfoQuery.Open;

    if not (FullInfoQueryName_Country.IsNull) then
        CountryEdit.Text := FullInfoQuery['Name_Country'];

    if not (FullInfoQueryNAME_REGION.IsNull) then
        RegionEdit.Text := FullInfoQuery['Name_Region'];

    if not (FullInfoQueryPLACE.IsNull) then
        PlaceEdit.Text := FullInfoQuery['PLACE'];

    if not (FullInfoQueryNAME_DISTRICT.IsNull) then
        DistrictEdit.Text := FullInfoQuery['Name_District'];

    if not VarIsNull(FullInfoQuery['Street']) then
        StreetEdit.Text := FullInfoQuery['Street'];

    if not VarIsNull(FullInfoQuery['Korpus']) then
        KorpusEdit.Text := FullInfoQuery['Korpus'];

    if not VarIsNull(FullInfoQuery['House']) then
        HouseEdit.Text := FullInfoQuery['House'];

    if not VarIsNull(FullInfoQuery['Flat']) then
        FlatEdit.Text := FullInfoQuery['Flat'];

    if not VarIsNull(FullInfoQuery['Zip']) then
        ZipEdit.Text := FullInfoQuery['Zip'];

    if not FullInfoQueryPHONE.IsNull then
        PhoneEdit.Text := FullInfoQuery['Phone'];

    if (Mode = emModify) then
    begin

        if not FullInfoQueryID_COUNTRY.IsNull then
            Id_Country := FullInfoQuery['ID_COUNTRY'];

        if not FullInfoQueryID_REGION.IsNull then
            Id_Region := FullInfoQuery['ID_REGION'];

        if not FullInfoQueryID_PLACE.IsNull then
            Id_Place := FullInfoQuery['ID_PLACE'];

        if not FullInfoQueryID_DISTRICT.IsNull then
            Id_District := FullInfoQuery['ID_DISTRICT'];

    end;

    FullInfoQuery.Close;
end;

procedure TAdressForm.Prepare(PMode: TEditMode; adr_flag : string);
begin
    Mode       := PMode;
    ab_priznak := adr_flag;

    if (ab_priznak = 'ba') then
    begin
        StreetEdit.Visible := false;
        KorpusEdit.Visible := false;
        HouseEdit.Visible  := false;
        FlatEdit.Visible   := false;
        PhoneEdit.Visible  := false;
        ZIPEdit.Visible    := false;

        Label6.Visible     := false;
        Label7.Visible     := false;
        Label8.Visible     := false;
        Label9.Visible     := false;
        Label5.Visible     := false;
        Label10.Visible    := false;

        AdrPanel.Height    := AdrPanel.Height - 155;
        Height             := Height - 155;
        OkButton.Top       := OkButton.Top - 155;
        CancelButton.Top   := CancelButton.Top - 155;
    end;

    AdressForm.Caption := 'Адреса: Додати';
    Id_Country := Null;
    Id_Region := Null;
    Id_Place := Null;
    Id_District := Null;

    if (Mode = emView) then
    begin
        AdressForm.Caption := 'Адреса: Перегляд';
        AdrPanel.Enabled := False;
        FillData();
    end;

    if (Mode = emModify) then
    begin
        AdressForm.Caption := 'Адреса: Редагування';
        FillData();
    end;

end;


procedure TAdressForm.FormCreate(Sender: TObject);
begin
    FullInfoQuery.Transaction := uAddressCommon.ReadTransaction;
    AGCommon.AGCommonInitialize(FIBDataBase, FIBReadTransaction, FIBWriteTransaction);
    WorkQuery.Transaction := uAddressCommon.WriteTransaction;

    if Version = 1 then FullInfoQuery.SQL.Text := StringReplace(FullInfoQuery.SQL.Text, 'PUB_', '', [rfReplaceAll, rfIgnoreCase]);

    if Version = 2 then FullInfoQuery.SQL.Text := StringReplace(FullInfoQuery.SQL.Text, 'PROC_SP_PLACE_SEL', 'PUB_SP_PLACE_SEL', [rfReplaceAll, rfIgnoreCase]);
end;

function IdToStr(Id: Variant): String;
begin
  if VarIsNull(Id) then Result := 'Null'
  else Result := IntToStr(Id);
end;

procedure TAdressForm.OkButtonClick(Sender: TObject);
begin
    if (Mode = emNew) or (Mode = emModify) then
    begin
        Street := StreetEdit.Text;
        Korpus := KorpusEdit.Text;
        House := HouseEdit.Text;
        Flat := FlatEdit.Text;
        Zip := ZipEdit.Text;
        Phone := PhoneEdit.EditText;

      {  if Street = '' then Street := '---';
        if Korpus = '' then Korpus := '---';
        if House = '' then House := '---';
        if Flat = '' then Flat := '---';
        if Zip = '' then Zip := '---';
        if Phone = '' then Phone := '---';}
    end;

    if (Mode = emNew) then
    begin

        WorkQuery.SQL.Text := 'SELECT * FROM DT_ADDRESS_INSERT (' +
            IdToStr(Id_Country) + ',' +
            IdToStr(Id_Region) + ',' +
            IdToStr(Id_Place) + ',' +
            IdToStr(Id_District) + ',' +
            QuotedStr(Street) + ',' +
            QuotedStr(Korpus) + ',' +
            QuotedStr(House) + ',' +
            QuotedStr(Flat) + ',' +
            QuotedStr(Zip) + ',' +
            QuotedStr(Phone) + ')';
        Id_Address := ExecQuery(WorkQuery);
        AdrString := PlaceEdit.Text + ', ' + Street + ', ' + House + '/' + Flat;
        Exit;
    end;


    if (Mode = emModify) then
    begin

        WorkQuery.SQL.Text := 'EXECUTE PROCEDURE DT_ADDRESS_UPDATE(' + IntToStr(Id_Address) + ',' +
            IdToStr(Id_Country) + ',' +
            IdToStr(Id_Region) + ',' +
            IdToStr(Id_Place) + ',' +
            IdToStr(Id_District) + ',' +
            QuotedStr(Street) + ',' +
            QuotedStr(Korpus) + ',' +
            QuotedStr(House) + ',' +
            QuotedStr(Flat) + ',' +
            QuotedStr(Zip) + ',' +
            QuotedStr(Phone) + ')';

        ExecQuery(WorkQuery);
        AdrString := PlaceEdit.Text + ', ' + Street + ', ' + House + '/' + Flat;
        Exit;
    end;

    if (Mode = emView) then Exit;
end;

procedure TAdressForm.CountryButtonClick(Sender: TObject);
var
    sp: TFsp_country;
    Params: TspOptions;
begin

    Sp := TFsp_country.Create(Self);
    Params.soAdd := True;
    Params.soSel := True;
    sp.Initialize(uAddressCommon.FIBDatabase, uAddressCommon.FIBReadTransaction, uAddressCommon.FIBWriteTransaction, Params);

    if (sp.ShowModal = mrOk) then
    begin
        Id_Country := sp.DataSet['ID_COUNTRY'];
        CountryEdit.Text := sp.DataSet['NAME_COUNTRY'];
        CountryCheck.Checked := True;
    end; ;

    sp.Free;

end;

procedure TAdressForm.RegionButtonClick(Sender: TObject);
var
    sp: TFsp_region;
    Params: TspOptions;
begin

    Sp := TFsp_region.Create(Self);
    Params.soAdd := True;
    Params.soSel := True;
    sp.Initialize(nil, nil, nil, Params);

    if (sp.ShowModal = mrOk) then
    begin
        Id_Region := sp.DataSet1['ID_REGION'];
        RegionEdit.Text := sp.DataSet1['REGION'];
        RegionCheck.Checked := True;
    end;

    sp.Free;

end;

procedure TAdressForm.PlaceButtonClick(Sender: TObject);
var
    sp: TFsp_place;
    Params: TspOptions;
begin
    Sp := TFsp_place.Create(Self);
    Params.soAdd := True;
    Params.soSel := True;
    sp.Initialize(nil, nil, nil, Params);

    if (sp.ShowModal = mrOk) then
    begin
        Id_Place := sp.DataSet['ID_PLACE'];
        PlaceEdit.Text := sp.DataSet['PLACE'];
        PlaceCheck.Checked := True;
    end; ;

    sp.Free;

end;

procedure TAdressForm.DistrictButtonClick(Sender: TObject);
var
    sp: TFsp_district;
    Params: TspOptions;
begin
    Sp := TFsp_district.Create(Self);
    Params.soAdd := True;
    Params.soSel := True;
    sp.Initialize(nil, nil, nil, Params);

    if (sp.ShowModal = mrOk) then
    begin
        Id_District := sp.DataSet['ID_DISTRICT'];
        DistrictEdit.Text := sp.DataSet['NAME_DISTRICT'];
        DistrictCheck.Checked := True;
    end;

    sp.Free;

end;

procedure TAdressForm.FullInfoQueryNAME_DISTRICTGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    if FullInfoQueryNAME_DISTRICT.IsNull then Text := '';

end;

procedure TAdressForm.CountryCheckClick(Sender: TObject);
begin
    if CountryCheck.Checked = False then
    begin
        CountryEdit.Text := '';
        Id_Country := Null;
    end;

end;

procedure TAdressForm.RegionCheckClick(Sender: TObject);
begin
    if RegionCheck.Checked = False then
    begin
        RegionEdit.Text := '';
        Id_Region := Null;
    end;

end;

procedure TAdressForm.PlaceCheckClick(Sender: TObject);
begin
    if PlaceCheck.Checked = False then
    begin
        PlaceEdit.Text := '';
        Id_Place := Null;
    end;

end;

procedure TAdressForm.DistrictCheckClick(Sender: TObject);
begin
    if DistrictCheck.Checked = False then
    begin
        DistrictEdit.Text := '';
        Id_District := Null;
    end;

end;

end.

