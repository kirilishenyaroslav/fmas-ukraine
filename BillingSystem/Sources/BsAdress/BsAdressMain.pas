unit BsAdressMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, DB, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxControls, cxInplaceContainer,
  cxTLData, cxDBTL, dxBar, dxBarExtItems, ActnList, cxMaskEdit, ImgList,
  cxClasses, cxGridTableView,  uCommon_Types, FIBQuery,
  pFIBQuery, pFIBStoredProc, ExtCtrls, DateUtils, cxTextEdit, cxDBEdit,
  cxContainer, cxEdit, cxLabel, uCommon_Messages, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, cxButtonEdit,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, DmAdress, rxMemds, BaseTypes, BsAdrSpr,
  cxSplitter, ComCtrls, cxHeader, BsAdrConsts, AdrEdit;

const
      pnlHeight=139;
      frmTop=260;

type
  TfrmAdress = class(TForm)
    ActionList1: TActionList;
    ActOk: TAction;
    ActCancel: TAction;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    lblStreet: TcxLabel;
    StreetBox: TcxLookupComboBox;
    btnSprStreet: TcxButton;
    pnlUpper: TPanel;
    pnlAdress: TPanel;
    lblCountry: TcxLabel;
    CountryBox: TcxLookupComboBox;
    btnSprCountry: TcxButton;
    lblRegion: TcxLabel;
    RegionBox: TcxLookupComboBox;
    btnSprRegion: TcxButton;
    lblDistrict: TcxLabel;
    DistrictBox: TcxLookupComboBox;
    btnSprDistrict: TcxButton;
    lblPlace: TcxLabel;
    PlaceBox: TcxLookupComboBox;
    btnSprPlace: TcxButton;
    lstImage: TImageList;
    imgSplitter: TImage;
    pnlSplitter: TPanel;
    lblCityArea: TcxLabel;
    CityAreaBox: TcxLookupComboBox;
    btnSprCityArea: TcxButton;
    procedure ActOkExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActCancelExecute(Sender: TObject);
    procedure btnSprStreetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSprCountryClick(Sender: TObject);
    procedure imgSplitterClick(Sender: TObject);
    procedure CountryBoxPropertiesEditValueChanged(Sender: TObject);
    procedure CountryBoxPropertiesChange(Sender: TObject);
    procedure btnSprRegionClick(Sender: TObject);
    procedure btnSprDistrictClick(Sender: TObject);
    procedure btnSprPlaceClick(Sender: TObject);
    procedure PlaceBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CountryBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RegionBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DistrictBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CountryBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RegionBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DistrictBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StreetBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StreetTextKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StreetTextKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RegionBoxPropertiesChange(Sender: TObject);
    procedure DistrictBoxPropertiesChange(Sender: TObject);
    procedure PlaceBoxPropertiesChange(Sender: TObject);
    procedure StreetBoxPropertiesChange(Sender: TObject);
    procedure StreetBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CityAreaBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CityAreaBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSprCityAreaClick(Sender: TObject);
    procedure RegionBoxPropertiesEditValueChanged(Sender: TObject);
    procedure DistrictBoxPropertiesEditValueChanged(Sender: TObject);
    procedure PlaceBoxPropertiesEditValueChanged(Sender: TObject);
    procedure CityAreaBoxPropertiesEditValueChanged(Sender: TObject);
    procedure StreetBoxPropertiesEditValueChanged(Sender: TObject);
    procedure PlaceBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblCountryClick(Sender: TObject);
    procedure lblRegionClick(Sender: TObject);
    procedure lblDistrictClick(Sender: TObject);
    procedure lblPlaceClick(Sender: TObject);
    procedure lblCityAreaClick(Sender: TObject);
    procedure lblStreetClick(Sender: TObject);
    procedure lblCountryMouseEnter(Sender: TObject);
    procedure lblCountryMouseLeave(Sender: TObject);
    procedure lblRegionMouseEnter(Sender: TObject);
    procedure lblRegionMouseLeave(Sender: TObject);
    procedure lblDistrictMouseEnter(Sender: TObject);
    procedure lblDistrictMouseLeave(Sender: TObject);
    procedure lblPlaceMouseEnter(Sender: TObject);
    procedure lblPlaceMouseLeave(Sender: TObject);
    procedure lblCityAreaMouseEnter(Sender: TObject);
    procedure lblCityAreaMouseLeave(Sender: TObject);
    procedure lblStreetMouseEnter(Sender: TObject);
    procedure lblStreetMouseLeave(Sender: TObject);
  private
    DmA:TDmAdr;
    frmHeight:Integer;
    IdAdress, PrIdK:Integer;
    IsLocateStreet:Boolean;
    function CheckData:Boolean;
    { Private declarations }
  public
    { Public declarations }
    ResAdres : Variant;
    constructor  Create(AParameter:TbsSimpleParams);reintroduce;
    procedure HidePanel(IsHide:Boolean);
    function IsInteger(inKey:Char):Boolean;
    procedure BoxKeyPress(inTextEdit:TcxTextEdit; inKey:Char);
  end;

