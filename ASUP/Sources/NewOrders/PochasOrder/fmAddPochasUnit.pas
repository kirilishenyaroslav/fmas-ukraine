unit fmAddPochasUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, uFormControl, StdCtrls, Buttons, uFControl,
  uLabeledFControl, uSpravControl, uCharControl, uFloatControl,
  uDateControl, uCommonSP, GlobalSPR, ExtCtrls, ibase, qfTools, AllPeopleUnit,
  DB, FIBDataSet, pFIBDataSet, uSelectForm;

type
  TfmAddPochas = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    KeyList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    Panel1: TPanel;
    Man: TqFSpravControl;
    Smeta: TqFSpravControl;
    KolHours: TqFFloatControl;
    Department: TqFSpravControl;
    PeriodBeg: TqFDateControl;
    PeriodEnd: TqFDateControl;
    Tarif: TqFSpravControl;
    PochasType: TqFSpravControl;
    PochasTypeSelect: TpFIBDataSet;
    PochasTypeSelectID_POCHAS_TYPE: TFIBIntegerField;
    PochasTypeSelectPOCHAS_TYPE_NAME: TFIBStringField;
    Reason: TqFCharControl;
    SmNumberEdit: TEdit;
    PubSprSmet: TpFIBDataSet;
    PubSprSmetID_SMETA: TFIBBCDField;
    PubSprSmetSMETA_TITLE: TFIBStringField;
    PubSprSmetSMETA_KOD: TFIBIntegerField;
    procedure OkActionExecute(Sender: TObject);
    procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure SmetaOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure Prepare;
    procedure TarifOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure CancelActionExecute(Sender: TObject);
    procedure ManOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure PochasTypeOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure SmNumberEditChange(Sender: TObject);
  private
    { Private declarations }
  public
    FMode : TFormMode;
  end;

  type
    TView_FZ_PeopleModal_Sp = function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant; stdcall;

var
  fmAddPochas: TfmAddPochas;
  View_FZ_PeopleModal_Sp : TView_FZ_PeopleModal_Sp;
  PeopleModule : Cardinal;

implementation

uses fmPochasOrderUnit;

{$R *.dfm}

procedure TfmAddPochas.Prepare;
//var
//    y, m, d : Word;
begin
    case FMode of
        fmAdd : begin
            qFAutoLoadFromRegistry(Self, nil);

            Caption := 'Додавання джерела фінансування';

            //DecodeDate(Date, y, m, d);

            //PeriodBeg.Value := EncodeDate(y, 9, 1);
            //PeriodEnd.Value := EncodeDate(y + 1, 5, 31);
        end;

        fmModify : begin
            Caption := 'Редагування джерела фінансування';
        end;

        fmInfo : begin
            Caption := 'Перегляд джерела фінансування';
            Panel1.Enabled := False;            
        end;
    end;
end;

procedure TfmAddPochas.OkActionExecute(Sender: TObject);
begin
    if qFCheckAll(Self) then begin
        ModalResult := mrOk;
        qFAutoSaveIntoRegistry(Self, nil);
    end;
end;

procedure TfmAddPochas.DepartmentOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(fmPochasOrder.LocalDatabase.Handle);
            FieldValues['Actual_Date'] := fmPochasOrder.Date_Order;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Department'];
            DisplayText := sp.Output['Name_Full'];
        end;
        sp.Free;
    end;
end;

procedure TfmAddPochas.SmetaOpenSprav(Sender: TObject; var Value: Variant;
  var DisplayText: String);
var
    id : Variant;
begin
    id := GlobalSPR.GetSmets(Owner, fmPochasOrder.LocalDatabase.Handle, fmPochasOrder.Date_Order, psmSmet);

    if ( VarArrayDimCount(id)>0 ) and ( id[0] <> Null ) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
   end;   
end;

procedure TfmAddPochas.TarifOpenSprav(Sender: TObject; var Value: Variant;
  var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('Asup\SpPochasTarif');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(fmPochasOrder.LocalDatabase.Handle);
            FieldValues['SpDate'] := fmPochasOrder.Date_Order;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Tarif'];
            DisplayText := sp.Output['Tarif'];
            Smeta.Value := sp.Output['KOD_SM'];
            Smeta.DisplayText := sp.Output['SM_TITLE'];
        end;
        sp.Free;
    end;
end;

procedure TfmAddPochas.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmAddPochas.ManOpenSprav(Sender: TObject; var Value: Variant;
  var DisplayText: String);
var
    result : Variant;
begin
    try
        result := AllPeopleUnit.GetMan(Self, fmPochasOrder.LocalDatabase.Handle, False, True);

        if (not VarIsNull(result)) and not (VarType(result) = varNull) and
        not (VarArrayDimCount(result) = 0) then begin
            Value := result[0];
            DisplayText := result[1];

            Reason.Value := 'Заява ' + result[2] + ' ' + Copy(result[3],1,1) +
                            '.' + Copy(result[4],1,1) + '.'; 
        end;

    except on e:Exception do begin
            qFErrorDialog('Неможливо завантажити довідник фізичних осіб! Виникла помилка: "' +
                        e.Message + '"');
            exit;
        end;
    end;
end;

procedure TfmAddPochas.PochasTypeOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    if qSelect(PochasTypeSelect, 'Виберіть тип погодинной праці!') then begin
        Value := PochasTypeSelectID_POCHAS_TYPE.Value;
        DisplayText := PochasTypeSelectPOCHAS_TYPE_NAME.Value;        
    end;
end;

procedure TfmAddPochas.SmNumberEditChange(Sender: TObject);
begin
    if SmNumberEdit.Text = '' then
        exit;

    try
        PubSprSmet.Close;
        PubSprSmet.ParamByName('smeta_kod').AsInteger := StrToInt(SmNumberEdit.Text);
        PubSprSmet.Open;
        PubSprSmet.FetchAll;

        if PubSprSmet.RecordCount = 1 then begin
            Smeta.Value := PubSprSmetID_SMETA.Value;
            Smeta.DisplayText := PubSprSmetSMETA_KOD.AsString +
                                 '. ' + PubSprSmetSMETA_TITLE.Value;
        end;
    except
    end;
end;

end.
