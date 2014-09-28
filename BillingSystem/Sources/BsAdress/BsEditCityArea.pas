unit BsEditCityArea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BsAdrSpr, BaseTypes, BsAdrConsts, cxLookAndFeelPainters, DB,
  ActnList, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxLabel, cxControls, cxContainer,
  cxEdit, cxTextEdit, StdCtrls, cxButtons, AdrEdit;

type
  TfrmEditCityArea = class(TEditForm)
    btnOk: TcxButton;
    btnCancel: TcxButton;
    CityAreaEdit: TcxTextEdit;
    lblCityArea: TcxLabel;
    lblPlace: TcxLabel;
    PlaceBox: TcxLookupComboBox;
    btnPlace: TcxButton;
    EditDB: TpFIBDatabase;
    eTrRead: TpFIBTransaction;
    eTrWrite: TpFIBTransaction;
    eStoredProc: TpFIBStoredProc;
    EDSet: TpFIBDataSet;
    ActionList1: TActionList;
    ActOk: TAction;
    ActCancel: TAction;
    PlaceDSet: TpFIBDataSet;
    PlaceDS: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure ActCancelExecute(Sender: TObject);
    procedure ActOkExecute(Sender: TObject);
    procedure btnPlaceClick(Sender: TObject);
  private
    { Private declarations }
    function CheckData:Boolean;
  public
    { Public declarations }
  end;

var
  frmEditCityArea: TfrmEditCityArea;

implementation

{$R *.dfm}

function TfrmEditCityArea.CheckData:Boolean;
begin
  Result:=True;
  if CityAreaEdit.Text='' then
  begin
     CityAreaEdit.Style.Color:=clRed;
     agMessageDlg(WarningText, 'Ви не заповнили поле "Район міста"!', mtInformation, [mbOK]);
     Result:=False;
  end;

  if VarIsNull(PlaceBox.EditValue) then
  begin
     PlaceBox.Style.Color:=clRed;
     agMessageDlg(WarningText, 'Ви не обрали нас. пункт', mtInformation, [mbOK]);
     Result:=False;
  end;
end;

procedure TfrmEditCityArea.FormShow(Sender: TObject);
var s:string;
begin
  try
     if not VarIsNull(AddInfo[1]) then s:=IntToStr(AddInfo[1])
     else s:='null';
     PlaceDSet.Close;
     PlaceDSet.SQLs.SelectSQL.Text:=PlaceSqlText+'('+IntToStr(AddInfo[0])+','+s+')'+OrderBy+'NAME_PLACE'+CollateWin1251;
     PlaceDSet.Open;
     if not VarIsNull(AddInfo[2]) then PlaceBox.EditValue:=AddInfo[2];
     if not VarIsNull(KeyField) then
     begin
        EDSet.Close;
        EDSet.SQLs.SelectSQL.Text:=frmCityAreaSqlText+'('+IntToStr(KeyField)+')'+OrderBy+'NAME_CITY_AREA'+CollateWin1251;
        EDSet.Open;
        CityAreaEdit.Text:=EDSet['NAME_CITY_AREA'];
        PlaceBox.EditValue:=EDSet['ID_PLACE'];
        Self.Caption:='Змінити район міста';
     end
     else Self.Caption:='Додати район міста';
  except on E:Exception
         do agMessageDlg(WarningText, E.Message, mtInformation, [mbOK]);
  end;
end;

procedure TfrmEditCityArea.ActCancelExecute(Sender: TObject);
begin
   CloseConnect;
   ModalResult:=mrCancel;
end;

procedure TfrmEditCityArea.ActOkExecute(Sender: TObject);
begin
   if CheckData then
   begin
      try
         eTrWrite.StartTransaction;
         eStoredProc.StoredProcName:='BS_CITY_AREA_INS_UPD';
         eStoredProc.Prepare;
         eStoredProc.ParamByName('ID_CITY_AREA_IN').AsVariant:=KeyField;
         eStoredProc.ParamByName('NAME_CITY_AREA').AsString:=CityAreaEdit.Text;
         eStoredProc.ParamByName('ID_PLACE').AsInteger:=PlaceBox.EditValue;
         eStoredProc.ExecProc;
         ReturnId:=eStoredProc.FieldByName('ID_CITY_AREA').AsInteger;
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

procedure TfrmEditCityArea.btnPlaceClick(Sender: TObject);
var sParam:TSpravParams;
    frm:TfrmSprav;
    str:String;
begin
    if VarIsNull(AddInfo[1]) then str:='NULL'
    else str:=IntToStr(AddInfo[1]);
    sParam.FormCaption := 'Довідник населених пуктів';
    sParam.SelectText := PlaceSqlText+'('+IntToStr(AddInfo[0])+','+str+')'+OrderBy+'NAME_PLACE'+CollateWin1251;
    sParam.NameFields := 'Name_Place,Id_Place';
    sParam.FieldsCaption := 'Населений пункт';
    sParam.KeyField := 'Id_Place';
    sParam.ReturnFields := 'Id_Place,Name_Place';
    sParam.FilterFields:='Name_Place';
    sParam.FilterCaptions:='Назва нас. пункту';
    sParam.DbHandle:=EditDB.Handle;
    sParam.frmButtons:=[fbAdd,fbModif,fbDelete,fbRefresh,fbSelect,fbExit];
    sParam.DeleteProcName:='ADR_PLACE_D';
    sParam.NameClass:='TfrmEditPlace';
    sParam.AddInfo:=VarArrayCreate([0, 2], varVariant);
    sParam.AddInfo[0]:=AddInfo[3];
    sParam.AddInfo[1]:=AddInfo[0];
    sParam.AddInfo[2]:=AddInfo[1];
    frm:=TfrmSprav.Create(Self, sParam);
    if frm.ShowModal=mrOk then
    begin
       if PlaceDSet.Active then PlaceDSet.Close;
       PlaceDSet.Open;
       PlaceBox.EditValue:=frm.Res[0];
    end;
    frm.Free;
end;

initialization
     RegisterClass(TfrmEditCityArea);

end.
