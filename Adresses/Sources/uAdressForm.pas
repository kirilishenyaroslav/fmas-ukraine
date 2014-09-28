unit uAdressForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, cxControls, cxSplitter, StdCtrls, RXMemDS,
  ActnList, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, uAdr_DataModule, cxCheckBox, ImgList,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxDBEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxDBExtLookupComboBox,
  uFControl, uLabeledFControl, uSpravControl;

type TActiveElement=(aeCountry, aeRegion, aeDistrict, aePlace, aeStreet);

type
  TAdrForm = class(TForm)
    dxBarDockControl1: TdxBarDockControl;
    dxBarManager1: TdxBarManager;
    dxBLB_Add: TdxBarLargeButton;
    dxBLB_Modif: TdxBarLargeButton;
    dxBLB_Del: TdxBarLargeButton;
    dxBLB_Select: TdxBarLargeButton;
    dxBLB_Cancel: TdxBarLargeButton;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    Panel1: TPanel;
    Panel2: TPanel;
    AddAL: TActionList;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    cxSplitter1: TcxSplitter;
    cxSplitter2: TcxSplitter;
    cxGridDistrictView: TcxGridDBTableView;
    cxGridDistrictL: TcxGridLevel;
    cxGridDistrict: TcxGrid;
    cxGridStreetView: TcxGridDBTableView;
    cxGridStreetL: TcxGridLevel;
    cxGridStreet: TcxGrid;
    cxGridPlaceView: TcxGridDBTableView;
    cxGridPlaceL: TcxGridLevel;
    cxGridPlace: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    AddA: TAction;
    AddCountryA: TAction;
    AddRegionA: TAction;
    AddDistrictA: TAction;
    AddPlaceA: TAction;
    dxBPM_Add: TdxBarPopupMenu;
    dxBPM_Modif: TdxBarPopupMenu;
    dxBPM_Del: TdxBarPopupMenu;
    ModifAl: TActionList;
    DelAL: TActionList;
    ModifA: TAction;
    ModifCountryA: TAction;
    ModifRegionA: TAction;
    ModifDistrictA: TAction;
    ModifPlaceA: TAction;
    DeleteA: TAction;
    DelCountryA: TAction;
    DelRegionA: TAction;
    DelDistrictA: TAction;
    DelPlaceA: TAction;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    MainAL: TActionList;
    SelectA: TAction;
    CancelA: TAction;
    DS_District: TDataSource;
    DS_Street: TDataSource;
    DS_Place: TDataSource;
    cxGridDistrictViewDBDistrict_Name: TcxGridDBColumn;
    cxGridStreetViewDBStreet_Name: TcxGridDBColumn;
    cxGridPlaceViewDBPlace_Name: TcxGridDBColumn;
    cxGridPlaceViewDBIsD: TcxGridDBColumn;
    cxGridPlaceViewDBIsR: TcxGridDBColumn;
    cxGridPlaceViewDBIsC: TcxGridDBColumn;
    dxBarLargeButton1: TdxBarLargeButton;
    RefreshA: TAction;
    AddStreetA: TAction;
    ModifStreetA: TAction;
    DelStreetA: TAction;
    dxBarButton13: TdxBarButton;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    DS_Region: TDataSource;
    cxGridStreetViewDBId_street: TcxGridDBColumn;
    ImageList1: TImageList;
    DS_Country: TDataSource;
    qFSC_Country: TqFSpravControl;
    qFSC_Region: TqFSpravControl;
    procedure SelectAExecute(Sender: TObject);
    procedure DeleteAExecute(Sender: TObject);
    procedure DelCountryAExecute(Sender: TObject);
    procedure DelRegionAExecute(Sender: TObject);
    procedure DelDistrictAExecute(Sender: TObject);
    procedure DelPlaceAExecute(Sender: TObject);
    procedure AddAExecute(Sender: TObject);
    procedure AddCountryAExecute(Sender: TObject);
    procedure AddRegionAExecute(Sender: TObject);
    procedure AddDistrictAExecute(Sender: TObject);
    procedure AddPlaceAExecute(Sender: TObject);
    procedure CancelAExecute(Sender: TObject);
    procedure RefreshAExecute(Sender: TObject);
    procedure ModifAExecute(Sender: TObject);
    procedure ModifCountryAExecute(Sender: TObject);
    procedure ModifRegionAExecute(Sender: TObject);
    procedure ModifDistrictAExecute(Sender: TObject);
    procedure ModifPlaceAExecute(Sender: TObject);
    procedure AddStreetAExecute(Sender: TObject);
    procedure ModifStreetAExecute(Sender: TObject);
    procedure SpCB_CoutryEnter(Sender: TObject);
    procedure cxDBCB_RegionEnter(Sender: TObject);
    procedure cxGridDistrictEnter(Sender: TObject);
    procedure cxGridPlaceEnter(Sender: TObject);
    procedure cxGridStreetEnter(Sender: TObject);
    procedure DelStreetAExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxGridDistrictViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridStreetViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridPlaceViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridStreetViewDblClick(Sender: TObject);
    procedure qFSC_CountryOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_RegionOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_CountryChange(Sender: TObject);
    procedure qFSC_RegionChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    ActElem: TActiveElement;
    Input, Output: TRxMemoryData;
    id_region, id_district, id_place, id_street: variant;
    AdressDM: TAdrDM;
    constructor Create(AOwner: TComponent; DataModule: TAdrDM;
              Input: TRxMemoryData = nil; Output: TRxMemoryData = nil);reintroduce;
    { Public declarations }
  end;