var
  frmAdress: TfrmAdress;

implementation

{$R *.dfm}

constructor TfrmAdress.Create(AParameter:TbsSimpleParams);
begin
   inherited Create(AParameter.Owner);
   DmA:=TDmAdr.Create(AParameter.Owner);
   with DmA do
   begin
     IdAdress:=-1;
     if VarIsNull(AParameter.ID_Locate) then IsLocateStreet:=False
     else
     begin
       If AParameter.ID_Locate=1 then IsLocateStreet:=False
       else IsLocateStreet:=True;
     end;  
     AdrDB.Handle:=AParameter.Db_Handle;

     //Заполняем датасеты
     CountrySet.SQLs.SelectSQL.Text:=CountrySqlText;
     RegionSet.SQLs.SelectSQL.Text:=RegionSqlText+'(?ID_COUNTRY)'+OrderBy+'NAME_REGION'+CollateWin1251;
     DistrictSet.SQLs.SelectSQL.Text:=DistrictSqlText+'(?ID_REGION)'+OrderBy+'NAME_DISTRICT'+CollateWin1251;
     PlaceSet.SQLs.SelectSQL.Text:=PlaceSqlText+'(?ID_REGION,?ID_DSTRICT)'+OrderBy+'NAME_PLACE'+CollateWin1251;
     StreetSet.SQLs.SelectSQL.Text:=StreetSqlText+'(?ID_PLACE)'+OrderBy+'NAME_STREET'+CollateWin1251;
     CityAreaSet.SQLs.SelectSQL.Text:=CityAreaSqlText+'(?ID_PLACE)'+OrderBy+'NAME_CITY_AREA'+CollateWin1251;

     CountryDSetOpen;

     //Отбираем список стран
     CountryBox.Properties.ListSource:=CountrySource;
     CountryBox.Properties.KeyFieldNames:='Id_Country';
     CountryBox.Properties.ListColumns.Add.FieldName:='Name_Country';
     CountryBox.Properties.ListColumns.ColumnByFieldName('Name_Country').Caption:='КРАЇНА';

     //Отбираем список областей
     RegionBox.Properties.ListSource:=RegionSource;
     RegionBox.Properties.KeyFieldNames:='Id_Region';
     RegionBox.Properties.ListColumns.Add.FieldName:='Name_Region';
     RegionBox.Properties.ListColumns.ColumnByFieldName('Name_Region').Caption:='ОБЛАСТЬ';

     //Отбираем список районов обласного значения
     DistrictBox.Properties.ListSource:=DistrictSource;
     DistrictBox.Properties.KeyFieldNames:='Id_District';
     DistrictBox.Properties.ListColumns.Add.FieldName:='Name_District';
     DistrictBox.Properties.ListColumns.ColumnByFieldName('Name_District').Caption:='РАЙОН';

     //Отбираем список населенных пунктов
     PlaceBox.Properties.ListSource:=PlaceSource;
     PlaceBox.Properties.KeyFieldNames:='Id_Place';
     PlaceBox.Properties.ListColumns.Add.FieldName:='Name_Place';
     PlaceBox.Properties.ListColumns.ColumnByFieldName('Name_Place').Caption:='НАС. ПУНКТ';

     //Отбираем список улиц
     StreetBox.Properties.ListSource:=StreetSorce;
     StreetBox.Properties.KeyFieldNames:='Id_Street';
     StreetBox.Properties.ListColumns.Add.FieldName:='Name_Street';
     StreetBox.Properties.ListColumns.ColumnByFieldName('Name_Street').Caption:='ВУЛИЦЯ';

     CityAreaBox.Properties.ListSource:=CityAreaSource;
     CityAreaBox.Properties.KeyFieldNames:='Id_City_Area';
     CityAreaBox.Properties.ListColumns.Add.FieldName:='Name_City_Area';
     CityAreaBox.Properties.ListColumns.ColumnByFieldName('Name_City_Area').Caption:='РАЙОН МІСТА';

     if IdAdress=-1 then
     begin
         //Заполняем поля "Страна", "Область", "Нас. пункт" значениями по умолчанию
         DSetConst.Close;
         DSetConst.SQLs.SelectSQL.Text:='select * from bs_consts';
         DSetConst.Open;
         if VarIsNull(DSetConst['ID_COUNTRY']) then
            agMessageDlg('Увага!', 'Не введено ідентифікатор КРАЇНИ!', mtInformation, [mbOK])
         else CountryBox.EditValue:=DSetConst['ID_COUNTRY'];

         if VarIsNull(DSetConst['ID_REGION']) then
            agMessageDlg('Увага!', 'Не введено ідентифікатор РЕГІОНУ!', mtInformation, [mbOK])
         else RegionBox.EditValue:=DSetConst['ID_REGION'];

         if VarIsNull(DSetConst['ID_PLACE']) then
            agMessageDlg('Увага!', 'Не введено ідентифікатор МІСТА!', mtInformation, [mbOK])
         else PlaceBox.EditValue:=DSetConst['ID_PLACE'];
     end
     else
     begin
        AdresSet.Close;
        AdresSet.SQLs.SelectSQL.Text:='SELECT * FROM ADR_ADRESS_SEL('+IntToStr(IdAdress)+')';
        AdresSet.Open;
        CountryBox.EditValue:=AdresSet['ID_COUNTRY'];
        RegionBox.EditValue:=AdresSet['ID_REGION'];
        DistrictBox.EditValue:=AdresSet['ID_DISTRICT'];
        PlaceBox.EditValue:=AdresSet['ID_PLACE'];
        StreetBox.EditValue:=AdresSet['ID_STREET'];
        CityAreaBox.EditValue:=AdresSet['ID_CITY_AREA'];
        PrIdK:=AdresSet['ID_ADR_PK'];
     end;
   end;
   
   //Убираем панель со страной, областью, районом, населенным пунктом
   HidePanel(True);
   lstImage.GetBitmap(0, imgSplitter.Picture.Bitmap);
