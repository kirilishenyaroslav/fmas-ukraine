unit uAddCityArea;

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
  TAddCityArea = class(TAdrEditForm)
    NameTE: TcxTextEdit;
    NameLbl: TcxLabel;
    AcceptBtn: TcxButton;
    CancelBtn: TcxButton;
    cxLabel2: TcxLabel;
    PlaceBE: TcxButtonEdit;
    ActionList: TActionList;
    AcceptAction: TAction;
    CancelAction: TAction;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    StProc: TpFIBStoredProc;
    procedure PlaceBEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelActionExecute(Sender: TObject);
    procedure AcceptActionExecute(Sender: TObject);
  private
    { Private declarations }
    pIdArea:Integer;
    function CheckData:Boolean;
  public
    { Public declarations }
    pIdPlace:Integer;
    pIdType:Integer;
  constructor Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AIdArea:Integer=-1);reintroduce;
  end;

implementation

{$R *.dfm}

uses RxMemDS{, uUnivSprav};

constructor TAddCityArea.Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AIdArea:Integer=-1);
begin
  inherited Create(AOwner);
//******************************************************************************
  DB.Handle:=ADB_HANDLE;
  StartId:=AIdArea;
end;


procedure TAddCityArea.PlaceBEPropertiesButtonClick(Sender: TObject;
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
  Params.Fields:='Name_place_SP,NAME_TYPE,NAME_DISTRICT,NAME_REGION,NAME_COUNTRY,ZIP,id_place,NAME_PLACE';
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

procedure TAddCityArea.FormShow(Sender: TObject);
begin
  ReadTransaction.Active:=True;
  pIdArea:=StartId;
  if pIdArea>-1 then
    begin
      // изменение
      Caption:='Змінити район';
      if DSet.Active then DSet.Close;
      DSet.SQLs.SelectSQL.Text:='SELECT * FROM ADR_CITY_AREA_S('+IntToStr(pIdArea)+')';
      DSet.Open;
      NameTE.Text:=DSet['NAME_CITY_AREA'];
      pIdPlace:=DSet['ID_PLACE'];
      PlaceBE.Text:=DSet['NAME_PLACE'];
    end
  else
    begin
      Caption:='Додати район';
      if (VarIsArray(Additional)) and (not (VarIsNull(Additional))) then
        begin
          pIdPlace:=Additional[0];
          PlaceBE.Text:=VarToStr(Additional[1]);
        end;
    end;
end;

procedure TAddCityArea.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ReadTransaction.Active:=False;
end;

procedure TAddCityArea.CancelActionExecute(Sender: TObject);
begin
// Ничего не меняли, а, следовательно, обновлять ничего не надо
  ResultId:=-1;
  ModalResult:=mrCancel;
end;

function TAddCityArea.CheckData:Boolean;
begin
  Result:=True;
    if NameTE.Text='' then
     begin
      ZShowMessage('Помилка!','Вкажіть назву района',mtError,[mbOK]);
      NameTE.SetFocus;
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

procedure TAddCityArea.AcceptActionExecute(Sender: TObject);
begin
  if not(CheckData) then Exit;

  try
    StProc.StoredProcName:='ADR_CITY_AREA_IU';
    WriteTransaction.StartTransaction;
    StProc.Prepare;
    if pIdArea>-1 then
      StProc.ParamByName('ID_CA').AsInteger:=pIdArea;
    StProc.ParamByName('NAME_CITY_AREA').AsString:=NameTE.Text;
    StProc.ParamByName('ID_PLACE').AsInteger:=pIdPlace;
    StProc.ExecProc;
    pIdArea:=StProc.FN('ID_CITY_AREA').AsInteger;
    WriteTransaction.Commit;

    ResultId:=pIdArea;
    ModalResult:=mrOk;
  except
    on E:Exception do
      begin
        WriteTransaction.Rollback;
        ZShowMessage('Помилка',E.Message,mtError,[mbOk]);
      end;
  end;
end;

initialization
    RegisterClass(TAddCityArea);

end.
