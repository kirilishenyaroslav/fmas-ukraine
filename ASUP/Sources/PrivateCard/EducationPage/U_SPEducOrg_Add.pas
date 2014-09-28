{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Пакет "Справочник регалий"                              }
{         Модуль добавления/изменения регалий                                  }
{                                               ответственный: Тимофеев Антон  }
unit U_SPEducOrg_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBQuery, pFIBQuery, pFIBStoredProc, StdCtrls, SpComboBox, DB,
  IBCustomDataSet, IBQuery, Buttons, FieldControl, ExtCtrls, Mask, SpFormUnit,
  CheckEditUnit, EditControl, SpCommon, fib, uCharControl, uIntControl,
  uBoolControl, uFormControl, uAddModifForm, uFControl, uLabeledFControl,
  uSpravControl, pFIBDatabase, iBase;

type
  TfrmEducOrgAdd = class(TForm)
    Panel1: TPanel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    qFSC_type: TqFSpravControl;
    qFBC_IsEduc: TqFBoolControl;
    qFBC_IsKval: TqFBoolControl;
    qFIC_Akred: TqFIntControl;
    qFCC_FName: TqFCharControl;
    qFCC_SName: TqFCharControl;
    qFSC_Adr: TqFSpravControl;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure qFSC_typeOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_AdrOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
  private
    DBHandle:TISC_DB_HANDLE;
    { Private declarations }
  public
    Mode:TFormMode;
    FormControl: TEditControl;
    idgr,id:integer;
  	PropParams: TSpParams;
    constructor Create(AOwner: TComponent ; DHandle: TISC_DB_HANDLE); reintroduce;
  end;

var
  frmEducOrgAdd: TfrmEducOrgAdd;

implementation

{$R *.dfm}

uses uCommonSP,  RxMemDS, uUnivSprav, BaseTypes;

constructor TfrmEducOrgAdd.Create(AOwner: TComponent ; DHandle: TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  DBHandle:=DHandle;
end;

procedure TfrmEducOrgAdd.OkButtonClick(Sender: TObject);
begin
  if VarIsNull(qFSC_type.Value) then
  begin
     agMessageDlg('Увага!', 'Ви не заповнили поле "Група"!', mtInformation, [mbOK]);
     ModalResult := mrNone;
     Exit;
  end
  else
  ModalResult:=mrOk;
end;

procedure TfrmEducOrgAdd.CancelButtonClick(Sender: TObject);
begin
	 ModalResult := mrCancel;
end;

procedure TfrmEducOrgAdd.qFSC_typeOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:='Тип навч. закладу';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TForm_SPEducOrg_AddGr';
  Params.ModifFormClass:='TForm_SPEducOrg_AddGr';
  Params.TableName:='INI_EDUC_ORG_TYPE';
  Params.Fields:='type_name,Id_type';
  Params.FieldsName:='Назва';
  Params.KeyField:='Id_type';
  Params.ReturnFields:='type_name,Id_type';
  Params.DeleteSQL:='execute procedure INI_EDUC_ORG_TYPE_D(:Id_type);';
  Params.DBHandle:=Integer(DBHandle);

  OutPut:=TRxMemoryData.Create(self);

  if GetUnivSprav(Params,OutPut)
   then
   begin
//     ShowInfo(output);
     value:=output['Id_type'];
     DisplayText:=VarToStr(output['type_name']);
   end;
end;

procedure TfrmEducOrgAdd.qFSC_AdrOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('Adresses');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DBHandle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;
            Post;
        end;

        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Adress'];
            DisplayText := sp.Output['Name'];
        end;
        sp.Free;
    end;
end;

initialization
    RegisterClass(TfrmEducOrgAdd);

end.