end;

function TfrmAdress.IsInteger(inKey:Char):Boolean;
begin
  if ((inKey in ['0'..'9']) or (inKey=#8)) then Result:=True
  else Result:=False;
end;

function TfrmAdress.CheckData:Boolean;
begin
   Result:=True;
   if VarIsNull(CountryBox.EditValue) then
   begin
      CountryBox.Style.Color:=clRed;
      agMessageDlg(WarningText, 'Ви не обрали країну!', mtInformation, [mbOK]);
      Result:=False;
   end;

   if VarIsNull(RegionBox.EditValue) then
   begin
      RegionBox.Style.Color:=clRed;
      agMessageDlg(WarningText, 'Ви не обрали область!', mtInformation, [mbOK]);
      Result:=False;
   end;

   if VarIsNull(PlaceBox.EditValue) then
   begin
      PlaceBox.Style.Color:=clRed;
      agMessageDlg(WarningText, 'Ви не обрали нас. пункт!', mtInformation, [mbOK]);
      Result:=False;
   end;

   if VarIsNull(StreetBox.EditValue) then
   begin
      StreetBox.Style.Color:=clRed;
      agMessageDlg(WarningText, 'Ви не обрали вулицю!', mtInformation, [mbOK]);
      Result:=False;
   end;
end;

procedure TfrmAdress.BoxKeyPress(inTextEdit:TcxTextEdit; inKey:Char);
var s:string;
begin
   if inKey<>#8 then inTextEdit.Text:=inTextEdit.Text+inKey
   else
   begin
      if inTextEdit.Text<>'' then
      begin
         s:=inTextEdit.Text;
         Delete(s, Length(s), 1);
         inTextEdit.Text:=s;
      end;
   end;
end;

procedure TfrmAdress.HidePanel(IsHide:Boolean);
var i:Integer;
begin
    with pnlUpper do
    begin
      for i:=0 to ComponentCount-1 do
      begin
         if Components[i].ClassType=TcxLabel
            then (Components[i] as TcxLabel).Visible:=not IsHide
            else if Components[i].ClassType=TcxLookupComboBox
                 then (Components[i] as TcxLookupComboBox).Visible:=not IsHide
                 else if Components[i].ClassType=TcxButton
                      then (Components[i] as TcxButton).Visible:=not IsHide;
      end;
    end;
    pnlUpper.Visible:=not IsHide;
end;

procedure TfrmAdress.ActOkExecute(Sender: TObject);
begin
    try
      with DmA do
      begin
         ResAdres:=VarArrayCreate([0, 3], varVariant);
         if StreetBox.EditText='' then ResAdres[0]:=-1
         else
         begin
            ResAdres[0]:=StreetBox.EditValue;
            ResAdres[1]:=StreetBox.EditText;
         end;
         if CityAreaBox.EditText='' then ResAdres[2]:=-1
         else
         begin
           ResAdres[2]:=CityAreaBox.EditValue;
           ResAdres[3]:=CityAreaBox.EditText;
         end;
         ModalResult:=mrOk;
      end;
    except on E:Exception
           do begin
                agMessageDlg(WarningText, E.Message, mtInformation, [mbOK]);
           end;
    end;
end;

procedure TfrmAdress.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DmA.Free;
   if FormStyle = fsMDIChild then action:=caFree
end;

procedure TfrmAdress.ActCancelExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfrmAdress.btnSprStreetClick(Sender: TObject);
var sParam:TSpravParams;
    frm:TfrmSprav;
begin
    sParam.FormCaption := 'Довідник вулиць';
    sParam.SelectText := StreetSqlText+'('+IntToStr(PlaceBox.EditValue)+')'+OrderBy+'NAME_STREET'+CollateWin1251;
    sParam.NameFields := 'name_street,id_street';
    sParam.FieldsCaption := 'Вулиця';
    sParam.KeyField := 'id_street';
    sParam.ReturnFields := 'id_street,name_street';
    sParam.FilterFields:='name_street';
    sParam.FilterCaptions:='Назва вулиці';
    sParam.DbHandle:=DmA.AdrDB.Handle;
    sParam.NameClass:='TfrmEditStreet';
    sParam.AddInfo:=VarArrayCreate([0, 3], varVariant);
    sParam.AddInfo[0]:=RegionBox.EditValue;
    sParam.AddInfo[1]:=DistrictBox.EditValue;
    sParam.AddInfo[2]:=PlaceBox.EditValue;
    sParam.AddInfo[3]:=CountryBox.EditValue;
    sParam.DeleteProcName:='BS_STREET_DEL';
    sParam.frmButtons:=[fbAdd,fbModif,fbDelete,fbRefresh,fbSelect,fbExit];
    frm:=TfrmSprav.Create(Self, sParam);
    if frm.ShowModal=mrOk then
    begin
       DmA.StreetDSetOpen;
       StreetBox.EditValue:=frm.Res[0];
    end;
    frm.Free;
end;

procedure TfrmAdress.FormShow(Sender: TObject);
var ApW, ApH:SmallInt;
begin
   Self.Height:=Self.Height-pnlHeight;
   frmHeight:=Self.Height;
   if IsLocateStreet then StreetBox.SetFocus
   else CityAreaBox.SetFocus;
   ApW:=Round(Application.MainForm.Width/2);
   ApH:=Round(Application.MainForm.Height/2);
   Self.Top:=ApH-Round(Self.Height/2);
   Self.Left:=ApW-Round(Self.Width/2);
end;

procedure TfrmAdress.btnSprCountryClick(Sender: TObject);
var sParam:TSpravParams;
    frm:TfrmSprav;
begin
    sParam.FormCaption := 'Довідник країн';
    sParam.SelectText := DmA.CountrySet.SQLs.SelectSQL.Text;
    sParam.NameFields := 'Name_Country,Id_Country';
    sParam.FieldsCaption := 'Країна';
    sParam.KeyField := 'Id_Country';
    sParam.ReturnFields := 'Id_Country,Name_Country';
    sParam.FilterFields:='Name_Country';
    sParam.FilterCaptions:='Назва країни';
    sParam.DbHandle:=DmA.AdrDB.Handle;
    sParam.NameClass:='TfrmEditCountry';
    sParam.DeleteProcName:='ADR_COUNTRY_D';
    sParam.frmButtons:=[fbAdd,fbModif,fbDelete,fbRefresh,fbSelect,fbExit];
    frm:=TfrmSprav.Create(Self, sParam);
    if frm.ShowModal=mrOk then
    begin
       if DmA.CountrySet.Active then DmA.CountrySet.Close;
       DmA.CountrySet.Open;
       CountryBox.EditValue:=frm.Res[0];
    end;
    frm.Free;
end;

procedure TfrmAdress.imgSplitterClick(Sender: TObject);
begin
   if pnlUpper.Visible then
   begin
      HidePanel(True);
      Self.Height:=frmHeight;
      lstImage.GetBitmap(0, imgSplitter.Picture.Bitmap);
   end
   else
   begin
      HidePanel(False);
      Self.Height:=frmHeight+pnlHeight;
      lstImage.GetBitmap(1, imgSplitter.Picture.Bitmap);
   end;
end;

procedure TfrmAdress.CountryBoxPropertiesEditValueChanged(Sender: TObject);
begin
   if ((DmA.CountrySet.Active) and (CountryBox.EditText<>'')) then
   begin
      if DmA.CountrySet.Locate('NAME_COUNTRY', CountryBox.EditText, []) then
      begin
         CountryBox.EditValue:=DmA.CountrySet['ID_COUNTRY'];
      end
      else
      begin
         CountryBox.EditValue:=null;
         CountryBox.EditText:='';
      end;
   end;
end;

procedure TfrmAdress.CountryBoxPropertiesChange(Sender: TObject);
begin
   GlobalBoxFilter(CountryBox, 'NAME_COUNTRY');
   RegionBox.Enabled:=not (CountryBox.Text='');
   if not RegionBox.Enabled then RegionBox.EditValue:=null;
   btnSprRegion.Enabled:=RegionBox.Enabled;
end;

procedure TfrmAdress.btnSprRegionClick(Sender: TObject);
var sParam:TSpravParams;
    frm:TfrmSprav;
begin
    sParam.FormCaption := 'Довідник областей';
    sParam.SelectText := RegionSqlText+ '('+IntToStr(CountryBox.EditValue)+')'+OrderBy+'NAME_REGION'+CollateWin1251;
    sParam.NameFields := 'Name_Region,Id_Region';
    sParam.FieldsCaption := 'Область';
    sParam.KeyField := 'Id_Region';
    sParam.ReturnFields := 'Id_Region,Name_Region';
    sParam.FilterFields:='Name_Region';
    sParam.FilterCaptions:='Назва області';
    sParam.DbHandle:=DmA.AdrDB.Handle;
    sParam.NameClass:='TfrmEditRegion';
    sParam.DeleteProcName:='ADR_REGION_D';
    sParam.AddInfo:=CountryBox.EditValue;
    sParam.frmButtons:=[fbAdd,fbModif,fbDelete,fbRefresh,fbSelect,fbExit];
    frm:=TfrmSprav.Create(Self, sParam);
    if frm.ShowModal=mrOk then
    begin
       if DmA.RegionSet.Active then DmA.RegionSet.Close;
       DmA.RegionSet.Open;
       RegionBox.EditValue:=frm.Res[0];
    end;
    frm.Free;
end;

procedure TfrmAdress.btnSprDistrictClick(Sender: TObject);
var sParam:TSpravParams;
    frm:TfrmSprav;
begin
    sParam.FormCaption := 'Довідник район';
    sParam.SelectText := DistrictSqlText+'('+IntToStr(RegionBox.EditValue)+')'+OrderBy+'NAME_DISTRICT'+CollateWin1251;
    sParam.NameFields := 'Name_District,Id_District';
    sParam.FieldsCaption := 'Район';
    sParam.KeyField := 'Id_District';
    sParam.ReturnFields := 'Id_District,Name_District';
    sParam.FilterFields:='Name_District';
    sParam.FilterCaptions:='Назва раойну';
    sParam.DbHandle:=DmA.AdrDB.Handle;
    sParam.DeleteProcName:='ADR_DISTRICT_D';
    sParam.AddInfo:=VarArrayCreate([0, 1], varVariant);
    sParam.AddInfo[0]:=CountryBox.EditValue;
    sParam.AddInfo[1]:=RegionBox.EditValue;
    sParam.NameClass:='TfrmEditDistrict';
    sParam.frmButtons:=[fbAdd,fbModif,fbDelete,fbRefresh,fbSelect,fbExit];
    frm:=TfrmSprav.Create(Self, sParam);
    if frm.ShowModal=mrOk then
    begin
       if DmA.DistrictSet.Active then DmA.DistrictSet.Close;
       DmA.DistrictSet.Open;
       DistrictBox.EditValue:=frm.Res[0];
    end;
    frm.Free;
end;

procedure TfrmAdress.btnSprPlaceClick(Sender: TObject);
var sParam:TSpravParams;
    frm:TfrmSprav;
    str:String;
begin
    if VarIsNull(DistrictBox.EditValue) then str:='NULL'
    else str:=IntToStr(DistrictBox.EditValue);
    sParam.FormCaption := 'Довідник населених пуктів';
    sParam.SelectText := PlaceSqlText+'('+IntToStr(RegionBox.EditValue)+','+str+')'+OrderBy+'NAME_PLACE'+CollateWin1251;
    sParam.NameFields := 'Name_Place,Id_Place';
    sParam.FieldsCaption := 'Населений пункт';
    sParam.KeyField := 'Id_Place';
    sParam.ReturnFields := 'Id_Place,Name_Place';
    sParam.FilterFields:='Name_Place';
    sParam.FilterCaptions:='Назва нас. пункту';
    sParam.DbHandle:=DmA.AdrDB.Handle;
    sParam.frmButtons:=[fbAdd,fbModif,fbDelete,fbRefresh,fbSelect,fbExit];
    sParam.DeleteProcName:='ADR_PLACE_D';
    sParam.NameClass:='TfrmEditPlace';
    sParam.AddInfo:=VarArrayCreate([0, 2], varVariant);
    sParam.AddInfo[0]:=CountryBox.EditValue;
    sParam.AddInfo[1]:=RegionBox.EditValue;
    sParam.AddInfo[2]:=DistrictBox.EditValue;
    frm:=TfrmSprav.Create(Self, sParam);
    if frm.ShowModal=mrOk then
    begin
       if DmA.PlaceSet.Active then DmA.PlaceSet.Close;
       DmA.PlaceSet.Open;
       PlaceBox.EditValue:=frm.Res[0];
    end;
    frm.Free;
end;

procedure TfrmAdress.PlaceBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Ord(Key)=VK_F12) and (ssShift in Shift)) then ShowInfoByBox(PlaceBox);
end;