var
  AdrForm: TAdrForm;

implementation

uses uUnivSprav, uAddCountry,uFormControl,uAddRegion, uAddPlace, uAddStreetForm,
     uAddDistrict, qFTools;

constructor TAdrForm.Create(AOwner: TComponent; DataModule: TAdrDM; Input: TRxMemoryData = nil; Output: TRxMemoryData = nil);
begin
    inherited Create(AOwner);
    Self.AdressDM := DataModule;
    Self.Input := Input;
    Self.Output := Output;
//    cxDE_ActDate.Date := Input['ActualDate'];
    DS_District.DataSet := AdressDM.pFIBDS_SelectDistrict;
//    DS_Region.DataSet := AdressDM.pFIBDS_SelectRegion;
    DS_Place.DataSet := AdressDM.pFIBDS_SelectPlace;
    DS_Street.DataSet := AdressDM.pFIBDS_SelectStreet;
//    DS_Country.DataSet := AdressDM.pFIBDS_SelectCountry;
//    AdressDM.pFIBDS_SelectCountry.Open;
    if Input <> nil then
    begin
        Input.Open;
        SelectA.Enabled := (Input['Select'] <> 0);
        if (Input['Select'] = 0) then
         dxBLB_Select.Visible := ivNever;

        cxGridStreetView.OptionsSelection.MultiSelect:=(Input['Select'] = 2);
    end;
  qFAutoLoadFromRegistry(Self,nil);
  AdressDM.pFIBDS_SelectDistrict.Close;
  AdressDM.pFIBDS_SelectDistrict.ParamByName('id_region').AsInteger:=qFSC_Region.Value;
  AdressDM.pFIBDS_SelectDistrict.Open;
  AdressDM.pFIBDS_SelectPlace.Close;
  AdressDM.pFIBDS_SelectPlace.ParamByName('id_region').AsInteger:=qFSC_Region.Value;
  AdressDM.pFIBDS_SelectPlace.ParamByName('id_district').AsVariant:=  AdressDM.pFIBDS_SelectDistrict['id_district'];
  AdressDM.pFIBDS_SelectPlace.Open;
  //    if not VarIsNull(AdressDM.pFIBDS_SelectRegion['name_region'])
//     then cxDBCB_Region.Text:=AdressDM.pFIBDS_SelectRegion['name_region'];
end;
{$R *.dfm}

