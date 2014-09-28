unit UpComandOrderCityOrg;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, ImgList, cxGridTableView,
    cxGridLevel, cxClasses, cxControls, cxGridCustomView,
    cxGridCustomTableView, cxGridDBTableView, cxGrid, dxBar, dxBarExtItems,
    FIBDataSet, pFIBDataSet, cxLookAndFeelPainters, Buttons, StdCtrls,
    cxButtons, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,
    cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, iBase, uUnivSprav,
    RxMemDS, UpComandOrderSpCity, UpComandOrderSpOrg, uCommonSp, cxDBEdit, Registry;

type
    TFormComandCityOrg = class(TForm)
        StyleRepository: TcxStyleRepository;
        stBackground: TcxStyle;
        stContent: TcxStyle;
        stContentEven: TcxStyle;
        stContentOdd: TcxStyle;
        stFilterBox: TcxStyle;
        stFooter: TcxStyle;
        stGroup: TcxStyle;
        stGroupByBox: TcxStyle;
        stHeader: TcxStyle;
        stInactive: TcxStyle;
        stIncSearch: TcxStyle;
        stIndicator: TcxStyle;
        stPreview: TcxStyle;
        stSelection: TcxStyle;
        stHotTrack: TcxStyle;
        qizzStyle: TcxGridTableViewStyleSheet;
        IL_OrdAcc: TImageList;
        CityLbl: TLabel;
        CityBtn: TcxButton;
        OrgLbl: TLabel;
        CBOrg: TcxLookupComboBox;
        OrgBtn: TcxButton;
        btnOk: TBitBtn;
        btnCancel: TBitBtn;
        DSetOrg: TpFIBDataSet;
        DSOrg: TDataSource;
        CBCity: TcxMaskEdit;
        DSetquery: TpFIBDataSet;
        procedure dxRefreshClick(Sender: TObject);
        procedure dxBarLargeButton1Click(Sender: TObject);
        procedure dxExitClick(Sender: TObject);
        procedure CBCityPropertiesCloseUp(Sender: TObject);
        procedure CBCityPropertiesEditValueChanged(Sender: TObject);
        procedure CBCityPropertiesChange(Sender: TObject);
        procedure CBOrgPropertiesChange(Sender: TObject);
        procedure CBOrgPropertiesEditValueChanged(Sender: TObject);
        procedure CBOrgPropertiesCloseUp(Sender: TObject);
        procedure btnOkClick(Sender: TObject);
        procedure btnCancelClick(Sender: TObject);
        procedure CityBtnClick(Sender: TObject);
        procedure OrgBtnClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormShow(Sender: TObject);

    private
        FID_PLACE: int64;
        FID_COMAND_ORG: int64;
        { Private declarations }
    public
        DBHandle: TISC_DB_HANDLE;
        property ID_PLACE: int64 read FID_PLACE;
    published


        { Public declarations }
    end;

var
    FormComandCityOrg: TFormComandCityOrg;

implementation

{$R *.dfm}

procedure TFormComandCityOrg.dxRefreshClick(Sender: TObject);
begin
//    DSetCity.Close;
//    DsetCity.Open;
end;