procedure TfrmAdress.CountryBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Ord(Key)=VK_F12) and (ssShift in Shift)) then ShowInfoByBox(CountryBox);
end;

procedure TfrmAdress.RegionBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Ord(Key)=VK_F12) and (ssShift in Shift)) then ShowInfoByBox(RegionBox);
end;

procedure TfrmAdress.DistrictBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Ord(Key)=VK_F12) and (ssShift in Shift)) then ShowInfoByBox(DistrictBox);
end;

procedure TfrmAdress.CountryBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Ord(Key)=VK_RETURN) and (ssCtrl in Shift)) then btnSprCountryClick(Sender);
end;

procedure TfrmAdress.RegionBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Ord(Key)=VK_RETURN) and (ssCtrl in Shift)) then btnSprRegionClick(Sender);
end;

procedure TfrmAdress.DistrictBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Ord(Key)=VK_RETURN) and (ssCtrl in Shift)) then btnSprDistrictClick(Sender);
end;

procedure TfrmAdress.StreetBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Ord(Key)=VK_RETURN) and (ssCtrl in Shift)) then btnSprStreetClick(Sender);
end;

procedure TfrmAdress.StreetTextKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Ord(Key)=VK_F12) and (ssShift in Shift)) then ShowInfoByBox(StreetBox);
end;