procedure TAdrForm.SelectAExecute(Sender: TObject);
var i,count:integer;
begin
  if (AdressDM.pFIBDS_SelectStreet.IsEmpty) then
   begin
     ModalResult:=0;
     Exit;
   end;
  Output.Open; 
  if (cxGridStreetView.OptionsSelection.MultiSelect) then
   begin
     count:=cxGridStreetView.Controller.SelectedRowCount;
     for i:=0 to count-1 do
     begin
       Output.Append;
       Output['Id_Street'] := StrToInt(cxGridStreetView.Controller.SelectedRecords[i].Values[0]);
       if VarIsNull(cxGridStreetView.Controller.SelectedRecords[i].Values[1])
        then Output['Name_Adress'] := AdressDM.pFIBDS_SelectPlace['NAME_PLACE']+' '
        else Output['Name_Adress'] := AdressDM.pFIBDS_SelectPlace['NAME_PLACE']+' '+cxGridStreetView.Controller.SelectedRecords[i].Values[1];
       Output.Post;
     end;
   end
  else
   begin
     Output.Append;
     Output['Id_Street'] := StrToInt(cxGridStreetView.Controller.SelectedRecords[0].Values[0]);
     if VarIsNull(cxGridStreetView.Controller.SelectedRecords[0].Values[1])
      then Output['Name_Adress'] := AdressDM.pFIBDS_SelectPlace['NAME_PLACE']+' '
      else Output['Name_Adress'] := AdressDM.pFIBDS_SelectPlace['NAME_PLACE']+' '+cxGridStreetView.Controller.SelectedRecords[0].Values[1];
     Output.Post;
   end;
  ModalResult:=mrOk;
end;

procedure TAdrForm.DeleteAExecute(Sender: TObject);
begin
  case ActElem of
    aeCountry  : DelCountryAExecute(Sender);
    aeRegion   : DelRegionAExecute(Sender);
    aeDistrict : DelDistrictAExecute(Sender);
    aePlace    : DelPlaceAExecute(Sender);
    aeStreet   : DelStreetAExecute(Sender);
  end;
end;

procedure TAdrForm.DelCountryAExecute(Sender: TObject);
begin
  try


    with AdressDM do
    begin
      pFIBT_WriteAdr.StartTransaction;
      pFIBQ_Delete.SQL.Clear;
      pFIBQ_Delete.SQL.Add(C_Del_SQL);
      pFIBQ_Delete.ParamByName('where').AsInteger:=pFIBDS_SelectCountry['id_country'];
      pFIBQ_Delete.ExecProc;
      pFIBT_WriteAdr.Commit;
    end;
  except
      AdressDM.pFIBT_WriteAdr.Rollback;

  end;
  RefreshAExecute(dxBarLargeButton1);
end;

procedure TAdrForm.DelRegionAExecute(Sender: TObject);
begin
  try


    with AdressDM do
    begin
      pFIBT_WriteAdr.StartTransaction;
      pFIBQ_Delete.SQL.Clear;
      pFIBQ_Delete.SQL.Add(R_Del_SQL);
      pFIBQ_Delete.ParamByName('where').AsInteger:=pFIBDS_SelectRegion['id_region'];
      pFIBQ_Delete.ExecProc;
      pFIBT_WriteAdr.Commit;
    end;
  except
      AdressDM.pFIBT_WriteAdr.Rollback;

  end;
  RefreshAExecute(dxBarLargeButton1);
end;

procedure TAdrForm.DelDistrictAExecute(Sender: TObject);
begin
  try


    with AdressDM do
    begin
      pFIBT_WriteAdr.StartTransaction;
      pFIBQ_Delete.SQL.Clear;
      pFIBQ_Delete.SQL.Add(D_Del_SQL);
      pFIBQ_Delete.ParamByName('where').AsInteger:=pFIBDS_SelectDistrict['id_district'];
      pFIBQ_Delete.ExecProc;
      pFIBT_WriteAdr.Commit;
    end;
  except
      AdressDM.pFIBT_WriteAdr.Rollback;

  end;
  RefreshAExecute(dxBarLargeButton1);
