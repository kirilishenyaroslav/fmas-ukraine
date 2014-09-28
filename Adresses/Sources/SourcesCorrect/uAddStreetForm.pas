unit uAddStreetForm;

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
  TAdd_Street_Form = class(TAdrEditForm)
    NameTE: TcxTextEdit;
    NameLbl: TcxLabel;
    AcceptBtn: TcxButton;
    CancelBtn: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    TypeBE: TcxButtonEdit;
    PlaceBE: TcxButtonEdit;
    ActionList: TActionList;
    AcceptAction: TAction;
    CancelAction: TAction;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    StProc: TpFIBStoredProc;
    procedure TypeBEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure PlaceBEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelActionExecute(Sender: TObject);
    procedure AcceptActionExecute(Sender: TObject);
{    procedure qFSC_TypeOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_PlaceOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject); }
  private
    { Private declarations }
    pIdStreet:Integer;
    function CheckData:Boolean;
  public
    { Public declarations }
    pIdPlace:Integer;
    pIdType:Integer;
//    Mode:TFormMode;
  constructor Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AIdStreet:Integer=-1);reintroduce;
  end;

implementation

{$R *.dfm}

uses RxMemDS{, uUnivSprav};

constructor TAdd_Street_Form.Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AIdStreet:Integer=-1);
begin
  inherited Create(AOwner);
 // inherited Create(AOwner);
//******************************************************************************
  DB.Handle:=ADB_HANDLE;
  StartId:=AIdStreet;
end;

procedure TAdd_Street_Form.TypeBEPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Params:TSpParams;
  OutPut:TRxMemoryData;
begin
  Params.FormCaption:='Довідник типів вулиць';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbExit];
  Params.AddFormClass:='TAdd_Region_Form';
  Params.ModifFormClass:='TAdd_Region_Form';
  Params.TableName:='ini_type_street';
  Params.Fields:='Name_full,id_type_street';
  Params.FieldsName:='Назва';
  Params.KeyField:='id_type_street';
  Params.ReturnFields:='Name_full,id_type_street';
  Params.DeleteSQL:='execute procedure adr_region_d(:id_region);';
  Params.DBHandle:=Integer(DB.Handle);

  OutPut:=TRxMemoryData.Create(self);
  if GetAdressesSp(Params,OutPut) then
   begin
     pIdType:=output['id_type_street'];
     TypeBE.Text:=VarToStr(output['Name_full']);
   end;
end;

procedure TAdd_Street_Form.PlaceBEPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Params:TSpParams;
  OutPut:TRxMemoryData;
begin
  Params.FormCaption:='Довідник населених пунктів';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TAdd_Place_Form';
  Params.ModifFormClass:='TAdd_Place_Form';
  Params.TableName:='ADR_PLACE_SELECT_SP(NULL,NULL)';
  Params.Fields:='Name_place_SP,NAME_TYPE,NAME_DISTRICT,NAME_REGION,NAME_COUNTRY,ZIP,id_place,Name_place';
  Params.FieldsName:='Населений пункт, Тип ,Район, Регіон, Країна, Індекси';
  Params.KeyField:='id_place';
  Params.ReturnFields:='Name_place,id_place';
  Params.DeleteSQL:='execute procedure adr_place_d(:id_place);';
  Params.DBHandle:=Integer(DB.Handle);

  OutPut:=TRxMemoryData.Create(self);

  if GetAdressesSp(Params,OutPut) then
   begin
     pIdPlace:=output['id_place'];
     PlaceBE.Text:=VarToStr(output['Name_place']);
   end;
end;

procedure TAdd_Street_Form.FormShow(Sender: TObject);
begin
  ReadTransaction.Active:=True;
  pIdStreet:=StartId;
  if pIdStreet>-1 then
    begin
      // изменение
      Caption:='Змінити вулицю';
      if DSet.Active then DSet.Close;
      DSet.SQLs.SelectSQL.Text:='SELECT * FROM ADR_STREET_S('+IntToStr(pIdStreet)+')';
      DSet.Open;
      NameTE.Text:=DSet['NAME_STREET'];
      pIdPlace:=DSet['ID_PLACE'];
      pIdType:=DSet['ID_TYPE_STREET'];
      PlaceBE.Text:=DSet['NAME_PLACE'];
      TypeBE.Text:=DSet['TYPE_NAME'];
    end
  else
    begin
      Caption:='Додати вулицю';
      if (VarIsArray(Additional)) and (not (VarIsNull(Additional))) then
        begin
          pIdPlace:=Additional[0];
          PlaceBE.Text:=VarToStr(Additional[1]);
        end;
    end;