procedure TfrmAdress.StreetTextKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Ord(Key)=VK_RETURN) and (ssCtrl in Shift)) then btnSprStreetClick(Sender);
end;

procedure TfrmAdress.RegionBoxPropertiesChange(Sender: TObject);
begin
   GlobalBoxFilter(RegionBox, 'NAME_REGION');
   DistrictBox.Enabled:=not (RegionBox.Text='');
   if not DistrictBox.Enabled then DistrictBox.EditValue:=null;
   btnSprDistrict.Enabled:=DistrictBox.Enabled;
   PlaceBox.Enabled:=not (RegionBox.Text='');
   if not PlaceBox.Enabled then PlaceBox.EditValue:=null;
   btnSprPlace.Enabled:=PlaceBox.Enabled;
end;

procedure TfrmAdress.DistrictBoxPropertiesChange(Sender: TObject);
begin
   GlobalBoxFilter(DistrictBox, 'NAME_DISTRICT');
end;

procedure TfrmAdress.PlaceBoxPropertiesChange(Sender: TObject);
begin
   GlobalBoxFilter(PlaceBox, 'NAME_PLACE');
   CityAreaBox.Enabled:=not (PlaceBox.Text='');
   if not CityAreaBox.Enabled then CityAreaBox.EditValue:=null;
   btnSprCityArea.Enabled:=CityAreaBox.Enabled;
   StreetBox.Enabled:=not (PlaceBox.Text='');
   if not StreetBox.Enabled then StreetBox.EditValue:=null;
   btnSprStreet.Enabled:=StreetBox.Enabled;