end;

procedure TAdrForm.DelPlaceAExecute(Sender: TObject);
begin
  try


    with AdressDM do
    begin
      pFIBT_WriteAdr.StartTransaction;
      pFIBQ_Delete.SQL.Clear;
      pFIBQ_Delete.SQL.Add(P_Del_SQL);
      pFIBQ_Delete.ParamByName('where').AsInteger:=pFIBDS_SelectPlace['id_place'];
      pFIBQ_Delete.ExecProc;
      pFIBT_WriteAdr.Commit;
    end;
  except
      AdressDM.pFIBT_WriteAdr.Rollback;

  end;
  RefreshAExecute(dxBarLargeButton1);
end;

procedure TAdrForm.DelStreetAExecute(Sender: TObject);
begin
  try


    with AdressDM do
    begin
      pFIBT_WriteAdr.StartTransaction;
      pFIBQ_Delete.SQL.Clear;
      pFIBQ_Delete.SQL.Add(S_Del_SQL);
      pFIBQ_Delete.ParamByName('where').AsInteger:=pFIBDS_SelectStreet['id_street'];
      pFIBQ_Delete.ExecProc;
      pFIBT_WriteAdr.Commit;
    end;
  except
      AdressDM.pFIBT_WriteAdr.Rollback;

  end;
  RefreshAExecute(dxBarLargeButton1);
end;

procedure TAdrForm.AddAExecute(Sender: TObject);
begin
  case ActElem of
    aeCountry  : AddCountryAExecute(Sender);
    aeRegion   : AddRegionAExecute(Sender);
    aeDistrict : AddDistrictAExecute(Sender);
    aePlace    : AddPlaceAExecute(Sender);
    aeStreet   : AddStreetAExecute(Sender);
  end;
end;

procedure TAdrForm.AddCountryAExecute(Sender: TObject);
var ACF:TAdd_Country_Form;
begin
  ACF:=TAdd_Country_Form.Create(Self,AdressDM,fmAdd,Null);
  if ACF.ShowModal=mrOk then
   begin
     with AdressDM do
     begin
       id_region:=pFIBDS_SelectRegion['id_region'];
       id_district:=pFIBDS_SelectDistrict['id_district'];
       id_place:=pFIBDS_SelectPlace['id_place'];
       id_street:=pFIBDS_SelectRegion['id_street'];
     end;
     RefreshAExecute(Sender);
   end;
end;

procedure TAdrForm.AddRegionAExecute(Sender: TObject);
var ARF:TAdd_Region_Form;
begin
  ARF:=TAdd_Region_Form.Create(Self,AdressDM,fmAdd,Null);
  ARF.qFSC_Country.Value:=AdressDM.pFIBDS_SelectCountry['id_country'];
  ARF.qFSC_Country.DisplayText:=AdressDM.pFIBDS_SelectCountry['name_country'];
  if ARF.ShowModal=mrOk then
   begin
     with AdressDM do
     begin
       id_region:=ARF.qFFC_Region.LastId;
       id_district:=pFIBDS_SelectDistrict['id_district'];
       id_place:=pFIBDS_SelectPlace['id_place'];
       id_street:=pFIBDS_SelectStreet['id_street'];
     end;
     RefreshAExecute(Sender);
   end;
end;

procedure TAdrForm.AddDistrictAExecute(Sender: TObject);
var ADF:TAdd_District_Form;
begin
  ADF:=TAdd_District_Form.Create(Self,AdressDM,fmAdd,Null);
  ADF.qFSC_Region.Value:=AdressDM.pFIBDS_SelectRegion['id_region'];
  ADF.qFSC_Region.DisplayText:=AdressDM.pFIBDS_SelectRegion['name_region'];
  if ADF.ShowModal=mrOk then
   begin
     with AdressDM do
     begin
       id_region:=ADF.qFSC_Region.Value;
       id_district:=ADF.qFFC_District.LastId;
       id_place:=pFIBDS_SelectPlace['id_place'];
       id_street:=pFIBDS_SelectStreet['id_street'];
     end;
     RefreshAExecute(Sender);
   end;
