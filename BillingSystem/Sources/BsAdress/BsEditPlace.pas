unit BsEditPlace;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, DB, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, ActnList, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, StdCtrls,
  cxButtons, AdrEdit, cxCheckBox, BsAdrSpr, BsAdrConsts, BaseTypes;

type
  TfrmEditPlace = class(TEditForm)
    btnOk: TcxButton;
    btnCancel: TcxButton;
    EditDB: TpFIBDatabase;
    eTrRead: TpFIBTransaction;
    eTrWrite: TpFIBTransaction;
    eStoredProc: TpFIBStoredProc;
    EDSet: TpFIBDataSet;
    ActionList1: TActionList;
    ActOk: TAction;
    ActCancel: TAction;
    PlaceEdit: TcxTextEdit;
    lblPlace: TcxLabel;
    lblTypepPlace: TcxLabel;
    lblRegion: TcxLabel;
    TypePlaceBox: TcxLookupComboBox;
    RegionBox: TcxLookupComboBox;
    btnTypePlace: TcxButton;
    btnRegion: TcxButton;
    TypeRegionDSet: TpFIBDataSet;
    RegionDSet: TpFIBDataSet;
    TypeRegionDS: TDataSource;
    RegionDS: TDataSource;
    lblDistrict: TcxLabel;
    DistrictBox: TcxLookupComboBox;
    btnDistrict: TcxButton;
    DistrictDSet: TpFIBDataSet;
    DistrictDS: TDataSource;
    lblZip: TcxLabel;
    ZipBegEdit: TcxTextEdit;
    cxLabel1: TcxLabel;
    ZipEndEdit: TcxTextEdit;
    chZipEqual: TcxCheckBox;
    procedure FormShow(Sender: TObject);
    procedure ActCancelExecute(Sender: TObject);
    procedure ActOkExecute(Sender: TObject);
    procedure ZipEndEditKeyPress(Sender: TObject; var Key: Char);
    procedure ZipBegEditKeyPress(Sender: TObject; var Key: Char);
    procedure chZipEqualPropertiesChange(Sender: TObject);
    procedure ZipBegEditPropertiesChange(Sender: TObject);
    procedure TypePlaceBoxPropertiesChange(Sender: TObject);
    procedure RegionBoxPropertiesChange(Sender: TObject);
    procedure DistrictBoxPropertiesChange(Sender: TObject);
    procedure btnTypePlaceClick(Sender: TObject);
    procedure btnRegionClick(Sender: TObject);
    procedure btnDistrictClick(Sender: TObject);
  private
    { Private declarations }
    function CheckData:Boolean;
  public
    { Public declarations }
  end;

var
  frmEditPlace: TfrmEditPlace;

implementation

uses pFIBProps;

{$R *.dfm}

procedure TfrmEditPlace.FormShow(Sender: TObject);
begin
  try
     TypeRegionDSet.Close;
     TypeRegionDSet.SQLs.SelectSQL.Text:=PlaceTypeSqlText;
     TypeRegionDSet.Open;

     RegionDSet.Close;
     RegionDSet.SQLs.SelectSQL.Text:=RegionSqlText+'('+IntToStr(AddInfo[0])+')'+OrderBy+'NAME_REGION'+CollateWin1251;
     RegionDSet.Open;

     DistrictDSet.Close;
     DistrictDSet.SQLs.SelectSQL.Text:=DistrictSqlText+'('+IntToStr(AddInfo[1])+')'+OrderBy+'NAME_DISTRICT'+CollateWin1251;
     DistrictDSet.Open;

     RegionBox.EditValue:=AddInfo[1];
     if not VarIsNull(AddInfo[2]) then DistrictBox.EditValue:=AddInfo[2];
     if not VarIsNull(KeyField) then
     begin
        EDSet.Close;
        EDSet.SQLs.SelectSQL.Text:=frmPlaceSqlText+'('+IntToStr(KeyField)+')';
        EDSet.Open;

        TypePlaceBox.EditValue:=EDSet['ID_PLACE_TYPE'];
        PlaceEdit.Text:=EDSet['NAME_PLACE'];
        if not VarIsNull(EDSet['ID_DISTRICT']) then DistrictBox.EditValue:=EDSet['ID_DISTRICT'];
        if not VarIsNull(EDSet['ZIP_BEG']) then ZipBegEdit.Text:=IntToStr(EDSet['ZIP_BEG']);
        if not VarIsNull(EDSet['ZIP_END']) then ZipEndEdit.Text:=IntToStr(EDSet['ZIP_END']);
        Self.Caption:='Змінити нас. пункт';
     end
     else Self.Caption:='Додати нас. пункт';
  except on E:Exception
         do agMessageDlg(WarningText, E.Message, mtInformation, [mbOK]);
  end;
