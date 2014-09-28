unit uSpMovingType;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, RxMemDS, uCommonSp, uFormControl, Buttons, Grids, Spin,
    StdCtrls, SpComboBox, DBGrids, ExtCtrls, Mask, CheckEditUnit, ComCtrls,
    uFControl, uLabeledFControl, uSpravControl, uDateControl, uEnumControl,
    uCharControl, uIntControl, uBoolControl, FIBDatabase, pFIBDatabase,
    FIBDataSet, pFIBDataSet, ibase, uSelectForm, uFloatControl,
    ActnList, cxStyles, cxCustomData, cxGraphics, cxFilter,
    cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
    cxControls, cxGridCustomView, cxGrid, uActionControl, uLogicCheck,
    uSimpleCheck, qFTools, fmMovingType;

type
    TSpMovingType = class(TSprav)
    private
        IsConnected: Boolean;
        Form: TSpMovingTypeForm;
    public
        constructor Create;
        destructor Destroy; override;
        procedure Show; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;


implementation

function CreateSprav: TSprav;
begin
    Result := TSpMovingType.Create;
end;

constructor TSpMovingType.Create;
begin
    inherited Create;

    // создание входных/выходных полей
    Input.FieldDefs.Add('IdType', ftInteger);
    Input.Open;

    Output.FieldDefs.Add('Id_Moving_Type', ftInteger);
    Output.FieldDefs.Add('Name_Moving_Type', ftString, 255);
end;

destructor TSpMovingType.Destroy;
begin
    inherited Destroy;
end;

procedure TSpMovingType.Show;
var
    hnd: Integer;
    Mode: TFormMode;
begin
    Form := TSpMovingTypeForm.Create(Application.MainForm, Input['IdType']);

    Form.LocalReadTransaction.Active := False;
    Form.LocalWriteTransaction.Active := False;

    if Form.LocalDatabase.Connected then Form.LocalDatabase.Close;

    hnd := Input['DBHANDLE'];
    Form.LocalDatabase.Handle := TISC_DB_HANDLE(hnd);

    SpMovingTypeForm := Form;

    Form.InputQuery.Close;
    Form.InputQuery.ParamByName('IS_FIRST').AsInteger := Input['IdType'];
    Form.InputQuery.Open;

    if Input['IdType'] = 1 then
        Form.Caption := Form.Caption + ' (прийом на роботу)';
        
    if Input['IdType'] = 2 then
        Form.Caption := Form.Caption + ' (перевод на інше місце роботи)';

    if Form.ShowModal = mrOk then begin
        Output.Open;
        Output.Append;
        Output['Id_Moving_Type'] := Form.InputQueryID_MOVING_TYPE.Value;
        Output['Name_Moving_Type'] := Form.InputQueryNAME_MOVING_TYPE.Value;
        Output.Post;
    end;

    Form.Free;
end;


end.