end;

procedure TAdrForm.AddPlaceAExecute(Sender: TObject);
var APF:TAdd_Place_Form;
begin
  APF:=TAdd_Place_Form.Create(Self,AdressDM,fmAdd,Null);
  APF.qFSC_Region.Value:=AdressDM.pFIBDS_SelectRegion['id_region'];
  APF.qFSC_Region.DisplayText:=AdressDM.pFIBDS_SelectRegion['name_region'];
  APF.qFSC_District.Value:=AdressDM.pFIBDS_SelectDistrict['id_district'];
  APF.qFSC_District.DisplayText:=AdressDM.pFIBDS_SelectDistrict['name_district'];
  if APF.ShowModal=mrOk then
   begin
     with AdressDM do
     begin
       id_region:=APF.qFSC_Region.Value;
       id_district:=APF.qFSC_District.Value;
       id_place:=APF.qFFC_Place.LastId;
       id_street:=pFIBDS_SelectStreet['id_street'];
     end;
     RefreshAExecute(Sender);
   end;
end;

procedure TAdrForm.AddStreetAExecute(Sender: TObject);
var ASF:TAdd_Street_Form;
begin
  ASF:=TAdd_Street_Form.Create(Self,AdressDM,fmAdd,Null);
  ASF.qFSC_Place.Value:=AdressDM.pFIBDS_SelectPlace['id_place'];
  ASF.qFSC_Place.DisplayText:=AdressDM.pFIBDS_SelectPlace['name_place'];
  if ASF.ShowModal=mrOk then
   begin
     with AdressDM do
     begin
       id_region:=pFIBDS_SelectRegion['id_region'];
       id_district:=pFIBDS_SelectDistrict['id_district'];
       id_place:=ASF.qFSC_Place.Value;
       id_street:=ASF.qFFC_Street.LastId;
     end;
     RefreshAExecute(Sender);
   end;
end;

procedure TAdrForm.CancelAExecute(Sender: TObject);
begin
  Close;
end;

procedure TAdrForm.RefreshAExecute(Sender: TObject);
begin
  with AdressDM do
  begin
    if (Sender=dxBarLargeButton1) then
     begin
       id_region:=pFIBDS_SelectRegion['id_region'];
       id_district:=pFIBDS_SelectDistrict['id_district'];
       id_place:=pFIBDS_SelectPlace['id_place'];
       id_street:=pFIBDS_SelectStreet['id_street'];
     end;
    pFIBDS_SelectRegion.Close;
    pFIBDS_SelectRegion.Open;
    pFIBDS_SelectRegion.Locate('id_region',id_region,[]);
    pFIBDS_SelectDistrict.Locate('id_district',id_district,[]);
    pFIBDS_SelectPlace.Locate('id_place',id_place,[]);
    pFIBDS_SelectStreet.Locate('id_street',id_street,[]);
  end;
//  if not VarIsNull(AdressDM.pFIBDS_SelectRegion['name_region'])
//   then cxDBCB_Region.Text:=AdressDM.pFIBDS_SelectRegion['name_region'];
end;

procedure TAdrForm.ModifAExecute(Sender: TObject);
begin
  case ActElem of
    aeCountry  : ModifCountryAExecute(Sender);
    aeRegion   : ModifRegionAExecute(Sender);
    aeDistrict : ModifDistrictAExecute(Sender);
    aePlace    : ModifPlaceAExecute(Sender);
    aeStreet   : ModifStreetAExecute(Sender);
  end;
end;

procedure TAdrForm.ModifCountryAExecute(Sender: TObject);
var MCF:TAdd_Country_Form;
begin
  MCF:=TAdd_Country_Form.Create(Self,AdressDM,fmModify,AdressDM.pFIBDS_SelectCountry['id_country']);
  with AdressDM do
  begin
    id_region:=pFIBDS_SelectRegion['id_region'];
    id_district:=pFIBDS_SelectDistrict['id_district'];
    id_place:=pFIBDS_SelectPlace['id_place'];
    id_street:=pFIBDS_SelectStreet['id_street'];
  end;

  if MCF.ShowModal=mrOk then
   RefreshAExecute(Sender);
