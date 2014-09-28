unit uAddPlace;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, {uCharControl, uFControl, uLabeledFControl, uSpravControl,}
  StdCtrls, Buttons,{ uFormControl,} uAdr_DataModule,{ uAddModifForm,}
  cxLookAndFeelPainters, FIBQuery, pFIBQuery, pFIBStoredProc, DB,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, ActnList, cxButtons,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, AdrSp_MainForm, AdrSp_Types,
  IBase, cxMaskEdit, cxButtonEdit, cxCheckBox, Address_ZMessages;

type
  TAdd_Place_Form = class(TAdrEditForm)
    NameTE: TcxTextEdit;
    NameLbl: TcxLabel;
    AcceptBtn: TcxButton;
    CancelBtn: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    TypeBE: TcxButtonEdit;
    RegionBE: TcxButtonEdit;
    EqualCB: TcxCheckBox;
    Zip1: TcxMaskEdit;
    Zip2: TcxMaskEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    ActionList: TActionList;
    AcceptAction: TAction;
    CancelAction: TAction;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    StProc: TpFIBStoredProc;
    cxLabel5: TcxLabel;
    DistrictBE: TcxButtonEdit;
    procedure TypeBEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure RegionBEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelActionExecute(Sender: TObject);
    procedure AcceptActionExecute(Sender: TObject);
    procedure EqualCBPropertiesChange(Sender: TObject);
    procedure Zip1PropertiesEditValueChanged(Sender: TObject);
    procedure Zip2PropertiesEditValueChanged(Sender: TObject);
    procedure DistrictBEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure RegionBEPropertiesChange(Sender: TObject);
  private
    pIdPlace:Integer;
    procedure UpdateZip2;
    function CheckData:Boolean;
  public
//    DBHandle: integer;
//    Mode:TFormMode;
    pIdRegion:Integer;
    pIdDistrict:Integer;
    pIdType:Integer;
    constructor Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AIdPlace:Integer=-1);reintroduce;
  end;

implementation

{$R *.dfm}

uses RxMemDS;

constructor TAdd_Place_Form.Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AIdPlace:Integer=-1);
begin
  inherited Create(AOwner);
//******************************************************************************
  DB.Handle:=ADB_HANDLE;
  StartId:=AIdPlace;
end;

procedure TAdd_Place_Form.TypeBEPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Params:TSpParams;
  OutPut:TRxMemoryData;
begin
  Params.FormCaption:='Довідник типів населених пунктів';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbExit];
  Params.AddFormClass:='TAdd_Region_Form';
  Params.ModifFormClass:='TAdd_Region_Form';
  Params.TableName:='ini_type_place';
  Params.Fields:='Name_full,id_type_place';
  Params.FieldsName:='Назва';
  Params.KeyField:='id_type_place';
  Params.ReturnFields:='Name_full,id_type_place';
  Params.DeleteSQL:='execute procedure adr_region_d(:id_region);';
  Params.DBHandle:=Integer(DB.Handle);

  OutPut:=TRxMemoryData.Create(self);
  if GetAdressesSp(Params,OutPut) then
   begin
     pIdType:=output['id_type_place'];
     TypeBE.Text:=VarToStr(output['Name_full']);
   end;
end;

procedure TAdd_Place_Form.RegionBEPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Params:TSpParams;
  OutPut:TRxMemoryData;
begin
  Params.FormCaption:='Довідник регіонів';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TAdd_Region_Form';
  Params.ModifFormClass:='TAdd_Region_Form';
  Params.TableName:='adr_region_SELECT_SP(NULL)';
  Params.Fields:='Name_region,NAME_TYPE,NAME_COUNTRY,ZIP,id_region';
  Params.FieldsName:='Назва, Тип регіона, Країна, Індекси';
  Params.KeyField:='id_region';
  Params.ReturnFields:='Name_region,id_region';
  Params.DeleteSQL:='execute procedure adr_region_d(:id_region);';
  Params.DBHandle:=Integer(DB.Handle);

  OutPut:=TRxMemoryData.Create(self);

  if GetAdressesSp(Params,OutPut) then
   begin
     pIdRegion:=output['id_region'];
     RegionBE.Text:=VarToStr(output['Name_region']);
   end;