end;

function TfrmEditPlace.CheckData:Boolean;
begin
   Result:=True;

   if PlaceEdit.Text='' then
   begin
      PlaceEdit.Style.Color:=clRed;
      agMessageDlg(WarningText, 'Ви не заповнили поле "Нас. пункт"!', mtInformation, [mbOK]);
      Result:=False;
   end;

   if VarIsNull(TypePlaceBox.EditValue) then
   begin
      TypePlaceBox.Style.Color:=clRed;
      agMessageDlg(WarningText, 'Ви не обрали тип нас. пункту!', mtInformation, [mbOK]);
      Result:=False;
   end;

   if VarIsNull(RegionBox.EditValue) then
   begin
      RegionBox.Style.Color:=clRed;
      agMessageDlg(WarningText, 'Ви не обрали область!', mtInformation, [mbOK]);
      Result:=False;
   end;

   if (((ZipBegEdit.Text='') and (ZipEndEdit.Text<>'')) or
       ((ZipBegEdit.Text<>'') and (ZipEndEdit.Text=''))) then
   begin
       ZipBegEdit.Style.Color:=clRed;
       ZipEndEdit.Style.Color:=clRed;
       agMessageDlg(WarningText, 'Вкажіть повністю діапозон!', mtInformation, [mbOK]);
       Result:=False;
   end;

   if (((ZipBegEdit.Text<>'') and (ZipEndEdit.Text<>'')) and
       (StrToInt(ZipBegEdit.Text)>StrToInt(ZipEndEdit.Text))) then
   begin
       ZipBegEdit.Style.Color:=clRed;
       ZipEndEdit.Style.Color:=clRed;
       agMessageDlg(WarningText, 'Початок діапозону не можу перевищувати кінець!', mtInformation, [mbOK]);
       Result:=False;
   end;
end;

procedure TfrmEditPlace.ActCancelExecute(Sender: TObject);
begin
   CloseConnect;
   ModalResult:=mrCancel;
end;

procedure TfrmEditPlace.ActOkExecute(Sender: TObject);
begin
   if CheckData then
   begin
     try
       eTrWrite.StartTransaction;
       eStoredProc.StoredProcName:='ADR_PLACE_IU';
       eStoredProc.Prepare;
       eStoredProc.ParamByName('ID_P').AsVariant:=KeyField;
       eStoredProc.ParamByName('NAME_PLACE').AsString:=PlaceEdit.Text;
       eStoredProc.ParamByName('ID_REGION').AsInteger:=RegionBox.EditValue;
       eStoredProc.ParamByName('ID_PLACE_TYPE').AsInteger:=TypePlaceBox.EditValue;
       eStoredProc.ParamByName('ID_DISTRICT').AsVariant:=DistrictBox.EditValue;
       eStoredProc.ExecProc;
       ReturnId:=eStoredProc.FieldByName('ID_PLACE').AsInteger;

       if ((ZipBegEdit.Text<>'') and (ZipEndEdit.Text<>'')) then
       begin
          eStoredProc.StoredProcName:='ADR_ZIP_PLACE_IU';
          eStoredProc.Prepare;
          eStoredProc.ParamByName('ID_PLACE').AsInteger:=ReturnId;
          eStoredProc.ParamByName('ZIP_BEG').AsInteger:=StrToInt(ZipBegEdit.Text);
          eStoredProc.ParamByName('ZIP_END').AsInteger:=StrToInt(ZipEndEdit.Text);
          eStoredProc.ExecProc;
       end;
       eTrWrite.Commit;
       ModalResult:=mrOk;
     except on E:Exception
            do begin
                 agMessageDlg(WarningText, E.Message, mtInformation, [mbOK]);
                 eTrWrite.Rollback;
            end;
     end;
   end;
end;

procedure TfrmEditPlace.ZipEndEditKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0'..'9']) or (Key=#8)) then ZipEndEdit.Properties.ReadOnly:=False
  else ZipEndEdit.Properties.ReadOnly:=True;
end;

