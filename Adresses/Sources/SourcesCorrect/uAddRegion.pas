unit uAddRegion;

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
  TAdd_Region_Form = class(TAdrEditForm)
    NameTE: TcxTextEdit;
    NameLbl: TcxLabel;
    AcceptBtn: TcxButton;
    CancelBtn: TcxButton;
    ActionList: TActionList;
    AcceptAction: TAction;
    CancelAction: TAction;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    StProc: TpFIBStoredProc;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    TypeBE: TcxButtonEdit;
    CountryBE: TcxButtonEdit;
    EqualCB: TcxCheckBox;
    Zip1: TcxMaskEdit;
    Zip2: TcxMaskEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    procedure TypeBEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CountryBEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelActionExecute(Sender: TObject);
    procedure AcceptActionExecute(Sender: TObject);
    procedure EqualCBPropertiesChange(Sender: TObject);
    procedure Zip1PropertiesEditValueChanged(Sender: TObject);
    procedure Zip2PropertiesEditValueChanged(Sender: TObject);
  private
    pIdRegion:Integer;
    procedure UpdateZip2;
    function CheckData:Boolean;
  public
//    Mode:TFormMode;
//    DBHandle: integer;
//    constructor Create(AOwner: TComponent ; DMod: TAdrDM; Mode: TFormMode; Where: Variant);reintroduce;
    pIdCountry:Integer;
    pIdType:Integer;
    constructor Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AIdRegion:Integer=-1);reintroduce;
  end;

implementation

{$R *.dfm}

uses RxMemDS, Math;

constructor TAdd_Region_Form.Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AIdRegion:Integer=-1);
begin
  inherited Create(AOwner);
//******************************************************************************
  DB.Handle:=ADB_HANDLE;
  StartId:=AIdRegion;
end;

procedure TAdd_Region_Form.TypeBEPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Params:TSpParams;
  OutPut:TRxMemoryData;
begin
  Params.FormCaption:='Довідник типів регіонів';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbExit];
  Params.AddFormClass:='TAdd_Region_Form';
  Params.ModifFormClass:='TAdd_Region_Form';
  Params.TableName:='ini_type_region';
  Params.Fields:='Name_full,id_region_type';
  Params.FieldsName:='Назва';
  Params.KeyField:='id_region_type';
  Params.ReturnFields:='Name_full,id_region_type';
  Params.DeleteSQL:='execute procedure adr_region_d(:id_region);';
  Params.DBHandle:=Integer(DB.Handle);

  OutPut:=TRxMemoryData.Create(self);
  if GetAdressesSp(Params,OutPut) then
   begin
     pIdType:=output['id_region_type'];
     TypeBE.Text:=VarToStr(output['Name_full']);
   end;
end;

procedure TAdd_Region_Form.CountryBEPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Params:TSpParams;
  OutPut:TRxMemoryData;
begin
  Params.FormCaption:='Довідник країн';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TAdd_Country_Form';
  Params.ModifFormClass:='TAdd_Country_Form';
  Params.TableName:='adr_country_select';
  Params.Fields:='Name_country,id_country';
  Params.FieldsName:='Назва';
  Params.KeyField:='id_country';
  Params.ReturnFields:='Name_country,id_country';
  Params.DeleteSQL:='execute procedure adr_country_d(:id_country);';
  Params.DBHandle:=Integer(DB.Handle);

  OutPut:=TRxMemoryData.Create(self);

  if GetAdressesSp(Params,OutPut) then
   begin
     pIdCountry:=output['id_country'];
     CountryBE.Text:=VarToStr(output['Name_country']);
   end;
end;