end;

procedure TAdrForm.ModifRegionAExecute(Sender: TObject);
var MRF:TAdd_Region_Form;
begin
  if VarIsNull(AdressDM.pFIBDS_SelectRegion['id_region'])
   then
   begin
     ShowMessage('Не можливо змінити пустий запис!');
     Exit;
   end;
  MRF:=TAdd_Region_Form.Create(Self,AdressDM,fmModify,AdressDM.pFIBDS_SelectRegion['id_region']);
  with AdressDM do
  begin
    id_region:=pFIBDS_SelectRegion['id_region'];
    id_district:=pFIBDS_SelectDistrict['id_district'];
    id_place:=pFIBDS_SelectPlace['id_place'];
    id_street:=pFIBDS_SelectStreet['id_street'];
  end;

  if MRF.ShowModal=mrOk then
   RefreshAExecute(Sender);
end;

procedure TAdrForm.ModifDistrictAExecute(Sender: TObject);
var MDF:TAdd_District_Form;
begin
  if VarIsNull(AdressDM.pFIBDS_SelectDistrict['id_district'])
   then
   begin
     ShowMessage('Не можливо змінити пустий запис!');
     Exit;
   end;
  MDF:=TAdd_District_Form.Create(Self,AdressDM,fmModify,AdressDM.pFIBDS_SelectDistrict['id_district']);

  with AdressDM do
  begin
    id_region:=pFIBDS_SelectRegion['id_region'];
    id_district:=pFIBDS_SelectDistrict['id_district'];
    id_place:=pFIBDS_SelectPlace['id_place'];
    id_street:=pFIBDS_SelectStreet['id_street'];
  end;

  if MDF.ShowModal=mrOk then
   RefreshAExecute(Sender);
end;

procedure TAdrForm.ModifPlaceAExecute(Sender: TObject);
var MPF:TAdd_Place_Form;
begin
  if VarIsNull(AdressDM.pFIBDS_SelectPlace['id_place'])
   then
   begin
     ShowMessage('Не можливо змінити пустий запис!');
     Exit;
   end;
  MPF:=TAdd_Place_Form.Create(Self,AdressDM,fmModify,AdressDM.pFIBDS_SelectPlace['id_place']);

  with AdressDM do
  begin
    id_region:=pFIBDS_SelectRegion['id_region'];
    id_district:=pFIBDS_SelectDistrict['id_district'];
    id_place:=pFIBDS_SelectPlace['id_place'];
    id_street:=pFIBDS_SelectStreet['id_street'];
  end;

  if MPF.ShowModal=mrOk then
   RefreshAExecute(Sender);
end;

procedure TAdrForm.ModifStreetAExecute(Sender: TObject);
var MSF:TAdd_Street_Form;
begin
  if VarIsNull(AdressDM.pFIBDS_SelectStreet['id_street'])
   then
   begin
     ShowMessage('Не можливо змінити пустий запис!');
     Exit;
   end;
  MSF:=TAdd_Street_Form.Create(Self,AdressDM,fmModify,AdressDM.pFIBDS_SelectStreet['id_street']);

  with AdressDM do
  begin
    id_region:=pFIBDS_SelectRegion['id_region'];
    id_district:=pFIBDS_SelectDistrict['id_district'];
    id_place:=pFIBDS_SelectPlace['id_place'];
    id_street:=pFIBDS_SelectStreet['id_street'];
  end;

  if MSF.ShowModal=mrOk then
   RefreshAExecute(Sender);
end;

procedure TAdrForm.SpCB_CoutryEnter(Sender: TObject);
begin
  ActElem:=aeCountry;
end;

procedure TAdrForm.cxDBCB_RegionEnter(Sender: TObject);
begin
  ActElem:=aeRegion;
