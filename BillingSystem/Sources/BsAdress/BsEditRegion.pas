unit BsEditRegion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, DB, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, ActnList, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, StdCtrls,
  cxButtons, AdrEdit, BaseTypes, BsAdrConsts, BsAdrSpr, cxCheckBox;

type
  TfrmEditRegion = class(TEditForm)
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
    RegionEdit: TcxTextEdit;
    lblRegion: TcxLabel;
    lblTypeRegion: TcxLabel;
    lblCountry: TcxLabel;
    TypeRegionBox: TcxLookupComboBox;
    CountryBox: TcxLookupComboBox;
    btnTypeRegion: TcxButton;
    btnCountry: TcxButton;
    TypeRegionDSet: TpFIBDataSet;
    CountryDSet: TpFIBDataSet;
    TypeRegionDS: TDataSource;
    CountryDS: TDataSource;
    ZipEndEdit: TcxTextEdit;
    cxLabel1: TcxLabel;
    ZipBegEdit: TcxTextEdit;
    lblZip: TcxLabel;
    chZipEqual: TcxCheckBox;
    procedure FormShow(Sender: TObject);
    procedure ActOkExecute(Sender: TObject);
    procedure ActCancelExecute(Sender: TObject);
    procedure TypeRegionBoxPropertiesChange(Sender: TObject);
    procedure CountryBoxPropertiesChange(Sender: TObject);
    procedure btnTypeRegionClick(Sender: TObject);
    procedure btnCountryClick(Sender: TObject);
    procedure chZipEqualPropertiesChange(Sender: TObject);
    procedure ZipBegEditPropertiesChange(Sender: TObject);
    procedure ZipBegEditKeyPress(Sender: TObject; var Key: Char);
    procedure ZipEndEditKeyPress(Sender: TObject; var Key: Char);
  private
      function CheckData:Boolean;

  public
    { Public declarations }
  end;

var
  frmEditRegion: TfrmEditRegion;

implementation

{$R *.dfm}


procedure TfrmEditRegion.FormShow(Sender: TObject);
begin
  try
     TypeRegionDSet.Close;
     TypeRegionDSet.SQLs.SelectSQL.Text:=ReqionTypeSqlText;
     TypeRegionDSet.Open;

     CountryDSet.Close;
     CountryDSet.SQLs.SelectSQL.Text:=CountrySqlText;
     CountryDSet.Open;
     if not VarIsNull(KeyField) then
     begin
        EDSet.Close;
        EDSet.SQLs.SelectSQL.Text:=frmRegionSqlText+'('+IntToStr(KeyField)+')';
        EDSet.Open;
        TypeRegionBox.EditValue:=EDSet['ID_REGION_TYPE'];
        CountryBox.EditValue:=EDSet['ID_COUNTRY'];
        RegionEdit.Text:=EDSet['NAME_REGION'];
        if not VarIsNull(EDSet['ZIP_BEG']) then ZipBegEdit.Text:=IntToStr(EDSet['ZIP_BEG']);
        if not VarIsNull(EDSet['ZIP_END']) then ZipEndEdit.Text:=IntToStr(EDSet['ZIP_END']);
        Self.Caption:='Змінити область';
     end
     else
     begin
        CountryBox.EditValue:=AddInfo;
        Self.Caption:='Додати область';
     end;
  except on E:Exception
         do agMessageDlg(WarningText, E.Message, mtInformation, [mbOK]);
  end;
end;

procedure TfrmEditRegion.ActOkExecute(Sender: TObject);
begin
   if CheckData then
   begin
      try
         eStoredProc.StoredProcName:='ADR_REGION_IU';
         eTrWrite.StartTransaction;
         // eStoredProc.Transaction.StartTransaction;
         eStoredProc.Prepare;
         eStoredProc.ParamByName('ID_R').AsVariant:=KeyField;
         eStoredProc.ParamByName('NAME_REGION').AsString:=RegionEdit.Text;
         eStoredProc.ParamByName('ID_COUNTRY').AsInteger:=CountryBox.EditValue;
         eStoredProc.ParamByName('ID_REGION_TYPE').AsInteger:=TypeRegionBox.EditValue;
         eStoredProc.ExecProc;
         ReturnId:=eStoredProc.FieldByName('ID_REGION').AsInteger;
         if ((ZipBegEdit.Text<>'') and (ZipEndEdit.Text<>'')) then
         begin
            eStoredProc.StoredProcName:='ADR_ZIP_REGION_IU';
            eStoredProc.Prepare;
            eStoredProc.ParamByName('ID_REGION').AsInteger:=ReturnId;
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