procedure TAdd_Region_Form.FormShow(Sender: TObject);
begin
  ReadTransaction.Active:=True;
  pIdRegion:=StartId;
  if pIdRegion>-1 then
    begin
      // изменение
      Caption:='Змінити регіон';
      if DSet.Active then DSet.Close;
      DSet.SQLs.SelectSQL.Text:='SELECT * FROM ADR_REGION_S('+IntToStr(pIdRegion)+')';
      DSet.Open;
      NameTE.Text:=DSet['NAME_REGION'];
      pIdCountry:=DSet['ID_COUNTRY'];
      pIdType:=DSet['ID_REGION_TYPE'];
      CountryBE.Text:=DSet['NAME_COUNTRY'];
      TypeBE.Text:=DSet['TYPE_NAME'];
      Zip1.Text:=VarToStr(DSet['ZIP_BEG']);
      Zip2.Text:=VarToStr(DSet['ZIP_END']);
    end
  else
    begin
      Caption:='Додати регіон';
      if (VarIsArray(Additional)) and (not (VarIsNull(Additional))) then
        begin
          pIdCountry:=Additional[0];
          CountryBE.Text:=VarToStr(Additional[1]);
        end;
    end;
end;

procedure TAdd_Region_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ReadTransaction.Active:=False;
end;

procedure TAdd_Region_Form.CancelActionExecute(Sender: TObject);
begin
// Ничего не меняли, а, следовательно, обновлять ничего не надо
  ResultId:=-1;
  ModalResult:=mrCancel;
end;

function TAdd_Region_Form.CheckData:Boolean;
begin
  Result:=True;
    if NameTE.Text='' then
     begin
      ZShowMessage('Помилка!','Вкажіть назву регіона',mtError,[mbOK]);
      NameTE.SetFocus;
      Result:=False;
      Exit;
     end;
    if TypeBE.Text='' then
     begin
      ZShowMessage('Помилка!','Вкажіть тип регіона',mtError,[mbOK]);
      TypeBE.SetFocus;
      Result:=False;
      Exit;
     end;
    if CountryBE.Text='' then
     begin
      ZShowMessage('Помилка!','Вкажіть країну',mtError,[mbOK]);
      CountryBE.SetFocus;
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

procedure TAdd_Region_Form.AcceptActionExecute(Sender: TObject);
begin
  if not(CheckData) then Exit;

  try
    StProc.StoredProcName:='ADR_REGION_IU';
    WriteTransaction.StartTransaction;
    StProc.Prepare;
    if pIdRegion>-1 then
      StProc.ParamByName('ID_R').AsInteger:=pIdRegion;
    StProc.ParamByName('NAME_REGION').AsString:=NameTE.Text;
    StProc.ParamByName('ID_COUNTRY').AsInteger:=pIdCountry;
    StProc.ParamByName('ID_REGION_TYPE').AsInteger:=pIdType;
    StProc.ExecProc;
    pIdRegion:=StProc.FN('ID_REGION').AsInteger;
//    WriteTransaction.Commit;

    if not((Zip1.Text='')) and not((Zip2.Text='')) then
      begin
        StProc.StoredProcName:='ADR_ZIP_REGION_IU';
//        WriteTransaction.StartTransaction;
        StProc.Prepare;
        StProc.ParamByName('ID_REGION').AsInteger:=pIdRegion;
        StProc.ParamByName('ZIP_BEG').AsInteger:=Zip1.EditValue;
        StProc.ParamByName('ZIP_END').AsInteger:=Zip2.EditValue;
        StProc.ExecProc;
      end;
    WriteTransaction.Commit;
    ResultId:=pIdRegion;
    ModalResult:=mrOk;
  except
    on E:Exception do
      begin
        WriteTransaction.Rollback;
        ZShowMessage('Помилка',E.Message,mtError,[mbOk]);
      end;
  end;
end;

procedure TAdd_Region_Form.UpdateZip2;
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

procedure TAdd_Region_Form.EqualCBPropertiesChange(Sender: TObject);
begin
  Zip2.Enabled:=not(EqualCB.Checked);
  UpdateZip2;
end;

procedure TAdd_Region_Form.Zip1PropertiesEditValueChanged(Sender: TObject);
begin
  UpdateZip2;
end;

procedure TAdd_Region_Form.Zip2PropertiesEditValueChanged(Sender: TObject);
begin
  UpdateZip2;
end;

initialization
    RegisterClass(TAdd_Region_Form);

end.