end;

procedure TfrmAdress.StreetBoxPropertiesChange(Sender: TObject);
begin
   GlobalBoxFilter(StreetBox, 'NAME_STREET');
end;

procedure TfrmAdress.StreetBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Ord(Key)=VK_F12) and (ssShift in Shift)) then ShowInfoByBox(StreetBox);
end;

procedure TfrmAdress.CityAreaBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Ord(Key)=VK_F12) and (ssShift in Shift)) then ShowInfoByBox(CityAreaBox);
end;

procedure TfrmAdress.CityAreaBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Ord(Key)=VK_RETURN) and (ssCtrl in Shift)) then btnSprCityAreaClick(Sender);
end;

procedure TfrmAdress.btnSprCityAreaClick(Sender: TObject);
var sParam:TSpravParams;
    frm:TfrmSprav;
begin
    sParam.FormCaption := 'Довідник районів міста';
    sParam.SelectText := CityAreaSqlText+'('+IntToStr(PlaceBox.EditValue)+')'+OrderBy+'NAME_CITY_AREA'+CollateWin1251;
    sParam.NameFields := 'Name_City_Area,Id_City_Area';
    sParam.FieldsCaption := 'Район міста';
    sParam.KeyField := 'Id_City_Area';
    sParam.ReturnFields := 'Id_City_Area,Name_City_Area';
    sParam.FilterFields:='Name_City_Area';
    sParam.FilterCaptions:='Район міста';
    sParam.DbHandle:=DmA.AdrDB.Handle;
    sParam.AddInfo:=VarArrayCreate([0, 3], varVariant);
    sParam.AddInfo[0]:=RegionBox.EditValue;
    sParam.AddInfo[1]:=DistrictBox.EditValue;
    sParam.AddInfo[2]:=PlaceBox.EditValue;
    sParam.AddInfo[3]:=CountryBox.EditValue;
    sParam.frmButtons:=[fbAdd,fbModif,fbDelete,fbRefresh,fbSelect,fbExit];
    sParam.DeleteProcName:='BS_CITY_AREA_DEL';
    sParam.NameClass:='TfrmEditCityArea';
    frm:=TfrmSprav.Create(Self, sParam);
    if frm.ShowModal=mrOk then
    begin
       if DmA.CityAreaSet.Active then DmA.CityAreaSet.Close;
       DmA.CityAreaSet.Open;
       CityAreaBox.EditValue:=frm.Res[0];
    end;
    frm.Free;