end;

procedure TAdd_Street_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ReadTransaction.Active:=False;
end;

procedure TAdd_Street_Form.CancelActionExecute(Sender: TObject);
begin
// Ничего не меняли, а, следовательно, обновлять ничего не надо
  ResultId:=-1;
  ModalResult:=mrCancel;
end;

function TAdd_Street_Form.CheckData:Boolean;
begin
  Result:=True;
    if NameTE.Text='' then
     begin
      ZShowMessage('Помилка!','Вкажіть назву вулиці',mtError,[mbOK]);
      NameTE.SetFocus;
      Result:=False;
      Exit;
     end;
    if TypeBE.Text='' then
     begin
      ZShowMessage('Помилка!','Вкажіть тип вулиці',mtError,[mbOK]);
      TypeBE.SetFocus;
      Result:=False;
      Exit;
     end;
    if PlaceBE.Text='' then
     begin
      ZShowMessage('Помилка!','Вкажіть населений пункт',mtError,[mbOK]);
      PlaceBE.SetFocus;
      Result:=False;
      Exit;
     end;
end;

procedure TAdd_Street_Form.AcceptActionExecute(Sender: TObject);
begin
  if not(CheckData) then Exit;

  try
    StProc.StoredProcName:='ADR_STREET_IU';
    WriteTransaction.StartTransaction;
    StProc.Prepare;
    if pIdStreet>-1 then
      StProc.ParamByName('ID_S').AsInteger:=pIdStreet;
    StProc.ParamByName('NAME_STREET').AsString:=NameTE.Text;
    StProc.ParamByName('ID_PLACE').AsInteger:=pIdPlace;
    StProc.ParamByName('ID_TYPE_STREET').AsInteger:=pIdType;
    StProc.ExecProc;
    pIdStreet:=StProc.FN('ID_STREET').AsInteger;
    WriteTransaction.Commit;

    ResultId:=pIdStreet;
    ModalResult:=mrOk;
  except
    on E:Exception do
      begin
        WriteTransaction.Rollback;
        ZShowMessage('Помилка',E.Message,mtError,[mbOk]);
      end;
  end;
end;

{procedure TAdd_Street_Form.qFSC_TypeOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:='Довідник типів вулиць';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbExit];
  Params.AddFormClass:='TAdd_Region_Form';
  Params.ModifFormClass:='TAdd_Region_Form';
  Params.TableName:='ini_type_street';
  Params.Fields:='Name_full,id_type_street';
  Params.FieldsName:='Назва';
  Params.KeyField:='id_type_street';
  Params.ReturnFields:='Name_full,id_type_street';
  Params.DeleteSQL:='execute procedure adr_region_d(:id_region);';
  Params.DBHandle:=DBHandle;

  OutPut:=TRxMemoryData.Create(self);
  if GetUnivSprav(Params,OutPut)
   then
   begin
     value:=output['id_type_street'];
     DisplayText:=VarToStr(output['Name_full']);
   end;
end;

procedure TAdd_Street_Form.qFSC_PlaceOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:='Довідник міст';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TAdd_Place_Form';
  Params.ModifFormClass:='TAdd_Place_Form';
  Params.TableName:='adr_place';
  Params.Fields:='Name_place,id_place';
  Params.FieldsName:='Назва';
  Params.KeyField:='id_place';
  Params.ReturnFields:='Name_place,id_place';
  Params.DeleteSQL:='execute procedure adr_place_d(:id_place);';
  Params.DBHandle:=DBHandle;

  OutPut:=TRxMemoryData.Create(self);

  if GetUnivSprav(Params,OutPut)
   then
   begin
     value:=output['id_place'];
     DisplayText:=VarToStr(output['Name_place']);
   end;
end;

procedure TAdd_Street_Form.OkButtonClick(Sender: TObject);
begin
  qFFC_Street.Ok;
end;

procedure TAdd_Street_Form.CancelButtonClick(Sender: TObject);
begin
  Close;
end;  }

initialization
    RegisterClass(TAdd_Street_Form);

end.