procedure TfrmEditPlace.ZipBegEditKeyPress(Sender: TObject; var Key: Char);
begin
     if ((Key in ['0'..'9']) or (Key=#8)) then ZipBegEdit.Properties.ReadOnly:=False
     else ZipBegEdit.Properties.ReadOnly:=True;
end;

procedure TfrmEditPlace.chZipEqualPropertiesChange(Sender: TObject);
begin
   ZipEndEdit.Enabled:=not chZipEqual.Checked;
   if chZipEqual.Checked then ZipEndEdit.Text:=ZipBegEdit.Text;
end;

procedure TfrmEditPlace.ZipBegEditPropertiesChange(Sender: TObject);
begin
   if chZipEqual.Checked then ZipEndEdit.Text:=ZipBegEdit.EditingText;
end;

procedure TfrmEditPlace.TypePlaceBoxPropertiesChange(Sender: TObject);
begin
   GlobalBoxFilter(TypePlaceBox, 'NAME_FULL');
end;

procedure TfrmEditPlace.RegionBoxPropertiesChange(Sender: TObject);
begin
   GlobalBoxFilter(RegionBox, 'NAME_REGION');
end;

procedure TfrmEditPlace.DistrictBoxPropertiesChange(Sender: TObject);
begin
   GlobalBoxFilter(DistrictBox, 'NAME_DISTRICT');
end;

procedure TfrmEditPlace.btnTypePlaceClick(Sender: TObject);
var sParam:TSpravParams;
    frm:TfrmSprav;
begin
    sParam.FormCaption := 'Довідник типів нас. пунктів';
    sParam.SelectText := TypeRegionDSet.SQLs.SelectSQL.Text;
    sParam.NameFields := 'Name_Full,ID_TYPE_PLACE';
    sParam.FieldsCaption := 'Тип нас. пункту';
    sParam.KeyField := 'ID_TYPE_PLACE';
    sParam.ReturnFields := 'ID_TYPE_PLACE,Name_Full';
    sParam.FilterFields:='Name_Full';
    sParam.FilterCaptions:='Тип нас. пункту';
    sParam.DbHandle:=EditDB.Handle;
    sParam.frmButtons:=[fbRefresh,fbSelect,fbExit];
    frm:=TfrmSprav.Create(Self, sParam);
    if frm.ShowModal=mrOk then
    begin
       if TypeRegionDSet.Active then TypeRegionDSet.Close;
       TypeRegionDSet.Open;
       TypePlaceBox.EditValue:=frm.Res[0];
    end;
    frm.Free;
end;

procedure TfrmEditPlace.btnRegionClick(Sender: TObject);
var sParam:TSpravParams;
    frm:TfrmSprav;
begin
    sParam.FormCaption := 'Довідник областей';
    sParam.SelectText := RegionDSet.SQLs.SelectSQL.Text;
    sParam.NameFields := 'Name_Region,Id_Region';
    sParam.FieldsCaption := 'Область';
    sParam.KeyField := 'Id_Region';
    sParam.ReturnFields := 'Id_Region,Name_Region';
    sParam.FilterFields:='Name_Region';
    sParam.FilterCaptions:='Назва області';
    sParam.DbHandle:=EditDB.Handle;
    sParam.NameClass:='TfrmEditRegion';
    sParam.DeleteProcName:='ADR_REGION_D';
    sParam.AddInfo:=AddInfo[0];
    sParam.frmButtons:=[fbAdd,fbModif,fbDelete,fbRefresh,fbSelect,fbExit];
    frm:=TfrmSprav.Create(Self, sParam);
    if frm.ShowModal=mrOk then
    begin
       if RegionDSet.Active then RegionDSet.Close;
       RegionDSet.Open;
       RegionBox.EditValue:=frm.Res[0];
    end;
    frm.Free;
end;

procedure TfrmEditPlace.btnDistrictClick(Sender: TObject);
var sParam:TSpravParams;
    frm:TfrmSprav;
begin
    sParam.FormCaption := 'Довідник районів';
    sParam.SelectText := DistrictDSet.SQLs.SelectSQL.Text;
    sParam.NameFields := 'Name_District,Id_District';
    sParam.FieldsCaption := 'Район';
    sParam.KeyField := 'Id_District';
    sParam.ReturnFields := 'Id_District,Name_District';
    sParam.FilterFields:='Name_District';
    sParam.FilterCaptions:='Назва раойну';
    sParam.DbHandle:=EditDB.Handle;
    sParam.DeleteProcName:='ADR_DISTRICT_D';
    sParam.AddInfo:=VarArrayCreate([0, 1], varVariant);
    sParam.AddInfo[0]:=AddInfo[0];
    sParam.AddInfo[1]:=AddInfo[1];
    sParam.NameClass:='TfrmEditDistrict';
    sParam.frmButtons:=[fbAdd,fbModif,fbDelete,fbRefresh,fbSelect,fbExit];
    frm:=TfrmSprav.Create(Self, sParam);
    if frm.ShowModal=mrOk then
    begin
       if DistrictDSet.Active then DistrictDSet.Close;
       DistrictDSet.Open;
       DistrictBox.EditValue:=frm.Res[0];
    end;
    frm.Free;
end;

initialization
     RegisterClass(TfrmEditPlace);

end.