procedure TfrmEditRegion.ActCancelExecute(Sender: TObject);
begin
   CloseConnect;
   ModalResult:=mrCancel;
end;

procedure TfrmEditRegion.TypeRegionBoxPropertiesChange(Sender: TObject);
begin
  GlobalBoxFilter(TypeRegionBox, 'NAME_FULL');
end;

procedure TfrmEditRegion.CountryBoxPropertiesChange(Sender: TObject);
begin
   GlobalBoxFilter(CountryBox, 'NAME_COUNTRY');
end;

function TfrmEditRegion.CheckData:Boolean;
begin
   Result:=True;

   if RegionEdit.Text='' then
   begin
      RegionEdit.Style.Color:=clRed;
      agMessageDlg(WarningText, 'Ви не заповнили поле "Область"!', mtInformation, [mbOK]);
      Result:=False;
   end;

   if VarIsNull(TypeRegionBox.EditValue) then
   begin
      TypeRegionBox.Style.Color:=clRed;
      agMessageDlg(WarningText, 'Ви не обрали тип області!', mtInformation, [mbOK]);
      Result:=False;
   end;

   if VarIsNull(CountryBox.EditValue) then
   begin
      CountryBox.Style.Color:=clRed;
      agMessageDlg(WarningText, 'Ви не обрали країну!', mtInformation, [mbOK]);
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

procedure TfrmEditRegion.btnTypeRegionClick(Sender: TObject);
var sParam:TSpravParams;
    frm:TfrmSprav;
begin
    sParam.FormCaption := 'Довідник типів областей';
    sParam.SelectText := TypeRegionDSet.SQLs.SelectSQL.Text;
    sParam.NameFields := 'Name_Full,ID_REGION_TYPE';
    sParam.FieldsCaption := 'Тип області';
    sParam.KeyField := 'ID_REGION_TYPE';
    sParam.ReturnFields := 'ID_REGION_TYPE,Name_Full';
    sParam.FilterFields:='Name_Full';
    sParam.FilterCaptions:='Тип області';
    sParam.DbHandle:=EditDB.Handle;
    sParam.frmButtons:=[fbRefresh,fbSelect,fbExit];
    frm:=TfrmSprav.Create(Self, sParam);
    if frm.ShowModal=mrOk then
    begin
       if TypeRegionDSet.Active then TypeRegionDSet.Close;
       TypeRegionDSet.Open;
       TypeRegionBox.EditValue:=frm.Res[0];
    end;
    frm.Free;
end;

procedure TfrmEditRegion.btnCountryClick(Sender: TObject);
var sParam:TSpravParams;
    frm:TfrmSprav;
begin
    sParam.FormCaption := 'Довідник країн';
    sParam.SelectText := CountryDSet.SQLs.SelectSQL.Text;
    sParam.NameFields := 'Name_Country,Id_Country';
    sParam.FieldsCaption := 'Країна';
    sParam.KeyField := 'Id_Country';
    sParam.ReturnFields := 'Id_Country,Name_Country';
    sParam.FilterFields:='Name_Country';
    sParam.FilterCaptions:='Назва країни';
    sParam.DbHandle:=EditDB.Handle;
    sParam.NameClass:='TfrmEditCountry';
    sParam.DeleteProcName:='ADR_COUNTRY_D';
    sParam.frmButtons:=[fbAdd,fbModif,fbDelete,fbRefresh,fbSelect,fbExit];
    frm:=TfrmSprav.Create(Self, sParam);
    if frm.ShowModal=mrOk then
    begin
       if CountryDSet.Active then CountryDSet.Close;
       CountryDSet.Open;
       CountryBox.EditValue:=frm.Res[0];
    end;
    frm.Free;
end;

procedure TfrmEditRegion.chZipEqualPropertiesChange(Sender: TObject);
begin
   ZipEndEdit.Enabled:=not chZipEqual.Checked;
   if chZipEqual.Checked then ZipEndEdit.Text:=ZipBegEdit.Text;
end;

procedure TfrmEditRegion.ZipBegEditPropertiesChange(Sender: TObject);
begin
   if chZipEqual.Checked then ZipEndEdit.Text:=ZipBegEdit.EditingText;
end;

procedure TfrmEditRegion.ZipBegEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ((Key in ['0'..'9']) or (Key=#8)) then ZipBegEdit.Properties.ReadOnly:=False
  else ZipBegEdit.Properties.ReadOnly:=True;
end;

procedure TfrmEditRegion.ZipEndEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ((Key in ['0'..'9']) or (Key=#8)) then ZipEndEdit.Properties.ReadOnly:=False
  else ZipEndEdit.Properties.ReadOnly:=True;
end;

initialization
    RegisterClass(TfrmEditRegion);

end.