end;

procedure TfrmAdress.RegionBoxPropertiesEditValueChanged(Sender: TObject);
begin
   if ((DmA.RegionSet.Active) and (RegionBox.EditText<>'')) then
   begin
      if DmA.RegionSet.Locate('NAME_REGION', RegionBox.EditText, []) then
      begin
         RegionBox.EditValue:=DmA.RegionSet['ID_REGION'];
      end
      else
      begin
         RegionBox.EditValue:=null;
      end;
   end;
end;

procedure TfrmAdress.DistrictBoxPropertiesEditValueChanged(
  Sender: TObject);
begin
   if ((DmA.DistrictSet.Active) and (DistrictBox.EditText<>'')) then
   begin
      if DmA.DistrictSet.Locate('NAME_DISTRICT', DistrictBox.EditText, []) then
      begin
         DistrictBox.EditValue:=DmA.DistrictSet['ID_DISTRICT'];
      end
      else
      begin
         DistrictBox.EditValue:=null;
      end;
   end;
end;

procedure TfrmAdress.PlaceBoxPropertiesEditValueChanged(Sender: TObject);
begin
   if ((DmA.PlaceSet.Active) and (PlaceBox.EditText<>'')) then
   begin
      if DmA.PlaceSet.Locate('NAME_PLACE', PlaceBox.EditText, []) then
      begin
         PlaceBox.EditValue:=DmA.PlaceSet['ID_PLACE'];
      end
      else
      begin
         PlaceBox.EditValue:=null;
      end;
   end;
