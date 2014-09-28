unit BsEditDistrict;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, DB, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, ActnList, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, StdCtrls,
  cxButtons, AdrEdit, cxCheckBox, BaseTypes, BsAdrConsts, BsAdrSpr;

type
  TfrmEditDistrict = class(TEditForm)
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
    DistrictEdit: TcxTextEdit;
    lblDistrict: TcxLabel;
    lblTypeDistrict: TcxLabel;
    lblRegion: TcxLabel;
    TypeDistrictBox: TcxLookupComboBox;
    RegionBox: TcxLookupComboBox;
    btnDistrict: TcxButton;
    btnRegion: TcxButton;
    TypeDistrictDSet: TpFIBDataSet;
    RegionDSet: TpFIBDataSet;
    TypeDistrictDS: TDataSource;
    RegionDS: TDataSource;
    cxLabel1: TcxLabel;
    ZipEndEdit: TcxTextEdit;
    chZipEqual: TcxCheckBox;
    lblZip: TcxLabel;
    ZipBegEdit: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure ZipBegEditPropertiesChange(Sender: TObject);
    procedure chZipEqualPropertiesChange(Sender: TObject);
    procedure ZipBegEditKeyPress(Sender: TObject; var Key: Char);
    procedure ZipEndEditKeyPress(Sender: TObject; var Key: Char);
    procedure ActCancelExecute(Sender: TObject);
    procedure ActOkExecute(Sender: TObject);
    procedure RegionBoxPropertiesChange(Sender: TObject);
    procedure TypeDistrictBoxPropertiesChange(Sender: TObject);
    procedure btnDistrictClick(Sender: TObject);
    procedure btnRegionClick(Sender: TObject);
  private
    { Private declarations }
     function CheckData:Boolean;
  public
    { Public declarations }
  end;

var
  frmEditDistrict: TfrmEditDistrict;

implementation

{$R *.dfm}

procedure TfrmEditDistrict.FormShow(Sender: TObject);
begin
  try
     TypeDistrictDSet.Close;
     TypeDistrictDSet.SQLs.SelectSQL.Text:=DistrictTypeSqlText;
     TypeDistrictDSet.Open;

     RegionDSet.Close;
     RegionDSet.SQLs.SelectSQL.Text:=RegionSqlText+'('+IntToStr(AddInfo[0])+')'+OrderBy+'NAME_REGION'+CollateWin1251;
     RegionDSet.Open;
     RegionBox.EditValue:=AddInfo[1];
     if Not VarIsNull(KeyField) then
     begin
        EDSet.Close;
        EDSet.SQLs.SelectSQL.Text:=frmDistrictSqlText+'('+IntToStr(KeyField)+')';
        EDSet.Open;
        DistrictEdit.Text:=EDSet['NAME_DISTRICT'];
        if not VarIsNull(EDSet['ZIP_BEG']) then ZipBegEdit.Text:=IntToStr(EDSet['ZIP_BEG']);
        if not VarIsNull(EDSet['ZIP_END']) then ZipEndEdit.Text:=IntToStr(EDSet['ZIP_END']);
        TypeDistrictBox.EditValue:=EDSet['ID_TYPE_DISTRICT'];
        Self.Caption:='Змінити район';
     end
     else
     begin
        Self.Caption:='Додати район';
     end;
  except on E:Exception
         do agMessageDlg(WarningText, E.Message, mtInformation, [mbOK]);
  end;
end;

function TfrmEditDistrict.CheckData:Boolean;
begin
   Result:=True;

   if DistrictEdit.Text='' then
   begin
      DistrictEdit.Style.Color:=clRed;
      agMessageDlg(WarningText, 'Ви не заповнили поле "Район"!', mtInformation, [mbOK]);
      Result:=False;
   end;

   if VarIsNull(TypeDistrictBox.EditValue) then
   begin
      TypeDistrictBox.Style.Color:=clRed;
      agMessageDlg(WarningText, 'Ви не обрали тип раону!', mtInformation, [mbOK]);
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