end;

procedure TAdd_Place_Form.FormShow(Sender: TObject);
begin
  ReadTransaction.Active:=True;
  pIdPlace:=StartId;
  pIdDistrict:=-1;
  if pIdPlace>-1 then
    begin
      // изменение
      Caption:='Змінити населенний пункт';
      if DSet.Active then DSet.Close;
      DSet.SQLs.SelectSQL.Text:='SELECT * FROM ADR_PLACE_S('+IntToStr(pIdPlace)+')';
      DSet.Open;
      NameTE.Text:=DSet['NAME_PLACE'];
      pIdRegion:=DSet['ID_REGION'];
      pIdType:=DSet['ID_PLACE_TYPE'];
      if not(VarIsNull(DSet['ID_DISTRICT'])) then
        pIdDistrict:=DSet['ID_DISTRICT'];
      RegionBE.Text:=DSet['NAME_REGION'];
      TypeBE.Text:=DSet['TYPE_NAME'];
      DistrictBE.Text:=VarToStr(DSet['NAME_DISTRICT']);
      Zip1.Text:=VarToStr(DSet['ZIP_BEG']);
      Zip2.Text:=VarToStr(DSet['ZIP_END']);
    end
  else
    begin
      Caption:='Додати населенний пункт';
      if (VarIsArray(Additional)) and (not (VarIsNull(Additional))) then
        begin
          pIdRegion:=Additional[0];
          RegionBE.Text:=VarToStr(Additional[1]);
          if not VarIsNull(Additional[2]) then
            pIdDistrict:=Additional[2];
          DistrictBE.Text:=VarToStr(Additional[3]);
        end;
    end;
end;

procedure TAdd_Place_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ReadTransaction.Active:=False;
end;

procedure TAdd_Place_Form.CancelActionExecute(Sender: TObject);
begin
// Ничего не меняли, а, следовательно, обновлять ничего не надо
  ResultId:=-1;
  ModalResult:=mrCancel;
end;

function TAdd_Place_Form.CheckData:Boolean;
begin
  Result:=True;
    if NameTE.Text='' then
     begin
      ZShowMessage('Помилка!','Вкажіть назву населенного пункта',mtError,[mbOK]);
      NameTE.SetFocus;
      Result:=False;
      Exit;
     end;
    if TypeBE.Text='' then
     begin
      ZShowMessage('Помилка!','Вкажіть тип населенного пункта',mtError,[mbOK]);
      TypeBE.SetFocus;
      Result:=False;
      Exit;
     end;
    if RegionBE.Text='' then
     begin
      ZShowMessage('Помилка!','Вкажіть регіон',mtError,[mbOK]);
      RegionBE.SetFocus;
      Result:=False;
      Exit;
     end;
    if ((Zip1.Text='') or (Zip2.Text='')) and
    not((Zip1.Text='') and (Zip2.Text='')) then
       begin
        ZShowMessage('Помилка!','Вкажіть діапазон повністю',mtError,[mbOK]);
        if (Zip1.Text='') then
          Zip1.SetFocus
        else
          Zip2.SetFocus;
        Result:=False;
        Exit;
       end;
    if not((Zip1.Text='') and (Zip2.Text='')) and
      (Zip1.EditValue>Zip2.EditValue) then
       begin
        ZShowMessage('Помилка!','Кінець діапазону має бути більшим за початок',mtError,[mbOK]);
        Result:=False;
        Zip1.SetFocus;
        Exit;
       end;
end;