end;

procedure TAdrForm.cxGridDistrictEnter(Sender: TObject);
begin
  ActElem:=aeDistrict;
end;

procedure TAdrForm.cxGridPlaceEnter(Sender: TObject);
begin
  ActElem:=aePlace;
end;

procedure TAdrForm.cxGridStreetEnter(Sender: TObject);
begin
  ActElem:=aeStreet;
end;


procedure TAdrForm.FormShow(Sender: TObject);
begin
  cxGridStreet.SetFocus;
end;

procedure TAdrForm.cxGridDistrictViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_F12) and (ssShift in Shift) then
   ShowInfo(cxGridDistrictView.DataController.DataSource.DataSet);
end;

procedure TAdrForm.cxGridStreetViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F12) and (ssShift in Shift) then
   ShowInfo(cxGridStreetView.DataController.DataSource.DataSet);
end;

procedure TAdrForm.cxGridPlaceViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F12) and (ssShift in Shift) then
   ShowInfo(cxGridPlaceView.DataController.DataSource.DataSet);
end;

procedure TAdrForm.cxGridStreetViewDblClick(Sender: TObject);
begin
  if (SelectA.Enabled) then SelectA.Execute;
end;

procedure TAdrForm.qFSC_CountryOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:='Довідник країн';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TAdd_Country_Form';
  Params.ModifFormClass:='TAdd_Country_Form';
  Params.TableName:='adr_country';
  Params.Fields:='Name_country,id_country';
  Params.FieldsName:='Назва';
  Params.KeyField:='id_country';
  Params.ReturnFields:='Name_country,id_country';
  Params.DeleteSQL:='execute procedure adr_country_d(:id_country);';
  Params.DBHandle:=Integer(AdressDM.pFIBDB_Adr.Handle);

  OutPut:=TRxMemoryData.Create(self);

  if GetUnivSprav(Params,OutPut)
   then
   begin
     value:=output['id_country'];
     DisplayText:=VarToStr(output['Name_country']);
   end;
end;

procedure TAdrForm.qFSC_RegionOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:='Довідник регіонів';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TAdd_Region_Form';
  Params.ModifFormClass:='TAdd_Region_Form';
  Params.TableName:='adr_region';
  Params.Fields:='Name_region,id_region';
  Params.FieldsName:='Назва';
  Params.KeyField:='id_region';
  Params.ReturnFields:='Name_region,id_region';
  Params.DeleteSQL:='execute procedure adr_region_d(:id_region);';
  Params.DBHandle:=Integer(AdressDM.pFIBDB_Adr.Handle);

  OutPut:=TRxMemoryData.Create(self);

  if GetUnivSprav(Params,OutPut)
   then
   begin
//     ShowInfo(output);
     value:=output['id_region'];
     DisplayText:=VarToStr(output['Name_region']);
   end;
end;

procedure TAdrForm.qFSC_CountryChange(Sender: TObject);
begin
  if not Visible then Exit;
  qFSC_Region.OpenSprav;
end;

procedure TAdrForm.qFSC_RegionChange(Sender: TObject);
begin
  if not Visible then Exit;
  if VarIsNull(qFSC_Region.Value) then Exit;
  AdressDM.pFIBDS_SelectDistrict.Close;
  AdressDM.pFIBDS_SelectDistrict.ParamByName('id_region').AsInteger:=qFSC_Region.Value;
  AdressDM.pFIBDS_SelectDistrict.Open;
  AdressDM.pFIBDS_SelectPlace.Close;
  AdressDM.pFIBDS_SelectPlace.ParamByName('id_region').AsInteger:=qFSC_Region.Value;
  AdressDM.pFIBDS_SelectPlace.ParamByName('id_district').AsVariant:=  AdressDM.pFIBDS_SelectDistrict['id_district'];
  AdressDM.pFIBDS_SelectPlace.Open;
end;

procedure TAdrForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qFAutoSaveIntoRegistry(Self,nil);
end;

end.
