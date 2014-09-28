unit BsEditStreet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons,
  FIBDatabase, pFIBDatabase, cxMaskEdit, cxButtonEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, ExtCtrls, cxLabel, DB, FIBDataSet,
  pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, iBase, ActnList, AdrEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  baseTypes, BsAdrConsts;

type
  TfrmEditStreet = class(TEditForm)
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
    StreetEdit: TcxTextEdit;
    lblStreet: TcxLabel;
    lblTypeStreet: TcxLabel;
    lblPlace: TcxLabel;
    TypeStreetBox: TcxLookupComboBox;
    PlaceBox: TcxLookupComboBox;
    btnType: TcxButton;
    btnPlace: TcxButton;
    TypeStreetDSet: TpFIBDataSet;
    PlaceDSet: TpFIBDataSet;
    TypeStreetDS: TDataSource;
    PlaceDS: TDataSource;
    procedure ActOkExecute(Sender: TObject);
    procedure ActCancelExecute(Sender: TObject);
    procedure lblStreetMouseLeave(Sender: TObject);
    procedure lblTypeStreetMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure lblTypeStreetMouseLeave(Sender: TObject);
    procedure lblPlaceMouseEnter(Sender: TObject);
    procedure lblPlaceMouseLeave(Sender: TObject);
    procedure btnTypeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TypeStreetBoxPropertiesChange(Sender: TObject);
    procedure PlaceBoxPropertiesChange(Sender: TObject);
    procedure btnPlaceClick(Sender: TObject);
  private
    { Private declarations }
    function CheckData:boolean;
  public
    { Public declarations }
  end;

var
  frmEditStreet: TfrmEditStreet;

implementation

{$R *.dfm}

uses BsAdrSpr;


function TfrmEditStreet.CheckData:Boolean;
begin
  Result:=True;
  if StreetEdit.Text='' then
  begin
     StreetEdit.Style.Color:=clRed;
     agMessageDlg(WarningText, 'Ви не заповнили поле "Вулиця"!', mtInformation, [mbOK]);
     Result:=False;
  end;

  if VarIsNull(TypeStreetBox.EditValue) then
  begin
     TypeStreetBox.Style.Color:=clRed;
     agMessageDlg(WarningText, 'Ви не обрали тип вулиці!', mtInformation, [mbOK]);
     Result:=False;
  end;

  if VarIsNull(PlaceBox.EditValue) then
  begin
     PlaceBox.Style.Color:=clRed;
     agMessageDlg(WarningText, 'Ви не обрали насю пункт!', mtInformation, [mbOK]);
     Result:=False;
  end;
end;

procedure TfrmEditStreet.ActOkExecute(Sender: TObject);
begin
   if CheckData then
   begin
      try
        eTrWrite.StartTransaction;
        eStoredProc.StoredProcName:='BS_STREET_INS_UPD';
        eStoredProc.Prepare;
        eStoredProc.ParamByName('ID_STREET_IN').AsVariant:=KeyField;
        eStoredProc.ParamByName('NAME_STREET').AsString:=StreetEdit.Text;
        eStoredProc.ParamByName('ID_PLACE').AsInteger:=PlaceBox.EditValue;
        eStoredProc.ParamByName('ID_TYPE_STREET').AsInteger:=TypeStreetBox.EditValue;
        eStoredProc.ExecProc;
        ReturnId:=eStoredProc.FieldByName('ID_STREET').AsInteger;
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

procedure TfrmEditStreet.ActCancelExecute(Sender: TObject);
begin
   CloseConnect;
   Close;
end;

procedure TfrmEditStreet.lblStreetMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
   lblStreet.Style.Font.Color:=clWindowText;
end;

procedure TfrmEditStreet.lblTypeStreetMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   Screen.Cursor:=crHandPoint;
   lblTypeStreet.Style.Font.Color:=clBlue;
end;

procedure TfrmEditStreet.lblTypeStreetMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
   lblTypeStreet.Style.Font.Color:=clWindowText;
end;

procedure TfrmEditStreet.lblPlaceMouseEnter(Sender: TObject);
begin
   Screen.Cursor:=crHandPoint;
   lblPlace.Style.Font.Color:=clBlue;
end;

procedure TfrmEditStreet.lblPlaceMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
   lblPlace.Style.Font.Color:=clWindowText;
end;

procedure TfrmEditStreet.btnTypeClick(Sender: TObject);
var sParam:TSpravParams;
    frm:TfrmSprav;
begin
    sParam.FormCaption := 'Довідник типів вулиць';
    sParam.SelectText := TypeStreetDSet.SQLs.SelectSQL.Text;
    sParam.NameFields := 'Name_Full,Id_Type_Street';
    sParam.FieldsCaption := 'Тип вулиці';
    sParam.KeyField := 'Id_Type_Street';
    sParam.ReturnFields := 'Id_Type_Street,Name_Full';
    sParam.FilterFields:='Name_Full';
    sParam.FilterCaptions:='Тип вулиці';
    sParam.DbHandle:=EditDB.Handle;
    sParam.frmButtons:=[fbRefresh,fbSelect,fbExit];
    frm:=TfrmSprav.Create(Self, sParam);
    if frm.ShowModal=mrOk then
    begin
       if TypeStreetDSet.Active then TypeStreetDSet.Close;
       TypeStreetDSet.Open;
       TypeStreetBox.EditValue:=frm.Res[0];
    end;
    frm.Free;
end;

procedure TfrmEditStreet.FormShow(Sender: TObject);
var s:String;
begin
  try
     TypeStreetDSet.Close;
     TypeStreetDSet.SQLs.SelectSQL.Text:=StreetTypeSqlText;
     TypeStreetDSet.Open;
     if not VarIsNull(AddInfo[1]) then s:=IntToStr(AddInfo[1])
     else s:='null';
     PlaceDSet.Close;
     PlaceDSet.SQLs.SelectSQL.Text:=PlaceSqlText+'('+IntToStr(AddInfo[0])+','+s+')'+OrderBy+'NAME_PLACE'+CollateWin1251;
     PlaceDSet.Open;
     if not VarIsNull(AddInfo[2]) then PlaceBox.EditValue:=AddInfo[2];
     if not VarIsNull(KeyField) then
     begin
        EDSet.Close;
        EDSet.SQLs.SelectSQL.Text:=frmStreetSqlText+'('+IntToStr(KeyField)+')';
        EDSet.Open;
        StreetEdit.Text:=EDSet['NAME_STREET'];
        TypeStreetBox.EditValue:=EDSet['ID_TYPE_STREET'];
        PlaceBox.EditValue:=EDSet['ID_PLACE'];

        Self.Caption:='Змінити вулицю';
     end
     else Self.Caption:='Додати вулицю';
  except on E:Exception
         do agMessageDlg(WarningText, E.Message, mtInformation, [mbOK]);
  end;
end;

procedure TfrmEditStreet.TypeStreetBoxPropertiesChange(Sender: TObject);
begin
   GlobalBoxFilter(TypeStreetBox, 'NAME_FULL');
end;

procedure TfrmEditStreet.PlaceBoxPropertiesChange(Sender: TObject);
begin
   GlobalBoxFilter(PlaceBox, 'NAME_PLACE');
end;

procedure TfrmEditStreet.btnPlaceClick(Sender: TObject);
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
    RegisterClass(TfrmEditStreet);


end.