procedure TAdd_Place_Form.AcceptActionExecute(Sender: TObject);
begin
  if not(CheckData) then Exit;

  try
    StProc.StoredProcName:='ADR_PLACE_IU';
    WriteTransaction.StartTransaction;
    StProc.Prepare;
    if pIdPlace>-1 then
      StProc.ParamByName('ID_P').AsInteger:=pIdPlace;
    StProc.ParamByName('NAME_PLACE').AsString:=NameTE.Text;
    StProc.ParamByName('ID_REGION').AsInteger:=pIdRegion;
    StProc.ParamByName('ID_PLACE_TYPE').AsInteger:=pIdType;
    if DistrictBE.Text<>'' then
      StProc.ParamByName('ID_DISTRICT').AsInteger:=pIdDistrict;
    StProc.ExecProc;
    pIdPlace:=StProc.FN('ID_PLACE').AsInteger;
//    WriteTransaction.Commit;

    if not((Zip1.Text='')) and not((Zip2.Text='')) then
      begin
        StProc.StoredProcName:='ADR_ZIP_PLACE_IU';
//        WriteTransaction.StartTransaction;
        StProc.Prepare;
        StProc.ParamByName('ID_PLACE').AsInteger:=pIdPlace;
        StProc.ParamByName('ZIP_BEG').AsInteger:=Zip1.EditValue;
        StProc.ParamByName('ZIP_END').AsInteger:=Zip2.EditValue;
        StProc.ExecProc;
      end;
    WriteTransaction.Commit;
    ResultId:=pIdPlace;
    ModalResult:=mrOk;
  except
    on E:Exception do
      begin
        WriteTransaction.Rollback;
        ZShowMessage('Помилка',E.Message,mtError,[mbOk]);
      end;
  end;
end;

procedure TAdd_Place_Form.UpdateZip2;
//var c:Variant;
begin
  if EqualCB.Checked then
    Zip2.EditValue:=Zip1.EditValue
{  else
    if (Zip1.EditValue>Zip2.EditValue) and not((Zip2.Text='')) then
      begin
        c:=Zip1.EditValue;
        Zip1.EditValue:=Zip2.EditValue;
        Zip2.EditValue:=c;
      end;}
end;

procedure TAdd_Place_Form.EqualCBPropertiesChange(Sender: TObject);
begin
  Zip2.Enabled:=not(EqualCB.Checked);
  UpdateZip2;
end;

procedure TAdd_Place_Form.Zip1PropertiesEditValueChanged(Sender: TObject);
begin
  UpdateZip2;
end;

procedure TAdd_Place_Form.Zip2PropertiesEditValueChanged(Sender: TObject);
begin
  UpdateZip2;
end;

procedure TAdd_Place_Form.DistrictBEPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Params:TSpParams;
  OutPut : TRxMemoryData;
begin
  if RegionBE.Text='' then
   begin
     ZShowMessage('Помилка','Спочатку оберіть регіон!',mtError,[mbOK]);
     Exit;
   end;

  Params.FormCaption:='Довідник районів';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TAdd_District_Form';
  Params.ModifFormClass:='TAdd_District_Form';
  Params.TableName:='adr_district_select_SP('+IntToStr(pIdRegion)+');';
  Params.Fields:='Name_district,NAME_TYPE,NAME_REGION,NAME_COUNTRY,ZIP,id_district';
  Params.FieldsName:='Район, Тип района, Регіон, Країна, Індекси';
  Params.KeyField:='id_district';
  Params.ReturnFields:='Name_district,id_district';
  Params.DeleteSQL:='execute procedure adr_district_d(:id_district);';
  Params.DBHandle:=Integer(DB.Handle);

  OutPut:=TRxMemoryData.Create(self);

  if GetAdressesSp(Params,OutPut)
   then
   begin
     if not VarIsNull(output['id_district']) then
       pIdDistrict:=output['id_district'];
     DistrictBE.Text:=VarToStr(output['Name_district']);
   end;
end;

procedure TAdd_Place_Form.RegionBEPropertiesChange(Sender: TObject);
begin
  DistrictBE.EditValue:=Null;
end;

initialization
    RegisterClass(TAdd_Place_Form);

end.