end;

procedure TfrmAdress.CityAreaBoxPropertiesEditValueChanged(
  Sender: TObject);
begin
   if ((DmA.CityAreaSet.Active) and (CityAreaBox.EditText<>'')) then
   begin
      if DmA.CityAreaSet.Locate('NAME_CITY_AREA', CityAreaBox.EditText, []) then
      begin
         CityAreaBox.EditValue:=DmA.CityAreaSet['ID_CITY_AREA'];
      end
      else
      begin
         CityAreaBox.EditValue:=null;
      end;
   end;
end;

procedure TfrmAdress.StreetBoxPropertiesEditValueChanged(Sender: TObject);
begin
   if ((DmA.CityAreaSet.Active) and (StreetBox.EditText<>'')) then
   begin
      if DmA.StreetSet.Locate('NAME_STREET', StreetBox.EditText, []) then
      begin
         StreetBox.EditValue:=DmA.StreetSet['ID_STREET'];
      end
      else
      begin
         StreetBox.EditValue:=null;
      end;
   end;
end;

procedure TfrmAdress.PlaceBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Ord(Key)=VK_RETURN) and (ssCtrl in Shift)) then btnSprPlaceClick(Sender);
end;

procedure TfrmAdress.lblCountryClick(Sender: TObject);
begin
   btnSprCountryClick(Sender);
end;

procedure TfrmAdress.lblRegionClick(Sender: TObject);
begin
   btnSprRegionClick(Sender);
end;

procedure TfrmAdress.lblDistrictClick(Sender: TObject);
begin
   btnSprDistrictClick(Sender);
end;

procedure TfrmAdress.lblPlaceClick(Sender: TObject);
begin
   btnSprPlaceClick(Sender);
end;

procedure TfrmAdress.lblCityAreaClick(Sender: TObject);
begin
   btnSprCityAreaClick(Sender);
end;

procedure TfrmAdress.lblStreetClick(Sender: TObject);
begin
   btnSprStreetClick(Sender);
end;

procedure TfrmAdress.lblCountryMouseEnter(Sender: TObject);
begin
   Screen.Cursor:=crHandPoint;
end;

procedure TfrmAdress.lblCountryMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

procedure TfrmAdress.lblRegionMouseEnter(Sender: TObject);
begin
   Screen.Cursor:=crHandPoint;
end;

procedure TfrmAdress.lblRegionMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

procedure TfrmAdress.lblDistrictMouseEnter(Sender: TObject);
begin
   Screen.Cursor:=crHandPoint;
end;

procedure TfrmAdress.lblDistrictMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

procedure TfrmAdress.lblPlaceMouseEnter(Sender: TObject);
begin
   Screen.Cursor:=crHandPoint;
end;

procedure TfrmAdress.lblPlaceMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

procedure TfrmAdress.lblCityAreaMouseEnter(Sender: TObject);
begin
   Screen.Cursor:=crHandPoint;
end;

procedure TfrmAdress.lblCityAreaMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

procedure TfrmAdress.lblStreetMouseEnter(Sender: TObject);
begin
   Screen.Cursor:=crHandPoint;
end;

procedure TfrmAdress.lblStreetMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

end.