procedure TFormComandCityOrg.dxBarLargeButton1Click(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TFormComandCityOrg.dxExitClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TFormComandCityOrg.CBCityPropertiesCloseUp(Sender: TObject);
begin
//    CBCityPropertiesEditValueChanged(Self);
end;

procedure TFormComandCityOrg.CBCityPropertiesEditValueChanged(
    Sender: TObject);
begin
{    CBOrg.Enabled := Not (CBCity.Text = '');
    If (Not DSetCity.Active) Or (CBCity.EditText = '') Then
    Begin
        CBCity.EditValue := Null;
        CBOrg.EditText := '';
    End
    Else
    Begin
        DSetCity.Locate('NAME_CITY', CBCity.EditText, []);
        CBCity.EditValue := DSetCity['ID_COMAND_CITY'];
        //  CBCity.EditText := DSetCity['NAME_CITY'];
        If DSetOrg.Active Then
            DSetOrg.Close;
        DSetOrg.Open;
    End;  }
end;

procedure TFormComandCityOrg.CBCityPropertiesChange(Sender: TObject);
begin
{    If (CBCity.Text = '') Then
        CBCityPropertiesEditValueChanged(Self);  }
end;

procedure TFormComandCityOrg.CBOrgPropertiesChange(Sender: TObject);
begin
    if (CBOrg.Text = '') then
        CBOrgPropertiesEditValueChanged(Self);
end;

procedure TFormComandCityOrg.CBOrgPropertiesEditValueChanged(
    Sender: TObject);
begin

    DSetOrg.Locate('ID_COMAND_ORG', CBOrg.EditValue, []);
    FID_COMAND_ORG := CBOrg.EditValue;
          //FID_PLACE:=DSetOrg['ID_PLACE'];
          //CBCity.EditValue:=DSetOrg['NAME_PLACE'];

end;

procedure TFormComandCityOrg.CBOrgPropertiesCloseUp(Sender: TObject);
begin
    CBOrgPropertiesEditValueChanged(Self);
end;

procedure TFormComandCityOrg.btnOkClick(Sender: TObject);
var reg: TRegistry;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        reg.OpenKey('\Software\ASUP\UpComandOrder', True);
        reg.WriteString('IsBuffer', '1');
        reg.WriteInteger('ID_PLACE', FID_PLACE);
        reg.WriteInteger('ID_COMAND_ORG', FID_COMAND_ORG);

    except
        reg.Free;
    end;

    if (not (VarIsNull(CBOrg.EditValue)))
        then
        ModalResult := mrOk;
end;

procedure TFormComandCityOrg.btnCancelClick(Sender: TObject);
begin
    ModalResult := mrCancel;
    Close;
end;

procedure TFormComandCityOrg.CityBtnClick(Sender: TObject);
var
    AdressesSp: TSprav;
    ShowStyle, Select: Integer;
begin

    AdressesSp := GetSprav('Adresses');
    ShowStyle := 3;
    if (AdressesSp <> nil) then
    begin
        with AdressesSp.Input do
        begin
            Edit;
            FieldValues['Id_Adress'] := FID_PLACE;
            FieldValues['DbHandle'] := Integer(DBHandle);
            FieldValues['Select'] := 1;
            FieldValues['ShowStyle'] := ShowStyle;
            Post;
        end;

        AdressesSp.Show;

        if (not VarIsNull(AdressesSp.Output['Name_Adr']))
            then
        begin
            CBCity.Text := AdressesSp.Output['Name_Adr'];
            FID_PLACE := AdressesSp.Output['Id_Adress'];
            if DSetOrg.Locate('ID_PLACE', FID_PLACE, []) then
                CBOrg.EditValue := DSetOrg['ID_COMAND_ORG'];
        end;
    end;
    AdressesSp.free;
{Var
    frmCity: TFormComandSpCity;
    Id: Variant;
Begin
    frmCity := TFormComandSpCity.Create(self);
    frmCity.DBHandle := DBHandle;
    If frmCity.ShowModal = mrOk Then
    Begin
        Id := frmCity.DSetCity.FieldByName('ID_COMAND_CITY').AsVariant;
        DSetCity.Close;
        DSetCity.Open;
        DSetCity.Locate('ID_COMAND_CITY', Id, []);
        CBCity.EditValue := Id;
        //CBCity.EditText := frmCity.DSetCity.FieldByName('NAME_CITY').AsString;
        If DSetOrg.Active Then
            DSetOrg.Close;
        DSetOrg.Open;
    End;
    frmCity.Free; }
end;

procedure TFormComandCityOrg.OrgBtnClick(Sender: TObject);
var
    frmOrg: TFormComandSpOrg;
begin
    frmOrg := TFormComandSpOrg.Create(self, -1, varToStrDef(DSetOrg['NAME_PLACE'], ''), DBHandle);
    if frmOrg.ShowModal = mrOk then
    begin
        try
            DSetOrg.CloseOpen(True);
            FID_COMAND_ORG := frmOrg.DSetOrg['ID_COMAND_ORG'];
            DSetOrg.Locate('ID_COMAND_ORG', FID_COMAND_ORG, []);
            CBOrg.EditValue := FID_COMAND_ORG;
        except on E: Exception do
                Showmessage(E.Message);
        end;

    end;
    frmOrg.Free;
end;

procedure TFormComandCityOrg.FormCreate(Sender: TObject);
begin
            //
end;

procedure TFormComandCityOrg.FormShow(Sender: TObject);
var reg: TRegistry;

begin
    DSetOrg.Close;
    DSetOrg.SelectSQL.text := 'SELECT Up_Dt_Comand_Org.ID_COMAND_ORG,  Up_Dt_Comand_Org.NAME_ORG, ADR_PLACE.ID_PLACE, ADR_PLACE.NAME_PLACE' + #13 +
        'FROM  Up_Dt_Comand_Org Inner join ADR_PLACE on Up_Dt_Comand_Org.ID_COMAND_CITY=ADR_PLACE.ID_PLACE' + #13 +
        'ORDER BY  NAME_ORG';
    DSetOrg.open;

    reg := TRegistry.Create;
    reg.RootKey := HKEY_CURRENT_USER;
    FID_PLACE := -1;
    FID_COMAND_ORG := 199;
    if reg.OpenKey('\Software\ASUP\UpComandOrder', False) then
    begin
        if reg.ReadString('IsBuffer') = '1' then
        begin
            FID_PLACE := reg.ReadInteger('ID_PLACE');
            FID_COMAND_ORG := reg.ReadInteger('ID_COMAND_ORG');
        end;
    end;
    Reg.Free;

    DSetOrg.Locate('ID_COMAND_ORG', IntToStr(FID_COMAND_ORG), []); //KNUTD
    if FID_PLACE = -1 then
        FID_PLACE := DSetOrg['ID_PLACE'];
    CBOrg.EditValue := FID_COMAND_ORG;
    DSetquery.Close;
    DSetquery.SelectSQL.Text := 'SELECT * FROM ADR_GET_BY_ID_PLACE(' + IntToStr(FID_PLACE) + ')';
    DSetquery.Open;
    CBCity.EditValue := DSetquery['FULL_NAME'];

end;

end.