procedure TfrmEditDistrict.ZipBegEditPropertiesChange(Sender: TObject);
begin
   if chZipEqual.Checked then ZipEndEdit.Text:=ZipBegEdit.EditingText;
end;

procedure TfrmEditDistrict.chZipEqualPropertiesChange(Sender: TObject);
begin
   ZipEndEdit.Enabled:=not chZipEqual.Checked;
   if chZipEqual.Checked then ZipEndEdit.Text:=ZipBegEdit.Text;
end;

procedure TfrmEditDistrict.ZipBegEditKeyPress(Sender: TObject;
  var Key: Char);
begin
     if ((Key in ['0'..'9']) or (Key=#8)) then ZipBegEdit.Properties.ReadOnly:=False
     else ZipBegEdit.Properties.ReadOnly:=True;
end;

procedure TfrmEditDistrict.ZipEndEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ((Key in ['0'..'9']) or (Key=#8)) then ZipEndEdit.Properties.ReadOnly:=False
  else ZipEndEdit.Properties.ReadOnly:=True;
end;

procedure TfrmEditDistrict.ActCancelExecute(Sender: TObject);
begin
   CloseConnect;
   ModalResult:=mrCancel;
end;

procedure TfrmEditDistrict.ActOkExecute(Sender: TObject);
begin
   if CheckData then
   begin
      try
        eTrWrite.StartTransaction;
        eStoredProc.StoredProcName:='ADR_DISTRICT_IU';
        eStoredProc.Prepare;
        eStoredProc.ParamByName('ID_D').AsVariant:=KeyField;
        eStoredProc.ParamByName('NAME_DISTRICT').AsString:=DistrictEdit.Text;
        eStoredProc.ParamByName('ID_REGION').AsInteger:=RegionBox.EditValue;
        eStoredProc.ParamByName('ID_TYPE_DISTRICT').AsInteger:=TypeDistrictBox.EditValue;
        eStoredProc.ExecProc;
        ReturnId:=eStoredProc.FieldByName('ID_DISTRICT').AsInteger;

        if ((ZipBegEdit.Text<>'') and (ZipEndEdit.Text<>'')) then
        begin
           eStoredProc.StoredProcName:='ADR_ZIP_DISTRICT_IU';
           eStoredProc.Prepare;
           eStoredProc.ParamByName('ID_DISTRICT').AsInteger:=ReturnId;
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

procedure TfrmEditDistrict.RegionBoxPropertiesChange(Sender: TObject);
begin
   GlobalBoxFilter(RegionBox, 'NAME_REGION');
end;

procedure TfrmEditDistrict.TypeDistrictBoxPropertiesChange(
  Sender: TObject);
begin
   GlobalBoxFilter(TypeDistrictBox, 'NAME_FULL');
end;

procedure TfrmEditDistrict.btnDistrictClick(Sender: TObject);
var sParam:TSpravParams;
    frm:TfrmSprav;
begin
    sParam.FormCaption := 'Довідник типів областей';
    sParam.SelectText := TypeDistrictDSet.SQLs.SelectSQL.Text;
    sParam.NameFields := 'Name_Full,ID_TYPE_DISTRICT';
    sParam.FieldsCaption := 'Тип району';
    sParam.KeyField := 'ID_TYPE_DISTRICT';
    sParam.ReturnFields := 'ID_TYPE_DISTRICT,Name_Full';
    sParam.FilterFields:='Name_Full';
    sParam.FilterCaptions:='Тип району';
    sParam.DbHandle:=EditDB.Handle;
    sParam.frmButtons:=[fbRefresh,fbSelect,fbExit];
    frm:=TfrmSprav.Create(Self, sParam);
    if frm.ShowModal=mrOk then
    begin
       if TypeDistrictDSet.Active then TypeDistrictDSet.Close;
       TypeDistrictDSet.Open;
       TypeDistrictBox.EditValue:=frm.Res[0];
    end;
    frm.Free;
end;

procedure TfrmEditDistrict.btnRegionClick(Sender: TObject);
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
    sParam.AddInfo:=AddInfo;
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

initialization
   RegisterClass(TfrmEditDistrict);

end.
