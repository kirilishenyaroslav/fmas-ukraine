unit uHolidayRemoveOrder;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, RxMemDS, uCommonSp, uFormControl, Buttons, Grids, Spin,
    StdCtrls, DBGrids, ExtCtrls, Mask,  ComCtrls,
    uFControl, uLabeledFControl, uSpravControl, uDateControl, uEnumControl,
    uCharControl, uIntControl, uBoolControl, FIBDatabase, pFIBDatabase,
    FIBDataSet, pFIBDataSet, ibase, uFloatControl,
    ActnList, cxStyles, uActionControl, uLogicCheck, uSimpleCheck, qFTools,
    uHolidayRemoveOrderForm;


type
    THolidayRemoveOrder = class(TSprav)
    private
        IsConnected : Boolean;
        Form : TfmHolidayRemoveOrder;
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
    Result := THolidayRemoveOrder.Create;
end;

constructor THolidayRemoveOrder.Create;
begin
    inherited Create;

    // создание входных/выходных полей
    Input.FieldDefs.Add('Id_Order_Type', ftInteger);
    Input.FieldDefs.Add('Id_Order', ftInteger);
    Input.FieldDefs.Add('SpMode', ftInteger);
    Input.FieldDefs.Add('Date_Order', ftDate);
    Input.FieldDefs.Add('Num_Item', ftInteger);
    Input.FieldDefs.Add('Sub_Item', ftInteger);
    Input.FieldDefs.Add('Id_Order_Group', ftInteger);
    Input.FieldDefs.Add('Intro', ftString, 4096);

    Output.FieldDefs.Add('New_Id_Order', ftInteger);
end;

destructor THolidayRemoveOrder.Destroy;
begin
    inherited Destroy;
end;

procedure THolidayRemoveOrder.Show;
var
    hnd : Integer;
    Mode : TFormMode;
begin
    Form := TfmHolidayRemoveOrder.Create(Application.MainForm);

    hnd := Input['DBHANDLE'];
    Form.LocalDatabase.Handle := TISC_DB_HANDLE(hnd);

    case Input['SpMode'] of
        1: Mode := fmAdd;
        2: Mode := fmModify;
        3: Mode := fmInfo;
    end;

    fmHolidayRemoveOrder := Form;

    Form.IdOrder.Value := Input['Id_Order'];
    Form.DateOrder.Value := Input['Date_Order'];
    Form.IdOrderType.Value := Input['Id_Order_Type'];
    Form.NumItem.Value  := Input['Num_Item'];
    Form.SubItem.Value := Input['Sub_Item'];
    Form.IdOrderGroup.Value := Input['Id_Order_Group'];
    Form.Intro.Value := Input['Intro'];

    Form.FormControl.Prepare(Form.LocalDatabase, Mode, Form.IdOrder.Value, 0);

    Form.ShowModal;

    if not VarIsNull(Form.IdOrder.Value) then begin
        Output.Open;
        Output.Append;
        Output['New_Id_Order'] := Form.IdOrder.Value;
        Output.Post;
    end;

    Form.Free;
end;

end.
